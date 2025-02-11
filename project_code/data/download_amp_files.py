import os
import requests
from bs4 import BeautifulSoup
from tqdm import tqdm
from datetime import datetime
from requests.adapters import HTTPAdapter
from concurrent.futures import ThreadPoolExecutor, as_completed

AMP_URLS = (
    'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries',
    'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web',
)


def download_file(save_path, species_name, file_name, session, headers=None):
    """
    Downloads a file from the remote URL. If headers (such as If-Modified-Since)
    are provided, the server may return a 304 Not Modified response.
    """
    url = f"{AMP_URLS[0]}/{species_name}/{file_name}"
    try:
        response = session.get(url, headers=headers, stream=True)
        # If the file hasn't been modified, skip writing it.
        if response.status_code == 304:
            return
        response.raise_for_status()

        with open(save_path, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
    except requests.RequestException as e:
        tqdm.write(f"Error downloading {file_name} for species {species_name} at {url}: {e}")


def download_file_from_amp(species_name, file_name, species_folder, session, overwrite=False, check_update=False):
    """
    Downloads a file if it doesn't exist or, if check_update is True, if the remote file is newer.
    A conditional GET (via If-Modified-Since) is used to combine update checking and downloading.
    """
    save_path = os.path.join(species_folder, file_name)
    # Download if the file does not exist or if overwriting is enabled.
    if overwrite or not os.path.exists(save_path):
        download_file(save_path, species_name, file_name, session)
        return

    # If check_update is True, issue a conditional GET.
    if check_update:
        local_modified_time = datetime.fromtimestamp(os.path.getmtime(save_path))
        headers = {
            "If-Modified-Since": local_modified_time.strftime('%a, %d %b %Y %H:%M:%S GMT')
        }
        download_file(save_path, species_name, file_name, session, headers=headers)


def get_file_links(url, include_dirs=True, session=None):
    """
    Retrieves file links from the directory listing.
    """
    if session is None:
        session = requests.Session()
    response = session.get(url)
    response.raise_for_status()

    soup = BeautifulSoup(response.text, 'html.parser')
    links = []
    for a_tag in soup.find_all('a'):
        href = a_tag.get('href')
        if not href:
            continue
        if href.startswith('?') or href.startswith('/'):
            continue
        if not include_dirs and href.endswith('/'):
            continue
        # Exclude links starting with 'results'
        if not href.startswith('results'):
            links.append(href)
    return links


def download_species(species_name, save_folder, overwrite, check_update, session):
    """
    Downloads all files for a single species. Creates the species folder if necessary,
    retrieves file links, and downloads each file.
    """
    species_folder = os.path.join(save_folder, species_name)
    if not os.path.exists(species_folder):
        os.makedirs(species_folder)

    species_dir_url = f"{AMP_URLS[0]}/{species_name}/"
    files_to_download = get_file_links(species_dir_url, include_dirs=False, session=session)
    for file in files_to_download:
        download_file_from_amp(species_name, file, species_folder, session, overwrite, check_update)


def download_amp_database(save_folder, species_list, overwrite=False, check_update=False, max_workers=8):
    """
    Downloads files for all species in the species_list using parallel downloads.
    Each species is handled in a separate thread.
    """
    # Create a persistent session with an HTTPAdapter for improved connection pooling.
    session = requests.Session()
    adapter = HTTPAdapter(pool_connections=50, pool_maxsize=50, max_retries=3)
    session.mount('https://', adapter)

    # Use ThreadPoolExecutor to process species concurrently.
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        # Submit a task for each species.
        future_to_species = {
            executor.submit(download_species, species, save_folder, overwrite, check_update, session): species
            for species in species_list
        }

        # Use tqdm to monitor progress.
        for future in tqdm(as_completed(future_to_species), total=len(future_to_species), desc="Downloading species"):
            species = future_to_species[future]
            try:
                future.result()
            except Exception as e:
                tqdm.write(f"Error processing species {species}: {e}")


if __name__ == '__main__':
    filepaths = {}
    with open('../../data/filepaths.csv', 'r') as f:
        for line in f:
            name, path = line.rstrip('\n').split(',')
            filepaths[name] = os.path.abspath(path)

    species_list = get_file_links(f"{AMP_URLS[0]}", include_dirs=True)
    # start_species = 'Hydrocynus_vittatus' + '/'
    # species_list = species_list[species_list.index(start_species):]
    # print(species_list)
    # species_list = [
    #     'Siphateles_bicolor',
    #     'Macquaria_novemaculeata',
    #     'Prionotus_albirostris',
    #     'Decapterus_macrosoma',
    #     'Etropus_crossotus',
    #     'Myripristis_murdjan',
    #     'Cerastoderma_edule',
    #     'Acipenser_stellatus',
    #     'Mormyrus_kannume',
    #     'Mysis_mixta',
    # ]

    download_amp_database(filepaths['species_folder'], species_list, overwrite=False, check_update=True)

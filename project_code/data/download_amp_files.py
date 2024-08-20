import requests
import os
from bs4 import BeautifulSoup
from tqdm import tqdm

AMP_URLS = ('https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries',
            'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web',)


def check_url_exists(url):
    try:
        response = requests.head(url)
        return response.status_code == 200
    except requests.RequestException:
        return False


def download_file_from_amp(species_name, file_name, species_folder, overwrite=False):
    save_path = os.path.join(species_folder, file_name)
    if not overwrite and os.path.exists(save_path):
        return
    url = f"{AMP_URLS[0]}/{species_name}/{file_name}"
    if check_url_exists(url):
        try:
            # Get the response from the URL
            response = requests.get(url, stream=True)
            response.raise_for_status()  # Check for request errors

            # Write the content to a file
            with open(save_path, 'wb') as file:
                for chunk in response.iter_content(chunk_size=8192):
                    file.write(chunk)
        except requests.RequestException as e:
            print(f'Error downloading {file_name} file for species {species_name} at url {url} - {e}.')


def get_file_links(url, include_dirs=True):
    """Retrieve file links from the directory listing."""
    response = requests.get(url)
    response.raise_for_status()

    soup = BeautifulSoup(response.text, 'html.parser')
    links = []

    # Find all anchor tags
    for a_tag in soup.find_all('a'):
        href = a_tag.get('href')
        if not href:
            continue
        # Exclude parent directory
        if href.startswith('?') or href.startswith('/'):
            continue
        elif not include_dirs and href.endswith('/'):
            continue
        elif not href.startswith('results'):
            links.append(href)

    return links


def download_amp_database(save_folder, species_list, overwrite=False):
    for species_name in tqdm(species_list, desc='Downloading species from AmP'):
        species_folder = os.path.join(save_folder, species_name)
        # Create folder if it does not exist
        if not os.path.exists(species_folder):
            os.makedirs(species_folder)

        species_dir_url = f"{AMP_URLS[0]}/{species_name}/"

        files_to_download = get_file_links(species_dir_url, include_dirs=False)
        for file in files_to_download:
            download_file_from_amp(species_name, file, species_folder, overwrite)


if __name__ == '__main__':
    filepaths = {}
    with open('../../data/filepaths.csv', 'r') as f:
        for line in f:
            name, path = line.rstrip('\n').split(',')
            filepaths[name] = os.path.abspath(path)

    species_list = get_file_links(f"{AMP_URLS[0]}", include_dirs=True)
    start_species = 'Hydrocynus_vittatus' + '/'
    species_list = species_list[species_list.index(start_species):]
    print(species_list)
    # species_list = ['Echinops_telfairi']
    download_amp_database(filepaths['species_folder'], species_list, overwrite=False)

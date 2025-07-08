function [data, auxData, metaData, txtData, weights] = mydata_Gerygone_igata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Acanthizidae';
metaData.species    = 'Gerygone_igata'; 
metaData.species_en = 'Grey warbler'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'V0'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2018 10 03];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Joany Marino'};
metaData.date_mod_1     = [2021 03 18];
metaData.email_mod_1    = {'joanyvalentina@gmail.com'};
metaData.address_mod_1  = {'Memorial University of Newfoundland, A1B 3X9, Canada'};

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 19.5;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Gill1982';   
  temp.ab = C2K(36.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'The incubation phase is between 17 to 21 days; temperature is guessed';
data.tx = 17.2;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Gill1982';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'The nestling phase is between 15.0 to 18.5 days';
data.tp = 51.6;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(39.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4.9*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Gill1982';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.V0 = 1.8452;   units.V0 = 'ml';   label.V0 = 'Volume at start of development';     bibkey.V0 = 'Gill1982';
  comment.V0 = 'Calculated with the formula for an oblate spheroid using the length and breath of the egg';  
  
data.Ww0  = 1.49;    units.Ww0  = 'g';  label.Ww0  = 'egg wet weight';        bibkey.Ww0  = 'Gill1982';
    temp.Ww0 = C2K(39.5);  units.temp.Ww0 = 'K'; label.temp.Ww0 = 'temperature';  
data.Wwb = 1.18;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Gill1982';
  temp.Wwb = C2K(39.5);  units.temp.Wwb = 'K'; label.temp.Wwb = 'temperature'; 
% data.Wwx = 6.45;    units.Wwx = 'g';   label.Wwx = 'wet weight at fledging'; bibkey.Wwx = 'Gill1982';
%   comment.Wwx = 'Average value of nestlings between 15 and 17 days old';
data.Wwi = 7.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Gill1982';
  temp.Wwi = C2K(39.5);  units.temp.Wwi = 'K'; label.temp.Wwi = 'temperature'; 
  comment.Wwi = ['Gill1982 and Gill1983 report average maximum mass = of 7.8 g (6.7 to 8.9 g), '...
  'but average ultimate mass at fledging of 6.45 g (5.7 to 7.2 g)'];

data.Ri  = (3.93*2)/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 5 eggs per clutch, 2 clutches per year with an average of 3.93 eggs each';
 
% uni-variate data
% time-weight
data.tW = [ ...
0	1.216
1	1.421
2	1.902
3	2.504
4	3.088
5	3.801
6	4.686
7	5.374
8	6.095
9	6.559
10	6.988
11	7.4
12	7.614
13	7.708
14	7.69
15	7.603
16	7.481
17	7.187];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', '2 nestlings'};  
temp.tW   = C2K(39.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gill1982';
comment.tW = 'Growth data for broods of two nestlings (assumed to have f = 0.9)';
%
data.tW1 = [ ...
0	1.208
1	1.542
2	2.109
3	2.711
4	3.398
5	4.103
6	4.704
7	5.495
8	5.889
9	6.387
10	6.782
11	7.108
12	7.073
13	7.295
14	7.191
15	7.001
16	7.086
17	7.102];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', '3 nestlings'};  
temp.tW1   = C2K(39.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Gill1982';
comment.tW1 = 'Growth data for broods of three nestlings (assumed to have f = 0.85)';
%
data.tW2 = [ ...
0	1.199
1	1.611
2	2.109
3	2.71
4	3.398
5	4.085
6	4.79
7	5.374
8	6.078
9	6.49
10	6.885
11	7.091
12	7.202
13	7.192
14	7.294
15	7.104
16	6.879
17	6.792];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '4 nestlings'};  
temp.tW2   = C2K(39.5);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Gill1982';
comment.tW2 = 'Growth data for broods of four nestlings (assumed to have f = 0.8)';

data.tW3 = [ ...
0.007 0.996
2.037 2.177
3.053 2.777
4.021 3.595
5.036 4.195
6.002 4.676
7.016 5.118
7.935 5.619
8.898 5.724];
units.tW3  = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'parasitized by Shining Cuckoo'};  
temp.tW3   = C2K(39.5);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Gill1983';
comment.tW3 = 'Growth data for nests parasitized by the Shining Cuckoo Chrysococcyx lucidus (assumed to have f = 0.8)';

%% set weights for all real data
weights = setweights(data, []);
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1','tW2','tW3'}; subtitle1 = {'Data for different feeding levels according to brood size'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed, and lower just after hatch';
D2 = 'mod_1: The same guess for body temperature is used throughout the data';     
D3 = 'mod_1: Change ab from 17 to 19.5, which is the average value given in Gill1982';     
D4 = 'mod_1: Change tx from 17 to 12.2, which is the average value given in Gill1982';     
D5 = 'mod_1: Change am from 3285 to 4.9*365, as reported Gill1982';     
D6 = 'mod_1: Add data for L0 and Li (Gill1982), but these are ignored because of inconsistency with weights';     
D7 = 'mod_1: Add data for V0, Ww0, and Wwx from Gill1982';     
D8 = 'mod_1: Change Wwb from 1 to 1.18, which is the average value given in Gill1982';     
D9 = 'mod_1: Change Wwi from 6.5 to 6.45, which is the average value given in Gill1982';     
D10 = 'mod_1: Change Ri from 0.0137 to (3.93*2)/365, which is the average value given in Gill1982';     
D11 = ['mod_1: Update tW data according to values given in Gill1982 and adjust the functional response according to the brood size.', ...
       'The previous data was only from Gill1983, which refered to the growth of a nestling Grey Warbler sharing a nest with a Shining Cuckoo that shared a nest.', ...
       'The data from Gill1983 (now tW3) shows the effect of interspecific competition for food before the parasite evicts the host nestling.', ...
       'This parasitic competition data seems to follow the same trend as the growth data for a brood of four nestlings (tW2) in Gill1982;', ...
       'hence the same value for the functional response is assumed.', ...
       'Gill1982 reports that the weight of nestlings from broods of two is significantly heavier than those from broods of three and four,', ...
       'thus a higher functional response is assumed for the tW data.', ...
       'However, broods of three and four do not differ among themselves; hence a similar functional response value is assumed for both data (tW1 and tw2)'];     
D12 = 'mod_1: Update weights to improve fit';
D13 = 'mod_1: Add reference entries (Gill1982 and AttiThie2018) and facts';
D14 = 'Curator: In view of max weight larger than that at fledging, body temp is assumed to be constant, but food intake reduced prior to fledging';
D15 = 'mod_2: Puberty is assumed to coincide with fledging with a waiting time to first brood';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4,'D5',D5, 'D6',D6, 'D7',D7, 'D8',D8, 'D9',D9, 'D10',D10, 'D11',D11, 'D12',D12, 'D13',D13, 'D14',D14, 'D15',D15);

%% Facts
F1 = 'In New Zealand, the Grey Warbler, G. igata is the only host for a local subspecies of the Shining Bronze-cuckoo, Chalcites lucidus layardi.';
metaData.bibkey.F1 = {'Gill1982', 'Gill1983'}; 
F2 = ['Grey Warblers raise two broods per year, during a breeding season that lasts six months long (from first nest building to last fledging).', ...
      'First clutches of the host escaped parasitism because they were laid before most Bronze-cuckoos arrived', ...
      'Parasitized clutches received one cuckoo egg which replaced a host’s egg'];
metaData.bibkey.F2 = {'Gill1982', 'Gill1983'}; 
F3 = 'In New Caledonia, the Shining Bronze-cuckoo parasitizes the related Fan-tailed Gerygone, G. flavolateralis';
metaData.bibkey.F3 = 'AttiThie2018'; 
metaData.facts = struct('F1', F1, 'F2', F2, 'F3', F3);

%% Links
metaData.links.id_CoL = '3FXNB'; % Cat of Life
metaData.links.id_ITIS = '560257'; % ITIS
metaData.links.id_EoL = '45518116'; % Ency of Life
metaData.links.id_Wiki = 'Gerygone_igata'; % Wikipedia
metaData.links.id_ADW = 'Gerygone_igata'; % ADW
metaData.links.id_Taxo = '85384'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C3D7DC15FA86C16E'; % avibase
metaData.links.id_birdlife = 'grey-gerygone-gerygone-igata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerygone_igata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gill1982'; type = 'Article'; bib = [ ... 
'author = {B. J. Gill}, ' ... 
'year = {1982}, ' ...
'title = {Breeding of the grey warbler \emph{Gerygone igata} at {K}aikoura, {N}ew {Z}ealand}, ' ...
'journal = {Ibis}, ' ...
'volume = {124}, ' ...
'number = {2}, ' ...
'pages = {123--147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gill1983'; type = 'Article'; bib = [ ... 
'author = {B. J. Gill}, ' ... 
'doi = {10.1111/j.1474-919X.1983.tb03082.x}, ' ...
'year = {1983}, ' ...
'title = {Brood-parasitism by the Shining Cuckoo \emph{Chrysococcyx lucidus} at {K}aikoura, {N}ew {Z}ealand}, ' ...
'journal = {Ibis}, ' ...
'volume = {125}, ' ...
'number = {1}, ' ...
'pages = {40--55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AttiThie2018'; type = 'Article'; bib = [ ... 
'author = {A. Attisano and F. Thiel and N. Sato and Y. Okahisa and D. Bolopo and K. D. Tanaka and R. Kuehn and R. Gula1 and K. Ueda and J. Theuerkauf}, ' ... 
'doi = {10.1007/s10336-018-1592-6}, ' ...
'year = {2018}, ' ...
'title = {Breeding biology of the Fan tailed Gerygone \emph{Gerygone flavolateralis} in relation to parasitism by the {S}hining {B}ronze cuckoo \emph{Chalcites lucidus}}, ' ...
'journal = {Journal of Ornithology}']; % electronic doc
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
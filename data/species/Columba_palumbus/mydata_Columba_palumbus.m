function [data, auxData, metaData, txtData, weights] = mydata_Columba_palumbus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Columba_palumbus'; 
metaData.species_en = 'Common wood pigeon'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs', 'bxCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 08 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 11 21];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 06 25];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.author_mod_4   = {'Carlo Romoli', 'Liubov Zakharova'};
metaData.email_mod_4    = {'carlo.romoli@ibacon.com', 'liubov.zakharova@ibacon.com'}; 
metaData.date_mod_4     = [2024 02 19];
metaData.address_mod_4  = {'ibacon GmbH, Germany'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 02 20];

%% set data
% zero-variate data

data.ab = 18;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(37.85); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17 to 19 d';
data.tx = 33;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '33 to 34 d';
data.tp = 99;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.7*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 14;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MurtWest1974';
data.Wwi = 500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MurtWest1974';
  comment.Wwi = 'Wiki: 300 to 615 g ';
data.Wwx = 270;   units.Wwx = 'g';   label.Wwx = 'wet weight at fledging';  bibkey.Wwx = 'MurtWest1974';
  comment.Wwx = '0.54 of adult weight';

data.Ri  = 2*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'FarmWeb';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch, usually 2 clutches per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       14
1.275	14.050
1.915	30.246
1.990	19.363
2.268	19.316
2.630	33.521
3.185	33.426
3.983	44.840
4.025	54.344
4.222	48.875
4.904	71.857
4.906	78.650
4.958	116.006
5.022	67.082
5.027	83.385
5.300	69.752
5.302	74.507
5.705	95.498
5.945	99.534
5.946	104.289
5.948	111.082
5.979	84.582
5.990	119.227
6.300	95.397
6.303	104.228
6.946	129.934
6.981	113.624
7.626	144.765
8.070	169.825
8.221	143.984
8.940	159.487
8.965	114.646
9.180	164.881
9.979	184.446
9.990	219.091
10.856	195.847
10.863	218.943
11.863	243.909
11.865	249.344
11.897	224.882
11.899	229.637
11.901	237.789
11.934	216.044
12.211	215.317
12.870	290.613
12.899	255.282
13.919	220.462
15.518	255.517
15.800	269.735
16.074	256.102
16.707	251.918
18.745	296.409
18.778	274.664
18.854	265.820];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'MurtWest1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'mod_1: initially varying food allowed in tW data predictions';
D3 = 'mod_2: v is reduced';
D4 = 'mod_3: Puberty is assumed to coincide with fledging with a waiting time to first brood';
D5 = 'mod_4: Updated data Wwi, Ri and added Wwx';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = 'XBGG'; % Cat of Life
metaData.links.id_ITIS = '177103'; % ITIS
metaData.links.id_EoL = '45513599'; % Ency of Life
metaData.links.id_Wiki = 'Columba_palumbus'; % Wikipedia
metaData.links.id_ADW = 'Columba_palumbus'; % ADW
metaData.links.id_Taxo = '53978'; % Taxonomicon
metaData.links.id_WoRMS = '558546'; % WoRMS
metaData.links.id_avibase = '760F307A30689D66'; % avibase
metaData.links.id_birdlife = 'common-woodpigeon-columba-palumbus'; % birdlife
metaData.links.id_AnAge = 'Columba_palumbus'; % AnAge

%% References
bibkey = 'FarmWeb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.vinehousefarm.co.uk/birds/wood-pigeon}}';

metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Columba_palumbus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Columba_palumbus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MurtWest1974'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1474-919X.1974.tb00223.x}, ' ...
'title = {FACTORS AFFECTING EGG-WEIGHT, BODY-WEIGHT AND MOULT OF THE WOODPIGEON \emph{C. palumbus}}, ' ...
'journal = {Ibis}, ' ...
'year = {1974}, ' ...
'author = {R. K. Murton and N. J. Westwood and A. J. Isaacson}, ' ...
'volume = {116}, ' ...
'pages = {52--73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


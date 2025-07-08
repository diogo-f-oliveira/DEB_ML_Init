function [data, auxData, metaData, txtData, weights] = mydata_Apodemus_speciosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Apodemus_speciosus'; 
metaData.species_en = 'Large Japanese field mouse'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 20;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'OhMori1998';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'OhMori1998';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 73;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'OhMori1998';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 810;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'OhMori1998';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'OhMori1998';
data.Wwx = 15.5;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'OhMori1998';
data.Wwi = 33;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'OhMori1998';
data.Wwim = 43;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'OhMori1998';

data.Ri  = 4.3*12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'OhMori1998';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.3 pups per litter; 1 litters per month';
  
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.000	2.509
1.983	2.975
3.824	3.627
5.869	4.371
8.097	5.952
9.712	7.254
11.728	9.021
13.768	9.951
15.775	11.997
17.831	12.370
19.819	15.066
24.701	17.764
29.781	20.740
34.671	23.159
39.789	24.835
44.698	26.603
49.816	28.279
54.738	29.582
59.870	30.793
69.749	32.192
79.639	33.220
89.754	33.597
99.904	32.765
109.604	33.235
119.308	33.519
129.644	33.431
139.558	33.622
149.475	33.720
159.394	33.725
169.507	34.195
179.636	34.108];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(37.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'OhMori1998';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.754	2.603
1.981	3.068
4.031	3.627
6.073	4.464
7.885	6.138
9.508	7.161
12.147	8.835
14.385	10.045
15.166	11.625
17.616	12.648
19.830	14.694
24.280	18.042
29.341	21.669
34.832	24.739
39.693	28.180
44.794	30.413
49.708	31.996
54.410	33.764
59.722	35.904
69.781	38.233
79.869	39.539
89.751	40.846
99.665	41.037
109.563	41.785
119.448	42.998
129.802	42.260
139.700	43.009
149.818	43.293
159.762	42.462
169.686	42.281
179.802	42.658];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(37.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'OhMori1998';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 10 * weights.tW_f;
weights.tW_m = 10 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'FRJH'; % Cat of Life
metaData.links.id_ITIS = '585142'; % ITIS
metaData.links.id_EoL = '1178949'; % Ency of Life
metaData.links.id_Wiki = 'Apodemus_speciosus'; % Wikipedia
metaData.links.id_ADW = 'Apodemus_speciosus'; % ADW
metaData.links.id_Taxo = '62924'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001220'; % MSW3
metaData.links.id_AnAge = 'Apodemus_speciosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apodemus_speciosus}}';
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
bibkey = 'OhMori1998'; type = 'Article'; bib = [ ... 
'author = {H. S. Oh and T. Mori}, ' ... 
'year = {1998}, ' ...
'title = {Growth, Development and Reproduction in captive of the Large {J}apanese Field Mouse, \emph{Apodemus speciosus} ({R}odentia, {M}uridae)}, ' ...
'journal = {J. Fac. Agr., Kyushu Univ.}, ' ...
'volume = {43}, ' ...
'pages = {397--408}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Apodemus_speciosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


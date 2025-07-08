function [data, auxData, metaData, txtData, weights] = mydata_Aethomys_kaiseri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Aethomys_kaiseri'; 
metaData.species_en = 'Kaiser''s rock rat'; 

metaData.ecoCode.climate = {'Aw', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Ww5'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 18]; 

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Chee1981';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 26;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Chee1981';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 6.1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Chee1981';
data.Wwx = 47.8;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'Chee1981';
data.Wwi = 118;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Chee1981';

data.Ri  = 2.6*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Chee1981';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 or 3 pups per litter; 3 litter per yr';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
1.158	6.124
2.121	6.523
3.249	7.910
4.054	8.704
5.029	11.077
6.079	12.661
7.049	14.245
8.014	15.039
9.221	16.229
9.948	17.417
11.158	19.002
12.126	20.191
13.093	21.380
14.302	22.768
15.273	24.549
16.319	25.541
17.368	26.927
18.339	28.709
19.232	30.884
20.123	32.665
21.342	35.631
22.234	37.609
23.292	40.575
24.430	43.344
25.324	45.717
26.460	48.288
27.353	50.266
28.088	52.638
29.467	55.803
30.438	57.584
31.333	59.957
32.224	61.738
33.275	63.519
34.169	65.695
35.390	69.056
36.448	72.022
37.343	74.394
38.319	76.965
39.372	79.141
40.347	81.514];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Chee1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '65CM4'; % Cat of Life
metaData.links.id_ITIS = '585117'; % ITIS
metaData.links.id_EoL = '1178644'; % Ency of Life
metaData.links.id_Wiki = 'Aethomys_kaiseri'; % Wikipedia
metaData.links.id_ADW = 'Aethomys_kaiseri'; % ADW
metaData.links.id_Taxo = '89246'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001194'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aethomys_kaiseri}}';
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
bibkey = 'Chee1981'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1981.45.4.483}, ' ...
'author = {Cheeseman, G. L. }, ' ... 
'year = {1981}, ' ...
'title = {Observations on the reproductive biology and early post-natal development of two species of {A}frican rodents}, ' ...
'journal = {Mammalia}, ' ...
'volume = {45}, ' ...
'number = {4}, ' ...
'pages = {484-491}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


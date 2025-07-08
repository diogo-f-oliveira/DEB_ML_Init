function [data, auxData, metaData, txtData, weights] = mydata_Mus_musculoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Mus_musculoides'; 
metaData.species_en = 'Temminck''s mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

data.tg = 24;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 26;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'AnAge';

data.Ri  = 4*4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 pups per litter; 4 litters per yr assumed';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0.000	0.790
0.346	1.074
0.950	1.029
1.540	1.133
2.851	1.551
2.858	1.476
2.869	1.357
5.526	1.804
5.670	1.864
5.986	1.699
8.626	2.326
8.637	2.206
9.063	2.460
9.108	1.982
11.626	2.310
12.056	2.519
12.185	2.743
17.726	2.816
17.977	3.339
18.155	3.040
18.203	2.533
23.975	3.337
23.996	3.113
24.178	2.770
24.390	3.710
29.883	4.291
29.957	3.500
30.084	3.754
30.210	4.007
30.426	3.306
35.784	3.723
35.970	4.946
36.282	3.215
36.299	4.633
39.033	4.259
39.403	3.513
42.112	5.005
42.346	4.109
42.392	5.214
43.167	4.945
50.603	5.600
51.330	5.838
51.400	5.092
53.618	5.420
58.840	4.105
59.211	4.941
59.312	3.866
59.410	4.419
59.797	3.493
61.257	5.508
61.722	5.343
84.824	5.234
85.078	5.726
85.085	5.651
99.656	5.365
99.991	6.588
128.274	5.582
128.368	6.179
128.751	5.298];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Anad1976';

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
metaData.links.id_CoL = '7VW9Z'; % Cat of Life
metaData.links.id_ITIS = '585394'; % ITIS
metaData.links.id_EoL = '1179242'; % Ency of Life
metaData.links.id_Wiki = 'Mus_musculoides'; % Wikipedia
metaData.links.id_ADW = 'Mus_musculoides'; % ADW
metaData.links.id_Taxo = '63057'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001561'; % MSW3
metaData.links.id_AnAge = 'Mus_musculoides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mus_musculoides}}';
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
bibkey = 'Anad1976'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1976.40.2.175}, ' ...
'author = {Anadu, P. A.}, ' ... 
'year = {1976}, ' ...
'title = {OBSERVATIONS ON REPRODUCTION AND DEVELOPMENT IN \emph{Mus musculoides} ({R}ODENTIA, {M}URIDAE)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {40}, ' ...
'number = {2}, ' ...
'pages = {175-186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Mus_musculoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


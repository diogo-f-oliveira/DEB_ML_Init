function [data, auxData, metaData, txtData, weights] = mydata_Capreolus_capreolus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Capreolus_capreolus'; 
metaData.species_en = 'Roe deer'; 
metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(38.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 11]; 

%% set data
% zero-variate data

data.tg = 153;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 89;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 413;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(38.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 655;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';   
  temp.tpm = C2K(38.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 17.5*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 1200;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PortDunc2000';
data.Wwx = 8693;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 25e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '15 till 35 kg';
  
data.Ri  = 1.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.6 calves per litter, 1 litter per yr';

% uni-variate data
% time-weight data
data.tW = [ % time since birth (d), weight (kg)
1.639	1.778
1.967	1.738
2.951	1.778
2.951	2.263
3.934	1.981
4.262	2.304
5.902	2.143
6.557	2.506
6.557	2.789
6.885	2.143
8.197	3.396
8.525	2.184
9.180	3.194
9.508	2.265
9.836	2.184
11.148	3.679
11.803	2.629
12.459	2.992
13.443	2.710
13.443	3.275
13.443	3.599
13.770	2.750
14.426	2.952
16.393	3.195
17.049	3.115
17.705	4.327
18.689	3.115
19.672	3.358
21.311	3.358
21.967	5.499
22.951	3.601
22.951	4.085
23.607	4.490
24.918	3.641
26.230	3.965
26.557	5.824
27.213	5.379
28.197	3.763
29.180	5.218
29.508	4.168
29.508	5.380
30.164	4.370
31.475	4.451
32.459	4.532
33.443	6.795
33.770	6.431
34.754	4.653
34.754	5.462
36.066	4.815
37.377	5.139
38.361	5.381
38.689	4.493
39.344	7.523
40.328	4.816
40.328	5.220
42.951	5.746
47.213	6.353
50.820	7.445
56.066	8.213
58.033	9.870
58.361	7.891
64.590	7.811
67.869	9.347
67.869	9.549
67.869	10.276
68.525	10.478
70.492	9.267
71.475	8.378
80.656	10.804
86.557	12.462
92.787	10.241
94.754	11.898
96.066	11.777
97.705	12.545
100.000	10.202
105.902	13.112
107.213	14.486
114.426	12.023
115.082	14.852
117.049	13.519
119.016	15.337
121.311	12.429
124.918	14.086
125.574	14.813
128.197	16.632
134.426	13.280
138.361	16.028
139.344	13.038
139.344	15.826
143.934	17.322
151.475	14.132
154.098	16.395
156.393	16.638
156.721	17.890
162.951	16.356
163.279	14.821
165.902	16.720
171.803	18.580]; 
units.tW  = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(38.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PortDunc2000';

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

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = 'QSF3'; % Cat of Life
metaData.links.id_ITIS = '625063'; % ITIS
metaData.links.id_EoL = '308479'; % Ency of Life
metaData.links.id_Wiki = 'Capreolus_capreolus'; % Wikipedia
metaData.links.id_ADW = 'Capreolus_capreolus'; % ADW
metaData.links.id_Taxo = '68090'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200217'; % MSW3
metaData.links.id_AnAge = 'Capreolus_capreolus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Capreolus_capreolus}}';
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
bibkey = 'PortDunc2000'; type = 'article'; bib = [ ... 
'author = {C. Portier and P. Duncan and J.-M. Gaillard and N. Guillon and A. J. Semp\''{e}r\''{e}}, ' ... 
'year = {2000}, ' ...
'title = {Growth of {E}uropean roe deer: patterns and rates}, ' ...
'journal = {Acta Theriologica}, ' ...
'volume = {45}, ' ...
'pages = {87--94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Capreolus_capreolus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

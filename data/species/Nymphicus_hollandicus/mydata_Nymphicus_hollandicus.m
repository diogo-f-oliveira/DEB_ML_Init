function [data, auxData, metaData, txtData, weights] = mydata_Nymphicus_hollandicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Nymphicus_hollandicus'; 
metaData.species_en = 'Cockatiel'; 

metaData.ecoCode.climate = {'BSh','BWh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 20.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 31.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 94.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 456;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 35*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 5.68;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';               bibkey.Ww0 = 'avibase';
data.Wwb = 5;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'avibase';
data.Wwi = 86.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 87.4; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 4.27/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.27 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since hatch (d) wet weight (b)
0.000	5.393
0.001	3.711
0.002	3.409
0.003	3.158
0.004	4.829
0.005	4.040
1.000	7.095
2.000	6.830
2.001	5.911
3.000	9.065
4.000	6.688
4.001	14.008
5.000	8.213
5.001	10.420
6.000	23.582
6.001	19.897
6.002	13.460
7.000	29.948
8.011	31.009
8.122	6.331
8.141	22.076
8.147	15.715
8.174	35.228
9.018	20.120
9.090	5.625
9.098	39.037
10.082	30.017
10.889	24.912
11.046	38.755
11.117	22.121
11.122	18.040
11.338	30.555
12.238	33.852
12.937	44.445
13.263	59.340
13.948	82.681
14.037	47.193
14.260	38.491
14.264	34.175
15.135	84.860
16.014	74.733
16.127	31.150
16.191	53.204
16.268	61.474
16.359	50.135
18.199	68.122
18.299	56.992
19.070	47.691
19.146	78.734
20.051	70.521
21.196	94.979
21.314	78.122
21.324	63.711
23.116	100.003
23.721	87.307
25.223	83.709
25.238	63.241
26.273	85.166
27.505	91.961
27.801	73.115
29.545	89.689
30.166	75.683
31.259	81.025
33.050	99.388
33.754	74.462
33.918	83.870
36.056	89.805
36.443	73.244
37.000	78.403
37.743	100.323
39.333	83.241
41.834	70.860
42.491	62.919
43.329	94.615
48.260	74.636];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Pear1998';
  
%% set weights for all real data
weights = setweights(data, []);
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

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '486M2'; % Cat of Life
metaData.links.id_ITIS = '177497'; % ITIS
metaData.links.id_EoL = '1177835'; % Ency of Life
metaData.links.id_Wiki = 'Nymphicus_hollandicus'; % Wikipedia
metaData.links.id_ADW = 'Nymphicus_hollandicus'; % ADW
metaData.links.id_Taxo = '54212'; % Taxonomicon
metaData.links.id_WoRMS = '1484507'; % WoRMS
metaData.links.id_avibase = 'FDAEA60A5681B51F'; % avibase
metaData.links.id_birdlife = 'cockatiel-nymphicus-hollandicus'; % birdlife
metaData.links.id_AnAge = 'Nymphicus_hollandicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nymphicus_hollandicus}}';
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
bibkey = 'Pear1998'; type = 'article'; bib = [ ... 
'author = {James T. Pearson}, ' ... 
'year = {1998}, ' ...
'title = {Development of Thermoregulation and Posthatching Growth in the Altricial Cockatiel \emph{Nymphicus hollandicus}}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {71(2)}, ' ...
'pages = {237-244}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nymphicus_hollandicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=FDAEA60A5681B51F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


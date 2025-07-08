function [data, auxData, metaData, txtData, weights] = mydata_Alloteuthis_subulata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Alloteuthis_subulata'; 
metaData.species_en = 'European common squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.ab = 14;   units.ab = 'd';    label.ab = 'age at hatching';      bibkey.ab = 'HastPier2015';   
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 250;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ArkhNeklu1993';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.28;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'HastPier2015';
  comment.Lb = '2.5-3.2 mm';
data.Lp  = 7.7;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'HastPier2015';
data.Lpm  = 7.2;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'HastPier2015';
data.Li  = 15.0;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'HastPier2015';
data.Lim = 21.5; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'HastPier2015';

data.Wwi  = 23.7; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death'; bibkey.Wwi  = 'HastPier2015';
  comment.Wwi = 'based on 0.167*Li^1.83, see F1';
data.Wwim = 16.7; units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for males'; bibkey.Wwim  = 'HastPier2015';
  comment.Wwim = 'based on 0.420*Lim^1.2, see F1';

data.Ni  = 18770; units.Ni  = '#';      label.Ni  = 'cum reprod at death at ML 12 cm';  bibkey.Ni  = 'HastPier2015';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
128.428	5.152
135.240	4.856
144.683	8.029
145.411	7.402
153.838	4.179
155.342	6.185
155.559	8.401
156.815	6.101
159.421	7.939
160.483	4.970
162.344	6.223
169.547	7.474
170.085	6.429];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhNeklu1993';
comment.tL_f = 'Data for females, hathed in autumn'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
75.319	1.874
81.033	1.997
84.536	2.204
85.272	2.120
87.494	2.872
88.233	3.039
90.255	2.745
92.653	2.911
94.314	3.078
95.232	2.868
96.886	2.617
97.269	3.578
99.833	2.532
100.566	2.281
100.584	3.493
101.487	2.280
101.502	3.325
102.044	2.573
102.976	3.325
103.900	3.491
117.362	4.321
119.014	3.944
120.120	3.986
120.314	4.654
123.998	4.611
125.270	3.356
128.609	4.943
131.368	4.649
134.667	3.477
137.263	4.605
138.565	5.398
139.487	5.440
141.329	5.439
143.540	5.438
146.483	5.102
147.431	6.983
150.201	7.400
154.784	5.851
156.462	7.146
160.509	6.726
161.815	7.854
171.580	7.891
178.410	8.808
194.430	8.215
206.224	8.419
216.365	8.916
230.787	12.421];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhNeklu1993';
comment.tL_m = 'Data for males, hathed in autumn'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Li = 3 * weights.Li; 
weights.Lim = 3 * weights.Lim; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Males are longer than females, but weigh less';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.167*(ML in cm)^1.83 for females, 0.420*(ML in cm)^1.2 for males';
metaData.bibkey.F1 = 'HastPier2015'; 
F2 = 'Programmed death, not by ageing';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BZP3'; % Cat of Life
metaData.links.id_ITIS = '82384'; % ITIS
metaData.links.id_EoL = '595403'; % Ency of Life
metaData.links.id_Wiki = 'Alloteuthis_subulata'; % Wikipedia
metaData.links.id_ADW = 'Alloteuthis_subulata'; % ADW
metaData.links.id_Taxo = '167298'; % Taxonomicon
metaData.links.id_WoRMS = '153131'; % WoRMS
metaData.links.id_molluscabase = '153131'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alloteuthis_subulata}}';
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
bibkey = 'ArkhNeklu1993'; type = 'article'; bib = [ ... 
'doi = {10.1017/S0025315400034822}, ' ...
'author = {Alexander Arkhipkin and Nataly Nekludova}, ' ... 
'year = {1993}, ' ...
'title = {AGE, GROWTH AND MATURATION OF THE LOLIGINID SQUIDS \emph{\emph{Alloteuthis africana}}  AND \emph{A. subulata} ON THE {W}EST {A}FRICAN SHELF}, ' ...
'journal = {Mar. biol. Ass. U.K.}, ' ...
'volume = {73}, ' ...
'pages = {949-961}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HastPier2015'; type = 'incollection'; bib = [ ... 
'author = {Lee C. Hastie and Graham J. Pierce and Ana Moreno and Patrizia Jereb and Evgenia Lefkaditou and Daniel Oesterwind and Manuel Garcia Tasende and Uwe Piatkowski and A. Louise Allcock}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Alloteuthis subulata} ({L}amarck, 1798)}, ' ...
'booktitle = {Cephalopod biology and fisheries in Europe: II. Species Accounts}, ' ...
'editor = {Patrizia Jereb and A. Louise Allcock and Evgenia Lefkaditou and Uwe Piatkowski and Lee C. Hastie and Graham J. Pierce}, ' ...
'publisher = {ICES Cooperative Research Report}, ' ...
'number = {325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Alloteuthis-subulata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


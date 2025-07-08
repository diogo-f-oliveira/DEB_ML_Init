function [data, auxData, metaData, txtData, weights] = mydata_Japetella_diaphana

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Amphitretidae';
metaData.species    = 'Japetella_diaphana'; 
metaData.species_en = 'Diaphanous pelagic octopod '; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 22]; 

%% set data
% zero-variate data

data.am = 210;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'SchwPist2020';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 6.4e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'SchwPist2020';
  comment.Wwb = 'based on hatchling of 1.5 mm length, 0.9 mm width: pi/6*0.15*0.09^2';
data.Wwp  = 18;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'SchwPist2020';
data.Wwi  = 240;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'SchwPist2020';

data.Ni  = 1419; units.Ni  = '#';  label.Ni  = 'fecundity at 206 d';    bibkey.Ni  = 'SchwPist2020';   
  temp.Ni = C2K(4);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % upper beak length (cm), time since birth (d)
0.053	22.390
0.091	45.256
0.122	52.890
0.140	49.856
0.162	47.331
0.164	65.100
0.168	59.011
0.169	69.163
0.179	71.201
0.180	73.739
0.181	82.876
0.188	80.851
0.193	62.072
0.217	63.610
0.222	95.085
0.226	80.875
0.237	72.760
0.258	91.048
0.259	94.601
0.263	75.822
0.268	93.084
0.277	90.552
0.287	68.731
0.303	95.645
0.305	75.849
0.391	94.685
0.394	119.560
0.462	158.182
0.467	128.236
0.562	172.966
0.595	146.591
0.663	121.254
0.720	145.656
0.727	207.589
0.741	196.937
0.760	157.356
0.778	158.382];
data.tL_f = data.tL_f(:,[2 1]); [~, ind] = sort(data.tL_f(:,1)); data.tL_f = data.tL_f(ind,:);
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'upper beak length', 'female'};  
temp.tL_f    = C2K(4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SchwPist2020';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % upper beak length (cm), time since birth (d)
0.224	74.274
0.243	81.901
0.323	104.287
0.457	99.804
0.502	116.075
0.509	140.953
0.539	128.282
0.645	157.791
0.700	146.151];
data.tL_m = data.tL_m(:,[2 1]); [~, ind] = sort(data.tL_m(:,1)); data.tL_m = data.tL_m(ind,:);
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'upper beak length', 'male'};  
temp.tL_m    = C2K(4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SchwPist2020';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
22.486	0.624
42.905	0.624
46.043	1.247
49.708	1.247
52.849	1.247
59.135	0.624
62.276	0.624
63.301	12.474
66.988	0.624
68.546	6.861
73.784	5.613
76.390	12.474
77.461	1.247
80.580	11.227
90.531	9.356
91.571	13.721
93.163	1.247
95.780	1.871
96.275	18.087
101.535	4.366
106.775	1.871
118.222	42.412
119.556	178.378
126.606	38.669
128.640	72.973
130.799	36.175
145.927	67.360
147.010	46.778
152.566	163.410
157.458	60.499
157.521	24.324
157.536	15.593
173.103	96.050
196.801	16.840
206.368	235.135];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(4);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SchwPist2020';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
73.270	0.5
81.124	0.5
98.337	36.798
103.634	1.247
116.197	3.119
127.086	63.617
141.212	69.231
146.529	22.453
155.971	12.474];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(4);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SchwPist2020';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL_f = 2 * weights.tL_f;
weights.tWw_m = 0 * weights.tWw_m;
weights.am = 50 * weights.am;
weights.Ni = 5 * weights.Ni;
weights.Wwb = 5 * weights.Wwb;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3QLWD'; % Cat of Life
metaData.links.id_ITIS = '82655'; % ITIS
metaData.links.id_EoL = '492775'; % Ency of Life
metaData.links.id_Wiki = 'Japetella'; % Wikipedia
metaData.links.id_ADW = 'Japetella_diaphana'; % ADW
metaData.links.id_Taxo = '40323'; % Taxonomicon
metaData.links.id_WoRMS = '138849'; % WoRMS
metaData.links.id_molluscabase = '138849'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Japetella}}';
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
bibkey = 'SchwPist2020'; type = 'article'; bib = [ ... 
'author = {Richard Schwarz and Uwe Piatkowski and Bruce H. Robison and Vladimir V. Laptikhovsky and Henk-Jan Hoving}, ' ... 
'year = {2020}, ' ...
'title = {Life history traits of the deep-sea pelagic cephalopods \emph{Japetella diaphana} and \emph{Vampyroteuthis infernalis}}, ' ...
'journal = {Deep-Sea Research I}, ' ...
'volume = {164}, ' ...
'pages = {103365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Japetella-diaphana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


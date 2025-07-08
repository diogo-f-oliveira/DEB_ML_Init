function [data, auxData, metaData, txtData, weights] = mydata_Watasenia_scintillans

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Enoploteuthidae';
metaData.species    = 'Watasenia_scintillans'; 
metaData.species_en = 'Sparkling enope squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 06 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.ab = 8.5;   units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'ADW';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '6-14 d';
data.am = 365;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'Wiki';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 365/2;   units.amm = 'd';    label.amm = 'life span for male';        bibkey.amm = 'Wiki';   
  temp.amm = C2K(10); units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lp  = 3.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'guess';
  comment.Lp = 'based on Doryteuthis_pealeii: (17/27)*40';
data.Li  = 7.5;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';     bibkey.Li  = 'Wiki';
data.Lim  = 6.5;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for male';     bibkey.Lim  = 'SatoTsud2020';
  comment.Lim = 'based on max length of male vs female in sample';

data.Wwb  = 6.8e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on Abraliopsis_morisii'; 
data.Wwi  = 7;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death for females';     bibkey.Wwi  = 'SatoTsud2020';
data.Wwim  = 4.5;  units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for males';     bibkey.Wwim  = 'SatoTsud2020';

data.Ni  = 1e4; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'guess';   
  temp.Ni = C2K(10);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Wwb = 'based on Abraliopsis_morisii'; 

% uni-variate data

% time-length
data.tL_f = [ ... % time (d), mantle length (cm)
4.104	4.655
18.654	4.760
24.997	4.626
27.609	5.020
35.817	4.768
39.174	4.895
54.844	5.230
63.425	5.223
64.171	5.045
69.394	4.874
70.514	5.194
76.110	5.455
77.976	5.142
80.214	5.306
91.034	5.507
95.511	5.500
104.838	5.449
109.315	5.434];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SatoTsud2020';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time  (d), mantle length (cm)
3.731	4.550
11.193	4.135
19.401	4.507
19.402	4.693
23.878	4.470
27.609	4.864
30.966	4.641
32.832	4.560
36.190	4.545
45.890	4.784
52.979	4.814
56.709	5.089
57.829	5.000
58.202	4.881
68.648	4.673
73.125	4.837
77.229	4.674
80.214	4.882];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SatoTsud2020';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time (d), wet weight (g)
5.348	3.834
11.887	3.540
19.252	4.030
22.924	4.185
27.356	4.587
29.994	5.258
32.483	4.697
34.655	4.539
37.940	4.516
39.856	5.254
58.192	5.852
64.424	6.028
65.061	5.267
69.883	5.870
71.402	6.339
78.251	5.598
78.350	6.404
81.574	5.888
92.611	6.533
98.057	6.262
104.531	5.432
110.500	6.459];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(10);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SatoTsud2020';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time (d), wet weight (g)
5.291	3.364
11.511	3.451
18.832	3.583
21.773	3.738
24.685	3.648
29.504	4.228
33.132	4.025
34.931	3.800
35.997	3.554
45.231	4.401
54.984	3.502
56.145	4.039
60.507	3.858
67.738	3.251
72.489	3.272
76.526	3.427
81.282	3.492];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(10);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SatoTsud2020';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hp and h_a only';
D2 = 'mean temperature is guessed from 3-6 C at 300-400 m deep during day and 5-15 C at 20-60 m deep during night';
metaData.bibkey.D2 = 'Wiki'; 
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5BV5K'; % Cat of Life
metaData.links.id_ITIS = '556011'; % ITIS
metaData.links.id_EoL = '399186'; % Ency of Life
metaData.links.id_Wiki = 'Watasenia_scintillans'; % Wikipedia
metaData.links.id_ADW = 'Watasenia_scintillans'; % ADW
metaData.links.id_Taxo = '158012'; % Taxonomicon
metaData.links.id_WoRMS = '342419'; % WoRMS
metaData.links.id_molluscabase = '342419'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Watasenia_scintillans}}';
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
bibkey = 'SatoTsud2020'; type = 'article'; bib = [ ... 
'doi = {10.1038/s41598-020-68006}, ' ...
'author = {Noriyosi Sato and Sei?Ichiro Tsuda and Md. Nur E. Alam and Tomohiro Sasanami and Yoko Iwata and Satoshi Kusama and Osamu Inamura and Masa?aki Yoshida and Noritaka Hirohashi}, ' ... 
'year = {2020}, ' ...
'title = {Rare polyandry and common monogamy in the firefly squid, \emph{Watasenia scintillans}}, ' ...
'journal = {Scientific Reports}, ' ...
'volume = {10}, ' ...
'pages = {10962}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Watasenia-scintillans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Watasenia_scintillans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


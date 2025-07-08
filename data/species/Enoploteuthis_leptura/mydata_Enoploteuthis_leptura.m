function [data, auxData, metaData, txtData, weights] = mydata_Enoploteuthis_leptura

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Enoploteuthidae';
metaData.species    = 'Enoploteuthis_leptura'; 
metaData.species_en = 'Hooked enope squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 18];              
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

data.am = 160;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'Arkh1994';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on ML 3.8 cm in 160d, and max ML 7 cm';

data.Lp  = 6.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';   bibkey.Lp  = 'Arkh1994';
data.Lpm  = 3.5;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';   bibkey.Lpm  = 'Arkh1994';
data.Li  = 9.2;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';      bibkey.Li  = 'Arkh1994';

data.Wwb  = 4.4e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'Lapt1999';

data.Ni  = 34e3; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'Lapt1999';   
  temp.Ni = C2K(21);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'value for Enoploteuthis_anapsis';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
21.536	0.445
32.075	1.822
35.236	1.242
42.674	2.236
74.645	5.694
80.624	5.037
82.373	7.041
82.723	6.444
84.312	6.016
86.991	8.157
90.175	7.209
91.394	7.714
97.078	6.767
99.289	6.385
100.154	7.547
102.904	8.556
104.034	5.468
107.293	8.327
109.454	8.755
110.407	8.511
123.849	8.436
130.385	8.849
142.860	9.263];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1994';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
47.000	3.016
51.923	4.240
52.592	3.537
61.249	5.036
68.239	3.186
69.977	5.388
71.598	4.440
71.843	5.526
79.669	5.313
83.106	5.313
83.718	5.527
89.930	6.139
90.211	6.644
92.136	5.834
97.799	5.238
127.636	7.840
134.435	9.048
152.362	7.230];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1994';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
20.878	0.404
31.624	0.825
34.396	1.203
43.269	1.097
54.958	3.886
59.854	3.692
65.996	5.782
67.223	6.084
68.134	5.167
70.907	7.770
71.222	9.529
73.348	6.400
74.591	9.724
81.306	6.332
82.571	15.700
83.786	12.543
90.229	17.379
91.463	21.531
97.270	17.730
104.595	10.750
110.753	24.062
124.228	26.899
130.972	33.314
143.535	44.300];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Arkh1994';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
46.975	2.241
51.598	4.576
53.420	3.301
60.812	9.060
79.182	9.525
83.162	9.620
84.980	6.331
98.162	9.612
128.818	26.349
136.171	29.769
154.225	25.518];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Arkh1994';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 8 * weights.Li;
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39WSY'; % Cat of Life
metaData.links.id_ITIS = '556743'; % ITIS
metaData.links.id_EoL = '486882'; % Ency of Life
metaData.links.id_Wiki = 'Enoploteuthis_leptura'; % Wikipedia
metaData.links.id_ADW = 'Enoploteuthis_leptura'; % ADW
metaData.links.id_Taxo = '136582'; % Taxonomicon
metaData.links.id_WoRMS = '342300'; % WoRMS
metaData.links.id_molluscabase = '342300'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enoploteuthis_leptura}}';
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
bibkey = 'Arkh1994'; type = 'article'; bib = [ ... 
'author = {A.I. Arkhipkin}, ' ... 
'year = {1994}, ' ...
'title = {Age, growth and maturation of the squid \emph{Enoploteuthis leptura} ({O}egopsida: {E}noploteuthidae) from the central-east {A}tlantic based on statolith microstructure}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {60}, ' ...
'pages = {108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lapt1999'; type = 'article'; bib = [ ... 
'author = {V. V. Laptikhovsky}, ' ... 
'year = {1999}, ' ...
'title = {Fecundity and spawning in squid of families {E}noploteuthidae and {A}ncistrocheiridae ({C}ephalopoda: {O}egopsida) }, ' ...
'journal = {SCI. MAR.}, ' ...
'volume = {63(1)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Enoploteuthis-leptura.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


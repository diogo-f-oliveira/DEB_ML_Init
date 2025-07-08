function [data, auxData, metaData, txtData, weights] = mydata_Lolliguncula_brevis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Lolliguncula_brevis'; 
metaData.species_en = 'Atlantic brief squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 14];              
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

data.am = 180;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'JackFors1997';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'JackFors1997';
data.Lpm  = 4;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'JackFors1997';
data.Li  = 8.5;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'JackFors1997';
data.Lim = 8; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'JackFors1997';

data.Wwb  = 5e-3; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'JackFors1997';

data.GSI  = 2/7.5; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'JackFors1997';   
  temp.GSI = C2K(23);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
47.258	1.116
65.850	2.348
81.368	2.120
85.940	2.251
87.922	4.246
90.703	2.146
93.492	5.257
94.286	3.906
100.837	3.416
102.133	5.133
102.786	3.246
108.747	6.337
109.044	4.514
109.054	7.024
111.141	4.773
111.840	7.518
113.022	5.632
114.880	6.834
114.881	6.834
117.865	6.985
117.974	5.334
119.126	3.897
122.935	4.907
124.941	6.538
131.748	7.507
132.832	7.100
136.592	6.180
140.962	6.697
146.740	7.236
146.802	6.292
159.784	7.114
171.578	7.248];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JackFors1997';
comment.tL_f = 'data for females from June sample in northern Gulf of Mexico off the Texas coast'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
66.539	2.584
76.943	2.439
77.808	2.676
78.203	2.032
79.939	2.419
82.037	2.656
85.349	3.194
91.559	5.192
96.650	2.792
97.988	3.865
98.010	3.544
98.980	4.852
99.204	4.123
102.192	4.232
104.927	5.499
106.328	5.628
110.259	4.794
110.735	5.588
114.289	5.118
114.890	6.684
115.970	6.341
116.690	6.105
124.808	5.895
126.365	6.325
128.748	4.910
130.845	5.169
142.769	6.011
150.160	6.122];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JackFors1997';
comment.tL_m = 'data for males from June sample in northern Gulf of Mexico off the Texas coast'; 

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
47.229	1.111
65.863	1.778
81.686	1.887
86.081	1.615
86.256	13.441
88.542	7.161
90.124	1.712
93.289	9.846
94.343	3.749
101.551	4.681
102.254	10.410
103.485	4.683
108.759	16.145
109.638	23.814
109.639	7.092
111.923	8.203
112.802	24.557
113.330	13.378
115.440	21.326
117.549	9.040
118.252	18.742
118.956	4.238
123.175	8.769
124.933	18.934
132.141	24.024
133.371	23.101
137.239	17.007
147.260	15.355
160.269	21.005
172.575	21.481];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(23);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'JackFors1997';
comment.tWw_f = 'data for females from June sample in northern Gulf of Mexico off the Texas coast'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
65.863	2.424
77.642	1.883
78.521	2.438
78.522	1.330
80.279	2.163
82.565	2.258
85.553	4.848
91.003	10.582
96.453	2.458
98.035	4.677
98.563	3.661
99.090	7.635
99.442	5.048
102.254	6.067
105.067	11.706
106.122	13.463
110.165	8.940
111.220	12.175
114.033	10.884
115.088	15.875
115.967	16.430
117.198	13.013
125.109	13.945
127.042	15.241
128.976	8.776
131.086	9.887
143.040	15.166
150.248	14.619];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(23);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'JackFors1997';
comment.tWw_m = 'data for males from June sample in northern Gulf of Mexico off the Texas coast'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperature in tL and tWw data varies between 12 and 30 C';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VVYK'; % Cat of Life
metaData.links.id_ITIS = '82379'; % ITIS
metaData.links.id_EoL = '448806'; % Ency of Life
metaData.links.id_Wiki = 'Lolliguncula_brevis'; % Wikipedia
metaData.links.id_ADW = 'Lolliguncula_brevis'; % ADW
metaData.links.id_Taxo = '157881'; % Taxonomicon
metaData.links.id_WoRMS = '574509'; % WoRMS
metaData.links.id_molluscabase = '574509'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lolliguncula_brevis}}';
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
bibkey = 'JackFors1997'; type = 'article'; bib = [ ... 
'author = {G.D. Jackson and J.W. Forsythe and R.F. Hixon and R.T. Hanlon}, ' ... 
'year = {1997}, ' ...
'title = {Age, growth, and maturation of \emph{Lolliguncula brevis} ({C}ephalopoda: {L}oliginidae) in the northwestern {G}ulf of {M}exico with a comparison of length-frequency versus statolith age analysis}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {54}, ' ...
'pages = {2907-2919}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Lolliguncula-brevis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


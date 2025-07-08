function [data, auxData, metaData, txtData, weights] = mydata_Illex_argentinus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Illex_argentinus'; 
metaData.species_en = 'Argentine shortfin squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'HaimBrun1998';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'HaimBrun1998';
  comment.Lp = '195 to 330 mm';
data.Lpm  = 20;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'HaimBrun1998';
  comment.Lpm = '142 to 250 mm';
data.Li  = 34.4; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'SchrPere2010';
data.Lim = 34; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'sealifebase';

data.Wwb  = 1e-3; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'HaimBrun1998';
  comment.Wwb = 'based on cylindric larva of 2 mm length, 0.8 mm wide: pi*0.04^2*0.2';
data.Wwi  = 1.5e3; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on same length-weight, compared to Dosidicus gigas: (34/120)^3*65 kg';

data.Ni  = 75e4; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'HaimBrun1998';   
  temp.Ni = C2K(8); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % % time since august 1 (d), growth increment (mm)
59.077	0.514
60.600	0.462
61.211	0.700
63.728	0.563
63.739	0.590
65.286	0.600
67.373	0.668
67.870	0.626
69.423	0.648
70.442	0.624
70.452	0.648
72.510	0.648
72.523	0.680
74.581	0.678
74.593	0.707
77.176	0.734
77.184	0.754
78.707	0.702
80.782	0.744
81.824	0.776
83.361	0.758
83.900	0.817
86.992	0.829
90.591	0.822
92.662	0.854
96.273	0.876
97.317	0.913
98.870	0.935
100.933	0.947
101.463	0.983
102.999	0.966
103.005	0.981
106.097	0.991
107.644	1.001
107.649	1.013
108.672	0.996
111.773	1.030
112.802	1.030
113.843	1.059
114.856	1.020
115.894	1.042
117.965	1.071
120.021	1.067
122.094	1.103
123.632	1.089
126.213	1.108
126.214	1.108
127.233	1.086
128.278	1.125
129.824	1.130
131.365	1.125
131.371	1.140
132.401	1.142
135.494	1.154
136.005	1.147
136.528	1.167
139.107	1.181
140.659	1.203
143.235	1.211
143.239	1.220
144.774	1.198
146.326	1.218
147.366	1.245
149.415	1.223
149.424	1.245
150.964	1.235
153.041	1.282
154.587	1.286
155.097	1.277
158.199	1.313
160.775	1.321
160.785	1.345
161.279	1.294
161.811	1.338];
data.tL_f(:,1) = data.tL_f(:,1) - data.tL_f(1,1); % put first time point at origin
[GL, dGL] = spline1([.6 1.4], [0.252 5.325; 1.443 22.505]); % determine slopes at extremes
data.tL_f(:,2) = spline1(data.tL_f(:,2),[0.252 5.325; 1.443 22.505], dGL(1), dGL(2));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SchrPere2010';
comment.tL_f = 'Data for females, summer spawners; mantle length taken equal to gladus length. Gladus length taken linear in growth increment from (0.252 mm, 5.325 cm) to (1.443 mm, 22.505 cm)'; 
%
data.tL_m = [ ... % time since august 1 (d), growth increment (mm)
60.833	0.478
60.834	0.632
61.815	0.664
64.758	0.809
65.739	0.702
68.683	0.762
70.645	0.828
71.626	0.772
74.570	0.739
76.532	0.776
80.457	0.809
83.401	0.818
84.382	0.842
84.383	0.898
85.363	0.860
89.568	0.900
89.569	0.923
92.371	0.923
93.773	0.936
96.576	0.956
97.277	0.940
97.978	0.986
104.286	0.970
105.687	1.000
108.491	1.016
108.492	1.040
110.593	1.056
113.397	1.053
116.200	1.083
116.901	1.120
116.902	1.100
119.704	1.136
119.705	1.110
122.508	1.147
125.311	1.133
126.713	1.153
128.114	1.180
130.217	1.137
130.918	1.170
134.422	1.163
135.123	1.197
136.525	1.217
139.328	1.263
140.730	1.253
140.731	1.230
140.732	1.227
142.131	1.253
144.935	1.290
144.936	1.280
145.637	1.270
147.737	1.367
147.738	1.353
147.739	1.353
149.841	1.363
151.242	1.297
152.644	1.323
154.046	1.317
154.746	1.207
156.148	1.200
156.849	1.214
158.952	1.177
158.953	1.363
161.054	1.497
161.755	1.137];
data.tL_m(:,1) = data.tL_m(:,1) - data.tL_m(1,1); % put first time point at origin
[GL, dGL] = spline1([.7 1.7], [0.614 5.87; 1.703 26.86]); % determine slopes at extremes
data.tL_m(:,2) = spline1(data.tL_m(:,2),[0.614 5.87; 1.703 26.86], dGL(1), dGL(2));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SchrPere2010';
comment.tL_m = 'Data for males, summer spawners; mantle length taken equal to gladus length. Gladus length taken linear in growth increment from (0.614 mm, 5.87 cm) to (1.703 mm, 26.86 cm)'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;
% weights.Lp = 3 * weights.Lp;
% weights.Lpm = 3 * weights.Lpm;
% weights.Wwi = 3 * weights.Wwi;
% weights.Li = 3 * weights.Li;
% weights.Lim = 3 * weights.Lim;
weights.am = 3 * weights.am;
weights.Ni = 50 * weights.Ni;

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
D2 = 'Reproductive output is assumed to correspond to death at 365 d';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'typically lives for 1 yr; Programmed death, not by ageing';
metaData.bibkey.F1 = 'HaimBrun1998'; 
F2 = 'Illex argentinus is found off Argentina at bottom temperatures mainly at 4-12 C. Paralarvae are rarely found in surface water temperatures under 12 C';
metaData.bibkey.F2 = 'HaimBrun1998'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3PGGW'; % Cat of Life
metaData.links.id_ITIS = '556070'; % ITIS
metaData.links.id_EoL = '591440'; % Ency of Life
metaData.links.id_Wiki = 'Illex_argentinus'; % Wikipedia
metaData.links.id_ADW = 'Illex_argentinus'; % ADW
metaData.links.id_Taxo = '158097'; % Taxonomicon
metaData.links.id_WoRMS = '342064'; % WoRMS
metaData.links.id_molluscabase = '342064'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Illex_argentinus}}';
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
bibkey = 'SchrPere2010'; type = 'Article'; bib = [ ... 
'author = {R. Schroeder and J. A. A. Perez}, ' ... 
'year = {2010}, ' ...
'title = {The study of intra-specific growth variability of \emph{Illex argentinus} ({C}ephalopoda: {T}euthida) in {B}razilian waters as reconstructed from the gladius microstructure}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {106}, ' ...
'pages = {163-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaimBrun1998'; type = 'Incollection'; bib = [ ... 
'author = {M. Haimovici and N.E. Brunetti and P.G. Rodhouse and J. Csirke and R.H . Leta}, ' ... 
'year = {1998}, ' ...
'title = {\emph{Illex argentinus}}, ' ...
'booktitle = {Squid Recruitment Dynamics: The Genus \emph{Illex} as a Model, the Commercial \emph{Illex} species and influences on variability}, ' ...
'series  = {FAO Fisheries Technical Paper}, ' ...
'editor = {P. G. Rodhouse and E. G. Dawe and R. K. O''dor}, ' ...
'volume = {376}, ' ...
'chapter = {3}, ', ...
'publisher = {FAO}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Illex-argentinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Hyperprosopon_argenteum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Embiotocidae';
metaData.species    = 'Hyperprosopon_argenteum'; 
metaData.species_en = 'Walleye surfperch'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.8); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 05 27]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(12.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 2; units.Lb  = 'cm';  label.Lb  = 'standard length at birth'; bibkey.Lb  = 'DeMaMoor1983'; 
data.Lp  = 7.3; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty for females'; bibkey.Lp  = 'DeMaMoor1983'; 
data.Lpm  = 7.5; units.Lpm  = 'cm';  label.Lpm  = 'standard length at puberty for males'; bibkey.Lpm  = 'DeMaMoor1983'; 
data.Li  = 13.0;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'DeMaMoor1983';
data.Lim  = 12.0;  units.Lim  = 'cm';  label.Lim  = 'ultimate standard length for males'; bibkey.Lim  = 'DeMaMoor1983';

data.Wwi = 66; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'DeMaMoor1983';
data.Wwim = 52; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'DeMaMoor1983';

% uni-variate data
% time-length
data.tL_f = [ ... % time (d), standard length (cm)
-0.989	4.517
28.954	5.195
60.111	5.933
88.756	6.888
120.533	7.606
120.674	7.032
149.949	7.928
150.509	8.146
178.136	8.249
182.968	8.587
211.780	8.869
243.068	9.072
272.620	8.839
305.703	9.241
337.597	9.483
365-1.016	9.626
365+29.385	10.938
365+59.411	11.280
365+90.690	11.522
365+125.036	11.785
365+150.224	11.809
365+211.494	12.532
365+242.285	12.260
365+272.881	12.780
365+303.081	12.408
365+334.365	12.631];
data.tL_f(:,1) = 100 + data.tL_f(:,1); % set origin to time since birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(12.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DeMaMoor1983';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time  (d), standard length (cm)
121.060	7.963
149.866	8.265
179.282	8.586
212.979	8.988
242.497	8.894
271.972	8.978
304.504	9.122
333.295	9.483
365-2.947	9.982
365+28.259	10.522
365+61.303	11.082
365+90.724	11.384
365+121.954	11.824
365+152.047	11.889
365+212.854	11.998
365+242.241	12.438
365+272.451	12.027
365+305.027	11.993
365+335.121	12.057];
data.tL_m(:,1) = 100 + data.tL_m(:,1); % set origin to time since birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(12.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DeMaMoor1983';
comment.tL_m = 'Data for males';

% weight fecundity
data.WN = [ ... % standard length (cm), fecundity (#)
26.246	2.035
29.630	5.922
29.923	0.998
32.852	5.979
33.833	5.980
34.284	5.023
35.423	8.963
35.516	5.981
35.547	4.969
36.028	3.027
36.295	7.951
36.357	5.982
38.538	7.953
38.880	5.983
39.332	4.971
41.108	1.964
41.292	5.055
41.368	7.134
43.422	4.181
43.456	3.087
45.547	7.985
47.572	5.962
48.321	8.944
49.817	5.909
50.625	6.976
52.724	7.087
53.040	5.938
53.818	7.991
54.639	4.107
56.337	8.102
56.698	10.017
56.729	9.032
57.879	8.103
58.411	9.033
58.755	7.009
59.282	8.076
60.356	5.095
60.684	8.077
60.795	9.007
61.572	2.060
61.719	10.841
61.759	5.069
62.025	10.048
62.366	8.078
62.735	9.747
62.868	9.966
62.974	11.061
63.708	9.994
63.829	6.110
64.832	9.913
66.449	12.020
67.945	8.985
68.629	5.046
68.726	10.928
70.049	8.959
70.828	10.957
71.558	10.027
71.587	9.097
71.636	12.024
72.025	4.036
74.019	12.026
74.971	12.956
76.325	10.003
77.918	12.876
78.566	10.059
79.359	7.105
79.660	10.963
79.723	8.938
80.732	8.036
82.715	11.895
84.544	7.164
84.857	6.124
85.188	8.997
85.402	2.131
85.996	10.064
87.101	6.098
89.781	10.067
91.216	9.001
92.461	14.035
93.259	10.917
93.646	12.012
94.986	13.982
95.869	8.129
97.290	12.014
97.758	14.996
98.428	16.009
98.585	10.948
98.876	6.106
101.155	4.959
103.740	11.991
104.829	13.031
104.922	10.022
105.498	5.044
105.683	8.108
105.871	11.063
108.967	6.195
109.046	8.165
112.587	15.991
112.771	19.083
114.300	15.008
119.876	16.024
141.745	16.011];
units.WN   = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN    = C2K(12.8);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'DeMaMoor1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'DeMaMoor1983'; 
F2 = 'Marine; reef-associated; depth range 2 - 30 m, usually 2 - 30 m.   Tropical; 24 C - 28 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6MPPH'; % Cat of Life
metaData.links.id_ITIS = '169747'; % ITIS
metaData.links.id_EoL = '46572851'; % Ency of Life
metaData.links.id_Wiki = 'Hyperprosopon_argenteum'; % Wikipedia
metaData.links.id_ADW = 'Hyperprosopon_argenteum'; % ADW
metaData.links.id_Taxo = '177026'; % Taxonomicon
metaData.links.id_WoRMS = '281098'; % WoRMS
metaData.links.id_fishbase = 'Hyperprosopon-argenteum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hyperprosopon_argenteum}}';
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
bibkey = 'DeMaMoor1983'; type = 'Article'; bib = [ ... 
'author = {Edward E. DeMartini and Thomas O. Moore and Kenneth M. Plummer}, ' ... 
'year = {1983}, ' ...
'title = {Reproductive and growth dynamics of Hyperprosopon argenteum (Embiotocidae) near San Diego, California}, ' ...
'journal = {Env. Biol. Fish.}, ' ...
'volume = {8}, ' ...
'pages = {29-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hyperprosopon-argenteum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

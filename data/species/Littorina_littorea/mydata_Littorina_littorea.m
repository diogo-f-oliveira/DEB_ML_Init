function [data, auxData, metaData, txtData, weights] = mydata_Littorina_littorea
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Littorinidae';
metaData.species    = 'Littorina_littorea'; 
metaData.species_en = 'Common periwinkle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wd0'; 'pXi_Wd'}; 
metaData.data_1     = {'t-L_f'; 't-Wd'; 'L-Wd'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Adriana Sardi', 'Gro Harlaug Refseth','Starrlight Augustine','Bas Kooijman'};    
metaData.date_subm = [2017 02 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 09]; 

%% set data
% zero-variate data

data.tj = 5*30.5;    units.tj = 'd';    label.tj = 'time since birth at settlement'; bibkey.tj = 'Moor1937';
  temp.tj = C2K(8);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 18*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Moor1937';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Moor1937';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.3; units.Lj  = 'cm';  label.Lj  = 'shell height at settlement';         bibkey.Lj  = 'Will1964';
data.Lp  = 1.1; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty for female'; bibkey.Lp  = 'marlin';
data.Li  = 3.8; units.Li  = 'cm';  label.Li  = 'ultimate shell height';              bibkey.Li  = 'Will1964';

data.Wd0 = 1.376e-6;  units.Wd0 = 'g'; label.Wd0 = 'egg dry weight'; bibkey.Wd0 = 'Grah1973';

data.pXm = 190.8; units.pXm = 'J/d.g'; label.pXm = 'spec feeding rate at 0.3 g dry'; bibkey.pXm = 'Grah1973';
  temp.pXm = C2K(12);  units.temp.pXm = 'K'; label.temp.pXm = 'temperature';
  comment.pXm = '45.6 cal Ulva lactuca per g dry weight per day. Weight is unkown, but 0.3 g assumed, temp is guessed';

% uni-variate data
% t-L data
data.tL0 = [ ... % time since 1 mrt 1961 (d), shell height (cm)
31.430	2.205
61.850	2.198
92.206	2.307
123.837	2.151
151.929	2.278
184.753	2.004
214.087	1.926
243.303	2.057
275.893	2.199
305.302	1.988
336.745	2.167
366.124	2.007
395.326	2.164
428.000	2.157
456.232	2.035
487.649	2.259
518.093	2.211
548.612	2.030];
units.tL0   = {'d', 'cm'};  label.tL0 = {'time since 1961/03/01', 'shell height'};  
temp.tL0    = C2K(12);  units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
bibkey.tL0 = 'Will1964';
comment.tL0 = 'Data for population at Craig-yr-Wylfa, Wales';
%
data.tL1 = [ ...  % time since 1 mrt 1961 (d), shell height (cm)
30.728	1.450
58.860	1.507
92.656	1.507
124.205	1.497
153.466	1.550
186.148	1.528
214.265	1.610
244.687	1.600
273.960	1.630
305.520	1.601
337.061	1.605
365.222	1.610
395.642	1.603
426.029	1.656
458.701	1.652
487.959	1.709
518.378	1.706
551.016	1.762
579.125	1.859
609.543	1.856
641.067	1.890
670.332	1.936
701.864	1.955
732.266	1.981
762.682	1.982];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since 1961/03/01', 'shell height'};  
temp.tL1    = C2K(12);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Will1964';
comment.tL1 = 'Data for population at Craig-yr-Wylfa, Wales';
%
data.tL2 = [ ...  % time since 1 mrt 1961 (d), shell height (cm)
31.176	0.655
62.694	0.700
89.674	0.801
122.306	0.869
152.622	1.048
183.013	1.093
215.620	1.205
243.756	1.254
274.170	1.258
305.713	1.259
337.260	1.252
366.549	1.253
395.841	1.250
426.251	1.261
457.798	1.255
488.173	1.330
519.716	1.330
550.126	1.342
578.253	1.406
608.670	1.406
639.042	1.485
670.574	1.504];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since 1961/03/01', 'shell height'};  
temp.tL2    = C2K(12);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Will1964';
comment.tL2 = 'Data for population at Craig-yr-Wylfa, Wales';
%
data.tL3 = [ ...  % time since 1 mrt 1961 (d), shell height (cm)
151.931	0.274
182.305	0.349
213.787	0.458
243.067	0.477
272.313	0.556
304.957	0.601
333.112	0.616
365.775	0.628
395.046	0.662
426.563	0.708
455.799	0.805
486.188	0.854
519.967	0.884
550.310	1.015
577.267	1.157
609.922	1.183
639.159	1.277
670.642	1.385
698.805	1.386
729.223	1.383
761.890	1.387];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since 1961/03/01', 'shell height'};  
temp.tL3    = C2K(12);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Will1964';
comment.tL3 = 'Data for population at Craig-yr-Wylfa, Wales';
%
data.tL4 = [ ...  % time since 1 mrt 1961 (d), shell height (cm)
547.326	0.312
581.122	0.313
609.256	0.366
639.649	0.407
668.914	0.452
702.695	0.479
730.840	0.513
761.258	0.510];
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since 1961/03/01', 'shell height'};  
temp.tL4    = C2K(12);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'Will1964';
comment.tL4 = 'Data for population at Craig-yr-Wylfa, Wales';

% t-L data at St. John's Lake, opposite Trevol Pier
data.tL0T = [ ... % time since 1 jan 1935 (d), shell height (cm)
24.079	0.886
51.228	0.916
79.764	1.027
110.310	1.068
138.886	1.287
181.691	1.453
208.983	1.863
238.687	1.471
268.626	1.704
316.137	1.759
341.935	1.806];
units.tL0T   = {'d', 'cm'};  label.tL0T = {'time since 1935/01/01', 'shell height'};  
temp.tL0T    = C2K(12);  units.temp.tL0T = 'K'; label.temp.tL0T = 'temperature';
bibkey.tL0T = 'Moor1937';
comment.tL0T = 'Data for population at Trevol Pier; temp from 8 till 16 C';
%
data.tL1T = [ ... % time since 1 jan 1935 (d), shell height (cm)
164.880	0.050
183.952	0.253
208.539	0.686
238.326	0.516
269.542	0.535
317.073	0.642
344.262	0.778];
units.tL1T   = {'d', 'cm'};  label.tL1T = {'time since 1935/01/01', 'shell height'};  
temp.tL1T    = C2K(12);  units.temp.tL1T = 'K'; label.temp.tL1T = 'temperature';
bibkey.tL1T = 'Moor1937';
comment.tL1T = 'Data for population at Trevol Pier; temp from 8 till 16 C';

% t-W data at St. John's Lake, opposite Trevol Pier
data.tW0T = [ ... % time since 1 jan 1935 (d), dry tissue weight (g)
1.478	0.305
9.605	0.291
44.332	0.272
71.670	0.267
99.008	0.243
127.824	0.258];
units.tW0T   = {'d', 'g'};  label.tW0T = {'time since 1935/01/01', 'dry tissue weight'};  
temp.tW0T    = C2K(12);  units.temp.tW0T = 'K'; label.temp.tW0T = 'temperature';
bibkey.tW0T = 'Moor1937';
comment.tW0T = 'Data for females at Trevol Pier; temp from 8 till 16 C';
%
data.tW1T = [ ... % time since 1 jan 1935 (d), dry tissue weight (g)
0.739	0.192
11.822	0.193
45.071	0.185
76.842	0.174
101.225	0.160
123.391	0.183
164.767	0.204
212.055	0.233
269.686	0.293
319.190	0.329
345.051	0.336
365.000	0.308];
units.tW1T   = {'d', 'g'};  label.tW1T = {'time since 1935/01/01', 'dry tissue weight'};  
temp.tW1T    = C2K(12);  units.temp.tW1T = 'K'; label.temp.tW1T = 'temperature';
bibkey.tW1T = 'Moor1937';
comment.tW1T = 'Data for females at Trevol Pier; temp from 8 till 16 C';
%
data.tW2T = [ ... % time since 1 jan 1935 (d), dry tissue weight (g)
0.739	0.006
26.599	0.005
50.243	0.005
93.097	0.009
135.213	0.016
163.289	0.026
211.316	0.071
240.870	0.120
271.903	0.153
319.190	0.182
345.051	0.193
363.522	0.194];
units.tW2T   = {'d', 'g'};  label.tW2T = {'time since 1935/01/01', 'dry tissue weight'};  
temp.tW2T    = C2K(12);  units.temp.tW2T = 'K'; label.temp.tW2T = 'temperature';
bibkey.tW2T = 'Moor1937';
comment.tW2T = 'Data for females at Trevol Pier; temp from 8 till 16 C';

% L-Wd data
data.LW = [ ... % shell sheight (cm), dry tissue weight (g)
1.299	0.063
1.318	0.025
1.337	0.027
1.345	0.022
1.356	0.030
1.360	0.024
1.360	0.028
1.390	0.026
1.411	0.037
1.417	0.033
1.428	0.031
1.463	0.043
1.479	0.031
1.491	0.034
1.500	0.031
1.503	0.049
1.520	0.048
1.522	0.038
1.546	0.035
1.581	0.049
1.581	0.054
1.591	0.057
1.600	0.037
1.629	0.059
1.685	0.071
1.775	0.076
1.800	0.079
1.800	0.084
1.826	0.076
1.826	0.082
1.865	0.127
1.916	0.053
2.021	0.135
2.034	0.154
2.041	0.149
2.099	0.154
2.150	0.170
2.250	0.132
2.326	0.191
2.327	0.215
2.327	0.222
2.327	0.230
2.360	0.238
2.397	0.213
2.412	0.203
2.425	0.261
2.475	0.261
2.479	0.279
2.538	0.273
2.539	0.297
2.550	0.258
2.595	0.304
2.603	0.277
2.637	0.358
2.662	0.350
2.701	0.408
2.742	0.316
2.795	0.344];
units.LW   = {'cm', 'g'};  label.LW = {'shell height', 'dry tissue weight'};  
bibkey.LW = 'Grah1973';
comment.LW = 'Data for females';

% L-N data
data.LN = [ ... % shell height (cm), fecundity (#)
2.90 159660 
2.66 113310 
2.78 107420 
2.90 123310 
2.70  97280 
2.34  95320 
2.62 113660 
2.94  65540];
units.LN   = {'cm', '#'};  label.LN = {'shell height', 'number of eggs'};  
temp.LN    = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN  = 'Grah1973';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 50 * weights.Li;
weights.LN(8) = 0; % exclude outlier

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL0','tL1','tL2','tL3','tL4'}; subtitle1 = {'Data for year classes at Craig-yr-Wylfa, Wales'};
set2 = {'tL0T','tL1T'}; subtitle2 = {'Data for year classes at Trevor'};
set3 = {'tW0T','tW1T','tW2T'}; subtitle3 = {'Data for year classes at Trevor'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Facts
F1 = 'Cost for sperm production about equa to that of egg production';
metaData.bibkey.F1 = 'Grah1973';
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3VNPR'; % Cat of Life
metaData.links.id_ITIS = '70419'; % ITIS
metaData.links.id_EoL = '619396'; % Ency of Life
metaData.links.id_Wiki = 'Littorina_littorea'; % Wikipedia
metaData.links.id_ADW = 'Littorina_littorea'; % ADW
metaData.links.id_Taxo = '35203'; % Taxonomicon
metaData.links.id_WoRMS = '140262'; % WoRMS
metaData.links.id_molluscabase = '140262'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Littorina_littorea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_nl'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Littorina_littorea}}';
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
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/species/detail/1328}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1964'; type = 'Article'; bib = [ ... 
'author = {Williams, E. E.}, ' ... 
'year = {1964}, ' ...
'title = {THE GROWTH AND DISTRIBUTION OF \emph{Littorina littorea} ({L}.) ON A ROCKY SHORE IN {W}ALES}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {33}, ' ...
'pages = {413--432}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grah1973'; type = 'Article'; bib = [ ... 
'author = {Grahame, J.}, ' ... 
'year = {1973}, ' ...
'title = {Breeding Energetics of \emph{Littorina littorea} ({L}.) ({G}astropoda: {P}rosobranchiata)}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {42}, ' ...
'pages = {391--403}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Moor1937'; type = 'Article'; bib = [ ... 
'author = {Moore, H. B.}, ' ... 
'year = {1937}, ' ...
'title = {The biology of \emph{Littorina littorea} ({L}.). {P}art 1. {G}rowth of the shell and tissues, spawning, length of life and mortality}, ' ...
'journal = {J. Mar. Biol. Assoc. UK}, ' ...
'volume = {21}, ' ...
'pages = {721--742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


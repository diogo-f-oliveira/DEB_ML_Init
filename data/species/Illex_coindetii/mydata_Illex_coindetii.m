function [data, auxData, metaData, txtData, weights] = mydata_Illex_coindetii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Illex_coindetii'; 
metaData.species_en = 'Southern shortfin squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 10];              
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

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'Wiki';   
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10-14 d; temperature is guessed';
data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Arkh1996';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'Arkh1996';
  comment.Lp = '195 to 330 mm';
data.Lpm  = 10;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'Arkh1996';
  comment.Lpm = '142 to 250 mm';
data.Li  = 35; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Wiki';
data.Lim = 32; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'Wiki';

data.Wwb  = 5.2e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'wiki';
  comment.Wwb = 'based on egg diameter of 0.8-1.3mm: pi/6*0.1^3';

data.Ni  = 8e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'Wiki';   
  temp.Ni = C2K(21); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % time since birth (d), mantle length (cm)
81.858	6.212
88.768	9.654
90.288	7.978
90.311	8.722
90.906	11.142
97.100	8.162
98.125	7.417
99.269	10.674
99.698	7.509
99.748	9.185
99.810	11.233
105.519	9.556
106.101	11.510
113.400	10.484
114.976	10.670
115.118	15.417
117.683	13.647
118.142	11.506
127.199	16.716
129.223	14.389
131.290	13.457
133.440	15.318
145.526	16.804
147.604	16.245
150.171	14.568
151.681	12.520
152.352	17.453
154.396	15.777
155.663	23.130
156.067	19.128
161.873	20.708
163.514	23.035
164.421	18.380
168.036	16.704
169.704	19.961
170.832	22.660
174.923	19.401
179.089	18.655
179.683	20.982
180.760	22.006
181.841	23.122
185.439	20.887
186.920	17.908
187.600	23.120
187.633	24.237
189.054	19.210
193.362	23.212
194.328	20.512
194.375	22.094
197.531	22.559
197.578	24.141
199.564	20.510
204.863	22.650
206.504	24.976
212.193	22.647
215.379	24.136
217.384	21.156
273.109	28.772
286.769	30.350];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1996';
comment.tL_f = 'Data for females from Western Sahara)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
66.931	5.558
72.158	6.132
81.059	6.138
84.699	7.757
88.384	6.428
90.441	8.902
95.180	7.098
105.101	8.911
107.174	10.339
109.774	11.482
111.879	10.818
118.692	10.346
123.923	10.635
127.035	12.634
129.611	15.394
132.208	16.822
132.228	15.491
132.253	13.779
132.713	18.059
133.868	10.831
136.972	13.306
137.480	14.353
145.311	15.880
151.578	16.930
152.133	14.838
154.240	13.983
159.965	16.269
160.004	13.606
169.399	15.609
169.894	17.512
171.443	18.940
173.041	17.134
179.864	15.997
185.576	19.139
195.536	18.289
233.725	20.406];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1996';
comment.tL_m = 'Data for males from Western Sahara)'; 


% time-weight data
data.tWw_f = [ ... % time since birth (d), wet weight (g)
89.540	14.685
89.554	36.602
93.733	21.229
97.405	32.161
97.920	19.007
98.447	25.578
105.255	27.720
112.066	34.246
115.742	51.753
115.755	71.479
116.247	23.257
125.205	110.862
134.085	80.113
145.628	117.288
146.127	80.025
147.692	71.246
150.295	49.309
150.340	117.254
152.966	130.386
154.627	268.456
158.218	154.457
159.844	239.924
160.379	257.455
161.346	134.708
165.548	154.403
168.733	222.325
170.294	206.971
171.837	165.316
171.939	320.932
177.594	160.891
179.262	309.919
179.303	373.481
182.364	250.719
186.078	325.212
187.538	156.434
188.717	358.070
191.261	244.078
193.418	340.501
193.429	358.035
194.956	290.079
197.011	230.886
197.621	362.388
201.283	357.978
204.370	274.668
204.916	309.732
204.917	309.732
213.276	283.370
215.412	346.916
217.423	219.778
272.165	666.501
287.369	697.075];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Arkh1996';
comment.tWw_f = 'Data for females from Western Sahara)'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
68.530	5.861
82.760	8.344
89.044	30.220
91.697	21.582
92.246	10.724
102.760	26.170
105.932	21.891
107.497	30.621
109.057	41.524
110.677	21.994
111.148	50.265
122.254	33.115
123.227	74.441
127.899	111.499
130.441	159.380
130.535	111.556
133.754	83.365
134.719	129.039
135.889	70.368
135.945	42.109
138.534	66.078
142.065	146.590
149.943	161.978
152.743	79.430
154.847	81.650
158.435	133.902
159.429	164.358
168.439	140.641
170.294	268.942
170.929	214.608
173.163	151.613
179.498	147.403
185.052	271.437
195.052	280.350
233.475	313.794];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Arkh1996';
comment.tWw_m = 'Data for males from Western Sahara)'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 10 * weights.Wwb;
weights.Lp = 10 * weights.Lp;
weights.ab = 0 * weights.ab;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3PGGX'; % Cat of Life
metaData.links.id_ITIS = '82523'; % ITIS
metaData.links.id_EoL = '451353'; % Ency of Life
metaData.links.id_Wiki = 'Illex_coindetii'; % Wikipedia
metaData.links.id_ADW = 'Illex_coindetii'; % ADW
metaData.links.id_Taxo = '158098'; % Taxonomicon
metaData.links.id_WoRMS = '140621'; % WoRMS
metaData.links.id_molluscabase = '140621'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Illex_coindetii}}';
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
bibkey = 'Arkh1996'; type = 'Article'; bib = [ ... 
'author = {Alexander Arkhipkin}, ' ... 
'year = {1996}, ' ...
'title = {GEOGRAPHICAL VARIATION IN GROWTH AND MATURATION OF THE SQUID \emph{Illex_coindetii} ({O}EGOPSIDA, {O}MMASTREPHIDAE) OFF THE {N}ORTH-{W}EST {A}FRICAN COAST}, ' ...
'journal = {Mar. biol. Ass. U.K.}, ' ...
'volume = {76}, ' ...
'pages = {1091-1106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Illex-coindetii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


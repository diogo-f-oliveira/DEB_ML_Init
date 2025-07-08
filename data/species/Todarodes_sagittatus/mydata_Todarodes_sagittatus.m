function [data, auxData, metaData, txtData, weights] = mydata_Todarodes_sagittatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Todarodes_sagittatus'; 
metaData.species_en = 'European flying squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ArkhLapt1999';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.6;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'ArkhLapt1999';
  comment.Lp = '195 to 330 mm';
data.Lpm  = 20;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'ArkhLapt1999';
  comment.Lpm = '142 to 250 mm';
data.Li  = 75; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Wiki';
data.Lim = 64; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'Wiki';

data.Wwb  = 1e-3; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'LordColl2001';
  comment.Wwb = 'based on egg diameter of 0.9-1.4 mm for Illex_coindetii: pi/6*0.125^3';

data.Ni  = 5e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'LordColl2001';   
  temp.Ni = C2K(21); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % time since birth (d), mantle length (cm)
106.837	9.628
107.495	10.755
108.842	11.178
111.570	10.052
111.585	9.207
113.585	11.039
115.650	9.068
120.329	12.733
120.336	12.310
120.355	11.183
121.037	10.902
127.089	13.440
128.474	11.610
132.568	9.781
135.906	12.599
136.576	13.022
137.204	15.980
138.644	10.910
141.272	15.700
144.042	12.039
146.713	14.294
146.727	13.449
150.113	13.451
152.836	12.607
156.799	18.524
166.931	20.078
172.961	23.884
174.423	17.547
175.079	18.815
181.095	23.465
182.406	26.001
182.459	22.903
183.899	17.833
184.560	18.819
186.453	26.989
186.482	25.299
186.501	24.172
187.822	26.145
191.940	22.907
191.952	22.203
191.999	19.386
193.275	24.034
193.964	23.331
194.024	19.809
194.660	22.204
195.912	28.261
197.312	25.586
197.925	29.389
200.014	26.009
200.033	24.883
201.346	27.278
202.677	28.687
202.746	24.602
204.675	30.659
204.756	25.871
204.785	24.181
212.170	27.987
212.260	22.635
214.235	26.016
214.933	24.749
216.314	23.200
216.345	21.369
216.381	19.257
216.951	25.595
219.047	21.793
219.671	24.892
220.317	26.723
220.370	23.625
220.396	22.075
222.330	27.851
222.924	32.781
224.345	28.838
224.395	25.880
224.424	24.190
226.338	31.092
230.430	29.404
231.835	26.447
232.474	28.701
234.441	32.504
234.529	27.293
242.624	29.128
245.941	33.214
247.372	28.708
247.398	27.158
250.825	24.766
255.510	28.007
256.819	30.684
257.578	25.896
258.207	28.713
260.148	34.066
261.545	31.531];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhLapt1999';
comment.tL_f = 'Data for females from Western Sahara'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
84.327	7.870
95.181	9.441
110.353	6.743
117.702	10.021
118.393	9.879
121.046	11.446
127.196	11.449
164.708	12.890
173.110	22.289
180.060	20.015
182.677	22.294
184.676	23.291
188.144	22.296
192.266	21.871
194.228	23.580
196.395	21.304
197.820	20.166
200.313	24.864
201.135	22.160
202.589	20.453
202.626	19.741
207.968	22.163
212.642	24.301
214.765	22.878
216.706	25.015
217.521	22.453
220.748	26.155
220.814	24.874
226.971	24.735
229.858	21.747
231.319	19.897];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhLapt1999';
comment.tL_m = 'Data for males from Western Sahara'; 


% time-weight data
data.tWw_f = [ ... % time since birth (d), wet weight (g)
105.894	14.966
108.609	15.024
109.976	27.773
111.326	18.261
114.041	18.319
116.077	18.362
116.763	27.917
122.195	31.213
123.546	21.701
123.567	50.323
129.657	25.010
129.681	56.813
131.684	12.332
137.111	9.267
137.123	25.169
137.814	41.084
141.917	82.514
142.546	15.743
143.922	41.214
146.654	63.533
149.357	47.690
150.698	25.457
156.214	140.061
166.460	226.144
172.629	305.780
175.238	165.906
176.632	213.639
181.455	309.147
181.467	325.049
182.102	267.818
183.453	258.306
184.743	169.288
185.388	124.779
186.307	442.819
186.897	325.164
187.523	255.213
191.648	325.265
192.286	271.214
192.931	226.705
193.540	134.492
193.665	299.866
194.481	481.155
194.912	153.602
195.689	284.008
195.713	315.810
197.805	388.999
198.548	474.881
199.215	458.994
201.110	271.402
202.587	430.443
204.602	401.864
205.515	713.544
206.036	503.662
210.022	389.258
211.483	526.038
212.667	297.088
214.087	379.804
215.265	141.313
216.056	290.800
216.709	255.831
216.726	278.093
217.469	363.974
218.723	227.252
219.493	348.116
220.069	211.380
220.824	313.162
220.937	462.635
222.568	825.213
222.959	443.596
223.695	519.937
224.355	494.509
224.465	640.801
226.326	408.685
226.338	424.587
226.916	291.030
227.991	815.788
228.446	520.038
230.389	396.051
231.169	529.636
231.778	437.423
234.119	841.359
235.157	418.413
235.977	606.063
236.541	453.425
244.758	549.005
248.818	533.190
248.907	650.860
249.727	838.510
251.339	275.647
252.896	539.637
256.306	561.971
257.093	705.097
258.302	507.950
259.587	412.571
261.921	806.966
262.494	667.049];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ArkhLapt1999';
comment.tWw_f = 'Data for females from Western Sahara'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
83.576	9.541
95.215	6.361
110.973	9.541
118.513	12.721
119.222	28.622
121.937	12.721
124.031	38.163
162.367	25.442
174.263	190.813
176.386	235.336
183.308	283.039
188.952	391.166
190.837	279.859
194.228	257.597
196.350	302.120
198.284	222.615
201.733	238.516
201.815	292.579
203.662	155.830
203.831	267.138
206.017	353.003
209.248	225.795
214.163	305.300
214.250	362.544
218.491	448.410
220.333	308.481
220.502	419.788
222.673	496.113
228.644	368.905
228.673	387.986
230.461	213.074
232.034	346.643];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ArkhLapt1999';
comment.tWw_m = 'Data for males from Western Sahara'; 

%% set weights for all real data
weights = setweights(data, []);

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
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7CG55'; % Cat of Life
metaData.links.id_ITIS = '205726'; % ITIS
metaData.links.id_EoL = '586266'; % Ency of Life
metaData.links.id_Wiki = 'Todarodes_sagittatus'; % Wikipedia
metaData.links.id_ADW = 'Todarodes_sagittatus'; % ADW
metaData.links.id_Taxo = '40280'; % Taxonomicon
metaData.links.id_WoRMS = '140624'; % WoRMS
metaData.links.id_molluscabase = '140624'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Todarodes_sagittatus}}';
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
bibkey = 'ArkhLapt1999'; type = 'Article'; bib = [ ... 
'author = {Alexander Arkhipkin and Vladimir Laptikhovsky and Alexander Golub}, ' ... 
'year = {1999}, ' ...
'title = {Population structure and growth of the squid \emph{Todarodes sagittatus} ({C}ephalopoda: {O}mmastrephidae) in north-west {A}frican waters}, ' ...
'journal = {J.Mar. Biol. Ass. U.K.}, ' ...
'volume = {79}, ' ...
'pages = {467-477}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LordColl2001'; type = 'Article'; bib = [ ... 
'author = {Colm Lordan and Martin A. Collins and Linda N. Key and Eoin D. Browne}, ' ... 
'year = {2001}, ' ...
'title = {The biology of the ommastrephid squid \emph{Todarodes sagittatus} in the north-east {A}tlantic}, ' ...
'journal = {J.Mar. Biol. Ass. U.K.}, ' ...
'volume = {81}, ' ...
'pages = {299-306}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Todarodes-sagittatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Uroteuthis_edulis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Uroteuthis_edulis'; 
metaData.species_en = 'Swordtip squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
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

data.ab = 21;   units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'NatsNaka1988';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'NatsNaka1988';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.28;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'PangChen2020';
data.Lp  = 12.2;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'PangChen2020';
data.Li  = 27.66;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'NatsNaka1988';
data.Lim = 46.95; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'NatsNaka1988';

data.Wwi  = 443; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death'; bibkey.Wwi  = {'NatsNaka1988','sealifebase'};
  comment.Wwi = 'based on 0.2960*Li^2.202, see F1';

data.Ni  = 43*443; units.Ni  = '#';      label.Ni  = 'cum reprod at death at ML 12 cm';  bibkey.Ni  = 'PangChen2020';   
  temp.Ni = C2K(20); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on a relative fecumdity of 43/g';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
145.010	5.376
149.642	6.372
171.817	9.455
173.641	9.003
187.524	11.631
188.960	13.260
189.445	13.984
200.883	12.358
201.405	14.168
205.499	12.902
207.366	13.717
211.504	13.718
214.040	20.597
218.873	14.082
219.762	13.177
220.446	19.693
220.968	21.503
222.517	13.087
223.042	14.988
223.083	16.165
223.909	13.450
224.841	13.812
225.078	20.690
225.276	13.088
226.208	13.450
227.227	16.347
229.122	17.976
229.961	15.623
231.690	25.759
231.753	14.266
232.713	15.443
236.028	18.249
238.672	14.902
238.821	19.245
238.934	22.503
240.464	13.544
241.326	25.219
241.839	26.758
241.884	14.721
241.924	15.898
242.062	19.880
242.174	23.138
242.265	25.762
242.409	16.622
242.674	24.314
243.817	17.437
246.575	17.437
246.697	20.967
246.878	26.216
247.119	19.881
248.736	26.759
249.477	21.601
251.711	19.701
252.996	16.987
253.603	21.240
254.091	22.055
254.728	27.213
255.867	20.245
255.902	21.241
256.246	17.892
256.302	19.521
256.399	22.327
256.959	25.223
257.713	20.427
257.878	25.223
259.440	17.169
259.480	18.346
259.767	26.672
259.999	20.065
260.165	24.862
260.289	28.482
260.556	22.871
260.959	21.242
260.978	21.785
261.798	18.889
263.815	24.048
263.843	24.863
263.868	25.587
264.103	19.071
265.541	20.791
266.423	19.705
266.514	22.329
267.956	24.140
268.732	19.977
270.571	19.977
270.618	21.335
271.797	15.543
272.625	26.222
273.354	20.702
274.368	23.417
275.994	17.264
276.617	21.970
276.642	22.694
276.729	25.228
277.868	18.260
278.753	17.265
279.497	25.500
279.925	24.595
287.319	25.683
289.659	26.860
291.236	19.259
291.473	26.137
300.180	25.324
300.409	18.627
300.459	20.075
300.935	20.528
304.747	24.420
304.950	30.303
310.199	22.521
311.040	20.259
312.588	25.146
315.754	23.609
318.550	24.695
321.696	22.615
321.855	27.230
322.256	25.511
327.326	25.874
333.021	31.034
341.228	29.045
341.660	28.231
343.987	29.046];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NatsNaka1988';
comment.tL_f = 'data for females, hathed in autumn'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
140.866	5.194
142.792	7.728
148.225	5.286
154.280	7.550
170.307	5.654
170.525	11.988
179.227	10.995
185.241	12.083
188.885	11.088
188.922	12.174
199.923	11.181
200.523	15.254
200.542	15.797
201.824	12.992
204.999	11.726
206.015	14.531
207.341	12.993
207.373	13.898
208.392	16.794
212.846	12.633
214.244	13.176
215.248	15.620
217.106	16.163
219.286	12.725
220.797	16.526
221.153	13.540
221.222	15.531
223.359	10.825
223.555	16.527
224.065	17.975
225.341	14.989
226.974	9.016
227.827	20.419
229.560	17.343
230.396	14.899
233.123	13.995
235.294	10.285
237.010	20.059
238.284	16.983
238.315	17.888
239.100	13.997
239.128	14.811
239.156	15.626
241.049	17.165
244.755	17.980
245.155	16.261
247.548	18.976
248.089	21.329
248.329	28.298
249.628	12.642
250.219	16.443
250.978	25.131
251.054	14.000
251.126	16.081
251.357	22.778
251.657	31.466
252.023	28.751
252.136	18.706
252.204	34.000
252.518	16.443
252.943	15.448
254.244	26.489
255.464	21.874
255.483	22.417
255.573	25.042
256.161	28.752
256.421	22.960
256.965	25.404
257.206	19.069
257.294	21.603
257.336	36.173
257.638	18.255
257.838	24.047
257.888	25.495
258.066	17.350
260.021	20.699
260.850	18.075
260.958	34.545
261.244	16.174
264.538	18.347
265.867	16.899
265.898	17.804
265.979	20.157
267.683	29.569
268.014	39.162
268.056	27.036
268.216	18.348
268.306	20.972
268.397	23.597
268.409	23.959
269.742	22.602
269.757	23.054
272.344	18.077
272.656	27.127
273.936	24.232
273.980	25.499
274.006	12.919
275.641	20.341
276.798	27.219
277.971	21.246
278.476	35.907
278.655	27.762
279.525	26.314
281.955	30.116
281.983	30.930
282.262	25.682
282.817	41.790
283.415	32.469
283.456	33.646
283.518	35.456
283.682	26.859
286.084	29.846
287.491	30.660
287.569	32.923
288.607	36.362
289.956	22.154
290.502	37.991
291.451	25.503
291.588	29.485
291.870	24.327
292.423	40.345
292.765	23.603
293.071	32.472
294.581	36.273
294.612	37.178
294.684	39.259
296.680	30.482
297.525	28.310
300.840	31.116
300.993	35.551
301.894	35.008
301.990	37.813
302.197	30.483
302.263	32.384
302.891	37.271
303.151	31.479
304.062	31.208
304.821	39.896
305.666	37.724
308.453	25.236
308.972	26.955
310.814	40.350
311.379	43.427
312.518	36.459
316.162	35.464
323.128	37.457
323.522	35.556
324.382	33.837
326.536	42.978
328.292	27.232
331.478	39.631
332.767	37.007
333.671	36.554
334.450	32.482
351.277	40.450];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NatsNaka1988';
comment.tL_m = 'data for males, hathed in autumn'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Lb = 10 * weights.Lb; 
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
F1 = 'length-weight: Ww in g = 0.2960*(ML in cm)^2.202';
metaData.bibkey.F1 = 'seabaselife'; 
F2 = 'Programmed death, not by ageing';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DZJX'; % Cat of Life
metaData.links.id_ITIS = '556657'; % ITIS
metaData.links.id_EoL = '489645'; % Ency of Life
metaData.links.id_Wiki = 'Uroteuthis'; % Wikipedia
metaData.links.id_ADW = 'Uroteuthis_edulis'; % ADW
metaData.links.id_Taxo = '157889'; % Taxonomicon
metaData.links.id_WoRMS = '574518'; % WoRMS
metaData.links.id_molluscabase = '574518'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uroteuthis_edulis}}';
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
bibkey = 'NatsNaka1988'; type = 'article'; bib = [ ... 
'author = {Yutaka Natsukari and Tatsuya Nakanose and Kazunari Oda}, ' ... 
'year = {1988}, ' ...
'title = {Age and growth of loliginid squid \emph{Photololigo edulis} ({H}oyle, 1885)}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {116}, ' ...
'pages = {177-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PangChen2020'; type = 'article'; bib = [ ... 
'doi = {10.1007/s12562-020-01465-7}, ' ...
'author = {Yumeng Pang and Chih?Shin Chen and Yoko Iwata}, ' ... 
'year = {2020}, ' ...
'title = {Variations in female swordtip squid \emph{Uroteuthis edulis} life history traits between southern {J}apan and northern {T}aiwan ({N}orthwestern {P}acific)}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {86}, ' ...
'pages = {1005-1017}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Uroteuthis-edulis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Doryteuthis_sanpaulensis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Doryteuthis_sanpaulensis'; 
metaData.species_en = 'Sao Paulo squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 19];

%% set data
% zero-variate data

data.ab= 14; units.ab = 'd'; label.ab = 'age at birth';           bibkey.ab = 'VidaMari2013';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'normal development between 16-19 C';
data.am = 296;   units.am = 'd';    label.am = 'life span';      bibkey.am = 'VidaMari2013';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 327;   units.amm = 'd';    label.amm = 'life span for males';      bibkey.amm = 'VidaMari2013';   
  temp.amm = C2K(16); units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lb  = 0.155; units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';         bibkey.Lb  = 'VidaMari2013';
  comment.Lb = '0.14-0.17 cm';
data.Lp  = 6;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = {'VazdRoss2019','VidaMari2013'};
data.Li  = 16;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'VidaMari2013';
data.Lim = 23; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'VidaMari2013';

data.Wwi = 92;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on LW data for Doryteuthis_pealeii at Li';
data.Wwim = 240;   units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'guess';
  comment.Wwim = 'based on LW data for Doryteuthis_pealeii at Lim';

data.Ni  =  90194; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'VidaMari2013';   
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
56.077	0.935
84.438	1.465
85.727	1.744
92.173	1.311
97.974	1.962
103.775	1.932
106.996	1.622
106.997	2.552
106.998	2.738
108.287	2.335
111.510	2.025
112.155	1.746
112.156	2.212
113.444	2.894
114.088	2.801
115.378	1.530
116.667	3.421
117.311	2.863
117.956	3.173
118.600	4.135
118.601	2.615
121.178	2.770
121.179	1.871
123.112	2.337
123.755	3.949
123.756	3.298
123.757	2.616
123.758	2.120
123.759	1.840
123.760	1.716
126.335	2.523
126.980	4.290
126.981	2.957
126.982	2.306
127.624	3.112
128.913	1.934
130.847	3.795
131.492	2.151
132.136	4.477
133.425	2.989
135.359	3.547
136.648	2.803
136.649	2.276
137.293	3.392
137.294	5.004
138.582	3.795
138.583	3.888
139.227	3.454
139.871	4.416
142.448	3.020
142.449	2.710
143.094	5.315
143.738	4.354
145.028	3.579
145.672	3.672
146.317	4.943
146.961	3.982
147.605	5.253
147.606	4.726
148.894	3.455
148.895	2.773
149.540	4.882
149.541	3.207
150.829	5.130
151.473	4.634
151.474	3.610
152.118	4.324
152.762	4.138
153.407	3.890
155.985	3.766
155.986	2.960
156.630	4.479
157.274	6.495
157.275	5.564
158.564	4.293
158.565	3.208
159.208	4.014
159.853	6.805
159.854	4.572
159.855	4.789
161.786	5.906
161.787	5.503
163.076	4.046
164.365	6.588
165.009	4.263
165.654	5.596
166.298	4.449
167.587	6.154
168.232	4.077
169.521	5.441
169.522	3.674
171.455	6.062
171.456	4.604
172.097	6.899
172.098	7.178
172.099	4.884
172.744	3.953
173.389	6.620
175.967	4.450
176.610	6.341
176.611	5.597
176.612	5.132
177.256	4.698
177.257	4.357
178.545	6.962
180.479	7.303
181.123	5.287
184.346	8.792
184.991	5.691
185.635	7.892
187.568	9.567
187.569	5.567
188.214	5.040
188.858	7.056
189.503	6.715
190.147	7.335
190.792	6.281
192.081	8.575
192.082	5.878
192.083	5.350
192.726	8.141
192.727	6.932
193.370	6.684
194.015	7.676
194.016	5.878
195.304	8.607
195.305	8.327
196.593	7.893
199.171	6.560
199.816	7.491
200.460	8.917
201.750	5.723
203.683	6.375
204.328	8.297
204.972	6.964
205.617	7.770
205.618	6.065
206.262	7.460
206.906	8.701
207.551	8.360
209.484	6.778
210.129	7.368
211.418	9.848
211.419	8.794
211.420	7.988
213.352	9.228
213.996	8.143
213.997	6.996
215.285	8.546
215.930	10.376
217.219	7.120
217.864	7.678
221.087	8.392
221.088	6.965
221.730	10.283
221.731	9.601
223.020	8.888
226.243	10.842
227.532	10.656
227.533	7.338
228.821	8.516
228.822	8.765
230.755	10.253
230.756	8.083
235.912	7.742
237.201	9.261
239.134	9.851
239.135	9.572
239.779	6.998
244.936	9.138
245.580	7.929
245.581	7.402
247.514	9.913
251.381	11.371
252.670	8.581
252.671	8.022
253.959	10.255
255.893	8.426
258.471	12.209
258.472	10.007
260.405	10.504
261.050	8.395
262.338	9.760
262.339	12.395
262.983	11.031
267.495	12.303
268.140	11.714
268.785	10.567
274.586	9.513
275.875	11.404
278.453	9.854
282.320	10.661
290.700	9.421
295.856	10.321
296.501	12.677
297.790	12.026
301.657	9.763
304.880	12.430
305.525	12.678
306.814	11.469
315.193	10.571
342.910	12.682];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VazdRoss2019';
comment.tL = 'Sexes combined'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.am = 50 * weights.am;
weights.amm = 50 * weights.amm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and h_a only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37FVL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '592757'; % Ency of Life
metaData.links.id_Wiki = 'Doryteuthis'; % Wikipedia
metaData.links.id_ADW = 'Loligo_sanpaulensis'; % ADW
metaData.links.id_Taxo = '3954929'; % Taxonomicon
metaData.links.id_WoRMS = '574545'; % WoRMS
metaData.links.id_molluscabase = '574545'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Doryteuthis}}';
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
bibkey = 'VazdRoss2019'; type = 'techreport'; bib = [ ... 
'author = {Andr\''{e} Martins Vaz-dos-Santos and Carmen L\''{u}cia Del Bianco Rossi-Wongtschowski}, '...
'year = {2019}, ' ...
'title = {Growth in fisheries resources from the {S}outhwestern {A}tlantic}, ' ...
'institution = {Instituto Oceanogr\''{a}fico – USP S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VidaMari2013'; type = 'incollection'; bib = [ ... 
'booktitle = {Advances in Squid Biology, Ecology and Fisheries}, ' ...
'editor = {Rui Rosa and Ron O''Dor and Graham Pierce}, ' ...
'author = {Erica A. G. Vidal and Jos\''{e} Eduardo A. R. Marian and Rodrigo S. Martins}, '...
'year = {2013}, ' ...
'title = {\emph{Doryteuthis sanpaulensis}, S\~{a}o Paulo Squid}, ' ...
'chapter = {9, Part I}, ' ...
'publisher = {Nova Science Publishers, Inc. }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


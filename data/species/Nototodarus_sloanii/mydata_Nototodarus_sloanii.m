function [data, auxData, metaData, txtData, weights] = mydata_Nototodarus_sloanii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Nototodarus_sloanii'; 
metaData.species_en = 'New Zealand arrow squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 10]; 

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'UozuOhar1993';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';  bibkey.Lp  = 'UozuOhar1993';
  comment.Lp = '195 to 330 mm';
data.Li  = 42; units.Li  = 'cm'; label.Li  = 'mantle length at death'; bibkey.Li  = 'sealifebase';

data.Wwb  = 2.7e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 1800;   units.Wwi = 'g';   label.Wwi = 'wet weight at death';     bibkey.Wwi = 'sealifebase';

data.Ni  = 3e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'guess';   
  temp.Ni = C2K(16); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap=0.95, as found for Sthenoteuthis_pteropus';
  
% uni-variate data
% time-length 
data.tL_f = [ ... % time since birth (d), mantle length (cm)
86.234	1.312
88.964	1.732
92.245	2.321
93.854	1.983
96.564	1.982
100.933	2.654
102.534	2.148
103.647	2.737
106.328	2.146
106.341	2.399
108.027	3.662
109.071	2.819
111.829	3.829
115.029	2.732
115.069	3.575
118.264	2.394
118.855	3.405
122.718	4.836
124.797	2.981
126.447	3.486
129.185	4.075
131.981	5.843
133.526	4.157
141.120	15.530
150.199	12.746
150.875	15.526
156.760	13.923
157.363	15.186
158.953	14.427
159.377	11.983
161.524	11.561
163.851	14.847
165.347	12.149
165.534	16.026
165.938	13.160
166.181	18.216
168.899	18.384
169.380	17.120
170.040	19.563
170.921	15.349
171.165	20.405
173.850	19.899
174.145	14.758
174.638	13.747
176.075	21.077
176.932	16.358
178.933	12.902
179.055	15.430
179.528	13.997
180.612	13.997
181.268	16.356
181.668	13.407
182.246	14.165
184.694	19.978
184.790	10.709
184.985	14.754
186.393	21.494
187.209	15.932
187.242	16.606
187.404	19.977
187.469	21.326
187.824	17.449
189.184	23.179
191.292	21.914
191.440	13.740
191.460	14.161
191.639	17.869
191.696	19.048
191.736	19.891
191.899	23.262
194.127	24.525
194.466	20.311
194.814	16.266
195.477	18.794
195.648	22.333
196.927	26.378
197.217	21.153
197.404	25.029
198.313	21.405
198.782	19.888
201.577	21.657
202.046	20.140
202.401	16.263
202.730	23.089
203.394	25.617
205.152	17.105
205.331	20.812
205.824	19.801
209.133	20.979
209.500	17.356
209.520	17.777
209.707	21.653
210.824	22.327
211.110	17.018
211.786	19.798
212.029	24.854
213.513	21.904
213.684	25.444
215.750	23.336
217.145	18.532
217.719	19.206
218.966	22.576
219.055	24.430
222.023	18.530
222.092	19.963
222.890	25.271
226.578	23.079
226.639	24.343
232.055	24.256
233.317	27.963
234.018	31.250
234.631	21.474
238.705	27.287
238.942	20.967
243.167	29.898
243.299	21.386
247.474	29.306
247.696	22.648
248.359	25.176
248.627	30.738
252.785	27.028
253.095	22.225
254.605	31.072
257.076	26.100
258.787	27.868
260.716	22.896
262.654	29.384
268.632	29.718
268.758	32.331
271.913	30.307
275.849	33.255
277.231	28.198
278.356	29.040
279.105	33.337
282.724	29.712
285.055	33.082
286.534	30.048
288.784	31.732
300.210	32.654
304.073	34.085
304.692	35.686
305.413	39.394
307.757	31.809
320.540	38.376
322.012	35.173];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'UozuOhar1993';
comment.tL_f = 'Data for females, autumn group)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
141.487	11.907
145.289	12.074
149.030	10.977
152.428	14.009
155.090	12.996
155.729	15.019
156.569	9.962
157.465	17.293
157.771	12.405
161.821	17.713
162.799	15.521
164.886	13.835
167.241	17.710
168.635	12.906
168.786	16.024
169.246	14.339
169.817	14.928
169.910	16.867
170.493	17.709
172.927	11.978
172.992	13.326
173.016	13.832
173.260	18.888
175.354	17.370
175.811	15.600
176.503	18.718
177.563	18.212
177.930	14.588
178.040	16.863
178.769	20.739
179.964	11.806
180.042	13.407
181.394	18.969
181.574	11.468
182.886	16.187
184.047	17.788
184.731	20.737
185.506	14.332
186.178	17.028
187.035	12.309
187.743	15.764
188.649	12.055
189.499	18.459
189.576	20.061
190.167	21.072
190.616	19.133
191.411	13.150
193.228	17.110
193.354	19.722
194.381	18.542
194.797	15.929
194.952	19.131
196.267	23.934
197.446	14.664
197.865	23.344
198.232	19.720
198.317	21.489
199.446	22.416
200.660	25.112
200.836	17.528
200.970	20.309
201.301	15.926
201.949	18.117
202.653	21.488
203.349	24.690
203.461	15.757
203.636	19.380
203.822	23.257
204.401	24.015
204.509	14.998
206.634	25.362
206.944	20.559
207.087	23.508
207.308	16.851
208.093	21.907
211.195	18.787
211.940	23.001
213.623	24.180
214.471	19.292
214.496	19.797
216.268	22.830
216.353	24.600
216.700	20.555
216.725	21.060
220.090	23.418
220.539	21.480
224.386	22.574
225.025	24.596
227.043	21.477
227.682	23.500
229.385	25.100
229.450	26.448
230.307	21.729
231.574	25.520
233.074	22.907
234.744	23.834
237.418	23.074
237.923	22.315
238.437	21.725
239.190	26.107
239.292	28.214
240.711	23.915
240.991	29.730
242.826	22.819
243.118	28.886
246.122	23.745
247.878	26.440
250.079	27.114
250.229	30.232
250.458	23.743
250.572	26.102
252.105	24.163
252.222	26.607
253.889	27.449
254.553	29.977
257.837	30.650
260.959	27.952
264.110	25.844
264.487	33.681
265.943	30.141
268.571	28.454
270.490	34.521
275.153	30.053
275.234	31.738
277.826	29.293
280.674	32.157
284.799	27.773
285.511	31.312
287.781	33.418
289.770	29.709
290.777	28.108
297.317	28.863
298.066	33.161
299.098	32.065
300.275	34.003
304.069	34.001
311.698	34.841
312.179	33.576];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'UozuOhar1993';
comment.tL_m = 'Data for males, autumn group)'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Ni = 0 * weights.Ni;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '47Z3V'; % Cat of Life
metaData.links.id_ITIS = '556164'; % ITIS
metaData.links.id_EoL = '46475800'; % Ency of Life
metaData.links.id_Wiki = 'Nototodarus_sloanii'; % Wikipedia
metaData.links.id_ADW = 'Nototodarus_sloanii'; % ADW
metaData.links.id_Taxo = '158106'; % Taxonomicon
metaData.links.id_WoRMS = '342378'; % WoRMS
metaData.links.id_molluscabase = '342378'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nototodarus_sloanii}}';
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
bibkey = 'UozuOhar1993'; type = 'Article'; bib = [ ... 
'author = {Yuji Uozumi and Hiroe Ohara}, ' ... 
'year = {1993}, ' ...
'title = {Age and Growth of \emph{Nototodarus sloanii} ({C}ephalopoda: {O}egopsida) Based on Daily Increment Counts in Statoliths}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {59(9)}, ' ...
'pages = {1469-1477}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Nototodarus-sloanii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


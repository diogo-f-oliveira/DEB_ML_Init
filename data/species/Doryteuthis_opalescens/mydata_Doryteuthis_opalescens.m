function [data, auxData, metaData, txtData, weights] = mydata_Doryteuthis_opalescens

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Doryteuthis_opalescens'; 
metaData.species_en = 'Opalescent inshore squid'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 26]; 

%% set data
% zero-variate data

data.am = 220;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ButlFull1999';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.am_m = 245;   units.am_m = 'd';  label.am_m = 'life span for male';      bibkey.am_m = 'ButlFull1999';   
  temp.am_m = C2K(15); units.temp.am_m = 'K'; label.temp.am_m = 'temperature'; 

data.Lb  = 0.3; units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';         bibkey.Lb  = 'guess';
  comment.Lb = 'based on Doryteuthis_pealeii'; 
data.Lp  = 8.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'ButlFull1999';
data.Li  = 12;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'ButlFull1999';
data.Li_m = 14; units.Li_m = 'cm';label.Li_m  = 'mantle length at death for male'; bibkey.Li_m  = 'ButlFull1999';

data.Wwim  = 86;  units.Wwim  = 'g'; label.Wwim  = 'wet weight at death';     bibkey.Wwim  = 'guess';
  comment.Wwim = 'based on Doryteuthis_pealeii'; 

data.Ni  = 300; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'ADW';   
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'Temp is guessed'; 
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
64.724	2.520
65.197	2.935
67.087	2.746
68.504	3.048
68.505	2.369
68.506	2.218
68.976	3.237
69.921	3.350
69.922	3.010
72.283	3.463
72.756	3.047
72.757	2.746
74.173	3.651
77.953	3.952
78.425	3.349
91.181	3.988
93.071	4.592
108.661	4.364
124.252	7.305
140.315	6.322
143.622	6.699
151.181	8.132
152.126	6.849
154.016	7.716
154.488	7.943
156.378	7.829
157.795	8.659
158.740	7.942
159.213	8.470
160.157	7.867
161.575	8.131
163.937	10.017
164.409	7.979
165.827	7.715
168.189	9.224
168.661	8.016
169.134	9.790
171.496	9.865
171.969	7.827
187.087	9.712
191.339	11.297
192.756	8.429
193.228	8.806
193.229	10.202
193.701	9.410
193.702	9.032
195.118	11.032
197.480	12.352
197.481	13.786
197.953	11.296
199.370	10.692
199.371	9.899
200.787	12.805
203.150	10.880
204.567	11.106
204.568	11.446
204.569	12.201
205.512	10.917
206.457	12.351
206.928	9.446
206.929	9.068
207.402	11.936
208.346	13.710
209.764	12.540
210.236	12.992
211.181	13.634
211.654	9.747
219.685	11.218
220.157	8.463
221.575	9.406
223.465	11.481
224.882	10.123
230.551	12.273
233.386	13.442
234.803	9.027
235.748	12.121
239.055	12.800];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ButlFull1999';
comment.tL_f = 'Temp is guessed; data for females'; 
%
data.tL_m = [ ... % time since birth (month), mantle length (cm)
163.465	11.111
170.551	8.431
173.386	8.771
175.276	8.431
177.638	9.978
178.110	8.732
180.472	9.449
186.142	8.769
187.559	9.410
188.031	11.297
190.864	10.240
190.865	12.165
190.866	12.278
191.338	11.372
191.339	11.599
192.283	14.089
195.591	11.975
197.953	8.994
198.425	11.183
198.898	11.484
199.370	11.975
199.843	10.201
201.732	11.748
202.205	13.182
203.622	9.672
203.623	10.352
204.567	8.880
205.039	11.748
206.457	11.446
207.402	14.502
207.403	11.936
208.819	10.993
209.290	8.615
209.291	11.823
212.126	12.200
213.071	11.747
216.376	8.765
216.377	9.143
216.378	13.331
220.157	13.029
221.102	12.236
221.575	13.972
222.992	11.972
223.937	12.877
224.409	13.217
226.299	14.085
227.716	11.669
227.717	11.896
228.661	15.443
229.134	11.028
229.606	15.179
230.079	14.084
233.386	11.669
234.331	13.065
240.945	13.630
241.417	11.705
244.252	14.158];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ButlFull1999';
comment.tL_m = 'Temp is guessed; data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5*weights.tL_f;
weights.tL_m = 5*weights.tL_m;
weights.am = 3*weights.am;
weights.am_m = 3*weights.am_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by h_a only';
D2 = 'Reproductive output is assumed to correspond to am = 1 yr, the most frequent max age';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37FV5'; % Cat of Life
metaData.links.id_ITIS = '82371'; % ITIS
metaData.links.id_EoL = '448838'; % Ency of Life
metaData.links.id_Wiki = 'Doryteuthis_opalescens'; % Wikipedia
metaData.links.id_ADW = 'Doryteuthis_opalescens'; % ADW
metaData.links.id_Taxo = '3954925'; % Taxonomicon
metaData.links.id_WoRMS = '410353'; % WoRMS
metaData.links.id_molluscabase = '410353'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Doryteuthis_opalescens}}';
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
bibkey = 'ButlFull1999'; type = 'Article'; bib = [ ... 
'author = {John Butler and Daniel Fuller}, ' ... 
'year = {1999}, ' ...
'title = {AGE AND GROWTH OF MARKET SQUID (\emph{Loligo opalescens}) OFF {C}ALIFORNIA DURING 1998}, ' ...
'howpublished = {\url{http://www.biolbull.org/content/141/1/189}}, ' ...
'journal = {CalCOFl Rep.}, ' ...
'volume = {40}, ' ...
'pages = {191--195}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Doryteuthis-opalescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Doryteuthis_opalescens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


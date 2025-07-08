function [data, auxData, metaData, txtData, weights] = mydata_Robsonella_huttoni

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Robsonella_huttoni'; 
metaData.species_en = 'Midget octopus'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 15]; 

%% set data
% zero-variate data

data.ab = 35;   units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'Carr2014';   
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 250;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'DonlDams2019';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'guess';
data.Li  = 4.5;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'DonlDams2019';

data.Wwb  = 1.3e-3;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'Carr2014';
  comment.Wwb = 'based on egg length of 2.5 mm, width 1 mm: pi/6*0.25*0.1^2';
data.Wwi  = 60;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'DonlDams2019';

data.Ni  = 4600; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'Carr2014';   
  temp.Ni = C2K(17);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
28.941	1.185
30.353	2.478
59.294	2.125
62.824	1.932
67.765	1.635
69.176	2.246
69.882	1.407
71.294	2.421
74.118	2.054
74.824	1.197
79.765	1.965
81.176	1.825
83.294	2.856
85.412	2.314
88.235	1.825
88.235	1.196
88.941	2.244
89.647	3.345
93.882	1.684
93.882	2.086
94.588	1.929
94.588	2.278
99.529	3.361
99.529	2.505
100.235	2.243
101.647	4.165
103.765	2.836
104.471	2.399
104.471	2.137
105.176	2.592
105.882	1.997
108.000	3.063
108.000	2.801
110.824	2.311
111.529	3.010
113.647	2.433
114.353	3.132
115.765	4.897
115.765	2.800
120.000	3.848
121.412	4.302
121.412	1.978
122.118	3.498
124.941	3.166
126.353	2.519
127.765	5.630
127.765	1.977
128.471	3.008
129.176	2.799
129.176	2.397
130.588	3.812
131.294	3.130
133.412	2.746
133.412	2.029
134.118	3.567
134.118	2.920
139.059	2.640
140.471	4.143
140.471	3.426
141.882	3.846
141.882	3.216
141.882	2.395
142.588	3.374
143.294	4.510
144.000	2.849
146.824	3.338
147.529	4.771
147.529	3.268
148.941	4.806
149.647	4.264
149.647	2.988
152.471	1.905
153.176	3.285
153.176	1.765
153.882	4.089
154.588	4.351
154.588	2.813
155.294	2.568
156.000	3.896
157.412	3.285
157.412	2.271
158.118	4.875
158.118	4.176
160.235	4.333
160.941	3.459
161.647	3.983
162.353	2.707
162.353	2.585
165.176	3.895
165.176	3.249
165.882	2.777
166.588	4.157
166.588	2.217
168.000	3.511
168.000	3.353
169.412	2.934
169.412	3.073
170.118	2.165
171.529	2.741
172.235	3.667
172.235	2.479
173.647	3.440
174.353	3.457
174.353	2.024
176.471	4.453
176.471	2.478
177.176	4.226
177.176	4.855
177.882	3.719
178.588	2.758
180.706	3.614
182.118	4.190
182.118	3.159
182.118	2.880
182.824	4.977
188.471	4.889
191.294	3.945
192.000	3.228
194.824	5.744
195.529	4.801
201.176	2.598
204.706	3.366
206.824	3.628
208.235	5.498
208.235	4.502
210.353	5.638
213.176	5.043
213.882	3.295
224.471	3.382
225.176	5.077
226.588	5.985
230.824	3.958
235.765	5.075
239.294	4.149
248.471	4.689
248.471	5.458];
n=size(data.tL,1);for i=2:n;if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DonlDams2019';
comment.tL = 'Data from different sites combined';
%
data.tWw = [ ... % time since birth (d), wet weight (g)
26.027	0.410
60.741	2.526
72.312	3.160
74.529	9.797
75.199	2.516
84.612	4.651
86.822	10.431
87.545	10.430
91.833	3.575
94.019	5.929
98.398	11.707
101.978	6.994
101.994	9.135
104.850	4.208
107.037	6.776
111.393	9.342
111.480	21.334
112.071	3.132
112.817	6.343
114.249	4.415
122.310	19.613
123.735	16.614
124.400	8.691
128.070	16.397
128.708	4.619
128.719	6.118
130.541	58.151
130.922	10.827
132.473	25.387
133.078	9.113
135.261	11.038
135.271	12.537
136.033	17.890
139.604	11.892
140.372	18.101
143.263	18.099
144.266	56.856
145.376	10.389
145.396	13.172
146.073	6.748
149.053	18.951
149.929	40.150
151.164	11.027
151.180	13.168
152.749	30.298
152.875	47.642
155.178	66.270
155.518	13.379
155.717	40.788
156.927	8.239
157.199	45.926
157.216	48.282
157.285	57.704
158.032	61.129
159.119	11.450
160.784	41.855
161.295	12.519
162.879	31.575
163.713	46.992
164.938	16.370
165.001	25.150
167.363	51.915
168.876	61.121
169.222	9.087
169.269	15.511
169.311	21.292
171.447	16.794
174.990	6.941
175.829	23.001
176.696	42.915
178.050	30.280
178.066	32.421
178.155	44.841
181.542	13.361
181.736	40.127
181.875	59.399
190.335	29.629
191.123	38.622
193.113	13.995
194.107	51.467
196.147	33.693
203.955	13.773
206.876	17.839
208.672	66.232
210.238	82.933
211.490	56.166
215.191	68.155
215.518	13.337
222.892	33.460
227.646	91.058
234.586	51.010
240.229	31.734
248.457	69.844
249.652	35.154];
n=size(data.tWw,1);for i=2:n;if data.tWw(i,1)<=data.tWw(i-1,1);data.tWw(i,1)=data.tWw(i-1,1)+1e-8;end;end
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(17);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'DonlDams2019';
comment.tWw = 'Data from different sites combined';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'End of acceleration is assumed to coincide with puberty';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Planktonic stage lasts 40-70 d';
metaData.bibkey.F2 = 'Carr2014'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7T2R3'; % Cat of Life
metaData.links.id_ITIS = '556691'; % ITIS
metaData.links.id_EoL = '591053'; % Ency of Life
metaData.links.id_Wiki = 'Robsonella'; % Wikipedia
metaData.links.id_ADW = 'Robsonella_huttoni'; % ADW
metaData.links.id_Taxo = '158340'; % Taxonomicon
metaData.links.id_WoRMS = '342385'; % WoRMS
metaData.links.id_molluscabase = '342385'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus}}';
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
bibkey = 'DonlDams2019'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10452-019-09719-y}, ' ...
'author = {Erica M. Y. Donlon and Erin L. Damsteegt and Jean McKinnon and Fiona A. Higgins and Miles D. Lamare}, ' ... 
'year = {2019}, ' ...
'title = {Growth and age of the midget octopus, \emph{Octopus huttoni}}, ' ...
'journal = {Aquat Ecol}, ' ...
'volume = {53}, ' ...
'pages = {689–706}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carr2014'; type = 'article'; bib = [ ... 
'doi = {10.1080/03014223.2013.827126}, ' ...
'author = {S. A.  Carrasco}, ' ... 
'year = {2014}, ' ...
'title = {The early life history of two sympatric {N}ew {Z}ealand octopuses: eggs and paralarvae of \emph{Octopus huttoni} and \emph{Pinnoctopus cordiformis}}, ' ...
'journal = {New Zealand Journal of Zoology}, ' ...
'volume = {41(1)}, ' ...
'pages = {32-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Robsonella-huttoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


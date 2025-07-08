function [data, auxData, metaData, txtData, weights] = mydata_Abralia_trigonura

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Enoploteuthidae';
metaData.species    = 'Abralia_trigonura'; 
metaData.species_en = 'Squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 200;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'YounMang1994';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'YounMang1994';
data.Lp  = 1.4;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'YounMang1994';
data.Lpm  = 1.8;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';  bibkey.Lpm  = 'YounMang1994';
data.Li  = 4; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'YounMang1994';
data.Lim = 3; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'YounMang1994';
  comment.Lim = 'based on length ratio with females at 365 d: 94*39/54';

data.Ni  = 11e3; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'YounMang1994';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap=0.7';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
0.000	0.109
6.029	0.149
7.156	0.140
7.537	0.189
9.038	0.160
9.417	0.199
10.544	0.190
11.677	0.239
12.803	0.220
14.690	0.299
15.436	0.240
15.441	0.289
16.946	0.309
19.202	0.310
21.461	0.350
22.975	0.459
23.726	0.449
24.484	0.509
28.619	0.509
31.258	0.589
34.650	0.678
41.095	1.254
43.706	1.036
44.082	1.036
59.170	1.573
63.663	1.376
75.353	1.754
76.495	1.902
80.653	2.151
82.534	2.161
82.539	2.210
87.450	2.468
92.319	2.271
96.891	2.915
99.507	2.757
99.880	2.728
104.002	2.580
104.037	2.956
105.143	2.719
105.154	2.837
111.548	2.868
112.369	3.601
125.496	3.276
126.622	3.256
127.725	2.999
127.733	3.078
128.911	3.613
131.516	3.326
135.283	3.406
136.059	3.664
137.164	3.426
137.194	3.743
138.631	3.030
139.059	3.585
146.968	3.745
149.972	3.705
152.582	3.468
154.095	3.567
154.861	3.726
161.251	3.707
166.888	3.688
169.525	3.748
180.810	3.819
185.325	3.859
189.436	3.602];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YounMang1994';
comment.tL_f = 'Data for females from Hawaii)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
0.00	0.078
5.661	0.108
7.545	0.117
9.435	0.186
10.937	0.137
11.700	0.245
12.072	0.196
13.204	0.215
14.711	0.225
14.715	0.264
16.975	0.264
16.978	0.293
19.614	0.293
20.370	0.323
21.880	0.352
23.011	0.371
24.523	0.420
25.281	0.479
28.673	0.499
31.694	0.577
35.094	0.685
40.044	1.253
44.169	1.066
60.037	1.585
69.155	2.418
72.540	2.369
77.025	1.996
77.412	2.104
77.764	1.839
77.802	2.251
82.296	1.976
84.202	2.212
84.585	2.280
86.111	2.486
86.447	2.055
88.339	2.153
95.136	2.338
100.808	2.574
109.101	2.642
118.900	2.710
121.932	2.906
123.804	2.788
126.836	2.984
131.714	2.788
131.722	2.876
132.839	2.739
135.478	2.768
136.592	2.601
137.759	2.993
138.509	2.954
141.131	2.797
146.045	2.983
161.108	2.953
161.480	2.904
163.001	3.061
165.625	2.923
168.653	3.090
169.037	3.158
171.281	2.992
172.040	3.050
182.584	3.030];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YounMang1994';
comment.tL_m = 'Data for males from Hawaii'; 

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
0.128	0.014
2.914	2.097
3.126	2.056
3.222	2.725
3.234	2.296
3.501	3.124
3.626	3.980
3.768	4.113
3.836	4.809
3.913	4.621
3.920	4.541
3.991	4.701
4.058	5.209
4.116	5.490
4.141	4.754
4.168	5.945
4.221	5.168
4.230	5.596
4.269	6.252
4.319	4.953
4.321	5.234
4.375	6.050];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'YounMang1994';
comment.LWw_f = 'Data for females from Hawaii'; 
%
data.LWw_m = [ ... % manth length (cm), wet weight (g)
0.128	0.026
2.698	1.577
2.926	1.709
3.019	1.923
3.135	2.283
3.187	2.805
3.244	2.952
3.269	3.621
3.307	2.697
3.309	3.099
3.372	2.817
3.409	3.232
3.418	3.567
3.426	3.754
3.436	2.911
3.472	2.964
3.516	3.285
3.517	3.579
3.521	2.950
3.524	3.459
3.525	3.686
3.624	3.592
3.675	3.860
3.680	3.404];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'YounMang1994';
comment.LWw_m = 'Data for males from Hawaii'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '8LLH'; % Cat of Life
metaData.links.id_ITIS = '556021'; % ITIS
metaData.links.id_EoL = '491889'; % Ency of Life
metaData.links.id_Wiki = 'Abralia_trigonura'; % Wikipedia
metaData.links.id_ADW = 'Abralia_trigonura'; % ADW
metaData.links.id_Taxo = '157996'; % Taxonomicon
metaData.links.id_WoRMS = '878671'; % WoRMS
metaData.links.id_molluscabase = '878671'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onykia ingens}}';
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
bibkey = 'YounMang1994'; type = 'Article'; bib = [ ... 
'author = {R. E. Young and K. M. Mangold}, ' ... 
'year = {1994}, ' ...
'title = {Growth and reproduction in the mesopelagic-boundary squid \emph{Abralia trigonura}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {119}, ' ...
'pages = {413-421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Onykia-ingens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


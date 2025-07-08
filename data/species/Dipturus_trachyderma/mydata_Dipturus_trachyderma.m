function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_trachyderma

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_trachyderma'; 
metaData.species_en = 'Roughskin skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW','MPSE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2  = {'Bas Kooijman'};        
metaData.date_mod_2    = [2024 10 26];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data;
data.ab = 590; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 27*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'LicaCern2007';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 25;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'LicaCern2007';
data.Lp  = 215;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'LicaCern2007';
data.Lpm  = 195;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'LicaCern2007';
data.Li  = 264; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'LicaCern2007';

data.Ri  = 50/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'LicaCern2007';   
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '28-68 per yr';

% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.972	62.322
3.980	105.703
4.833	95.927
4.956	113.035
5.899	124.033
5.909	75.153
5.929	130.754
5.965	111.202
5.986	161.914
6.031	95.316
6.931	163.747
6.971	120.978
6.972	116.090
7.001	130.754
7.006	103.259
7.874	174.745
7.883	132.587
7.909	155.804
7.913	137.475
7.918	112.424
7.922	92.872
7.978	128.310
7.983	105.092
8.001	167.413
8.097	162.525
8.922	135.031
8.947	166.802
8.952	143.585
9.005	190.020
9.983	185.132
9.984	180.244
9.987	166.191
9.996	123.422
10.937	143.585
10.995	167.413
11.939	177.189
11.940	169.857
11.941	165.580
12.005	163.136
12.027	208.350
12.037	157.026
12.890	149.694
12.944	194.297
12.972	208.350
12.980	169.246
13.923	182.688
13.948	212.016
13.949	207.739
13.988	172.301
13.989	169.246
14.054	160.692
14.891	225.458
14.927	202.240
15.877	183.299
15.903	206.517
15.905	199.796
15.943	166.191
15.969	194.297
16.879	212.627
16.980	184.521
17.946	232.179
17.988	185.743
17.989	180.855
17.990	176.578
18.011	226.680
18.920	250.509
18.924	229.735
18.957	224.236
18.958	218.737
18.960	207.739
18.962	200.407
19.871	221.181
19.881	175.356
19.970	201.018
20.915	202.851
20.939	237.067
20.949	193.686
21.913	252.342
21.920	221.181
21.947	243.177
21.981	231.568
22.924	241.955
23.875	215.071
23.935	231.568
24.943	230.346
25.983	231.568
26.013	240.733];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LicaCern2007';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
1.973	58.045
3.103	81.874
3.889	89.206
4.953	127.088
4.955	118.534
4.956	112.424
4.961	86.762
5.089	77.597
5.927	139.919
5.928	135.642
5.960	133.198
5.998	103.870
6.847	111.813
6.911	108.147
7.029	147.251
7.941	152.138
7.947	127.088
7.948	120.367
7.949	116.701
7.950	111.813
8.894	116.701
8.944	179.022
8.951	145.418
8.954	132.587
8.981	155.804
8.988	121.589
8.990	111.813
8.991	105.703
9.990	153.360
9.992	144.196
10.020	160.692
10.048	175.967
10.930	178.411
10.965	160.081
11.935	194.297
11.936	190.631
11.937	187.576
11.938	182.688
11.978	138.697
12.951	158.248
12.956	133.198
12.974	200.407
13.952	194.297
14.965	172.912
14.970	149.083
14.999	163.136
15.996	216.904
15.998	205.295
16.004	175.967
16.941	216.293
16.945	199.185
16.946	193.686
16.947	189.409
16.950	174.134
18.896	212.016
18.959	215.071
18.992	206.517
18.994	195.519
19.937	209.572
20.919	185.132
20.977	208.961
21.921	214.460
21.922	209.572
22.896	224.236
22.898	215.071
22.899	211.405
22.933	197.963
22.960	218.126
24.916	212.016];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LicaCern2007';
comment.tL_m = 'data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
61.072	2187.417
72.530	3266.060
89.082	4337.136
95.448	5149.427
103.724	5137.148
105.316	8147.790
107.862	8144.012
110.727	10331.051
112.318	8411.320
114.865	6490.172
115.501	8132.678
119.003	9497.036
120.594	6755.580
122.504	10313.577
125.050	9214.155
126.960	11402.599
130.143	11671.785
132.371	12216.307
135.554	16046.323
137.782	14399.556
143.194	16034.989
145.740	16852.936
149.878	16846.797
152.743	19033.836
154.971	19852.255
157.199	22314.136
158.472	20394.877
160.382	23405.057
162.928	20388.265
165.156	30519.635
165.793	21753.568
166.111	26135.652
169.294	23391.834
169.294	27774.390
169.294	30239.587
173.114	25851.353
175.024	28039.809
177.252	29132.137
178.207	34335.012
178.525	25295.508
180.435	28853.506
183.300	35149.192
184.573	36790.753
184.573	31038.644
186.801	49661.223
187.119	38704.345
189.984	39795.739
193.485	26642.865
194.759	39514.747
196.987	44989.636
201.761	43886.913
202.080	36764.779
202.398	50733.722
206.217	44428.123
207.491	46069.696
210.037	43874.634
210.355	49078.454
210.992	55377.441
211.947	51541.285
216.403	50165.120
220.223	66320.146
220.859	69606.124
222.769	67138.099
224.042	64397.109
226.271	63298.164
226.907	57271.197
229.454	69867.281
230.408	80000.535
230.727	65208.922
231.045	60004.158
233.273	86570.130
233.591	70682.873
234.546	60272.877
236.775	65199.950
237.411	79990.145
240.594	109841.620
243.141	85185.937
246.005	84633.870
246.324	86824.675
250.462	64905.734
253.645	76405.235];
units.LWw_f = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f = 'LicaCern2007';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
80.806	3801.598
81.761	4347.998
88.127	5434.197
109.772	6497.728
120.276	12508.161
120.276	7303.869
129.507	12220.557
132.690	10572.373
139.374	11658.089
139.374	15218.920
145.422	14662.131
147.650	17397.930
147.968	18767.000
150.515	20132.775
153.698	22319.330
154.016	16840.658
158.472	25873.077
159.745	20119.079
161.337	24773.193
168.340	24488.895
168.976	21201.028
172.796	22290.995
173.114	27220.906
175.342	24752.414
179.798	31319.637
182.027	27755.500
186.164	34871.022
187.119	30760.958
188.393	23637.407
189.347	38427.130
190.302	34864.883
192.849	48282.698
194.122	37050.505
194.122	40611.335
194.440	34858.743
196.032	35130.301
196.032	39512.858
196.350	47455.772
196.350	48825.325
199.533	40329.388
200.170	50463.119
200.488	61692.956
200.488	39506.246
202.080	42790.807
204.626	43060.932
205.899	48811.157
207.491	52917.444
210.037	66061.350
216.085	45783.031
217.676	56189.254
218.631	50983.545
218.631	46600.983
220.541	61115.382
221.178	50979.767];
units.LWw_m = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m = 'LicaCern2007';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00282 *(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36R4S'; % Cat of Life
metaData.links.id_ITIS = '564182'; % ITIS
metaData.links.id_EoL = '46560498'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_trachyderma'; % ADW
metaData.links.id_Taxo = '357641'; % Taxonomicon
metaData.links.id_WoRMS = '271562'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-trachyderma'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus}}'; 
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
bibkey = 'LicaCern2007'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2001.9517045}, ' ...
'author = {Licandeo, R. and Cerna, F. and C\''{e}spedes, R.}, ' ...
'year = {2007}, ' ...
'title  = {Age, growth, and reproduction of the roughskin skate, \emph{Dipturus trachyderma}, from the southeastern {P}acific}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {64}, ' ...
'pages = {141-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-trachyderma.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


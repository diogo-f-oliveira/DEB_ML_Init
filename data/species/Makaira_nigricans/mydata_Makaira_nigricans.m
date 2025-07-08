function [data, auxData, metaData, txtData, weights] = mydata_Makaira_nigricans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Makaira_nigricans'; 
metaData.species_en = 'Atlantic blue marlin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15];

%% set data
% zero-variate data

data.ab = 7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'ADW';
  temp.ap = C2K(28);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'ADW';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.3;   units.Lb  = 'cm';  label.Lb  = 'LJFL at birth';    bibkey.Lb  = 'SponDeni2005';  
data.Lp  = 150;   units.Lp  = 'cm';  label.Lp  = 'LJFL at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'fishbase gives 50 cm, but this is inconsistent with ap = 2 yr';
data.Li  = 400;   units.Li  = 'cm';  label.Li  = 'ultimate LJFL';    bibkey.Li  = 'guess';
  comment.Li = 'Wiki gives (probably) upper-jaw-to-fork length: 500 cm';

data.Wwi = 818000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.R277  = 3.6e6/365; units.R277  = '#/d'; label.R277  = 'reprod rate at 277 cm'; bibkey.R277  = 'MartPinh2007';   
  temp.R277 = C2K(28);  units.temp.R277 = 'K'; label.temp.R277 = 'temperature';
data.R290  = 6.8e6/365;    units.R290  = '#/d'; label.R290  = 'reprod rate at 290 cm'; bibkey.R290  = 'MartPinh2007';   
  temp.R290 = C2K(28);  units.temp.R290 = 'K'; label.temp.R290 = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ...  % time since hatch (d), standard length (cm)
0.002	0.182
0.002	0.205
0.002	0.212
0.003	0.258
2.995	0.356
3.978	0.386
3.977	0.356
5.048	0.311
5.049	0.348
5.049	0.379
5.049	0.409
5.049	0.424
5.005	0.455
5.941	0.280
5.986	0.326
5.986	0.364
6.031	0.409
6.032	0.424
6.032	0.447
5.988	0.485
5.988	0.538
7.013	0.333
7.014	0.424
7.014	0.455
7.014	0.485
7.015	0.508
7.015	0.523
7.015	0.561
8.040	0.409
8.041	0.447
8.041	0.477
7.997	0.508
7.997	0.523
7.953	0.568
7.953	0.606
9.067	0.432
9.068	0.455
9.068	0.485
9.068	0.523
9.069	0.561
9.069	0.583
9.070	0.621
9.070	0.674
9.070	0.697
9.071	0.720
9.071	0.780
9.027	0.818
10.050	0.470
10.006	0.545
9.963	0.659
9.963	0.689
9.963	0.712
9.964	0.803
9.965	0.833
10.010	0.864
10.055	0.894
10.055	0.917
9.967	0.992
11.078	0.576
11.078	0.614
11.079	0.644
11.079	0.697
11.080	0.727
11.125	0.795
11.126	0.841
11.126	0.871
11.126	0.902
10.993	0.924
10.993	0.962
10.993	1.000
10.994	1.038
10.994	1.068
10.994	1.098
10.995	1.136
10.995	1.182
11.969	0.386
12.060	0.606
12.061	0.636
12.018	0.826
12.019	0.879
12.019	0.939
12.020	0.962
12.020	0.992
12.020	1.015
12.021	1.038
11.977	1.091
11.977	1.129
11.977	1.144
11.977	1.167
11.978	1.189
11.978	1.220
12.026	1.485
13.000	0.811
13.001	0.841
13.001	0.879
13.001	0.909
13.002	0.962
13.003	1.038
13.003	1.076
13.004	1.106
13.004	1.129
13.004	1.167
13.005	1.212
13.006	1.348
13.006	1.371
13.008	1.523
13.008	1.553
14.028	0.902
14.029	0.962
14.029	1.000
14.029	1.023
14.030	1.045
13.985	1.061
14.030	1.098
14.031	1.182
14.032	1.220
14.032	1.265
14.033	1.318
13.988	1.356
13.989	1.386
13.989	1.402
13.989	1.424
13.991	1.606
15.058	1.182
15.059	1.258
15.059	1.303
15.061	1.447
14.974	1.659
14.975	1.758
16.049	2.023
15.964	2.333
16.979	1.311
16.981	1.515
18.010	1.682
17.970	2.083
24.985	2.689];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SponDeni2005';
comment.tL = 'Temp is guessed';
%
data.tL1 = [ ... % age (yr), eye-to-fork length (cm)
4.990	140.686
5.975	178.245
6.991	208.114
7.980	205.289
9.000	190.927
9.958	213.100
11.033	217.973
11.994	216.107
13.011	227.707
13.968	249.880
15.017	235.520];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
data.tL1(:,2) = 9.550 + 1.080 * data.tL1(:,2); % convert EFL to LJFL 
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'LJFL'};  
temp.tL1    = C2K(25);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'SunSu2013';
comment.tL1 = 'Temp is guessed';

% length-weight
data.LW = [ ... % eye-to-fork length (cm), weight (g)
18.072	21317.829
23.133	34883.721
28.193	42635.659
34.699	17441.860
42.651	34883.721
46.988	31007.752
57.108	34883.721
57.108	42635.659
57.108	48449.612
65.783	46511.628
69.398	46511.628
67.952	34883.721
76.627	40697.674
76.627	48449.612
77.349	60077.519
82.410	50387.597
87.470	62015.504
90.361	79457.364
94.699	85271.318
88.916	44573.643
95.422	56201.550
97.590	56201.550
96.145	67829.457
101.205	71705.426
104.819	79457.364
101.205	83333.333
105.542	52325.581
109.880	63953.488
106.988	67829.457
113.494	71705.426
117.831	71705.426
120.723	60077.519
124.337	75581.395
124.337	87209.302
124.337	94961.240
124.337	98837.209
108.434	81395.349
113.494	81395.349
116.386	93023.256
112.771	104651.163
118.554	110465.116
123.614	118217.054
122.169	96899.225
126.506	108527.132
138.072	56201.550
130.120	73643.411
132.289	87209.302
132.289	98837.209
132.289	108527.132
135.904	104651.163
137.349	114341.085
135.181	124031.008
140.241	116279.070
140.964	104651.163
135.181	87209.302
138.072	83333.333
146.024	83333.333
145.301	94961.240
145.301	118217.054
146.024	125968.992
143.855	133720.930
150.361	127906.977
153.253	137596.899
153.253	145348.837
148.193	147286.822
151.807	209302.326
166.265	147286.822
164.096	158914.729
164.096	164728.682
157.590	153100.775
151.807	96899.225
153.976	93023.256
159.759	87209.302
156.867	104651.163
161.205	110465.116
161.205	131782.946
168.434	125968.992
168.434	114341.085
165.542	108527.132
172.771	56201.550
174.940	118217.054
174.940	112403.101
176.386	120155.039
176.386	135658.915
180.723	133720.930
176.386	145348.837
173.494	149224.806
169.880	162790.698
173.494	168604.651
176.386	160852.713
178.554	174418.605
180.000	189922.481
177.831	189922.481
180.723	197674.419
187.229	197674.419
187.229	168604.651
187.952	176356.589
192.289	168604.651
192.289	182170.543
191.566	147286.822
194.458	137596.899
194.458	116279.070
187.229	122093.023
187.229	143410.853
182.892	137596.899
213.976	102713.178
240.723	149224.806
204.578	139534.884
211.084	153100.775
205.301	162790.698
201.687	178294.574
198.072	186046.512
200.964	195736.434
201.687	201550.388
198.795	207364.341
193.735	205426.357
203.855	203488.372
208.193	211240.310
207.470	218992.248
209.639	226744.186
211.807	232558.140
214.699	218992.248
216.145	234496.124
219.759	228682.171
221.205	213178.295
224.819	203488.372
224.819	186046.512
213.253	186046.512
211.084	203488.372
245.783	201550.388
242.169	205426.357
234.217	222868.217
237.831	236434.109
226.988	232558.140
240.000	277131.783
234.940	296511.628
237.108	306201.550
240.723	296511.628
237.108	354651.163
263.855	317829.457
261.687	271317.829
297.108	432170.543
315.181	449612.403];
data.LW(:,1) = 9.550 + 1.080 * data.LW(:,1); % convert EFL to LJFL 
units.LW = {'cm', 'g'}; label.LW = {'LJFL', 'wet weight'};  
bibkey.LW = 'SunSu2013';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Birth is here assumed to coincide with hatch due to lack of data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'LJFL = 9.550 + 1.080 * EFL (in cm): lower yaw to fork length, eye to fork length';
metaData.bibkey.F1 = 'SunSu2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3XJWZ'; % Cat of Life
metaData.links.id_ITIS = '172491'; % ITIS
metaData.links.id_EoL = '46581446'; % Ency of Life
metaData.links.id_Wiki = 'Makaira_nigricans'; % Wikipedia
metaData.links.id_ADW = 'Makaira_nigricans'; % ADW
metaData.links.id_Taxo = '179502'; % Taxonomicon
metaData.links.id_WoRMS = '126950'; % WoRMS
metaData.links.id_fishbase = 'Makaira-nigricans'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Makaira_nigricans}}';
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
bibkey = 'SponDeni2005'; type = 'Article'; bib = [ ... 
'author = {S. Sponaugle and K. L. Denit and S. A. Luthy and J. E. Serafy and R. K. Cowen}, ' ... 
'year = {2005}, ' ...
'title = {Growth variation in larval \emph{Makaira nigricans}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, ' ...
'pages = {822-835}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartPinh2007'; type = 'Article'; bib = [ ... 
'author = {C. Martins and P. Pinheiro and P. Travassos and F. Hazin}, ' ... 
'year = {2007}, ' ...
'title = {PRELIMARY RESULTS ON REPRODUCTIVE BIOLOGY OF BLUE MARLIN, \emph{Makaira nigricans} ({L}ac\''{e}p\`{e}de, 1803) IN THE TROPICAL {W}ESTERN {A}TLANTIC {O}CEAN}, ' ...
'journal = {Col. Vol. Sci. Pap. ICCAT}, ' ...
'volume = {60}, ' ...
'number = {5}, '...
'pages = {1636--1642}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SunSu2013'; type = 'Techreport'; bib = [ ... 
'author = {C.-L. Sun and N.-J. Su and S.-Z. Yeh and Y.-J. Chang}, ' ... 
'year = {2013}, ' ...
'title = {Sex-specific Growth Parameters and Natural Mortalilty Rates for Blue Marlin (\emph{Makaira nigricans}) in the {N}orthwest {P}acific {O}cean}, ' ...
'institution = {Working document submitted to the ISC Billfish Working Group Workshop, 16-23 January 2013, Honolulu, Hawaii, USA}, ' ...
'howpublished = {http://isc.ac.affrc.go.jp/pdf/BILL/ISC13_BILL_1/ISC13BILLWG-1-10.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Makaira_nigricans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/216}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


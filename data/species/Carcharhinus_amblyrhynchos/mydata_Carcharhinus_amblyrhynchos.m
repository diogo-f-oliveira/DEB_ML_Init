function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_amblyrhynchos
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_amblyrhynchos'; 
metaData.species_en = 'Grey reef shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 01];


%% set data
% zero-variate data

data.ab = 14*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'Robb2006';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-14 mnth';
data.am = 19*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Robb2006';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 54;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Robb2006';  
data.Lp  = 136;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Robb2006'; 
  comment.Lp = '130-142 cm';
data.Lpm  = 135;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Robb2006'; 
  comment.Lpm = '132-138 cm';
data.Li  = 255;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Ri  = 4/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Robb2006';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4 pups per litter, 1 litter each 2 yrs';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	75.873
0.000	80.952
0.000	66.348
0.000	69.205
0.000	71.745
0.990	82.841
1.988	102.191
2.010	90.127
2.011	92.666
2.951	87.572
2.982	106.302
3.031	102.492
6.014	122.444
6.035	106.571
7.999	121.778
9.043	125.888
10.062	128.094
11.006	137.286
12.027	150.285
12.995	153.127
12.996	155.667
13.018	144.873
13.022	158.206
13.070	148.681
13.989	157.873
13.989	160.413
14.013	155.333
14.981	157.223
14.982	161.667
15.003	145.476
15.998	155.937
15.999	158.794
16.000	160.698
16.000	162.921
16.989	151.794
17.045	169.888
18.061	162.570
19.056	170.174];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Robb2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	73.016
0.000	60.952
0.044	66.031
0.048	78.412
0.990	81.254
0.992	88.238
0.993	93.952
1.015	78.714
1.987	97.111
2.009	85.365
2.009	87.905
2.976	87.254
3.029	93.920
3.974	106.921
4.021	91.682
5.020	116.428
6.952	109.096
7.008	127.190
7.997	117.016
9.018	127.793
9.021	138.587
10.013	137.936
13.961	148.667
14.015	162.317
14.036	146.761
15.007	158.809
15.008	162.619];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Robb2006';
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
67.383	1306.685
68.472	2240.816
69.378	1594.963
71.554	2314.210
73.187	2530.489
75.181	2316.071
77.358	2029.936
79.715	2892.905
81.529	3396.528
82.617	2894.393
85.155	3326.573
86.425	3829.920
89.870	4190.751
92.228	4407.402
102.021	7141.331
105.648	8004.948
120.881	12752.439
121.788	10885.758
124.689	13113.459
127.591	13976.707
136.477	17212.864
137.383	15130.742
143.912	20663.714
145.181	24039.589
147.720	23897.266
148.990	24759.676
149.715	18081.414
151.710	25622.831
153.342	28639.826
155.337	22393.093
155.699	24475.865
155.881	23829.638
157.513	23399.595
158.057	27205.979
158.057	22394.488
158.601	29432.470
159.508	23185.180
161.140	31085.478
161.503	23760.709
162.591	29793.583
162.591	27998.251
163.316	27424.117
169.119	31161.383
170.207	36332.498];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f  = 'Robb2006';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
60.674	1303.244
65.933	1377.754
67.021	2024.634
70.104	2169.841
70.104	1882.586
71.917	1883.517
72.461	2314.676
73.731	2028.075
74.456	2387.512
76.088	2603.790
76.451	2603.976
77.539	3035.414
78.808	2605.186
79.896	3323.875
85.155	3829.268
86.062	4906.932
86.788	3327.410
86.788	4117.357
88.420	3759.127
91.321	4694.188
92.953	4910.467
93.679	4408.146
94.041	5413.718
96.943	5199.765
106.373	8005.320
109.456	8150.530
115.803	8512.850
126.503	12252.629
127.047	13904.615
137.565	16136.223
138.109	16639.195
146.088	17720.487
148.264	24902.931
162.228	27782.625
162.953	30440.088];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m  = 'Robb2006';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Lb =  5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'viviparous';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R3ML'; % Cat of Life
metaData.links.id_ITIS = '160358'; % ITIS
metaData.links.id_EoL = '46559793'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_amblyrhynchos'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_amblyrhynchos'; % ADW
metaData.links.id_Taxo = '106444'; % Taxonomicon
metaData.links.id_WoRMS = '217337'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-amblyrhynchos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_amblyrhynchos}}';
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
bibkey = 'Robb2006'; type = 'phdthesis'; bib = [ ... 
'author = {William David Robbins}, ' ... 
'year = {2006}, ' ...
'title = {Abundance, demography and population structure of the grey reef shark (\emph{Carcharhinus amblyrhynchos}) and the whitetip reef shark(\emph{Triaenodon obesus}) (fam. {C}archarhiniidae)}, ' ...
'school = {School of Marine Biology and Auqaculture, James Cook University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-amblyrhynchos.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


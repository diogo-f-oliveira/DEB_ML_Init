function [data, auxData, metaData, txtData, weights] = mydata_Lamna_nasus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Lamnidae';
metaData.species    = 'Lamna_nasus'; 
metaData.species_en = 'Porbeagle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Le'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2017 08 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data

data.ab = 8.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = {'FranStev2000','elasmo'};   
  temp.ab = C2K(11+12.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'uterus temperatury during incubation is assumed to exceed the evironmental temperature by 11 C';
data.am = 45.5*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'NataMell2002';   
  temp.am = C2K(12.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 61.6;       units.Lb  = 'cm';  label.Lb  = 'fork length at birth'; bibkey.Lb  = 'FranStev2000'; 
  comment.Lb = 'TL 60-80 cm; 70 cm converted to FL using F2';
data.Lp  = 185;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females';  bibkey.Lp  = 'FranStev2000'; 
  comment.Lp = 'FL 165-180 cm';
data.Lpm  = 175;   units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males';  bibkey.Lpm  = 'ADW'; 
data.Li  = 321;      units.Li  = 'cm';  label.Li  = 'ultimate fork length for females';    bibkey.Li  = 'ADW';
  comment.Li = 'based on TL 365 cm and F2';
data.Lim  = 272;     units.Lim  = 'cm';  label.Lim  = 'ultimate fork length for males';    bibkey.Lim  = 'guess';
  comment.Lim = 'based on TL 365 cm and F2';

data.Wwb = 3.53e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on 0.0089125*Lb^3.128, see F1; ADW gives 9 kg, FranStev2000 3.4-4.3 kg';
data.Wwp = 110e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'ADW';
  comment.Wwp = 'based on0.0089125*Lp^3.128, see F1; ADW give 200 kg';
data.Wwpm = 92.5e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'ADW';
  comment.Wwpm = 'based on 0.0089125*Lpm^3.128, see F1';
data.Wwi = 617.1e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0089125*Li^3.128, see F1';
data.Wwim = 367.6e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.0089125*Lim^3.128, see F1';

data.Ri  = 4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(12.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length for embryos
data.tL_e = [ ... % age (d), fork length (cm)
28.721	15.777
60.590	4.595
90.896	8.425
90.989	20.066
91.101	34.004
91.663	34.158
105.047	25.274
107.859	26.346
120.669	15.624
121.727	7.812
121.900	29.409
128.124	36.455
145.490	34.617
146.639	38.140
151.704	40.438
151.714	41.663
152.190	31.094
152.711	26.193
152.767	33.239
160.089	37.374
180.904	46.105
181.398	37.834
181.477	47.637
181.986	41.204
182.487	33.851
196.061	48.556
243.739	51.313
274.638	59.125];
units.tL_e   = {'d', 'cm'};  label.tL_e = {'age', 'embryo fork length'};  
temp.tL_e    = C2K(12.9);  units.temp.tL_e = 'K'; label.temp.tL_e = 'temperature';
bibkey.tL_e  = 'FranStev2000';
comment.tL_e = 'Data from Atlantic';
subtitle.tL_e = 'Data for embryo';

% time-length post birth
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.023	92.390
0.102	104.338
0.140	105.899
0.176	97.080
0.176	99.675
1.007	96.662
1.014	126.766
1.015	129.881
1.047	107.566
1.054	133.000
1.088	118.471
1.159	101.351
1.240	122.642
2.001	143.495
2.036	133.119
2.041	151.285
2.066	102.499
2.108	116.518
2.109	121.190
2.144	112.370
3.020	139.466
3.057	135.837
3.092	122.866
3.169	129.623
3.170	132.737
3.967	147.366
4.000	127.647
4.045	158.275
4.079	143.747
4.115	135.446
4.116	139.599
4.119	152.056
5.028	160.471
5.029	166.180
5.062	146.461
5.063	150.613
5.064	154.247
5.099	142.313
6.006	141.904
6.046	152.289
6.047	157.999
6.049	162.670
6.049	165.785
6.050	169.418
6.051	170.975
6.090	175.132
6.091	178.765
6.998	181.989
7.000	187.699
7.028	149.813
7.032	168.499
7.040	196.527
7.064	144.108
7.067	156.046
7.071	172.656
7.148	178.893
7.182	162.808
7.941	173.280
7.980	179.513
7.981	184.704
7.982	187.818
8.011	155.122
8.018	182.113
8.022	195.608
8.023	202.356
8.047	145.265
8.051	160.837
8.052	164.989
9.035	169.260
9.037	177.046
9.038	181.198
9.039	185.870
9.082	204.560
9.118	196.260
9.954	217.642
9.985	190.656
9.986	195.846
10.020	179.241
10.021	184.432
10.026	203.636
10.967	188.179
10.974	216.727
11.010	209.465
11.082	196.498
11.089	221.412
11.116	180.931
11.122	202.731
11.989	194.012
11.994	217.370
12.031	213.222
12.034	223.603
12.034	225.679
12.038	239.174
12.143	209.083
12.180	204.416
12.976	215.412
13.016	221.126
13.016	224.241
13.017	227.355
13.018	229.950
13.048	200.888
13.050	206.598
13.058	241.374
13.098	247.088
13.962	228.508
13.963	232.660
13.964	236.812
13.966	242.522
13.996	211.903
14.004	244.603
14.035	217.617
14.036	223.326
14.947	238.488
15.058	229.678
15.091	212.554
15.093	218.783
15.094	223.454
15.099	243.697
15.100	248.369
16.043	239.140
16.043	240.697
16.044	244.850
16.046	252.635
16.047	257.307
16.075	217.864
16.117	232.402
16.153	226.697
17.021	224.726
17.023	228.878
17.024	233.031
17.025	238.740
17.027	244.969
18.043	230.040
18.044	233.673
18.047	245.092
18.125	254.963
18.949	226.516
19.026	232.235
19.027	237.944
19.029	244.173
19.034	263.378
19.971	234.945
20.010	240.140
21.904	258.016
21.975	241.416
23.075	257.639
23.977	236.987];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(12.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'NataMell2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.025	100.695
0.027	106.405
0.029	114.190
0.058	80.457
0.059	83.052
0.060	87.204
0.061	90.319
0.900	122.081
0.977	126.243
1.049	114.314
1.083	97.709
1.084	101.861
1.085	105.495
1.085	108.090
1.088	117.952
1.924	137.257
1.995	118.062
2.003	149.723
2.004	155.952
2.034	124.814
2.035	128.966
2.076	141.428
2.109	120.671
3.052	116.633
3.060	146.737
3.092	124.423
3.093	129.094
3.094	133.247
3.095	137.399
3.097	143.109
3.175	155.575
4.041	141.147
4.042	144.780
4.042	147.894
4.043	151.009
4.086	172.294
4.149	121.956
4.994	176.037
5.022	138.671
5.024	143.861
5.025	146.975
5.063	151.132
5.065	158.399
5.071	182.275
5.178	154.260
5.405	155.845
6.001	123.737
6.004	137.232
6.008	149.690
6.008	152.285
6.013	173.047
6.015	179.275
6.017	185.504
6.047	157.999
6.049	162.151
6.050	167.342
6.994	166.937
6.995	171.608
6.996	174.723
7.001	192.370
7.035	178.361
7.037	185.627
7.064	144.108
7.103	148.784
7.142	152.422
7.143	157.612
8.012	156.680
8.016	172.251
8.048	148.379
8.051	163.432
8.055	177.446
8.056	182.118
8.057	184.713
8.059	194.575
8.065	216.894
8.089	160.841
8.128	169.150
8.996	164.065
9.000	180.675
9.035	167.703
9.036	172.894
9.037	175.489
9.040	186.389
9.045	207.151
9.079	191.584
9.941	165.737
9.980	170.413
10.019	176.646
10.026	203.636
10.058	179.765
10.060	188.589
10.062	195.336
11.005	188.184
11.007	197.527
11.008	200.641
11.040	179.365
11.041	182.998
11.071	152.898
11.077	175.736
11.113	166.398
11.114	171.069
11.988	189.860
11.988	190.379
11.989	195.570
11.992	209.065
12.019	165.988
12.020	169.622
12.028	199.207
12.029	203.360
12.060	178.450
12.061	181.564
12.062	184.160
12.062	186.236
12.978	221.641
13.017	225.279
13.047	194.660
13.048	198.293
13.049	204.002
13.083	190.512
13.089	212.312
13.090	216.464
13.990	190.622
13.992	198.926
13.993	203.079
13.994	206.712
13.995	209.307
13.996	214.498
13.997	217.612
13.998	220.726
13.999	225.398
15.011	194.898
15.012	198.012
15.016	211.507
15.017	216.698
15.018	219.812
15.051	202.169
15.052	206.840
15.056	222.412
15.058	228.640
16.032	198.135
16.039	223.050
16.039	225.645
16.040	228.240
16.075	217.864
16.078	230.321
16.941	205.512
16.980	209.669
17.021	222.650
17.022	227.840
17.023	231.992
17.024	234.588
18.043	231.597
18.045	236.787
18.076	212.916
18.118	227.454
19.019	206.283
19.025	228.602
19.026	232.754
19.062	224.973
20.084	232.363
20.157	221.472
20.161	238.601
21.070	245.977
22.011	233.116
22.013	239.344
24.994	227.248];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(12.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'NataMell2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Mean temperature set at 12.9 C, based on FranStev2000, but body temperature might be higher, see F3';
D3 = 'Since max ovum diameter is 6 mm, see F4, start of feeding (so birth) is around very early, and tLe data is treated as foetal';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'length-weight: Ww in g  = 8.9125e-3 * (FL in cm)^3.128; for embryos:1.91e-5*(FL in cm)^2.916';
metaData.bibkey.F1 = 'FranStev2000'; 
F2 = 'length-length in cm: FL = -0.567 + 0.881 * TL';
metaData.bibkey.F2 = 'FranStev2000'; 
F3 = 'Endothermic, oophagous, as developing embryos feed on fertilized eggs to get nutrients once the yolk sac is depleted';
metaData.bibkey.F3 = 'ADW'; 
F4 = ['Ova diameter 1.5-4.7 mm. ' ...
    'Small embryos have fang-like functional teeth that tear open egg capsules to release the contained ova. '...
    'The fangs are shed at FL 34-38 cm. The weight of yolk in the stomach peaks at 30-42 cm FL, and accounts for up to 0.81 of total body weight. '...
    'Waste products of yolk digestion accumulate steadily in the spiral valve throughout gestation, '...
    'and the liver reaches its maximum size in near-term embryos as excess energy from yolk digestion is stored for postnatal use.'];
metaData.bibkey.F4 = 'FranStev2000'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '3S2F7'; % Cat of Life
metaData.links.id_ITIS = '159911'; % ITIS
metaData.links.id_EoL = '46559756'; % Ency of Life
metaData.links.id_Wiki = 'Lamna_nasus'; % Wikipedia
metaData.links.id_ADW = 'Lamna_nasus'; % ADW
metaData.links.id_Taxo = '41910'; % Taxonomicon
metaData.links.id_WoRMS = '105841'; % WoRMS
metaData.links.id_fishbase = 'Lamna-nasus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lamna_nasus}}';
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
bibkey = 'NataMell2002'; type = 'Article'; bib = [ ... 
'author = {L. J. Natanson and J. J. Mello and S. E. Campana}, ' ... 
'year = {2002}, ' ...
'title = {Validated age and growth of the porbeagle shark (\emph{Lamna nasus}) in the western {N}orth {A}tlantic {O}cean}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {100}, ' ...
'pages = {266-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FranStev2000'; type = 'Article'; bib = [ ... 
'author = {Malcolm P. Francis and John D. Stevens}, ' ... 
'year = {2000}, ' ...
'title = {Reproduction, embryonic development, and growth of the porbeagle shark, \emph{Lamna nasus}, in the southwest {P}acific {O}cean}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {98}, ' ...
'pages = {41-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lamna-nasus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lamna_nasus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'elasmo'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.elasmo-research.org/education/white_shark/p_body_temp.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Istiompax_indica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Istiompax_indica'; 
metaData.species_en = 'Black marlin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 01 16];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator        = {'Starrlight Augustine'};
metaData.email_cur      = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc       = [2019 01 16];

%% set data
% zero-variate data

data.am = 11*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'SunYeh2015';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '5 yr for males';

data.Lp  = 217;   units.Lp  = 'cm';  label.Lp  = 'LJFL at puberty';  bibkey.Lp  = 'SunChan2015';
  comment.Lp = 'SunChan2015 give 195 cm EFL, which was converted to by LJFL =  1.115 * EFL';
data.Li  = 401;   units.Li  = 'cm';  label.Li  = 'ultimate LJFL';    bibkey.Li  = 'Wiki';
  comment.Li = 'fishbase gives 465 FL, which was converted to by LJFL =  0.86 * FL';

data.Wwb = 1.1e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'SunChan2015';
  comment.Wwb = 'based on egg diameter 0f 277 mum : pi/6*0.0277^3';
data.Wwi = 750e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';

data.Ri  = 260e6/365;    units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ...  % time since birth (d), LJFL (cm)
0.924	110.200
0.924	112.528
0.946	110.976
0.968	99.335
0.968	102.439
0.968	105.543
0.968	107.871
0.969	118.736
0.989	82.262
0.989	83.814
0.989	89.246
0.989	90.022
0.990	92.350
0.990	96.231
1.011	69.069
1.011	74.501
1.954	142.018
1.997	112.528
1.997	117.960
1.998	120.288
1.998	124.169
1.998	125.721
1.998	128.049
1.998	130.377
1.998	133.481
1.999	138.137
1.999	146.674
2.000	152.106
2.021	137.361
2.085	94.678
2.086	99.335
2.086	103.215
2.985	174.612
3.003	111.752
3.003	117.960
3.004	124.169
3.004	128.049
3.004	131.153
3.005	138.914
3.005	142.794
3.005	145.122
3.006	161.419
3.006	164.523
3.007	168.404
3.007	180.044
3.028	150.554
3.028	153.659
3.028	157.539
3.967	152.106
3.967	158.315
3.968	161.419
3.969	183.149
3.969	187.029
3.970	197.894
3.970	200.222
3.990	164.523
3.990	167.627
3.991	170.732
3.991	173.836
3.991	176.940
3.991	176.940
3.991	180.820
4.011	132.705
4.014	193.237
4.033	142.018
4.974	159.091
4.974	165.299
4.999	208.758
5.000	218.071
5.000	226.608
5.019	170.732
5.019	174.612
5.019	177.716
5.020	180.044
5.021	197.894
5.021	204.878
5.022	211.086
5.022	214.191
5.042	186.253
5.042	187.805
5.043	191.685
5.043	198.670
6.003	173.836
6.003	177.716
6.004	183.925
6.004	191.685
6.004	195.565
6.005	199.446
6.005	202.550
6.005	204.878
6.005	208.758
6.005	211.086
6.006	214.191
6.006	217.295
6.006	228.936
6.007	229.712
6.007	232.816
6.007	235.920
6.007	243.681
6.026	187.029
6.029	223.503
6.967	211.086
6.967	214.191
6.967	216.519
6.967	219.623
6.967	222.727
6.968	224.279
6.991	239.024
6.991	247.561
6.992	251.441
6.992	254.545
7.010	186.253
7.010	195.565
7.011	198.670
7.011	201.774
7.011	204.878
7.013	231.264
7.013	234.368
7.013	242.129
7.015	260.754
7.977	268.514
7.977	277.051
7.995	201.774
7.995	211.086
7.995	214.967
7.996	220.399
7.996	222.727
7.996	228.936
7.996	230.488
7.997	232.816
7.997	235.920
7.997	239.024
7.997	240.576
7.997	242.129
7.997	242.905
7.998	247.561
7.998	251.441
7.998	255.322
8.019	227.384
9.004	249.113
9.004	252.217
9.004	254.545
9.004	256.874
9.004	257.650
9.004	259.202
9.005	263.082
9.005	271.619
9.005	275.499
9.025	230.488
9.025	235.144
9.026	242.129
9.026	247.561
10.011	268.514
10.032	243.681
10.033	261.530
10.034	280.155
10.035	285.588
10.035	291.796
11.018	277.051
11.018	282.483
11.018	288.692
11.020	308.093];
n = size(data.tL_f,1); % make sure at each time point is unique
for i = 2:n
  if data.tL_f(i,1) <= data.tL_f(i-1,1)
    data.tL_f(i,1) = max(data.tL_f(i-1,1), data.tL_f(i,1)) + 1e-5;
  end
end
data.tL_f(:,1) = (0.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'LJFL', 'female'};  
temp.tL_f    = C2K(25.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SunYeh2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ...  % time since birth (d), LJFL (cm)
0.954	87.444
0.975	129.484
0.975	126.682
0.975	124.439
0.976	121.076
0.977	108.744
0.977	107.063
0.977	104.821
0.977	102.578
0.978	100.897
0.978	99.776
0.978	94.731
0.979	90.807
0.979	83.520
1.001	118.274
1.001	115.471
1.001	112.108
1.960	153.027
1.961	147.422
1.961	145.740
1.961	142.937
1.961	141.256
1.986	139.574
1.986	136.211
1.987	133.969
1.987	131.726
1.987	129.484
1.989	115.471
1.989	112.668
1.989	109.865
1.989	106.502
2.012	127.242
2.012	125.000
2.013	122.197
2.013	119.955
2.062	118.274
2.946	174.888
2.946	169.843
2.946	167.601
2.971	164.798
2.973	144.619
2.996	161.435
2.997	158.632
2.997	156.390
2.997	153.587
2.997	150.224
2.998	140.695
2.999	137.892
2.999	133.969
3.956	191.143
3.957	187.780
3.957	183.296
3.958	179.372
3.958	175.448
3.958	172.085
3.959	168.161
3.959	164.238
3.959	163.117
3.960	159.193
3.985	155.269
4.010	149.664
4.968	202.915
4.968	196.749
4.968	195.067
4.970	177.130
4.971	171.525
4.971	167.601
4.971	164.238
4.994	187.780
4.994	184.978
4.994	181.054];
n = size(data.tL_m,1); % make sure at each time point is unique
for i = 2:n
  if data.tL_m(i,1) <= data.tL_m(i-1,1)
    data.tL_m(i,1) = max(data.tL_m(i-1,1), data.tL_m(i,1)) + 1e-5;
  end
end
data.tL_m(:,1) = (0.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'LJFL', 'male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SunYeh2015';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'The tL data suggests that food invailebility increase over time, which has been implemented';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '3QDBS'; % Cat of Life
metaData.links.id_ITIS = '768125'; % ITIS
metaData.links.id_EoL = '46581454'; % Ency of Life
metaData.links.id_Wiki = 'Istiompax_indica'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1683087'; % Taxonomicon
metaData.links.id_WoRMS = '712905'; % WoRMS
metaData.links.id_fishbase = 'Istiompax-indica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Istiompax_indica}}';
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
bibkey = 'SunYeh2015'; type = 'Article'; bib = [ ... 
'author = {Chi-Lu Sun and  Su-Zan Yeh and Chien-Shan Liu and Nan-Jay Su and Wei-Chuan Chiang}, ' ... 
'year = {2015}, ' ...
'title = {Age and growth of Black marlin (\emph{Istiompax indica}) off eastern {T}aiwan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {166}, ' ...
'pages = {4-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SunChan2015'; type = 'Article'; bib = [ ... 
'author = {Chi-Lu Sun and Hsiao-Yun Chang and Tsung-Yun Liu and Su-Zan Yeh and Yi-Jay Chang}, ' ... 
'year = {2015}, ' ...
'title = {Reproductive biology of the black marlin, \emph{Istiompax indica}, offsouthwestern and eastern {T}aiwan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {166}, ' ...
'pages = {12-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Istiompax-indica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


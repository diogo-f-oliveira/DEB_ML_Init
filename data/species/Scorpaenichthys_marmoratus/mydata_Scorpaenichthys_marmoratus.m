function [data, auxData, metaData, txtData, weights] = mydata_Scorpaenichthys_marmoratus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenichthyidae';
metaData.species    = 'Scorpaenichthys_marmoratus'; 
metaData.species_en = 'Cabezon'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 11;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed from distribution';
data.ap = 1.8 * 365;     units.ap = 'd';    label.ap = 'age at puberty for females'; bibkey.ap = 'GrebCail2010';
  temp.ap = C2K(12);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.apm = 1.6 * 365;     units.apm = 'd';    label.apm = 'age at puberty for males'; bibkey.apm = 'GrebCail2010';
  temp.apm = C2K(12);  units.temp.apm = 'K'; label.temp.apm = 'temperature';
data.am = 13 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'swrcb';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.585;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'OCon1973';  
data.Lp  = 33.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = {'GrebCail2010','Wiki'}; 
data.Lpm  = 29.7;  units.Lpm  = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm  = {'GrebCail2010','Wiki'}; 
data.Li  = 99;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = {'GrebCail2010', 'fishbase'};
 comment.Li = 'for males';

data.Wwi = 6800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'GrebCail2010';
 
% uni-variate data
% time-length 
data.tL = [ ... % time (d), length (c); t=0 at April
57.217	8.256
57.647	6.335
58.151	7.544
58.590	6.014
58.603	6.584
58.609	6.833
58.614	7.046
58.620	7.295
59.112	8.007
60.549	8.470
61.442	6.050
61.942	7.117
61.946	7.260
61.970	8.292
62.398	6.299
62.439	8.043
62.901	7.473
64.797	7.260
151.330	9.431
151.368	11.032
244.578	14.199
273.591	15.338
277.394	15.409
277.503	19.964
278.345	15.409
278.380	16.904
280.689	14.057
280.713	15.089
280.721	15.409
282.621	15.374
307.815	15.801
308.283	15.480
308.306	16.441
308.852	19.431
309.218	14.840
309.798	19.253
310.698	17.153
311.710	19.715
312.097	16.014];
units.tL = {'d' 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OCon1973';
comment.tL = 'in tide pools at Pacific Grove in 1950-1951; t=0 at April; temp is guessed';
% 
data.tL_f = [ ... %  time since birth (yr), total length(cm)
1.026	11.057
1.026	11.924
1.026	12.575
1.026	13.008
1.026	13.659
1.026	14.309
1.053	15.393
1.053	16.477
1.026	17.344
1.026	18.211
1.979	21.247
1.979	22.764
2.032	33.171
3.038	28.401
3.038	29.051
3.038	29.702
3.038	30.352
2.985	31.220
3.011	32.520
3.011	33.171
3.011	33.604
3.011	34.472
2.985	38.157
2.985	39.458
2.985	40.108
2.985	42.493
4.017	29.051
4.017	30.352
4.017	31.003
3.964	32.087
3.991	32.737
3.991	33.604
3.991	34.472
3.991	36.206
3.991	36.856
3.991	37.507
3.991	38.157
3.991	39.241
3.991	39.892
3.991	40.759
3.991	41.192
3.991	41.843
3.991	43.577
3.991	45.745
4.970	31.436
4.970	31.436
4.970	32.304
5.023	34.472
5.023	35.556
5.023	36.206
5.023	37.507
4.970	38.591
4.970	39.458
4.970	40.108
4.970	40.759
4.970	41.626
4.970	42.276
5.023	43.577
4.970	44.444
4.970	45.095
4.970	45.528
4.970	46.179
4.970	47.046
4.996	48.780
4.996	49.864
4.970	50.949
5.023	53.984
6.002	32.087
6.002	32.954
6.002	33.821
6.002	34.255
5.975	36.206
6.002	37.507
6.002	38.374
6.002	39.024
6.002	39.675
6.002	40.325
5.975	41.843
6.002	42.710
6.002	43.144
6.002	44.228
6.002	44.661
6.002	45.095
5.975	45.528
5.975	46.179
5.975	46.829
5.975	47.480
5.975	47.913
5.975	48.780
5.975	50.298
5.975	50.949
5.975	51.599
5.975	52.466
5.975	52.683
5.975	53.117
5.975	54.417
5.975	55.501
6.981	32.954
6.981	34.472
6.981	38.808
6.981	39.892
6.981	40.542
6.981	40.976
6.981	41.626
6.981	42.060
6.981	42.493
6.981	44.011
6.981	44.878
6.981	45.528
6.981	46.179
7.008	47.046
7.008	47.263
6.981	48.564
6.981	49.864
6.981	50.298
6.981	50.949
7.008	51.599
7.008	52.466
6.981	53.333
7.008	55.718
7.987	40.976
7.987	41.843
7.987	42.710
7.987	43.794
7.987	44.661
7.987	45.745
7.987	46.612
7.987	47.480
7.987	47.913
7.987	48.780
7.987	49.431
7.987	50.515
7.987	51.165
7.987	52.033
7.987	52.900
7.987	53.550
7.987	53.984
7.960	54.634
7.960	55.285
7.960	55.718
7.960	56.369
8.013	58.537
9.019	37.940
8.992	48.347
8.992	50.081
8.992	50.949
8.992	51.599
8.992	52.249
8.992	52.900
8.992	53.333
8.992	53.984
8.992	54.417
8.966	55.285
8.992	56.369
8.992	57.019
8.992	57.669
8.992	58.103
8.992	60.271
10.051	43.360
10.025	50.515
9.998	53.767
9.998	54.417
9.998	55.285
9.998	56.152
9.998	57.236
9.998	58.320
9.998	59.621
9.998	60.921
9.998	61.789
9.998	62.656
9.998	64.390
11.030	50.298
11.030	51.816
11.004	52.466
11.004	52.900
11.004	54.201
11.004	54.851
12.036	52.249
12.036	54.634
12.009	60.054
12.036	66.775
13.042	59.404
13.042	60.488
13.042	62.222
13.994	57.236
13.994	58.320
13.994	59.404
15.000	69.160];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d' 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GrebCail2010';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [... %  time since birth (yr), total length(cm)
1.026	11.302
1.026	12.798
1.026	13.961
1.079	15.789
2.032	28.753
2.032	30.914
3.011	29.252
3.011	29.751
3.011	30.416
3.011	30.914
3.011	31.413
3.011	31.745
2.985	32.576
2.985	33.241
2.985	34.072
2.985	35.734
2.985	36.066
2.985	37.064
2.985	40.388
3.964	28.753
3.964	29.584
3.964	30.416
3.964	31.413
3.964	31.911
3.964	32.244
3.964	32.576
3.964	33.075
3.964	33.573
3.964	34.238
3.964	34.903
3.964	35.402
3.964	36.066
3.964	36.565
3.964	37.230
3.964	38.227
3.964	38.560
3.964	39.058
3.964	39.557
3.964	39.723
3.964	40.388
3.964	42.548
3.964	44.211
3.964	44.709
3.964	46.870
4.943	29.917
4.943	30.249
4.943	31.247
4.943	31.911
4.943	33.075
4.943	33.740
4.943	34.238
4.943	34.737
4.943	35.069
4.943	35.734
4.943	36.066
4.943	36.565
4.943	37.729
4.943	38.560
4.943	39.058
4.943	39.557
4.943	40.055
4.943	41.053
4.943	42.715
5.922	30.083
5.922	30.582
5.922	31.247
5.922	31.911
5.922	33.241
5.922	34.238
5.922	35.069
5.922	35.734
5.922	36.233
5.922	36.731
5.922	37.064
5.922	37.729
5.922	38.227
5.922	39.391
5.896	40.388
5.896	41.219
5.896	41.717
5.896	42.715
5.896	43.380
5.896	43.712
5.896	46.039
5.896	46.870
5.896	47.535
5.896	49.197
6.849	35.069
6.849	35.900
6.875	36.399
6.875	37.064
6.875	37.729
6.875	38.227
6.875	38.892
6.875	39.224
6.875	39.557
6.875	40.055
6.875	40.388
6.875	40.886
6.875	40.886
6.875	41.385
6.875	41.884
6.902	43.047
6.902	43.878
6.902	44.377
6.902	44.875
6.902	45.208
6.902	45.706
6.902	47.036
6.902	47.867
6.902	48.366
7.828	38.726
7.828	40.055
7.828	42.050
7.854	43.380
7.854	45.540
7.854	46.205
7.854	47.535
7.854	49.861
8.860	39.557
8.860	40.554
8.860	41.219
8.860	41.884
8.887	45.208
8.807	50.360
9.866	37.895
9.813	44.543
9.813	47.701
9.813	48.532
10.819	43.213
10.819	43.878
10.819	45.374
10.819	46.039
10.792	51.856
11.745	44.377
13.730	48.033];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d' 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GrebCail2010';
comment.tL_m = 'Data for males; temp is guessed';

% weight-fecundity
data.WN = [ ... wet weight (100 g), number of 1000 eggs 
14 61
17 37
24 65
25 69
27 54
33 93
34 87
37 89
40 100
41 90
42 97
18 53
27 56
38 99
45 82
46 81
56 77];
data.WN(:,1) = data.WN(:,1) * 100; data.WN(:,2) = data.WN(:,2) * 1000;
units.WN = {'g' '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(15); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'OCon1973';
comment.WN = 'temp is guessed';

% length-weight
data.LW = [ ...
6.480	28.609
6.483	57.219
6.955	38.146
7.431	57.219
7.745	38.146
8.219	38.146
8.693	38.146
9.325	38.146
10.114	19.073
10.117	57.219
10.907	57.219
11.379	38.146
11.856	66.755
12.646	66.755
12.806	85.828
13.122	85.828
13.909	47.682
14.699	57.219
16.280	66.755
16.284	104.901
16.916	104.901
17.545	66.755
19.288	123.974
20.234	104.901
29.731	286.093
28.950	390.993
30.061	448.212
30.690	410.066
32.125	562.649
33.390	572.185
33.394	610.331
33.396	638.940
33.717	696.159
35.137	667.550
34.991	810.596
35.012	1049.007
37.529	915.497
38.638	953.642
38.958	1001.325
39.587	963.179
39.582	905.960
41.162	905.960
40.696	991.788
39.126	1115.762
40.708	1134.834
41.663	1211.126
43.085	1211.126
44.507	1211.126
42.943	1392.318
44.525	1411.391
45.482	1516.291
46.435	1573.510
45.333	1621.192
45.809	1640.265
45.020	1649.801
47.235	1678.411
47.239	1726.093
47.087	1802.384
47.724	1850.066
47.885	1888.212
48.833	1888.212
48.526	1993.113
50.424	2012.185
50.274	2098.013
52.813	2221.987
51.086	2355.497
51.565	2412.715
49.827	2412.715
49.037	2412.715
52.986	2393.642
53.775	2384.106
54.249	2384.106
54.111	2612.980
53.644	2689.272
52.697	2708.344
54.139	2927.682
55.859	2717.881
58.386	2708.344
59.964	2689.272
61.107	3108.874
61.116	3213.775
59.220	3213.775
58.587	3194.702
59.384	3280.530
57.183	3404.503
55.596	3328.212
55.586	3213.775
60.987	3538.013
59.888	3614.305
61.169	3814.570
59.606	4005.298
61.046	4215.099
62.624	4186.490
63.284	4501.192
64.232	4501.192
60.923	4606.093
63.627	4815.894
66.306	4730.066
65.224	5006.623
63.198	5321.325
65.435	5607.417
72.360	7095.099];
units.LW = {'cm' 'g'}; label.LW = {'total length','wet weight'};  
bibkey.LW = 'OCon1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
set2 = {'tL'}; subtitle2 = {'Data from OCon1973'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'hatch is here treated at birth in lack of info about start feeding; mouth is open at hatch';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'largest Cottidae';
metaData.bibkey.F1 = 'GrebCail2010';
F2 = 'SL = 0.83 * TL, relation between standard and total length';
metaData.bibkey.F2 = 'OCon1973';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4VWV4'; % Cat of Life
metaData.links.id_ITIS = '167353'; % ITIS
metaData.links.id_EoL = '46569155'; % Ency of Life
metaData.links.id_Wiki = 'Scorpaenichthys_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Scorpaenichthys_marmoratus'; % ADW
metaData.links.id_Taxo = '153452'; % Taxonomicon
metaData.links.id_WoRMS = '282726'; % WoRMS
metaData.links.id_fishbase = 'Scorpaenichthys-marmoratus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaenichthys_marmoratus}}';
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
bibkey = 'OCon1973'; type = 'Article'; bib = [ ... 
'author = {O''Connell, C. P.}, ' ... 
'year = {1953}, ' ...
'title = {The life history of the cabezon, \emph{Scorpaenichthys marmoratus} ({A}yres).}, ' ...
'journal = {California Department of Fish and Game, Fish Bulletin}, ' ...
'volume = {93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GrebCail2010'; type = 'Article'; bib = [ ... 
'author = {J. M. Grebel and G. M. Cailliet}, ' ... 
'year = {2010}, ' ...
'title = {AGE, GROWTH, AND MATURITY OF CABEZON (\emph{Scorpaenichthys marmoratus}) IN {C}ALIFORNIA.}, ' ...
'journal = {California Fish and Game}, ' ...
'volume = {96}, ' ...
'number = {1}, '...
'pages = {36--52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'swrcb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.swrcb.ca.gov/rwqcb3/water_issues/programs/duke_energy/docs/sampling/cabezon.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scorpaenichthys-marmoratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


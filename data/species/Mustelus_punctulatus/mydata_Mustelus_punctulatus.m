function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_punctulatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_punctulatus'; 
metaData.species_en = 'Blackspotted smooth-hound '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.8); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'WWi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data;
data.ab = 365*11.5/12; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(18.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Mustelus_antarcticus';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'GracPola2021';   
  temp.am = C2K(18.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishbase gives 16 yrs';

data.Lb = 32.5;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'guess';
  comment.Lb = 'based on Mustelus_antarcticus';
data.Lp = 100;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty for females';bibkey.Lp  = 'GracPola2021';
data.Lpm = 85;  units.Lpm  = 'cm';    label.Lpm  = 'total length at  for males';bibkey.Lpm  = 'GracPola2021';
data.Li  = 190;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwp = 7.2e3;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00347*Lp^3.16, see F1';
data.Wwi = 55e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00347*Li^3.16, see F1';

data.Ri  = 22.3/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'GracPola2021';   
  temp.Ri = C2K(18.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '22.3 pups per litter, 1 litter per 2 yrs assumed';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.967	49.685
1.994	52.092
1.995	55.702
2.022	46.877
2.493	50.487
2.494	54.097
2.548	56.905
2.549	59.713
2.964	50.086
3.017	74.556
3.018	65.330
3.019	56.905
3.020	53.696
3.021	48.883
3.047	58.510
3.048	44.470
3.961	50.487
3.989	51.289
4.016	70.143
4.017	52.493
4.044	79.370
4.514	63.725
4.515	76.160
4.543	72.951
4.986	76.562
4.987	71.748
5.013	85.387
5.014	80.172
5.015	78.166
5.568	74.957
5.956	72.951
6.010	77.364
6.011	80.573
6.012	86.189
6.013	92.206
6.039	70.946
6.482	88.195
6.510	92.607
6.511	74.155
6.537	77.765
6.538	72.149
6.898	80.172
6.953	74.155
6.981	88.997
7.008	70.946
7.009	81.777
7.036	76.963
7.479	90.602
7.507	98.625
7.590	95.014
8.005	72.149
8.006	80.573
8.007	83.381
8.008	87.794
8.974	92.206
8.975	91.805
8.976	85.788
9.003	80.974
9.004	74.155
9.529	95.014
9.557	98.224
9.917	93.009
10.000	84.986
10.554	112.264
10.970	107.049
11.053	115.072
11.524	101.834
12.521	106.648
12.992	108.252
13.490	113.467
14.017	119.083
17.008	131.117
19.003	137.536];
data.tL_f(:,1) = (0+data.tL_f(:,1))*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GracPola2021';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.524	52.507
1.543	51.124
1.562	48.703
1.971	45.591
1.972	53.890
1.991	47.320
1.992	57.003
2.011	50.086
2.031	55.274
2.438	47.320
3.042	48.703
3.043	53.545
3.044	57.695
3.045	68.069
3.082	51.124
3.530	53.199
3.549	51.470
4.039	73.256
4.040	75.331
4.075	58.732
4.076	61.153
4.507	73.256
4.525	69.107
4.995	81.556
5.012	65.648
5.013	71.182
5.031	68.069
5.032	73.948
5.033	78.444
5.091	77.752
5.480	71.182
5.521	87.781
5.541	90.202
6.004	59.424
6.005	65.994
6.006	73.948
6.007	86.052
6.008	88.127
6.024	64.265
6.025	68.415
6.027	80.519
6.045	76.715
6.534	87.781
7.018	73.256
7.021	91.585
7.040	86.052
7.041	88.818
7.042	100.576
7.548	98.847
7.993	76.715
8.032	81.556
8.035	98.847
8.036	102.305
8.521	93.660
8.542	100.576
8.971	106.110
8.989	98.847
9.007	85.706
9.025	78.790
9.027	92.622
9.498	113.718
9.516	104.380
9.534	93.660
9.960	81.902
9.962	94.697
10.003	107.493
10.489	101.614
10.532	126.513
10.546	94.352
10.566	96.427
11.054	102.305
11.970	108.530
13.994	102.305
14.033	100.576];
data.tL_m(:,1) = (0+data.tL_m(:,1))*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GracPola2021';

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
1.981	452.506
2.036	315.551
2.476	317.061
2.503	625.726
2.997	215.998
2.998	627.424
2.999	764.567
3.026	1073.233
3.054	559.043
4.016	870.916
4.017	1008.059
4.126	322.720
4.127	1351.293
4.512	906.898
4.567	1284.228
4.594	735.753
4.952	1182.694
4.979	1354.217
5.007	1765.737
5.034	1045.834
5.554	1081.911
5.995	1117.705
5.996	1666.278
5.997	1803.421
5.998	2420.564
6.025	1392.086
6.492	2285.119
6.493	1770.831
6.494	1222.261
6.520	948.069
6.521	365.211
6.547	1393.878
6.548	1085.307
6.960	1463.863
6.988	1155.386
7.015	915.482
7.016	1601.195
7.043	2012.719
7.483	2699.940
7.510	2460.037
7.923	952.880
8.005	1261.734
8.006	1501.736
8.033	2016.114
8.968	2259.323
8.996	1985.131
9.051	1196.748
9.078	2842.554
9.491	2741.115
9.546	2364.158
9.931	2674.050
10.069	2400.235
10.509	4733.176
11.004	4323.444
11.032	5317.823
11.499	4702.283
11.527	3810.952
12.490	3608.537
13.012	3918.900
13.508	4297.743
14.003	5499.438
17.001	9006.863
19.037	10213.844];
data.tW_f(:,1) = (0+data.tW_f(:,1))*365; % % convert yr to d
units.tW_f = {'d', 'g'};     label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f = C2K(18.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GracPola2021';
%
data.tW_m = [ ... % time since birth (yr), weight (g)
1.549	307.692
1.994	358.975
2.032	307.692
2.033	461.538
2.071	239.316
2.535	205.129
3.038	239.316
3.061	871.796
3.077	307.692
3.097	512.821
3.502	307.692
3.503	393.162
4.027	666.667
4.044	324.786
4.048	1094.017
4.049	1179.488
4.531	888.890
5.033	837.607
5.035	1059.829
5.053	940.171
5.057	1538.462
5.071	735.044
5.077	1606.838
5.113	1230.769
5.483	1658.120
5.523	1863.247
5.537	957.266
5.538	1111.112
6.018	615.385
6.019	700.854
6.038	820.513
6.039	888.890
6.044	1606.838
6.045	1811.967
6.056	564.104
6.060	1094.017
6.061	1196.582
6.080	1230.769
6.085	2051.283
6.567	1760.684
7.012	1846.154
7.013	1982.906
7.025	820.513
7.033	2068.376
7.053	2222.222
7.054	2358.975
7.542	3094.017
7.976	1452.992
7.994	1145.299
8.048	598.291
8.061	2564.104
8.063	2923.077
8.467	2564.104
8.505	2427.351
8.509	3025.642
8.545	2700.854
8.969	2393.162
9.025	2222.222
9.029	2786.324
9.042	1777.778
9.054	3589.744
9.058	1213.676
9.523	4393.162
9.534	3162.393
9.555	3435.898
9.569	2598.291
10.006	1367.522
10.052	2547.008
10.058	3367.522
10.533	2119.659
10.534	5384.615
10.535	2478.632
10.553	2256.412
10.560	3316.239
11.046	3641.025
12.037	4410.256
14.000	2957.266
14.081	3589.744];
data.tW_m(:,1) = (0+data.tW_m(:,1))*365; % convert yr to d
units.tW_m = {'d', 'g'};     label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m = C2K(18.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GracPola2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00347*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44R34'; % Cat of Life
metaData.links.id_ITIS = '160247'; % ITIS
metaData.links.id_EoL = '46559985'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_punctulatus'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_punctulatus'; % ADW
metaData.links.id_Taxo = '101357'; % Taxonomicon
metaData.links.id_WoRMS = '105823'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-punctulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_punctulatus}}';  
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
bibkey = 'GracPola2021'; type = 'article'; bib = [ ... 
'doi = {10.20302/NC.2021.30.31}, ' ...
'author = {Romana Gra\v{c}an and Tanja Polak and Bojan lazar}, ' ...
'year = {2021}, ' ...
'title  = {LIFE HISTORY TRAITS OF THE BLACKSPOTTED SMOOTH-HOUND \emph{Mustelus punctulatus} ({C}ARCHARHINIFORMES: {T}RIAKIDAE) IN THE {A}DRIATIC {S}EA}, ' ...
'journal = {Nat. Croat.}, ' ...
'volume = {30(2)}, ' ...
'pages = {475-492}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-punctulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


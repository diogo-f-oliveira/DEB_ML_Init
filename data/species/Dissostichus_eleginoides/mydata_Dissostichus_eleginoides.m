function [data, auxData, metaData, txtData, weights] = mydata_Dissostichus_eleginoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Dissostichus_eleginoides'; 
metaData.species_en = 'Patagonian toothfish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.5); % K, body temp
metaData.data_0     = {'ab';'ap';'am';'Lp';'Li';'Wwb';'Wwi';'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'}; 
metaData.date_subm   = [2018 12 23]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 75;    units.ab = 'd';   label.ab = 'age at birth';  bibkey.ab = 'fishbase';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 8*365;    units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(4.5); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '8 till 10 yr';
data.am = 50*365;    units.am = 'd';   label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(4.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 50;    units.Lp  = 'cm'; label.Lp  = 'total length at puberty';   bibkey.Lp  = 'fishbase';
  comment.Lp = '38 to 60 cm';
data.Li  = 215;    units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.0477;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 4.5 mm: pi/6*0.45^3';
data.Wwi = 157e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00603*Li^3.18, see F1'; 

data.Ri  = 545665/365; units.Ri  = '#/d'; label.Ri  = 'maximum reproduction rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.990	32.890
1.990	39.852
2.090	27.193
2.189	35.420
2.189	37.952
2.886	37.944
2.985	41.108
3.582	48.063
3.781	38.568
3.781	41.099
3.881	44.263
3.881	52.491
3.881	55.655
3.881	57.554
3.980	60.085
4.677	58.811
4.776	61.975
4.975	53.112
4.975	56.910
5.075	44.883
5.075	48.681
5.075	65.769
5.970	61.329
5.970	62.595
6.070	57.531
6.070	66.392
6.070	67.657
6.070	70.189
6.070	76.518
6.269	65.124
6.766	58.156
6.766	68.916
6.866	67.016
6.866	71.447
6.965	64.483
6.965	65.749
7.065	61.951
7.761	84.728
7.761	86.627
7.861	71.436
7.861	77.132
7.960	67.005
7.960	81.562
7.960	89.789
7.960	92.321
8.259	70.166
8.856	89.780
8.856	92.312
8.856	94.210
8.955	73.956
8.955	76.488
8.955	79.019
9.055	71.423
9.055	80.917
9.055	80.917
9.055	83.449
9.851	79.643
9.950	85.971
9.950	91.667
9.950	91.667
9.950	97.996
10.050	88.502
10.050	101.160
10.746	80.899
10.746	84.697
10.746	87.861
10.746	92.925
10.846	78.367
10.846	105.582
10.846	113.177
10.945	91.024
10.945	103.682
11.045	96.086
11.045	97.985
11.045	100.516
11.940	71.393
11.940	90.380
11.940	92.279
11.940	94.178
11.940	96.077
11.940	98.608
11.940	106.203
11.940	111.266
11.940	113.798
11.940	116.330
11.940	120.127
12.040	117.595
12.139	80.885
12.338	84.047
12.736	129.612
12.836	111.890
12.836	116.320
12.836	122.649
12.935	118.851
13.035	86.571
13.035	93.533
13.035	96.698
13.035	99.230
13.035	101.761
13.035	103.660
13.035	103.660
13.035	104.293
13.035	106.192
13.035	108.723
13.035	127.711
13.035	133.407
13.831	102.386
13.930	85.296
13.930	106.182
13.930	106.815
13.930	107.448
13.930	111.245
13.930	113.777
13.930	115.043
13.930	116.309
14.030	122.004
14.030	122.004
14.030	126.434
14.030	128.966
14.030	136.561
14.129	96.686
14.129	122.003
14.527	90.353
14.726	85.288
14.726	92.250
14.726	109.338
14.726	112.503
14.726	115.667
14.826	98.578
14.826	101.109
14.826	104.274
14.826	106.173
14.826	116.299
14.826	118.198
14.826	120.730
14.826	123.261
14.925	129.589
15.622	121.354
15.622	123.886
15.821	125.782
15.821	129.580
15.821	130.846
15.920	98.566
15.920	105.528
15.920	107.427
16.020	118.818
16.020	136.540
16.119	116.286
16.219	110.588
16.219	113.120
16.219	113.753
16.219	116.285
16.318	122.613
16.716	106.153
16.716	109.317
16.915	113.113
16.915	116.277
16.915	118.176
16.915	118.809
16.915	119.442
16.915	121.341
16.915	124.505
16.915	127.670
16.915	142.227
17.015	92.858
17.015	132.099
17.811	108.040
17.910	111.203
17.910	130.824
18.010	118.797
18.010	119.430
18.010	121.329
18.010	121.329
18.010	123.861
18.010	126.392
18.209	116.264
18.706	93.474
18.806	123.852
18.806	127.017
18.806	128.916
18.806	128.916
18.905	116.889
18.905	119.421
19.005	106.129
19.005	110.559
19.005	111.192
19.005	114.989
19.005	147.268
19.701	131.438
19.900	135.233
19.900	178.271
20.000	115.612
20.000	118.776
20.000	123.840
20.000	140.928
20.100	156.117
20.796	114.338
20.796	119.401
20.995	140.918
21.990	119.388
21.990	124.452
22.090	106.729
22.289	135.208
23.085	127.605
23.184	114.945
24.776	146.574
26.070	172.510
27.861	148.440
27.861	109.833
30.149	123.733
30.149	126.264
35.025	161.023
35.821	181.901
36.020	185.696
44.975	161.551
48.955	159.610];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(4.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Horn2002';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.090	28.464
2.090	32.100
2.090	35.736
2.090	37.555
2.189	26.038
2.488	36.339
2.786	32.699
2.786	37.548
2.786	40.578
2.786	52.699
3.881	59.961
3.980	41.778
3.980	48.445
3.980	49.657
3.980	52.081
3.980	54.505
3.980	57.536
3.980	66.020
4.080	43.595
4.080	46.625
4.876	59.951
4.876	61.163
4.876	62.375
5.075	46.009
5.075	53.282
5.075	55.706
5.075	57.524
5.075	58.737
5.771	70.851
5.771	73.881
5.871	56.910
5.871	58.729
5.871	69.032
5.871	76.910
5.970	55.697
5.970	64.788
5.970	66.000
5.970	67.818
5.970	87.818
6.667	64.175
6.667	75.084
6.766	81.144
6.766	78.720
6.766	82.356
6.866	77.506
6.866	92.052
7.065	68.413
7.065	70.838
7.065	72.050
7.861	67.193
7.861	70.224
7.861	73.254
7.960	61.738
7.960	84.162
7.960	90.223
9.154	86.574
9.950	67.172
9.950	81.718
9.950	85.354
9.950	88.990
9.950	91.415
9.950	96.263
9.950	101.112
10.846	105.951
10.846	107.163
11.045	101.101
11.741	91.397
11.841	113.214
11.940	92.001
11.940	96.243
11.940	98.667
11.940	101.698
11.940	103.516
11.940	104.122
11.940	104.122
11.940	104.122
11.940	107.758
11.940	108.364
11.940	110.788
11.940	110.788
11.940	111.395
11.940	112.607
11.940	115.637
11.940	119.879
12.836	115.628
12.836	119.264
12.935	96.839
12.935	99.869
12.935	101.688
12.935	102.294
12.935	105.324
12.935	105.930
12.935	107.748
12.935	110.172
12.935	110.778
12.935	113.203
12.935	115.627
13.035	88.959
13.035	123.505
13.731	105.922
13.930	109.556
13.930	111.374
13.930	113.193
13.930	113.193
13.930	113.799
13.930	115.011
13.930	115.617
13.930	116.223
13.930	118.041
13.930	118.041
13.930	118.647
13.930	123.496
13.930	122.284
14.030	83.495
14.030	94.404
14.030	101.070
14.726	114.397
14.726	115.003
14.726	117.427
14.726	118.033
14.726	119.245
14.726	121.669
14.826	96.820
14.826	99.244
14.826	103.487
14.826	105.305
14.826	106.517
14.826	109.547
14.826	110.759
14.826	111.971
14.826	113.184
14.925	91.364
14.925	123.486
15.025	87.121
15.821	96.810
15.821	116.810
15.920	101.051
15.920	114.385
15.920	115.597
15.920	121.051
16.020	107.111
16.020	110.141
16.020	110.747
16.020	113.778
16.915	87.102
16.915	101.041
16.915	103.466
16.915	105.284
16.915	107.708
16.915	108.314
16.915	110.738
16.915	111.950
16.915	113.162
16.915	114.375
17.015	118.010
17.114	134.979
17.910	96.789
18.010	105.879
18.010	113.151
18.010	115.576
18.010	122.848
18.706	103.447
19.005	110.717
19.005	113.141
19.005	116.778
19.005	117.990
19.900	113.132
19.900	114.951
19.900	114.951
20.896	108.274
20.896	113.122
20.896	116.153
20.995	134.333
21.891	111.900
21.990	122.808
24.080	107.636
24.080	123.393
26.866	119.123
27.960	145.778
31.045	147.565
31.045	126.959
31.841	145.739
33.035	120.272
34.826	114.800
34.925	142.071
35.025	152.980
36.816	156.598
37.910	123.253
42.985	149.869
51.841	119.476
52.040	160.686
52.935	120.677];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(4.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Horn2002';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 10 * weights.Ri;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'At 12-15 cm TL, semi-pelagic juveniles become demersal at 150-400 m depth. Adults migrate to deeper habitats at depths greater than 1,000 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6DB7Y'; % Cat of Life
metaData.links.id_ITIS = '642807'; % ITIS
metaData.links.id_EoL = '46573002'; % Ency of Life
metaData.links.id_Wiki = 'Dissostichus_eleginoides'; % Wikipedia
metaData.links.id_ADW = 'Dissostichus_eleginoides'; % ADW
metaData.links.id_Taxo = '146673'; % Taxonomicon
metaData.links.id_WoRMS = '234700'; % WoRMS
metaData.links.id_fishbase = 'Dissostichus-eleginoides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Dissostichus_eleginoides}}';
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
bibkey = 'Horn2002'; type = 'Article'; bib = [ ... 
'author = {P.L. Horn}, ' ... 
'year = {2002}, ' ...
'title = {Age and growth of {P}atagonian toothfish (\emph{Dissostichus eleginoides}) and {A}ntarctic toothfish (\emph{D. mawsoni}) in waters from the {N}ew {Z}ealand subantarctic to the {R}oss {S}ea, {A}ntarctica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {56}, ' ...
'pages = {275-287}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Dissostichus-eleginoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

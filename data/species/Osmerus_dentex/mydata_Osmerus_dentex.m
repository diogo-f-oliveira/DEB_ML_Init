  function [data, auxData, metaData, txtData, weights] = mydata_Osmerus_dentex

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Osmerus_dentex'; 
metaData.species_en = 'Pacific rainbow smelt'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MPN','MN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 13];

%% set data
% zero-variate data
data.ab = 27; units.ab = 'd';       label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(-0.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Osmerus_mordax';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'NamNaka2021';   
  temp.am = C2K(-0.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 34;   units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
 
data.Wwb = 2.2e-4;   units.Wwb = 'cm';  label.Wwb = 'wet weight birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm: pi/6*0.075^3';
data.Wwp  = 25.6;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00407*Lp^3.23, see F1';
data.Wwi  = 360;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00407*Li^3.23, see F1';

data.Ri = 7e4/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
    
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.374	11.199
1.393	12.688
1.393	11.969
1.402	13.664
1.402	13.202
1.402	13.048
1.402	12.226
1.402	11.712
1.411	10.531
1.411	10.274
1.411	10.068
1.439	11.507
1.439	10.942
1.439	10.685
1.540	13.767
1.549	11.558
1.549	12.842
1.559	12.534
1.559	13.151
1.568	12.072
1.568	12.226
1.706	14.332
1.706	13.099
1.780	13.716
1.789	9.966
1.845	12.997
1.845	12.791
1.845	12.226
1.845	11.866
1.863	12.637
1.881	11.353
1.900	14.075
1.928	13.202
1.992	11.558
2.011	16.490
2.011	16.336
2.020	15.771
2.020	15.565
2.029	15.976
2.379	14.897
2.389	13.459
2.389	17.517
2.407	19.932
2.407	12.791
2.426	13.818
2.426	14.075
2.426	16.490
2.426	18.442
2.426	19.058
2.435	18.750
2.444	14.127
2.444	16.798
2.472	12.277
2.472	18.082
2.481	12.842
2.499	17.723
2.518	12.740
2.536	20.908
2.536	15.411
2.536	17.158
2.545	15.565
2.545	17.620
2.564	13.818
2.601	18.853
2.711	19.110
2.739	18.493
2.758	16.644
2.831	16.079
2.896	17.003
2.960	21.010
2.960	12.791
2.970	20.342
2.970	21.473
2.988	19.572
2.997	17.723
2.997	18.647
2.997	19.058
2.997	21.216
3.007	19.315
3.016	17.466
3.016	18.288
3.025	18.134
3.025	19.983
3.034	16.952
3.034	17.312
3.062	16.233
3.062	16.490
3.302	21.986
3.412	20.908
3.422	19.675
3.422	20.137
3.431	19.521
3.431	20.599
3.431	21.062
3.431	21.216
3.431	21.318
3.431	22.140
3.431	23.527
3.514	18.904
3.523	19.212
3.532	20.651
3.542	18.339
3.542	19.829
3.542	20.188
3.551	20.291
3.809	20.651
3.827	18.699
3.892	20.291
3.938	18.236
3.947	23.168
3.947	19.777
3.966	22.757
3.966	20.342
3.993	22.397
3.993	22.192
3.993	19.983
4.003	22.089
4.003	21.884
4.003	21.473
4.003	21.267
4.003	21.164
4.003	20.240
4.012	23.476
4.012	21.010
4.012	20.856
4.012	20.086
4.012	19.572
4.021	20.137
4.058	19.161
4.298	23.938
4.316	23.116
4.335	21.627
4.399	22.140
4.427	22.038
4.427	21.010
4.427	20.188
4.501	18.134
4.510	21.113
4.510	23.116
4.519	20.599
4.528	21.935
4.528	24.092
4.528	22.346
4.547	21.524
4.556	20.188
4.565	21.267
4.667	21.113
4.676	20.548
4.934	20.342
4.953	21.575
4.953	20.959
4.962	20.753
4.971	25.582
4.971	23.322
4.989	23.116
4.989	21.729
4.999	25.377
4.999	25.274
4.999	24.966
4.999	22.603
5.017	24.760
5.017	22.397
5.017	21.884
5.026	24.709
5.036	24.452
5.036	24.349
5.036	24.041
5.036	22.346
5.036	21.986
5.045	23.836
5.045	22.038
5.275	23.373
5.349	23.116
5.395	22.397
5.441	22.397
5.487	24.966
5.506	23.733
5.534	24.503
5.534	24.092
5.534	23.579
5.534	22.603
5.543	22.397
5.543	21.884
5.543	21.370
5.543	20.651
5.561	23.219
5.561	23.065
5.986	23.887
5.995	23.322
5.995	24.041
5.995	26.301
5.995	26.199
6.004	22.962
6.013	23.579
6.013	23.579
6.013	24.349
6.013	24.401
6.022	24.760
6.022	25.274
6.022	25.685
6.041	25.017
6.059	25.377
6.069	26.610
6.299	22.603
6.382	26.661
6.410	24.041
6.437	26.866
6.520	23.836
6.539	26.558
6.705	25.274
6.816	24.914];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365; % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(-0.4); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'NamNaka2021'};

% length-weight
data.LW = [ ... % std length (cm), weight (g)
9.855	9.476
10.294	8.978
10.613	9.975
10.933	10.973
11.293	15.461
11.532	15.461
11.572	13.466
11.611	12.469
12.011	17.456
12.489	12.469
12.490	17.456
12.730	21.446
12.849	14.963
13.009	19.451
13.089	18.454
13.368	19.950
13.567	14.464
13.767	17.456
13.767	17.955
13.849	29.426
13.887	22.943
14.087	21.945
14.406	22.943
14.446	23.940
14.766	25.436
15.444	26.434
15.445	29.426
15.605	32.419
15.646	41.895
15.767	43.890
15.805	38.404
15.884	34.913
16.045	41.895
16.165	42.893
16.323	35.910
16.364	40.399
16.445	46.883
16.486	52.868
16.724	42.394
16.764	46.883
16.842	33.416
16.925	49.875
17.043	41.895
17.045	51.372
17.083	45.387
17.244	50.374
17.483	48.379
17.524	55.362
17.566	65.337
17.643	49.377
17.764	58.853
17.765	61.845
18.126	70.324
18.163	57.855
18.166	75.312
18.242	54.863
18.282	52.369
18.284	66.833
18.323	61.845
18.362	57.855
18.365	70.823
18.401	49.875
18.483	60.848
18.483	64.339
18.523	62.843
18.804	69.825
18.884	73.815
18.962	62.843
18.963	70.324
18.965	78.304
19.001	59.850
19.002	62.344
19.163	69.327
19.205	79.800
19.324	78.304
19.364	81.297
19.443	75.312
19.525	88.279
19.564	81.796
19.604	84.289
19.645	87.781
19.759	61.347
19.842	73.815
19.845	92.269
19.881	70.823
19.883	80.798
19.922	78.803
19.923	82.294
19.966	96.758
20.002	78.803
20.002	78.803
20.044	88.279
20.202	78.304
20.205	95.761
20.283	84.289
20.284	93.267
20.286	100.748
20.322	81.297
20.446	104.239
20.484	95.262
20.522	85.786
20.565	97.756
20.642	86.783
20.642	88.279
20.683	91.272
20.726	106.733
20.843	95.761
20.883	93.766
20.885	102.743
20.922	88.778
20.922	92.269
20.967	116.209
20.967	116.209
21.084	100.249
21.087	115.212
21.163	97.756
21.202	91.771
21.242	93.766
21.243	101.247
21.284	105.736
21.325	109.227
21.442	98.753
21.483	102.244
21.526	117.706
21.605	113.716
21.643	105.237
21.644	110.224
21.762	103.242
21.765	115.711
21.841	94.763
22.042	105.736
22.043	108.728
22.085	121.696
22.123	111.222
22.124	117.207
22.127	129.676
22.205	122.195
22.206	126.683
22.241	102.743
22.243	112.219
22.327	134.663
22.403	113.217
22.404	121.197
22.523	114.713
22.563	117.706
22.564	123.691
22.601	106.733
22.606	130.175
22.686	135.162
22.763	121.197
22.765	129.676
22.801	107.731
22.842	115.212
22.848	144.638
22.882	113.716
22.883	120.199
22.883	123.192
22.926	137.157
22.961	110.224
22.964	125.686
23.000	105.736
23.002	116.708
23.006	137.157
23.047	142.145
23.080	108.728
23.085	133.167
23.124	130.175
23.205	133.167
23.210	159.102
23.245	138.155
23.280	110.224
23.281	116.209
23.283	128.678
23.367	145.636
23.405	136.658
23.484	133.666
23.486	143.142
23.604	134.165
23.606	146.633
23.759	113.217
23.770	166.584
23.798	109.227
23.803	135.661
23.839	115.212
23.881	122.693
23.884	137.656
23.886	148.130
23.918	110.224
23.960	119.701
23.966	152.618
24.002	128.678
24.004	138.653
24.012	183.541
24.120	122.693
24.123	135.661
24.131	178.055
24.204	144.140
24.289	168.579
24.358	115.212
24.367	162.095
24.402	136.160
24.479	121.197
24.482	136.160
24.483	143.641
24.565	155.611
24.645	157.107
24.649	177.057
24.687	165.087
24.763	144.140
24.769	178.055
24.805	157.606
24.928	173.067
24.960	133.167
24.962	144.140
24.968	173.566
25.006	166.085
25.090	183.541
25.133	200.499
25.168	175.561
25.244	159.601
25.252	196.010
25.286	169.077
25.362	147.132
25.412	198.005
25.609	189.526
25.641	149.626
25.690	193.516
25.771	199.002
26.082	160.100
26.403	169.576
26.726	188.529
26.930	211.471];
units.LW = {'cm', 'g'}; label.LW = {'std length','weight'};  
bibkey.LW = {'NamNaka2021'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
 
%% Facts
F1 = 'length-weight: Ww in g = 0.00407*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74ZTJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2471945'; % Ency of Life
metaData.links.id_Wiki = 'Pacific_rainbow_smelt'; % Wikipedia
metaData.links.id_ADW = 'Osmerus_dentex'; % ADW
metaData.links.id_Taxo = '502202'; % Taxonomicon
metaData.links.id_WoRMS = '254557'; % WoRMS
metaData.links.id_fishbase = 'Osmerus-dentex'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pacific_rainbow_smelt}}';  
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
bibkey = 'NamNaka2021'; type = 'Article'; bib = [ ...  
'author = {Tran Nguyen Hai Nam and Mitsuhiro Nakaya and Tetsuya Takatsu}, ' ...
'year = {2021}, ' ...
'title = {Age and growth of {P}acific rainbow smelt \emph{Osmerus dentex} estimated from scales and otoliths in {F}unka {B}ay and the {Y}amazaki {R}iver, {J}apan}, ' ... 
'journal = {Aquacult. Sci.}, ' ...
'volume = {69(2)}, '...
'pages = {153－161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BurlZhuk2020'; type = 'Article'; bib = [ ...  
'author = {O. V. Burlaka and K. A. Zhukova}, ' ...
'year = {2020}, ' ...
'title = {Reproductive Biology of Rainbow Smelt \emph{Osmerus dentex} ({O}smeridae) of the {A}mur {R}iver}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {60(3)}, '...
'pages = {462–469}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Osmerus-dentex.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

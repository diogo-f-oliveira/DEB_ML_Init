function [data, auxData, metaData, txtData, weights] = mydata_Saurida_elongata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Saurida_elongata'; 
metaData.species_en = 'Slender lizardfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 12];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'SakaYone2009';  
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess';
data.Li = 50;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'YangChen2013';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Trachinocephalus_myops: pi/6*0.08^3';
data.Wwi = 1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.07, see F1, gives 904 g';

data.Ri = 1.5e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Trachinocephalus_myops: 426200*(50/32.6)^3';
  
% uni-variate data
% time-length
data.tL = [ ... % age (years) ~ fork length (cm) 
1	15.5
2	22.6
3	29.7
4	33.1
5	37.3
6	41.6
7   44.0];
data.tL(:,1) = 365 * (.4 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DuLu2011'; 
%
data.tL_fm = [ ... % age (years) ~ fork length (cm) 
 1	16.4 15.7
 2	21.4 20.5
 3	25.8 24.5
 4	29.5 27.8
 5	32.6 30.4
 6	35.3 32.6
 7  37.7 34.3
 8  39.6 35.8
 9  41.3 37.0
10  42.8 37.9
11  44.0 NaN];
data.tL_fm(:,1) = 365 * (.4 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(27.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SakaYone2009'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data from Tsushima/Korea Strait';

% length-weight
data.LW = [ ... % forklength (cm), weight (g)
18.892	76.003
19.624	84.751
22.157	116.819
23.172	157.472
23.283	119.799
23.452	143.000
23.568	203.878
23.958	125.645
23.959	143.036
24.128	151.744
24.522	154.671
24.860	169.189
24.915	143.106
25.196	143.126
25.366	169.225
25.648	183.739
26.041	166.376
26.100	215.655
26.322	160.599
26.605	189.605
26.717	166.425
26.829	163.534
27.055	192.536
27.450	201.260
27.617	183.881
27.786	172.299
27.956	209.993
28.071	247.682
28.181	195.516
28.406	212.924
28.407	230.315
28.574	195.545
28.584	398.444
28.690	253.524
28.913	227.453
28.969	215.863
29.139	239.064
29.253	270.956
29.364	233.283
29.418	186.910
29.534	256.484
29.644	218.811
29.702	244.902
29.703	273.887
29.756	189.833
30.096	256.525
30.151	233.340
30.152	247.833
30.319	204.367
30.434	268.143
30.491	273.944
30.492	288.437
30.494	337.713
30.605	314.533
30.659	256.565
30.771	239.182
30.775	343.530
30.828	271.070
31.053	271.087
31.055	302.971
31.165	256.602
31.168	326.168
31.220	224.722
31.221	245.012
31.336	308.788
31.503	271.119
31.504	285.612
31.671	245.044
31.732	340.701
31.741	529.108
31.842	294.332
31.898	288.539
32.012	323.330
32.066	262.464
32.180	294.357
32.183	361.024
32.349	317.557
32.630	305.984
32.687	326.278
32.748	410.340
32.801	337.880
32.967	288.617
33.022	268.331
33.025	320.505
33.139	358.194
33.197	395.880
33.248	291.536
33.250	329.217
33.326	752.411
33.364	355.312
33.472	253.871
33.480	433.581
33.531	320.542
33.644	337.941
33.699	308.960
33.703	390.119
33.758	364.036
33.760	398.819
33.875	462.596
34.042	424.926
34.151	346.673
34.153	384.355
34.263	326.392
34.265	369.870
34.270	480.015
34.322	393.063
34.492	413.365
34.658	349.609
34.659	384.391
34.886	424.988
34.887	439.480
34.947	511.949
35.049	294.565
35.051	335.145
35.053	393.116
35.114	494.569
35.165	367.037
35.226	468.490
35.279	404.726
35.280	419.219
35.394	454.010
35.449	422.130
35.503	381.554
35.557	323.587
35.563	456.921
35.678	514.900
35.726	343.889
35.840	375.781
35.901	480.134
35.954	410.572
35.955	427.964
36.012	439.562
36.125	451.164
36.403	384.518
36.407	474.373
36.410	523.649
36.462	442.493
36.464	485.972
36.578	503.371
36.585	662.792
36.687	428.017
36.689	471.495
36.965	364.269
36.966	381.660
37.031	578.766
37.082	468.625
37.137	430.948
37.194	451.242
37.198	541.097
37.252	486.029
37.253	506.318
37.305	410.670
37.419	451.258
37.421	488.939
37.424	555.606
37.479	520.828
37.538	599.093
37.757	457.080
37.758	483.167
37.815	503.461
37.815	506.359
38.043	561.448
38.093	436.814
38.210	529.576
38.323	529.584
38.378	512.197
38.387	694.806
38.439	610.752
38.607	587.576
38.657	451.348
38.658	483.232
38.661	532.507
38.669	718.015
38.716	518.019
38.718	549.903
38.887	573.104
38.995	474.561
38.998	529.633
39.096	228.191
39.115	619.497
39.116	654.280
39.225	581.824
39.278	497.770
39.280	552.842
39.338	573.136
39.448	538.362
39.506	567.351
39.510	654.308
39.559	506.486
39.620	599.244
39.677	613.741
39.678	631.132
39.717	263.019
39.787	552.879
39.845	596.361
39.901	587.670
40.011	532.605
40.020	738.403
40.122	500.729
40.174	416.675
40.240	616.680
40.294	581.901
40.300	692.047
40.309	886.250
40.402	483.358
40.411	665.968
40.414	732.635
40.462	561.624
40.464	602.203
40.581	700.763
40.644	848.593
40.690	625.408
40.745	587.731
40.747	642.804
40.792	399.329
40.802	613.822
40.862	683.392
40.963	448.616
41.030	663.114
41.080	541.378
41.135	515.295
41.197	634.141
41.310	645.743
41.313	703.714
41.422	628.360
41.473	518.219
41.527	480.541
41.643	550.115
41.651	715.333
41.652	735.623
41.702	599.395
41.703	622.583
41.706	683.453
41.772	906.646
41.930	660.281
41.931	692.165
42.098	645.800
42.149	550.152
42.266	634.218
42.282	984.944
42.441	758.868
42.488	573.365
42.546	602.354
42.546	613.948
42.605	669.025
42.663	700.913
42.674	938.595
43.001	706.735
43.054	645.869
43.060	764.710
43.112	671.960
43.119	831.381
43.182	985.009
43.227	744.433
43.230	802.404
43.237	941.535
43.282	715.451
43.333	587.918
43.447	631.405
43.506	686.482
43.564	729.964
43.727	602.440
43.734	756.064
43.850	825.637
43.904	767.670
44.013	706.808
44.078	877.828
44.233	602.477
44.314	1112.627
44.412	802.489
44.462	680.754
44.520	703.947
44.579	770.618
44.588	973.517
44.704	1040.192
44.799	666.286
44.977	857.603
44.980	918.473
45.144	822.832
45.147	889.499
45.197	756.170
45.575	408.371
45.823	915.635
46.271	866.392
46.275	959.146
46.429	640.317
46.431	683.795
46.606	814.243
47.798	1037.517];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'SakaYone2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00550*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79Q88'; % Cat of Life
metaData.links.id_ITIS = '644809'; % ITIS
metaData.links.id_EoL = '46563973'; % Ency of Life
metaData.links.id_Wiki = 'Saurida_elongata'; % Wikipedia
metaData.links.id_ADW = 'Saurida_elongata'; % ADW
metaData.links.id_Taxo = '186625'; % Taxonomicon
metaData.links.id_WoRMS = '272109'; % WoRMS
metaData.links.id_fishbase = 'Saurida-elongata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saurida_elongata}}';
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
bibkey = 'DuLu2011'; type = 'article'; bib = [ ...
'doi = {10.1007/s13131-011-0163-y}, ' ...
'author = {Du, J. and Lu, Z. and Yang, S. and Chen, M.}, ' ... 
'year   = {2011}, ' ...
'title  = {Studies on ecological characteristics variation and population dynamics of four lizardfishes in the southern {T}aiwan Straits}, ' ...
'journal = {Acta Oceanologica Sinica}, ' ...
'page = {72–81}, ' ...
'volume = {30(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SakaYone2009'; type = 'article'; bib = [ ...
'doi = {10.1007/s12562-009-0108-y}, ' ...
'author = {Sakai, T. and Yoneda, M. and Shiraishi, T. and Tokimura, M. and Horikawa, H. and Matsuyama, M.}, ' ... 
'year   = {2009}, ' ...
'title  = {Age and growth of the lizardfish \emph{Saurida elongata} from the {T}sushima/{K}orea Strait}, ' ...
'journal = {Fisheries Science}, ' ...
'page = {895–902}, ' ...
'volume = {75(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YangChen2013'; type = 'article'; bib = [ ...
'doi = {10.1111/jai.12190}, ' ...
'author = {Yang, J.-L. and Chen, L.-H. and Hu, T.-J.}, ' ... 
'year   = {2013}, ' ...
'title  = {Maturity and spawning of painted lizardfish, \emph{Trachinocephalus myops}({B}loch and {S}chneider, 1801) in the southeastern {C}hina {S}ea}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'page = {1050–1055}, ' ...
'volume = {29(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Saurida-elongata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


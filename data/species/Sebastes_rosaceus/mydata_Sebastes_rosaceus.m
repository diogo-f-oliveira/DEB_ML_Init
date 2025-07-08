function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_rosaceus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_rosaceus'; 
metaData.species_en = 'Rosy rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 22];

%% set data
% zero-variate data

data.am = 14*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 43;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 644.1;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 95e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ...
  3 14.9
  4 15.4
  6 17.2
  7 19.3
  8 21.2
  9 22.7
 10 23.8
 11 25.6
 12 25.4
 13 26.5
 14 25.8];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... length (cm), weight (g)
11.797	22.104
12.158	29.076
12.203	31.164
12.475	33.959
12.478	28.395
12.481	21.440
12.886	31.892
13.524	32.617
13.610	42.358
13.929	43.068
14.108	50.727
14.197	53.513
14.386	41.003
14.387	40.307
14.695	61.187
14.705	42.409
14.745	52.148
14.751	41.020
14.790	54.236
14.799	36.849
14.977	43.812
15.111	49.383
15.189	76.511
15.201	52.864
15.376	67.478
15.426	59.135
15.512	69.571
15.748	52.194
15.973	59.160
15.976	52.205
16.012	72.377
16.197	66.125
16.512	73.791
16.563	64.056
16.565	59.883
16.601	77.968
16.652	68.929
16.834	69.633
16.970	71.030
17.058	75.903
17.140	93.990
17.236	86.344
17.243	71.043
17.245	67.565
17.285	78.000
17.553	89.140
17.564	68.275
17.686	97.493
17.805	132.970
17.813	116.278
17.870	93.328
17.914	97.503
17.921	83.593
18.049	100.292
18.102	86.384
18.211	139.944
18.240	83.608
18.270	114.908
18.322	102.391
18.335	75.962
18.416	96.831
18.420	87.790
18.455	109.352
18.643	98.928
18.745	77.372
18.829	89.895
18.871	98.243
18.877	86.420
18.901	129.543
18.903	125.370
19.007	100.336
19.009	96.163
19.089	118.423
19.096	103.818
19.104	88.517
19.401	132.348
19.410	113.570
19.499	117.747
19.536	135.832
19.542	123.313
19.596	106.623
19.596	105.928
19.596	105.928
19.630	130.272
19.739	183.832
19.762	138.625
19.947	134.460
19.948	131.678
20.031	148.374
20.089	123.338
20.098	105.951
20.135	121.949
20.172	140.035
20.185	114.301
20.257	151.862
20.361	127.524
20.406	128.222
20.490	141.440
20.604	96.237
20.622	151.879
20.659	169.269
20.669	148.404
20.678	131.712
20.756	156.059
20.954	125.465
20.987	151.201
21.037	142.857
21.058	191.544
21.168	153.991
21.178	133.126
21.187	205.460
21.208	165.121
21.214	152.602
21.289	185.295
21.289	185.295
21.355	144.263
21.395	156.088
21.425	186.692
21.483	161.656
21.532	154.704
21.543	133.839
21.643	205.482
21.656	179.748
21.754	256.955
21.754	166.538
21.853	151.936
21.860	228.444
21.922	195.062
21.989	153.334
22.049	213.847
22.125	155.427
22.146	202.723
22.160	176.294
22.177	231.936
22.197	192.988
22.214	158.213
22.249	179.080
22.286	195.774
22.323	214.555
22.346	257.678
22.379	192.996
22.397	158.221
22.451	141.531
22.480	174.222
22.481	261.162
22.483	257.684
22.504	216.650
22.512	201.349
22.552	211.088
22.556	204.133
22.564	187.441
22.615	267.428
22.652	284.122
22.768	234.745
22.896	252.139
22.922	202.063
22.965	205.543
22.984	168.681
23.006	215.977
23.012	204.154
23.063	282.054
23.131	239.631
23.162	177.036
23.209	263.978
23.217	159.650
23.245	193.037
23.250	183.299
23.276	222.250
23.278	219.468
23.279	216.686
23.294	186.779
23.332	202.778
23.349	257.724
23.367	222.254
23.405	328.670
23.408	232.689
23.459	221.563
23.554	213.221
23.604	204.181
23.642	219.485
23.702	191.667
23.716	254.264
23.729	228.530
23.746	284.173
23.767	242.442
23.791	286.261
23.810	248.704
23.901	248.708
23.901	248.708
24.003	226.456
24.088	238.980
24.200	289.062
24.206	275.848
24.210	268.893
24.247	285.587
24.248	283.500
24.265	250.116
24.307	257.769
24.357	248.034
24.395	262.642
24.404	246.645
24.410	234.822
24.416	312.720
24.419	215.348
24.430	284.900
24.456	233.433
24.463	220.218
24.486	264.732
24.568	282.820
24.621	266.825
24.656	288.388
24.666	268.914
24.677	337.075
24.736	310.648
24.737	218.840
24.762	259.877
24.795	283.526
24.831	213.280
24.892	272.402
24.900	257.101
24.918	311.352
24.932	283.532
24.951	335.697
24.965	307.877
25.032	266.149
25.036	257.803
25.040	341.265
25.058	305.099
25.065	290.493
25.128	257.111
25.166	271.024
25.256	364.227
25.328	312.762
25.438	274.514
25.466	400.404
25.507	227.917
25.543	426.837
25.565	204.968
25.586	341.986
25.615	284.955
25.740	308.608
25.816	337.823
25.985	364.261
26.058	311.405
26.091	335.054
26.114	380.264
26.198	303.761
26.288	305.851
26.427	301.685
26.436	284.297
26.582	266.916
26.590	340.641
26.610	392.111
26.665	372.639
26.670	363.597
26.736	322.565
26.890	287.796
26.908	342.743
27.269	350.410
27.311	358.063
27.531	374.070
27.932	392.172
29.053	427.695
29.268	364.413
];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
15.224	13235.378
15.709	15137.680
16.332	26506.442
17.264	30783.479
17.272	23212.667
17.273	22581.768
17.813	41677.593
18.876	28764.793
19.319	34609.485
19.351	38711.079
19.706	23260.649
19.882	32727.853
20.333	31790.363
21.225	70609.220
21.791	33080.955
22.299	47444.283
22.348	70789.090
22.725	68903.769
22.813	57075.857
22.817	86571.208
23.385	81377.350
23.707	94159.735
23.844	72553.594];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7PM'; % Cat of Life
metaData.links.id_ITIS = '166738'; % ITIS
metaData.links.id_EoL = '46568185'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_rosaceus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_rosaceus'; % ADW
metaData.links.id_Taxo = '187323'; % Taxonomicon
metaData.links.id_WoRMS = '274841'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_rosaceus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_rosaceus}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-rosaceus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

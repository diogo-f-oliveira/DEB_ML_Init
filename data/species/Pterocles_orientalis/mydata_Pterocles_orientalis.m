function [data, auxData, metaData, txtData, weights] = mydata_Pterocles_orientalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pterocliformes'; 
metaData.family     = 'Pteroclidae';
metaData.species    = 'Pterocles_orientalis'; 
metaData.species_en = 'Black-bellied sandgrouse'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Csa'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 21.5;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Harr1975';   
  temp.ab = C2K(38.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 30;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AourZnar2016';   
  temp.tx = C2K(41.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AourZnar2016';
  temp.tR = C2K(41.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(41.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 19.1;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AourZnar2016';
data.Wwi = 355; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'AourZnar2016';
data.Wwim = 420; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'AourZnar2016';
  comment.Wwi = 'Wiki: 300-615 g';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Harr1975';   
temp.Ri = C2K(41.4);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ % time  (d), weight (g)
0.894	17.121
1.431	19.140
2.326	27.203
2.326	23.176
4.293	24.202
5.188	25.218
6.619	24.226
8.229	33.302
9.481	21.235
10.912	35.343
11.986	50.454
14.132	66.583
15.206	53.507
15.206	98.809
15.742	91.767
16.458	73.654
17.352	128.025
17.352	110.911
18.247	123.001
18.605	134.078
19.499	93.819
19.678	158.250
21.109	109.942
21.467	137.127
21.646	163.303
23.256	101.910
23.792	92.855
23.792	177.419
24.150	152.255
24.866	159.309
24.866	172.396
25.045	126.089
26.118	200.597
27.013	122.082
27.191	190.540
27.191	170.406
28.086	187.529
28.801	157.335
29.159	114.050
29.338	207.676
29.517	210.698
29.875	149.292
29.875	176.473
30.411	140.237
31.664	156.357
33.095	188.586
34.526	172.493
34.526	195.648
35.242	229.883
35.599	196.665
35.778	148.345
35.957	156.400
36.673	179.562
40.072	178.589
40.072	202.751
40.072	219.865
40.250	193.692
45.080	195.754
45.259	212.870
45.259	243.071
45.259	253.138
45.438	230.993
47.943	225.984
47.943	210.883
48.122	265.248
48.122	255.181
48.658	292.434
49.195	289.420
49.911	223.991
50.447	273.325
52.415	308.580
52.594	242.138
52.594	259.252
52.594	268.313
57.961	281.454
57.961	299.575
58.140	260.315
58.140	272.396
60.286	264.363
60.286	286.511
60.286	293.558
60.823	301.617
64.580	325.816
64.580	333.870
64.758	253.335
64.937	270.451
65.116	294.613
69.767	337.949
69.767	333.922
71.914	333.944
71.914	328.910
72.272	290.659
72.272	260.457
72.451	304.754
72.451	296.701
78.533	305.822
78.533	314.883
78.533	334.010
78.891	340.054
79.785	293.754
79.785	301.808
85.868	349.185
85.868	340.124
89.982	322.045
90.161	371.376
92.487	330.124
94.991	362.364
95.349	318.072
95.528	376.463
100.179	362.416]; 
n = size(data.tW_f,1);
for i = 2:n
  if data.tW_f(i,1) <= data.tW_f(i-1,1)
    data.tW_f(i,1) = max(data.tW_f(i,1),data.tW_f(i-1,1)) + 1e-8;
  end
end
units.tW_f  = {'d', 'g'};  label.tW_f = {'time', 'weight', 'female'};  
temp.tW_f  = C2K(41.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'AourZnar2016';
comment.tW_f = 'Data for females';
%
data.tW_m = [ % time (d), weight (g)
0.716	16.113
1.073	23.163
1.968	20.152
2.683	29.220
3.220	24.192
4.651	26.219
6.261	43.350
6.619	25.233
8.050	33.301
8.050	51.422
8.945	61.498
10.018	35.334
10.733	44.402
11.628	69.578
11.986	81.662
12.165	51.463
13.059	63.552
13.596	89.732
13.775	47.452
13.775	96.781
14.490	78.668
15.206	59.547
15.742	111.902
15.921	73.648
16.637	95.803
16.637	113.924
17.710	92.794
17.889	79.708
17.889	128.031
18.247	125.014
18.426	136.090
18.605	111.930
19.499	101.872
20.215	125.034
20.930	140.142
21.646	104.914
21.646	151.223
22.182	124.047
22.540	105.930
23.792	154.265
23.792	155.271
23.792	142.184
25.045	129.109
25.045	167.364
25.939	140.192
26.655	158.320
26.655	180.468
26.834	126.107
28.444	151.291
28.623	181.494
29.517	171.436
30.233	157.349
30.411	194.600
31.485	174.476
32.021	207.703
32.379	186.566
33.095	202.680
33.453	223.825
34.347	246.988
34.526	258.064
34.884	232.900
35.778	196.667
35.778	214.788
35.778	228.882
35.778	235.929
37.030	254.062
37.925	269.172
38.104	236.959
38.819	248.040
39.535	256.101
40.072	221.878
40.250	241.007
40.429	289.331
40.608	272.219
40.608	280.273
45.080	257.163
45.080	266.224
45.080	277.298
45.080	287.365
45.080	298.439
45.080	303.472
45.080	312.533
47.764	335.714
48.479	288.406
48.658	304.515
49.195	322.641
49.732	348.821
50.268	294.464
50.268	281.377
50.268	332.719
50.447	315.607
52.415	313.613
53.131	332.748
53.131	321.674
54.025	335.777
54.025	349.871
56.530	321.708
57.603	340.847
57.603	355.947
58.676	325.757
59.213	350.930
59.928	365.031
60.286	371.075
60.286	318.726
60.286	309.665
64.937	339.914
64.937	353.001
64.937	378.169
65.116	330.855
69.767	382.244
70.483	348.023
71.735	399.378
72.272	361.128
72.451	344.016
73.882	364.165
74.061	384.301
78.354	365.216
78.533	357.165
78.891	378.309
79.249	351.132
79.606	366.236
79.606	413.551
80.143	384.362
80.322	397.451
86.047	371.334
86.047	404.556
86.047	430.730
89.088	371.365
89.445	383.449
89.624	392.511
89.803	404.593
91.771	377.432
92.844	427.778
93.918	383.494
96.243	393.584
96.780	410.704
99.642	420.800
99.642	392.612]; 
n = size(data.tW_m,1);
for i = 2:n
  if data.tW_m(i,1) <= data.tW_m(i-1,1)
    data.tW_m(i,1) = data.tW_m(i-1,1) + 1e-8;
  end
end
units.tW_m  = {'d', 'g'};  label.tW_m = {'time', 'weight', 'male'};  
temp.tW_m  = C2K(41.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'AourZnar2016';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.Wwb = weights.Wwb * 5;
weights.ab = weights.ab * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '4PW55'; % Cat of Life
metaData.links.id_ITIS = '177055'; % ITIS
metaData.links.id_EoL = '45513973'; % Ency of Life
metaData.links.id_Wiki = 'Pterocles_orientalis'; % Wikipedia
metaData.links.id_ADW = 'Pterocles_orientalis'; % ADW
metaData.links.id_Taxo = '53945'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '06B41945B9E57EC4'; % avibase
metaData.links.id_birdlife = 'black-bellied-sandgrouse-pterocles-orientalis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterocles_orientalis}}';
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
bibkey = 'AourZnar2016'; type = 'Article'; bib = [ ... 
'author = {M. Aourir and M. Znari and A. Elabbassi and M. Radi}, ' ... 
'year = {2016}, ' ...
'title = {GROWTH PATTERNS AND DEVELOPMENTAL STRATEGY IN THE BLACK-BELLIED SANDGROUSE \emph{Pterocles orientalis}}, ' ...
'journal = {Ardeola}, ' ...
'volume = {63}, ' ...
'pages = {311--327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Cacatua_ophthalmica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Cacatua_ophthalmica'; 
metaData.species_en = 'Blue-eyed cockatoo'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 28;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'WilkPilg2000';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'WilkPilg2000';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 360;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'WilkPilg2000';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'for males 5 yr; data for captive birds, in the wild it could be more';
data.am = 50*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'Wiki';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 20.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'WilkPilg2000';
data.Wwi = 560;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'WilkPilg2000';

data.Ri = 1/365/2; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'guess';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1 eggs/clutch; breeds once per 2 yr';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.202	8.223
0.802	8.242
1.902	11.565
2.602	11.588
3.602	11.621
4.603	16.583
6.003	18.272
6.704	21.582
7.204	23.241
7.904	26.551
8.805	31.510
10.005	34.836
10.807	44.721
11.708	51.324
12.709	59.573
13.909	61.255
15.011	72.794
15.812	81.036
16.814	94.214
17.915	99.180
18.716	109.066
19.717	114.028
21.018	125.573
21.921	142.035
22.521	142.055
23.721	145.380
24.523	158.552
25.525	168.444
26.826	179.990
27.928	194.815
28.630	206.340
29.932	219.528
30.829	199.839
31.930	208.092
32.832	221.267
33.934	237.735
34.836	245.980
35.838	264.089
37.541	280.576
38.043	297.025
38.845	308.554
40.046	321.739
40.648	331.618
42.049	341.523
42.551	356.328
43.955	379.379
44.860	415.559
45.662	433.660
46.962	428.773
47.966	460.027
48.865	453.484
49.665	450.224
51.066	456.842
51.667	468.365
53.269	479.920
53.668	470.074
54.571	496.394
55.571	496.427
56.771	494.823
57.674	516.215
58.774	517.894
59.673	509.708
60.778	542.608
61.781	560.716
62.781	560.749
63.680	557.492
64.480	554.232
65.780	554.274
66.778	541.162
67.880	559.273
68.881	560.949
69.680	554.403
70.480	554.429
71.676	529.820
72.881	562.724
73.581	562.747
74.379	551.271
75.778	544.744
76.477	533.264
77.278	539.864
78.478	543.189
79.777	533.373
80.277	538.319
81.575	523.573
82.873	508.827
83.875	518.719
84.473	508.879
85.575	518.775
86.675	520.454
87.572	504.052
88.875	518.883
89.672	499.191
90.470	489.358
92.170	489.414
92.469	481.208
93.569	481.244
94.569	481.277
95.669	478.027
96.866	459.991
97.564	445.225
98.766	458.410
99.766	458.443];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'typical development'};  
temp.tW1    = C2K(41.3);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'WilkPilg2000';
comment.tW1 = 'typical development';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.700	4.023
1.201	4.326
2.201	6.645
2.801	6.665
3.602	13.264
4.803	18.233
5.204	26.462
6.405	33.074
7.306	41.320
8.408	49.572
9.208	52.885
10.110	64.417
11.211	71.026
12.011	75.982
13.514	92.463
14.416	105.638
15.618	123.753
16.821	140.224
18.024	161.625
19.226	178.097
19.829	197.835
20.832	224.159
22.234	232.421
23.238	263.674
24.841	286.732
25.743	296.621
26.845	314.732
28.247	322.994
28.848	332.873
30.052	359.204
31.353	365.819
31.855	380.624
33.558	402.042
33.661	421.763
34.761	421.800
35.662	430.045
36.464	446.504
37.464	448.180
38.665	449.862
39.665	454.825
41.070	486.091
41.868	474.615
43.473	504.246
43.871	494.400
44.973	510.868
45.772	502.678
46.773	510.927
47.674	517.529
49.276	529.084
49.875	522.531
51.477	534.086
51.779	548.885
52.578	540.695
54.181	560.466
55.985	591.746
59.979	549.154
63.275	524.615
69.475	519.889
78.975	521.844
84.068	469.429];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'fast development'};  
temp.tW2    = C2K(41.3);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'WilkPilg2000';
comment.tW2 = 'Fast development';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW2 = weights.tW2 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW2','tW1'}; subtitle1 = {'Data for fast, typical development'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'tW data suggests varying food availability, which has been implemented';
D3 = 'mod_1: v is reduced';
D4 = 'mod_1: difference between tW1 and tW2 data is food availability';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = 'P57J'; % Cat of Life
metaData.links.id_ITIS = '554840'; % ITIS
metaData.links.id_EoL = '1178084'; % Ency of Life
metaData.links.id_Wiki = 'Cacatua_ophthalmica'; % Wikipedia
metaData.links.id_ADW = 'Cacatua_ophthalmica'; % ADW
metaData.links.id_Taxo = '70577'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '54B51CFD75691AE9'; % avibase
metaData.links.id_birdlife = 'blue-eyed-cockatoo-cacatua-ophthalmica'; % birdlife
metaData.links.id_AnAge = 'Cacatua_ophthalmica'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Blue-eyed cockatoo}}';
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
bibkey = 'WilkPilg2000'; type = 'Article'; bib = [ ... 
'author = {R. Wilkinson and M. Pilgrim and A. Woolhma and P. I. Morris and A. Morris and B. West}, ' ... 
'year = {2000}, ' ...
'title = {Husbandry and breeding of the blue-eyed cackatoos \emph{Cacatua ophthalmica} at {Chester Zoo 1966--1998}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {37}, ' ...
'pages = {116-125}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cacatua_ophthalmica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cacatua_ophthalmica/}}';
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


function [data, auxData, metaData, txtData, weights] = mydata_Calyptorhynchus_lathami

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Calyptorhynchus_lathami'; 
metaData.species_en = 'Glossy black cockatoo'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'GarnPedl1999';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'GarnPedl1999';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 270;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 37.7*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 22;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'GarnPedl1999';
  comment.Wwb = 'egg weight 26.5 g';
data.Wwi = 520;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'GarnPedl1999';
  comment.Wwi = 'Asymptotic weight of nesting, adult weight slightly smaller: 450 g';

data.Ri = 1/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'GarnPedl1999';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per clutch, 1 clutch per yr assumed';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.214	10.911
0.358	22.821
0.368	16.869
1.354	16.879
1.534	27.793
3.319	21.858
3.893	32.777
3.901	27.816
4.494	26.830
4.510	16.910
4.687	29.808
5.260	41.719
5.466	35.769
6.041	46.687
6.254	36.768
6.268	27.840
7.030	44.713
7.218	50.667
7.440	34.796
8.188	60.597
8.401	50.679
8.584	59.609
9.580	53.666
10.129	80.458
10.144	71.529
10.156	63.593
10.558	58.636
11.905	80.475
12.097	83.453
12.276	95.360
13.096	75.527
13.279	84.457
13.659	93.389
13.841	103.312
15.009	113.244
15.627	96.385
16.191	114.248
16.353	136.075
16.394	110.282
16.920	151.954
17.566	117.238
17.911	148.987
17.927	139.067
18.102	152.957
18.155	119.228
18.870	165.862
18.880	159.910
19.536	119.241
19.542	115.273
19.681	151.981
20.188	205.557
20.248	167.860
20.254	163.891
20.965	213.502
21.514	115.293
21.638	161.921
22.845	147.052
22.987	181.776
23.025	157.967
23.397	171.859
23.524	216.503
24.179	176.827
24.532	202.624
24.542	196.672
24.905	216.517
24.919	207.588
25.467	235.372
25.550	182.793
25.617	265.135
25.652	243.310
26.289	214.547
26.453	235.381
26.935	179.831
27.248	231.421
27.267	219.517
27.622	244.322
27.704	192.735
27.732	174.878
27.765	154.045
28.623	235.403
28.726	294.928
28.759	274.095
29.473	321.721
29.563	264.182
29.604	238.389
30.941	266.180
31.101	289.991
31.575	239.401
31.645	194.758
31.857	310.832
31.919	271.150
32.653	180.879
32.843	310.842
32.898	276.120
33.486	278.110
33.497	271.166
33.657	294.977
33.870	285.058
34.613	313.835
35.037	294.990
35.053	285.070
35.739	225.553
35.764	334.680
35.994	313.849
36.005	306.905
36.036	287.064
36.504	365.442
36.637	281.117
36.712	233.499
36.971	319.811
36.988	308.899
37.343	333.704
37.730	338.668
37.749	326.763
37.860	381.328
38.682	360.503
38.721	335.702
38.829	267.250
39.527	324.797
39.535	319.837
39.543	314.876
39.549	310.908
40.083	347.620
40.811	261.318
41.280	338.703
41.698	323.826
41.798	385.335
42.049	351.608
42.063	342.679
42.800	375.425
42.921	299.037
43.062	334.753
43.278	322.850
43.805	363.530
44.583	370.482
44.686	430.007
44.932	274.255
45.183	365.528
45.544	386.365
45.730	393.311
46.222	331.808
46.277	422.086
46.566	363.557
46.919	390.346
47.125	384.396
47.477	411.185
47.661	295.116
47.801	330.831
48.229	435.002
48.309	384.408
48.399	326.869
49.285	390.370
49.357	344.736
49.428	425.094
49.505	376.483
49.514	370.531
49.531	359.618
49.815	430.058
49.971	330.853
50.450	402.286
50.483	381.453
51.622	409.242
51.652	390.393
52.028	402.302
52.441	390.401
52.800	413.222
52.989	418.184
54.360	424.150
54.659	359.669
54.742	432.091
55.505	448.963
55.553	418.210
55.688	457.894
55.760	412.260
55.796	389.442
55.932	428.134
56.380	394.409
56.513	435.084
56.544	415.243
56.546	414.251
56.888	446.993
57.269	455.925
57.579	384.500
57.588	378.548
57.597	372.595
57.626	354.738
57.710	426.168
58.471	444.032
59.440	454.955
59.504	414.281
59.529	398.408
59.683	426.187
59.733	394.442
60.058	438.096
60.503	406.354
60.630	450.998
60.637	446.038
61.342	374.616
61.495	402.396
61.624	446.048
62.447	424.231
63.203	445.071
63.360	470.867
63.378	458.962
63.413	437.137
63.424	430.193
64.607	430.204
64.781	445.087
64.942	467.906
65.501	488.745
65.543	461.960
65.554	455.015
65.631	406.405
66.382	430.222
66.525	464.946
66.548	450.065
66.565	439.152
66.977	428.244
67.404	407.415
67.414	401.462
67.589	415.353
67.910	461.983
68.151	434.208
68.211	396.510
68.294	468.931
68.312	457.027
70.120	436.212
71.514	428.289
71.523	422.337
71.689	442.179
72.666	448.142
73.026	469.970
73.453	449.141
73.628	463.032
73.641	455.096
73.667	438.231
73.674	434.263
75.054	434.276
75.067	426.340
75.422	451.145
76.028	442.223
76.637	431.316
76.670	410.483
76.679	404.531
77.044	423.383
78.235	418.435
78.573	454.153
78.780	448.202
79.340	468.049
79.387	438.288
80.906	476.001
80.921	466.081
81.352	443.267
81.404	410.530
82.477	479.985
82.556	430.382
82.565	424.430
82.596	404.589
84.262	474.050
84.558	411.553
85.323	426.442
87.657	447.298
91.611	441.385
93.466	390.808
96.422	392.822];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'GarnPedl1999';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

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
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response just after hatch and befor fledge reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '698WF'; % Cat of Life
metaData.links.id_ITIS = '177480'; % ITIS
metaData.links.id_EoL = '1177831'; % Ency of Life
metaData.links.id_Wiki = 'Calyptorhynchus_lathami'; % Wikipedia
metaData.links.id_ADW = 'Calyptorhynchus_lathami'; % ADW
metaData.links.id_Taxo = '70575'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'D090A8A4A7716960'; % avibase
metaData.links.id_birdlife = 'glossy-black-cockatoo-calyptorhynchus-lathami'; % birdlife
metaData.links.id_AnAge = 'Calyptorhynchus_lathami'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calyptorhynchus_lathami}}';
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
bibkey = 'GarnPedl1999'; type = 'Article'; bib = [ ... 
'author = {S. T. Garnett and L. P. Pedler and G. M. Crowley}, ' ... 
'year = {1999}, ' ...
'title = {The Breeding Biology of the Glossy Black-Cockatoo \emph{Calyptorhynchus lathami} on {K}angaroo {I}sland, {S}outh {A}ustralia}, ' ...
'journal = {Emu}, ' ...
'volume = {99}, ' ...
'pages = {262-279}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calyptorhynchus_lathami}}';
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


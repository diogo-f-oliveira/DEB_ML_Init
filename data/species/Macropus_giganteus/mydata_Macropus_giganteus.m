function [data, auxData, metaData, txtData, weights] = mydata_Macropus_giganteus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_giganteus'; 
metaData.species_en = 'Eastern grey kangaroo'; 

metaData.ecoCode.climate = {'BSh', 'BSk', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'; 'JO_W'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2012 11 16];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 36.41;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Pool1975';   
  temp.tg = C2K(36.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 319;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'PoolCarp1982';
  temp.tx = C2K(36.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 639;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PoolCatl1974';
  temp.tp = C2K(36.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.88;   units.Lb  = 'cm';  label.Lb  = 'head length at birth';   bibkey.Lb  = 'PoolCarp1982';
data.Lx  = 13.0;   units.Lx  = 'cm';  label.Lx  = 'head length at weaning'; bibkey.Lx  = 'PoolCarp1982';
data.Lp  = 16.4;   units.Lp  = 'cm';  label.Lp  = 'head length st puberty'; bibkey.Lp  = 'PoolCarp1982';
data.Li  = 18.5;   units.Li  = 'cm';  label.Li  = 'ultimate head length';   bibkey.Li  = 'PoolCarp1982';
  comment.Li = '% actual max length is 20.22 cm, but results from very slow growth when total body length remains constant';

data.Wwb = .8;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Pool1975';
data.Wwx = 6500;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'Pool1975';
data.Wwp = 17400;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Pool1975';
data.Wwi = 35000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'PoolCarp1982';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'PoolPilt1964';   
  temp.Ri = C2K(36.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.pL  = .1*2.08e7*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.5);  units.temp.pL = 'K'; label.temp.pL = 'temperature';

data.JO = 94.646; units.JO  = 'ml O2/min'; label.JO  = 'O2 consumption';    bibkey.JO  = 'DawsMunn2000'; 
  temp.JO = C2K(36.5);  units.temp.JO = 'K'; label.temp.JO = 'temperature';
  comment.JO = 'for an animal of 26.4 kg';
	
% uni-variate data
data.tL = [...      % time since birth (d), head length (mm)
6.4283	10.5233858
8.6956	11.26274076
9.9646	12.03958535
14.3221	13.2143056
15.4818	13.75634263
16.1274	16.08038168
18.9296	15.4066618
21.2385	16.65649116
21.6328	14.4125593
22.3878	17.29642789
22.5544	18.00771001
24.0042	15.81881414
24.2854	16.93021677
24.478	17.73783626
25.6533	18.53572591
25.7418	18.93666519
28.9708	20.11568784
32.2364	21.55698729
32.8441	19.63865858
33.3753	22.32930631
33.5002	23.01163598
36.6303	23.86946435
36.8699	25.28977086
37.7224	24.44681643
37.9931	26.09907831
38.2781	21.99466667
41.7623	24.84856489
42.1945	27.5830099
43.8994	25.772293
44.0192	26.52797934
46.4739	29.71048459
47.0921	27.13705128
47.3264	28.71730779
49.2604	28.35773975
49.5415	30.35010569
52.3541	29.1542296
53.7898	32.44349627
54.6474	31.39975216
55.4635	30.08419648
55.7238	32.03406923
55.9893	34.16152463
56.6023	31.16201858
58.8175	32.93711047
59.9095	33.73378981
61.064	35.07539895
61.2618	36.79272002
61.8592	33.43823481
62.031	34.85511854
62.0987	35.43145553
63.1438	35.87354085
63.1698	36.10386777
64.2722	37.0697028
65.2965	37.35250584
66.3833	38.20628382
67.2098	36.7008531
67.3295	37.77698293
68.4111	38.59412258
68.4944	39.37771314
70.4441	39.03270951
71.5152	39.77744329
73.6055	40.7884927
73.6471	41.20254392
73.7252	41.98867756
74.6714	41.51272472
75.5447	40.33017709
75.7947	42.83690511
76.7565	42.5168301
79.845	43.65858757
79.8971	44.207745
80.8068	43.32803998
81.9977	45.44941731
82.0446	45.9659084
82.8138	43.54522268
82.9231	44.71012562
85.1175	47.02126753
87.0671	46.60929571
87.2962	49.25938954
89.173	47.9759575
90.1192	47.4368807
92.2043	48.58427894
92.4177	51.15191855
93.2858	49.62526108
94.4715	51.99772668
96.3327	50.45087043
97.534	53.05345552
98.4125	51.60404186
100.482	52.65177757
103.5495	53.79066828
103.7631	56.63912495
104.6156	54.74576423
104.6781	55.57869809
107.8343	58.0091061
110.8447	58.44580999
110.8811	58.96240279
112.659     56.06994897
112.737     57.13974877
112.8256	58.37571708
115.9766	60.84928079
116.8707	59.41222421
116.8968	59.78770274
118.0669	62.39592695
119.0235	61.84925169
120.0946	63.02931906
121.171 	64.30902634
123.8846	60.31012499
124.9454	61.30736607
126.1519	64.55386554
126.3029	66.95361057
126.3966	68.48399032
130.0304	63.10499964
130.1814	65.45088408
130.296     67.28921694
130.322     67.71447717
131.0703	63.82213029
133.5979	72.74789712
135.2092	66.44669186
135.3862	69.35234776
137.4348	70.40047427
140.3203	68.82726775
143.3567	69.78366803
143.4192	70.8453973
144.6101	74.31404761
146.5232	73.01756291
148.3272	69.8674587
148.4626	72.18988939
150.3967	71.29313219
152.6482	76.01266719
153.5529	74.39583804
155.7889	79.03572773
157.6292	76.30206484
159.7351	78.53936782
160.4939	74.21750212
160.5407	75.06091621
162.886     81.86732917
164.6482	77.55598014
169.0267	85.54991442
170.5546	76.58490541
172.7386	80.33456688
172.9052	83.62980703
174.8235	82.27769086
176.0562	87.18218416
178.8323	83.0049297
180.9174	85.01264414
187.0267	88.17293002
188.8254	84.25938857
188.9451	86.73001347
192.1222	90.98548606
192.2003	92.71219339
198.0909	91.20411348
199.0788	91.09473418
200.8931	87.39167269
201.933     88.38479919
202.9834	89.61296427
203.0875	91.8999054
203.1552	93.41949039
204.3305	97.62171906
205.0215	90.74923107
205.2246	95.31622042
207.091     92.59174585
210.2159	95.91860814
210.3461	98.97823723
210.9435	89.95414136
212.0042	91.43240901
212.2697	97.49489328
219.0702	94.00049047
221.2125	97.61195737
223.2663	99.22599239
228.3149	101.240614
229.3496	102.258099
230.1188	96.8729184
231.4867	106.0594727
238.209     100.3435703
238.2507	101.3621756
240.393     105.256476
243.2732	102.7603933
243.3721	105.256476
249.596 	112.2355738
250.4069	107.3827978
251.3739	106.7190841
257.5406	112.2243508
260.3583	107.931849
261.6117	114.9388215
265.2768	106.7190841
267.518     113.499678
271.6256	117.2724664
273.5335	115.0768309
274.5788	116.5359722
274.6621	118.9020447
278.4365	113.3522243
279.7523	122.5476581
280.3601	111.6534636
284.8061	125.185921
287.676     121.9242561
288.4971	116.967954
288.7055	123.0019243
291.6221	121.1585478
291.6326	121.4496775
297.4868	118.4510743
297.7784	127.0905723
299.374     115.6420911
300.7471	126.7732427
302.7437	127.0905723
303.6221	123.618474
305.7437	127.7148443
306.6587	125.3362342
307.4018	117.9900147
310.5163	121.9120642
312.9502	135.8430262
313.709     128.3678538
316.7298	129.6709386
319.7142	129.8266371
319.8548	134.3166403
321.6118	127.0778639
321.6221	127.395956
325.761     132.6348681
326.5093	125.0107833
333.5806	128.6763066
334.8132	136.3465764
338.6604	132.2904653
340.6205	131.4596552
343.5112	128.6763066
343.7715	137.0300164
348.6639	134.6393874
350.6343	134.1287286
353.775     139.463093
357.6743	137.0163141
362.4574	131.118304
362.6657	137.8822417
365.499 	133.1132141
377.5356	137.0026132
393.1642	128.6505739
393.4401	137.5242135
394.5894	142.8078471
418.5061	145.692757
421.3239	140.1201123
421.5737	148.8441819
422.0879	132.5685672
428.3638	143.1509975
428.4523	146.2181961
443.4992	151.6689219
448.2979	145.6781884
448.324     146.5988581
453.0185	137.3043507
453.3934	150.3250576
455.2181	144.5752307
478.2251	150.5055559
483.0967	147.112853
486.9022	141.3162095
512.1089	154.8876476
514.8016	144.5318647
515.0099	152.0029609
519.1123	156.8515788
538.8641	152.7496031
543.918     156.0536721
545.7584	150.6410719
547.9371	157.8270795
550.8382	154.8721596
562.8851	159.8122997
575.7376	157.6062762
608.3836	152.8871397
608.6856	164.4653648
633.3975	159.9561956
635.3108	157.1655958
639.5173	166.3177308
642.4496	164.4324751
656.3889	165.8858664
695.0818	164.3995919
699.1217	167.101264
722.851     162.9429273
726.943     167.7206839
728.8927	166.251217
736.9413	170.4769335
737.7157	161.7092549
746.851     169.6097144
764.773     171.5371738
792.6047	172.5867485
806.3409	165.7697869
814.4364	171.9321634
818.3305	168.7131609
830.4034	175.1950632
836.2264	169.5418841
849.308     176.7259098
851.1796	171.8977804
875.0911	175.1600277
896.7562	167.586561
911.8291	174.8974846
921.7024	172.4832275
946.6227	176.425731
971.4231	175.3002118
997.1854	172.8631083
1002.3017	179.2891741
1005.2288	177.0443029
1011.1507	175.4931481
1035.0362	177.682811
1070.7707	176.9911976
1077.6024	171.9321634
1092.4879	171.4857204
1097.6979	181.925998
1099.5798	177.4164866
1129.4394	180.3140405
1158.2173	179.3788411
1159.3457	185.3414871
1171.049	176.0204181
1184.0108	178.2344824
1184.858	172.0697641
1188.0715	182.0898051
1211.9154	182.5273455
1241.754	184.5831427
1255.4903	177.2923385
1273.3862	178.1632028
1278.2317	173.0706686
1282.5268	187.1106214
1286.3636	181.0910602
1303.2977	183.3689054
1341.0027	181.9623868
1353.8657	179.8997947
1363.6713	174.5480392
1366.9212	186.3450383
1367.7321	178.3057904
1368.6939	176.9734993
1376.7321	181.0005373
1401.6939	187.0170894
1436.4094	185.1192108
1443.2515	180.2779813
1457.0189	174.460787
1460.1022	178.9130619
1461.2307	184.8602252
1462.0363	176.6729
1479.0172	180.9281516
1495.9825	184.601602
1520.658	177.967331
1522.8056	185.0451779
1549.462	178.1632028
1555.5089	182.0169837
1615.1705	185.4341811
1639.8565	179.2174728
1640.7766	176.0908403
1645.0508	189.4073525
1647.8374	180.8015462
1675.7732	186.5501306
1707.572	187.4664695
1736.1937	179.5942249
1742.2145	182.308444
1803.6801	177.7361238
1831.6471	184.7862959
1831.7461	189.2558872
1832.4632	177.0443029
1857.347	179.4865007
1864.491	188.0297133
1891.3192	188.7267119
1939.8907	184.6939258
2004.4187	183.6992666
2007.5229	189.3316047
2016.4916	190.75693
2021.2278	180.4763962
2046.2209	187.8793497
2073.0596	189.0478202
2113.7126	186.1774032
2183.2006	184.9526784
2189.2006	186.8114837
2194.2129	188.9344255
2220.0272	188.6701024
2249.8555	190.3186933
2287.5345	187.6727961
2374.8925	186.1774032
2376.9879	191.1770573
2410.7936	193.0791098
2435.3442	180.6027739
2436.5194	188.7267119
2444.5211	191.3491941
2445.5558	193.2916136
2475.2488	188.6889704
2476.0492	180.1158041
2553.8411	195.1366339
2558.7127	190.7760067
2561.5617	184.8602252
2651.0308	189.0100144
2736.3975	187.2790967
2741.4721	192.289106
2881.4571	190.4900572
2949.1309	197.255531
2980.8098	192.5777561
3015.5201	190.3757974
3099.951	191.2535434
3147.6907	194.6104756];
data.tL(:,2)= data.tL(:,2)./10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL    = C2K(36.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PoolCarp1982b';

% From Poole et al 1982 -- on eastern greys
data.tW =[...%    age (days)	weight (kg)
288	4.27016
910	21.3508
%5971	38.4314
%9000	42.7016 % following again from Poole et al 1982, table 4
60	0.0459
90	0.1082
120	0.2296
150	0.4459
180	0.8046
210	1.3648
240	2.1961
270	3.3779
300	4.9967
330	6.3859
360	7.4816
457.5	10.3
549	13.1
640.5	15.5
732	17.7
915	21.1
1098	23.8   %...  the following rows from Rease 1981
549.23685	13.4537
542.80405	17.0378
548.87135	14.9566
905.59935	26.9656
906.40345	23.7286
909.83915	21.0695
1267.1154	30.7664
1268.0657	26.9513
1271.5745	23.9454
1634.0043	35.4918
1638.4634	28.6707
1636.2704	26.2431
1999.54085	34.3212
2003.78065	28.3094
1998.88295	25.3039
2367.709	33.7286
2364.09055	25.6362
2724.3639	34.5238
2727.9458	31.2867
2726.1183	27.2405
3092.89755	32.4283
3090.41215	31.2723
3094.14025	27.3415];
data.tW(:,2) = 1e3 * data.tW(:,2); % convert kg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PoolCarp1982b';
 					

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '90 percent of milk production originates from upregulation';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7VR59'; % Cat of Life
metaData.links.id_ITIS = '552733'; % ITIS
metaData.links.id_EoL = '777872'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_giganteus'; % Wikipedia
metaData.links.id_ADW = 'Macropus_giganteus'; % ADW
metaData.links.id_Taxo = '168619'; % Taxonomicon
metaData.links.id_MSW3 = '11000256'; % Mammal Spec World
metaData.links.id_AnAge = 'Macropus_giganteus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_giganteus}}';
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
bibkey = 'PoolCarp1982'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Carpenter, S. M. and Wood, J. T.}, ' ... 
'year = {1982}, ' ...
'title = {Growth of grey kangaroos and the reliability of age determination from body measurements,  II. {T}he western grey kangaroos, \emph{Macropus fuliginosus fuliginosus}, \emph{M. f. melanops} and \emph{M. f. ocydromus}}, ' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {203--212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pool1975'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E.}, ' ... 
'year = {1975}, ' ...
'title = {Reproduction in the two species of grey kangaroos, \emph{Macropus giganteus} {S}haw and \emph{M. fuliginosus} ({D}esmarest) II. {G}estation, parturition and pouch life}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {23}, ' ...
'pages = {333--353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolCatl1974'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Catling, P. C.}, ' ... 
'year = {1974}, ' ...
'title = {Reproduction in the two species of grey kangaroos, \emph{Macropus giganteus} {S}haw and \emph{M. fuliginosus} ({D}esmarest) I. {G}estation, parturition and pouch life}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {22}, ' ...
'number = {}, '...
'pages = {277-302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolPilt1964'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Pilton, P. E.}, ' ... 
'year = {1964}, ' ...
'title = {Reproduction in the grey kangaroo, \emph{Macropus canguru}, in captivity.}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {218--234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsMunn2000'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Munn, A. J. and Blamey, C. E. and Krockenberger, A. and Maloney, S. K.}, ' ... 
'year = {2000}, ' ...
'title = {Ventilatory accommodation of oxygen demand and respiratory water loss in kangaroos from mesic and arid environments, the eastern grey kangaroo (\emph{Macropus giganteus}) and the red kangaroo (\emph{Macropus rufus})}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73}, ' ...
'pages = {382--388}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_giganteus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


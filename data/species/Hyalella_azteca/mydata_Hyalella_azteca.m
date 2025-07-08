function [data, auxData, metaData, txtData, weights] = mydata_Hyalella_azteca

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Hyalellidae';
metaData.species    = 'Hyalella_azteca'; 
metaData.species_en = 'Amphipod'; 

metaData.ecoCode.climate = {'A', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Lm';  'Wwb'; 'Wwp'; 'Wdb'; 'Wdp'; 'Wdi'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wd'; 't-L_f'; 'L-Ww'; 'L-Wd'; 'L-N_f'; 'L-L'; 'Wd-N'; 'Wd-Ww'; 'Wd-JO'; 't-S'; 't-N'; 'T-Jx'; 'T-JO'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel', 'Dino Liesy', 'Andre Gergs'};    
metaData.date_subm = [2019 03 07];              
metaData.email    = {'rakel@gaiac-eco.de', 'liesy@gaiac-eco.de', 'andre.gergs@bayer.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'};     

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 03 07]; 

%% set data
% zero-variate data 
data.ab = 11.3;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Coop1965';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'age at hatching + 2 days until release from brood pouch';
data.tp_m = 19;  units.tp_m = 'd';    label.tp_m = 'time since birth at puberty';        bibkey.tp_m = 'OthmPasc2001';   %value for males
  temp.tp_m = C2K(22);  units.temp.tp_m = 'K'; label.temp.tp_m = 'temperature'; 
data.tp = 23;  units.tp = 'd';    label.tp = 'time since birth at puberty';        bibkey.tp = 'OthmPasc2001';   %value for females
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'nutrition: algae';
   
data.am = 480;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Harg1970'; 
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '"temperature estimated by the mean annual temperature of Marion Lake (see Fig. 8)"';
   
data.Lb = 0.102;       units.Lb = 'cm';     label.Lb = 'length at birth';           bibkey.Lb = 'EdwaCowe1992';
data.Lp  = 0.28;       units.Lp = 'cm';     label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Inge1998';
data.Lp_h  = 0.037;    units.Lp_h = 'cm';   label.Lp_h  = 'head length at puberty'; bibkey.Lp_h  = 'OthmPasc2001';
data.Li  = 0.915;      units.Li = 'cm';     label.Li  = 'ultimate total length';    bibkey.Li  = 'Wen1993'; 
data.Lm_f  = 0.56;     units.Lm_f  = 'cm';  label.Lm_f  = 'maximum total female length at food level';   bibkey.Lm_f  = 'Gonz2002';
data.Lm_m  = 0.78;     units.Lm_m  = 'cm';  label.Lm_m  = 'maximum total male length at food level';     bibkey.Lm_m  = 'Gonz2002';

data.Wwb = 0.00004;    units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'OthmPasc2001';
data.Wwp = 0.0003639;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'OthmPasc2001'; 
  comment.Wwp = 'wet weight at age at puberty (from OthmPasc2001)';
data.Wwi = 0.0174941;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wen1992';
data.Wdb = 0.000014;   units.Wdb = 'g';    label.Wdb = 'dry weight at birth';      bibkey.Wdb = 'Harg1970';
data.Wdp = 0.0001;     units.Wdp = 'g';    label.Wdp = 'dry weight at puberty';    bibkey.Wdp = 'Inge1998';
data.Wdi = 0.0034354;  units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';      bibkey.Wdi = 'Wen1992';

data.Ri = 1.02;        units.Ri  = '#/d';  label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'Inge1998';
  temp.Ri = C2K(23);    units.temp.Ri = 'K';label.temp.Ri = 'temperature'; 


%% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), length (cm)
0.5289      0.10613
3.4837      0.11585
8.0951      0.18145
14.5749 	0.23976
18.6204 	0.27135
23.5149 	0.37664
27.5909 	0.42866
35.646  	0.42304
40.6135     0.43147
70.5454 	0.62551
105.4482	0.65644
120.3806	0.7155
185.6288	0.70706];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  bibkey.tL = 'OthmPasc2001';
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';


% time-length  - 0.1 mg
data.tL_2 = [ ... % time since birth (d), length (cm)
6.6291	0.14097
35.0479	0.40883
49.1077	0.48985
63.1675	0.50804
77.3769	0.54937
91.2872	0.56012
104.8983	0.56012
126.2872	0.56095
147.2274	0.56095];
units.tL_2   = {'d', 'cm'};  label.tL_2 = {'time since birth', 'length'};  bibkey.tL_2 = 'Pery2005';
temp.tL_2    = C2K(21);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';

% time-length  - 0.2 mg
data.tL_3 = [ ... % time since birth (d), length (cm)
6.9282	0.14097
20.6889	0.22034
34.8983	0.40139
49.1077	0.44107
77.2274	0.51052
90.988	0.53036
104.8983	0.5411
125.988	0.5411
146.7786	0.5411];
units.tL_3   = {'d', 'cm'};  label.tL_3 = {'time since birth', 'length'};  bibkey.tL_3 = 'Pery2005';
temp.tL_3    = C2K(21);  units.temp.tL_3 = 'K'; label.temp.tL_3 = 'temperature';

% time-length  - 0.3 mg
data.tL_4 = [ ... % time since birth (d), length (cm)
7.2274	0.14097
13.8085	0.18065
20.988	0.21042
28.1675	0.29144
35.0479	0.38072
49.1077	0.45099
62.8684	0.48158
77.2274	0.53118
91.1376	0.55103
104.7487	0.56095
125.6889	0.56095
146.9282	0.56095];
units.tL_4   = {'d', 'cm'};  label.tL_4 = {'time since birth', 'length'};  bibkey.tL_4 = 'Pery2005';
temp.tL_4    = C2K(21);  units.temp.tL_4 = 'K'; label.temp.tL_4 = 'temperature';

% time-length  - 0.04 mg
data.tL_5 = [ ... % time since birth (d), length (cm)
6.7786	0.13932
13.8085	0.17073
20.988	0.18231
27.7188	0.31128
27.8684	0.22034
34.7487	0.22199
49.1077	0.24018
63.1675	0.34104
77.2274	0.42206
90.988	0.45017
105.0479	0.51134
126.1376	0.51134
147.0778	0.51217];
units.tL_5   = {'d', 'cm'};  label.tL_5 = {'time since birth', 'length'};  bibkey.tL_5 = 'Pery2005';
temp.tL_5    = C2K(21);  units.temp.tL_5 = 'K'; label.temp.tL_5 = 'temperature';

% time-length  - 0.06 mg
data.tL_6 = [ ... % time since birth (d), length (cm)
6.7786	0.14015
20.6889	0.19058
34.7487	0.25175
48.8085	0.27159
62.8684	0.32946
77.2274	0.34931
90.988	0.39064
104.8983	0.43115
125.988	0.43032
146.9282	0.43198];
units.tL_6   = {'d', 'cm'};  label.tL_6 = {'time since birth', 'length'};  bibkey.tL_6 = 'Pery2005';
temp.tL_6    = C2K(21);  units.temp.tL_6 = 'K'; label.temp.tL_6 = 'temperature';

% time-wet weight
data.tWw = [ ... % time since birth (d), wet weight (g)
1.0006      0.0000909
2.8621      0.0000779
8.0306      0.0001949
14.2056     0.0003509
18.2186     0.0003639
23.2351 	0.0020016
27.0087 	0.0025475
35.162      0.0023915
40.1953 	0.0025995
56.2484 	0.0059008
85.7807 	0.0060828
105.6342	0.0069926
120.6184	0.0079285
185.5934	0.0086953];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'weight'};  bibkey.tWw = 'OthmPasc2001';
temp.tWw    = C2K(22);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';

% time-dry weight
data.tWd = [ ... % time since birth (d), dry weight (g)
8.0631      0.0000216
14.2787 	0.0000974
18.0996 	0.0000974
23.1279 	0.000249
26.9698 	0.0004873
35.2143 	0.0005523
39.9923 	0.000574
56.1825 	0.0013755
70.5329     0.0016246
85.334      0.0015705
105.0449	0.0016788
119.8623	0.0018088
185.079 	0.0020687];
units.tWd   = {'d', 'g'};  label.tWd = {'time since birth', 'weight'};  bibkey.tWd = 'OthmPasc2001';
temp.tWd    = C2K(22);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
 
% time-dry weight
data.tWd_2 = [ ... % time since birth (d), dry weight (g)
22.14191	1.01089E-05
32.38777	1.52929E-05
42.37118	3.6029E-05
53.09422	6.97253E-05
65.30275	0.000121566
77.9978     0.000190254
92.92418	0.000282271
120.0788	0.000401503
146.96267	0.000546656];
units.tWd_2   = {'d', 'g'};  label.tWd_2 = {'time since birth', 'dry weight'};  bibkey.tWd_2 = 'Lind1982';
temp.tWd_2    = C2K(15);  units.temp.tWd_2 = 'K'; label.temp.tWd_2 = 'temperature';

% time-dry weight
data.tWd_3 = [ ... % time since birth (d), dry weight (g)
5.14399 	7.51685E-06
9.88984     1.27009E-05
15.38569	1.78849E-05
20.12118	3.6029E-05
24.84422	6.97253E-05
30.05482	0.000118974
36.24883	0.000188958
46.17626	0.000279679
58.83087	0.000398911
71.96475	0.000544064];
units.tWd_3   = {'d', 'g'};  label.tWd_3 = {'time since birth', 'dry weight'};  bibkey.tWd_3 = 'Lind1982';
temp.tWd_3    = C2K(20);  units.temp.tWd_3 = 'K'; label.temp.tWd_3 = 'temperature'; 
 
% length-wet weight
data.LWw = [ ... % length (cm), wet weight (g)
0.16	0.000105717
0.16	0.00027501
0.18	0.000684031
0.19	0.000359403
0.18	0.000176056
0.21	9.11556E-05
0.22	0.000387339
0.24	0.000288442
0.25	0.000231873
0.24	0.000542448
0.24	0.00076816
0.27	0.000485728
0.28	0.000358593
0.28	0.000485577
0.35	0.000541393
0.28	0.000866548
0.27	0.001205248
0.35	0.001091733
0.32	0.001148378
0.34	0.00133163
0.35	0.001543195
0.30	0.001839924
0.37	0.001867559
0.37	0.001782865
0.40	0.001683836
0.38	0.001627625
0.40	0.001937804
0.40	0.002248229
0.40	0.002177682
0.42	0.002149313
0.42	0.002262131
0.44	0.002388983
0.45	0.002515892
0.44	0.002586514
0.41	0.002431556
0.39	0.002615147
0.41	0.002770143
0.44	0.002769898
0.47	0.002812019
0.46	0.00291086
0.41	0.003179314
0.43	0.003136892
0.46	0.003150662
0.48	0.003221058
0.50	0.003220908
0.48	0.003489136
0.50	0.003488985
0.50	0.003559476
0.49	0.003898251
0.54	0.004970128
0.56	0.005195652
0.61	0.005011797
0.60	0.005336444
0.57	0.00535076
0.55	0.005322749
0.56	0.005802335
0.57	0.0059575
0.54	0.005915435
0.62	0.005886482
0.61	0.006154673
0.63	0.006253269
0.64	0.006366068
0.60	0.006535682
0.61	0.006394532
0.63	0.006577803
0.71	0.006548887
0.71	0.007014477
0.70	0.007339049
0.71	0.007395392
0.62	0.006845974
0.65	0.007156041
0.64	0.007424232
0.66	0.007522828
0.71	0.007959822
0.65	0.007847456
0.65	0.008030877
0.70	0.00839725
0.71	0.008524121
0.71	0.008806308
0.72	0.008876798
0.73	0.008904941
0.76	0.009342086
0.75	0.009737242
0.74	0.010724991
0.71	0.010852163];
units.LWw   = {'cm', 'g'};  label.LWw = {'length', 'wet weight'};  bibkey.LWw = 'OthmPasc2001';
temp.LWw    = C2K(22);  units.temp.LWw = 'K'; label.temp.LWw = 'temperature';


% length-dry weight
data.LWd = [ ... % length (cm), dry weight (g)
0.268145765	7.04664E-05
0.28195081	6.12802E-05
0.300151168	4.47098E-05
0.307668732	5.95644E-05
0.300117483	9.84133E-05
0.280035411	0.000114974
0.357204277	8.57524E-05
0.349659997	0.00011349
0.347135945	0.000137551
0.335216098	0.000141192
0.336449667	0.000174531
0.327671818	0.000168929
0.318873062	0.000196661
0.324493812	0.000235579
0.372230113	0.000130276
0.391650101	0.000169268
0.400409364	0.0002045
0.407310144	0.000202684
0.406033599	0.000237863
0.398510227	0.000232267
0.4028765	0.000271179
0.372752812	0.000296946
0.381534145	0.000296992
0.446698372	0.000406596
0.447334902	0.000391785
0.440427152	0.000404711
0.444832919	0.00038066
0.444217297	0.000362139
0.444228912	0.00034362
0.444239366	0.000326954
0.444874735	0.000313994
0.453587536	0.000423299
0.43977436	0.000445449
0.44041786	0.000419526
0.436101533	0.000300985
0.431075498	0.000313921
0.426045978	0.000332413
0.429178683	0.000337985
0.434815695	0.000350978
0.436692763	0.000358395
0.42791143	0.000358349
0.417884913	0.000343481
0.415381769	0.000334208
0.419786374	0.000312009
0.415395708	0.000311986
0.416031076	0.000299027
0.419170751	0.000293488
0.413529094	0.000287902
0.416668769	0.000282363
0.416676899	0.0002694
0.431111506	0.000256514
0.402206285	0.000339694
0.411591625	0.000376781
0.403428238	0.000391553
0.475492083	0.000501193
0.481151164	0.000479001
0.49306288	0.000488323
0.511241168	0.000506938
0.509369908	0.000490261
0.510023862	0.000447672
0.507527686	0.000427289
0.535037883	0.000568175
0.550070689	0.000601588
0.554939915	0.00083865
0.552497171	0.000733082
0.519287239	0.000679203
0.490627105	0.000371644
0.472433717	0.000377103
0.473033078	0.00042155
0.462308468	0.000519642
0.476077505	0.000567863
0.450551239	0.000264024
0.396571596	0.000322998
0.375949403	0.000200666
0.38534752	0.000217383
0.379070493	0.000224757
0.373405604	0.000256208
0.374042134	0.000241397
0.388470933	0.00023777
0.388460479	0.000254436
0.389056355	0.000304439
0.364696287	0.000141348
0.382876899	0.000156259
0.384746997	0.000174787
0.350254712	0.000165345
0.343949808	0.000217164
0.349582173	0.000237564
0.360189466	0.000326509
0.491788657	0.000519798
0.545086469	0.000547858
0.530037402	0.000540371
0.548263314	0.00048306
0.541366018	0.000479319
0.530697163	0.000488522
0.46936025	0.000277087
0.365915917	0.00019691
0.374716996	0.000165475
0.355877785	0.00020056
0.359015137	0.000198725
0.369663084	0.000222855
0.362741395	0.000258004
0.458001434	0.000386286
0.457364903	0.000401097
0.465517836	0.000402992
0.338387135	8.56528E-05
0.355293524	0.000132039
0.332721085	0.000118956
0.320178647	0.000115186
0.330862602	8.19093E-05
0.309528377	9.47594E-05
0.397844657	0.000293375
0.404113553	0.000298964
0.493096565	0.00043462
0.464222706	0.0004678
0.454815297	0.000465898
0.461105101	0.000438154
0.458656549	0.000341845
0.434791302	0.000389867
0.420986257	0.000399053
0.409776119	0.000271216
0.407872335	0.000306391
0.408492604	0.000317505
0.425496563	0.000208336
0.43552308	0.000223204
0.438019255	0.000243587
0.444937459	0.000213994
0.483002678	0.000527159
0.466678227	0.000552998
0.472964546	0.000530809
0.496127054	0.000603154
0.514943034	0.000605106
0.531780891	0.00076075
0.528595916	0.000838511
0.534871781	0.000832989
0.521117844	0.000760694
0.517992108	0.000744011
0.51296375	0.000760651
0.517375324	0.000727341
0.510515198	0.000664341
0.501711796	0.00069948
0.481654116	0.000677152
0.444096495	0.000554731
0.446568278	0.000614003
0.434700701	0.000534311
0.448504585	0.000526976
0.453024184	0.000321445];
units.LWd   = {'cm', 'g'};  label.LWd = {'length', 'dry weight'};  bibkey.LWd = 'Inge1998';
temp.LWd    = C2K(23);  units.temp.LWd = 'K'; label.temp.LWd = 'temperature';
 
% length-fecundity (28-d length)
data.LN_1 = [ ... % Length (cm), Number of offspring in 14 days (#)
0.28358	1.4832
0.29625	2.2676
0.32339	1.0909
0.32452	2.7383
0.32544	1.5878
0.32743	1.1694
0.32790	0.751
0.32956	2.7906
0.32998	1.5878
0.33198	1.4047
0.34331	3.3876
0.34558	1.2217
0.34561	1.6139
0.34577	3.2915
0.35299	5.876
0.35446	5.3008
0.35621	1.7969
0.35636	3.7319
0.35981	2.6598
0.36088	3.4704
0.36195	4.3333
0.36270	0.8556
0.36277	1.8492
0.36667	0.0189
0.36826	7.7848
0.36846	3.7057
0.37395	2.9997
0.37418	6.0329
0.37658	4.464
0.37707	4.2548
0.37805	3.8365
0.37903	2.0744
0.38027	2.1064
0.38820	4.7516
0.38831	6.2944
0.38859	3.2089
0.39013	3.6273
0.39071	4.6209
0.39112	3.3135
0.39733	5.4576
0.39883	5.2746
0.40014	2.6598
0.40025	4.1502
0.40029	4.6732
0.40312	2.0061
0.40919	2.2415
0.40955	7.1311
0.41078	3.3658
0.41146	6.1741
0.41270	6.2061
0.41279	3.1828
0.41325	2.6337
0.41454	6.046
0.41817	0.9602
0.41872	8.3339
0.42438	3.0782
0.42655	5.1439
0.42948	3.9411
0.43074	7.288
0.43458	4.7255
0.43966	5.2485
0.44438	14.2956
0.44676	5.7191
0.44917	10.9487
0.46050	0.6464
0.46199	4.7007
0.48790	9.7982];
units.LN_1   = {'cm', '#'};  label.LN_1 = {'length', 'number of offspring'};  bibkey.LN_1 = 'Inge1998';
temp.LN_1    = C2K(23);  units.temp.LN_1 = 'K'; label.temp.LN_1 = 'temperature';

% length-fecundity 
data.LN_3 = [ ... % Length (cm), Number of offspring (#)
0.4898	2.9932
0.4898	5.109
0.49961	8.1295
0.51922	8.0587
0.52957	7.0358
0.53961	7.0702
0.53961	3.9535
0.54917	11.0278
0.54933	7.0764
0.55937	15.0971
0.55968	7.0832
0.55968	9.0589
0.58007	9.9903
0.58007	7.0685
0.59042	13.0023
0.59042	8.1048
0.59042	6.2126
0.59042	7.1587
0.61018	10.0098
0.61018	6.1697
0.62053	17.1959
0.63057	14.0858
0.64014	11.0866
0.64029	14.1199
0.68013	11.0569];
units.LN_3   = {'cm', '#'};  label.LN_3 = {'length', 'number of offspring'};  bibkey.LN_3 = 'OthmPasc2001';
temp.LN_3    = C2K(22);  units.temp.LN_3 = 'K'; label.temp.LN_3 = 'temperature';

% dry weight-fecundity (28-d length)
data.WdN_1 = [ ... % dry weight (g), Number of offspring in 14 days (#)
0.0001003	1.4724
0.000114	0.0238
0.0001285	2.2441
0.0001316	3.3785
0.0001527	3.6917
0.0001586	5.3088
0.0001647	0.7465
0.0001826	5.8633
0.0001987	2.0974
0.0001993	5.2353
0.0002013	1.0594
0.0002128	2.5797
0.0002209	0.6002
0.0002243	3.5932
0.0002298	3.2793
0.0002299	3.4482
0.0002357	4.655
0.0002416	6.0065
0.0002492	2.0477
0.0002497	4.3167
0.0002521	2.1925
0.0002523	3.3028
0.0002579	3.3509
0.0002607	2.9888
0.0002637	4.0749
0.0002694	4.461
0.0002705	3.0127
0.0002705	3.2058
0.0002746	2.5781
0.00028	1.371
0.0002818	3.1572
0.000289	4.2673
0.0002911	0.8638
0.0002913	1.5638
0.000292	5.4742
0.0002922	5.9811
0.0003026	1.8291
0.0003045	4.6531
0.0003143	4.5563
0.0003315	6.1731
0.0003317	7.0662
0.0003419	1.9487
0.0003424	4.6521
0.0003437	3.9521
0.0003603	2.6241
0.0003622	5.1102
0.0003624	6.293
0.0003928	3.7818
0.0004156	5.2295
0.0004637	14.1592
0.000467	9.766
0.0004686	10.9246
0.0004718	5.6624
0.0005222	4.6956];
units.WdN_1   = {'cm', '#'};  label.WdN_1 = {'dry weight', 'number of offspring'};  bibkey.WdN_1 = 'Inge1998';
temp.WdN_1   = C2K(23);  units.temp.WdN_1 = 'K'; label.temp.WdN_1 = 'temperature';

% head length-body length
data.LL = [ ... % Head length (cm), body length (cm)
0.016537	0.129046
0.016881	0.143357
0.017228	0.151463
0.017239	0.131077
0.017758	0.145452
0.017765	0.133044
0.018372	0.147451
0.018654	0.113868
0.018693	0.123634
0.018899	0.149417
0.019432	0.138975
0.019439	0.124794
0.019859	0.160409
0.019892	0.181696
0.020087	0.145422
0.020139	0.131257
0.020634	0.190834
0.020742	0.153641
0.020774	0.174929
0.021013	0.139557
0.021089	0.160861
0.0218	    0.146938
0.021875	0.170901
0.021954	0.187773
0.022323	0.154223
0.02249	    0.172014
0.022837	0.179233
0.02291	    0.205855
0.023049	0.193495
0.023408	0.179443
0.023785	0.213269
0.023928	0.273603
0.023975	0.186744
0.024039	0.231092
0.024099	0.200973
0.024112	0.177929
0.025147	0.214656
0.025198	0.201377
0.025359	0.228031
0.025474	0.17843
0.026189	0.237201
0.026197	0.222134
0.0263	    0.274475
0.026491	0.247064
0.026894	0.233914
0.027211	0.216301
0.027226	0.269496
0.027352	0.28018
0.027367	0.251818
0.027559	0.221748
0.027715	0.258152
0.027884	0.271511
0.028334	0.251287
0.028346	0.229129
0.028487	0.213224
0.028584	0.277087
0.028948	0.254172
0.028957	0.237332
0.029055	0.219638
0.029485	0.316425
0.029634	0.284566
0.030693	0.276976
0.030856	0.300972
0.03104	    0.285082
0.031852	0.246375
0.032864	0.323872
0.032963	0.303519
0.032979	0.354942
0.033024	0.273401
0.033663	0.310868
0.033858	0.27548
0.034201	0.289791
0.035092	0.267956
0.035254	0.293724
0.035994	0.386191
0.036366	0.26931
0.036993	0.407834
0.037358	0.38226
0.038384	0.35427
0.038417	0.375557
0.039454	0.406966
0.039753	0.423033
0.040518	0.308956
0.040642	0.403857
0.040759	0.512052
0.04163	    0.366101
0.041738	0.328021
0.041798	0.380346
0.041839	0.465465
0.041854	0.437989
0.041855	0.274875
0.042926	0.486254
0.042976	0.314293
0.045255	0.485337
0.046054	0.471447
0.046177	0.567234
0.047336	0.538405
0.047386	0.446229
0.048449	0.591118
0.049717	0.522438
0.049879	0.547319
0.051647	0.529352
0.051843	0.653534
0.052401	0.596117
0.053022	0.586594
0.054059	0.538218
0.054204	0.513449
0.054843	0.630701
0.055004	0.657356
0.055035	0.600631
0.055323	0.556412
0.055422	0.615844
0.056308	0.68443
0.056424	0.633056
0.056435	0.61267
0.057399	0.617457
0.057496	0.599763
0.058184	0.628384
0.058214	0.653217
0.058334	0.674537
0.05855	    0.601923
0.058562	0.578879
0.059582	0.643082
0.059697	0.59348
0.060643	0.710845
0.06076	    0.739256
0.061859	0.658103
0.063081	0.67185
0.065232	0.757744
0.066322	0.691657
0.066367	0.769686
0.066447	0.705001];
units.LL   = {'cm', 'cm'};  label.LL = {'head length', 'body length'};  bibkey.LL = 'Stro1972';

% dry weight-wet weight
data.WdWw = [ ... % dry weight (g), wet weight (g)
0.0001049	0.0007758
0.0003159	0.0009373
0.0004477	0.0011886
0.0003272	0.0012383
0.0006323	0.0013495
0.0005344	0.0014128
0.0004327	0.0015021
0.0002254	0.0015107
0.0006173	0.0017938
0.0005381	0.0018313
0.0003008	0.0019961
0.0004214	0.0020249
0.000508	0.0021837
0.0009036	0.0031861
0.0007152	0.0040319
0.0008132	0.0040733
0.0011108	0.0041582
0.00093     0.004625
0.0008245	0.0047535
0.0010242	0.0047578
0.0008245	0.0049889
0.0011146	0.0050867
0.0008283	0.0052766
0.0012012	0.0053893
0.0011975	0.0055985
0.0010204	0.0058562
0.001318	0.0060326
0.0014122	0.0062308
0.0015215	0.0062332
0.0017023	0.0063025
0.0010242	0.006327
0.0011146	0.0063813
0.0012201	0.0064097
0.0008132	0.0064924
0.0010355	0.0065365
0.0015215	0.006547
0.0011071	0.0071264
0.0016194	0.0072552
0.001318	0.0072749
0.0011071	0.0074533
0.0016232	0.0075561
0.0015215	0.0075931
0.0010091	0.0076604
0.0013105	0.0076931
0.0011975	0.0077561
0.0013105	0.0079677
0.0011899	0.0083182
0.0017023	0.0083816
0.0018229	0.0083973
0.001416	0.0084931
0.001318	0.008504
0.0011146	0.0085258
0.0012012	0.0086846
0.0018342	0.0088029
0.0014085	0.008846
0.0016232	0.0091122
0.0011146	0.0091142
0.001529	0.0093455
0.0019096	0.0094322
0.0025124	0.0094976
0.0017023	0.0096108
0.0020339	0.0096441
0.0020339	0.0099056
0.0019246	0.0100079
0.001838	0.0100583
0.001529	0.0100647
0.0017174	0.0100688
0.0016232	0.0102106
0.0025011	0.0103342
0.001416	0.0106245
0.0021055	0.0106918
0.0021997	0.0106938
0.0023202	0.0107487
0.0028025	0.0109423
0.0025011	0.010988
0.0019096	0.0110667
0.0015215	0.0110975
0.0023202	0.011141
0.0016194	0.0112566
0.0023278	0.0114942
0.0017023	0.0115722
0.0024106	0.0117053
0.0018983	0.0117334
0.0018983	0.0118903
0.002923	0.0120825
0.0026179	0.0122197
0.0025011	0.0122434
0.0020339	0.0124163
0.0021168	0.0125227
0.0027121	0.0125879
0.0021997	0.0126422
0.0019133	0.0127013
0.0033111	0.0127186
0.0027196	0.0127973
0.0023353	0.0128413
0.0025124	0.0128451
0.0026329	0.0129523
0.0029343	0.0130373
0.0018229	0.0130394
0.0028025	0.0131129
0.0021997	0.0132175
0.0020339	0.0132532
0.003134	0.013277
0.0023202	0.0133117
0.0028025	0.0135314
0.0024559	0.0135762
0.0023202	0.0136255
0.0027121	0.013634
0.0024219	0.0137585
0.0026216	0.013789
0.0030059	0.0138627
0.0025161	0.0138651
0.002923	0.014057
0.0031265	0.0140614
0.0027987	0.0140674
0.0021092	0.0143532
0.0031265	0.0145583
0.0023052	0.0145667
0.0027874	0.0145771
0.0029193	0.0147631
0.0025161	0.0147805
0.0027121	0.0149024
0.0019096	0.0149765
0.002923	0.01526
0.0024935	0.0155123
0.0034053	0.015532
0.0032018	0.0156061
0.0029984	0.0156801
0.0035108	0.0157174
0.0025011	0.0157478
0.0027987	0.0158327
0.002923	0.0158877
0.0026066	0.0159331
0.0027045	0.0161445
0.003119	0.0161535
0.0032094	0.0162601
0.0033073	0.0163668
0.0027083	0.0163799
0.0028025	0.0170489
0.0030097	0.0171449
0.0031265	0.0171474
0.0034354	0.0174941];
units.WdWw   = {'g', 'g'};  label.WdWw = {'dry weight', 'wet weight'};  bibkey.WdWw = 'Wen1992';   % sieht mir mehr nach den Ingersoll et al Daten aus, bitte rpren!
temp.WdWw    = C2K(8);  units.temp.WdWw = 'K'; label.temp.WdWw = 'temperature';

% dry weight-respiration
data.WdJO = [ ... % mean dry weight (g), O2 consumption (mul/h)
0.000119363	0.207157836
0.000216722	0.377057249
0.000236602	0.346384902
0.000278947	0.446790545
0.000402177	0.469655559
0.000497877	0.449026035
0.000554981	0.652886559
0.000590815	1.033361489
0.000724296	1.048950321
0.000789582	0.84635058
0.000813464	1.176545038
0.000863657	0.921294834
0.000867446	1.359776368
0.000872278	0.880827148
0.001036966	0.939872264
0.001419997	1.048950321
0.001541059	0.903084604
0.001570656	1.218376187];
units.WdJO   = {'g', 'mul/h'};  label.WdJO = {'dry weight', 'O2 consumption'};  bibkey.WdJO = 'Math1971';
temp.WdJO   = C2K(15);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';

% time-survival
data.tS = [ ... % time (d), surviving fraction (-)
0.0	1.00
3.7	0.97
12.5	0.91
20.9	0.83
27.9	0.78
35.2	0.68
42.1	0.64];
units.tS  = {'d', '-'};  label.tS = {'time', 'surviving fraction'};  bibkey.tS = 'Borg1989';
temp.tS   = C2K(25);  units.temp.tS = 'K'; label.temp.tS = 'temperature';

% time-survival (with artificial substrate)
data.tS_2 = [ ... % time (d), surviving fraction (-)
0.26	1.00
3.83	0.92
6.63	0.86
13.03	0.77
19.96	0.70
27.92	0.65
34.34	0.59
40.76	0.54
47.95	0.49
54.63	0.44
61.82	0.38
69.01	0.33
75.43	0.29
82.37	0.25
89.57	0.20
94.71	0.18
102.43	0.14
110.41	0.11
117.36	0.09
127.67	0.08
139.52	0.06
147.25	0.06
153.43	0.05];
units.tS_2  = {'d', '-'};  label.tS_2 = {'time', 'surviving fraction'};  bibkey.tS_2 = 'Borg1989';
temp.tS_2   = C2K(25);  units.temp.tS_2 = 'K'; label.temp.tS_2 = 'temperature';

% time-survival (with gauze)
data.tS_3 = [ ... % time (d), surviving fraction (-)
0.00	1.00
6.17	0.96
14.32	0.94
20.72	0.88
29.61	0.85
39.48	0.82
49.61	0.78
56.27	0.74
63.17	0.70
70.56	0.64
76.22	0.57
80.89	0.52
84.83	0.48
88.27	0.44
91.72	0.40
97.12	0.32
104.52	0.27
111.42	0.23
118.83	0.20
125.73	0.15
136.12	0.15
144.03	0.15
153.43	0.15];
units.tS_3  = {'d', '-'};  label.tS_3 = {'time', 'surviving fraction'};  bibkey.tS_3 = 'Borg1989';
temp.tS_3   = C2K(25);  units.temp.tS_3 = 'K'; label.temp.tS_3 = 'temperature';

% time-cum reprod (control 1 and 2 of Pede2013)
data.tN = [ ... % time (d), cumulative reproduction (#)
84	13.23
98	22.89
112	37.59
126	53.81
84	10.18
98	19.32
112	30.55
126	47.56];
units.tN  = {'d', '#'};  label.tN = {'time', 'cumulative reproduction'};  bibkey.tN = 'Pede2013';
temp.tN   = C2K(23);  units.temp.tN = 'K'; label.temp.tN = 'temperature';

% temperature-fecal pellets
data.T_Jx = [ ... % temperature (C), Number of faecel pellets (#/day)
5.04605     80.63664
5.04069     99.40968
8.96661     166.99056
9.01434     191.73936
9.01191     200.27256
9.00728     216.48576
15.03047	231.24936
14.95936	288.41976
15.06626	297.81096
14.95254	312.31272
14.93086	388.25832
16.96067	379.81176
20.01524	428.58192
19.95412	450.76608
20.00404	467.83488];
units.T_Jx   = {'蚓', '#/day'};  label.T_Jx = {'temperature', 'number of faecel pellets'};  bibkey.T_Jx = 'Harg1972';

% time-survival
data.tS4 = [ ...      %  time (d), survival (-)
0	30
1	30
2	30
3	30
4	30
5	30
6	30
7	30
8	30
9	29
10	27
11	25
12	20
13	16
14	13
15	9
16	7
17	6
18	5
19	3
20	1
21	0];
data.tS4(:,2)=data.tS4(:,2)/30;
units.tS4   = {'d', '-'};  label.tS4 = {'starvation time', 'survival'};  
temp.tS4    = C2K(23);  units.temp.tS4 = 'K'; label.temp.tS4 = 'temperature';
bibkey.tS4 = 'SoucDick2013';
comment.tS4 = 'starvation initiated 7-9 day afer birth, data from a strain referred to as US lab';

% temperature-respiration (adult)
data.TJO = [ ... % temperature (C), O2 consumption (mul/h)
10	0.340841894
15	0.527024835
17	0.685403666
20	1.040695753
22	1.181100525];
units.TJO   = {'C', 'mul/h'};  label.TJO = {'temperature', 'O2 consumption'};  bibkey.TJO = 'Math1971';

% temperature-respiration (juvenile)
data.TJO2 = [ ... % temperature (蚓), O2 consumption (無/h/juvenile animal)
10	0.14379
15	0.16954
17	0.41314
20	0.34978
22	0.50605];
units.TJO2   = {'C', 'mul/h'};  label.TJO2 = {'temperature', 'O2 consumption'};  bibkey.TJO2 = 'Math1971';

%% set weights for all real data
 weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
 set1 = {'tL_2', 'tL_3', 'tL_4', 'tL_5', 'tL_6'}; subtitle1 = {'Pery2005 at diff food levels'};
 set2 = {'tWw','tWd'}; subtitle2 = {'OthmPasc2001 wet weight & dry weight'};
 set3 = {'tWd_2', 'tWd_3'}; subtitle3 = {'Lind1982 (15蚓 and 20蚓)'};
 set4 = {'tS', 'tS_2', 'tS_3'}; subtitle4 = {'Borg1989 at diff substrates'};
 set5 = {'TJO', 'TJO2'}; subtitle5 = {'Math1971 for adults and juveniles'};
 metaData.grp.sets = {set1,set2, set3, set4, set5};
 metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5};

 %% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3MVNH'; % Cat of Life
metaData.links.id_ITIS = '94026'; % ITIS
metaData.links.id_EoL = '342551'; % Ency of Life
metaData.links.id_Wiki = 'Hyalella_azteca'; % Wikipedia
metaData.links.id_ADW = 'Hyalella_azteca'; % ADW
metaData.links.id_Taxo = '132618'; % Taxonomicon
metaData.links.id_WoRMS = '158105'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Coop1965'; type = 'Article'; bib = [ ... 
'author = {Cooper, W.}, ' ... 
'year = {1965}, ' ...
'title = {Dynamics and Production of a Natural Population of a Fresh-Water Amphipod, \emph{Hyalella azteca}},' ...
'journal = {Ecological Monographs}, ' ...
'volume = {35}, ' ...
'pages = {377-394},' ...
'howpublished = {\url{http://www.jstor.org/stable/1942147}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EdwaCowe1992'; type = 'Article'; bib = [ ... 
'author = {Edwards, T.D. and Cowell B.C.}, ' ... 
'year = {1992}, ' ...
'title = {Population dynamics and secondary production of \emph{Hyalella azteca} ({A}mphipoda) in \emph{Typha} stands of a subtropical {F}lorida lake}, ' ...
'journal = {Journal of the North American Benthological Society}, ' ...
'volume = {11}, ' ...
'pages = {69-79}, ' ...
'howpublished = {\url{http://www.jstor.org/stable/1467883}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OthmPasc2001'; type = 'Article'; bib = [ ... 
'author = {Othman, M.S. and Pascoe, D.}, ' ... 
'year = {2001}, ' ...
'title = {Growth, Development and Reproduction of \emph{Hyalella azteca} ({S}aussure, 1858) in Laboratory Culture}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {74}, ' ...
'pages = {171-181}, ' ...
'howpublished = {\url{http://www.jstor.org/stable/20106425}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harg1970'; type = 'Article'; bib = [ ... 
'author = {Hargrave, B.T.}, ' ... 
'year = {1970}, ' ...
'title = {Distribution, Growth, and Seasonal Abundance of \emph{Hyalella azteca} (Amphipoda) in Relation to Sediment Microflora}, ' ...
'journal = {Journal Fisheries Research Bord of Canada}, ' ...
'volume = {27}, ' ...
'pages = {685-699}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lind1982'; type = 'PhDthesis'; bib = [ ... 
'author = {Lindeman, D.H.}, ' ... 
'year = {1982}, ' ...
'title = {Production ecology of the amphipod \emph{Hyalella azteca} (Saussure) in a Northern {O}ntario lake}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Inge1998'; type = 'Article'; bib = [ ... 
'author = {Ingersoll, C.G. and Brunson, E.L. and Dwyer, F.J. and Hardesty D.K. and Kemble N.E.}, ' ... 
'year = {1998}, ' ...
'title = {Use of sublethal endpoints in sediment toxicity test with the amphipod \emph{Hyalella azteca}}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {17}, ' ...
'pages = {1508-1523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wen1992'; type = 'Article'; bib = [ ... 
'author = {Wen, Y.H.}, ' ... 
'year = {1992}, ' ...
'title = {Life history and production of \emph{Hyalella azteca} ({C}rustacea: {A}mphipoda) in a hypereutrophic prairie pond in southern {A}lberta}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {70}, ' ...
'pages = {1417-1424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wen1993'; type = 'Article'; bib = [ ... 
'author = {Wen, Y.H.}, ' ... 
'year = {1993}, ' ...
'title = {Sexual Dimorphism and Mate Choice in \emph{Hyalella azteca} (Amphipoda)}, ' ...
'journal = {American Midland Naturalist}, ' ...
'volume = {129}, ' ...
'pages = {153-160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Math1971'; type = 'Article'; bib = [ ... 
'author = {Mathias, J.A.}, ' ... 
'year = {1971}, ' ...
'title = {Energy flow and secondary production of the amphipods \emph{Hyalella azteca} and \emph{Crangonyx richmondensis occidentalis} in {M}arion {L}ake, {B}ritish {C}olumbia}, ' ...
'journal = {Journal fisheries research board of Canada}, ' ...
'volume = {28}, ' ...
'pages = {711-726}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Borg1989'; type = 'Article'; bib = [ ... 
'author = {Borgmann, U. and Ralph, K.M. and Norwood, W.P.}, ' ... 
'year = {1989}, ' ...
'title = {Toxicity Test Procedures for \emph{Hyalella azteca}, and Chronic Toxicity of Cadmium and Pentachlorophenol to \emph{H. azteca}, \emph{Gammarus fasciatus}, and \emph{Daphnia magna}}, ' ...
'journal = {Archives of Environmental Contamination and Toxicology}, ' ...
'volume = {18}, ' ...
'pages = {756-764}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pery2005'; type = 'Article'; bib = [ ... 
'author = {Pery, A.R.R. and Dargelos, S. and Queau, H. and Garric, J.}, ' ... 
'year = {2005}, ' ...
'title = {Preparatory Work to Propose Water-Only Tests with the Amphipod \emph{Hyalella azteca}: Comparison with Sediment Toxicity Tests}, ' ...
'journal = {Environmental Contamination and Toxicology}, ' ...
'volume = {75}, ' ...
'pages = {617-622}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pede2013'; type = 'Article'; bib = [ ... 
'author = {Pedersen, S. and Palmqvist, A. and Thorbek, P. and Hamer, M. and Forbes, V.}, ' ... 
'year = {2013}, ' ...
'title = {Pairing behavior and reproduction in \emph{Hyalella azteca} as sensitive endpoints for detecting long-term consequences of pesticide pulses}, ' ...
'journal = {Aquatic Toxicology}, ' ...
'volume = {144-145}, ' ...
'pages = {59-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoucDick2013'; type = 'Article'; bib = [ ... 
'author = {Soucek, D .J. and Dickinson, A. and Major, K. M. and McEwen, A.R.}, ' ... 
'year = {2013}, ' ...
'title = {Effect of test duration and feeding on relative sensitivity of genetically distinct clades of \emph{Hyalella azteca}}, ' ...
'journal = {Ecotoxicology}, ' ...
'volume = {22}, ' ...
'pages = {1359-1366}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harg1972'; type = 'Article'; bib = [ ... 
'author = {Hargrave, B.T.}, ' ... 
'year = {1972}, ' ...
'title = {Prediction of Egestion by the Deposit-Feeding Amphipod \emph{Hyalella azteca}}, ' ...
'journal = {Oikos}, ' ...
'volume = {23}, ' ...
'pages = {116-124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stro1972'; type = 'Article'; bib = [ ... 
'author = {Strong, D.R.}, ' ... 
'year = {1972}, ' ...
'title = {Life History Variation Among Populations of an Amphipod (\emph{Hyalella azteca})}, ' ...
'journal = {Ecology}, ' ...
'volume = {53}, ' ...
'pages = {1103-1111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gonz2002'; type = 'Article'; bib = [ ... 
'author = {Gonzalez, E.R. and Watling L.}, ' ... 
'year = {2002}, ' ...
'title = {Redescription of \emph{Hyalella azteca} from Its Type Locality, {V}era {C}ruz, {M}exico ({A}mphipoda: {H}yalellidae)}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {22}, ' ...
'pages = {173-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

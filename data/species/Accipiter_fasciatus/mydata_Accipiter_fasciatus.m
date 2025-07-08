function [data, auxData, metaData, txtData, weights] = mydata_Accipiter_fasciatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Accipiter_fasciatus'; 
metaData.species_en = 'Brown goshawk'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 30;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'OlseLsen1982';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 30.5;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'OlseLsen1982';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 91.5;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on other Accipiter species in AnAge';

data.Wwb = 14;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'OlseLsen1982';
data.Wwi = 580;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'OlseLsen1982';
data.Wwim = 350;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'OlseLsen1982';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'OlseLsen1982';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2-4 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.789	14.008
1.149	20.380
1.437	29.317
1.654	21.623
2.230	36.938
2.301	45.890
2.807	38.175
3.166	53.505
3.959	59.846
4.032	54.722
4.680	72.590
5.688	86.593
6.051	72.490
6.551	115.963
7.633	124.842
7.771	188.818
8.645	110.692
9.790	202.747
10.655	212.921
10.661	156.614
11.016	211.615
11.230	235.914
11.731	278.108
11.732	269.150
11.820	113.019
11.951	235.861
12.886	270.345
12.895	185.884
13.681	260.049
14.254	298.398
15.410	288.076
15.836	352.030
16.123	375.044
17.284	313.533
18.141	399.211
18.280	445.270
18.715	427.323
19.581	431.098
20.374	436.159
20.375	427.201
21.600	445.028
21.812	491.082
22.527	555.015
22.819	524.280
22.827	441.099
23.620	447.439
23.899	540.837
24.623	524.148
25.927	476.704
26.928	570.049
26.941	438.238
28.016	512.383
29.107	424.003
31.547	555.635
31.989	474.981
33.140	505.610
33.208	550.394
33.279	560.627
35.666	507.984
37.466	541.125
37.829	520.623
40.063	557.571
43.240	538.143
44.388	603.325
44.683	536.758
46.415	540.471
47.425	539.117
48.580	539.033
55.360	570.530
56.442	574.290
56.520	523.096
58.534	583.094
59.109	609.926
61.783	567.500
65.101	582.614
66.979	570.960
67.552	606.749
69.071	570.807];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'OlseLsen1982';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.428	14.035
0.571	25.542
1.148	30.618
1.582	13.950
2.160	13.908
2.230	29.259
2.589	54.827
2.879	39.450
3.454	58.603
3.455	48.365
3.887	63.690
4.898	49.540
5.256	81.506
5.835	60.988
6.408	101.897
6.411	81.422
6.845	63.474
6.914	94.182
7.563	105.652
8.637	188.754
8.641	146.524
8.642	141.405
8.644	119.650
8.646	96.615
9.650	161.806
9.651	146.450
9.792	184.831
10.368	193.747
10.803	174.519
11.595	193.657
11.819	120.697
11.883	202.594
12.100	193.620
12.245	185.931
12.817	239.637
13.321	253.677
13.901	225.481
14.043	245.946
14.980	258.674
14.981	248.437
14.982	234.360
15.697	302.132
16.138	224.038
17.068	302.032
17.216	271.308
17.574	300.715
17.938	267.416
18.295	303.222
18.297	281.466
19.021	257.099
19.302	330.022
19.377	310.821
19.522	301.852
20.892	313.269
21.829	327.278
22.483	283.720
22.697	304.180
22.838	337.442
22.984	315.676
23.125	355.337
23.346	305.412
23.630	348.901
23.778	320.737
23.846	359.123
23.916	375.754
25.727	311.636
25.796	343.624
25.867	357.695
25.871	314.185
25.941	337.215
26.014	324.412
26.806	347.389
26.813	279.564
26.954	314.106
27.459	310.230
28.179	328.093
29.045	329.309
29.119	311.388
29.188	344.655
29.984	317.723
30.054	343.312
30.055	326.676
30.418	313.853
31.142	290.765
32.287	376.422
33.157	343.086
33.159	326.449
35.464	364.672
37.415	341.494
41.023	342.510
42.104	357.788
44.485	360.173
45.570	330.660
47.373	347.165
49.756	327.795
55.311	345.305
56.319	368.266
56.320	355.468];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'OlseLsen1982';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2; 
weights.tW_m = weights.tW_m * 2; 

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '93V2'; % Cat of Life
metaData.links.id_ITIS = '175319'; % ITIS
metaData.links.id_EoL = '45518720'; % Ency of Life
metaData.links.id_Wiki = 'Accipiter_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Accipiter_fasciatus'; % ADW
metaData.links.id_Taxo = '52540'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '8257AE54E56538E3'; % avibase
metaData.links.id_birdlife = 'brown-goshawk-accipiter-fasciatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Accipiter_fasciatus}}';
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
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1047987/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlseLsen1982'; type = 'Article'; bib = [ ... 
'title = {GROWTH AND DEVELOPMENT OF NESTLING BROWN GOSHAWKS \emph{Accipiter fasciatus}, WITH DETAILS OF BREEDING BIOLOGY}, ' ...
'author = {P. Olsen and J. Lsenz and N. J. Mooney}, ' ...
'journal = {Emu}, ' ...
'year = {1982}, ' ...
'volume = {82}, ' ...
'pages = {189--194}'];
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


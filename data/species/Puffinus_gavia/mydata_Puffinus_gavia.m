function [data, auxData, metaData, txtData, weights] = mydata_Puffinus_gavia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Puffinus_gavia'; 
metaData.species_en = 'Fluttering shearwater'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPW', 'MIE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 50;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BergLinn2017';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 79; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BergLinn2017';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 237; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Puffinus puffinus';
data.am = 50.9*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Puffinus puffinus';

data.Wwb = 40; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BergLinn2017';
data.Wwi = 525; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BergLinn2017';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 330 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BergLinn2017';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.642	34.006
0.896	18.915
0.897	37.783
0.898	44.387
0.899	50.990
2.055	52.891
2.183	59.496
2.697	52.898
2.825	58.560
3.339	66.113
3.850	59.516
3.851	68.006
3.852	75.553
4.750	63.300
4.751	68.960
4.880	75.566
5.521	83.120
5.522	90.667
5.778	111.425
5.906	95.389
5.907	102.936
6.934	82.194
6.935	90.684
6.936	94.458
7.062	104.837
7.063	113.327
7.705	109.561
7.833	114.280
7.961	98.243
7.962	105.791
8.604	84.100
8.859	123.726
8.860	128.443
8.988	117.123
8.989	162.406
9.759	136.944
9.886	96.379
9.887	118.077
9.888	132.228
10.016	108.645
10.144	122.797
10.658	137.898
10.915	97.335
11.041	109.601
11.042	115.261
11.043	143.563
11.556	146.399
11.557	153.946
12.070	118.103
12.071	130.367
12.711	117.167
12.712	136.035
12.713	142.639
12.841	147.358
12.968	120.944
12.969	128.491
12.970	156.793
13.865	114.351
13.866	148.313
13.867	154.917
13.868	182.275
14.125	162.467
14.254	131.336
14.638	155.869
14.639	166.247
14.766	123.795
14.767	187.003
15.538	128.521
15.793	170.034
15.794	175.694
15.795	187.015
16.051	156.829
16.180	149.284
16.693	130.422
16.950	167.217
17.079	187.030
17.207	220.051
18.233	107.799
18.234	176.666
19.004	161.581
19.005	213.468
19.133	153.092
19.647	211.589
19.775	166.307
19.904	170.082
20.417	178.579
20.803	224.810
20.931	206.887
21.830	198.407
21.958	206.899
22.856	207.853
22.857	198.419
23.884	165.412
24.783	244.668
25.939	191.852
26.966	258.845
27.865	301.308
29.278	309.816
30.690	264.549
31.589	253.239
32.873	240.047
33.772	268.359
33.900	219.304
34.157	320.250
35.056	257.054
36.212	300.463
36.725	324.998
36.726	298.583
37.110	314.625
37.111	318.398
38.010	317.466
38.780	297.663
39.037	333.516
39.679	272.202
39.807	328.808
39.936	321.262
40.063	355.226
40.064	317.490
40.193	385.416
40.706	338.252
41.091	346.747
41.605	307.131
41.862	340.153
41.990	353.362
42.761	316.578
42.889	296.769
43.017	353.374
43.018	328.846
43.145	340.168
43.146	323.187
43.915	336.403
43.916	319.422
43.917	368.479
44.814	378.867
44.815	393.961
44.943	334.529
44.944	285.472
45.329	353.401
45.586	327.932
45.714	356.236
45.967	334.541
45.968	276.050
45.969	317.560
45.970	368.503
45.971	405.295
46.100	290.203
46.613	366.624
46.742	398.701
46.997	359.081
46.998	412.855
47.384	327.954
47.768	317.581
47.769	410.034
47.897	402.488
48.026	265.697
48.153	375.132
48.154	387.397
48.539	396.835
48.666	328.912
48.667	336.459
48.668	348.723
48.795	383.631
48.796	373.253
49.051	292.124
49.052	414.766
49.053	366.653
49.181	319.484
49.821	262.888
49.822	393.077
49.823	404.397
50.078	306.287
50.079	373.268
50.080	348.740
50.722	339.314
50.850	327.051
50.851	332.711
50.977	288.373
50.978	402.524
50.979	356.298
51.107	375.167
51.108	407.243
51.493	415.738
51.621	375.173
51.878	328.007
52.006	396.876
52.134	387.444
52.135	346.878
52.263	356.313
52.647	395.940
52.648	400.657
53.161	365.758
53.162	356.324
53.163	295.946
53.803	376.143
53.804	389.350
53.933	315.767
54.061	336.523
54.189	321.430
54.317	351.620
54.318	296.903
54.827	358.230
54.828	366.721
54.829	378.985
54.830	394.079
54.831	399.740
55.214	288.423
55.215	344.084
55.216	352.574
55.217	406.348
55.602	370.503
55.730	296.920
55.985	356.357
55.986	386.546
55.987	395.036
56.116	378.057
56.243	365.794
56.244	408.247
56.758	401.649
56.885	266.745
56.886	385.613
57.012	330.897
57.013	377.124
57.014	416.746
57.143	366.748
57.271	397.882
57.783	318.642
57.784	359.208
57.785	350.718
57.913	294.115
58.039	267.702
58.040	246.947
58.041	374.306
58.042	366.759
58.169	408.269
58.170	417.703
58.299	387.516
58.810	256.390
58.811	378.088
58.812	353.560
59.068	412.054
59.069	419.601
59.197	381.866
59.325	387.528
59.326	406.396
59.710	362.061
59.711	372.439
59.837	285.648
59.838	346.025
59.839	417.723
60.095	403.575
60.096	408.292
60.225	356.407
60.482	259.240
60.865	324.339
60.866	331.886
60.867	385.660
60.994	313.963
60.995	396.982
61.124	414.908
61.766	385.670
62.021	399.824
62.022	309.258
62.151	405.486
62.279	284.733
62.407	423.414
62.408	409.263
62.536	386.623
62.791	363.041
62.792	333.796
62.793	297.003
62.920	427.193
62.921	398.892
63.435	332.860
63.819	283.808
63.820	276.261
63.947	414.941
63.948	397.017
63.949	383.809
64.076	369.660
64.077	356.452
64.591	352.685
64.718	414.007
64.719	404.573
64.848	334.763
64.974	375.331
64.975	385.708
64.976	396.086
65.104	247.974
65.361	323.449
65.746	275.340
65.874	447.983
65.875	395.153
66.003	407.418
66.131	371.571
66.132	356.477
66.774	412.145
66.901	395.165
66.902	384.788
66.903	377.240
67.029	295.166
67.030	359.317
67.159	312.149
67.287	336.679
67.673	378.193
67.800	384.798
67.801	340.459
67.929	408.385
68.058	359.329
68.315	268.766
68.571	340.468
68.700	298.016
68.828	364.056
69.213	356.513
69.470	335.761
69.726	348.028
69.727	300.859
69.856	395.200
69.857	283.879
70.112	260.297
70.626	348.039
71.011	354.647
71.140	418.800
71.781	377.298
71.782	355.600
71.783	254.656
72.039	300.886
72.680	389.573
72.681	337.686
72.936	348.066
72.937	247.123
72.938	275.425
73.323	265.995
73.579	334.866
73.836	359.398
73.965	237.701
74.093	353.740
74.735	359.408
74.736	332.993
75.120	376.394
75.249	268.848
75.377	253.755
75.762	336.779
75.891	359.422
76.276	325.464
76.918	280.189
77.817	321.709];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BergLinn2017';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4QFXP'; % Cat of Life
metaData.links.id_ITIS = '562596'; % ITIS
metaData.links.id_EoL = '1049465'; % Ency of Life
metaData.links.id_Wiki = 'Puffinus_gavia'; % Wikipedia
metaData.links.id_ADW = 'Puffinus_gavia'; % ADW
metaData.links.id_Taxo = '51575'; % Taxonomicon
metaData.links.id_WoRMS = '225752'; % WoRMS
metaData.links.id_avibase = '426C93D3D06A790B'; % avibase
metaData.links.id_birdlife = 'fluttering-shearwater-puffinus-gavia'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Puffinus_gavia}}';
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
bibkey = 'BergLinn2017'; type = 'Article'; bib = [ ... 
'author = {Berg, M. and Linnebjerg, J. F. and Ismar, S. M. H. and Gaskin, C. P. and Rayner, M. J.}, ' ... 
'doi = {10.1080/01584197.2017.1366831}, ' ...
'year = {2017}, ' ...
'title = {Breeding biology of Fluttering Shearwaters (\emph{Puffinus gavia}) on {B}urgess {I}sland in northern {N}ew {Z}ealand}, ' ...
'journal = {Emu}, ' ...
'volume = {118}, ' ...
'number = {2}, ' ...
'pages = {173-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puffinus_puffinus}}';
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


function [data, auxData, metaData, txtData, weights] = mydata_Rissa_tridactyla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Rissa_tridactyla'; 
metaData.species_en = 'Black-legged kittiwake'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MPN', 'MN'};
metaData.ecoCode.habitat = {'biMc', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-Wwe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 08 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 32;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LancRoby2000';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 96;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LancRoby2000';
data.Wwi = 490; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '305 till 525 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.052	28.773
0.053	36.233
0.101	40.494
0.103	50.086
1.000	33.007
1.001	39.401
1.049	45.794
2.047	64.947
2.048	70.275
2.091	43.631
2.092	50.025
2.093	58.551
2.948	71.313
2.993	58.523
2.996	74.509
3.044	78.771
3.990	73.413
3.991	78.742
3.992	88.333
4.035	58.492
4.036	67.017
4.940	95.764
4.941	100.027
4.942	104.290
4.943	111.750
4.984	71.251
5.934	90.405
5.936	97.865
5.937	104.260
5.986	114.915
6.889	134.071
6.935	128.741
6.939	152.187
6.941	166.041
6.978	103.162
6.980	113.819
6.981	121.279
7.975	115.921
7.977	128.709
8.929	160.652
8.933	187.295
8.973	140.402
8.974	144.665
8.975	152.125
9.880	185.134
9.928	189.396
9.972	164.883
9.980	213.906
10.063	142.500
10.922	185.103
10.926	206.417
11.102	121.154
11.964	182.939
12.012	189.332
12.118	257.535
12.158	209.577
13.018	261.771
13.020	274.559
13.106	218.073
13.109	238.322
13.905	180.749
13.963	243.625
15.002	227.607
15.004	240.396
15.100	245.721
15.106	287.284
15.957	277.667
16.006	291.520
16.007	295.783
16.008	300.045
16.155	333.078
16.995	252.058
16.999	274.438
17.007	325.592
17.962	374.586
18.043	288.261
18.045	302.115
18.046	307.443
18.099	346.873
19.000	350.043
19.001	355.372
19.999	376.656
20.036	311.646
20.037	316.974
20.038	321.237
20.086	334.024
20.087	338.287
20.988	338.260
20.992	368.100
22.033	362.739
22.036	379.791
22.044	429.879
22.970	299.833
22.974	325.411
22.975	329.673
22.976	335.002
22.984	389.353
23.029	369.103
24.019	345.627
24.026	388.256
24.034	440.476
24.941	483.077
24.975	398.884
24.976	406.344
24.977	410.607
24.982	441.513
25.110	355.186
26.011	358.355
26.061	376.471
26.062	383.931
26.063	388.194
26.974	463.832
27.010	391.362
27.013	407.348
27.014	414.808
27.015	423.334
27.969	464.868
28.011	427.566
28.052	388.133
28.075	532.005
29.046	382.775
29.050	414.746
29.051	419.009
29.052	424.337
29.994	392.337
30.006	465.871
30.047	423.241
30.048	430.701
30.049	438.161
30.100	460.540
30.187	415.777
30.804	423.218
30.853	431.743
30.892	380.587
31.940	418.921
32.085	434.902];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'LancRoby2000'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LancRoby2000';
%
data.tW1 = [ ... % time since birth (d), weight (g)
0.043	36.723
0.996	40.856
1.946	55.902
2.847	66.971
3.847	85.002
4.849	97.081
6.000	110.177
6.849	132.150
8.053	138.311
9.002	159.310
9.851	177.314
10.952	197.347
12.054	205.474
13.001	238.377
13.853	246.461
14.951	274.430
15.904	280.548
16.902	304.530
17.853	317.592
18.905	328.688
20.057	341.784
20.856	362.756
21.858	370.867
22.911	375.018
23.962	389.089
24.964	399.184
25.917	399.350
26.924	382.659
27.824	403.649
28.824	419.695
29.832	400.029
30.889	384.340
31.842	389.465
32.796	384.671
33.852	373.941
34.952	394.966
36.063	363.412
37.116	366.571
39.184	315.343
39.937	312.498];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'MaunThre1972'};  
temp.tW1    = C2K(40.9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MaunThre1972';

% time-weight for embryo
data.tWe = [ ... % time since laying (d), embryo weight (g)
5.920	0.091
6.984	0.162
7.982	0.887
7.982	0.559
8.980	1.285
9.047	0.499
10.044	1.028
10.044	0.831
10.976	2.605
10.976	2.081
11.973	2.806
11.973	2.413
13.038	3.401
13.038	2.746
13.969	2.684
14.035	4.258
14.967	4.393
15.033	4.787
15.965	5.447
16.031	6.693
16.896	9.320
17.029	5.451
18.027	8.079
18.027	6.636
18.958	10.050
18.958	9.788
19.889	14.251
20.022	15.301
20.887	9.927
21.086	15.830
21.885	19.768
22.084	12.687
22.882	21.543
22.949	19.051
23.747	21.874
23.947	20.301
24.945	23.453
25.011	25.749
25.876	27.392
25.942	24.769
26.807	40.379
26.874	30.281
27.871	29.892];
units.tWe   = {'d', 'g'};  label.tWe = {'time since laying', 'embryo wet weight'};  
temp.tWe    = temp.ab;  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'MaunThre1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe = weights.tWe * 2;
weights.tW1 = weights.tW1 * 2;
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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Main food at Pribolof Islands: mostly juvenile walleye pollock (Theragra chalcogramma) and sandlance(Ammodytes hexapterus)';
metaData.bibkey.F1 = {'LancRoby2000'}; 
metaData.facts = struct('F1',F1);

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data from LancRoby2000,MaunThre1972'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tW1 and tWe data added';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4T594'; % Cat of Life
metaData.links.id_ITIS = '176875'; % ITIS
metaData.links.id_EoL = '45509266'; % Ency of Life
metaData.links.id_Wiki = 'Rissa_tridactyla'; % Wikipedia
metaData.links.id_ADW = 'Rissa_tridactyla'; % ADW
metaData.links.id_Taxo = '53831'; % Taxonomicon
metaData.links.id_WoRMS = '137156'; % WoRMS
metaData.links.id_avibase = 'FB4D08F0837D4683'; % avibase
metaData.links.id_birdlife = 'black-legged-kittiwake-rissa-tridactyla'; % birdlife
metaData.links.id_AnAge = 'Rissa_tridactyla'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rissa_tridactyla}}';
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
bibkey = 'LancRoby2000'; type = 'Article'; bib = [ ... 
'author = {Lance, B. and Roby, D.}, ' ... 
'year = {2000}, ' ...
'title = {DIET AND POSTNATAL GROWTH IN RED-LEGGED AND BLACKLEGGED KITTIWAKES: AN INTERSPECIES CROSS-FOSTERING EXPERIMENT}, ' ...
'journal = {The Auk}, ' ...
'volume = {117}, ' ...
'pages = {1016--1028}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaunThre1972'; type = 'Article'; bib = [ ... 
'author = {John Ernest Maunder and William Threlfall}, ' ... 
'year = {1972}, ' ...
'title = {The Breeding Biology of the Black-Legged Kittiwake in {N}ewfoundland}, ' ...
'journal = {The Auk}, ' ...
'volume = {89(4)}, ' ...
'pages = {789-816}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rissa_tridactyla}}';
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


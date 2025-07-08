function [data, auxData, metaData, txtData, weights] = mydata_Gallinula_melanops

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gruiformes'; 
metaData.family     = 'Rallidae';
metaData.species    = 'Gallinula_melanops'; 
metaData.species_en = 'Spot-flanked gallinule'; 

metaData.ecoCode.climate = {'Am', 'BSh', 'Cwa', 'Cfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnffm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 25];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 19;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CastRoss2020';   
  temp.ab = C2K(36);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '18-20 d';
data.tx = 60;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CastRoss2020';   
  temp.tx = C2K(40.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18.6*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Gallinula chloropus of AnAge';

data.Wwb = 10.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CastRoss2020';
data.Wwi = 140;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'CastRoss2020';
data.Wwim = 190;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'CastRoss2020';

data.Ri  = 5.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'CastRoss2020: 3-6 eggs per clutch';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
1.003	10.847
2.075	10.046
3.022	12.575
4.094	13.440
4.851	14.297
5.924	15.996
6.807	16.856
8.069	20.228
9.079	23.592
10.026	25.287
10.910	28.647
11.982	29.513
13.119	33.714
14.129	37.078
14.949	40.436
16.022	42.969
17.159	47.170
17.790	50.522
18.927	55.557
20.063	59.758
21.073	63.955
22.020	67.317
23.030	67.348
24.040	71.545
24.987	76.574
26.061	80.773
27.008	84.968
28.017	86.665
29.028	90.863
30.038	95.060
30.985	99.255
31.932	101.784
33.005	105.983
34.141	108.518
35.088	111.046
36.161	115.246
37.108	117.774
38.118	121.138
39.128	123.669
40.138	127.866
41.021	130.393
42.157	130.427
43.040	131.287
43.986	132.149
45.059	133.015
46.005	133.044
47.078	134.743
47.961	134.770
48.971	139.800
49.033	134.802
49.916	134.829
50.926	138.193
52.124	138.229
53.070	138.258
53.954	139.951
54.899	137.480
56.036	140.848
57.107	138.380
58.117	141.744
59.063	140.106];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'CastRoss2020';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
1.507	10.862
2.328	12.554
3.022	12.575
4.031	13.439
5.040	13.469
6.050	16.833
6.997	18.528
8.007	23.559
9.080	26.092
9.964	30.285
11.100	33.653
12.110	36.183
13.057	40.379
14.067	44.576
14.951	47.936
16.025	55.469
17.036	61.333
18.109	63.865
18.931	70.557
19.878	73.919
21.141	80.624
22.215	87.323
23.035	87.348
24.172	95.716
24.930	100.739
25.940	104.102
27.078	113.304
28.024	114.166
29.161	120.033
30.109	126.729
30.867	133.418
32.067	136.788
32.950	137.648
34.024	145.181
35.034	148.545
35.981	151.907
37.054	153.606
38.127	156.138
38.884	158.661
39.958	164.527
40.967	165.391
42.165	162.927
43.112	166.290
43.932	166.314
45.131	168.851
46.078	171.379
47.088	177.243
47.908	174.768
48.854	177.297
49.990	177.331
51.000	182.362
52.009	182.392
53.082	185.758
53.902	185.783
55.102	190.820
56.048	190.848
56.931	190.042
57.940	190.906
58.823	188.432
60.147	187.639];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'CastRoss2020';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

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
D1 = 'tW data suggests varying food availebility, which has been implemented';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3F6VY'; % Cat of Life
metaData.links.id_ITIS = '560143'; % ITIS
metaData.links.id_EoL = '55637003'; % Ency of Life
metaData.links.id_Wiki = 'Gallinula_melanops'; % Wikipedia
metaData.links.id_ADW = 'Gallinula_melanops'; % ADW
metaData.links.id_Taxo = '70219'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '43AF4EA8CD04CCAC'; % avibase
metaData.links.id_birdlife = 'spot-flanked-gallinule-porphyriops-melanops'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gallinula_melanops}}';
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
bibkey = 'CastRoss2020'; type = 'Article'; bib = [ ... 
'author = {Fernando Castro-Vargas and Loreta Rosselli}, ' ... 
'year = {2020}, ' ...
'title = {Breeding biology of \emph{Porphyriops melanops bogotensis} ({G}ruiformes, {R}allidae) an endemic and endangered subspecies from the northern {A}ndes}, ' ...
'journal = {Caldasia}, ' ...
'volume = {42(1)}, ' ...
'pages = {50-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=43AF4EA8CD04CCAC&sec=lifehistory}}';
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


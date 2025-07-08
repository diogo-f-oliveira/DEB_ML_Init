function [data, auxData, metaData, txtData, weights] = mydata_Podilymbus_podiceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Podicipediformes'; 
metaData.family     = 'Podicipedidae';
metaData.species    = 'Podilymbus_podiceps'; 
metaData.species_en = 'Pied-billed grebe'; 

metaData.ecoCode.climate = {'BSk', 'Cf', 'Csb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Tnffm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 08 07];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 10];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.author_mod_5   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_5     = [2023 06 24];              
metaData.email_mod_5    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_5  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 25;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(36.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from ElliJehl2003 for Podiceps nigricollis';
data.tx = 43.5;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 130.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'TacuCrai2013';
  temp.tR = C2K(39.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4978;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value taken from six other species of Grebes';
  
data.Li  = 34.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SnowPerr1998';

data.Wwb = 14.9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TacuCrai2013';
data.Wwi = 440;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'CramSimm1977';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
temp.Ri = C2K(39.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
 3  23.7;
 6	35;
 7	37.5;
 9	53.4;
13	92.2;
18	151.8;
19	164.5;
23	186;
24	198;
25	203;
26	211.6];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'McAl1963';
%
data.tW_f = [ ... % time since birth (d), weight (d)
0       14.9 % Wwb added
0.583	16.092
0.664	16.092
1.314	12.644
2.452	6.897
2.623	19.540
3.683	19.540
4.498	19.540
4.502	25.287
5.639	19.540
5.644	26.437
6.627	34.483
6.943	18.391
7.433	19.540
7.600	25.287
8.575	20.690
8.830	36.782
9.473	22.989
10.535	26.437
10.543	39.080
10.631	48.276
11.763	34.483
11.773	49.425
12.498	36.782
12.747	42.529
13.806	41.379
13.814	54.023
13.823	67.816
14.703	42.529
14.711	55.172
14.972	80.460
15.611	59.770
15.625	81.609
15.766	47.126
16.765	79.310
16.999	62.069
17.025	103.448
17.727	54.023
18.004	103.448
18.148	74.713
18.825	112.644
18.958	66.667
18.978	97.701
19.963	108.046
20.022	73.563
20.298	120.690
20.812	159.770
21.005	80.460
21.272	114.943
21.741	83.908
22.277	155.172
22.333	117.241
23.019	167.816
23.053	95.402
23.885	121.839
23.979	140.230
24.008	185.057
24.867	126.437
25.884	186.207
26.176	134.483
26.950	195.402
26.998	144.828
27.093	165.517
27.971	136.782
27.997	175.862
28.791	143.678
29.229	190.805
29.236	201.149
29.966	195.402
31.021	188.506
31.083	158.621
32.099	216.092
33.256	240.230
34.054	213.793
35.050	241.379
37.099	257.471
37.322	224.138
38.080	262.069
41.183	270.115
41.421	259.770
43.224	274.713
45.259	270.115
45.356	293.103
46.252	293.103
47.537	262.069
52.447	290.805
53.435	306.897
55.630	296.552
56.596	278.161
57.585	294.253
59.621	290.805];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MadiDuer2020';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (d)
0       14.9 % Wwb added
0.426	25.287
1.408	32.184
1.485	25.287
2.548	29.885
3.366	34.483
3.614	39.080
4.511	39.080
4.586	29.885
5.410	42.529
5.731	34.483
6.549	39.080
6.718	48.276
7.864	55.172
8.604	65.517
8.762	57.471
9.585	70.115
9.589	75.862
9.745	65.517
10.646	71.264
10.655	85.057
11.552	85.057
12.703	101.149
12.861	93.103
13.679	97.701
13.689	112.644
14.661	102.299
14.830	111.494
15.088	133.333
15.726	111.494
15.741	133.333
16.889	144.828
16.963	133.333
17.779	133.333
18.681	141.379
18.867	177.011
18.934	155.172
19.924	173.563
19.933	186.207
20.899	167.816
21.151	179.310
21.798	171.264
21.808	187.356
21.980	200.000
22.874	195.402
22.962	205.747
23.301	225.287
23.949	219.540
24.040	234.483
24.933	227.586
24.942	242.529
26.017	265.517
26.090	251.724
26.910	259.770
26.986	250.575
27.079	268.966
27.956	237.931
28.133	259.770
29.123	278.161
29.193	259.770
29.211	288.506
30.122	310.345
31.077	274.713
31.181	308.046
31.190	321.839
35.198	342.529
37.178	379.310
37.236	342.529
37.379	311.494
41.655	368.966
45.351	411.494
45.415	383.908
45.571	373.563
49.569	378.161
50.385	379.310
51.478	429.885
51.577	457.471
51.765	370.115
54.379	379.310
55.776	396.552
56.668	388.506
58.795	400.000
59.769	393.103];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MadiDuer2020';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: male and female weight data added';
D2 = 'Males are assumed to differ from females by {p_Am} only';     
D3 = 'mod_4: males have equal state variables at b, compared to females';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '4KPPM'; % Cat of Life
metaData.links.id_ITIS = '174505'; % ITIS
metaData.links.id_EoL = '45509028'; % Ency of Life
metaData.links.id_Wiki = 'Podilymbus_podiceps'; % Wikipedia
metaData.links.id_ADW = 'Podilymbus_podiceps'; % ADW
metaData.links.id_Taxo = '51455'; % Taxonomicon
metaData.links.id_WoRMS = '159062'; % WoRMS
metaData.links.id_avibase = '9A8E55D00554A088'; % avibase
metaData.links.id_birdlife = 'pied-billed-grebe-podilymbus-podiceps'; % birdlife
metaData.links.id_AnAge = 'Podilymbus_podiceps'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podilymbus_podiceps}}';
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
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm1977'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Ostrich to Ducks.}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {I}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McAl1963'; type = 'Book'; bib = [ ... 
'author = {McAllister, N. M.}, ' ... 
'year = {1963}, ' ...
'title = {Ontogeny of behaviour in five species of Grebes}, ' ...
'publisher = {University of British Columbia}, '...
'address = {British Columbia, Canada}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElliJehl2003'; type = 'Article'; bib = [ ... 
'author = {Ellis, H. I. and Jehl, J. R.}, ' ... 
'year = {2003}, ' ...
'title = {Temperature Regulation and the Constraints of Climate in the Eared Grebe}, ' ...
'journal = {Waterbirds}, ' ...
'volume = {26}, ' ...
'number = {3}, ' ...
'pages = {275--279}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MadiDuer2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Jessika Madison-Kennedy and Rebecca S. Duerr}, ' ... 
'year = {2020}, ' ...
'title = {Grebes}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {167--182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Podilymbus_podiceps/}}';
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


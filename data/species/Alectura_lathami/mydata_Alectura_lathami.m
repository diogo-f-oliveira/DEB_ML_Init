function [data, auxData, metaData, txtData, weights] = mydata_Alectura_lathami

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Megapodiidae';
metaData.species    = 'Alectura_lathami'; 
metaData.species_en = 'Australian brush-turkey'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1 = [2023 07 29];              
metaData.email_mod_1    = {'starrlight@tecnico.ulisboa.pt'};            
metaData.address_mod_1  = {'University of Lisbon, Portugal'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 29]; 

%% set data
% zero-variate data

data.ab = 49;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Goth2001';   
  temp.ab = C2K(33);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'mound temperature relatively stable at c. 31degC–36degC (average 33.3degC)';
data.tp = 138;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DialJack2011';   
  temp.tp = C2K(40.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'sub adult stage';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on tp, but very uncertain';
data.am = 12.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.Wwb = 120;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Goth2001';
data.Wwi = 2160;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'JoneDekk1995';
  comment.Wwi = '1980 till 2510 g';
data.Wwim = 2520;      units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'JoneDekk1995';
  comment.Wwim = '2120 till 2950 g';
data.Ri  = 20/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Between 16 and 24 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.310	98.494
0.325	114.049
0.339	129.603
0.351	142.565
0.366	158.120
0.727	77.721
0.974	108.813
0.984	119.183
1.229	147.682
1.401	98.410
1.653	134.686
2.699	87.938
2.714	103.493
2.729	119.047
2.738	129.417
3.189	144.937
4.464	108.542
4.478	124.096
5.077	64.420
5.140	131.822
5.152	144.784
5.324	95.512
6.189	87.667
6.637	100.595
6.654	118.742
7.107	136.855
7.754	129.027
7.997	154.934
8.156	92.699
8.602	103.035
8.840	123.757
9.732	144.428
9.916	108.118
10.803	123.604
11.437	102.814
11.479	146.885
11.929	162.405
12.775	133.821
13.187	107.863
13.449	154.509
13.849	115.589
14.323	157.034
15.205	167.336
15.218	180.298
15.380	120.656
15.390	131.025
16.688	120.554
17.195	195.700
17.338	115.318
17.379	159.389
17.621	185.296
18.431	117.826
18.450	138.565
18.465	154.119
19.989	151.408
20.045	211.034
20.655	164.319
20.832	120.232
21.116	190.210
21.721	138.311
21.734	151.273
21.969	169.402
22.637	184.906
22.882	213.405
22.889	221.183
23.573	252.241
23.679	132.973
23.742	200.376
24.581	164.014
24.675	265.118
25.688	182.076
26.333	171.656
26.972	156.050
27.818	127.466
28.293	168.910
28.528	187.040
28.540	200.002
28.783	225.910
29.025	251.817
30.905	163.522
31.710	324.200
33.498	137.395
33.973	178.839
34.870	204.695
35.068	183.939
35.139	259.119
38.577	204.407
39.457	212.116
39.646	180.991
39.663	199.137
40.983	211.998
43.974	377.691
44.870	170.214
45.127	211.675
45.801	232.364
47.342	247.799
47.744	211.472
48.386	198.459
49.881	397.972
50.354	203.491
51.769	317.455
52.782	234.413
55.830	228.991
57.068	387.043
57.808	244.393
58.636	430.995
61.941	233.701
65.862	461.544
66.555	269.638
66.589	305.932
67.437	279.940
69.601	261.624
71.322	235.564
75.286	276.737
75.536	310.421
75.870	434.840
75.984	556.683
80.086	512.290
83.573	509.426
83.597	302.017
85.136	548.193
86.922	825.462
88.684	610.139
88.868	340.495
89.714	311.911
91.907	324.704
100.766	469.200
103.746	391.190
109.870	408.862
118.753	812.616
122.744	415.638
124.964	456.947
136.820	541.581
138.848	611.423
139.939	1078.005
142.820	660.373
143.540	730.317
155.636	838.265
160.672	1091.948
161.854	957.041
162.809	1045.115
163.456	1037.287
164.827	871.254
167.810	1029.170
169.596	1073.105
173.980	862.765
175.821	966.325
179.805	1028.237
180.791	1150.013
181.795	1056.601
189.873	1299.677];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Goth2001';
comment.tW = 'Body temp from Boot1985';

% uni-variate data
% time-weight
data.tW2 = [ ... % time since birth (d), wet weight (g)
    2 163 % hatchline
    43 233 % young
    56 271 % young
    82 361 % juvenile
    84 374 % juvenile
    99 426 % juvenile
    138 585 % sub adult
    180 856 % sub adult
    ];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = metaData.T_typical;  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'DialJack2011';
comment.tW2 = 'Body temp from Boot1985';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 5;
weights.tW = weights.tW * 3;
weights.tW2 = weights.tW2 * 3;

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
D1 = 'Males are assume to differ from females by {p_Am} only';
D2 = 'Maturity at fledge is set equal to maturity at birth';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = ['Male maintains leaf mound in which eggs hatch. Hatchlings loose mass just after hatching. ' ...
  'It takes them 40 h to reach the mound surface, 40 till 150 cm above, and rest for 21 h. ' ...
  'No parental care after hatching, so they are superprecocial'];
metaData.bibkey.F1 = 'Goth2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BM6N'; % Cat of Life
metaData.links.id_ITIS = '175704'; % ITIS
metaData.links.id_EoL = '45517722'; % Ency of Life
metaData.links.id_Wiki = 'Alectura_lathami'; % Wikipedia
metaData.links.id_ADW = 'Alectura_lathami'; % ADW
metaData.links.id_Taxo = '52879'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '6BD20F58A143D7D0'; % avibase
metaData.links.id_birdlife = 'australian-brush-turkey-alectura-lathami'; % birdlife
metaData.links.id_AnAge = 'Alectura_lathami'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alectura_lathami}}';
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
bibkey = 'Boot1985'; type = 'Article'; bib = [ ... 
'author = {D. T. Booth}, ' ... 
'year = {1985}, ' ...
'title = {Thermogerulation in neonate brush turkeys (\emph{Alectura lathami})}, ' ...
'journal = {Physiol. Zool.}, ' ...
'volume = {58}, ' ...
'pages = {374--379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Goth2001'; type = 'Phdthesis'; bib = [ ... 
'author = {G\"{o}th A.}, ' ... 
'year = {2001}, ' ...
'title = {Survival, habitat selectivity and behavioural development of the {A}ustralian brush-turkey \emph{Alectura lathami}}, ' ...
'school = {Griffith University, Brisbane, Australia}, ' ...
'howpublished = {\url{https://experts.griffith.edu.au/publication/na25202a78c2154c5deb739e3dabc37f0}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneDekk1995'; type = 'Book'; bib = [ ... 
'title = {The megapodes (Megapodiidae)}, ' ...
'publisher = {Oxford University Press}, ' ...
'year = {1995}, ' ...
'author = {Jones, D. N. and Dekker, R. W. R. J. and Roselaar, C. S.}, ' ...
'volume = {3}, ' ...
'series = {Bird families of the world}, ' ...
'address = {Oxford University Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Alectura_lathami}}';
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
%
bibkey = 'DialJack2011'; type = 'Article'; bib = [ ... 
'doi = {10.1098/rspb.2010.1984}, ' ...
'author = {Dial, K. P. and Jackson, B. E.}, ' ... 
'year = {2011}, ' ...
'title = {When hatchlings outperform adults: locomotor development in Australian brush turkeys (Alectura lathami, Galliformes)}, ' ...
'journal = {Proc Biol Sci.}, ' ...
'volume = {278(1712)}, ' ...
'pages = {1610--1616}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


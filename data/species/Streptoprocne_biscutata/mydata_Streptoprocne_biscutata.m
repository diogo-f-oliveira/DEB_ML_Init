function [data, auxData, metaData, txtData, weights] = mydata_Streptoprocne_biscutata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Streptoprocne_biscutata'; 
metaData.species_en = 'Biscutate swift'; 

metaData.ecoCode.climate = {'Aw','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 09 07];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 24;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Pich2002';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 33;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Pich2002';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-39 d';
data.tp = 99;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '28-39 d';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Apus apus';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 11.6;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'Pich2002';
  comment.Ww0 = '10-14.3 g';
data.Wwb = 10;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Pich2002';
data.Wwi = 119;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Pich2002';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Pich2002';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time - weight
data.tW = [ ...  % age (d), weight (g)
0.000	12.702
0.000	10.584
1.105	12.997
1.105	12.997
1.768	19.948
1.823	16.923
1.878	12.991
2.983	25.383
3.039	22.358
3.039	18.729
3.923	25.981
3.923	23.562
3.923	21.444
5.028	41.701
5.028	39.584
5.028	28.695
5.083	32.022
5.193	34.743
6.022	33.527
6.133	39.575
7.017	52.272
7.017	50.457
7.072	46.827
7.072	44.710
7.072	41.685
7.072	38.358
8.011	44.400
9.006	72.219
9.116	67.379
9.171	65.261
9.171	61.329
9.171	57.397
9.171	54.373
9.171	51.650
9.890	64.651
9.945	62.533
10.000	83.100
10.055	48.014
10.055	73.421
10.110	75.840
10.110	80.377
10.829	74.625
10.994	84.000
10.994	78.253
10.994	70.087
10.994	61.920
12.044	80.967
12.099	92.763
12.099	89.738
12.099	79.454
12.099	75.220
12.099	70.986
12.210	86.713
12.818	103.646
12.928	82.170
12.928	87.010
12.928	91.849
12.928	101.528
12.928	105.762
12.983	80.658
13.978	101.217
14.088	112.105
14.088	109.383
14.088	97.587
14.088	95.167
14.088	93.957
14.088	89.420
14.088	85.489
14.807	87.903
14.972	119.660
14.972	83.062
15.856	115.418
15.967	96.968
15.967	102.412
15.967	103.924
15.967	107.251
15.967	109.671
16.961	124.786
17.017	118.434
17.017	116.317
17.072	127.205
17.072	110.872
17.072	109.663
17.072	99.379
18.895	114.488
18.895	125.377
18.895	138.987
18.950	131.728
19.006	110.858
19.061	107.228
19.945	128.998
20.000	143.213
20.055	122.041
20.055	118.109
20.110	111.454
20.110	103.893
20.939	97.535
21.050	148.347
21.050	96.022
21.105	99.349
22.044	139.871
22.155	98.433
22.265	112.648
22.928	143.494
22.928	137.444
22.928	134.420
22.983	145.005
22.983	132.605
22.983	124.136
23.094	127.764
23.867	129.271
23.867	135.623
23.867	137.437
23.867	141.067
23.923	118.684
23.923	124.431
23.978	126.850
24.972	139.849
25.028	137.428
25.138	130.471
27.017	128.340
27.072	141.043
27.072	138.320
27.072	133.784
27.127	142.857
27.127	131.363
27.182	144.974
27.901	125.308
28.011	131.054
28.011	134.079
28.066	135.288
28.066	142.850
28.066	148.294
29.061	105.640
30.000	144.650
31.105	138.592
31.989	134.654
31.989	139.796
32.044	144.030
32.155	131.325
32.210	128.905
32.873	115.290
33.039	110.449
33.978	128.892
34.088	119.213
34.972	119.508
34.972	124.348
36.022	137.043
36.077	119.802
36.961	130.684
37.017	125.240
38.066	132.491
39.171	137.322
39.171	134.599
40.110	136.105
41.050	120.067
41.050	127.931
42.099	122.177];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Pich2002';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tp = 5;
weights.Wwb = 5;
weights.Wwi = 5;
weights.Ri = 5;
weights.ab = 5;

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
D1 = 'Feeding is reduced just before fledge';
D2 = 'Males are assumed not to differ from females';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '52YVV'; % Cat of Life
metaData.links.id_ITIS = '554941'; % ITIS
metaData.links.id_EoL = '1048607'; % Ency of Life
metaData.links.id_Wiki = 'Streptoprocne_biscutata'; % Wikipedia
metaData.links.id_ADW = 'Streptoprocne_biscutata'; % ADW
metaData.links.id_Taxo = '107789'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5267D127E07E665E'; % avibase
metaData.links.id_birdlife = 'biscutate-swift-streptoprocne-biscutata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Streptoprocne_biscutata}}';
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
bibkey = 'Pich2002'; type = 'Article'; bib = [ ... 'doi = {10.1111/j.1469-7998.1996.tb05491.x}, ' ...
'author = {Mauro Pichorim}, ' ... 
'year = {2002}, ' ...
'title = {The breeding biology of the Biscutate-Swift (\emph{Streptoprocne biscutata}) in southern {B}razil}, ' ...
'journal = {Ornitologia Neotropical}, ' ...
'volume = {13}, ' ...
'pages = {61–84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=5267D127E07E665E&sec=lifehistory}}';
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


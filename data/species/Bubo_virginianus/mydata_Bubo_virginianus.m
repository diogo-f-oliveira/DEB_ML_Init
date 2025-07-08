function [data, auxData, metaData, txtData, weights] = mydata_Bubo_virginianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Bubo_virginianus'; 
metaData.species_en = 'Great horned owl';

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf','Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 27;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp varies between 32 and 34C';
data.tx = 46;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HoffSetz1947';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Body temp from ChapDies1984';
data.tp = 138;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Body temp from ChapDies1984';
data.tR = 730;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 29*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 34.7;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 1608;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 1224;    units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';

data.Ri  = 3/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.260	43.063
1.210	49.907
2.333	55.009
3.286	82.605
4.410	104.999
5.277	141.249
6.229	172.303
8.305	217.106
9.347	284.470
10.560	337.985
11.685	365.568
12.551	401.817
13.590	432.865
14.719	512.327
15.668	501.879
16.538	581.361
17.577	617.596
18.529	641.734
19.654	671.046
20.351	747.083
21.646	743.524
22.513	779.774
23.464	795.264
24.502	812.478
25.628	857.354
26.585	954.122
27.534	938.485
28.487	979.916
29.522	953.896
30.561	990.132
31.685	1002.151
32.463	1017.655
34.454	1072.841
35.232	1079.698
36.441	1083.064
37.476	1062.232
38.512	1056.965
39.637	1077.630
40.589	1101.768
42.487	1079.141
43.613	1118.828];  
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40.2);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'HoffSetz1947';
comment.tW1 = 'Data for owl 1';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
2.335	70.573
3.371	75.681
4.324	103.277
5.276	139.519
6.314	153.274
8.305	210.189
9.432	268.899
10.559	325.880
11.598	353.470
12.551	394.900
13.504	434.601
14.459	496.784
15.495	491.516
16.189	532.966
17.572	546.695
18.612	593.306
19.479	643.390
20.608	719.394
21.815	688.173
22.597	755.557
23.463	784.888
24.673	788.254
25.369	859.103
25.630	881.564
26.580	881.491
27.445	902.176
28.483	919.390
29.690	898.545
30.561	991.862
31.511	986.601
32.463	1015.926
34.454	1067.653
35.231	1065.864
36.529	1096.892
37.652	1098.535
38.341	1077.730
39.468	1127.794
40.502	1103.504
42.404	1124.109
43.271	1162.088
45.255	1134.266];  
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(40.2);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'HoffSetz1947';
comment.tW2 = 'Data for owl 2';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
7.005	156.680
8.997	232.617
12.720	343.007
14.192	399.962
19.562	596.692
21.382	681.289
23.285	715.729
26.224	750.090
28.217	824.298
30.123	907.159
33.232	905.190
35.135	939.630
37.122	948.124
39.108	941.054
45.418	1001.096];  
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(40.2);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'HoffSetz1947';
comment.tW3 = 'Data for owl 3';
%
data.tW4 = [ ... % time since birth (d), wet weight (g)
0.346	41.327
1.642	49.874
2.506	56.725
3.545	84.314
4.410	99.812
6.485	132.509
7.179	168.772
8.304	198.084
9.517	249.870
10.641	260.160
11.679	291.208
12.547	344.750
13.411	342.954
14.451	396.483
15.404	430.997
16.701	448.190
17.654	493.079
18.608	541.427
19.817	532.688
20.770	579.306
21.638	629.390
22.588	631.046
23.801	684.562
24.752	698.323
25.530	710.369
26.913	718.909
27.434	758.643
28.297	749.930
29.507	761.943
30.546	794.720
32.533	801.485
33.659	842.902
34.525	870.504
35.389	865.250
36.511	863.434
37.291	889.314
38.414	896.145
41.351	908.025
43.686	937.244];  
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(40.2);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'HoffSetz1947';
comment.tW4 = 'Data for owl 4';

%% set weights for all real data
weights = setweights(data, []);

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
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'Data for owl 1, 2, 3, 4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'NKTR'; % Cat of Life
metaData.links.id_ITIS = '177884'; % ITIS
metaData.links.id_EoL = '45510728'; % Ency of Life
metaData.links.id_Wiki = 'Bubo_virginianus'; % Wikipedia
metaData.links.id_ADW = 'Bubo_virginianus'; % ADW
metaData.links.id_Taxo = '54659'; % Taxonomicon
metaData.links.id_WoRMS = '1484319'; % WoRMS
metaData.links.id_avibase = 'FC366114BD3B51A0'; % avibase
metaData.links.id_birdlife = 'great-horned-owl-bubo-virginianus'; % birdlife
metaData.links.id_AnAge = 'Bubo_virginianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bubo_virginianus}}';
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
bibkey = 'HoffSetz1947'; type = 'Techreport'; bib = [ ... 
'author = {D. F. Hoffmeister and H. W. Setzer}, ' ... 
'howpublished = {\url{http://gutenberg.polytechnic.edu.na/3/5/1/1/35118/35118-h/35118-h.htm}}, ' ...
'year = {1945}, ' ...
'title = {THE POSTNATAL DEVELOPMENT OF TWO BROODS OF GREAT HORNED OWLS}, ' ...
'institution = {Univ. Kansas, Lawrence}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bubo_virginianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChapDies1984'; type = 'Article'; bib = [ ... 
'author = {Chaplin, S. B. and diesel, D. A. and Kasparie, J. A.}, ' ... 
'year = {1984}, ' ...
'title = {Body temperature regulation in red-tailed hawks and great horned owls: Responses to air temperature and food deprivation}, ' ...
'journal = {The Condor}, ' ...
'volume = {86}, ' ...
'pages = {175--181}'];
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


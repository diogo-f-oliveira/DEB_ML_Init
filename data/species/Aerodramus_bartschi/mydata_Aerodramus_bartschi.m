function [data, auxData, metaData, txtData, weights] = mydata_Aerodramus_bartschi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Aerodramus_bartschi'; 
metaData.species_en = 'Mariana swiftlet'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2022 09 02];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 23;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ReicColl2007';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 46.8;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ReicColl2007';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 140.4;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7702;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Apus apus';
  
data.Wwb = 1.11;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ReicColl2007';
data.Wwi = 8.21;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ReicColl2007';
  comment.Wwi = 'asymptotic weight of nesting. Mean adult weight 8.01 g';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ReicColl2007';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per clutch, 1  clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...  % weight (g) at age (d)
0.983	1.491
1.040	1.103
1.041	1.287
1.156	0.940
1.850	1.777
1.908	1.593
1.909	1.981
1.965	1.083
1.966	1.165
1.967	1.430
2.948	2.186
3.006	1.594
3.007	1.696
3.008	1.860
3.009	2.003
3.931	3.064
3.986	2.146
3.987	2.248
3.988	2.391
3.989	2.575
4.913	2.412
5.838	3.331
5.896	2.842
5.953	3.209
5.954	3.046
6.820	3.842
6.821	3.924
6.822	4.373
6.879	3.128
6.936	2.985
6.937	3.496
6.938	3.638
7.803	3.272
7.918	4.109
7.919	3.864
8.035	4.007
8.844	4.048
8.960	4.885
9.769	5.437
9.827	4.641
9.828	5.233
9.883	4.294
9.884	4.845
9.885	5.029
10.808	5.744
10.809	4.805
10.867	6.458
11.850	6.030
11.851	5.867
11.908	6.847
11.909	5.602
12.947	6.113
12.948	6.194
12.949	6.419
13.006	5.113
13.007	6.051
13.815	6.930
13.931	6.420
14.971	6.829
14.972	6.482
15.029	7.012
15.954	6.238
15.955	6.931
16.011	5.952
16.012	6.401
16.013	6.666
16.014	7.136
16.127	8.319
16.936	7.361
16.937	7.218
16.994	7.014
16.995	6.810
16.996	6.422
17.052	6.912
17.861	8.280
17.919	8.035
17.977	7.913
18.035	7.341
18.036	7.688
18.844	7.383
18.902	8.546
18.903	7.648
18.960	8.424
18.961	8.077
18.962	7.118
19.942	7.792
20.173	8.608
20.809	8.711
20.867	8.201
20.868	8.364
20.925	7.548
20.926	7.935
21.965	7.630
22.023	8.385
22.946	7.570
22.947	8.468
22.948	8.631
23.815	8.632
23.871	9.591
23.872	8.958
23.873	8.448
23.874	8.203
23.875	8.060
23.876	7.795
24.104	8.305
25.896	8.858
25.897	8.715
26.821	9.002
26.879	8.879
26.936	7.655
26.994	8.471
27.803	8.962
27.918	8.023
27.919	8.655
28.960	8.697
29.711	9.045
29.769	9.208
29.884	8.147
29.885	8.433
29.886	8.678
30.924	7.862
30.925	8.066
31.908	8.169
31.965	8.598
32.717	8.353
32.832	8.557
32.833	8.986
32.890	8.129
32.891	8.231
34.798	9.151
34.913	8.069
36.821	8.887
36.994	9.051
40.058	9.706
40.925	8.482
40.983	7.340
41.965	8.973
47.052	8.140];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ReicColl2007';
  
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

%% Links
metaData.links.id_CoL = '64Z4N'; % Cat of Life
metaData.links.id_ITIS = '554964'; % ITIS
metaData.links.id_EoL = '45510761'; % Ency of Life
metaData.links.id_Wiki = 'Aerodramus_bartschi'; % Wikipedia
metaData.links.id_ADW = 'Aerodramus_bartschi'; % ADW
metaData.links.id_Taxo = '72163'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'F8E58F0F524E897C'; % avibase
metaData.links.id_birdlife = 'mariana-swiftlet-aerodramus-bartschi'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aerodramus_bartschi}}';
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
bibkey = 'ReicColl2007'; type = 'Article'; bib = [ ... 
'author = {James D. Reichel and Charles T. Collins and Derek W. Stinson and Vicente A. Camacho}, ' ... 
'year = {2007}, ' ...
'title = {Growth and Development of the Mariana Swiftlet}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {119(4)}, ' ...
'pages = {686-692}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F8E58F0F524E897C&sec=lifehistory}}';
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


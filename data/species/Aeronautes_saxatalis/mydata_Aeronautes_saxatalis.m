function [data, auxData, metaData, txtData, weights] = mydata_Aeronautes_saxatalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Aeronautes_saxatalis'; 
metaData.species_en = 'White-throated swift'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 28];              
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

data.ab = 24;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Coll2010';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 126;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.1;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 1.7;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tW data';
data.Wwi = 45;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Coll2010';

data.Ri  = 4.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-7 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW1 = [ ...  % weight (g) at age (d)
0.429	2.850
1.526	4.678
2.622	8.101
3.623	12.093
4.767	12.897
5.673	19.394
6.674	21.222
7.723	20.430
8.724	26.130
9.773	26.364
10.822	27.053
11.823	29.565
13.921	33.107
15.971	33.232
16.972	34.946
17.926	37.571
18.974	35.185
19.976	39.291
20.881	41.232
22.121	41.581
22.979	46.141
24.076	38.630
25.172	40.800
26.221	39.781
27.222	39.673
28.176	43.892
29.177	32.508
30.226	40.942
31.322	43.568
32.419	34.349
33.467	43.694
34.278	44.610
35.470	37.782
36.376	42.571
37.424	39.730
38.426	37.799
39.522	45.436
40.619	45.898
41.572	44.878];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW1    = C2K(38.1);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Coll2010';
%
data.tW2 = [ ...  % weight (g) at age (d)
0.477	2.850
1.526	4.109
2.479	6.961
3.576	9.473
4.529	11.187
5.626	13.471
6.674	15.071
7.628	19.518
8.724	21.802
9.678	24.769
10.822	25.459
11.728	29.336
12.777	29.798
13.730	31.967
14.970	28.443
15.780	31.409
16.829	27.428
17.830	35.976
19.022	31.996
19.833	33.937
20.977	37.360
22.026	37.594
22.931	40.560
24.171	32.594
25.172	37.270
26.221	36.706
27.079	38.078
28.128	41.045
29.367	32.737
30.273	31.945
31.322	33.773
32.276	32.412
33.324	40.048
34.278	40.054
35.422	32.885
36.328	30.954
37.424	35.857
38.473	34.155
39.474	44.069
40.571	37.925
41.620	32.008];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW2    = C2K(38.1);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Coll2010';
%
data.tW3 = [ ...  % weight (g) at age (d)
0.477	2.053
1.621	3.084
2.574	5.823
3.671	6.740
4.624	9.137
5.721	9.257
6.770	11.655
7.819	19.292
8.867	20.550
9.678	23.972
10.727	21.927
11.823	28.881
15.971	29.132
16.924	19.342
17.878	23.676
18.974	27.668
20.023	27.104
20.929	31.437
22.026	28.710
23.074	34.297
24.266	27.811
25.315	27.817
26.126	30.555
27.127	36.255
28.223	39.223
29.272	31.939
30.321	22.606
31.417	28.421
32.371	30.590
33.372	34.696
34.326	38.346
35.279	27.986
36.423	26.512
37.472	32.441
38.521	30.852
39.522	41.905
40.619	28.699
41.715	29.389];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'ind 3'};  
temp.tW3    = C2K(38.1);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Coll2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;

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
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for ind 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '64ZXP'; % Cat of Life
metaData.links.id_ITIS = '178014'; % ITIS
metaData.links.id_EoL = '45510769'; % Ency of Life
metaData.links.id_Wiki = 'Aeronautes_saxatalis'; % Wikipedia
metaData.links.id_ADW = 'Aeronautes_saxatalis'; % ADW
metaData.links.id_Taxo = '107842'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B401C2DDB3ED732D'; % avibase
metaData.links.id_birdlife = 'white-throated-swift-aeronautes-saxatalis'; % birdlife
metaData.links.id_AnAge = 'Aeronautes_saxatalis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aeronautes_saxatalis}}';
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
bibkey = 'Coll2010'; type = 'Article'; bib = [ ... 
'author = {Charles T. Collins}, ' ... 
'year = {2010}, ' ...
'title = {Notes on the Breeding Biology of the White-Throated Swift in {S}outhern {C}alifornia}, ' ...
'journal = {Bull. Southern California Acad. Sci.}, ' ...
'volume = {109(2)}, ' ...
'pages = {23–36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B401C2DDB3ED732D&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Aeronautes_saxatalis}}';
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


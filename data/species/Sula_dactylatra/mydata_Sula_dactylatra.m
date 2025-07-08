function [data, auxData, metaData, txtData, weights] = mydata_Sula_dactylatra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Sulidae';
metaData.species    = 'Sula_dactylatra'; 
metaData.species_en = 'Masked booby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 43;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Body temp from ShalWhit1973 as target, but varies considerably';
data.tx = 131; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Dorw1962';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for S. sula, 91 till > 139 d';
data.tp = 393; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for S. sula, 91 till > 139 d';
data.tR = 1461;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for S. sula, 2-3 yr';
data.am = 25.5*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 42; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dorw1962';
data.Wwi = 2000; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Dorw1962';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAge: 1 clutch/yr';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.023	42.629
1.039	40.937
1.060	38.785
1.638	52.917
2.227	70.275
2.415	43.220
3.488	54.753
3.962	97.866
4.791	69.837
5.521	117.472
5.924	138.148
6.089	90.286
6.869	133.586
7.168	112.844
8.685	150.902
9.094	175.082
10.426	207.329
11.651	177.550
12.532	201.887
13.650	228.026
14.929	309.062
15.845	321.897
15.861	309.118
16.147	270.085
16.468	391.567
17.777	492.737
17.942	322.027
18.300	424.764
18.612	346.900
19.420	476.531
19.941	413.576
21.255	513.453
21.697	545.668
23.469	691.366
23.979	616.455
24.463	588.052
26.036	682.431
28.049	847.348
29.028	750.519
29.213	847.538
31.969	938.372
33.094	1038.615
34.696	1119.037
38.577	1371.321
43.257	1300.387
44.900	1257.618
46.274	1336.764
48.326	1499.948
48.850	1293.031
54.377	1522.117
59.457	1708.925
76.458	1726.155
78.525	1859.982
81.323	1848.463
82.501	1787.507
83.694	1659.939
89.685	1967.443
91.585	1790.642
97.437	1664.345
107.215	1690.158
113.316	1508.651
116.823	1459.557
119.133	1530.879
127.522	1523.040
127.540	1452.735
130.073	1565.505
131.481	1524.204];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Dorw1962';
comment.tW = 'Data from Ascension Island';
  
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
D2 = 'Body temerature is guessed';
D3 = 'Long tp cannot be captured by std model';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '7B4FR'; % Cat of Life
metaData.links.id_ITIS = '174699'; % ITIS
metaData.links.id_EoL = '45509069'; % Ency of Life
metaData.links.id_Wiki = 'Sula_dactylatra'; % Wikipedia
metaData.links.id_ADW = 'Sula_dactylatra'; % ADW
metaData.links.id_Taxo = '51661'; % Taxonomicon
metaData.links.id_WoRMS = '212599'; % WoRMS
metaData.links.id_avibase = '22D1B4A2F0911712'; % avibase
metaData.links.id_birdlife = 'masked-booby-sula-dactylatra'; % birdlife
metaData.links.id_AnAge = 'Sula_dactylatra'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sula_dactylatra}}';
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
bibkey = 'Dorw1962'; type = 'Article'; bib = [ ... 
'author = {D. F. Dorwad}, ' ... 
'doi = {10.1111/j.1474-919X.1962.tb07244.x}, ' ...
'year = {1962}, ' ...
'title = {COMPARATIVE BIOLOGY OF THE WHITE BOOBY AND THE BROWN BOOBY \emph{Sula} SPP. AT {A}SCENSION}, ' ...
'journal = {Ibis}, ' ...
'volume = {103B}, ' ...
'pages = {174--220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sula_dactylatra}}';
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


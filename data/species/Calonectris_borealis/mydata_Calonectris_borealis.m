function [data, auxData, metaData, txtData, weights] = mydata_Calonectris_borealis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Calonectris_borealis'; 
metaData.species_en = 'Cory''s shearwater';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm', 'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCim'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 55;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RamoMoni2003';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55 to 65 d';
data.tx = 99; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RamoMoni2003';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 297; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24.8*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 70; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RamoMoni2003';
data.Wwi = 1300; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'RamoMoni2003';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. AnAge 535 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.692	69.526
2.098	79.859
3.034	95.329
4.088	108.227
4.671	133.985
5.607	146.880
6.191	164.915
7.008	188.104
7.826	211.294
8.761	229.338
9.814	252.533
10.513	278.294
11.799	309.218
12.732	337.559
13.785	360.754
14.953	391.675
15.654	409.713
16.819	458.654
17.754	479.272
18.569	512.758
19.743	512.789
20.679	528.258
21.615	548.876
21.728	569.473
22.547	582.366
23.603	587.541
24.657	600.440
25.824	639.084
26.876	662.279
27.809	693.194
28.626	718.958
29.917	721.565
30.853	734.461
31.558	734.479
32.024	749.936
32.843	765.403
33.778	788.595
35.185	793.780
35.654	798.941
36.591	806.688
37.644	827.309
38.586	811.887
39.875	822.218
40.809	847.984
41.981	858.311
42.684	868.627
43.856	876.380
45.146	878.987
45.848	891.876
46.899	922.795
47.362	961.420
48.647	994.919
49.697	1028.411
50.754	1023.290
51.580	1002.717
52.751	1013.044
53.925	1013.074
54.631	1005.370
55.687	1002.823
56.742	1010.573
57.795	1033.768
58.963	1062.115
59.791	1026.097
60.730	1026.121
61.902	1036.448
62.840	1044.195
63.659	1054.513
64.713	1069.986
65.883	1088.036
67.058	1082.917
67.998	1075.219
68.703	1075.237
69.401	1106.146
70.574	1111.325
71.632	1101.055
73.280	1075.355
74.334	1085.679
75.871	1029.085
76.574	1031.677
77.627	1049.724
78.798	1065.200
79.737	1067.798
80.674	1075.545
81.617	1054.975
82.909	1052.434
83.850	1039.587
84.672	1037.034
85.498	1013.887
86.793	990.752
87.615	990.773
88.441	962.478
89.616	954.785
90.559	931.641
91.503	908.497
92.443	898.224
93.620	880.235
94.679	867.391
95.739	846.824
96.682	826.254
97.622	818.556
98.815	710.468];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'RamoMoni2003';
  
%% set weights for all real data
weights = setweights(data, []);weights.tp = 0.1;
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
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5G57F'; % Cat of Life
metaData.links.id_ITIS = '203448'; % ITIS
metaData.links.id_EoL = '45511301'; % Ency of Life
metaData.links.id_Wiki = 'Calonectris_borealis'; % Wikipedia
metaData.links.id_ADW = 'Calonectris_borealis'; % ADW
metaData.links.id_Taxo = '4458756'; % Taxonomicon
metaData.links.id_WoRMS = '1348497'; % WoRMS
metaData.links.id_avibase = '710BB4E6D1B2E7FF'; % Avibase
metaData.links.id_birdlife = 'corys-shearwater-calonectris-borealis'; % Birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calonectris_borealis}}';
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
bibkey = 'RamoMoni2003'; type = 'Article'; bib = [ ... 
'author = {J. A. Ramos and Z. Moniz and E. Sol\''{a} nd L. R. Monteiro}, ' ... 
'doi = {10.1071/mu9900180}, ' ...
'year = {2003}, ' ...
'title = {Reproductive measures and chick provisioning of {C}ory''s Shearwater \emph{Calonectris diomedea borealis} in the {A}zores}, ' ...
'journal = {Bird Study }, ' ...
'volume = {50}, ' ...
'pages = {47-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calonectris_diomedea}}';
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


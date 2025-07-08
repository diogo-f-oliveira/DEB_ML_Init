function [data, auxData, metaData, txtData, weights] = mydata_Oreophasis_derbianus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Cracidae';
metaData.species    = 'Oreophasis_derbianus'; 
metaData.species_en = 'Horned guan'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 35;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HoyoKirw2020';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature'; comment.ab = '34-36 days';
data.tx = mean([3;6]);          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature'; comment.tx = 'chicks leave nest at 3-6 days';
data.tp = 365;          units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'HoyoKirw2020';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature'; comment.tp = 'about the time bird reaches adult size.';
  comment.tp = 'based on the stylized empirical relationship between tx and tp for species for which both data were available';
data.tR = 4*365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'HoyoKirw2020';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Gonz1995';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max reproductive age';
data.Wwb = 107.7;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Corn2009';
data.Wwi = 1940;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'Corn2009';
data.Wwim = 2212;      units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'Corn2009';
data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'Corn2009';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.729	96.873
3.655	87.176
10.087	140.424
10.098	111.355
17.462	135.526
21.142	154.880
22.969	198.471
29.430	174.199
33.101	217.778
34.000	280.756
38.597	309.792
38.617	256.498
45.064	270.986
47.807	329.106
48.700	406.619
52.396	382.367
56.031	522.845
56.990	421.094
57.898	459.847
63.426	464.652
65.234	561.538
68.940	508.217
69.816	634.179
74.460	537.247
76.248	687.428
77.207	585.676
83.639	638.924
90.066	706.707
90.077	677.638
90.959	784.221
97.358	929.523
99.248	803.540
106.637	759.882
107.514	881.000
112.991	1026.309
113.027	929.410
114.870	929.397
115.781	958.460
116.678	1026.283
124.938	1123.122
124.950	1089.208
135.128	982.545
136.947	1050.361
143.347	1190.819
153.471	1229.506
153.489	1181.056
158.019	1394.201
163.542	1413.541
171.837	1413.481
174.615	1379.547
177.359	1437.666
179.181	1495.793
183.841	1355.255
190.198	1611.992
195.746	1563.503
195.766	1510.208
201.318	1452.028
211.449	1471.335
215.072	1645.727
219.687	1626.314
224.291	1640.816
226.123	1669.872
231.666	1635.918
236.207	1819.993
239.050	1606.795
251.006	1679.383
251.020	1640.623
261.121	1742.294
268.509	1703.481
272.207	1674.385
286.009	1737.269
286.902	1814.782
294.253	1877.714
296.118	1819.561
298.935	1679.037
317.361	1698.283
327.498	1703.055
331.133	1843.533
333.936	1741.768
355.087	1872.430
363.424	1760.935
382.783	1751.106
386.432	1852.823
389.176	1910.943
391.057	1809.185
399.336	1852.730
401.206	1780.042
402.078	1915.695
424.199	1915.535
426.943	1973.655
437.117	1876.682
463.839	1895.869
468.405	2012.115
489.672	1827.853
489.695	1764.869
506.229	1919.788
507.131	1973.076
526.435	2113.440
529.247	1987.451
547.731	1851.659
553.236	1919.448
566.142	1914.510
590.056	2049.997
600.264	1860.969
613.145	1923.861
661.099	1855.685];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Corn2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.ab = 3 * weights.ab;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '74TWS'; % Cat of Life
metaData.links.id_ITIS = '175753'; % ITIS
metaData.links.id_EoL = '45508956'; % Ency of Life
metaData.links.id_Wiki = 'Oreophasis_derbianus'; % Wikipedia
metaData.links.id_ADW = 'Oreophasis_derbianus'; % ADW
metaData.links.id_Taxo = '52896'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '9584A5CAEB0ECF19'; % avibase
metaData.links.id_birdlife = 'horned-guan-oreophasis-derbianus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreophasis_derbianus}}';
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
bibkey = 'Corn2009'; type = 'Article'; bib = [ ... 
'author = {J. Cornejo}, ' ... 
'year = {2009}, ' ...
'title = {Breeding programme for Horned guan \emph{Oreophasis derbianus} at {Africam Safari, Mexico}}, ' ...
'doi = {10.1111/j.1748-1090.2008.00070.x}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {43}, ' ...
'pages = {136-148}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gonz1995'; type = 'Article'; bib = [ ... 
'author = {F. Gonzalez-Garcia}, ' ... 
'year = {1995}, ' ...
'title = {EPRODUCTIVE BIOLOGY AND VOCALIZATIONS OF THE HORNED GUAN \emph{Oreophasis derbianus} IN {M}EXICO}, ' ...
'journal = {The Condor}, ' ...
'volume = {97}, ' ...
'pages = {415-426}']; 
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
bibkey = 'HoyoKirw2020'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {del Hoyo, J. and G. M. Kirwan}, ' ...
'year = {2020}, ' ...
'title  = {Horned Guan (\emph{Oreophasis derbianus}), version 1.0.}, ' ...
'booktitle = {Birds of the World }, ' ...
'publisher = {Cornell Lab of Ornithology}, ' ...
'address = {Ithaca, NY, USA}, ' ...
'doi = {https://doi.org/10.2173/bow.horgua1.01}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

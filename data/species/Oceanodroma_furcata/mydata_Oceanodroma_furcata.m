function [data, auxData, metaData, txtData, weights] = mydata_Oceanodroma_furcata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Hydrobatidae';
metaData.species    = 'Oceanodroma_furcata'; 
metaData.species_en = 'Fork-tailed storm petrel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 49.8;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BoerWhee1980';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '37 to 68 d';
data.tx = 65; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BoerWhee1980';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '61 to 66 d';
data.tp = 195; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '61 to 66 d';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9.0; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BoerWhee1980';
data.Wwi = 95; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BoerWhee1980';
  comment.Wwi = 'asymptotic weight for nestling; mean adult weight 45.2 g (AnAge)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.017	9.293
0.480	9.618
0.976	10.595
1.301	14.181
1.304	12.387
1.472	11.409
1.966	13.201
2.628	14.504
3.122	16.459
3.123	15.644
3.780	19.067
3.955	14.501
4.448	16.619
5.106	20.042
5.108	18.900
6.430	21.669
6.431	20.854
6.923	23.787
7.257	22.971
7.258	21.993
8.245	26.882
8.252	23.132
9.403	28.184
9.575	24.923
10.395	30.138
10.401	26.877
11.393	28.505
11.712	35.515
12.385	30.623
13.037	36.491
13.532	38.120
13.705	34.369
14.033	35.999
14.526	38.933
15.679	43.332
16.185	38.603
16.337	46.102
17.012	39.905
17.339	42.350
17.662	47.241
18.170	41.696
18.813	52.945
19.809	52.290
19.968	56.203
20.318	46.419
20.971	51.635
21.283	62.721
21.804	49.677
21.951	59.948
22.777	62.066
22.966	49.674
23.125	53.098
24.116	55.541
24.433	63.529
24.449	54.725
24.948	54.235
25.257	66.299
25.603	58.472
26.088	65.319
27.403	71.838
27.432	56.185
28.245	65.151
28.589	58.791
28.901	69.225
29.084	60.258
30.056	72.484
30.245	60.255
31.550	71.828
31.737	60.414
31.899	62.860
32.713	71.010
33.234	58.291
33.865	75.899
33.869	73.616
34.721	61.549
35.529	73.123
35.549	62.362
36.342	82.252
36.705	64.968
37.343	79.151
38.366	63.986
38.868	61.539
39.160	83.060
39.330	80.777
39.687	66.918
40.177	71.156
40.487	82.894
41.498	74.413
42.001	71.477
42.143	84.521
42.486	78.487
43.485	76.365
43.668	66.908
44.306	80.929
44.982	74.405
45.134	81.742
45.486	70.817
46.131	80.761
46.789	83.858
47.799	75.703
48.633	73.256
49.444	83.525
49.799	70.481
50.621	74.555
50.935	84.500
50.949	76.837
51.467	65.586
52.746	91.507
53.745	89.548
54.744	87.426
55.920	79.434
57.427	71.768
58.265	67.037];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BoerWhee1980';
  
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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '48C44'; % Cat of Life
metaData.links.id_ITIS = '174625'; % ITIS
metaData.links.id_EoL = '45509022'; % Ency of Life
metaData.links.id_Wiki = 'Oceanodroma_furcata'; % Wikipedia
metaData.links.id_ADW = 'Oceanodroma_furcata'; % ADW
metaData.links.id_Taxo = '51615'; % Taxonomicon
metaData.links.id_WoRMS = '343962'; % WoRMS
metaData.links.id_avibase = 'DD814006A4A3863F'; % avibase
metaData.links.id_birdlife = 'fork-tailed-storm-petrel-hydrobates-furcatus'; % birdlife
metaData.links.id_AnAge = 'Oceanodroma_furcata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oceanodroma_furcata}}';
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
bibkey = 'BoerWhee1980'; type = 'Article'; bib = [ ... 
'author = {P. D. Boersma and N. T. Wheelwright and M. K. Nerini and E. S. Wheelwright}, ' ... 
'year = {1980}, ' ...
'title = {THE BREEDING BIOLOGY OF THE FORK-TAILED STORM-PETREL (\emph{Oceanodroma furcata}) }, ' ...
'journal = {The Auk}, ' ...
'volume = {97}, ' ...
'pages = {268--282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Oceanodroma_furcata}}';
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


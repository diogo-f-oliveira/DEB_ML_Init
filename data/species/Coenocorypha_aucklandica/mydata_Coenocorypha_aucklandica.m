function [data, auxData, metaData, txtData, weights] = mydata_Coenocorypha_aucklandica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Coenocorypha_aucklandica'; 
metaData.species_en = 'Subantarctic snipe'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTg', '0iThf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Misk1999';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 54;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'Misk1999';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 162;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 23.5; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 13.6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Misk1999';
data.Wwi = 116;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 101.2; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';
  
data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'GilsWier2020';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.235	18.571
0.239	13.650
0.991	13.647
1.072	16.504
1.320	19.201
2.573	18.402
2.737	23.005
2.738	20.783
3.650	28.557
3.652	26.176
4.156	23.317
4.733	32.362
4.826	21.409
6.986	34.258
7.650	38.859
8.070	35.841
8.909	31.076
8.987	38.060
9.067	42.345
10.071	39.643
10.820	43.132
11.819	46.937
12.067	50.111
12.068	48.206
12.824	43.759
12.983	53.123
12.992	41.853
13.899	55.659
14.411	42.800
14.899	58.354
15.900	59.778
15.901	58.032
15.986	56.603
16.991	53.742
17.067	62.154
18.988	62.147
20.242	60.713
20.897	75.790
21.243	61.186
21.987	70.706
22.909	65.941
23.155	71.337
23.987	75.937
25.238	77.995
25.247	66.566
25.824	76.088
26.988	82.115
26.989	81.163
27.914	73.064
28.083	70.206
28.906	85.282
29.000	72.742
30.005	69.563
30.072	88.770
31.006	70.512
31.906	93.048
31.916	80.350
32.006	73.048
33.826	93.040
34.763	71.767
34.842	76.846
35.912	95.731
36.004	85.571
37.825	104.294
37.926	84.135
39.922	93.016
39.924	90.476
40.011	86.508
40.764	84.600
40.836	98.886
41.757	95.707
41.760	91.898
42.847	90.147
43.603	85.383
44.679	96.966
44.681	93.950
45.684	93.152
46.605	89.974
46.851	95.846
47.600	99.494
48.682	103.299
50.522	100.117
50.687	102.656
51.447	91.701
53.614	97.089
55.527	106.446
55.530	102.637
55.698	101.366
55.700	98.827
56.704	97.077
56.863	106.758
57.541	94.216
57.707	95.644
58.547	90.244
63.462	104.034
67.475	98.780
67.565	90.526
77.571	108.264];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Misk1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5ZJSQ'; % Cat of Life
metaData.links.id_ITIS = '176714'; % ITIS
metaData.links.id_EoL = '1049597'; % Ency of Life
metaData.links.id_Wiki = 'Coenocorypha_aucklandica'; % Wikipedia
metaData.links.id_ADW = 'Coenocorypha_aucklandica'; % ADW
metaData.links.id_Taxo = '53705'; % Taxonomicon
metaData.links.id_WoRMS = '225929'; % WoRMS
metaData.links.id_avibase = '02884D9E57F6B38F'; % avibase
metaData.links.id_birdlife = 'auckland-snipe-coenocorypha-aucklandica'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coenocorypha_aucklandica}}';
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
bibkey = 'Misk1999'; type = 'Article'; bib = [ ...  
'title = {Breeding ecology of {S}nares {I}sland Snipe (\emph{Coenocorypba aucklandica buegeli}) and {C}hatham {I}sland Snipe (\emph{C. pusilla})}, ' ...
'journal = {Notornis}, ' ...
'year = {1999}, ' ...
'author = {C. M. Miskelly}, ' ...
'volume = {46}, ' ...
'pages = {207-221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=02884D9E57F6B38F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GilsWier2020'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.subsni1.01}, ' ...
'author = {Van Gils, J. and P. Wiersma and G. M. Kirwan}, ' ... 
'year = {2020}, ' ...
'title =  {Subantarctic Snipe (\emph{Coenocorypha aucklandica}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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


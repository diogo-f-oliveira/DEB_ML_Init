function [data, auxData, metaData, txtData, weights] = mydata_Pelecanus_erythrorhynchos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Pelecanidae';
metaData.species    = 'Pelecanus_erythrorhynchos'; 
metaData.species_en = 'American white pelican'; 

metaData.ecoCode.climate = {'Csa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TPa', 'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFe'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
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

data.ab = 36;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 88;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DiMaClar2017';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx  = 'temps from AbraEvan1999 for Pelecanus erythrorhynchos';
data.tp = 264;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = 'temps from AbraEvan1999 for Pelecanus erythrorhynchos';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 54*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 110; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 4970;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 6920;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
0.871	142.569
1.017	221.876
1.159	78.962
4.783	458.477
4.921	93.342
4.923	188.580
5.070	331.379
6.665	568.841
7.098	473.431
7.102	727.398
7.673	298.600
8.254	409.480
8.256	552.337
8.550	774.442
9.703	567.635
9.707	773.983
9.855	964.400
9.858	1107.257
9.860	1234.240
9.862	1361.223
9.990	408.791
10.866	837.015
10.867	932.253
10.870	1075.109
10.876	1424.313
11.009	773.467
11.153	725.790
11.451	1233.608
13.904	851.683
14.053	1105.592
14.057	1296.066
14.060	1470.669
14.068	1915.110
16.959	1818.724
16.961	1898.088
16.963	2025.072
16.965	2120.310
16.971	2453.640
16.973	2564.751
16.975	2691.734
17.113	2294.854
17.239	1278.931
20.429	1706.236
20.567	1325.229
20.884	2864.786
21.022	2467.906
21.032	3055.203
21.034	3150.440
21.037	3293.297
21.039	3404.407
21.163	2309.119
21.461	2753.446
21.721	1166.041
21.739	2118.415
21.874	1610.424
21.901	3102.477
22.167	1800.785
22.185	2816.650
22.332	2943.576
22.610	2324.418
23.933	3482.623
23.936	3609.606
23.938	3736.590
24.066	2815.904
24.068	2911.142
24.070	3022.252
24.217	3149.177
24.231	3926.950
24.529	4403.022
25.820	3831.081
25.964	3767.532
26.105	3592.873
26.107	3703.983
26.228	2370.602
26.257	3957.892
26.260	4148.367
26.408	4322.911
26.556	4529.202
38.007	5762.753
38.251	3238.847
38.256	3508.686
38.261	3810.271
38.263	3889.636
38.425	4873.698
40.069	7761.935
43.479	4332.010
88.346	5488.809];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DiMaClar2017';

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6TYWG'; % Cat of Life
metaData.links.id_ITIS = '174684'; % ITIS
metaData.links.id_EoL = '45509059'; % Ency of Life
metaData.links.id_Wiki = 'Pelecanus_erythrorhynchos'; % Wikipedia
metaData.links.id_ADW = 'Pelecanus_erythrorhynchos'; % ADW
metaData.links.id_Taxo = '51645'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '866903B93D70056B'; % avibase
metaData.links.id_birdlife = 'american-white-pelican-pelecanus-erythrorhynchos'; % birdlife
metaData.links.id_AnAge = 'Pelecanus_erythrorhynchos'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelecanus_erythrorhynchos}}';
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
bibkey = 'DiMaClar2017'; type = 'Article'; bib = [ ... 
'doi = {10.1675/063.040.0303}, ' ...
'author = {DiMatteo, J. J. and Clark, M. E.}, ' ... 
'year = {2017}, ' ...
'title = {Growth and Development of {A}merican White Pelican (\emph{Pelecanus erythrorhynchos)} Chicks at {M}arsh {L}ake, Minnesota, {U}{S}{A}}, ' ...
'journal = {Waterbirds}, ' ...
'volume = {40(3)}, ' ...
'pages = {832--841}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=866903B93D70056B&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pelecanus_erythrorhynchos}}';
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


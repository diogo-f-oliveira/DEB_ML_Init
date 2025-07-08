function [data, auxData, metaData, txtData, weights] = mydata_Basileuterus_tristriatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Parulidae';
metaData.species    = 'Basileuterus_tristriatus'; 
metaData.species_en = 'Three-striped warbler'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 15.8;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CoxMart2009';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 10.5;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CoxMart2009';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 31.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.1*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.09;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'CoxMart2009';
data.Wwb = 1.5;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CoxMart2009';
data.Wwi = 11.6;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'CoxMart2009';
 
data.Ri  = 1.96/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'CoxMart2009';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	2.066
0.016	1.718
0.017	1.282
0.034	1.572
0.973	2.911
0.974	2.591
1.009	2.272
1.010	2.039
1.011	1.836
1.984	3.871
1.985	3.494
2.001	4.220
2.002	2.884
2.003	2.652
2.004	2.390
2.018	5.236
2.020	3.174
2.958	5.906
2.994	5.471
2.995	5.238
2.996	4.542
3.028	6.690
3.029	6.226
3.030	4.919
3.031	4.193
3.032	3.874
3.967	8.028
3.968	7.825
3.970	5.473
3.986	7.477
4.005	5.793
4.006	4.805
4.007	4.805
4.020	8.493
4.996	8.844
4.997	8.612
5.013	9.425
5.015	7.886
5.016	6.521
5.017	6.405
5.988	10.879
5.989	10.473
5.990	9.137
6.005	11.402
6.007	9.979
6.026	8.585
6.027	8.353
6.981	11.375
6.999	11.695
7.036	10.243
7.054	9.778
7.974	12.742
7.975	12.103
7.993	11.784
8.011	11.523
8.012	11.261
8.026	13.556
8.969	11.990
8.987	11.903
9.997	13.009
9.998	12.341
10.014	13.967];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'CoxMart2009';

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
D1 = 'Scaled functional response varies in time';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '68CX3'; % Cat of Life
metaData.links.id_ITIS = '558872'; % ITIS
metaData.links.id_EoL = '1052034'; % Ency of Life
metaData.links.id_Wiki = 'Basileuterus_tristriatus'; % Wikipedia
metaData.links.id_ADW = 'Basileuterus_tristriatus'; % ADW
metaData.links.id_Taxo = '87326'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '99E9FFE09BBFD8EE'; % avibase
metaData.links.id_birdlife = 'three-striped-warbler-basileuterus-tristriatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Basileuterus_tristriatus}}';
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
bibkey = 'CoxMart2009'; type = 'article'; bib = [ ...  
'title = {Breeding Biology of the Three-Striped Warbler in {V}enezuela: {A} Contrast between Tropical and Temperate Parulids}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'year = {2009}, ' ...
'author = {W. Andrew Cox and Thomas E. Martin}, ' ...
'volume = {121(4)}, ' ...
'pages = {667-678}'];
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


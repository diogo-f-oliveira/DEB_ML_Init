function [data, auxData, metaData, txtData, weights] = mydata_Calandrella_cinerea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Alaudidae';
metaData.species    = 'Calandrella_cinerea'; 
metaData.species_en = 'Red-capped lark'; 

metaData.ecoCode.climate = {'BWh','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 10;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NditBaka2017';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 30;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.9;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'avibase';
data.Wwb = 2.0;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NditBaka2017';
data.Wwi = 23.1;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 24.1; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2*1.9/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'NditBaka2017';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'avibase gives 4.5 eggs per clutch, 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	2.648
0.001	2.334
0.002	2.056
0.003	2.962
0.004	1.498
0.005	2.787
0.006	3.624
0.007	2.334
0.008	2.509
0.009	2.091
0.010	1.533
0.011	2.892
0.012	3.624
3.000	7.108
3.001	8.223
3.002	8.397
3.003	7.561
3.004	6.446
3.005	6.934
3.006	8.780
3.007	4.913
3.008	7.282
3.009	10.070
3.010	7.003
3.011	7.805
3.012	8.084
3.013	8.467
3.014	9.477
3.015	5.436
3.016	7.491
6.000	12.544
6.001	12.195
6.002	10.592
6.003	13.101
6.004	14.564
6.005	15.505
6.006	18.571
6.007	12.509
6.008	11.429
6.009	11.080
6.010	12.683
6.011	14.495
9.000	16.481
9.001	14.495
9.002	14.983
9.003	20.592
9.004	13.972
9.005	17.003
9.006	15.401
9.007	16.028
9.008	14.495
9.010	12.544
9.011	15.017
9.012	13.519
9.013	17.596
9.014	18.118
9.015	19.059];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'NditBaka2017';
comment.tW = 'Data from Kedong';

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
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5X6BB'; % Cat of Life
metaData.links.id_ITIS = '558982'; % ITIS
metaData.links.id_EoL = '45515359'; % Ency of Life
metaData.links.id_Wiki = 'Calandrella_cinerea'; % Wikipedia
metaData.links.id_ADW = 'Calandrella_cinerea'; % ADW
metaData.links.id_Taxo = '289959'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'FCDA4F09DBE8C52F'; % avibase
metaData.links.id_birdlife = 'red-capped-lark-calandrella-cinerea'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calandrella_cinerea}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=FCDA4F09DBE8C52F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NditBaka2017'; type = 'Article'; bib = [ ... 
'doi = {10.1186/s12983-017-0213-1}, ' ...
'author = {Henry K. Ndithia and Samuel N. Bakari and Kevin D. Matson and Muchane Muchai and B. Irene Tieleman}, ' ... 
'year = {2017}, ' ...
'title = {Geographical and temporal variation in environmental conditions affects nestling growth but not immune function in a year-round breeding equatorial lark}, ' ...
'journal = {Frontiers in Zoology}, ' ...
'volume = {14:28}, ' ...
'pages = {1-14}'];
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


function [data, auxData, metaData, txtData, weights] = mydata_Pterocles_namaqua
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pterocliformes'; 
metaData.family     = 'Pteroclidae';
metaData.species    = 'Pterocles_namaqua'; 
metaData.species_en = 'Namaqua sandgrouse'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 11 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 16;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 21;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 63;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(41.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 12.5;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 11.6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'LloyDurr2000';
data.Wwi = 172; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'avibase';
data.Wwim = 180; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'avibase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Harr1975';   
temp.Ri = C2K(41.4);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ % time  (d), weight (g)
0.773	11.649
2.900	17.025
6.058	28.674
7.991	33.602
9.925	44.803
12.052	60.036
13.985	65.860
16.047	68.100
17.014	75.717
17.981	83.781
19.076	84.677
20.172	89.606
20.945	93.638
22.041	99.462
23.008	95.878
23.974	107.975
26.037	113.351
28.034	129.032
30.161	136.649
30.934	142.025
36.026	153.226
41.955	181.900
52.911	213.710]; 
units.tW  = {'d', 'g'};  label.tW = {'time', 'weight', 'female'};  
temp.tW  = C2K(41.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LloyDurr2000';
comment.tW = 'Means of 6 chicks, reared in captivity';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = 0;

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
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4PW54'; % Cat of Life
metaData.links.id_ITIS = '177054'; % ITIS
metaData.links.id_EoL = '45513971'; % Ency of Life
metaData.links.id_Wiki = 'Pterocles_namaqua'; % Wikipedia
metaData.links.id_ADW = 'Pterocles_namaqua'; % ADW
metaData.links.id_Taxo = '53944'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'AAEF597A847E037E'; % avibase
metaData.links.id_birdlife = 'namaqua-sandgrouse-pterocles-namaqua'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterocles_namaqua}}';
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
bibkey = 'LloyDurr2000'; type = 'Article'; bib = [ ... 
'author = {Penn Lloyd and Lesley Durrans and Rob Gous and Robin M. Little and Timothy M. Crow}, ' ... 
'year = {2000}, ' ...
'title = {The diet and nutrition of the {N}amaqua sandgrouse, an arid-zone granivore}, ' ...
'journal = {Journal of Arid Environments}, ' ...
'volume = {44}, ' ...
'pages = {105–122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterocles_namaqua}}';
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


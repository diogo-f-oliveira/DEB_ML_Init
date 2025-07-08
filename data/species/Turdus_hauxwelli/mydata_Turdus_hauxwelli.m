function [data, auxData, metaData, txtData, weights] = mydata_Turdus_hauxwelli
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Turdidae';
metaData.species    = 'Turdus_hauxwelli'; 
metaData.species_en = 'Hauxwell''s thrush'; 

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 13.7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SandDeoc2018';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14.25;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SandDeoc2018';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42.75;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives this as typical for Turdus';

data.Wwb = 6;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SandDeoc2018';
data.Wwi = 60;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 2.3/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SandDeoc2018';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.000	6.465
0.027	5.821
0.027	7.325
1.000	6.928
1.027	9.292
1.973	15.983
2.946	10.215
3.000	19.240
3.054	14.300
3.054	17.308
4.000	18.199
4.000	21.421
4.027	11.754
4.946	24.031
5.000	25.322
5.027	15.655
5.973	21.272
6.000	25.570
7.000	24.743
7.054	33.983
7.054	31.620
7.946	33.153
7.973	33.799
7.973	38.525
7.973	41.318
9.000	37.485
9.027	42.642
10.000	43.104
10.000	46.542
10.027	37.304
11.000	46.145
11.000	44.426
11.054	49.155
11.054	41.850
11.973	54.341
12.000	42.311
12.000	48.112
13.000	43.418
13.000	53.945];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SandDeoc2018';

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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '59PLP'; % Cat of Life
metaData.links.id_ITIS = '563582'; % ITIS
metaData.links.id_EoL = '922673'; % Ency of Life
metaData.links.id_Wiki = 'Turdus_hauxwelli'; % Wikipedia
metaData.links.id_ADW = 'Turdus_hauxwelli'; % ADW
metaData.links.id_Taxo = '84438'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '33FBD8734EBA9FE8'; % avibase
metaData.links.id_birdlife = 'hauxwells-thrush-turdus-hauxwelli'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Turdus_hauxwelli}}';
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
bibkey = 'SandDeoc2018'; type = 'Article'; bib = [ ... 
'doi = {10.1676/17-012.1}, ' ...
'author = {Juliana Sandoval-H and Michelle Deochand and Gustavo A. Londo\~{n}o}, ' ... 
'year = {2018}, ' ...
'title = {Nesting biology of Hauxwell''s Thrush (\emph{Turdus hauxwelli}): with notes on altitudinal variation}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {130}, ' ...
'pages = {470-478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/922673}}';
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


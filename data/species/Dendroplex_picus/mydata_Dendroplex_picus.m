function [data, auxData, metaData, txtData, weights] = mydata_Dendroplex_picus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Furnariidae';
metaData.species    = 'Dendroplex_picus'; 
metaData.species_en = 'Straight-billed woodcreeper';

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab', 'ap', 'aR', 'am', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1   = [2022 11 16];              
metaData.email_mod_1  = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1= {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 17;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MajeOtey2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MajeOtey2013';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-23 d';
data.tp = 52.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-23 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'MajeOtey2013';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MajeOtey2013';
data.Wwi = 53;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MajeOtey2013';
  comment.Wwi = 'asymptotic weight of nestling; adult weight 44 g';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MajeOtey2013';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 3 eggs per clutch, 1 clutch per year assumed';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	5.688
0.001	7.696
1.025	8.172
1.026	8.790
1.027	9.871
1.947	7.257
1.948	8.183
1.998	9.883
2.971	16.999
2.972	18.080
2.973	19.625
3.996	11.143
3.997	19.792
3.998	22.572
4.967	20.422
4.968	26.136
4.969	30.460
5.020	29.843
5.943	32.789
5.994	27.538
6.045	21.053
6.967	30.022
7.017	33.729
7.018	38.362
7.019	39.134
8.965	43.482
9.015	40.549
9.016	44.719
9.017	46.263
11.014	47.214
11.065	43.045
11.066	44.281
12.910	49.400
12.911	50.635
12.961	48.474
13.012	45.077
13.013	47.394
14.957	41.086
14.958	45.101
14.959	46.028
16.136	44.498
16.137	45.579];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MajeOtey2013';
  
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
D1 = 'Feeding is reduced just before fledge';
D2 = 'mod_1: v reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7G8XD'; % Cat of Life
metaData.links.id_ITIS = '563746'; % ITIS
metaData.links.id_EoL = '45511713'; % Ency of Life
metaData.links.id_Wiki = 'Dendroplex_picus'; % Wikipedia
metaData.links.id_ADW = 'Dendroplex_picus'; % ADW
metaData.links.id_Taxo = '1683599'; % Taxonomicon
metaData.links.id_avibase = '9C163605D9726273'; % Avibase
metaData.links.id_birdlife = 'straight-billed-woodcreeper-dendroplex-picus'; % Birdlife

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendroplex_picus}}';
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
bibkey = 'MajeOtey2013'; type = 'Article'; bib = [ ... 
'doi = {10.1676/10-149.1}, ' ...
'author = {A. A. Majewska and J. C. Oteyza}, ' ... 
'year = {2013}, ' ...
'title = {Breeding Biology of the Straight-Billed Woodcreeper}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {125}, ' ...
'number = {1}, '...
'pages = {150--158}'];
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


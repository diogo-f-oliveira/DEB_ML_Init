function [data, auxData, metaData, txtData, weights] = mydata_Caloenas_nicobarica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Caloenas_nicobarica'; 
metaData.species_en = 'Nicobar pigeon'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Bell1981';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 37;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Bell1981';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 111;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Bell1981';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.5*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 18.6;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bell1981';
data.Wwi = 519;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Bell1981';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs/clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       18.6
2.278	29.176
4.055	42.539
6.191	79.287
8.242	116.036
10.202	145.267
12.181	196.214
14.229	228.786
16.277	263.029
18.143	280.568
21.110	307.294
24.148	319.822
30.889	429.232];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'parent-reared'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Bell1981';
comment.tW = 'parent-reared';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0       18.6
2.019	22.494
4.040	25.000
6.060	27.506
8.336	34.187
10.113	46.715
12.320	69.265
14.191	93.486
16.235	121.882
18.544	165.312
20.512	202.895
22.328	258.853
24.306	308.129
25.888	290.590
28.171	305.624
30.540	321.492
32.132	314.811
36.123	359.076];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'hand-reared'};  
temp.tW1    = C2K(40.63);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Bell1981';
comment.tW1 = 'hand-reared';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
2.103	21.659
4.034	18.318
6.054	20.824
8.330	27.506
10.273	37.528
12.635	45.880
16.291	90.980
18.250	118.541
20.627	144.432
22.105	197.884
24.081	245.490
28.586	298.942
30.372	321.492
34.277	363.252];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'hand-reared'};  
temp.tW2    = C2K(40.63);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Bell1981';
comment.tW2 = 'hand-reared';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
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

%% Group plots
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Parent- and 2 hand-reared chicks'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Food intake of hand-reared chicks is low intitially';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'PY9S'; % Cat of Life
metaData.links.id_ITIS = '177272'; % ITIS
metaData.links.id_EoL = '45516222'; % Ency of Life
metaData.links.id_Wiki = 'Caloenas_nicobarica'; % Wikipedia
metaData.links.id_ADW = 'Caloenas_nicobarica'; % ADW
metaData.links.id_Taxo = '53957'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '0FFC77EF1BC55357'; % avibase
metaData.links.id_birdlife = 'nicobar-pigeon-caloenas-nicobarica'; % birdlife
metaData.links.id_AnAge = 'Caloenas_nicobarica'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caloenas_nicobarica}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Caloenas_nicobarica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bell1981'; type = 'Article'; bib = [ ...
'author = {K. J. Bell},'...
'doi = {10.1111/j.1748-1090.1981.tb01987.x}, ' ...
'year = {1981}, ' ...
'title = {Breeding and hand-rearing the Nicobar pigeon at the {L}incoln {P}ark {Z}oological {G}ardens \emph{Caloenas nicobarica}}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {21}, ' ...
'pages = {217-219}'];
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


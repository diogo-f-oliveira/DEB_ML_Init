function [data, auxData, metaData, txtData, weights] = mydata_Phacochoerus_aethiopicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Suidae';
metaData.species    = 'Phacochoerus_aethiopicus'; 
metaData.species_en = 'Desert warthog'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTs', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 215;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(39.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 84;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Phacochoerus africanus';
data.tp = 578;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20.9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(39.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Phacochoerus africanus';
  
data.Wwb = 660;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
  comment.tx = 'based on Phacochoerus africanus';
data.Wwi = 68e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Maso1985';
data.Wwim = 86e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Maso1985';
  
data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(39.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1 litter per yr';

% uni-variate data
% time-weight
data.tW_f = [ % time since birth (yr), wet weight (kg)
6.457	13.356
10.496	16.551
12.450	22.467
13.466	25.528
14.477	32.407
15.453	36.270
16.473	36.718
17.442	45.203
18.428	42.031
20.501	47.551
21.496	37.746
22.473	41.408
23.452	42.657
24.471	43.909
25.450	45.360
26.431	46.208
28.505	50.119
29.482	53.178
30.430	49.401
31.455	46.834
32.472	49.090
33.507	66.423
34.477	47.572
35.518	60.282
36.584	56.108]; 
data.tW_f(:,1) = data.tW_f(:,1)*30.5; % convert mnth to d
data.tW_f(:,2) = data.tW_f(:,2)*1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(39.0);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Maso1985';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (mnth), wet weight (kg)
8.465	20.360
12.469	24.071
13.446	28.875
14.460	35.469
16.447	50.446
17.474	46.503
18.423	40.968
19.399	46.766
20.499	47.399
21.481	47.233
22.467	44.482
23.481	51.275
24.541	52.105
25.475	59.890
26.496	61.116
27.515	63.138
28.528	70.329
29.545	75.134
30.569	73.180
31.523	63.669
32.464	65.489
33.562	67.911
34.498	73.509
35.564	69.369
36.575	79.144]; 
data.tW_m(:,1) = data.tW_m(:,1)*30.5; % convert mnth to d
data.tW_m(:,2) = data.tW_m(:,2)*1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(39.0);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Maso1985';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5*weights.tW_f; 
weights.tW_m = 5*weights.tW_m; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumed';
D2 = 'Males are assumend to differ from females by {p_Am} only';
D3 = 'Body temperature is guessed based on Rupicapra';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4FKFS'; % Cat of Life
metaData.links.id_ITIS = '625007'; % ITIS
metaData.links.id_EoL = '328331'; % Ency of Life
metaData.links.id_Wiki = 'Phacochoerus_aethiopicus'; % Wikipedia
metaData.links.id_ADW = 'Phacochoerus_aethiopicus'; % ADW
metaData.links.id_Taxo = '67660'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200019'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phacochoerus_aethiopicus}}';
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
bibkey = 'Maso1985'; type = 'article'; bib = [ ... 
'author = {D. R. Mason}, ' ... 
'year = {1985}, ' ...
'title = {Postnatal growth and physical condition of warthogs \emph{Phacochoerus aethiopicus} in {Z}ululand}, ' ...
'journal = {S.-Afr. Tydskr. Natuurnav.}, ' ...
'volume = {15}, ' ...
'pages = {89--97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phacochoerus_africanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Phacochoerus_aethiopicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


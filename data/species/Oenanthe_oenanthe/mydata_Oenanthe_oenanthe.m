function [data, auxData, metaData, txtData, weights] = mydata_Oenanthe_oenanthe
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Muscicapidae';
metaData.species    = 'Oenanthe_oenanthe'; 
metaData.species_en = 'Northern wheatear'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTd', '0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 09 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 10];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 10;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Verb1988';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 30;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10.1*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.8;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 25;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'usually 1 clutch per yr';
  
% uni-variate data
% time weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0	 3.456  2.378
 1	 5.030  3.647
 2	 7.517  4.863
 3	 9.251  7.241
 4	11.901  9.831
 5	14.227 12.262
 6	16.231 15.063
 7	18.881 17.706
 8	20.078 20.296
 9	21.005 21.564
10	21.664 22.939
11  NaN    24.101
12  NaN    24.524
13  NaN    24.577];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = {'Verb1988', 'Oost2016'}; treat.tW = {1, {'Verb1988','Oost2016'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: tW data added';
D2 = 'Males are assumed not to differ from females';
D3 = 'mod_2: v is reduced';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '48X9H'; % Cat of Life
metaData.links.id_ITIS = '179814'; % ITIS
metaData.links.id_EoL = '45511011'; % Ency of Life
metaData.links.id_Wiki = 'Oenanthe_oenanthe'; % Wikipedia
metaData.links.id_ADW = 'Oenanthe_oenanthe'; % ADW
metaData.links.id_Taxo = '56939'; % Taxonomicon
metaData.links.id_WoRMS = '426237'; % WoRMS
metaData.links.id_avibase = 'DF526047637004DD'; % avibase
metaData.links.id_birdlife = 'northern-wheatear-oenanthe-oenanthe'; % birdlife
metaData.links.id_AnAge = 'Oenanthe_oenanthe'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oenanthe_oenanthe}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Oenanthe_oenanthe}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Verb1988'; type = 'Article'; bib = [ ... 
'author = {N. A. M. Verbeek}, ' ... 
'year = {1988}, ' ...
'title = {Development of a stable body temperature and growth rates in nestlings of three ground nesting passerines in alpine tundra}, ' ...
'journal = {J Ornithol}, ' ...
'volume = {129}, ' ...
'pages = {449-456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Oost2016'; type = 'Article'; bib = [ ... 
'doi = {10.5253/arde.v104i3.a2}, ' ...
'author = {Oosten, H. Herman van}, ' ... 
'year = {2016}, ' ...
'title = {Comparative Breeding Biology of Three Insectivorous Songbirds in Dutch Dune Grasslands}, ' ...
'journal = {Ardea}, ' ...
'volume = {104(3)}, ' ...
'pages = {199-212}'];
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


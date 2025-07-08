function [data, auxData, metaData, txtData, weights] = mydata_Troglodytes_aedon

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Troglodytidae';
metaData.species    = 'Troglodytes_aedon'; 
metaData.species_en = 'House wren'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'; 't-JCe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2012 08 29];              
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

data.ab = 13;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp is guessed';
data.tx = 16;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Katt1996';   
  temp.tx = C2K(41.6);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 48;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 320;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.5;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Katt1996';
data.Wwi = 15.5;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Katt1996';

data.Ri  = 7*2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Two clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight unparasitized (g)
 1	 2.151
 2	 3.554
 3	 4.760
 4	 6.456
 5	 8.379
 6	 9.326
 7	10.891
 8	13.433
 9	13.272
10	15.228
11	15.132
12	15.199
13	14.809
14	16.537
15	15.594
16	16.117];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Katt1996'; 
comment.tW = 'unparasitized';
%
data.tWp = [ ... % time since birth (d), wet weight parasitized by shiny cowbird (g)
 2	 4.389
 3	 4.237
 4	 5.893
 5	 7.202
 6	 8.473
 7	10.783
10	13.750];
units.tWp   = {'d', 'g'};  label.tWp = {'time since birth', 'wet weight'};  
temp.tWp    = C2K(41.6);  units.temp.tWp = 'K'; label.temp.tWp = 'temperature';
bibkey.tWp  = 'Katt1996'; 
comment.tWp = 'parasitized';

% time-weight for embryo
data.aWe   = [ ... % age (d), embryo wet weight (g)
2 0.01178
4 0.1028
7 0.383
10 0.8679
12 1.5003];
units.aWe  = {'d', 'g'};  label.aWe = {'age', 'embryo wet weight'};  
temp.aWe   = C2K(41.6);  units.temp.aWe = 'K'; label.temp.aWe = 'temperature';
bibkey.aWe = 'Kend1940';

% time-CO2 prod for embryo decreasing times for embryo-data fitting
data.aJCe = [ ... % age (d), CO_2 production (ml CO_2/d)
2   0.83;
4   2.88;
7  10.56;
10  19.44;
12  31.44];
units.aJCe  = {'d', 'ml CO_2/d'};  label.aJCe = {'age', 'embryo CO_2 production'};  
temp.aJCe   = C2K(41.6);  units.temp.aJCe = 'K'; label.temp.aJCe = 'temperature';
bibkey.aJCe = 'Kend1940';

%% set weights for all real data
weights = setweights(data, []);
weights.tWp = weights.tWp * 2;
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
set1 = {'tWp','tW'}; subtitle1 = {'Data for parasitized, unparasitized nests'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Energy conductance appears to jump up at birth by a factor 3';
D2 = 'Temperature acceleration is assumed';
D3 = 'CO2 production is given weight zero - it was not possible to get such high growth in combination with low embryonic respiration';
D4 = 'mod_1: same energy conductance pre- and -post birth; varying food availability';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '598SY'; % Cat of Life
metaData.links.id_ITIS = '178541'; % ITIS
metaData.links.id_EoL = '45510121'; % Ency of Life
metaData.links.id_Wiki = 'Troglodytes_aedon'; % Wikipedia
metaData.links.id_ADW = 'Troglodytes_aedon'; % ADW
metaData.links.id_Taxo = '56758'; % Taxonomicon
metaData.links.id_WoRMS = '1484608'; % WoRMS
metaData.links.id_avibase = '51E937020E0F3B99'; % avibase
metaData.links.id_birdlife = 'house-wren-troglodytes-aedon'; % birdlife
metaData.links.id_AnAge = 'Troglodytes_aedon'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Troglodytes_aedon}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Troglodytes_aedon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kend1940'; type = 'Article'; bib = [ ...  
'author = {Kendeigh, S. C.}, ' ...
'title = {Factors affecting the length of incubation.}, ' ...
'journal = {Auk}, ' ...
'year = {1940}, ' ...
'volume = {57}, ' ...
'pages = {499--513}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Katt1996'; type = 'Article'; bib = [ ...  
'title = {GROWTH AND PROVISIONING OF SHINY COWBIRD AND HOUSE WREN HOST NESTLINGS}, ' ...
'journal = {j. Field Ornithol.}, ' ...
'year = {1996}, ' ...
'author = {Gustavo H. Kattan}, ' ...
'volume = {67}, ' ...
'pages = {434-441}'];
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


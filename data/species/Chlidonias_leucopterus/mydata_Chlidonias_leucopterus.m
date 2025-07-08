function [data, auxData, metaData, txtData, weights] = mydata_Chlidonias_leucopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Chlidonias_leucopterus'; 
metaData.species_en = 'White-winged tern'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp', 'TPa', 'TA'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnffm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 20.5;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Kapo1979';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Kapo1979';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'Anage';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for C. niger';
data.am = 21*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for C. niger';

data.Wwb = 7.25;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Data for C. niger';
data.Wwi = 73;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Kapo1979';
  
data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Kapo1979';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight 
data.tW = [ ... % time since birth (d), wet weight (g)
8  28.75
9  39.20
10 43.95
11 52.35
12 54.70
13 59.10
14 57.80
15 61.50
16 64.45
17 58.60
18 65.20
19 64.20
20 59.40
21 54.00
22 50.00
23 47.00
24 45.30];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Kapo1979';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
5  20.10
6  25.80
7  27.85
8  31.50
9  35.35
10 39.45
11 46.10
12 54.60
13 61.15
14 65.40
15 71.50
16 69.20
17 67.40
18 70.30
19 69.60
20 70.90
21 64.50
22 63.60
23 60.50
24 60.90
25 57.80
26 54.50
27 57.20];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW1    = C2K(41);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Kapo1979';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
4  17.10
5  21.80
6  26.45
7  34.10
8  43.45
9  49.70
10 55.80
11 60.55
12 68.30
13 72.30
14 76.80
15 72.60
16 72.90
17 70.20
18 76.60
19 75.90
20 73.50
21 76.90
22 75.00
23 74.70
24 56.40
25 70.60
26 70.70
27 70.90];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'ind 3'};  
temp.tW2    = C2K(41);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Kapo1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;
% weights.tp = 5; 
% weights.Wwb = 5;
% weights.ab = 5;
% weights.Wwi = 5;
% weights.Ri = 5;

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
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Data for 3 individuals'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: v is reduced; food density is taken variable in tW data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '5Y96Q'; % Cat of Life
metaData.links.id_ITIS = '176958'; % ITIS
metaData.links.id_EoL = '45509332'; % Ency of Life
metaData.links.id_Wiki = 'Chlidonias_leucopterus'; % Wikipedia
metaData.links.id_ADW = 'Chlidonias_leucopterus'; % ADW
metaData.links.id_Taxo = '93234'; % Taxonomicon
metaData.links.id_WoRMS = '137136'; % WoRMS
metaData.links.id_avibase = '43CAAEE3B0D305D9'; % avibase
metaData.links.id_birdlife = 'white-winged-tern-chlidonias-leucopterus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlidonias_leucopterus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chlidonias_niger}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kapo1979'; type = 'Book'; bib = [ ...  
'title = {Weissbart- und Weissfl\"{u}gelseeschwalbe \emph{Chlidonias leucopterus}}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'year = {1979}, ' ...
'author = {Kapocsy, G.}, ' ...
'volume = {516}, ' ...
'series = {Die Neue Brehm B\"{u}cherei}, ' ...
'address = {Wittenberg Lutherstadt}'];
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


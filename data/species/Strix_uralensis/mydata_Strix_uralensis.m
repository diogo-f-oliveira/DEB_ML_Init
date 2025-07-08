  function [data, auxData, metaData, txtData, weights] = mydata_Strix_uralensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Strix_uralensis'; 
metaData.species_en = 'Ural owl'; 

metaData.ecoCode.climate = {'Df','Dw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp Mexican subspecies GaneBald1993
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb';'Wwi';'Ri'};  
metaData.data_1     = {'t-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2022 09 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'ibacon GmbH'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data
data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 40;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 120;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'avibase';   
  temp.tR = C2K(40.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.8*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'AnAge';    
  temp.am = C2K(40.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 49;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 30; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'avibase';    
data.Wwi = 870;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight female';   bibkey.Wwi = 'avibase';   
data.Wwim = 590;   units.Wwim = 'g';    label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'avibase';   

data.Ri  = 2.9/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'avibase';      
  comment.Ri  = '2.9 eggs per clutch, 1 clutch per yr'; 
  temp.Ri = C2K(40.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
 2	 43.132  42.275
 4	 49.801  57.444
 6	 69.217  70.917
 7	 81.062  81.060
 8	101.362  95.420
 9	125.077 115.736
10	152.189 139.452
11	153.826 143.643
12	199.617 177.541
13	223.334 209.747
14	249.599 220.723
15	274.162 267.367
16	299.572 275.796
17	307.155 308.006
18	330.018 307.945
19	370.719 361.377
21	440.225 439.380
22	470.728 451.203
23	485.108 458.785
24	509.668 484.203];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sche1980'; treat.tW = {1, {'female','male'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Wwim = weights.Wwim * 0;
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
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
D2 = 'mod_1: v is reduced; Wwim ignored due to inconsistency with tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '532KQ'; % Cat of Life
metaData.links.id_ITIS = '555433'; % ITIS
metaData.links.id_EoL = '45518938'; % Ency of Life
metaData.links.id_Wiki = 'Strix_uralensis'; % Wikipedia
metaData.links.id_ADW = 'Strix_uralensis'; % ADW
metaData.links.id_Taxo = '54788'; % Taxonomicon
metaData.links.id_WoRMS = '1461475'; % WoRMS
metaData.links.id_avibase = 'E162AEB825EEBCE3'; % avibase
metaData.links.id_birdlife = 'ural-owl-strix-uralensis'; % birdlife
metaData.links.id_AnAge = 'Strix_uralensis'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sche1980'; type = 'book'; bib = [ ...  
'author = {Wolfgang Scherzinger}, ' ...
'year = {1980}, ' ...
'title = {Zur Ethologie der Fortpflanzung un Jugenentwicklung de Habichtgskauzes (\emph{Strix uralensis}) met vergleichem zum Waldkauz (\emph{Strix Aluco})}, ' ... 
'journal = {Bonner Zoologische Monographien}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'misc'; bib =  ... 
'howpublished= {\url{http://genomics.senescence.info/species/entry.php?species=Strix_uralensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E162AEB825EEBCE3&sec=lifehistory}}';
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


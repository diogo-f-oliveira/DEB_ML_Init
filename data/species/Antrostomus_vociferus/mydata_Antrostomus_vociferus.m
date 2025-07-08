function [data, auxData, metaData, txtData, weights] = mydata_Antrostomus_vociferus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Caprimulgiformes'; 
metaData.family     = 'Caprimulgidae';
metaData.species    = 'Antrostomus_vociferus'; 
metaData.species_en = 'Eastern whip-poor-will'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap';  'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 10 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CinkPyle2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '19-21 d';
data.tx = 20;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CinkPyle2020';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '15-21 d';
data.tp = 150;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '15-21 d';
data.tR = 350;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CinkPyle2020';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Caprimulgus_europaeus';

data.Ww0 = 6.1;   units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';         bibkey.Ww0 = 'CinkPyle2020';
data.Wwb = 5.4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FowlFowl1954';
data.Wwi = 56.5; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'CinkPyle2020';
data.Wwim = 50.3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'CinkPyle2020';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time (h), weight (g)
    0  7.0
   24  9.5
   49 11.9
   75 15.2
   98 18.2
  121 22.4
  142 26.4
  167 28.3
  191 31.8
  214 33.7
  238 35.8
  257 39.1
  312 34.8
  336 33.9
  375 46.1];
data.tW(:,1) = 1+ data.tW(:,1)/24; % set origin at hatch and convert h to d
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight', 'chick 1'};  
temp.tW   = C2K(39.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FowlFowl1954';
comment.tW = 'chick 1';
%
data.tW1 = [ ... % time since hatch (d), weight (g)
    0  5.4
   24  6.8
   49  9.1
   75 12.2
   98 15.2
  121 17.5
  142 21.6
  167 23.5
  191 25.2
  214 29.6
  238 32.4
  257 35.2];
data.tW1(:,1) = data.tW1(:,1)/ 24; % convert h to d
units.tW1  = {'d', 'g'}; label.tW1 = {'time since birth', 'wet weight', 'chick 2'};  
temp.tW1   = C2K(39.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'FowlFowl1954';
comment.tW1 = 'chick 2';

%% set weights for all real data
weights = setweights(data, []);
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
set1 = {'tW','tW1'}; subtitle1 = {'Data for chick 1, 2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced; Ww0 data ignored';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'F4NC'; % Cat of Life
metaData.links.id_ITIS = '1077358'; % ITIS
metaData.links.id_EoL = '45509477'; % Ency of Life
metaData.links.id_Wiki = 'Antrostomus_vociferus'; % Wikipedia
metaData.links.id_ADW = 'Caprimulgus_vociferus'; % ADW
metaData.links.id_Taxo = '4702217'; % Taxonomicon
metaData.links.id_WoRMS = '1484330'; % WoRMS
metaData.links.id_avibase = '1A09655B1DFED41F'; % avibase
metaData.links.id_birdlife = 'eastern-whip-poor-will-antrostomus-vociferus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caprimulgus_pectoralis}}';
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
bibkey = 'FowlFowl1954'; type = 'Article'; bib = [ ... 
'author = {Fowle, C. D. and A. M. Fowle}, ' ... 
'year = {1954}, ' ...
'title = {Observations at a Whip-poor-will''s nest}, ' ...
'journal = {Canadian Field-Naturalist}, ' ...
'volume = {68}, ' ...
'pages = {37-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CinkPyle2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.whip-p1.01}, ' ...
'author = {Cink, C. L. and P. Pyle and M. A. Patten}, ' ... 
'year = {2020}, ' ...
'title = {Eastern Whip-poor-will (\emph{Antrostomus vociferus}), version 1.0. In Birds of the World (P. G. Rodewald, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}']; 
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


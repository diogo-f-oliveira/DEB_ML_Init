function [data, auxData, metaData, txtData, weights] = mydata_Eleothreptus_candicans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Caprimulgiformes'; 
metaData.family     = 'Caprimulgidae';
metaData.species    = 'Eleothreptus_candicans'; 
metaData.species_en = 'White-winged nightjar'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap';  'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Popl2014';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care';
data.tx = 19.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Popl2014';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 58.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Caprimulgus_europaeus';

data.Wwb = 5.5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Popl2014';
data.Wwi = 46; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Popl2014';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
 0.000	5.470
 0.001	5.097
 0.002	5.470
 0.003	5.471
 1.000	6.596
 1.001	8.213
 2.000	8.097
 2.001	7.724
 5.000	20.303
 5.001	15.207
10.001	26.561
10.002	11.022
11.000	38.254
11.001	35.768
12.000	40.624
12.001	29.188
15.000	37.789
15.001	44.130
15.002	39.157
15.003	32.569
15.004	33.191];
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(39.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Popl2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tW(12) = 0; % exclude starved inidividual

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '397XB'; % Cat of Life
metaData.links.id_ITIS = '1077345'; % ITIS
metaData.links.id_EoL = '45512204'; % Ency of Life 
metaData.links.id_Wiki = 'Eleothreptus_candicans'; % Wikipedia
metaData.links.id_ADW = 'Eleothreptus_candicans'; % ADW
metaData.links.id_Taxo = '1683493'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'A3E1E0ACED906ABF'; % avibase
metaData.links.id_birdlife = 'white-winged-nightjar-eleothreptus-candicans'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eleothreptus_candicans}}';
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
bibkey = 'Popl2014'; type = 'Article'; bib = [ ... 
'author = {Robert G. Pople}, ' ... 
'year = {2014}, ' ...
'title = {Breeding biology of the White-winged Nightjar (\emph{Eleothreptus candicans}) in eastern {P}araguay}, ' ...
'journal = {Revista Brasileira de Ornitologia}, ' ...
'volume = {22(2)}, ' ...
'pages = {219-233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=A3E1E0ACED906ABF&sec=lifehistory}}';
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


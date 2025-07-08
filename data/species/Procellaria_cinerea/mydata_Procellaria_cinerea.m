function [data, auxData, metaData, txtData, weights] = mydata_Procellaria_cinerea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Procellaria_cinerea'; 
metaData.species_en = 'Grey petrel';

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Zoti1990';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55 to 65 d';
data.tx = 157; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Zoti1990';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 471; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 80; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Zoti1990';
  comment.Wwb = 'Data for Pterodroma hypoleuca';
data.Wwi = 1020; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Zoti1990';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. Wiki 1 kg';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0      80    % added data point Wwb
3.030	106.946
9.840	208.048
16.926	320.121
24.009	426.696
31.100	549.766
37.568	513.432
44.670	655.746
51.732	723.832
59.061	783.646
65.612	906.766
72.887	864.859
79.928	891.707
86.932	847.076
93.441	890.469
100.797	1002.517
107.821	996.375
114.648	1130.467
121.659	1099.581
128.966	1118.157
135.666	1010.319
142.641	910.704
149.599	778.098
156.674	870.927];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Zoti1990';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4MMQ3'; % Cat of Life
metaData.links.id_ITIS = '562470'; % ITIS
metaData.links.id_EoL = '45512128'; % Ency of Life
metaData.links.id_Wiki = 'Procellaria_cinerea'; % Wikipedia
metaData.links.id_ADW = 'Procellaria_cinerea'; % ADW
metaData.links.id_Taxo = '51566'; % Taxonomicon
metaData.links.id_WoRMS = '212652'; % WoRMS
metaData.links.id_avibase = '843C1B8689E0935F'; % avibase
metaData.links.id_birdlife = 'grey-petrel-procellaria-cinerea'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procellaria_cinerea}}';
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
bibkey = 'Zoti1990'; type = 'Article'; bib = [ ... 
'author = {R. Zotier}, ' ... 
'doi = {10.1071/mu9900180}, ' ...
'year = {1990}, ' ...
'title = {Breeding Ecology of a {S}ubantarctic Winter Breeder: the Grey Petrel \emph{Procellaria cinerea} on {K}erguelen {I}slands}, ' ...
'journal = {Emu - Austral Ornithology}, ' ...
'volume = {90}, ' ...
'pages = {180-184}'];
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


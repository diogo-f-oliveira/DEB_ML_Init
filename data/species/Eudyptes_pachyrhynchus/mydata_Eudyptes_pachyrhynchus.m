function [data, auxData, metaData, txtData, weights] = mydata_Eudyptes_pachyrhynchus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Eudyptes_pachyrhynchus'; 
metaData.species_en = 'Fiordland penguin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MISE', 'MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 35;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4 to 6 wks';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Warh1974';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 225;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'EoL';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 70;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Warh1974';
data.Wwi = 4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Warh1974';
  comment.Wwi = 'asymptotic weight of nesting; adult 2 to 5.95 kg, man 3.7 kg (Wiki)';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Warh1974';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.147	70.043
4.692	453.461
5.719	512.417
7.332	571.316
10.264	559.221
12.024	783.460
13.930	777.370
17.010	977.859
30.353	1744.284
30.647	1643.862
32.406	1761.802
36.219	2233.873
51.762	2586.699
64.226	2963.445
75.663	2277.299];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Warh1974';

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
D1 = 'Reduced relative food intake prior to fledging';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Produces a small (99.9 g) and a large egg (120.3 g)';
metaData.bibkey.F1 = 'Warh1974'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GWJ2'; % Cat of Life
metaData.links.id_ITIS = '174454'; % ITIS
metaData.links.id_EoL = '45512080'; % Ency of Life
metaData.links.id_Wiki = 'Eudyptes_pachyrhynchus'; % Wikipedia
metaData.links.id_ADW = 'Eudyptes_pachyrhynchus'; % ADW
metaData.links.id_Taxo = '51400'; % Taxonomicon
metaData.links.id_WoRMS = '225971'; % WoRMS
metaData.links.id_avibase = 'A143FB33F08F1A0B'; % avibase
metaData.links.id_birdlife = 'fiordland-penguin-eudyptes-pachyrhynchus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eudyptes_pachyrhynchus}}';
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
bibkey = 'Warh1974'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1974.tb00220.x}, ' ...
'author = {J. Warham}, ' ... 
'year = {1974}, ' ...
'title = {THE {F}IORDLAND CRESTED PENGUIN \emph{Eudyptes pachyrhynchus}}, ' ...
'journal = {Ibis}, ' ...
'volume = {116}, ' ...
'pages = {1--27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Eudyptes_pachyrhynchus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049616/overview/}}';
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


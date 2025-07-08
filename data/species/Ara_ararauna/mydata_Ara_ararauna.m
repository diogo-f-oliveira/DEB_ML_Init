function [data, auxData, metaData, txtData, weights] = mydata_Ara_ararauna

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Ara_ararauna'; 
metaData.species_en = 'Blue-and-yellow macaw'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 20];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';                        bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 till 28 d';
data.tx = 97;    units.tx = 'd';    label.tx = 'time since birth at fledging';        bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 291;    units.tp = 'd';    label.tp = 'time since birth at puberty';        bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 43*365;    units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 19.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Hans1987';
data.Wwi = 1.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';              bibkey.Wwi = 'Wiki';

data.Ri = 2.5/365/1.5; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';           bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 3 eggs/clutch; breeds once per 1.5 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0   19.5 
 0   19.0
 0   19.7
 0   20.1
 7   35.9
 7   39.6
 7   46.1
 7   46.6
14   67.9 
14   78.4
14  165.4
14  131.8
21  143.4
21  161.7
21  356.4
21  295.6
28  279.2
28  300.8
28  550.2
28  514.4
35  332.7
35  512.3
35  754.9
35  714.0
42  660.9
42  716.5
42  929.5
42  905.5
49  785.5
49  898.9
49 1056.1
49 1025.6
56  852.8
56  985.9
56 1113.5
56 1089.9];
n=size(data.tW,1);for i=2:n;if  data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Hans1987';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'The std model is unable to capture the high age at first reproduction';
D3 = 'mod_1: v is reduced and food availability is taken variable in tW data';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Female breeds, both parents feed young; nest in big hollow Mauritia flexuosa palms';
metaData.bibkey.F1 = {'ADW','Wiki'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'G227'; % Cat of Life
metaData.links.id_ITIS = '177661'; % ITIS
metaData.links.id_EoL = '45510823'; % Ency of Life
metaData.links.id_Wiki = 'Ara_ararauna'; % Wikipedia
metaData.links.id_ADW = 'Ara_ararauna'; % ADW
metaData.links.id_Taxo = '54396'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '18AEC3532537ACCB'; % avibase
metaData.links.id_birdlife = 'blue-and-yellow-macaw-ara-ararauna'; % birdlife
metaData.links.id_AnAge = 'Ara_ararauna'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ara_ararauna}}';
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
bibkey = 'Hans1987'; type = 'Article'; bib = [ ... 
'author = {J. T. Hanson}, ' ... 
'year = {1987}, ' ...
'title = {Handraising large parrots: Methodology and expected weight gains}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {6}, ' ...
'pages = {139--160}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ara_ararauna}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ara_ararauna/}}';
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


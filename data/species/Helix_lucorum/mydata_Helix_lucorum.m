function [data, auxData, metaData, txtData, weights] = mydata_Helix_lucorum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Helicidae';
metaData.species    = 'Helix_lucorum'; 
metaData.species_en = 'Turkish snail'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 02]; 

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.045;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on egg diameter of 4.4 mm: pi/6*0.44^3';
data.Wwi = 25;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 65/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'animalbase';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '40-65 eggs/clutch, 1 clutch per season; data for H. pomatia'; 
 
% uni-variate data
% time-weight
data.tW = [ ...
0.518	0.045
31.058	0.416
61.154	1.212
91.303	2.425
122.154	3.212];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LazaBail1991';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Kappa_R = 0.95/2 because of hermaphroditism';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This species is hermaphroditic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LLW9'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4900516'; % Ency of Life
metaData.links.id_Wiki = 'Helix_lucorum'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1014609'; % Taxonomicon
metaData.links.id_WoRMS = '1050278'; % WoRMS
metaData.links.id_molluscabase = '1050278'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helix_lucorum}}';
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
bibkey = 'LazaBail1991'; type = 'Article'; bib = [ ... 
'author = {M. Lazaridou-Dimitriadou and S . E. R. Bailey}, ' ... 
'year = {1991}, ' ...
'title = {Growth, reproduction and activity rhythms in two species of edible snails, \emph{Helix aspersa} and \emph{Helix lucorum}, in non 24-hour light cycles}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {225}, ' ...
'pages = {381-391}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.animalbase.uni-goettingen.de/zooweb/servlet/AnimalBase/home/species?id=812}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


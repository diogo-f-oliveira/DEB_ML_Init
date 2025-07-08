function [data, auxData, metaData, txtData, weights] = mydata_Helix_pomatia

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Helicidae';
metaData.species    = 'Helix_pomatia'; 
metaData.species_en = 'Roman snail'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 14]; 

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.8; units.Lp  = 'cm';  label.Lp  = 'shell width at puberty'; bibkey.Lp  = 'ADW';
data.Li  = 5;   units.Li  = 'cm';  label.Li  = 'ultimate shell width'; bibkey.Li  = 'Wiki';

data.Wwb = 0.014;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Wiki_he';
  comment.Wwb = 'Based on egg diameter of 3 mm: 4/3*pi*0.15^3';
data.Wwi = 50;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki_he';
  comment.Wwi = 'weight includes shell';

data.Ri  = 65/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'animalbase';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '40-65 eggs/clutch, 1 clutch per season'; 
 
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
F2 = 'Egg cannibalism by hatchlings is frequent';
metaData.bibkey.F2 = 'animalbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6LLM4'; % Cat of Life
metaData.links.id_ITIS = '77907'; % ITIS
metaData.links.id_EoL = '449906'; % Ency of Life
metaData.links.id_Wiki = 'Helix_pomatia'; % Wikipedia
metaData.links.id_ADW = 'Helix_pomatia'; % ADW
metaData.links.id_Taxo = '168261'; % Taxonomicon
metaData.links.id_WoRMS = '1050286'; % WoRMS
metaData.links.id_molluscabase = '1050286'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helix_pomatia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_he'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Heliciculture}}';
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
bibkey = 'animalbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.animalbase.uni-goettingen.de/zooweb/servlet/AnimalBase/home/species?id=812}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Helix_pomatia/#950a73096c94a6a8cc69857eb1621557}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


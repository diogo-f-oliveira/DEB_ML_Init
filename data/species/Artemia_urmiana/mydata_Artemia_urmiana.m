function [data, auxData, metaData, txtData, weights] = mydata_Artemia_urmiana
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Artemiidae';
metaData.species    = 'Artemia_urmiana'; 
metaData.species_en = 'Brine shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iSl'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'tWd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 24]; 

%% set data
% zero-variate data

data.tp = 5.56;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MoheAbdo2020';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 80;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoheAbdo2020';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.7;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'MoheAbdo2020';
data.Li  = 1.027;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'MoheAbdo2020';

data.Wdb  = 1.3e-6; units.Wdb  = 'g';  label.Wdb  = 'dry weight at birth';   bibkey.Wdb  = 'MoheAbdo2020';
  comment.Wdb = 'based on cyst diameter of 247 mum: pi/6*0.17*0.0247^3';
data.Wdi  = 1.6e-3;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based on A. salina';

data.Ri  = 7.11;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MoheAbdo2020';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), length (cm)
 1  0.0455
 8	0.130
11	0.155
14	0.768
17	0.894
20	1.027];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoheAbdo2020'; 

%% set weights for all real data
weights = setweights(data, []);
%weights.Wdb = 5 * weights.Wdb;
%weights.Ri = 5 * weights.Ri;
%weights.Wdi = 5 * weights.Wdi;
%weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic to Lake Urmia, Iran';
metaData.bibkey.F1 = 'MoheHafe2016'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GVWG'; % Cat of Life
metaData.links.id_ITIS = '624246'; % ITIS
metaData.links.id_EoL = '45923949'; % Ency of Life
metaData.links.id_Wiki = 'Artemia'; % Wikipedia
metaData.links.id_ADW = 'Artemia_urmiana'; % ADW
metaData.links.id_Taxo = '743101'; % Taxonomicon
metaData.links.id_WoRMS = '740631'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Artemia}}';
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
bibkey = 'MoheHafe2016'; type = 'Article'; bib = [ ... 
'author = {Mohebbi, F. and Hafezieh, M. and Seidgar, M. and Hosseinzadeh, Sahhafi H. and Mohsenpour, Azari A. and Ahmadi R.}, ' ... 
'year = {2016}, ' ...
'title = {The growth, survival rate and reproductive characteristics of \emph{Artemia urmiana} fed by \emph{Dunaliella tertiolecta}, \emph{Tetraselmis suecica}, \emph{Nannochloropsis oculata}, \emph{Chaetoceros sp.}, \emph{Chlorella sp.} and \emph{Spirolina sp.} as feeding microalgae}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {15(2)}, ' ...
'pages = {727-737}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoheAbdo2020'; type = 'Article'; bib = [ ... 
'author = {Manaffar, R. and Abdolahzadeh, N. and MoosaviToomatari, G. and Zare, S. and Sorgeloos, P. and Bossier, P. and Van Stappen, G.}, ' ... 
'year = {2020}, ' ...
'title = {The growth, survival rate and reproductive characteristics of \emph{Artemia urmiana} fed by \emph{Dunaliella tertiolecta}, \emph{Tetraselmis suecica}, \emph{Nannochloropsis oculata}, \emph{Chaetoceros sp.}, \emph{Chlorella sp.} and \emph{Spirolina sp.} as feeding microalgae}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {19(3)}, ' ...
'pages = {1344-1358}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


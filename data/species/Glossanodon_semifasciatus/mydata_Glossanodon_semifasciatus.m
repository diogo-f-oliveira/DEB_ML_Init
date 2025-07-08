function [data, auxData, metaData, txtData, weights] = mydata_Glossanodon_semifasciatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Argentiniformes'; 
metaData.family     = 'Argentinidae';
metaData.species    = 'Glossanodon_semifasciatus'; 
metaData.species_en = 'Deep-sea smelt'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.1); % in K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 24];

%% set data
% zero-variate data
data.tp = 2*365;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';  
  temp.tp = C2K(14.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(14.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Argentina_sphyraena';

data.Lp = 13;     units.Lp = 'cm';   label.Lp = 'total length at puberty';     bibkey.Lp = 'fishbase';
data.Li = 22.7;     units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 800 mum of Argentina_sphyraena: pi/6*0.08^3';
data.Wwp = 11.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00347*Lp^3.17, see F4';
data.Wwi = 69;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00347*Li^3.17, see F4';

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';         bibkey.GSI = 'SerrMuno2018';
  temp.GSI = C2K(14.1); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% length-length
data.LdL = [ ... % length at t (cm), length at t+dt (cm), dt (d)
2.58 3.16 30
3.93 6.40 30
5.55 9.37 60
4.95 5.91 60];
time.LdL = data.LdL(:,3); data.LdL(:,3)=[]; units.time.LdL = 'd'; label.time.LdL = 'time between lengths';
units.LdL = {'cm', 'cm'}; label.LdL = {'total length at t','total length at t+dt'};  
temp.LdL = C2K(14.1);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Ashi2020'; treat.LdL = {0};

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 14.1 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'bathydemersal;';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.00347*(TL in cm)^3.17';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '3GDB9'; % Cat of Life
metaData.links.id_ITIS = '623381'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Glossanodon_semifasciatus'; % Wikipedia
metaData.links.id_ADW = 'Glossanodon_semifasciatus'; % ADW
metaData.links.id_Taxo = '175034'; % Taxonomicon
metaData.links.id_WoRMS = '272908'; % WoRMS
metaData.links.id_fishbase = 'Glossanodon-semifasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glossanodon}}';
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
bibkey = 'Ashi2020'; type = 'article'; bib = [ ...  
'author = {Kazuya N Ashida}, ' ...
'year = {2020}, ' ...
'title  = {Growth of larval and juvenile deepsea smelt \emph{Glossanodon semifasciatus} in {T}osa {B}ay, on the {P}acific coast of {J}apan}, ' ...
'journal = {Bull. Jpn. Soc. Fish. Oceanogr.}, ' ...
'volume = {84(2)}, ' ...
'pages = {61–70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Glossanodon-semifasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


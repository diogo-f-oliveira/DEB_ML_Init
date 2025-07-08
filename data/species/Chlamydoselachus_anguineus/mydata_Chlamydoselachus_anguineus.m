function [data, auxData, metaData, txtData, weights] = mydata_Chlamydoselachus_anguineus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Hexanchiformes'; 
metaData.family     = 'Chlamydoselachidae';
metaData.species    = 'Chlamydoselachus_anguineus'; 
metaData.species_en = 'Frill shark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIW', 'MPW', 'MPE', 'MAE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 0.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data;
data.ab = 3.5*365;  units.ab = 'd';  label.ab = 'age at birth';               bibkey.ab = 'ADW';    
  temp.ab = C2K(4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data are guessed';
data.am = 60*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 55;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'TanaShio1990';
data.Lp = 135;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ADW'; 
data.Li  = 200;     units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki'; 

data.Wwb = 380;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TanaShio1990'; 

data.Ri  = 10/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'Wiki','ADW'};   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2-22 per clutch, each 2 yr ADW';

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

%% Facts
F1 = 'depths: 100 to 1,300 m';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'ADW'; 
F3 = 'poorly calcified skeleton';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'enormous liver filled with low-density lipids, allowing it to maintain its position in the water column with little effort';
metaData.bibkey.F4 = 'Wiki'; 
F5 = 'It is one of the few sharks with an "open" lateral line';
metaData.bibkey.F5 = 'Wiki'; 
F6 = 'food is cephalopods, bony fishes, and smaller sharks';
metaData.bibkey.F6 = 'Wiki'; 
F7 = 'longest gestation period among vertebrates';
metaData.bibkey.F7 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6,'F7',F7);

%% Links
metaData.links.id_CoL = '5Y8T6'; % Cat of Life
metaData.links.id_ITIS = '159813'; % ITIS
metaData.links.id_EoL = '46560142'; % Ency of Life
metaData.links.id_Wiki = 'Chlamydoselachus_anguineus'; % Wikipedia
metaData.links.id_ADW = 'Chlamydoselachus_anguineus'; % ADW
metaData.links.id_Taxo = '41783'; % Taxonomicon
metaData.links.id_WoRMS = '105831'; % WoRMS
metaData.links.id_fishbase = 'Chlamydoselachus-anguineus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlamydoselachus_anguineus}}';  
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
bibkey = 'TanaShio1990'; type = 'Article'; bib = [ ...  
'author = {Tanaka, S. and Shiobara, Y. and Hioki, S. and Abe, H. and Nishi, G. and Yano, K. and Suzuki, K.}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology of the frilled shark, \emph{Chlamydoselachus anguineus}, from {S}uruga {B}ay, {J}apan}, ' ...
'journal = {Japanese Journal of Ichthyology}, ' ...
'volume = {37}, ' ...
'pages = {273--291}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chlamydoselachus-anguineus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/41794/0}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Chlamydoselachus_anguineus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
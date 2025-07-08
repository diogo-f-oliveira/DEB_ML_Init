function [data, auxData, metaData, txtData, weights] = mydata_Heptranchias_perlo

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Hexanchiformes'; 
metaData.family     = 'Hexanchidae';
metaData.species    = 'Heptranchias_perlo'; 
metaData.species_en = 'Sharpnose sevengill shark'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data;
data.ab = 365;    units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'Teamfish';    
  temp.ab = C2K(4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data re guessed';
data.am = 60*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge: 20 yr';

data.Lb = 25;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'iucn';
data.Lp = 97.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'iucn';
  comment.Lp = 'iucn: for females, 80 cm for males';
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'iucn'; 

data.Wwb = 45;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'naosite';

data.Ri  = 13/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'iucn';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'iucn: 6-20/clutch; one clutch per  yr is assumed';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'Wiki';
F2 = ' Usually captured in 300 to 600 m, but occasionally taken in shallow water, and at depths to 1,000 m.';
metaData.bibkey.F2 = 'iucn';
F3 = 'Eats teleosts and cephalopods, and to a lesser extent on small cartilaginous fishes';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = '6-20/clutch; one clutch per  yr is assumed for this entry';
metaData.bibkey.D1 = 'iucn';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3KX95'; % Cat of Life
metaData.links.id_ITIS = '159844'; % ITIS
metaData.links.id_EoL = '46560146'; % Ency of Life
metaData.links.id_Wiki = 'Heptranchias_perlo'; % Wikipedia
metaData.links.id_ADW = 'Heptranchias_perlo'; % ADW
metaData.links.id_Taxo = '41773'; % Taxonomicon
metaData.links.id_WoRMS = '105832'; % WoRMS
metaData.links.id_fishbase = 'Heptranchias-perlo'; % fishbase


%% References
  bibkey = 'Wiki'; type = 'Misc'; bib = ...
  'howpublished = {\url{http://en.wikipedia.org/wiki/Heptranchias_perlo}}';   
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  
  'author = {Kooijman, S.A.L.M.}, ' ...
  'year = {2010}, ' ...
  'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
  'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
  'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
  'howpublished = {\url{../../../bib/Kooy2010.html}}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'naosite'; type = 'Misc'; bib = ...
  'howpublished = {\url{http://naosite.lb.nagasaki-u.ac.jp/dspace/bitstream/10069/30699/1/suisan42_001.pdf}}';   
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'Teamfish'; type = 'Misc'; bib = ...
  'howpublished = {\url{http://www.teamfishfinders.com/?page_id=460}}';   
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'iucn'; type = 'Misc'; bib = ...
  'howpublished = {\url{http://www.iucnredlist.org/details/41823/0}}';  
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

function [data, auxData, metaData, txtData, weights] = mydata_Pristiophorus_cirratus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Pristiophoriformes'; 
metaData.family     = 'Pristiophoridae';
metaData.species    = 'Pristiophorus_cirratus'; 
metaData.species_en = 'Longnose sawshark'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE  = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 22];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 16]; 

%% set data
% zero-variate data;
data.ab = 365;    units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'AnDiv';    
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data are guessed';
data.ap = 2*365;  units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'AnDiv';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 15*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 32;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'Wiki';
  comment.Lb = '11-15 inch';
data.Lp = 97;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 149;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'iucn';
  comment.Li = 'for females, 132 cm for males';

data.Wwi = 85000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'AnDiv','iucn'}; % for females
  comment.Wwi = 'iucn: 3500 g for males';

data.Ri  = 10/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'Wiki','iucn'};   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2-22 per clutch, each 2 yr AnDiv';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4MJWB'; % Cat of Life
metaData.links.id_ITIS = '551505'; % ITIS
metaData.links.id_EoL = '46560349'; % Ency of Life
metaData.links.id_Wiki = 'Pristiophorus_cirratus'; % Wikipedia
metaData.links.id_ADW = 'Pristiophorus_cirratus'; % ADW
metaData.links.id_Taxo = '106297'; % Taxonomicon
metaData.links.id_WoRMS = '282352'; % WoRMS
metaData.links.id_fishbase = 'Pristiophorus-cirratus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristiophorus_cirratus}}';   % replace my_pet by latin species name
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pristiophorus-cirratus.html}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnDiv'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pristiophorus_cirratus/}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/39327/0}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
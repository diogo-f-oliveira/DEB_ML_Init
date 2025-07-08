function [data, auxData, metaData, txtData, weights] = mydata_Pristis_perotteti

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Pristidae';
metaData.species    = 'Pristis_perotteti'; 
metaData.species_en = 'Largethooth sawfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC','TN'};
metaData.ecoCode.habitat = {'0iMcd','0iMm','0iFe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 31];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 25];                           
metaData.emailmod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.ab = 5*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';    
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp of all data is guessed; ab = for P. microdon';
data.tp = 8.5*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '7-10 yr';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 81;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
 comment.Lb = '72-90 cm';
data.Lp  = 290;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'Wiki'; 
 comment.Lp = 'TL 280-300 cm';
data.Li  = 650;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 591e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';

data.Ri  = 7.3/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7.3 pups per clutch; possibily 1 litter per 2 yr';

% uni-variate data at f
data.LdL = [ ... % total length (cm), change in total length (cm/yr)
 388   1.0
 394   2.8
 377   7.4
 393  -0.5
 372  -4.2
 391 -16.2
 366  19.7
 361  25.0];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert cm/yr to cm/d
units.LdL = {'cm', 'cm/d'};  label.LdL = {'total length','change in  total length'};  
  temp.LdL = C2K(24); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Thor1982';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 10 * weights.LdL;
weights.LdL(data.LdL(:,2) < 0) = 0;
weights.tp = 0 * weights.tp;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
D3 = 'negative growth and age at puberty are ignored in parameter estimation';
D4 = 'mod_1predicted age at birth is much larger than "observed"';
metaData.discussion = struct('D1',D1, 'D2',D2);
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'well-adapted to life in fresh water';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4MK2V'; % Cat of Life
metaData.links.id_ITIS = '160811'; % ITIS
metaData.links.id_EoL = '46560365'; % Ency of Life
metaData.links.id_Wiki = 'Pristis_perotteti'; % Wikipedia
metaData.links.id_ADW = 'Pristis_perotteti'; % ADW
metaData.links.id_Taxo = '184764'; % Taxonomicon
metaData.links.id_WoRMS = '271423'; % WoRMS
metaData.links.id_fishbase = 'Pristis-perotteti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristis_perotteti}}'; 
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
bibkey = 'Thor1982'; type = 'Article'; bib = [ ...  
'author = {Thomas B. Thorson}, ' ...
'year = {1982}, ' ...
'title  = {Life history implications of a tagging study of the largetooth sawfish, \emph{Pristis perotteti}, in the {L}ake {N}icaragua-{R}io {S}an {J}uan {S}ystem}, ' ...
'journal = {Env. Biol. Fish. }, ' ...
'volume = {7(3)}, ' ...
'pages = {207-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pristis_perotteti}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pristis-perotteti.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
  function [data, auxData, metaData, txtData, weights] = mydata_Chasmistes_brevirostris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Chasmistes_brevirostris'; 
metaData.species_en = 'Shortnose sucker'; 

metaData.ecoCode.climate = {'Csb', 'Dsa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {''}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 25]; 


%% set data
% zero-variate data
data.ab = 14;   units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'Wiki';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'this is incubation time for Chasmistes table 13.4 - life history of Chasmiste - time to first feeding is likely a bit longer';
data.tp = mean([5,7])*365;   units.tp = 'd';  label.tp = 'life span';         bibkey.tp = 'WarrBurr2014';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guessed temp and we here took the mean value of age at puberty from table 13.4 - life history of Chasmistes.';
data.am = 44 * 365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'WarrBurr2014';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guessed temp; 44+ years table 13.4 - life history of Chasmiste; the source says 44+, wikipedia say 33 years for this species.';
  
data.Lp = mean([44,49]);  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'WarrBurr2014'; 
    comment.Lp = 'mean value of length at puberty from table 13.4 - life history of Chasmistes.'; 
data.Li = 64;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = {'guess', 'WarrBurr2014'};
  comment.Wwb = 'Computed from egg diameter of 2 mm for genus Chasmistes: pi/6*0.2^3';
data.Wwi = 3096; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
   comment.Wwi = '0.01*Li^3.04, see discussion.';
   
data.Ri = 72500/365;   units.Ri = '#/d';  label.Ri = 'Ultimate reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed, max value from fishbase chosen';

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
D1 = 'weight length relationship: Ww = 0.01 * TL^3.04';
  metaData.bibkey.D1 = 'fishbase';
D2 = 'egg diameter of Chasmistes genus is about 2 mm';
  metaData.bibkey.D2 = 'fishbase';
D3 = 'We use life history data for Chasmistes that were compiled in this book, when no other source was available for this species in particular.';  
  metaData.bibkey.D3 = 'WarrBurr2014';
D4 = 'All temeperatures are assumed to be at 13 deg C. ';  
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);
% 
%% Links
metaData.links.id_CoL = 'TQ6Y'; % Cat of Life
metaData.links.id_ITIS = '163961'; % ITIS
metaData.links.id_EoL = '207086'; % Ency of Life
metaData.links.id_Wiki = 'Chasmistes_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Chasmistes_brevirostris'; % ADW
metaData.links.id_Taxo = '170615'; % Taxonomicon
metaData.links.id_WoRMS = '1020061'; % WoRMS
metaData.links.id_fishbase = 'Chasmistes-brevirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Shortnose_sucker}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fws'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fws.gov/oregonfwo/articles.cfm?id=149489453}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'calfish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://calfish.ucdavis.edu/species/?uid=91&ds=241}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chasmistes-brevirostris.html}}';  
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
 bibkey = 'WarrBurr2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Melvin L. Jr. Warren and Brooks M. Burr}, ' ...
'year = {2014}, ' ...
'title  = {Freshwater Fishes of North America: Volume 1: Petromyzontidae to Catostomidae}, ' ...
'publisher = {JHU Press, Science}, ' ...
'pages = {664}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

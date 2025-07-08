  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinodon_macularius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Cyprinodon_macularius'; 
metaData.species_en = 'Desert pupfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab';  'ap'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'dLb'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine','Bas Kooijman'};                             
metaData.date_subm = [2020 07 26];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromsoe, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 28]; 


%% set data
% zero-variate data
data.ab = 10;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'ucdavis';
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*30;        units.tp = 'd';  label.tp = 'age at puberty';        bibkey.tp = 'bdo';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 3*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'bdo';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 1.5;     units.Lp = 'cm';     label.Lp = 'standard length at puberty';  bibkey.Lp = 'Scho1988';
data.Li = 6.08;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'fishesoftexas';
  comment.Li = 'based on TL 7.6 cm and F2'; 

data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Scho1988';   
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 7.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length weight relationship, see F1';

data.Ri = 800/365;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Scho1988';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '800 eggs per season'; 

data.dLb = 6.4e-3;       units.dLb = 'cm/d';  label.dLb = 'change in length at birth';  bibkey.dLb = 'Scho1988';   
  temp.dLb = C2K(30); units.temp.dLb = 'K'; label.temp.dLb = 'temperature';
  comment.dLb = 'at TL = 4.5 mm (SL 3.6 mm) they can double their length in less than 8 wk: 3.6/54';


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
D1 = 'mean tempetarue is guessed, varies considerably in desert climates';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight length relationship: Ww in g = 0.01072 * (TL in cm)^3.22';
  metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.8 * TL';
  metaData.bibkey.F2 = 'fishbase';
F3 = 'spawning occurs when temp exceeds 20 deg C, from April till October';
  metaData.bibkey.F3 = 'ucdavis';  
F4 = 'can live in sea water (but absent in WoRMS)';
  metaData.bibkey.F4 = 'Scho1988';  
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '33HN4'; % Cat of Life
metaData.links.id_ITIS = '165637'; % ITIS
metaData.links.id_EoL = '1012078'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinodon_macularius'; % Wikipedia
metaData.links.id_ADW = 'Cyprinodon_macularius'; % ADW
metaData.links.id_Taxo = '44507'; % Taxonomicon
metaData.links.id_WoRMS = '1018286'; % WoRMS
metaData.links.id_fishbase = 'Cyprinodon-macularius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyprinodon_macularius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'bdo'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.biologicaldiversity.org/species/fish/desert_pupfish/natural_history.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinodon-macularius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ucdavis'; type = 'Misc'; bib = ...
'howpublished = {\url{http://calfish.ucdavis.edu/species/?uid=28&ds=241}}';
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
bibkey = 'Scho1988'; type = 'Article'; bib = [ ...
'author = {Akkan A. Schoenherr}, ' ...
'year = {1988}, ' ...
'title = {A review of the life hostory and status of the desert pupfish, \emph{Cyprinodon macularius}}, ' ...
'journal = {Bull. Southern California Acad. Sci.}, ' ...
'volume = {87(3)}, '...
'pages = {104-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


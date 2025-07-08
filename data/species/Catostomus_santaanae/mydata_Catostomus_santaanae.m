  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_santaanae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_santaanae'; 
metaData.species_en = 'Santa Ana sucker'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp - 
metaData.data_0     = {'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 24]; 

%% set data
% zero-variate data
data.tp = 0.8 * 365; units.tp = 'd';  label.tp = 'time since birth at puberty';   bibkey.tp = 'WarrBroo2014';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Based on remark that maturity is reached in second summer';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'biodiv';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guessed temp; this seems short, in view of Catostomus platyrhynchus, which lives for 9 yrs';

data.Lh = 0.7;   units.Lh = 'cm'; label.Lh = 'total length at hatch';           bibkey.Lh = 'GreeRoss1970';
data.Lb = 1.48;  units.Lb = 'cm'; label.Lb = 'total length at birth';           bibkey.Lb = 'GreeRoss1970';
data.Lp = 5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'GreeRoss1970'; 
  comment.Lp = 'No females under a length of 49 mm or 2.05 g contained eggs';
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Wiki';

data.Wwb = 5.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Bail1969';
  comment.Wwb = 'Based egg diameter of 2.2 mm of C.catostomus: pi/6*0.22^3';
data.Wwp = 2;  units.Wwp = 'g'; label.Wwp = 'total length at puberty';  bibkey.Wwp = 'GreeRoss1970'; 
  comment.Wwp = 'No females under a length of 49 mm or 2.05 g contained eggs';
data.Wwi = 177.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = {'Wiki', 'fishbase'};
  comment.Wwi = 'Based on 0.01*Li^3.04, see F2';

data.Ri15 = 16151/365;   units.Ri15 = '#/d';  label.Ri15 = 'Reprod rate at TL = 15 cm';    bibkey.Ri15 = 'GreeRoss1970';
  temp.Ri15 = C2K(13); units.temp.Ri15 = 'K'; label.temp.Ri15 = 'temperature';
  comment.Ri15 = 'Fecundity estimates were made from samples of ovaries from six fish ranging in size from 77.8 to 158.2 mm.';

 
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb;
weights.Wwb = 2 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Data point Lb was ignored because of inconsistency with Wwb and it is hard to believe that feeding starts at TL 1.48 cm only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Seasonal water temperatures varies from 10 to 26 C';
metaData.bibkey.F1 = 'GreeRoss1970'; 
F2 = 'Length-weight: wet weight (in g) = 0.01000 * (TL in cm)^3.04';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
% 
%% Links
metaData.links.id_CoL = '69FCL'; % Cat of Life
metaData.links.id_ITIS = '163912'; % ITIS
metaData.links.id_EoL = '994731'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_santaanae'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_santaanae'; % ADW
metaData.links.id_Taxo = '107460'; % Taxonomicon
metaData.links.id_WoRMS = '1526058'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-santaanae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_santaanae}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'biodiv'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.biologicaldiversity.org/species/fish/Santa_Ana_sucker/natural_history.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GreeRoss1970'; type = 'Article'; bib = [ ...  
'author = {David W. Greenfield and Stephen T. Ross and Gary D. Deckert}, ' ...
'year = {1970}, ' ...
'title = {SOME ASPECTS OF THE LIFE HISTORY OF THE {S}ANTA {A}NA SUCKER, \emph{Catostomus (Pantosteus) santaanae} ({S}NYDER)}, ' ... 
'journal = {Calif. Fish and Game}, ' ...
'volume = {56}, '...
'number = {3}, '...
'pages = {166-179}'];
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
bibkey = 'WarrBroo2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Melvin L. Warren and Brooks, M.}, ' ...
'year = {2014}, ' ...
'title  = {Freshwater Fishes of North America: Volume 1: Petromyzontidae to Catostomidae}, ' ...
'publisher = {John Hopkins Univ. Press, Baltimore}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bail1969'; type = 'Article'; bib = [ ...  
'author = {Merryll M. Bailey}, ' ...
'year = {1969}, ' ...
'title = {Age, Growth, and Maturity of the Longnose Sucker \emph{Catostomus catostomus} of Western {L}ake {S}uperior}, ' ... 
'journal = {J. Fish, Res. Brd Canada}, ' ...
'volume = {26}, '...
'pages = {1289--1299}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-santaanae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

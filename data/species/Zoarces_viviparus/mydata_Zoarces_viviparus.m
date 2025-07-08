function [data, auxData, metaData, txtData, weights] = mydata_Zoarces_viviparus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Zoarces_viviparus'; 
metaData.species_en = 'Viviparous eelpout'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am_T'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ww_L'; 'rB_T'; 'R_L'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Vania Freitas'};    
metaData.date_subm = [2009 07 09];              
metaData.email    = {'Vania.Freitas@nioz.nl'};            
metaData.address  = {'NIOZ, Texel'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15];

%% set data
% zero-variate data

data.ab = 90;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Vete1999';   
  temp.ab = C2K(10);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3-4 months, Wiki: 120 d';
data.ap = 265;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = {'Brod2001','Vete1999'};
  temp.ap = C2K(10); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am11 = 4*365;      units.am11 = 'd';    label.am11 = 'life span';        bibkey.am11 = 'Brod2001';   
  temp.am11 = C2K(11);  units.temp.am11 = 'K'; label.temp.am11 = 'temperature'; 
  comment.am11 = 'Wadden Sea';
data.am4 = 8*365;  units.am4 = 'd';    label.am4 = 'life span';               bibkey.am4 = 'Brod2001';   
  temp.am4 = C2K(4.5);  units.temp.am4 = 'K'; label.temp.am4 = 'temperature'; 
  comment.am4 = 'White Sea';
  
data.Lb  = 5.1;    units.Lb  = 'cm';   label.Lb  = 'total length at birth';    bibkey.Lb  = 'Vete1999';  
  comment.Lb = '51--54mm';
data.Lp  = 21.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'Vete1999'; 
  comment.Lp = '185--250 mm';
data.Lpm  = 19;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for male';   bibkey.Lpm  = 'Vete1999'; 
  comment.Lp = '149-231 mm';
data.Li  = 50;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'Veer2009';
data.Lim  = 42;    units.Lim  = 'cm';   label.Lim  = 'ultimate total length for male';   bibkey.Lim  = 'Veer2009';

data.rB11 = 0.001; units.rB11  = '1/d'; label.rB11  = 'von Bertalanffy growth rate'; bibkey.rB11  = 'Brod2001'; 
  temp.rB11 = C2K(11);  units.temp.rB11 = 'K'; label.temp.rB11 = 'temperature'; 
  comment.rB11 = 'Wadden Sea';
data.rB4 = 0.0006; units.rB4  = '1/d'; label.rB4  = 'von Bertalanffy growth rate';  bibkey.rB4  = 'Brod2001'; 
  temp.rB4 = C2K(4.5);  units.temp.rB4 = 'K'; label.temp.rB4 = 'temperature';   
  comment.rB4 = 'White Sea';
  
data.Wwb = 0.46;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Vete1999';
data.Wwp = 27.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for female';    bibkey.Wwp = 'Vete1999';
data.Wwpm = 13.7;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for male';     bibkey.Wwpm = 'Vete1999';
data.Wwi = 510;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'fishbase';
data.Wwim = 315;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';       bibkey.Wwim = 'Veer2009';
   comment.Wwim = 'computed as (42/33)^3 * 153';
data.Ww33 = 153;   units.Ww33 = 'g';   label.Ww33 = 'wet weight at 33 cm';      bibkey.Ww33 = 'Vete1999';

data.R20  = 24/365; units.R20  = '#/d'; label.R20  = 'reprod rate at 20 cm';    bibkey.R20  = 'Witt2009';   
  temp.R20 = C2K(12); units.temp.R20 = 'K'; label.temp.R20 = 'temperature';
data.R33  = 125/365;  units.R33  = '#/d'; label.R33  = 'reprod rate at 33 cm';  bibkey.R33  = 'Vete1999';   
  temp.R33 = C2K(10); units.temp.R33 = 'K'; label.temp.R33 = 'temperature';
  comment.R33 = 'female was 153 g and 5 y-o in Kattegat Sweden';
 
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'abj has been applied since related species show acceleration; foetal development was ignored because of absence of its combination with abj. The effect is probably very small.';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Longest known pregnancy among fish';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5D67P'; % Cat of Life
metaData.links.id_ITIS = '165324'; % ITIS
metaData.links.id_EoL = '46575082'; % Ency of Life
metaData.links.id_Wiki = 'Zoarces_viviparus'; % Wikipedia
metaData.links.id_ADW = 'Zoarces_viviparus'; % ADW
metaData.links.id_Taxo = '44406'; % Taxonomicon
metaData.links.id_WoRMS = '127123'; % WoRMS
metaData.links.id_fishbase = 'Zoarces-viviparus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zoarces_viviparus}}';
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
bibkey = 'Brod2001'; type = 'Phdthesis'; bib = [ ... 
'author = {Brodte, E.}, ' ... 
'year = {2001}, ' ...
'title = {Wachstum und {F}ruchtbarkeit der {A}almutterarten \emph{Zoarces viviparus} ({L}.) und \emph{Pachycara brachycephalum} ({P}appenheim) aus unterschiedlichen klimatischen Regionen.}, ' ...
'school = {University of Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vete1999'; type = 'Article'; bib = [ ... 
'author = {Vetemaa, M.}, ' ... 
'year = {1999}, ' ...
'title = {Reproduction biology of the viviparous blenny (\emph{Zoarces viviparus} {L}.) in {K}attegat}, ' ...
'journal = {Fiskeriverket rapport}, ' ...
'volume = {1999}, ' ...
'pages = {81-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/479}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Witt2009'; type = 'Misc'; bib = [ ...
'author = {Hans Witte}, ' ...
'year = {2009}, ' ...
'note = {(NIOZ), pers. comm.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Veer2009'; type = 'Misc'; bib = [ ...
'author = {Henk van der Veer}, ' ...
'year = {2009}, ' ...
'note = {(NIOZ), pers. comm.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


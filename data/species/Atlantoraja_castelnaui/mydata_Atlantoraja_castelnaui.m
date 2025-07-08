function [data, auxData, metaData, txtData, weights] = mydata_Atlantoraja_castelnaui

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Atlantoraja_castelnaui'; 
metaData.species_en = 'Spotback skate'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 06]; 

%% set data
% zero-variate data;
data.ab = 9*30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(17.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(17.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 27*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(17.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
data.Lp  = 105;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'OddoPatr2007';
data.Lpm  = 91;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'OddoPatr2007';
data.Li  = 132; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwi = 20.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.12, see F1';

data.Ri  = 20/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'OddoPatr2007';   
  temp.Ri = C2K(17.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00501*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JH53'; % Cat of Life
metaData.links.id_ITIS = '564240'; % ITIS
metaData.links.id_EoL = '46560798'; % Ency of Life
metaData.links.id_Wiki = 'Atlantoraja_castelnaui'; % Wikipedia
metaData.links.id_ADW = 'Atlantoraja_castelnaui'; % ADW
metaData.links.id_Taxo = '162570'; % Taxonomicon
metaData.links.id_WoRMS = '279816'; % WoRMS
metaData.links.id_fishbase = 'Atlantoraja-castelnaui'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atlantoraja_castelnaui}}'; 
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
bibkey = 'OddoPatr2007'; type = 'Article'; bib = [ ... 
'author = {Mar\''{i}a C. Oddone and Alberto F. Amorim and Patricia L. Mancini}, ' ...
'year = {2007}, ' ...
'title  = {Reproductive biology of the spotback skate, \emph{Atlantoraja castelnaui} ({R}ibeiro, 1907) ({C}hondrichthyes, {R}ajidae), in southeastern {B}razilian waters}, ' ...
'journal = {Revista de Biologia Marina y Oceanografia}, ' ...
'volume = {43(2)}, ' ...
'pages = {327-334}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Atlantoraja-castelnaui.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


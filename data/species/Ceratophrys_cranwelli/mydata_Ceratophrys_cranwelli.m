function [data, auxData, metaData, txtData, weights] = mydata_Ceratophrys_cranwelli
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ceratophryidae';
metaData.species    = 'Ceratophrys_cranwelli'; 
metaData.species_en = 'Chacoan horned frog'; 

metaData.ecoCode.climate = {'Aw', 'BSh', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 19]; 

%% set data
% zero-variate data

data.am = 10*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess';
data.Li  = 13;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim = 10.8;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'guess';
comment.Lim = 'based on Lim/Li ratio of Ceratophrys_stolzmanni: 13*6.79/8.2';

data.Wwb = 4.9e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OrtiAlme2013';
  comment.Wwb = 'based on egg diameter of 2.11 mm  for Ceratophrys_stolzmanni: pi/6*0.211^3';
data.Wwj = 5.727;   units.Wwj = 'g';   label.Wwj = 'wet weight at metam';   bibkey.Wwj = 'GrayCook2005';
data.Wwi = 500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
data.Wwim = 387;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi';
  
data.Ri  = 8000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on  clutch size Ceratophrys_stolzmanni: (13/8.3)^3*2100';

% uni-variate data
% time-weight
data.tW = [ ... % time since metam (d), wet weight (g)
0.059	5.727
6.864	6.845
13.898	8.333
21.084	10.068
27.884	12.849
35.065	16.185
41.936	20.874];
units.tW   = {'d', 'g'};  label.tW = {'time since metam', 'wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'GrayCook2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;

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
D2 = 'this data determines [p_M] poorly';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Males dig a burrow and make foam nest in it'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SNTB'; % Cat of Life
metaData.links.id_ITIS = '663271'; % ITIS
metaData.links.id_EoL = '337390'; % Ency of Life
metaData.links.id_Wiki = 'Ceratophrys_cranwelli'; % Wikipedia
metaData.links.id_ADW = 'Ceratophrys_cranwelli'; % ADW
metaData.links.id_Taxo = '139182'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ceratophrys+cranwelli'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ceratophrys_cranwelli}}';
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
bibkey = 'GrayCook2005'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1748-1090.2012.00193.x}, ' ...
'author = {Kristine L. Grayson and Leslie W. Cook and M. Jason Todd and D. Pierce and William A. Hopkins and Robert E. Gatten Jr. and Michael E. Dorcas}, ' ...
'year = {2005}, ' ...
'title  = {Effects of prey type on specific dynamic action, growth, and mass conversion efficiencies in the horned frog, \emph{Ceratophrys cranwelli}}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A}, ' ...
'volme = {141}, ' ...
'pages = {298-304}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrtiAlme2013'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1748-1090.2012.00193.x}, ' ...
'author = {D. Ortiz and D. Almeida-Reinoso and A. Coloma}, ' ...
'year = {2013}, ' ...
'title  = {Notes on husbandry, reproduction and development in the {P}acific horned frog \emph{Ceratophrys stolzmanni} ({A}nura: {C}eratophryidae), with comments on its amplexus}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volme = {47}, ' ...
'pages = {151-162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Ceratophrys&where-species=cranwelli}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/337390}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


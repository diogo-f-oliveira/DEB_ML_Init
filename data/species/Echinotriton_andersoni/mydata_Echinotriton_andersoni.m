function [data, auxData, metaData, txtData, weights] = mydata_Echinotriton_andersoni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Echinotriton_andersoni'; 
metaData.species_en = 'Anderson''s crocodile newt'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp 
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 30];

%% set data
% zero-variate data

data.ab = 20;       units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'IgawSuga2013';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 3.4 * 30.5;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'IgawSuga2013';   
  temp.tj = C2K(22.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 210;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 10.3 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(22.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Paramesotriton chinensis, as given by AnAge';
  
data.Lb  = 1.8;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'IgawSuga2013';
data.Lp  = 6;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'guess';
data.Li  = 8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Wiki';
  comment.Li = 'TL 16.9 cm';

data.Wwb = 1.72e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
   comment.Wwb = 'based on egg diameter of 3.2 mm: pi/6*0.32^3';
data.Wwi = 14.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'guess';
   comment.Wwi = 'based on F1 for Paramesotriton hongkongensis, using F1: 10^(-0.99 + 2.39 * log10(Li)';

data.Ri  = 230/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based 0n kap = 0.95';

% univariate data
% time - length for embryo
data.tLe = [ ... age (d), total length (cm)
    8 0.416
    9 0.620 
   10 0.708
   11 0.934
   12 1.022
   13 1.095
   14 1.241
   15 1.277
   16 1.416
   17 1.594
   18 1.594
   19 1.688
   20 1.884]; % hatch
units.tLe  = {'d', 'cm'};  label.tLe = {'age', 'total length'};  
temp.tLe   = C2K(20);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'IgawSuga2013';
comment.tLe = 'measured from photos';

%% set weights for all real data
weights = setweights(data, []);
weights.tLe = 50 * weights.tLe;
weights.tp =  0 * weights.tp;
weights.Ri =  0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M =  5 * weights.psd.p_M;
weights.psd.v =  5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Development of embryo length suggests a delayed onset of development, which has been incorporated';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight for Paramesotriton hongkongensis: log10[body weight in g] = -0.99 + 2.39 * log10[SVL in cm]),';
metaData.bibkey.F1 = 'WingKarr2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DX3P'; % Cat of Life
metaData.links.id_ITIS = '668369'; % ITIS
metaData.links.id_EoL = '1048286'; % Ency of Life
metaData.links.id_Wiki = 'Echinotriton_andersoni'; % Wikipedia
metaData.links.id_ADW = 'Echinotriton_andersoni'; % ADW
metaData.links.id_Taxo = '47348'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Echinotriton+andersoni'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Echinotriton_andersoni}}';
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
bibkey = 'IgawSuga2013'; type = 'article'; bib = [ ...
'doi = {10.3390/ani3030680}, ' ...
'author = {Takeshi Igawa and Hirotaka Sugawara and Miyuki Tado and Takuma Nishitani and Atsushi Kurabayashi and Mohammed Mafizul Islam and Shohei Oumi and Seiki Katsuren and Tamotsu Fujii and Masayuki Sumida}, ' ... 
'year = {2013}, ' ...
'title = {An Attempt at Captive Breeding of the Endangered Newt \emph{Echinotriton andersoni}, from the Central {R}yukyus in {J}apan}, ' ...
'journal = {Animals}, ' ...
'volume = {3}, ' ...
'pages = {680-692}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Echinotriton+andersoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WingKarr2013'; type = 'article'; bib = [ ...
'author = {Vivian Wing Kan Fu and Nancy E. Karraker and David Dudgeon}, ' ... 
'year = {2013}, ' ...
'title = {BREEDING DYNAMICS, DIET, AND BODY CONDITION OF THE {H}ONG {K}ONG NEWT (\emph{Paramesotriton hongkongensis})}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {27}, ' ...
'pages = {1-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


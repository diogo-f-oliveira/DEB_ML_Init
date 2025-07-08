function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_emphaeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_emphaeus'; 
metaData.species_en = 'Puget Sound rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 25];

%% set data
% zero-variate data

data.am = 22*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'KoloOwen2021';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 18;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 22.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 75.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 57e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at 17.9 cm'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(11);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  
% univariate data
% time-length-weight
data.tLW = [ ... % time (d), total length (cm), weight (g)
  365+163  7.7 NaN
  365+173  6.8 NaN
  730+222 15.0 35
  730+223 15.0 46
  730+224 14.8 40
  730+250 13.4 26
 1095+222 16.0 47
 1095+224 13.0 21
 1095+225 16.0 58
 1095+226 16.9 68
 1095+227 17.9 79
 1095+250 14.4 34
 1460+238 17.3 67];
data.tLW(:,1) = data.tLW(:,1) - 300; % set origin at birth
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW   = C2K(11);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Moul1975'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47059335'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_emphaeus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_emphaeus'; % ADW
metaData.links.id_Taxo = '5661542'; % Taxonomicon
metaData.links.id_WoRMS = '1384909'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-emphaeus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_emphaeus}}';
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
bibkey = 'Moul1975'; type = 'article'; bib = [ ... 
'doi = {10.1139/f75-164}, ' ...
'author = {Moulton, L. L.},' ...
'year = {1975}, ' ...
'title = {Life History Observations on the {P}uget {S}ound Rockfish, \emph{Sebastes emphaeus} ({S}tarks, 1911)}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {32(8)}, ' ...
'pages = {1439–1442}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoloOwen2021'; type = 'article'; bib = [ ... 
'doi = {10.1126/science.abg5332}, ' ...
'author = {Sree Rohit Raj Kolora and Gregory L. Owens and Juan Manuel Vazquez and Alexander Stubbs and Kamalakar Chatla and Conner Jainese and Katelin Seeto and Merit McCrea and Michael W. Sandel and Juliana A. Vianna and Katherine Maslenikov and Doris Bachtrog and James W. Orr and Milton Love and Peter H. Sudmant},' ...
'year = {2021}, ' ...
'title = {Origins and evolution of extreme life span in Pacific Ocean rockfishes}, ' ...
'journal = {Science}, ' ...
'volume = {374(6569)}, '...
'pages = {842-847}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-emphaeus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

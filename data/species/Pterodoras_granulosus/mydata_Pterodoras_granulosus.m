  function [data, auxData, metaData, txtData, weights] = mydata_Pterodoras_granulosus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Doradidae';
metaData.species    = 'Pterodoras_granulosus'; 
metaData.species_en = 'Granulated catfish '; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 27];

%% set data
% zero-variate data
data.ab = 6.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'FeitOkad2004';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25.4;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 68;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 348.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02344*Lp^2.97, see F1';
data.Wwi = 6.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02344*Li^2.97, see F1';
 
data.Ri = 4.3e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Synodontis_clarias, weight-corrected fecundity: 20347*6.5e3/309';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), std length (cm)
    1 18.71 17.97
    2 20.56 19.62
    3 23.21 21.06
    4 29.21 27.28
    5 35.19 31.39
    6 39.32 36.47
    7 43.75 37.75
    8 43.03 38.25
    9 47.03 39.83
   10 46.78 40.10];
data.tL_fm(:,1) = (0.8 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
  temp.tL_fm = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'FeitOkad2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02344*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: SL = 0.82 TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4PWJN'; % Cat of Life
metaData.links.id_ITIS = '164204'; % ITIS
metaData.links.id_EoL = '205849'; % Ency of Life
metaData.links.id_Wiki = 'Pterodoras_granulosus'; % Wikipedia
metaData.links.id_ADW = 'Pterodoras_granulosus'; % ADW
metaData.links.id_Taxo = '185470'; % Taxonomicon
metaData.links.id_WoRMS = '1016627'; % WoRMS
metaData.links.id_fishbase = 'Pterodoras-granulosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pterodoras_granulosus}}';  
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
bibkey = 'FeitOkad2004'; type = 'Article'; bib = [ ...
'doi = {10.4025/actascibiolsci.v26i1.1669}, ' ...
'author = {Let\\{i}cia Andrian Feitoza and Edson Kiyoshi Okada and Angela Maria Ambr\''{o}sio}, ' ...
'year = {2004}, ' ...
'title = {Idade e crescimento de \emph{Pterodoras granulosus} ({V}alenciennes, 1833) ({S}iluriformes, {D}oradidae) no reservat\''{o}rio de {I}taipu, {E}stado do {P}aran\''{a}, {B}rasil}, ' ... 
'journal = {Acta Scientiarum. Biological Sciences}, ' ...
'volume = {26(1)}, '...
'pages = {47-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pterodoras-granulosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Archosargus_rhomboidalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Archosargus_rhomboidalis'; 
metaData.species_en = 'Western Atlantic seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 05];

%% set data
% zero-variate data

data.am = 2*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 33;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 10; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02042*Lp^2.98, see F1';
data.Wwi = 684; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02042*Li^2.98, see F1';

data.Ri  = 485*684/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

 % univariate data
 % time-length
 data.tL = [ ... % time since birth (yr), std length (cm)
0.155	2.934
0.184	3.459
0.223	3.830
0.248	4.479
0.334	6.764
0.350	7.290
0.388	7.784
0.394	8.649
0.494	10.625
0.501	8.741
0.542	9.946
0.666	11.923
0.715	13.158];    
data.tL(:,1) = 365 * (data.tL(:,1) + 0);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL   = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL = 'PaulYane2012'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02042*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5W28G'; % Cat of Life
metaData.links.id_ITIS = '169190'; % ITIS
metaData.links.id_EoL = '46579985'; % Ency of Life
metaData.links.id_Wiki = 'Archosargus_rhomboidalis'; % Wikipedia
metaData.links.id_ADW = 'Archosargus_rhomboidalis'; % ADW
metaData.links.id_Taxo = '161586'; % Taxonomicon
metaData.links.id_WoRMS = '159239'; % WoRMS
metaData.links.id_fishbase = 'Archosargus-rhomboidalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Archosargus_rhomboidalis}}';
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
bibkey = 'PaulYane2012'; type = 'incollection'; bib = [ ... 
'publisher = {Wiley-Blackwell}, ' ...
'author = {Daniel Pauly and Alejandro Y\''{a}\~{n}ez-Arancibia}, ' ... 
'editor = {John W. Day and Byron C. Crump and W. Michael Kemp,\ and Alejandro Y\''{a}\˜{n}ez-Arancibia}, ' ...
'year = {2012}, ' ...
'title = {FISHERIES IN LAGOON-ESTUARINE ECOSYSTEMS}, ' ...
'booktitle = {Estuarine Ecology}, ' ...
'chapter = {18}, ' ...
'pages = {465-482}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Archosargus-rhomboidalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

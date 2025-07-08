function [data, auxData, metaData, txtData, weights] = mydata_Etropus_crossotus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cyclopsettidae';
metaData.species    = 'Etropus_crossotus'; 
metaData.species_en = 'Fringed flounder'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPE','MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.7); % K

metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 14];

%% set data
% zero-variate data;

data.ab = 5;      units.ab = 'd';      label.ab = 'time at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(25.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';        
data.am = 4*365;       units.am = 'd';    label.am = 'life span';             bibkey.am = 'Reic2013';   
  temp.am = C2K(25.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '3-5 yrs';
  
data.Lp  = 6.3;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 21.3;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght for females';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Reic2013';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 2.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 109;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.10, see F1';

data.Ri  = 587500/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Reic2013';   
 temp.Ri = C2K(25.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since Jan 1 (d), total length (cm)
164.559	6.027
196.652	7.807
226.389	8.360
259.381	9.091
286.792	9.554
321.624	9.675
365+14.680	9.993
365+46.294	11.247
365+73.701	11.536
365+106.216	11.829
365+165.686	12.848
365+198.206	13.316
365+291.086	13.493];
data.tL(:,1) = data.tL(:,1)+70; % convert mnth to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SancYane2008';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

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
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BMC9'; % Cat of Life
metaData.links.id_ITIS = '172729'; % ITIS
metaData.links.id_EoL = '46570488'; % Ency of Life
metaData.links.id_Wiki = 'Etropus'; % Wikipedia
metaData.links.id_ADW = 'Etropus_crossotus'; % ADW
metaData.links.id_Taxo = '174186'; % Taxonomicon
metaData.links.id_WoRMS = '158799'; % WoRMS
metaData.links.id_fishbase = 'Etropus-crossotus'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etropus}}';
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
bibkey = 'SancYane2008'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.seares.2007.12.002}, ' ...
'author = {Patricia S\''{a}nchez-Gil and Alejandro Y\''{a}\~{n}ez-Arancibia and Margarito Tapia and John W. Day and Charles A. Wilson and James H. Cowan}, ' ...
'year = {2008}, ' ...
'title = {Ecological and biological strategies of \emph{Etropus crossotus} and \emph{Citharichthys spilopterus} ({P}leuronectiformes: {P}aralichthyidae) related to the estuarine plume, {S}outhern {G}ulf of {M}exico}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {59}, ' ...
'pages = {173–185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Reic2013'; type = 'misc'; bib = [ ... 
'author = {Marcel Reichert}, ' ...
'year = {2013}, ' ...
'title = {Fringed flounder, \emph{Etropus crossotus}}, ' ...
'howpublisged = {\url{https://www.dnr.sc.gov/swap/supplemental/marine/fringedflounder2015.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Etropus-crossotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


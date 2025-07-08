function [data, auxData, metaData, txtData, weights] = mydata_Dentex_congoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Dentex_congoensis'; 
metaData.species_en = 'Congo dentex'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 08];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(14.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(14.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Dentex dentex';

data.Lp  = 15;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';  
data.Li  = 50;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 50.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based in 0.01380*Lp^3.03, see F1';
data.Wwi = 1940;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01380*Li^3.03, see F1';

data.Ri  = 761e3/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
temp.Ri = C2K(14.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Diplodus sargus, weight-specifically';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
269.948	13.264
359.930	16.240
395.417	17.231
365+55.764	17.851
365+121.667	19.463
365+149.549	20.702
365+182.500	19.835
365+399.219	23.306
730+59.566	23.926
730+242.066	25.041
730+361.198	26.033];
data.tL(:,1) = 80 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(14.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AmpoAsie2023';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01380*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34TT5'; % Cat of Life
metaData.links.id_ITIS = '647936'; % ITIS
metaData.links.id_EoL = '46579935'; % Ency of Life
metaData.links.id_Wiki = 'Dentex'; % Wikipedia
metaData.links.id_ADW = 'Dentex_congoensis'; % ADW
metaData.links.id_Taxo = '172981'; % Taxonomicon
metaData.links.id_WoRMS = '273961'; % WoRMS
metaData.links.id_fishbase = 'Dentex-congoensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentex}}';
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
bibkey = 'AmpoAsie2023'; type = 'Article'; bib = [ ... 
'author = {Amponsah, S. and B. Asiedu and N.C. Amarquaye and E. Ofori-Boateng and N.A. Afranewaa and S. Henneh}, ' ... 
'year = {2023}, ' ...
'title = {Population dynamics of seabreams (\emph{Pagrus caeruleostictus}, \emph{Pagellus bellottii}, \emph{Dentex angolensis} and \emph{Dentex congoensis}) from the coast of {G}hana, {W}est {A}frica}, ' ...
'journal = {Journal of Marine Sciences and Fisheries}, ' ...
'volume = {6(1)}, ' ...
'pages = {24-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Dentex-congoensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

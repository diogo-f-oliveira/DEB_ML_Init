function [data, auxData, metaData, txtData, weights] = mydata_Gila_cypha

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gila_cypha'; 
metaData.species_en = 'Humpback chub'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ah'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 28];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 29]; 

%% set data
% zero-variate data

data.ah = mean([102,149])/24;   units.ah = 'd';  label.ah = 'age at hatch';  bibkey.ah = 'Hamm1982';   
  temp.ah = C2K(21.5); units.temp.ah = 'K'; label.temp.ah = 'temperature'; 
data.tp = 2 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'natureserve';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = 'source says adults are at least 2-3 years old';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'natureserve';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guessed, report says several years';
  
data.Lb = mean([6.7,7.4])/10;  units.Lb = 'cm'; label.Lb = 'standard length at birth'; bibkey.Lb = 'Hamm1982';
  comment.Lb = 'length at hatch actually';
data.Li = 41;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'Hamm1982'; 
  comment.Li = 'fishbase says Li of males in 38, we here take the max female TL from this study';
  
data.Wwb = mean([2.8,4.2]) * 1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Hamm1982';
  comment.Wwb = 'wet weight at hatch actually';
data.Wwi = 716;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';          bibkey.Wwi = {'fishbase', 'guess'};
  comment.Wwi = '0.00813 * 38^3.13, see discussion ';
  
data.RL = 5445/365; units.RL = '#/d';  label.RL = 'ultimate reprod rate';  bibkey.RL = 'Hamm1982';
  temp.RL = C2K(13); units.temp.RL = 'K'; label.temp.RL = 'temperature';
  comment.RL = 'fecundity of 40.6 TL female, temp is a guessed average of what an individaul experiences in a year';
     
% % univariate data
 
% time-length
data.tL = [ ... % days post hatch, total length (mm)
0, 7, 14, 21, 28, 35, 42, 49,56;
7.1, 10.2, 10.7, 12, 15.2, 22.4, 30.3, 33.3, 36.9
]';
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(mean([12.8,25.5]));  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hamm1982'; comment.tL = 'Little colorado river progeny';
%  
% time-weight
data.tWw = [ ... % time since hatch (d), wet weight (mg)
0, 7, 14, 21, 28, 35, 42, 49, 56;
3.9, 5.1, 6.9, 14.3, 33.8, 101, 309.1, 393.2, 588.5
]';
data.tWw(:,2) = data.tWw(:,2) * 1e-3; % convert mg to g
units.tWw = {'d', 'g'}; label.tWw = {'time since hatch', 'wet weight'};  
temp.tWw = C2K(mean([12.8,25.5]));  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Hamm1982'; comment.tWw = 'Little colorado river progeny';

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

%% Facts
F1 = 'originally native to fast waters of the Colorado River system in the United States.';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1', F1); 
% 
%% Discussion points
D1 = 'weight length relationship: Ww in g = 0.00813 * (TL in cm)^3.13';
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3G2G6'; % Cat of Life
metaData.links.id_ITIS = '163551'; % ITIS
metaData.links.id_EoL = '207311'; % Ency of Life
metaData.links.id_Wiki = 'Gila_cypha'; % Wikipedia
metaData.links.id_ADW = 'Gila_cypha'; % ADW
metaData.links.id_Taxo = '174938'; % Taxonomicon
metaData.links.id_WoRMS = '1014367'; % WoRMS
metaData.links.id_fishbase = 'Gila-cypha'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Humpback_chub}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Gila-cypha.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'natureserve'; type = 'Misc'; bib = ...
'howpublished = {\url{https://explorer.natureserve.org/Taxon/ELEMENT_GLOBAL.2.102735/Gila_cypha}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Hamm1982'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Roger L. Hamman}, ' ...
'year = {1982}, ' ...
'title  = {Spawning and Culture of Humpback Chub}, ' ...
'journal = {The Progressive Fish Culturist}, ' ...
'pages = {213--216}, ' ...
'volume = {44}, ' ...
'doi = {10.1577/1548-8659(1982)44[213:SACOHC]2.0.CO;2}, ' ...
'number = {4}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'BookQ'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

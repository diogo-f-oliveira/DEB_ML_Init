function [data, auxData, metaData, txtData, weights] = mydata_Gila_elegans

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gila_elegans'; 
metaData.species_en = 'Bonytail chub'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'RL'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

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
% 
data.ab = mean([170,269])/24;   units.ab = 'd';  label.ab = 'age at birth';  bibkey.ab = 'Hamm1982b';   
  temp.ab = C2K(16.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'average age at hatch actually';
data.tp = 2 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on gila cypha';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 62;    units.Li = 'cm'; label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';

data.Wwb = 2.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Hamm1982b';
comment.Wwb = 'average wet weight at hatch actually';
data.Wwi = 3.3e3;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';     bibkey.Wwi = {'fishbase', 'guess'};
   comment.Wwi = '0.00813 * 62^3.13, see discussion';
   
data.RL = 37700/365; units.RL = '#/d';  label.RL = 'ultimate reprod rate';   bibkey.RL = 'Hamm1982b';
  temp.RL = C2K(21); units.temp.RL = 'K'; label.temp.RL = 'temperature';
  comment.RL = 'fecundity of 51.8 TL female, temp is a guessed average of what an individaul experiences in a year';
     
% univariate data
% time-length
data.tL = [ ... % days post hatch, total length (mm)
0, 7, 14, 21, 28, 35, 42, 49,56, 63, 70;
6.8, 8.2, 9.7, 11.5, 18.1, 20.2, 31.1, 36.1, 38.8, 43.6, 49.5
]';
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(mean([12.8,25.5]));  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hamm1982b'; comment.tL = 'time since hatch actually';
% 
% time-weight
data.tWw = [ ... % time since hatch (d), wet weight (mg)
0, 7, 14, 21, 28, 35, 42, 49,56, 63, 70;
2.8, 3.6, 6.4, 8.7, 48, 76.4, 278.2, 448.7, 692.8, 740.7, 974.6]';
data.tWw(:,2) = data.tWw(:,2) * 1e-3; % convert mg to g
units.tWw = {'d', 'g'}; label.tWw = {'time since hatch', 'wet weight'};  
temp.tWw = C2K(mean([12.8,25.5]));  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Hamm1982b';


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
F1 = 'once found in the Colorado RLver basin in many U.S. states, including Arizona, California, Colorado, Nevada, New Mexico, Utah and Wyoming';
metaData.bibkey.F1 = 'Wiki';
F2 = 'habitat: backwaters with rocky or muddy bottoms and flowing pools,';
metaData.bibkey.F2 = 'Wiki';
F3 = 'the optimum temperature for reproduction is believed to be 20-21 deg C';
metaData.bibkey.F3 = 'Hamm1982b';
metaData.facts = struct('F1', F1, 'F2', F2, 'F3', F3); 

%% Discussion points
D1 = 'weight length relationship: Ww in g = 0.00813 * (TL in cm)^3.13';
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3G2G8'; % Cat of Life
metaData.links.id_ITIS = '163553'; % ITIS
metaData.links.id_EoL = '207316'; % Ency of Life
metaData.links.id_Wiki = 'Gila_elegans'; % Wikipedia
metaData.links.id_ADW = 'Gila_elegans'; % ADW
metaData.links.id_Taxo = '174940'; % Taxonomicon
metaData.links.id_WoRMS = '1021645'; % WoRMS
metaData.links.id_fishbase = 'Gila-elegans'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Bonytail_chub}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gila/elegans.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Hamm1982b'; type = 'article'; bib = [ ...  
'author = {Roger L. Hamman}, ' ...
'year = {1982}, ' ...
'title  = {Induced Spawning and Culture of Bonytail Chub}, ' ...
'journal = {The Progressive Fish Culturist}, ' ...
'pages = {201--203}, ' ...
'volume = {44}, ' ...
'doi = {10.1577/1548-8659(1982)44[201:ISACOB]2.0.CO;2}, ' ...
'number = {4}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  

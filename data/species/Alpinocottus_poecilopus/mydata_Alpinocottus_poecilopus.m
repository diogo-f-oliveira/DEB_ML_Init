function [data, auxData, metaData, txtData, weights] = mydata_Alpinocottus_poecilopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Alpinocottus_poecilopus'; 
metaData.species_en = 'Alpine bullhead'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFr','biFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 30];

%% set data
% zero-variate data

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Clinocottus_analis';
  
data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwi = 36; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00676*Li^3.17, see F1'; 

data.Ri = 1e3/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Clinocottus_analis';

% uni-variate data
% time-length
data.tL = [ ... % age (years), total length (cm) 
    0 2.0
    1 3.4
    2 5.5
    3 6.8
    4 7.8
    5 8.4
    6 8.6
    7 8.8
    8 8.6]; 
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HestHegg2004'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYKC'; % Cat of Life
metaData.links.id_ITIS = '167260'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Cottus_poecilopus'; % Wikipedia
metaData.links.id_ADW = 'Cottus_poecilopus'; % ADW
metaData.links.id_Taxo = '44973'; % Taxonomicon
metaData.links.id_WoRMS = '127197'; % WoRMS
metaData.links.id_fishbase = 'Alpinocottus-poecilopus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alpinocottus_poecilopus}}';
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
bibkey = 'HestHegg2004'; type = 'incollection'; bib = [ ...
'author = {Trygve Hesthagen and Ola Hegge and Jostein Skurdal and B{\o}rre K. Dervo}, ' ... 
'year = {2004}, ' ...
'title = {Age and growth of {S}iberian sculpin (\emph{Cottus poecilopus}) and young brown trout (\emph{Salmo trutta}) in a subalpine {N}orwegian river}, ' ...
'booktitle = {The Atna River: Studies in an Alpine-Boreal Watershed}, ' ...
'editor = {O. T. Sandlund and K. Aagaard}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {521}, ' ...
'pages = {107-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alpinocottus-poecilopus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


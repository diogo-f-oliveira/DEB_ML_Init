function [data, auxData, metaData, txtData, weights] = mydata_Ophryotrocha_labronica

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Polychaeta'; 
metaData.order      = 'Eunicida'; 
metaData.family     = 'Dorvilleidae';
metaData.species    = 'Ophryotrocha_labronica'; 
metaData.species_en = 'Worm'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 29]; 

%% set data
% zero-variate data

data.tp = 27;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Akes1970';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 4*30.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Akes1970';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on reproductiuve period of 3 months';

data.Lp = 0.28;   units.Lp = 'cm';   label.Lp = 'length at pubert';  bibkey.Lp = 'Akes1970';
data.Li = 0.49;   units.Li = 'cm';  label.Li = 'ultimate length';  bibkey.Li = 'Akes1970';

data.Wwb = 9e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'EoL';
  comment.Wwb = 'based on guessed egg diameter of 100 mum: pi/6*0.012^3';
data.Wwi = 1e-3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'Akes1970';
  comment.Wwi = 'based on volume estimate from photo: length 0.49 cm, diameter 0.05 cm: 0.49*pi/4*0.05^2';

data.Ri = 120/14;    units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'Akes1970';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), length (cm)
9.931	0.125
13.052	0.156
16.936	0.209
19.988	0.246
23.908	0.272
26.994	0.283];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Akes1970';
comment.tL = 'food: powder made from frozen, dried spinach';
%
data.tL1 = [ ... % time since birth (d), length (cm)
6.914	0.083
11.006	0.133
14.038	0.177
18.123	0.254
21.070	0.269
25.113	0.329];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'length'};  
temp.tL1    = C2K(20);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Akes1970';
comment.tL1 = 'Food: fragments scraped from a frozen block of spinach';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for spinach powder, scrapings'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '74QPS'; % Cat of Life
metaData.links.id_ITIS = '66506'; % ITIS
metaData.links.id_EoL = '467939'; % Ency of Life
metaData.links.id_Wiki = 'Ophryotrocha'; % Wikipedia
metaData.links.id_ADW = 'Ophryotrocha_labronica'; % ADW
metaData.links.id_Taxo = '498641'; % Taxonomicon
metaData.links.id_WoRMS = '130027'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ophryotrocha}}';
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
bibkey = 'Akes1970'; type = 'Article'; bib = [ ... 
'author = {B. \o{A}kesson}, ' ... 
'year = {1970}, ' ...
'title = {\emph{Ophryotrocba labronica} as test animal for the study of marine pollution}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters}, ' ...
'volume = {20}, ' ...
'pages = {293-303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/467939}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

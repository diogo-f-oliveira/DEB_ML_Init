function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_carinata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_carinata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi','TA','TO'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L'; 't-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 15]; 

%% set data
% zero-variate data

data.ab = 1.2;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'NavaMich1971';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.5;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'NavaMich1971';   
  temp.tp = C2K(30);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on tLR data';
data.am = 24;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'NavaMich1971';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.13; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'NavaMich1971';
data.Lp  = 0.24; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'NavaMich1971';
data.Li  = 0.46; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NavaMich1971';
  comment.Li = 'based on tL data';
  
data.Wdi  = 878;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(42/37)^3';

% uni-variate data
% time-length-reprod
data.tLR = [ ... % time since birth (h), length (mm)
   0.0 1.3  0
   1.2 1.5  0
   2.0 1.8  0
   3.0 2.0  0
   4.3 2.2  0
   4.5 2.5  4.0
   6.2 2.6  7.5
   8.3 2.8 10.8
   9.5 3.1 15.8
  12.0 3.2 24.3
  13.5 3.4 31.7
  15.7 3.7 35.3
  19.0 3.8 13.0];
data.tLR(:,2) = data.tLR(:,2)/ 10; % convert mm to cm
data.tLR(:,3) = cumsum(data.tLR(:,3)); % convert # per brood to cum reprod
units.tLR  = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cumulative # of eggs'};  
temp.tLR   = C2K(29); units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'NavaMich1971'; treat.tLR = {1 {'length','cum reprod'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLR = 5 * weights.tLR; 

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
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3459L'; % Cat of Life
metaData.links.id_ITIS = '83881'; % ITIS
metaData.links.id_EoL = '65484161'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_carinata'; % ADW
metaData.links.id_Taxo = '143805'; % Taxonomicon
metaData.links.id_WoRMS = '1302471'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NavaMich1971'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf03045311}, ' ...
'author = {P. Navaneethakrishnan and R. George Michael}, ' ... 
'year = {1971}, ' ...
'title = {Egg production and growth in \emph{Daphnia carinata} {K}ing}, ' ...
'journal = {Proc. Indian Acad. Sci. (Anim. Sci.)}, ' ...
'volume = {73(3)}, ' ...
'pages = {117–123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

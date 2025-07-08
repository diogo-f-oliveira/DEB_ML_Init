function [data, auxData, metaData, txtData, weights] = mydata_Eubranchipus_oregonus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Eubranchipus_oregonus'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 28]; 

%% set data
% zero-variate data

data.tp = 34;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 24*7;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Coop1950';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.115; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 1.2;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 2.7;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Coop1950';
  
data.Wdi  = 0.0335;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.7/1)^3';

data.Ri  = 25/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on E. bundyi: 25 eggs per brood, guess one brood each 2 d';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), length (cm)
  9.944	0.522 NaN
 15.670	0.876 NaN
 34.934	1.129 1.11
 50.717	1.408 1.38
 67.670	1.630 1.56
 78.092	1.666 1.57
 94.704	1.656 1.56
108.223	1.656 NaN
135.174	2.111 NaN
162.878	2.663 NaN];
data.tL_fm(:,1) = data.tL_fm(:,1) + 5; % set origin at birth
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'length'};  
temp.tL_fm = [ ...
  8.324	 9.11
 15.368	 4.35
 36.112	10.28
 50.912	 4.00
 66.322	 6.08
 79.041	 7.54
 93.273	10.63
107.943	11.04
134.228	10.08
162.300	16.56]; 
units.temp.tL_fm = {'d','C'}; label.temp.tL_fm = {'time','temperature'}; 
treat.tL_fm = {1 {'females','males'}};
bibkey.tL_fm = 'Coop1950'; %label.treat.tL_fm = 'gender';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm; 

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
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males as assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7TLWG'; % Cat of Life
metaData.links.id_ITIS = '83721'; % ITIS
metaData.links.id_EoL = '338956'; % Ency of Life
metaData.links.id_Wiki = 'Eubranchipus_oregonus'; % Wikipedia
metaData.links.id_ADW = 'Eubranchipus_oregonus'; % ADW
metaData.links.id_Taxo = '376520'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

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
bibkey = 'Coop1950'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3223401}, ' ...
'author = {Raymond W. Coopey}, ' ... 
'year = {1950}, ' ...
'title = {The Life History of the Fairy Shrimp \emph{Eubranchipus oregonus}}, ' ...
'journal = {Transactions of the American Microscopical Society}, ' ...
'volume = {69(2)}, ' ...
'pages = {125–132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

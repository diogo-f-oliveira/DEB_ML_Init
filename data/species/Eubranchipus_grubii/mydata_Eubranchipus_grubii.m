function [data, auxData, metaData, txtData, weights] = mydata_Eubranchipus_grubii
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Eubranchipus_grubii'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'C','D'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 19]; 

%% set data
% zero-variate data

data.am = 45;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Kall1955';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.105; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Kall1955';
data.Lp  = 0.65;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Kall1955';
data.Li  = 2.95;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Kall1955';
  
data.Wdi  = 0.0127;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Dabo1976';
  comment.Wdi = 'based on F1 for Eubranchipus bundyi and Li';

data.Ri  = 800/20;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '800 eggs in 20 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm),2 food types
 0.000	0.115 0.107
 4.298	0.213 0.162
 8.378	0.335 0.256
12.625	0.501 0.398
16.917	0.766 0.604
21.079	1.185 0.912
25.262	1.407 1.078
29.335	1.596 1.228
33.760	1.691 1.334
38.132	1.749 1.405
42.448	1.792 1.412
46.540	1.807 NaN
50.859	1.827 NaN];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = C2K(12); units.temp.tL = {'d','C'}; label.temp.tL = 'temperature'; 
bibkey.tL = 'Kall1955'; treat.tL = {1 {'algae+yeast','detritus'}};
label.treat.tL = 'food types'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.Li = 5 * weights.Li; 

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
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};
 
%% Discussion points
D1 = 'males are assumed not to differ from females';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight dry weight Wd in mug = 3.08*(length im mm)^2.46';
metaData.bibkey.F1 = 'Dabo1976'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7TLWM'; % Cat of Life
metaData.links.id_ITIS = '624259'; % ITIS
metaData.links.id_EoL = '327100'; % Ency of Life
metaData.links.id_Wiki = 'Eubranchipus'; % Wikipedia
metaData.links.id_ADW = 'Eubranchipus_grubii'; % ADW
metaData.links.id_Taxo = '807162'; % Taxonomicon
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
bibkey = 'Kall1955'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00407604}, ' ...
'author = {Kallinowsky, H.}, ' ... 
'year = {1955}, ' ...
'title = {\"{U}ber den einfluss exogener faktoren (ern\"{a}hrung, temperatur, lebensraum) auf wachstum, k\"{o}rpergr\"{o}sse und lebensdauer von \emph{Chirocephalus Grubei} {D}yb}, ' ...
'journal = {Z. Morph. u. Okol. Tiere}, ' ...
'volume = {44}, ' ...
'pages = {196–221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Dabo1976'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z76-021}, ' ...
'author = {Daborn, Graham R.}, ' ... 
'year = {1976}, ' ...
'title = {The life cycle of \emph{Eubranchipus bundyi} ({F}orbes) ({C}rustacea: {A}nostraca) in a temporary vernal pond of Alberta}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {54(2))}, ' ...
'pages = {193–201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%


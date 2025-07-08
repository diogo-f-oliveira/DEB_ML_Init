function [data, auxData, metaData, txtData, weights] = mydata_Eubranchipus_serratus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Eubranchipus_serratus'; 
metaData.species_en = 'Ethologist fairy shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 28]; 

%% set data
% zero-variate data

data.tp = 10;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DextFerg1943';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 65;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'DextFerg1943';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'DextFerg1943';
data.Lp  = 0.34;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'DextFerg1943';
data.Li  = 1.5;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'DextFerg1943';
  
data.Wwb  = 2.65e-5;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Belk1977';
  comment.Wwb = 'based on egg diameter of 0.37 mm: pi/6*0.037^3';
data.Wdi  = 0.0057;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.5/1)^3';

data.Ri  = 25/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on E. bundyi: 25 eggs per brood, guess one brood each 2 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm)
0.223	0.080
1.615	0.106
8.783	0.183
15.535	0.342
19.733	0.560
26.312	0.982
34.062	1.376
40.251	1.345
48.604	1.494
55.210	1.393
63.514	1.220];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = [ ...
0.044	3.069
1.235	4.092
5.188	4.217
15.655	10.948
19.102	6.085
27.283	10.131
33.984	15.116
39.694	4.877
47.723	12.761
55.369	10.027
62.738	16.718
66.776	22.088]; 
units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'}; 
bibkey.tL = 'DextFerg1943'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL; 
weights.Lb = 0 * weights.Lb; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7TLWJ'; % Cat of Life
metaData.links.id_ITIS = '83723'; % ITIS
metaData.links.id_EoL = '338992'; % Ency of Life
metaData.links.id_Wiki = 'Eubranchipus_serratus'; % Wikipedia
metaData.links.id_ADW = 'Eubranchipus_serratus'; % ADW
metaData.links.id_Taxo = '376522'; % Taxonomicon
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
bibkey = 'DextFerg1943'; type = 'Article'; bib = [ ... 
'author = {Ralph W. Dexter and M. S. Ferguson}, ' ... 
'year = {1943}, ' ...
'title = {Life History and Distributional Studies on \emph{Eubranchipus serratus} {F}orbes (1876)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {29(1)}, ' ...
'pages = {210-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Belk1977'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3670467}, ' ...
'author = {Denton Belk}, ' ... 
'year = {1977}, ' ...
'title = {Evolution of Egg Size Strategies in Fairy Shrimps}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {22(1)}, ' ...
'pages = {99–105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

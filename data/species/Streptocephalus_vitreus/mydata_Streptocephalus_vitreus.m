function [data, auxData, metaData, txtData, weights] = mydata_Streptocephalus_vitreus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Streptocephalidae';
metaData.species    = 'Streptocephalus_vitreus'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 20]; 

%% set data
% zero-variate data

data.ab = 30/24;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 14;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Hild1985';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Hild1985';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wdb  = 1e-6;  units.Wdb  = 'g'; label.Wdb  = 'dry weight at birth'; bibkey.Wdb  = 'Hild1985';
  comment.Wdb = 'based on egg diameter of 0.23 mm: pi/6*0.023^3*0.17';
data.Wdp  = 440e-6;  units.Wdp  = 'g'; label.Wdp  = 'dry weight at puberty'; bibkey.Wdp  = 'Hild1985';
data.Wdi  = 0.0013;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Hild1985';

data.Ri  = 4*42/16; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri = 'Hild1985';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '42 eggs per brood, 4 broods assumed in 14 d';

% uni-variate data
% time-dry weight
data.tWd = [ ... % time since birth (d), dry weight (mug)
2.719	6.042
4.856	21.546
6.811	57.807
8.858	165.831
10.731	243.492
13.822	451.676
16.913	810.257
18.975	1150.403
21.139	1111.169
23.110	1334.450
26.215	1245.829
29.225	1182.798];
units.tWd = {'d', 'mug'}; label.tWd = {'time since birth', 'dry weight'};  
temp.tWd = C2K(20); units.temp.tWd = 'K'; label.temp.tWd = 'temperature'; 
bibkey.tWd = 'Hild1985'; comment.tWd = 'females under winter conditions';

%% set weights for all real data
weights = setweights(data, []);
weights.tWd = 5 * weights.tWd; 
weights.Wdb = 3 * weights.Wdb; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WXPT'; % Cat of Life
metaData.links.id_ITIS = '624231'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Streptocephalus'; % Wikipedia
metaData.links.id_ADW = 'Streptocephalus_vitreus'; % ADW
metaData.links.id_Taxo = '948471'; % Taxonomicon
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
bibkey = 'Hild1985'; type = 'Article'; bib = [ ... 
'author = {A. G. Hildrew}, ' ... 
'year = {1985}, ' ...
'title = {A QUANTITATIVE STUDY OF THE LIFE HISTORY OF A FAIRY SHRIMP ({B}RANCHIOPODA: {A}NOSTRACA) IN  RELATION TO THE TEMPORARY NATURE OF ITS HABITAT, A {K}ENYAN RAINPOOL}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {54}, ' ...
'pages = {99-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

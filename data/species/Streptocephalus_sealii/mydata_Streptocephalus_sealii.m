function [data, auxData, metaData, txtData, weights] = mydata_Streptocephalus_sealii
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Streptocephalidae';
metaData.species    = 'Streptocephalus_sealii'; 
metaData.species_en = 'Spiny-tailed fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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

data.ab = 30/24;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Moor1955';
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 40;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Moor1955';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 120;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Moor1955';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.6;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Moor1955';
  comment.Lp = 'based on tp and tL data';
data.Li  = 2.00; units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'Moor1955';
  comment.Li = 'based on tL data';
data.Lim = 2.10; units.Lim = 'cm'; label.Lim  = 'ultimate total length for males'; bibkey.Lim = 'Moor1955';
  comment.Li = 'based on tL data';
  
data.Wwb  = 2.06e-5;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Belk1977';
  comment.Wwb = 'based on egg diameter of 0.34 mm: pi/6*0.034^3';
data.Wdi  = 0.0136;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based on Arteria salina: 0.0017*(2.00/1)^3';

data.Ri  = 4*450/60; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri = 'Moor1955';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '450 eggs per brood, 4 broods assumed in 60 d';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
0.140	0.047
4.915	0.309
10.252	0.652
16.010	0.851
24.999	1.038
37.779	1.115
48.733	1.558
65.727	1.781
95.501	1.987
107.579	2.035];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length','female'};  
temp.tL_f = C2K(12); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'Moor1955'; comment.tL_f = 'females under winter conditions';
%
data.tL_m = [ ... % time since birth (d), length (cm)
0.140	0.053
5.196	0.291
9.691	0.681
15.730	0.880
24.718	0.985
37.779	1.150
48.453	1.628
65.586	1.914
95.641	2.063
107.438	2.163];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'length','male'};  
temp.tL_m = C2K(12); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'Moor1955'; comment.tL_m = 'males under winter conditions';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f; 
weights.tL_m = 3 * weights.tL_m; 
% weights.Lp = 3 * weights.Lp; 
% weights.Li = 5 * weights.Li; 
% weights.Lim = 3 * weights.Lim; 
weights.Wwb = 5 * weights.Wwb; 
weights.tp = 0 * weights.tp; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males as assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WXPD'; % Cat of Life
metaData.links.id_ITIS = '624038'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Streptocephalus'; % Wikipedia
metaData.links.id_ADW = 'Streptocephalus_sealii'; % ADW
metaData.links.id_Taxo = '948462'; % Taxonomicon
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
bibkey = 'Moor1955'; type = 'Article'; bib = [ ... 
'author = {Walter G. Moore}, ' ... 
'year = {1955}, ' ...
'title = {The Life Hitory of the Spiny-Tailed Fairy Shrimp in {L}ouisiana}, ' ...
'journal = {Ecology}, ' ...
'volume = {36(2)}, ' ...
'pages = {176-184}'];
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

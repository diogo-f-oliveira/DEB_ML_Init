function [data, auxData, metaData, txtData, weights] = mydata_Thamnocephalus_platyurus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Thamnocephalidae';
metaData.species    = 'Thamnocephalus_platyurus'; 
metaData.species_en = 'Beavertail fairy shrimp'; 

metaData.ecoCode.climate = {'B','C'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 31]; 

%% set data
% zero-variate data

data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 12;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MeadObre1995';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL_L1 data and Lp';
data.am = 30;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.9;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MeadObre1995';
data.Li  = 2.5; units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'guess';
  
data.Wwb  = 1.41e-5;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Belk1977';
  comment.Wwb = 'based on egg diameter of 0.30 mm: pi/6*0.030^3';
data.Wdi  = 0.0266;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.5/1)^3';

data.Ri  = 20;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Branchinecta_mackini';

data.sM  = 5;   units.sM  = '-'; label.sM  = 'acceleration factor';      bibkey.sM  = 'guess';   
  comment.sM = 'pseudo-data based on mean value for fairy shrimps';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), standard length (cm), females, males
 1	0.091 0.088
 3	0.461 0.457
 6	0.892 0.910
 9	1.177 1.177
13  2.1   NaN];
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'length'};  
temp.tL_fm = C2K(25.5); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = 'MeadObre1995'; comment.tL_fm = 'data for females';
treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.sM = 0.2 * weights.sM; 

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
D1 = 'males are supposed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7X2G4'; % Cat of Life
metaData.links.id_ITIS = '83750'; % ITIS
metaData.links.id_EoL = '1020257'; % Ency of Life
metaData.links.id_Wiki = 'Thamnocephalus'; % Wikipedia
metaData.links.id_ADW = 'Thamnocephalus_platyurus'; % ADW
metaData.links.id_Taxo = '610580'; % Taxonomicon
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
bibkey = 'MeadObre1995'; type = 'Article'; bib = [ ... 
'doi = {10.1007/978-94-011-0291-9_13}, ' ...
'author = {Maeda-Mart\''{i}nez, A. M. and Obreg\''{o}n-Barboza, H. and Dumont, H. J.}, ' ... 
'year = {1995}, ' ...
'title = {Laboratory culture of fairy shrimps using baker’s yeast as basic food in a flow-through system}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {298}, ' ...
'pages = {141–157}'];
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

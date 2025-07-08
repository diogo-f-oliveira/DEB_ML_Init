function [data, auxData, metaData, txtData, weights] = mydata_Chirocephalus_carnuntanus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Chirocephalus_carnuntanus'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'}; 

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

data.tp = 30;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MuraZara1999';
  temp.tp = C2K(4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 79;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'HorvVad2015';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '59-71 d';

data.Lb  = 0.14; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'HorvVad2015';
data.Lp  = 1.0;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'HorvVad2015';
  comment.Lp = 'based on tp and tL data';
data.Li  = 2.2;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'HorvVad2015';
data.Lim  = 2.0;  units.Lim = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'HorvVad2015';
  
data.Wdi  = 0.0181;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.2/1)^3';

data.Ri  = 93.7/7.7; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chirocephalus_ruffoi: brood size 93.7, interbrood brood interval 7.7 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm)
 0.000	0.147
14.000	0.177
24.688	0.251
33.727	0.326
42.252	0.767
48.998	0.927
60.630	1.128
72.070	1.064
81.624	1.240];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = [ ...
 0.000	 1.972
14.000	 4.464
24.872	 8.097
34.588	 9.862
42.360	11.211
49.096	20.242
61.273	11.938
73.321	19.619
82.259	21.176];  units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'}; 
bibkey.tL = 'HorvVad2015'; comment.tL = 'length without furca';

%% set weights for all real data
weights = setweights(data, []);
% weights.Li = 3 * weights.Li; 
% weights.tp = 3 * weights.tp; 
% weights.Lb = 3 * weights.Lb; 

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
 
%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'An endemic Pannonian species of Carpathian Basin, including Hungary, Austria, western Slovakia and sodic pools of Serbia';
metaData.bibkey.F1 = 'HorvVad2015'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69SSG'; % Cat of Life
metaData.links.id_ITIS = '624131'; % ITIS
metaData.links.id_EoL = '338912'; % Ency of Life
metaData.links.id_Wiki = 'Chirocephalus'; % Wikipedia
metaData.links.id_ADW = 'Chirocephalus_carnuntanus'; % ADW
metaData.links.id_Taxo = '767354'; % Taxonomicon
metaData.links.id_WoRMS = '1325126'; % WoRMS

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
bibkey = 'HorvVad2015'; type = 'Article'; bib = [ ... 
'author = {Zs\''{o}fia Horv\''{a}th and Csaba F. Vad}, ' ... 
'year = {2015}, ' ...
'title = {Life history and current distribution of the fairy shrimp \emph{Chirocephalus carnuntanus} ({B}rauer, 1877) ({C}rustacea: {A}nostraca)}, ' ...
'journal = {North-Western Journal of Zoology}, ' ...
'volume = {11(1)}, ' ...
'pages = {102-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%


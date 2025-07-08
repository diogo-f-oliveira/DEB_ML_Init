function [data, auxData, metaData, txtData, weights] = mydata_Chirocephalus_kerkyrensis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Chirocephalus_kerkyrensis'; 
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
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 27]; 

%% set data
% zero-variate data

data.tp = 22;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Mura1997';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 127;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mura1997';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.07;    units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Mura1997';
data.Lp  = 1.033;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mura1997';
data.Li  = 1.983;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Mura1997';
  
data.Wdi  = 0.0132;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.98/1)^3';

% uni-variate data
% time-length
data.tL09 = [ ... % time since birth (d), length (cm)
 0	0.151 0.091
 7	0.385 0.107
14	0.531 0.409
21	0.550 0.655
28	0.726 0.841];
units.tL09 = {'d', 'cm'}; label.tL09 = {'time since birth', 'length'};  
temp.tL09 = C2K([17 14]); units.temp.tL09 = {'d','C'}; label.temp.tL09 = {'time','temperature'}; 
treat.tL09 = {1 {'1991','1992'}};
bibkey.tL09 = 'Mura1997'; comment.tL09 = 'small Pool 9';
%
data.tL12 = [ ... % time since birth (d), length (cm), fecundity (#), temp (C)
  0	0.122  0    9.038
  7	0.198  0   12.303
 14	0.442  0    8.414
 21	0.552  0    4.958
 28	0.558  0    3.021
 35	0.715  0    4.823
 42	0.756  0    2.397
 49	0.808  0    4.308
 56	0.855  0    7.573
 63	0.895  0    6.124
 70	0.994  0    7.167
 77	1.035  0    5.122
 84	1.093 13.50 6.653
 91	1.145 13.67 7.858
 98	1.233 36.89 2.723
105	1.273 36.11 8.807
112	1.297 59.25 11.314
119	1.343 63.00  8.780
126	1.401 46.08 10.040
133 1.500 55.90 11.843
140	1.523 89.25 12.562];
units.tL12 = {'d', 'cm','#'}; label.tL12 = {'time since birth','length','fecundity'};  
temp.tL12 = data.tL12(:,[1 4]); data.tL12(:,4) = [];
units.temp.tL12 = {'d','C'}; label.temp.tL12 = {'time','temperature'}; 
treat.tL12 = {1 {'length','fecundity'}};
bibkey.tL12 = 'Mura1997'; comment.tL12 = '1991, large Pool 12';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 4 * weights.Li; 
%weights.tL12 = 10 * weights.tL12; 

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

% %% Group plots
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};
 
% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic in Pollino National Park (1780–1900 m a.s.l), Italy';
metaData.bibkey.F1 = 'Mura2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y4SC'; % Cat of Life
metaData.links.id_ITIS = '624140'; % ITIS
metaData.links.id_EoL = '338919'; % Ency of Life
metaData.links.id_Wiki = 'Chirocephalus'; % Wikipedia
metaData.links.id_ADW = 'Chirocephalus_kerkyrensis'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '1325165'; % WoRMS

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
bibkey = 'Mura1997'; type = 'Article'; bib = [ ... 
'doi = {10.1023/a:1002931606886}, ' ...
'author = {Graziella Mura}, ' ... 
'year = {1997}, ' ...
'title = {The life history of \emph{Chirocephalus kerkyrensis} {P}esta ({C}rustacea: {A}nostraca) in temporary waters of {C}irceo {N}ational {P}ark ({L}atium, {I}taly)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {346}, ' ...
'pages = {11–23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%


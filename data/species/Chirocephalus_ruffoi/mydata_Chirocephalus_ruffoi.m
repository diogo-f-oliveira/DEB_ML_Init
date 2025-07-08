function [data, auxData, metaData, txtData, weights] = mydata_Chirocephalus_ruffoi
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Chirocephalus_ruffoi'; 
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

data.tp = 18;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MuraZara1999';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 79;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MuraZara1999';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.07; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.72;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mura2001';
data.Li  = 1.65;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Mura2001';
  
data.Wdb  = 2.65e-6;  units.Wdb  = 'g';  label.Wdb  = 'dry weight at birth';   bibkey.Wdb  = 'MuraZara1999';
  comment.Wdb = 'based in egg diameter of 0.301 mm: pi/6*0.17*0.031^3';
data.Wdi  = 0.0076;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.65/1)^3';

data.Ri  = 93.7/7.7; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MuraZara1999';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'brood size 93.7, interbrood brood interval 7.7 d';

% uni-variate data
% time-length
data.tL_98P4 = [ ... % time since birth (d), length (cm), different temperatures
-2.00   0.070 % assumed
0.000	0.120
5.921	0.176
10.768	0.373
17.859	0.690
20.688	0.880
27.563	1.021
31.233	1.127
37.400	1.225
42.495	1.338
60.305	1.444];
data.tL_98P4(:,1) = data.tL_98P4(:,1) + 2; % set origin at birth 
units.tL_98P4 = {'d', 'cm'}; label.tL_98P4 = {'time since birth', 'length','1998P4'};  
temp.tL_98P4 = [-2 6.9; 2 6.3; 8 10.0; 12 13.6; 19 18.7; 22 22.3; 29 23.0; 33 24.5; 39 23.0; 44 25.7; 65 37.2]; 
units.temp.tL_98P4 = {'d','C'}; label.temp.tL_98P4 = {'time','temperature'}; 
bibkey.tL_98P4 = 'Mura2001';
%
data.tL_98P3 = [ ... % time since birth (d), length (cm), different temperatures
-2.00   0.070 % assumed
0.000	0.106
4.245	0.138
10.085	0.254
15.225	0.611
22.227	0.793
25.473	0.919
32.303	1.134
36.474	1.222
42.325	1.244
47.416	1.332];
data.tL_98P3(:,1) = data.tL_98P3(:,1) + 2; % set origin at birth 
units.tL_98P3 = {'d', 'cm'}; label.tL_98P3 = {'time since birth', 'length','1998P3'};  
temp.tL_98P3 = [0 7.2; 4 7.8; 10 13.5; 14 18.0; 21 24.0; 24 22.8; 31 24.3; 35 25.7; 42 29.2; 47 31.7]; 
units.temp.tL_98P3 = {'d','C'}; label.temp.tL_98P3 = {'time','temperature'}; 
bibkey.tL_98P3 = 'Mura2001';
%
data.tL_98P1 = [ ... % time since birth (d), length (cm), different temperatures
-2.00   0.070 % assumed
0.000	0.175
3.968	0.149
10.026	0.323
15.370	0.701
22.435	0.834
25.542	1.094
32.319	1.223
36.429	1.312
42.769	1.323];
data.tL_98P1(:,1) = data.tL_98P1(:,1) + 2; % set origin at birth 
units.tL_98P1 = {'d', 'cm'}; label.tL_98P1 = {'time since birth', 'length','1998P1'};  
temp.tL_98P1 = [0 2.0; 4 19.3; 9 22.1; 13 24.8; 20 20.1; 23 24.2; 30 26.9; 34 28.5; 40 32.0]; 
units.temp.tL_98P1 = {'d','C'}; label.temp.tL_98P1 = {'time','temperature'}; 
bibkey.tL_98P1 = 'Mura2001';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li; 
weights.Wdb = 0 * weights.Wdb; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_98P4','tL_98P3','tL_98P1'}; subtitle1 = {'Data for pools 4,3,1'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

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
metaData.links.id_CoL = '69T4P'; % Cat of Life
metaData.links.id_ITIS = '624156'; % ITIS
metaData.links.id_EoL = '327072'; % Ency of Life
metaData.links.id_Wiki = 'Chirocephalus'; % Wikipedia
metaData.links.id_ADW = 'Chirocephalus_ruffoi'; % ADW
metaData.links.id_Taxo = '767379'; % Taxonomicon
metaData.links.id_WoRMS = '1325198'; % WoRMS

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
bibkey = 'Mura2001'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00029443}, ' ...
'author = {Graziella Mura}, ' ... 
'year = {2001}, ' ...
'title = {Life history strategy of \emph{Chirocephalus ruffoi} ({C}rustacea, {A}nostraca) in {M}editerranean temporary mountain pools}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {462}, ' ...
'pages = {145–156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'MuraZara1999'; type = 'Article'; bib = [ ... 
'doi = {10.1163/156854099503519}, ' ...
'author = {Graziella Mura and P. Zarattini}, ' ... 
'year = {1999}, ' ...
'title = {INFLUENCE OF PARENTAL REARING CONDITIONS ON CYST PRODUCTION AND HATCHING OF \emph{Chirocephalus ruffoi}, AN ENDEMIC FAIRY SHRIMP FROM {I}TALY ({A}NOSTRACA)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {72(5)}, ' ...
'pages = {449–465}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%


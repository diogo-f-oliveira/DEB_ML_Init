function [data, auxData, metaData, txtData, weights] = mydata_Gennadas_elegans

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Benthesicymidae';
metaData.species    = 'Gennadas_elegans'; 
metaData.species_en = 'Shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data

data.am = 1050;  units.am = 'd';     label.am = 'life span';                  bibkey.am = 'Mauc1988';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.92;   units.Lp = 'cm';    label.Lp = 'total length at puberty';    bibkey.Lp = 'guess';
  comment.Lp = 'based on Palaemon elegans: 3.65*4.68/5.84';
data.Li = 4.68;   units.Li = 'cm';    label.Li = 'ultimate total length';    bibkey.Li = 'GuerCaba2024';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm of palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 0.147;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'GuerCaba2024','guess'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 0.84*(2.62/4.68)^3';
data.Wwi = 0.84;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'GuerCaba2024';

data.Ri  = 1704/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since jan 1(d), length (cm)
187.029	1.0402
193.595	1.1431
234.883	1.4838
256.538	1.4383
301.147	1.7853
304.318	1.9721
412.224	2.1892
432.168	2.2017
443.562	2.4978
475.093	2.5745
489.914	2.7482
562.926	2.9337
619.400	3.0100
637.633	3.0805
682.440	3.1892
775.530	3.2262
797.116	3.2645
810.392	3.2965
833.485	3.5215
855.156	3.4567
924.752	3.7518
996.267	3.7377
1007.837	3.8212
1049.388	3.8462];
data.tL_f(:,1) = data.tL_f(:,1)-100; % set origin at birth
units.tL_f   = {'d', 'g'};  label.tL_f = {'time', 'length', 'females'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mauc1988';
comment.tL_f = 'length from base of the eye stalk to the end of the telson neglecting any terminal setae; temp between 5 and 15 C';
%
data.tL_m = [ ... % time since jan 1 (d), length (cm)
463.511	2.5039
499.966	2.6578
554.697	2.8308
636.093	2.9324
670.971	2.9833
833.823	3.1157
923.426	3.3460];
data.tL_m(:,1) = data.tL_m(:,1)-100; % set origin at birth
units.tL_m   = {'d', 'g'};  label.tL_m = {'time', 'length', 'males'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mauc1988';
comment.tL_m = 'length from base of the eye stalk to the end of the telson neglecting any terminal setae; temp between 5 and 15 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperature in C for tL data is assumed to vary as T(t)=10+5*sin((t-t_0)*2*pi/365)';
metaData.discussion = struct('D1',D1, 'D',D2);  

%% Links
metaData.links.id_CoL = '9XLG2'; 
metaData.links.id_ITIS = '96100'; % ITIS
metaData.links.id_EoL = '46501882'; % Ency of Life
metaData.links.id_Wiki = 'Gennadas_elegans'; % Wikipedia
metaData.links.id_ADW = 'Gennadas_elegans'; % ADW
metaData.links.id_Taxo = '145058'; % Taxonomicon
metaData.links.id_WoRMS = '584920'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gennadas_elegans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mauc1988'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00391115}, ' ...
'author = {J. Mauchline}, ' ... 
'year = {1988}, ' ...
'title = {Growth and breeding of meso- and bathypelagic organisms of the {R}ockall {T}rough, northeastern {A}tlantic {O}cean and evidence of seasonality}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {98(3)}, ' ...
'pages = {387–393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuerCaba2024'; type = 'Article'; bib = [ ... 
'doi = {10.3989/scimar.05383.081}, ' ...
'author = {Airam Guerra-Marrero and Catalina Caballero-M\''{e}ndez and Ana Espino-Ruano and Lorena Couce-Montero and David Jim\''{e}nez-Alvarado and Jos\''{e} J. Castro}, ' ... 
'year = {2024}, ' ...
'title = {Length-weight relationships of 15 mesopelagic shrimp species caught during exploratory surveys off the {C}anary {I}slands (central eastern {A}tlantic)}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {88(1)}, ' ...
'pages = {e81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

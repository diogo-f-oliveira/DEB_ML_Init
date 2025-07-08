function [data, auxData, metaData, txtData, weights] = mydata_Arcitalitrus_dorrieni

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Talitridae';
metaData.species    = 'Arcitalitrus_dorrieni'; 
metaData.species_en = 'Landhopper'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'TA', 'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 30]; 

%% set data
% zero-variate data

data.ab = 40.3;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Gammarus fossarum';
data.am = 2*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Gammarus fossarum';

data.Lb  = 0.12;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Gammarus fossarum';
data.Lj  = 0.3;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'guess';
data.Lp  = 0.81;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Gammarus fossarum';
data.Li  = 1.47;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'guess';
  comment.Li = 'based on Gammarus fossarum';

data.Wwi = 40.9;   units.Wwi = 'mg';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';  
  comment.Wwi = 'based on Gammarus fossarum';

data.Ri  = 59/62; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Gammarus fossarum';

% uni-variate data
% t-L data
data.tL_f = [ ... % time since 1991/05/01 (d), body length (cm)
79.030	0.594
118.309	0.594
154.734	0.621
188.253	0.607
227.579	0.667
263.957	0.633
305.189	0.682
338.720	0.682
377.132	0.797
411.693	0.888
445.332	1.024
479.824	1.029
512.440	1.084
547.833	1.018
582.388	1.102
617.865	1.140];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since 1991/05/01', 'body length', 'female'};  
temp.tL_f    = C2K(16.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OHanBolg1997';
comment.tL_f = 'Data for females; temperature (in C at t) is assumed to be 8*cos(t*2*pi/365-pi/1.2)+4';
%
data.tL_m = [ ... % time since 1991/05/01 (d), body length (cm)
5.174	0.481
42.513	0.453
78.935	0.474
118.225	0.489
156.560	0.508
186.238	0.482
228.476	0.590
261.020	0.555
305.065	0.526
337.662	0.557
377.011	0.646
411.567	0.730
447.089	0.826
478.721	0.848
513.238	0.884
547.755	0.920
583.199	0.918
617.691	0.923];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since 1991/05/01', 'body length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OHanBolg1997';
comment.tL_m = 'Data for males; temperature (in C at t) is assumed to be 8*cos(t*2*pi/365-pi/1.2)+4';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6828J'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2946886'; % Ency of Life
metaData.links.id_Wiki = 'Arcitalitrus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4603905'; % Taxonomicon
metaData.links.id_WoRMS = '103197'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arcitalitrus_sylvaticus}}';
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
bibkey = 'OHanBolg1997'; type = 'Article'; bib = [ ... 
'author = {R. P. O''Hanlon and T. Bolger}, ' ... 
'year = {1997}, ' ...
'title = {Biomass, growth, and secondary production of \emph{Arcitalitrus dorrieni} ({C}rustacea: {A}mphipoda: {T}alitridae) at two sites in {C}o. {G}alway, {I}reland}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {241}, ' ...
'pages = {409-428}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

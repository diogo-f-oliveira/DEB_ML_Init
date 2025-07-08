function [data, auxData, metaData, txtData, weights] = mydata_Puma_concolor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Puma_concolor'; 
metaData.species_en = 'Cougar'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg', '0iTf', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 92;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Oreamnos';
data.tp = 912;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 912;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 23.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Li = 180;   units.Li = 'cm';   label.Li = 'ultimate body length females'; bibkey.Li = 'BartOnor2013';
data.Lim = 210;  units.Lim = 'cm';   label.Lim = 'ultimate body length males'; bibkey.Lim = 'BartOnor2013';
  
data.Wwb = 400;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 3.5e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 38.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'BartOnor2013';
data.Wwim = 57e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'BartOnor2013';
  
data.Ri  = 0.45*2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter, 0.45 litters per yr';

% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), body length (cm)
0.027	50.955
0.027	44.055
0.028	38.747
0.041	67.941
0.487	134.820
1.654	189.490
7.744	182.059
7.953	192.675
8.734	177.813]; 
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'body length', 'female'};  
temp.tL_f  = C2K(37.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BartOnor2013';
comment.tL_f = 'Data for females Puma concolor coryi (Florida panther)';
% 
data.tL_m = [ ... % time since birth (yr), wet weight (kg)
0.086	63.163
0.546	154.989
0.799	182.059
1.488	196.391
1.714	191.083
2.073	196.921
2.477	218.684
3.228	208.068]; 
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'body length', 'male'};  
temp.tL_m  = C2K(37.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BartOnor2013';
comment.tL_m = 'Data for males Puma concolor coryi (Florida panther)';

% time-weight
data.tW_f = [ % time since birth (yr), wet weight (kg)
0.045	1.872
0.480	9.532
0.525	11.064
0.630	22.638
0.645	16.340
0.675	24.681
0.810	24.681
0.810	27.064
1.005	32.681
1.005	35.234
1.095	28.085
1.170	33.532
1.650	26.894
1.665	29.617
1.665	31.660
1.725	39.489
1.770	33.191
1.980	42.383
2.025	38.638
2.505	38.128
2.565	36.255
2.985	36.936
3.000	40.681
3.000	30.979
3.585	31.660
3.660	38.298
4.680	39.660
4.845	40.851
4.845	44.596
4.980	38.298
5.505	36.255
6.000	48.681
6.000	51.064
6.000	36.085
6.510	39.319
6.810	36.255
7.005	34.894
7.725	31.660
7.755	37.617
7.995	34.383
8.745	45.957
8.970	36.936
12.000	36.255]; 
data.tW_f(:,1) = data.tW_f(:,1)*365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2)*1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(37.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BartOnor2013';
comment.tW_f = 'Data for females Puma concolor coryi (Florida panther)';
% 
data.tW_m = [ ... % time since birth (yr), wet weight (kg)
0.000	0.851
0.000	1.021
0.330	6.979
0.390	9.021
0.405	10.213
0.450	16.511
0.570	18.383
0.645	25.362
0.750	27.745
0.810	28.766
0.810	29.957
0.885	33.532
0.945	27.234
1.035	30.638
1.455	43.234
1.485	44.596
1.485	47.149
1.545	48.851
1.545	68.426
1.605	42.894
1.605	44.596
1.725	41.872
1.890	54.298
1.950	62.468
2.055	57.021
2.475	54.298
2.550	42.383
2.805	46.809
2.820	56.170
3.000	55.319
3.255	54.468
3.300	72.851
3.840	69.277
4.005	43.915
8.985	56.681
9.495	53.277
10.500	58.723]; 
data.tW_m(:,1) = data.tW_m(:,1)*365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2)*1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(37.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BartOnor2013';
comment.tW_m = 'Data for males Puma concolor coryi (Florida panther)';

%% set weights for all real data
weights = setweights(data, []);

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4QHKG'; % Cat of Life
metaData.links.id_ITIS = '552479'; % ITIS
metaData.links.id_EoL = '311910'; % Ency of Life
metaData.links.id_Wiki = 'Puma_concolor'; % Wikipedia
metaData.links.id_ADW = 'Puma_concolor'; % ADW
metaData.links.id_Taxo = '169680'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000204'; % MSW3
metaData.links.id_AnAge = 'Puma_concolor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Puma_concolor}}';
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
bibkey = 'BartOnor2013'; type = 'article'; bib = [ ... 
'author = {T. Bartareau and D. Onorato and D. Jansen}, ' ... 
'year = {2013}, ' ...
'title = {Growth in Body Length and Mass of the Florida Panther: An Evaluation of Different Models and Sexual Size Dimorphism}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {12}, ' ...
'pages = {27--40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puma_concolor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Puma_concolor/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


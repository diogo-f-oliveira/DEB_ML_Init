function [data, auxData, metaData, txtData, weights] = mydata_Pusa_sibirica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Pusa_sibirica'; 
metaData.species_en = 'Baikal seal'; 

metaData.ecoCode.climate = {'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 06];              
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

data.tg = 273;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 68;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2129;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)';           bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2557;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';           bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 56*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 70;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Li  = 125;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'Wiki';
  comment.Li = '110-140 cm';
data.Lim  = 135;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'Wiki';
   comment.Lim = '110-140 cm, males being slightly larger than females';
 
data.Wwb = 3e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Wiki gives 3-3.5 kg';
data.Wwi = 63e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '63-70 kg';
data.Wwim = 67e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '63-70 kg';

data.Ri  = 1.02/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter per yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
0.351	80.736
0.873	92.188
2.013	88.604
2.017	93.436
6.354	86.258
6.371	109.524
7.404	115.783
7.463	117.931
7.514	109.519
8.375	115.600
8.377	118.463
8.380	122.222
8.491	117.210
10.313	107.537
10.376	117.023
10.432	114.338
11.405	116.302
11.517	114.154
12.479	100.011
13.352	123.273
14.494	121.121
17.416	133.099
23.408	120.723
24.613	127.876];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AmanMiya2000';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0.236	80.021
0.356	88.074
0.578	79.662
1.275	94.692
1.441	87.711
1.501	90.754
2.011	85.740
3.574	113.295
6.311	105.766
6.317	114.177
6.551	121.156
7.345	113.636
7.464	119.899
7.465	120.794
7.465	121.510
8.435	119.537
8.437	121.148
9.406	118.459
10.439	125.076
14.564	139.375
15.466	122.548
16.388	133.282
18.448	137.210
19.358	131.837
21.413	127.533
24.448	137.183
25.368	145.591];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AmanMiya2000';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), standard length (cm)
0.083	22548.675
0.490	29225.513
0.998	23438.906
1.868	35012.100
2.085	24329.158
2.093	31451.113
6.352	57935.919
6.502	39908.455
6.506	42579.191
7.529	38127.951
7.539	46585.294
7.546	53262.132
7.556	62164.570
8.581	58603.603
8.629	50368.829
8.632	53262.132
8.647	66170.673
10.523	57713.351
10.524	59048.719
10.526	60384.087
10.562	41911.507
10.585	62164.570
10.690	54152.364
11.540	47920.661
11.660	52371.880
12.502	39463.319
12.563	42579.191
14.535	67951.167
15.571	74628.005
17.552	58603.603
19.603	53262.132
23.500	62387.128
24.606	80859.718];  
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % yr to d
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'AmanMiya2000';
comment.tWw_f = 'Data for females';
% 
data.tWw_m = [ ... % time since birth (yr), standard length (cm)
0.436	32118.797
0.594	19655.371
1.401	26109.642
1.456	23884.043
1.524	33676.732
2.024	20990.739
2.720	30338.313
3.541	48588.345
6.497	35234.668
6.507	43914.558
6.570	48588.345
6.573	51926.765
7.312	47920.661
7.475	41021.255
7.494	57935.919
7.504	66615.799
8.514	49701.145
8.635	55932.868
9.660	53039.564
10.501	38350.519
10.582	59716.403
11.539	46807.841
14.532	65725.547
15.605	54374.932
16.649	68173.725
18.690	54152.364
19.625	71957.270
21.680	70399.334
24.578	55932.868
24.602	77076.173
25.590	91320.102
35.614	62832.254];  
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % yr to d
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'AmanMiya2000';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f'; 'tL_m'}; subtitle1 = {'data for female, male'};
set2 = {'tWw_f'; 'tWw_m'}; subtitle2 = {'data for female, male'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4QKSQ'; % Cat of Life
metaData.links.id_ITIS = '622020'; % ITIS
metaData.links.id_EoL = '1052722'; % Ency of Life
metaData.links.id_Wiki = 'Pusa_sibirica'; % Wikipedia
metaData.links.id_ADW = 'Pusa_sibirica'; % ADW
metaData.links.id_Taxo = '67474'; % Taxonomicon
metaData.links.id_WoRMS = '255023'; % WoRMS
metaData.links.id_MSW3 = '14001074'; % MSW3
metaData.links.id_AnAge = 'Pusa_sibirica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pusa_sibirica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Pusa_sibirica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pusa_sibirica/}}';
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
bibkey = 'AmanMiya2000'; type = 'Article'; bib = [ ... 
'doi = {10.1016/S0065-2504(00)31024-8}, ' ...
'author = {Amano, M. and Miyazaki, N. and Petrov, E. A.}, ' ... 
'year = {2000}, ' ...
'title = {Age determination and growth of {B}aikal seals (\emph{Phoca sibirica})}, ' ...
 'journal = {Ancient Lakes: Biodiversity, Ecology and Evolution}, ' ...
'volume = {31}, ' ...
'pages = {449–462}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


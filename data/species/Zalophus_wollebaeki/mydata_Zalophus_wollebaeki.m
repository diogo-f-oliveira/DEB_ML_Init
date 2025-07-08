function [data, auxData, metaData, txtData, weights] = mydata_Zalophus_wollebaeki
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Zalophus_wollebaeki'; 
metaData.species_en = 'Galapagos sea lion'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 07 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 23];

%% set data
% zero-variate data

data.tg = 11*30.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 11.5*30.5 ;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)'; bibkey.tp = 'ADW';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';bibkey.tpm  = 'ADW';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Wwb = 6e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwi = 250e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '50-250 kg';
data.Wwim = 360e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter per yr';
 
% uni-variate data

% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
5.530	6581.870
7.373	5194.320
11.060	8661.996
11.060	7448.123
20.276	9007.485
20.276	5886.097
25.806	9700.327
29.493	10046.615
40.553	13166.404
47.926	12471.697
47.926	7269.385
49.770	12124.610
53.456	10216.563
329.954	37402.040
339.171	27863.136
350.230	30809.514
359.447	28900.668
361.290	30807.916
363.134	20749.846
374.194	29245.358
387.097	28029.620
400.000	26987.293
514.286	28358.061
731.797	27632.987
733.641	36650.062
733.641	33008.444
737.327	41505.021
764.977	33524.146
886.636	28130.843
892.166	32465.304
905.069	32810.260
910.599	36624.490
1104.147	34862.417
1111.521	24803.548
1113.364	36942.010
1117.051	41276.737
1117.051	40583.095
1122.581	35206.574
1126.267	40061.532
1139.171	42834.234
1144.700	34683.146
1166.820	37974.747
1176.037	49765.323
1176.037	41094.803
1196.313	35022.508];  
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'MuelPors2011';
comment.tWw_f = 'Data for females';
% 
data.tWw_m = [ ... % time since birth (d), weight (g)
0.000	7042.362
1.843	6859.974
5.530	6136.527
7.373	7401.310
16.590	6677.030
22.120	9025.595
22.120	7941.258
23.963	6133.751
25.806	11193.714
33.180	10469.712
33.180	8301.038
35.023	13361.001
40.553	11372.216
42.396	12456.276
47.926	15527.733
49.770	11912.997
53.456	14623.285
62.673	14802.620
64.516	15525.234
73.733	15523.846
329.954	21268.391
342.857	29941.147
350.230	45662.928
364.977	16745.044
376.037	32466.270
387.097	35536.894
394.470	26138.193
556.682	30089.667
715.207	38740.491
729.954	40906.945
748.387	35301.760
753.917	33674.421
774.194	45599.078
790.783	42162.844
932.719	33647.493
1100.461	32176.447
1111.521	38861.529
1124.424	45907.778
1135.484	49159.124
1139.171	26929.654
1146.544	42832.158
1176.037	29454.222
1177.880	55116.595
1188.940	39392.038
1216.590	45893.898];  
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'MuelPors2011';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f'; 'tWw_m'}; subtitle1 = {'data for female, male at Turtle Rock'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: k reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5CV57'; % Cat of Life
metaData.links.id_ITIS = '622014'; % ITIS
metaData.links.id_EoL = '46559214'; % Ency of Life
metaData.links.id_Wiki = 'Zalophus_wollebaeki'; % Wikipedia
metaData.links.id_ADW = 'Zalophus_wollebaeki'; % ADW
metaData.links.id_Taxo = '67417'; % Taxonomicon
metaData.links.id_WoRMS = '255005'; % WoRMS
metaData.links.id_MSW3 = '14001021'; % MSW3
metaData.links.id_AnAge = 'Zalophus_wollebaeki'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zalophus_wollebaeki}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Zalophus_californianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Zalophus_wollebaeki/}}';
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
bibkey = 'MuelPors2011'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-7692.2010.00404.x}, ' ...
'author = {Birte Mueller and Ulrich P\"{o}rschmann and Jochen B. W. Wolf and Fritz Trillmich}, ' ... 
'year = {2011}, ' ...
'title = {Growth under uncertainty: The inﬂuence of marinevariability on early development of {G}alapagos sea lions}, ' ...
 'journal = {Marine Mammal Science}, ' ...
'volume = {27(2)}, ' ...
'pages = {350–365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


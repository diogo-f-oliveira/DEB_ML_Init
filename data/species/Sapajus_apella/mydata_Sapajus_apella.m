function [data, auxData, metaData, txtData, weights] = mydata_Sapajus_apella

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cebidae';
metaData.species    = 'Sapajus_apella'; 
metaData.species_en = 'Tufted capuchin'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 158;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 307;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'for C. apella';
data.tp = 1703;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'female, 2921 d for male';
data.am = 46*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 40;    units.Li  = 'cm';  label.Li  = 'ultimate body length';    bibkey.Li  = 'Wiki';
  comment.Li = '32 to 57 cm';

data.Wwb = 239.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 2000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '1.9 to 4.8 kg';

data.Ri  = 1.5*0.6/803; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 pups per litter, 0.6 litters per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
0.000	212.902
0.001	189.250
0.002	251.623
0.008	262.399
0.039	170.039
0.040	400.148
0.046	238.885
0.065	402.394
0.067	294.875
0.104	434.796
0.110	501.487
0.118	492.914
0.119	428.402
0.135	400.504
0.137	557.503
0.138	512.345
0.147	372.592
0.155	478.000
0.162	488.776
0.197	415.789
0.204	587.858
0.212	639.505
0.213	658.860
0.214	521.230
0.237	499.811
0.269	560.143
0.290	633.342
0.294	702.174
0.313	794.716
0.319	500.116
0.322	738.835
0.328	700.151
0.334	674.366
0.346	775.486
0.367	732.551
0.377	857.321
0.384	771.327
0.435	932.806
0.444	904.883
0.471	722.188
0.479	806.087
0.484	952.344
0.494	801.843
0.520	933.122
0.526	1130.994
0.542	946.108
0.554	944.002
0.571	890.302
1.010	1053.368
2.013	1405.721
3.010	1555.477
3.991	1945.577
4.999	2044.821
6.000	2017.401
6.490	2009.909];
data.tW_f(:,1) = 365 * data.tW_f(:,1);
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'Hone2006';
comment.tW_f = 'Data for females';
% males
data.tW_m = [ ... % time since birth (yr), wet weight (g)
0.001	204.306
0.005	169.914
0.020	283.947
0.037	339.924
0.039	296.922
0.045	339.956
0.093	374.543
0.108	443.414
0.126	378.965
0.169	462.997
0.176	454.421
0.178	572.709
0.191	495.338
0.219	732.000
0.224	770.729
0.255	803.104
0.266	598.842
0.297	854.872
0.305	719.417
0.351	917.441
0.360	601.344
0.368	932.556
0.404	840.218
0.449	700.600
0.450	696.303
0.467	823.247
0.516	922.355
0.518	963.221
1.002	1407.721
1.996	1684.031
3.024	1859.428
3.993	2363.317
4.981	2930.703
5.974	3257.635
6.977	3597.333];
data.tW_m(:,1) = 365 * data.tW_m(:,1);
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'Hone2006';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'assimilation during lactation is assumed to exceed that after';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6XJVY'; % Cat of Life
metaData.links.id_ITIS = '944156'; % ITIS
metaData.links.id_EoL = '43653308'; % Ency of Life
metaData.links.id_Wiki = 'Sapajus_apella'; % Wikipedia
metaData.links.id_ADW = 'Cebus_apella'; % ADW
metaData.links.id_Taxo = '5652496'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100263'; % MSW3
metaData.links.id_AnAge = 'Sapajus_apella'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sapajus_apella}}';
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
bibkey = 'Hone2006'; type = 'Techreport'; bib = [ ... 
'author = {Joel Honeysett}, ' ... 
'year = {2006}, ' ...
'title = {Husbandry Manual For Brown Capuchin/Black-capped Capuchin \emph{Cebus apella} ({C}ebidae)}, ' ...
'institute = {Sydney Institute of TAFE, Ultimo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cebus_apella}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Sapajus_apella/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


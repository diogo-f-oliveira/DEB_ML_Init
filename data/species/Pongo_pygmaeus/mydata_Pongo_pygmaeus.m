function [data, auxData, metaData, txtData, weights] = mydata_Pongo_pygmaeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Hominidae';
metaData.species    = 'Pongo_pygmaeus'; 
metaData.species_en = 'Bornean orangutan'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHl', 'xiHn', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2021 12 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 15];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 249;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 1003;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2555;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'female; 2920 d for male';
data.am = 59*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 110;    units.Li  = 'cm';  label.Li  = 'ultimate body length for females';   bibkey.Li  = 'Wiki';
  comment.Li = '1–1.2 m';
data.Lim  = 155;    units.Lim  = 'cm';  label.Lim  = 'ultimate body length for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = '1.2–1.7 m ';

data.Wwb = 1500;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BondBloc1982';
data.Wwx = 11000; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 38.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '30–50 kg';
data.Wwim = 75e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '50-100 kg';

data.Ri  = 1/1414; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
0.223	1423.030
4.079	1411.649
6.925	1612.269
6.966	1381.481
13.919	1806.182
14.156	1589.727
21.155	1807.677
21.206	2019.192
28.154	2025.626
28.191	2179.455
35.284	2387.746
35.328	2171.379
42.384	2225.841
42.455	2519.078
49.147	2665.052
49.672	2438.850
56.370	2608.860
56.415	2796.340
63.435	2701.779
63.481	2894.066];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(37.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'BondBloc1982';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
0.000	1677.942
6.824	1593.084
14.015	1806.138
14.089	2113.796
20.881	2274.148
20.916	2019.324
27.962	2429.560
28.033	2323.758
35.197	2426.247
35.415	2531.916
42.158	2485.560
42.261	2913.397
49.245	2669.815
49.338	3054.388
56.321	2805.998
56.440	3301.136
63.344	2725.859];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(37.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'BondBloc1982';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwx =  0 * weights.Wwx;
weights.Wwb =  10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4LTT2'; % Cat of Life
metaData.links.id_ITIS = '573083'; % ITIS
metaData.links.id_EoL = '326450'; % Ency of Life
metaData.links.id_Wiki = 'Pongo_pygmaeus'; % Wikipedia
metaData.links.id_ADW = 'Pongo_pygmaeus'; % ADW
metaData.links.id_Taxo = '66224'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100805'; % MSW3
metaData.links.id_AnAge = 'Pongo_pygmaeus'; % AnAge

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_2: tWw & Lim data added, Wwx data ignored';
D3 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pongo_pygmaeus}}';
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
bibkey = 'BondBloc1982'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-1090.1982.tb02045.x}, ' ...
'author = {Bond, M. R. and Block, J. A.}, ' ...
'year = {1982}, ' ...
'title  = {Growth and development of twin Orang-utans}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'pages = {256–261}, ' ...
'volume = {22(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pongo_pygmaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pongo_pygmaeus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


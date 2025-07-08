function [data, auxData, metaData, txtData, weights] = mydata_Heteromys_desmarestianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Heteromyidae';
metaData.species    = 'Heteromys_desmarestianus'; 
metaData.species_en = 'Desmarest''s spiny pocket mouse'; 

metaData.ecoCode.climate = {'Aw','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 27.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Flem1977';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '27-28 d';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Flem1977';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-30 d';
data.tp = 146;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Flem1977';
data.Wwx = 50;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'Flem1977';
data.Wwi = 87;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '46-87 g';

data.Ri  = 5*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 litters per yr, 3.8 pups per litter';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), head+body length (g)
2.837	0.498
4.043	0.582
5.106	0.683
5.957	0.869
7.021	0.919
7.943	1.122
9.220	1.121
9.929	1.316
11.064	1.552
11.915	1.687
12.908	1.779
13.901	1.889
15.887	2.108
17.943	2.302
19.858	2.361
21.702	2.707
23.830	2.782
25.816	2.917
27.801	3.043
29.929	3.101];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'hind-foot length', 'female'};  
temp.tL_f  = C2K(37.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Flem1977';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), hind-foot length (cm)
2.128	0.413
3.121	0.515
3.901	0.582
4.894	0.734
5.957	0.835
7.092	0.936
7.943	1.122
8.865	1.223
10.071	1.349
10.638	1.459
11.915	1.577
12.837	1.754
13.901	1.864
15.603	2.159
17.872	2.319
19.929	2.521
21.702	2.842
23.901	3.010
25.887	3.001
27.801	3.263
29.858	3.380];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time', 'hind-foot length', 'male'};  
temp.tL_m  = C2K(37.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Flem1977';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.931	3.140
1.851	4.418
2.773	4.556
3.836	5.263
4.899	5.828
5.890	7.105
6.951	9.095
7.872	9.518
8.792	10.938
9.925	12.642
10.702	14.632
11.764	16.052
12.827	16.617
13.749	16.612
15.801	20.164
17.709	24.713
19.832	27.979
21.737	34.808
23.857	40.353
25.984	40.771
27.961	46.887
29.871	50.154];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f  = C2K(37.9);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Flem1977';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
1.002	3.140
1.852	4.133
2.845	4.128
3.978	5.120
5.040	6.112
5.890	7.105
6.881	8.668
7.873	9.233
8.793	10.510
9.856	11.360
10.847	12.637
11.837	14.769
12.757	15.762
13.821	15.757
15.804	17.600
17.996	22.290
19.902	28.549
21.667	34.238
24.000	39.640
25.905	46.611
27.813	51.161
29.865	54.997];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m  = C2K(37.9);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Flem1977';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Hind-foot length does not grow isomorphically';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '7VD2N'; % Cat of Life
metaData.links.id_ITIS = '625230 '; % ITIS
metaData.links.id_EoL = '346596'; % Ency of Life
metaData.links.id_Wiki = 'Heteromys_desmarestianus'; % Wikipedia
metaData.links.id_ADW = 'Heteromys_desmarestianus'; % ADW
metaData.links.id_Taxo = '62080'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12700164'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heteromys_desmarestianus}}';
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
bibkey = 'Flem1977'; type = 'Article'; bib = [ ... 
'author = {Theodore H. Fleming}, ' ... 
'year = {1977}, ' ...
'title = {Growth and Development of Two Species of Tropical {H}eteromyid Rodents}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {98(1)}, ' ...
'pages = {109-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Heteromys_desmarestianus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


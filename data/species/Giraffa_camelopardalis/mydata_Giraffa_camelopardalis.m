function [data, auxData, metaData, txtData, weights] = mydata_Giraffa_camelopardalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Giraffidae';
metaData.species    = 'Giraffa_camelopardalis'; 
metaData.species_en = 'Northern giraffe'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe','t-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 02 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2018 08 27];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 457;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'SkinHall1975';   
  temp.tg = C2K(37.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 152;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1278;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1644;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 39.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(37.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 102e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SkinHall1975';
  comment.Wwb = 'Data from the wild; almost twice the typical value in zoos';
data.Wwi = 1.2e6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'GlonBran2016';
data.Wwim = 1.93e6; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  
data.Ri  = 1/620;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_e = [ % age (d), weight (kg)
30.732	0.158
64.390	0.152
85.610	0.312
96.585	0.638
114.146	0.799
120.000	1.044
128.049	1.534
133.171	1.615
137.561	1.778
148.537	2.186
188.049	5.130
227.561	8.811
267.320	17.182
270.253	17.953
274.653	19.110
336.986	36.079
389.135	60.391
392.812	62.707
403.837	68.689
406.779	70.620
412.663	74.287
427.371	83.357
453.852	100.535]; 
data.tW_e(:,2) = data.tW_e(:,2) * 1e3; % convert kg to g
units.tW_e  = {'d', 'g'};  label.tW_e = {'age', 'weight'};  
temp.tW_e  = C2K(37.1);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'SkinHall1975';
comment.tW_e = 'Foetal data for the southern giraffe: Giraffa giraffa';
subtitle.tW_e = 'foetal development';

data.tW_f = [ ... % time since birth(
0.000	 95.587
0.088	141.577
0.352	187.548
0.396	159.222
0.527	212.296
0.527	247.694
0.703	254.743
0.791	290.126
0.989	293.630
0.989	325.489
1.121	332.545
1.143	367.939
1.319	367.908
1.495	403.275
1.560	396.184
1.604	360.778
1.824	385.518
1.934	435.056
1.956	410.273
2.088	442.108
2.088	473.967
2.242	484.559
2.264	505.794
2.549	505.743
2.549	526.982
2.637	526.967
2.835	562.330
2.989	537.524
3.143	555.196
3.341	537.462
3.429	597.623
3.473	569.297
3.604	597.592
3.692	629.435
3.868	650.643
4.044	664.771
4.374	622.235
4.484	611.596
4.637	639.887
4.637	661.126
4.813	678.794
5.429	791.960
5.560	784.857
5.648	742.363
5.956	763.548
6.066	777.687
6.132	802.455
7.956	805.672
8.967	837.351
10.022	861.943
10.945	815.762
11.978	879.296
13.978	804.606
14.967	797.351
15.934	860.897
17.978	835.756
18.989	916.993];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f  = C2K(37.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GlonBran2016';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ...
0.000	116.814
0.022	138.049
0.154	180.504
0.176	155.721
0.264	212.343
0.352	212.327
0.396	268.957
0.418	240.634
0.505	300.796
0.593	325.559
0.681	286.605
0.769	353.846
0.791	378.621
0.835	357.374
0.901	392.761
0.945	406.912
1.077	413.969
1.209	431.644
1.275	449.332
1.407	449.309
1.451	470.540
1.560	495.299
1.736	566.064
1.758	583.760
1.780	495.260
1.846	537.726
2.022	583.713
2.022	619.111
2.176	650.942
2.220	633.235
2.396	668.603
10.044	1187.603
10.264	1219.422
10.462	1205.228
10.747	1237.036
10.791	1297.205
10.857	1329.052
11.077	1339.632
11.319	1328.970
11.363	1293.564
11.582	1272.286
11.692	1328.904
11.868	1318.253
12.066	1342.997
12.286	1364.197
12.659	1349.972
12.725	1325.181
12.791	1296.851
13.033	1328.667
13.187	1342.799
13.187	1364.038
13.385	1385.242
13.429	1328.597
13.538	1300.259
13.714	1300.227
13.802	1328.531
13.912	1349.750
14.154	1300.150];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m  = C2K(37.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GlonBran2016';
comment.tW_m = 'Data for males';

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
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW_f', 'tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
D2 = 'mod_1: inclusion of tW_f and tW_m data';
D3 = 'mod_2: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3G3KN'; % Cat of Life
metaData.links.id_ITIS = '625036'; % ITIS
metaData.links.id_EoL = '308378'; % Ency of Life
metaData.links.id_Wiki = 'Giraffa_camelopardalis'; % Wikipedia
metaData.links.id_ADW = 'Giraffa_camelopardalis'; % ADW
metaData.links.id_Taxo = '68119'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200476'; % MSW3
metaData.links.id_AnAge = 'Giraffa_camelopardalis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Giraffa_camelopardalis}}';
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
bibkey = 'SkinHall1975'; type = 'Article'; bib = [ ... 
'author = {Skinner, J. D. and Hall-Martin, A. J.}, ' ... 
'year = {1975}, ' ...
'title = {A note on foetal growth and development of the giraffe \emph{Giraffa camelopardalis giraffa}}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {177}, ' ...
'pages = {73-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GlonBran2016'; type = 'Article'; bib = [ ... 
'author = {M. Glonekov''{a} and K. Brandlov\''{a} and M. \v{Z}\''{a}\v{c}kov\''{a} and B. Dobi\''{a}\v{s}ov\''{a} and K. Pechrov\''{a} and J. \v{S}imek}, ' ... 
'year = {2016}, ' ...
'doi = {10.1002/zoo.21308}, ' ...
'title = {The Weight of Rothschild Giraffe - Is It Really Well Known?}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {35}, ' ...
'pages = {423-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Giraffa_camelopardalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Giraffa_camelopardalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


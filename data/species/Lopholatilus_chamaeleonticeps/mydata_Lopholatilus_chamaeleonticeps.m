function [data, auxData, metaData, txtData, weights] = mydata_Lopholatilus_chamaeleonticeps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Latilidae';
metaData.species    = 'Lopholatilus_chamaeleonticeps'; 
metaData.species_en = 'Great northern tilefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAg'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2021 09 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(16.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '5-7 yrs';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(16.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '25-35 yrs';
  
data.Lp  = 60; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = '50-70 cm';
data.Li  = 102;  units.Li  = 'cm';  label.Li  = 'ultimate fork length for females'; bibkey.Li  = 'Wiki';
data.Lim  = 112;  units.Lim  = 'cm';  label.Lim  = 'ultimate fork length for males'; bibkey.Lim  = 'Wiki';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 

data.Ri  = 8e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(16.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
2.396	39.992
2.444	41.783
2.444	43.176
2.444	44.570
2.492	30.437
2.492	31.831
2.492	35.413
2.492	37.205
3.498	39.985
3.498	39.189
3.498	37.198
3.498	36.004
3.498	36.004
3.546	62.277
3.546	46.752
3.546	43.169
3.546	41.378
3.546	40.781
4.553	38.983
4.601	34.006
4.649	48.934
4.649	49.730
4.744	47.142
5.511	41.564
5.559	54.302
5.559	51.118
5.559	49.724
5.559	48.729
7.572	64.639
7.572	64.042
22.907	71.703
30.000	100.518];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(16.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Daws2021';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.492	28.447
2.492	37.006
2.492	54.522
2.540	39.593
2.540	47.356
2.540	48.749
2.540	50.341
2.588	33.820
2.588	38.199
3.498	55.908
3.498	54.913
3.498	44.364
3.498	28.042
3.546	52.325
3.546	50.335
3.546	46.951
3.642	49.538
3.642	48.344
3.642	45.159
3.642	25.653
4.505	54.309
4.505	55.703
4.553	57.096
4.601	37.788
4.601	43.958
4.601	45.352
4.601	46.546
4.601	49.532
4.601	50.527
4.601	51.920
4.601	53.313
4.601	63.067
5.463	67.042
5.559	63.856
5.559	62.861
5.559	59.876
5.559	58.681
5.607	49.724
5.655	79.381
6.565	78.977
6.565	71.812
6.565	46.732
6.613	76.986
6.613	75.593
6.661	65.641
7.620	76.781
7.668	88.524
8.530	78.964
8.626	84.139
8.626	82.745
12.700	109.987
13.802	72.361
30.048	109.872];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));  % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(16.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Daws2021';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % fork length (cm), wet weight (g)
9.249	528.456
11.016	365.854
12.784	365.854
16.516	325.204
16.716	650.406
18.087	284.553
19.275	1219.512
19.661	487.806
22.620	1747.967
23.595	934.959
23.598	1260.163
24.181	609.757
25.762	1585.365
25.764	1788.619
26.150	1056.912
27.327	894.310
27.717	609.757
27.920	1260.163
28.305	447.155
28.308	731.707
29.888	1544.716
30.273	772.359
31.064	1341.464
31.265	1788.619
31.650	975.611
32.048	1422.765
34.592	406.505
34.992	1219.512
36.965	1991.871
38.728	1504.066
40.302	1747.967
41.296	2967.481
61.744	4552.846
64.508	5853.659
71.211	8252.033
101.513	13008.131];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'fork length','wet weight','female'};  
bibkey.LW_f = 'Daws2021';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % fork length (cm), wet weight (g)
5.324	1016.260
8.078	1300.813
8.658	325.204
11.020	813.008
14.944	243.903
18.084	40.649
18.092	731.707
18.096	1138.213
21.036	447.155
21.827	975.611
22.412	528.456
23.798	1666.666
28.312	1178.862
29.493	1341.464
29.882	975.611
31.461	1707.318
33.222	934.959
33.423	1463.415
33.819	1747.967
34.983	284.553
35.586	1666.666
36.371	1504.066
36.381	2520.326
37.545	1097.561
37.943	1626.017
38.534	1747.967
39.323	2032.520
40.109	2113.821
40.113	2520.326
41.681	2113.821
42.470	2398.374
43.450	2154.473
43.651	2682.926
44.819	1544.716
46.004	2235.774
47.983	3699.189
48.959	3008.131
52.680	1829.268
52.889	3130.081
54.065	2764.227
56.834	4674.797
58.210	4715.448
59.776	4186.993
59.776	4227.642
64.109	5284.554
65.285	5040.651
65.682	5447.156
68.830	5853.659
70.783	4674.797
71.004	7235.773
73.165	7154.472
73.167	7398.374
73.959	8008.131
78.284	8292.683
79.462	8252.033
84.979	9796.748
113.100	12601.626
113.391	22154.471];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'fork length','wet weight','male'};  
bibkey.LW_m = 'Daws2021';
comment.LW_m = 'data for males';

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Marine; demersal; subtropical';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W3LB'; % Cat of Life
metaData.links.id_ITIS = '168546'; % ITIS
metaData.links.id_EoL = '46580673'; % Ency of Life
metaData.links.id_Wiki = 'Lopholatilus_chamaeleonticeps'; % Wikipedia
metaData.links.id_ADW = 'Lopholatilus_chamaeleonticeps'; % ADW
metaData.links.id_Taxo = '45214'; % Taxonomicon
metaData.links.id_WoRMS = '159406'; % WoRMS
metaData.links.id_fishbase = 'Lopholatilus-chamaeleonticeps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lopholatilus_chamaeleonticeps}}';
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
bibkey = 'Daws2021'; type = 'phdthesis'; bib = [ ... 
'author = {Katy Dawson}, ' ... 
'year = {2021}, ' ...
'title = {Age, growth, and otolith microchemistry of the golden tilefish (\emph{Lopholatilus chamaeleonticeps}) in the {N}{W} {A}tlantic}, ' ...
'school = {Michigan Technological University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lopholatilus-chamaeleonticeps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

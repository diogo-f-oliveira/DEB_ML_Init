function [data, auxData, metaData, txtData, weights] = mydata_Gammarus_minus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Gammaridae';
metaData.species    = 'Gammarus_minus'; 
metaData.species_en = 'Freshwater shrimp'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww0-Wwt'; 'Wd-pD'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 22];

%% set data
% zero-variate data 
data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(10.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Fong2019';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Wwb = 0.123e-3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Gammarus roeselii';
data.Wwp = 0.0109/6;    units.Wwp = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwp/Wwi ratio of Gammarus roeselii: 0.0109/6';
data.Wwi = 0.0109;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'GlazButl2011','Fong2019'};
  comment.Wwi = 'based in Wwi and Li=0.67*Lim: 0.67^3*Wwim';
data.Wwim = 0.0362;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight'; bibkey.Wwim = 'GlazButl2011';
  comment.Wwim = 'based in WW data, assuming that they are males';

data.Ri  = 90/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Gammarus roeselii';  

% uni-variate data

% weight-weight
data.WW = [ ... % 10log wet weight at t (mg), 10log wet weight at t+21 d (mg)
0.067	0.286
0.124	0.551
0.172	0.523
0.217	0.551
0.286	0.519
0.316	0.599
0.341	0.515
0.344	0.563
0.379	0.507
0.381	0.796
0.382	0.547
0.406	0.551
0.416	0.579
0.423	0.647
0.431	0.925
0.434	0.467
0.437	0.567
0.446	0.836
0.463	0.784
0.492	0.631
0.508	0.768
0.591	0.772
0.593	0.909
0.602	1.202
0.608	0.732
0.625	0.776
0.635	0.844
0.638	0.888
0.643	0.740
0.656	0.764
0.676	0.872
0.703	0.957
0.704	0.892
0.716	1.093
0.732	0.816
0.738	0.909
0.759	0.876
0.762	0.957
0.771	1.157
0.783	0.868
0.793	0.900
0.807	0.961
0.828	0.856
0.830	1.125
0.846	1.298
0.851	0.969
0.880	1.310
0.880	0.792
0.889	1.101
0.893	0.965
0.893	0.925
0.924	0.977
0.927	1.045
0.961	1.093
0.975	1.037
0.989	1.009
0.990	1.318
1.001	1.250
1.002	1.117
1.003	1.033
1.006	0.997
1.030	1.041
1.098	1.174
1.105	1.121
1.115	1.282
1.115	1.230
1.119	1.161
1.123	1.117
1.135	1.270
1.136	1.198
1.139	1.234
1.152	1.414
1.180	1.370
1.180	1.314
1.184	1.166
1.188	1.202
1.215	1.178
1.237	1.479
1.255	1.451
1.286	1.451
1.355	1.398
1.366	1.374
1.372	1.507
1.375	1.467
1.386	1.386
1.389	1.527
1.410	1.491
1.430	1.527
1.468	1.567
1.472	1.495
1.506	1.559];
data.WW = 10.^data.WW/1e3; % remove log transform
units.WW   = {'d', 'g'};  label.WW = {'wet weight at t', 'wet weight at t+21d'};  
temp.WW    = C2K(10.5);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
bibkey.WW = 'GlazButl2011'; comment.WW = 'temp 9-12 C in Petersburg Spring, mid-Appalachians west to the Ozarks, North America';

% dry weight-metabolic rate
data.WpD = [ ... % 10log dry weight (mug), 10log metabolic rate (J/h)
2.210	-2.258
2.357	-2.073
2.398	-2.287
2.433	-2.119
2.797	-1.842
2.814	-2.102
2.838	-2.206
2.855	-1.668
2.856	-1.865
2.862	-2.304
2.869	-1.853
2.883	-1.605
2.917	-1.755
2.928	-1.986
2.948	-1.622
2.958	-1.691
2.969	-2.003
3.003	-1.755
3.017	-1.535
3.018	-1.703
3.024	-1.743
3.025	-1.807
3.041	-1.628
3.048	-1.772
3.055	-1.668
3.065	-1.477
3.068	-1.714
3.086	-1.605
3.087	-1.558
3.092	-1.749
3.103	-2.281
3.110	-1.437
3.120	-1.784
3.127	-1.454
3.141	-1.628
3.154	-1.813
3.168	-1.552
3.185	-1.373
3.189	-1.593
3.202	-1.720
3.237	-1.489
3.240	-1.616
3.244	-2.015
3.247	-1.431
3.248	-1.466
3.281	-1.558
3.282	-1.506
3.292	-1.732
3.302	-1.842
3.319	-1.587
3.326	-1.425
3.333	-1.396
3.357	-1.298
3.367	-1.639
3.398	-1.333
3.408	-1.281
3.412	-1.610
3.426	-1.298
3.460	-1.379
3.498	-1.240
3.505	-1.518
3.515	-1.454
3.546	-1.269
3.563	-1.350
3.573	-1.437
3.580	-1.258
3.594	-1.269
3.595	-1.420
3.625	-1.188
3.656	-1.281
3.659	-1.235
3.673	-1.194
3.725	-1.159
3.731	-1.304
3.865	-0.940];
data.WpD = 10.^data.WpD; % remove log transform
data.WpD(:,1) = data.WpD(:,1)*1e-6; data.WpD(:,2) = data.WpD(:,2)*24; % convert to g, J/d
units.WpD   = {'g', 'J/d'};  label.WpD = {'dry weight', 'dissipating heat'};  
temp.WpD    = C2K(10.5);  units.temp.WpD = 'K'; label.temp.WpD = 'temperature';
bibkey.WpD = 'GlazButl2011'; comment.WpD = 'temp 9-12 C in Petersburg Spring, mid-Appalachians west to the Ozarks, North America';

%% set weights for all real data
weights = setweights(data, []);
weights.WW = weights.WW * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.WW = weights.WW * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for 16 C'};
% set2 = {'tW_f2','tW_m2'}; subtitle2 = {'Data for 20 C'};
% set3 = {'tW_f3','tW_m3'}; subtitle3 = {'Data for 8 C'};
% set4 = {'tW_f4','tW_m4'}; subtitle4 = {'Data for 12 C'};
% metaData.grp.sets = {set1,set2,set3,set4};
% metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3F8FX'; % Cat of Life
metaData.links.id_ITIS = '573812'; % ITIS
metaData.links.id_EoL = '342537'; % Ency of Life
metaData.links.id_Wiki = 'Gammarus'; % Wikipedia
metaData.links.id_ADW = 'Gammarus_minus'; % ADW
metaData.links.id_Taxo = '389318'; % Taxonomicon
metaData.links.id_WoRMS = '490261'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GlazButl2011'; type = 'Article'; bib = [ ... 
'doi = {10.1890/11-0264.1}, ' ...
'author = {Glazier, D. S. and Butler, E. M. and Lombardi, S. A. and Deptola, T. J. and Reese, A. J. and Satterthwaite, E. V.}, ' ... 
'year = {2011}, ' ...
'title = {Ecological effects on metabolic scaling: amphipod responses to fish predators in freshwater springs}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {81(4)}, ' ...
'pages = {599–618}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fong2019'; type = 'incollection'; bib = [ ... 
'doi = {10.1016/b978-0-12-814124-3.00054-6}, ' ...
'author = {Fong, D. W.}, ' ... 
'year = {2019}, ' ...
'title = {\emph{Gammarus minus}: {A} model system for the study of adaptation to the cave environment}, ' ...
'booktitle = {Encyclopedia of Caves}, ' ...
'publisher = {Academic Press}, ' ...
'editor = {William B. White and David C. Culver and Tanja Pipan}, ' ...
'chapter = {54}, ' ...
'pages = {451–458}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


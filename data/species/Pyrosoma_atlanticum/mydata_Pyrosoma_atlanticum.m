function [data, auxData, metaData, txtData, weights] = mydata_Pyrosoma_atlanticum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Pyrosomida'; 
metaData.family     = 'Pyrosomatidae';
metaData.species    = 'Pyrosoma_atlanticum'; 
metaData.species_en = 'Tube tunicate';

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(20); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-Ww', 'Ww-JO'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 29]; 


%% set data
% zero-variate data;
data.ab = 1.7;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 90;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'data for a zooid, a colony can live forever; dead zooids are replaced';

data.Lp  = 4;  units.Lp  = 'cm';  label.Lp  = 'colony length at puberty';   bibkey.Lp  = 'Soes1981';
  comment.Li = '4-6 cm';
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate colony length';   bibkey.Li  = 'MillSant2019';
  comment.Li = 'MillSant2019 gives 26 cm, HensPakh2019 reports till 20 m; LWw data of HensPakh2019 has 38 cm';

data.Wwb  = 1.4e-5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'MillSant2019';
  comment.Wwb = 'based on egg diameter of 0.3 mm of B. schlosseri : pi/6*0.03^3';

data.Ri  = 15e6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data
% length - weight
data.LWw = [ ... % length of colony (cm), wet weight (g)
0.368	0.590
0.980	0.887
1.348	0.311
2.083	0.899
2.267	0.902
2.696	1.196
2.941	1.489
3.186	0.912
3.554	2.945
3.922	2.080
4.657	2.668
4.841	2.670
5.392	4.996
5.699	6.449
5.882	16.596
5.944	3.843
6.127	7.033
6.373	5.007
6.801	8.490
6.985	10.232
7.292	9.076
7.292	7.047
7.598	7.920
7.659	14.008
8.088	10.824
8.578	10.540
8.824	7.354
9.130	14.314
9.191	10.257
9.498	15.188
9.804	18.090
10.355	16.647
10.539	20.418
11.275	16.658
11.336	23.326
11.826	28.259
13.051	25.374
14.828	41.047
15.441	72.938
16.176	42.512
16.544	48.313
17.157	43.103
18.566	73.554
18.627	65.149
19.118	73.561
23.529	109.554
24.939	109.860
26.348	89.297];
units.LWw = {'cm', 'g'}; label.LWw = {'length of colony', 'wet weight', 'MillSant2019'};  
bibkey.LWw = 'MillSant2019'; 

data.LWw1 = [ ... % colony length (cm), wet weight (g)
0.000	25.954
0.239	3.562
0.239	18.321
0.419	6.107
0.538	34.097
1.136	1.527
1.555	2.545
1.794	1.527
2.152	1.527
2.691	1.527
2.870	3.053
3.587	3.053
4.006	2.545
4.305	1.527
4.425	15.267
4.843	5.598
5.022	3.562
5.441	3.562
5.561	6.616
5.979	8.143
5.979	4.071
6.398	3.562
6.398	7.125
6.457	10.178
6.756	5.598
6.816	6.616
6.936	9.669
7.175	5.598
7.294	11.705
7.354	6.616
7.593	9.669
7.892	13.740
7.892	7.634
8.072	11.705
8.490	13.740
8.729	7.125
8.729	10.687
9.028	5.598
9.088	14.758
9.746	18.321
9.746	13.740
10.045	8.143
10.045	17.812
10.404	27.990
10.762	11.705
10.882	18.321
11.001	6.107
11.360	20.356
11.480	5.089
11.540	7.125
11.599	15.776
11.719	19.338
11.719	22.392
11.958	25.954
12.197	11.196
12.676	17.812
12.855	13.740
13.034	25.445
13.393	30.025
13.632	36.132
13.632	25.445
13.632	13.740
13.812	17.812
13.871	21.883
14.051	36.132
14.111	29.517
14.410	15.267
14.589	29.517
14.649	32.570
14.888	27.990
14.948	42.239
15.366	30.025
16.024	35.623
16.024	30.025
16.024	15.776
16.741	49.873
16.981	40.204
16.981	33.588
17.100	44.275
17.698	31.043
17.758	53.944
18.416	36.641
18.535	42.239
18.774	79.898
20.090	79.389
20.568	53.435
20.688	81.425
21.525	72.774
21.883	98.728
22.123	92.112
22.720	73.791
23.617	93.130
23.916	116.539
24.155	82.443
24.873	103.308
25.172	97.201
31.091	147.074
32.287	135.369
32.466	158.779
37.608	134.351];
units.LWw1 = {'cm', 'g'}; label.LWw1 = {'length of colony', 'wet weight', 'HensPakh2019'};  
bibkey.LWw1 = 'HensPakh2019'; 

% weight - respiration
data.WJO = [ ... % colony wet weight (g), respiration rate (ml O2/h)
5.255	0.032
6.306	0.054
6.982	0.048
8.033	0.054
12.838	0.149
15.015	0.132
15.315	0.160
17.417	0.127
23.499	0.308
24.850	0.269
26.051	0.259
32.057	0.264
43.018	0.385];
units.WJO = {'g', 'ml O_2/h'}; label.WJO = {'colony wet weight', 'respiration rate'};  
temp.WJO = C2K(17); units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'HensPakh2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;
weights.LWw1(1:5) = 0;
weights.tp = 3 * weights.tp;
weights.Lp = 3 * weights.Lp;
weights.WJO = 5 * weights.WJO;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw','LWw1'}; subtitle1 = {'Data from MillSant2019, HensPakh2019'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Data refers to colony; length of colony relates to weight almost as a V1-morph, but zooids are probably isomorphic';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Pelagic colonial tunicate, which can reproduce asexually, also as colony';
metaData.bibkey.F1 = 'oceana';
F2 = 'P. atlanticum exhibits dielvertical migration to a maximum depth of 800–1000 m';
metaData.bibkey.F2 = 'HensPakh2019';
F3 = 'Hermaphroditic; external fertilisation';
metaData.bibkey.F3 = 'Wiki';
F4 = 'Clearance rate in L/h: 0.0558 * (colony length in mm)^1.174';
metaData.bibkey.F4 = 'HensPakh2019';
F5 = 'Strongly bioluminescent in flashes';
metaData.bibkey.F5 = 'Bone1998';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5);

%% Links
metaData.links.id_CoL = '4QVDK'; % Cat of Life
metaData.links.id_ITIS = '159636'; % ITIS
metaData.links.id_EoL = '46585533'; % Ency of Life
metaData.links.id_Wiki = 'Pyrosoma_atlanticum'; % Wikipedia
metaData.links.id_ADW = 'Pyrosoma_atlanticum'; % ADW
metaData.links.id_Taxo = '41549'; % Taxonomicon
metaData.links.id_WoRMS = '137250'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pyrosoma_atlanticum}}'; 
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
bibkey = 'MillSant2019'; type = 'article'; bib = [ ...
'author = {Rebecca R. Miller and Jarrod A. Santora and Toby D. Auth and Keith M. Sakuma and Brian K. Wells and John C. Field and Richard D. Brodeur}, ' ...
'year = {2019}, ' ...
'title  = {Distribution of pelagic thaliaceans, \emph{Thetys vagina} and \emph{Pyrosoma atlanticum}, during a period of mass occurrence within the {C}alifornia Current}, ' ...
'journal = {CalCOFI Rep.}, ' ...
'volume = {60}, '...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HensPakh2019'; type = 'article'; bib = [ ...
'author = {Henschke, N. and Pakhomov, E. A. and Kwong, L. E. and Everett, J. D. and Laiolo, L. and Coghlan, A. R. and Suthers, I. M.}, ' ...
'doi = {10.1029/2018JG004918}, ' ...
'year = {2019}, ' ...
'title  = {Large vertical migrations of \emph{Pyrosoma atlanticum} play an important role inactive carbon transport}, ' ...
'journal = {Journal ofGeophysical Research: Biogeosciences}, ' ...
'volume = {124}, '...
'pages = {1056–1070}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bone1998'; type = 'Book'; bib = [ ... 
'author = {Bone, Q.}, ' ...
'year = {1998}, ' ...
'title  = {The biology of pelagic tunicates}, ' ...
'publisher = {Oxfor Univ Press Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Soes1981'; type = 'article'; bib = [ ...
'author = {Van Soest, R. W. M.}, ' ...
'doi = {10.1093/plankt/3.4.603}, ' ...
'year = {1981}, ' ...
'title  = {A monograph of the order {P}yrosomatida ({T}unicata, {T}haliacea)}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {3(4)}, '...
'pages = {603–631}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'oceana'; type = 'Misc'; bib = ...
'howpublished = {\url{https://oceana.org/marine-life/giant-pyrosome/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



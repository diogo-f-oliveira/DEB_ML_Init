function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_nudus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_nudus'; 
metaData.species_en = 'Rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'ZhuaZhan2020';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 23.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 16.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 177;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.GSI  = 0.175;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'MishGanz2006';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
0.588	8.178
0.605	7.696
1.437	8.863
1.611	8.181
1.957	10.469
2.183	9.587
2.217	8.985
2.235	11.152
2.236	9.908
2.287	9.628
2.460	9.668
2.720	9.749
2.755	9.509
2.772	9.348
2.807	9.709
2.841	10.552
2.859	9.910
2.980	10.312
2.997	10.633
3.015	11.556
3.032	11.235
3.048	11.395
3.049	9.991
3.066	10.914
3.067	11.917
3.084	13.241
3.101	10.352
3.117	11.716
3.118	12.078
3.119	10.232
3.136	12.519
3.171	10.754
3.172	13.161
3.185	9.309
3.186	9.470
3.187	11.155
3.188	11.235
3.221	9.751
3.222	10.914
3.223	12.279
3.224	12.961
3.240	12.680
3.241	13.362
3.257	11.115
3.292	10.232
3.293	10.553
3.294	11.677
3.309	12.078
3.465	14.125
3.483	11.397
3.484	9.150
3.517	10.835
3.604	12.761
3.656	10.234
3.691	13.363
3.708	13.484
3.760	11.036
3.777	13.725
3.795	10.675
3.796	10.234
3.810	12.200
3.811	12.040
3.812	9.833
3.829	10.435
3.847	11.398
3.862	13.123
3.863	12.602
3.864	11.799
3.865	11.518
3.866	11.117
3.867	10.796
3.951	14.528
3.967	12.481
3.968	14.006
3.985	11.559
4.037	13.284
4.072	12.723
4.124	13.004
4.158	15.451
4.159	12.442
4.176	13.525
4.228	12.201
4.245	13.445
4.280	13.766
4.314	12.884
4.315	12.844
4.332	12.202
4.434	14.449
4.435	13.727
4.436	12.122
4.437	10.075
4.471	11.360
4.488	14.650
4.489	11.640
4.505	12.202
4.523	14.088
4.524	13.045
4.540	15.452
4.541	13.446
4.555	16.135
4.556	12.564
4.557	12.403
4.558	11.922
4.575	14.971
4.592	15.332
4.593	14.128
4.594	13.326
4.595	12.764
4.644	14.209
4.661	13.968
4.696	11.280
4.783	15.052
4.817	11.842
4.869	12.845
4.973	14.210
5.025	16.457
5.043	13.688
5.112	15.213
5.129	14.612
5.181	13.809
5.251	15.575
5.372	11.483
5.441	14.813
5.458	11.042
5.459	15.054
5.474	12.406
5.475	15.897
5.476	16.057
5.511	13.570
5.528	14.813
5.615	15.496
5.701	10.521
5.753	13.450
5.821	14.373
5.822	14.212
5.823	13.410
5.824	11.725
5.840	13.209
5.841	10.722
5.857	11.163
5.875	11.765
5.961	14.815
6.013	14.374
6.117	14.534
6.152	15.578
6.291	13.572
6.325	18.908
6.360	19.109
6.377	19.551
6.395	20.112
6.396	17.504
6.412	18.267
6.464	15.378
6.499	14.415
6.603	15.017
6.620	14.536
6.637	13.653
6.724	14.095
6.759	11.166
6.793	11.487
6.811	15.179
6.828	14.617
6.829	10.845
6.845	12.530
6.846	13.614
6.863	11.126
6.897	13.494
7.019	13.815
7.331	20.236
7.348	19.473
7.365	19.152
7.487	11.770
7.504	16.063
7.573	17.869
7.591	16.224
7.608	17.027
7.625	14.058
7.660	14.900
7.675	15.221
7.676	15.663
7.677	18.913
7.695	17.187
7.747	14.299
7.764	11.651
7.765	18.191
7.798	11.731
7.799	15.944
7.833	12.052
8.475	14.622
8.509	12.335
8.527	17.792
8.613	14.061
8.647	16.227
8.648	13.338
8.683	15.345
8.769	17.512
8.787	14.262
9.099	18.275
9.359	21.085
9.584	15.588
9.601	14.385
9.809	16.351
10.555	16.875];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZhuaZhan2020'; 
comment.tL = 'data from Penglai';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
%D2 = 'Data Wwp and Wwi are at odds with LW data and ignored';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7NZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_nudus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5661544'; % Taxonomicon
metaData.links.id_WoRMS = '1014590'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-nudus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_nudus}}';
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
bibkey = 'ZhuaZhan2020'; type = 'article'; bib = [ ... 
'doi = {10.1007/s00343-019-8303-x}, ' ...
'author = {Zhuang, Longchuan and Zhang, Chi and Liu, Qun and Ye, Zhenjiang},' ...
'year = {2020}, ' ...
'title = {Age, growth, reproductive biology, color pattern, and ontogenetic divergence of two closely related rockfishes  (\emph{Sebastes koreanus}  and  \emph{S. nudus}) off  the coasts of the {S}handong {P}eninsula, {C}hina}, ' ...
'journal = {Journal of Oceanology and Limnology}, ' ...
'volume = {38(1)}, ' ...
'pages = {204-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-nudus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

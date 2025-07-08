function [data, auxData, metaData, txtData, weights] = mydata_Pronotogrammus_martinicensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anthiadidae';
metaData.species    = 'Pronotogrammus_martinicensis'; 
metaData.species_en = 'Roughtongue bass'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 24];

%% set data
% zero-variate data

data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(21.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on sex change at TL 7.6 cm';
data.Li  = 20;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 4;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0569*Lp^2.650, see F1';
data.Wwi = 160;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0569*Li^2.650, see F1';

data.Ri  = 393/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(21.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'females become males at SL 7.63 cm';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.529	6.423
0.531	4.173
0.544	8.673
0.550	3.798
0.568	3.189
1.507	10.223
1.508	9.707
1.509	9.004
1.545	8.067
1.546	7.692
1.547	7.129
1.549	5.536
1.563	8.442
1.583	6.801
2.490	11.023
2.508	10.273
2.512	7.320
2.544	10.601
2.547	8.257
2.562	10.086
2.564	8.586
2.565	7.789
2.581	9.804
2.582	9.523
2.599	9.054
3.455	11.494
3.491	10.557
3.512	8.401
3.526	10.182
3.527	9.807
3.528	9.479
3.529	9.057
3.530	8.073
3.545	10.932
3.546	8.823
3.566	7.417
3.567	7.417
3.620	7.604
3.639	6.948
4.474	11.263
4.475	10.185
4.476	9.763
4.477	9.576
4.490	12.107
4.491	11.685
4.492	10.841
4.493	9.294
4.494	9.107
4.495	8.310
4.510	10.560
4.514	7.279
4.527	11.544
4.531	8.591
5.456	11.828
5.474	11.641
5.476	10.422
5.495	9.625
5.496	9.063
5.507	14.266
5.509	12.297
5.511	11.079
5.512	10.750
5.515	7.985
5.531	8.922
5.548	10.001
5.549	9.251
5.566	10.094
6.422	11.175
6.442	9.863
6.456	12.909
6.495	10.566
6.496	9.441
6.497	8.925
6.529	11.597
6.532	9.582
6.566	10.894
6.567	10.144
7.459	11.787
7.461	10.006
7.479	9.819
7.495	11.225
7.496	10.663
7.513	10.897
7.548	12.022
7.566	11.647
8.443	10.806
8.480	10.197
8.481	10.056
8.494	13.103
8.497	10.525
8.498	9.540
8.517	9.119
8.550	11.322
9.444	10.621
9.464	9.496
9.498	11.043
9.515	11.747
9.516	10.200
10.462	11.749
10.465	9.031
10.482	9.968
10.517	10.250
11.554	10.909
12.426	13.536
13.484	11.524
15.469	10.358];
data.tL(:,1) = 365*(data.tL(:,1) + 0); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(21.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McBrSula2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'sex change from female to male at 7.6 cm, mimicked by a change in f, but actually {p_Am} changes';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight of Pseudanthias_squamipinnis: W in g = 0.0569*(TL in cm)^2.650';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W9QZ'; % Cat of Life
metaData.links.id_ITIS = '643155'; % ITIS
metaData.links.id_EoL = '46579586'; % Ency of Life
metaData.links.id_Wiki = 'Pronotogrammus'; % Wikipedia
metaData.links.id_ADW = 'Pronotogrammus_martinicensis'; % ADW
metaData.links.id_Taxo = '691680'; % Taxonomicon
metaData.links.id_WoRMS = '282365'; % WoRMS
metaData.links.id_fishbase = 'Pronotogrammus-martinicensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pronotogrammus}}';
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
bibkey = 'McBrSula2009'; type = 'Article'; bib = [ ... 
'author = {Richard S. McBride and Kenneth J. Sulak and Paul E. Thurman and Adam K. Richardson}, ' ... 
'year = {2009}, ' ...
'title = {Age, Growth, Mortality, and Reproduction of Roughtongue Bass, \emph{Pronotogrammus martinicensis} ({S}erranidae), in the {N}ortheastern {G}ulf of {M}exico}, ' ...
'journal = {Gulf of Mexico Science}, ' ...
'volume = {2009(1)}, ' ...
'pages = {30–38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pronotogrammus-martinicensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


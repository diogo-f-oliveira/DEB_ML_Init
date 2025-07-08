function [data, auxData, metaData, txtData, weights] = mydata_Brama_brama
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Bramidae';
metaData.species    = 'Brama_brama'; 
metaData.species_en = 'Atlantic pomfret'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 22];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 50;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'guess'; 
data.Li  = 100;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Rich2003';
  comment.Wwb = 'based on guessed egg diameter of 1.575 mm: pi/6*.1575^3';

data.Ri  = 1e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
3.354	32.756
4.370	38.397
4.371	37.166
4.386	35.759
4.387	34.000
4.478	37.871
4.494	37.343
4.556	36.464
4.617	38.576
4.648	36.290
4.663	38.752
4.771	37.522
5.341	40.168
5.356	42.103
5.357	40.168
5.357	38.057
5.449	42.280
5.496	38.235
5.526	40.170
5.572	42.281
5.681	38.062
5.696	40.876
5.727	39.117
6.281	44.928
6.312	42.994
6.342	45.809
6.343	40.532
6.344	39.301
6.358	42.643
6.374	44.050
6.406	38.422
6.544	40.007
6.558	45.284
6.559	43.877
6.559	41.942
6.621	39.129
6.729	41.768
6.729	39.306
6.790	42.472
6.791	40.538
7.314	46.700
7.314	45.469
7.315	41.072
7.329	47.228
7.330	43.886
7.406	46.877
7.407	40.546
7.453	42.481
7.483	45.471
7.484	44.240
7.515	40.547
7.546	39.140
7.639	39.845
7.639	39.141
7.700	43.715
7.746	42.133
7.762	41.253
7.762	40.022
7.776	44.947
7.839	42.310
8.301	45.481
8.302	39.150
8.331	46.889
8.348	41.788
8.363	43.723
8.392	49.000
8.424	45.483
8.439	46.890
8.485	48.298
8.533	41.439
8.563	43.550
8.641	41.440
8.763	46.015
8.763	45.135
8.764	43.377
9.302	49.539
9.302	48.308
9.395	46.902
9.410	49.716
9.441	47.958
9.487	49.366
10.258	50.255
10.304	50.783
10.427	51.312
10.443	49.026
10.489	49.906
11.321	50.444
11.445	51.149
11.459	54.491
11.460	52.732
12.430	56.438];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LoboErzi2001';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
32.365	351.307
33.927	441.176
35.287	433.007
36.247	433.007
36.529	580.065
36.648	514.706
36.729	571.895
37.168	531.046
37.169	571.895
37.567	473.856
37.649	596.405
37.770	661.765
37.808	539.216
38.170	604.575
38.171	669.935
38.531	669.935
38.608	539.216
38.609	571.895
38.650	629.085
38.851	710.784
38.968	539.216
39.050	620.915
39.091	686.275
39.569	555.556
39.571	678.105
39.612	751.634
39.889	596.405
39.932	767.974
40.251	678.105
40.252	776.144
40.410	629.085
40.492	767.974
40.770	629.085
40.773	825.163
40.852	767.974
40.975	931.373
41.013	841.503
41.051	669.935
41.372	743.464
41.374	866.013
41.490	637.255
41.491	702.614
41.693	800.654
41.694	866.013
41.852	776.144
41.890	661.765
42.211	694.444
42.215	923.203
42.332	735.294
42.490	637.255
42.491	710.784
42.493	833.333
42.655	931.373
42.812	784.314
42.974	866.013
43.172	735.294
43.172	767.974
43.293	849.673
43.295	931.373
43.455	964.052
43.492	767.974
43.573	833.333
43.653	849.673
44.132	751.634
44.136	996.732
44.173	816.993
44.334	890.523
44.376	1013.072
44.573	792.484
44.575	931.373
44.736	996.732
44.853	849.673
44.855	915.033
45.096	996.732
45.376	1021.242
45.415	931.373
45.696	996.732
45.817	1053.922
46.057	1062.092
46.058	1143.791
46.415	964.052
46.456	1029.412
46.698	1160.131
46.819	1225.490
46.896	1037.582
47.095	964.052
47.179	1192.810
47.336	1037.582
47.461	1290.850
47.499	1192.810
47.618	1160.131
47.657	1086.601
48.418	1127.451
48.457	1070.261
48.499	1192.810
48.500	1282.680
48.536	1029.412
48.741	1348.039
48.904	1519.608
48.941	1348.039
48.983	1454.248
49.219	1192.810
49.539	1168.301
49.581	1315.359
49.902	1364.379
50.182	1397.059
50.422	1397.059
50.583	1462.418
50.659	1168.301
52.785	1568.627
53.069	1797.386
54.503	1470.588
55.913	2042.484];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'LoboErzi2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'An oceanic and epipelagic species, also found to 1,000 m depth. Occasionally comes close to shore ';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.01';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '693C2'; % Cat of Life
metaData.links.id_ITIS = '687077'; % ITIS
metaData.links.id_EoL = '46577908'; % Ency of Life
metaData.links.id_Wiki = 'Brama_brama'; % Wikipedia
metaData.links.id_ADW = 'Brama_brama'; % ADW
metaData.links.id_Taxo = '45040'; % Taxonomicon
metaData.links.id_WoRMS = '126783'; % WoRMS
metaData.links.id_fishbase = 'Brama-brama'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brama_brama}}';
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
bibkey = 'Rich2003'; type = 'Book'; bib = [ ... 
'author = {Richards, W. J.}, ' ...
'year = {2003}, ' ...
'title  = {Early stages of Atlantic fishes: An identification guide of the western central North Atlantic}, ' ...
'publisher = {Taylor \& Francis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LoboErzi2001'; type = 'Article'; bib = [ ... 
'author = {Carina Lobo and Karim Erzini}, ' ... 
'year = {2001}, ' ...
'title = {Age and growth of Ray''s bream (\emph{Brama brama}) from the south of {P}ortugal}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {51}, ' ...
'pages = {343-347}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Brama-brama.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

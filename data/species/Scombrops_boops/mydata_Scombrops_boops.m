function [data, auxData, metaData, txtData, weights] = mydata_Scombrops_boops

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Scombropidae';
metaData.species    = 'Scombrops_boops'; 
metaData.species_en = 'Gnomefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 04];

%% set data
% zero-variate data

data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 75;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on 15 to 20 cm SL and SL= 0.85*TL, from photo';
data.Li  = 150;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
  comment.Li = 'based on 45 cm SL, using SL= 0.85*TL, from photo';

data.Wwb = 3.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm: pi/6*0.09^3';
data.Wwp = 4.9e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.02, see F1';
data.Wwi = 40e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max publish weight 16.1 kg; based on 0.01072*Li^3.02, see F1, gives 40 kg';

data.Ri  = 7.8e6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.94e6 eggs per kg per yr for Semicossyphus pulcher: 1.94e6*40/365';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), otolith radius (mm) 
    1 4.05
    2 5.60
    3 6.80
    4 7.85
    5 8.85
    6 9.45
    7 9.95
    8 10.40
    9 10.80
   10 11.15
   11 11.45
   12 11.75];
data.tL(:,1) = 365 * (.75 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = (34.07+16.05*data.tL(:,2)+3.08*data.tL(:,2).^2)/10; % convert otolith radius in mm to std length in cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Moch1979';
  
% length-weight
data.LW = [ ... % std length (cm), weight (g)
6.037	4.087
6.349	4.996
6.716	6.315
7.063	8.348
7.183	6.980
7.387	8.534
7.429	9.437
7.857	11.155
8.081	12.061
8.081	11.533
8.311	11.403
8.404	12.750
8.404	12.057
8.404	12.330
8.692	13.785
8.692	13.035
8.741	13.330
8.889	15.761
8.989	15.585
9.091	17.622
9.349	16.848
9.615	19.049
9.778	18.214
10.056	21.534
10.113	25.181
10.170	31.138
10.227	29.776
10.342	32.924
10.459	21.289
10.878	29.763
10.939	30.777
11.124	35.986
11.313	31.465
11.441	33.645
12.237	39.326
12.306	41.122
12.585	49.168
13.311	63.557
13.613	61.451
13.844	63.539
15.143	79.407
15.143	79.407
15.487	80.287
15.927	103.804
15.927	99.265
16.017	97.066
16.107	84.879
16.289	125.507
16.289	110.987
16.380	108.529
16.472	100.357
16.565	117.352
16.565	75.044
16.752	135.695
16.941	119.987
17.036	135.680
17.132	132.675
17.325	145.074
17.619	140.274
17.718	175.407
17.718	155.113
17.718	148.331
17.818	164.023
18.019	169.603
18.019	143.422
18.120	143.417
18.324	160.365
18.324	137.135
18.427	187.523
19.058	171.442
19.165	185.388
19.381	187.457
19.490	219.203
19.600	185.359
20.044	226.634
20.271	207.232
20.499	247.795
20.614	221.580
20.847	183.220
21.082	270.921
21.201	234.271
21.440	277.013
21.682	242.222
21.803	283.243
21.803	259.014
21.803	207.127
22.550	306.223
22.550	299.453
22.676	283.165
22.932	323.786
23.191	299.395
23.191	258.903
23.321	279.963
23.584	299.360
23.717	353.991
23.717	378.546
24.666	391.348
24.805	404.678
24.805	323.610
24.945	349.934
24.945	338.394
25.226	452.483
25.368	391.272
25.654	494.751
25.943	432.614
25.943	462.622
25.943	404.552
25.943	365.834
26.236	553.175
26.236	473.044
26.236	427.772
26.532	534.891
27.134	578.334
27.286	517.152
27.286	559.240
27.286	534.787
27.286	462.460
27.440	632.382
27.905	500.020
27.905	457.248
28.062	565.416
28.062	540.693
28.538	639.316
29.022	632.136
29.186	597.753
29.350	722.818
29.848	739.073
30.015	618.017
30.184	747.322
30.525	706.646
30.696	675.721
30.869	790.154
30.869	844.964
31.217	781.310
31.925	893.323
32.285	903.294
32.467	903.258
32.650	923.642
33.018	1056.142
33.018	844.569
33.767	1221.129
33.957	883.015
34.148	825.705
34.340	1032.512
34.727	863.359
35.119	1207.227
35.515	1020.797
35.915	1276.418
36.320	1459.525
36.320	1395.707
36.525	1154.125
37.353	1411.120
37.563	1349.365
37.563	1261.837
37.987	1179.895
38.631	1560.098
38.631	1334.107
39.508	1668.055
39.508	1475.069
39.508	1442.459
39.730	1844.517
40.631	1783.413
41.320	1950.007
41.320	1743.783
41.787	2061.931
42.495	2061.690
43.216	1949.399
43.459	2279.529
43.459	2155.625
44.197	2520.483
45.709	2605.825
45.966	2849.465
46.225	2154.702
46.485	3150.786
47.539	2979.060
49.720	3367.767
55.934	3721.142
59.161	4651.515
60.843	5561.344
69.219	8216.629];
units.LW   = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'Moch1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wwp and Wwi are ignorned due to inconsistecy with LW data';
D2 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length weight: Ww in g = 0.01072*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTYH'; % Cat of Life
metaData.links.id_ITIS = '645496'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scombrops_boops'; % Wikipedia
metaData.links.id_ADW = 'Scombrops_boops'; % ADW
metaData.links.id_Taxo = '187083'; % Taxonomicon
metaData.links.id_WoRMS = '220088'; % WoRMS
metaData.links.id_fishbase = 'Scombrops-boops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scombrops_boops}}';
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
bibkey = 'Moch1979'; type = 'Article'; bib = [ ... 
'author = {Kenji Mochizuki}, ' ... 
'year = {1979}, ' ...
'title = {Age and Growth of the Two {J}apanese {S}combropids, \emph{Scombrops boops} and \emph{S. gilberti}}, ' ...
'journal = {Japanese Journal of Ichthyology}, ' ...
'volume = {26}, ' ...
'pages = {62-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scombrops-boops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


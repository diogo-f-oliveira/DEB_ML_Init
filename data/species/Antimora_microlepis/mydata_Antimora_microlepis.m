function [data, auxData, metaData, txtData, weights] = mydata_Antimora_microlepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Moridae';
metaData.species    = 'Antimora_microlepis'; 
metaData.species_en = 'Finescale mora'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 08];

%% set data
% zero-variate data;

data.am = 45*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'KoroBayt2020';   
  temp.am = C2K(2.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 32*365;     units.amm = 'd';    label.amm = 'life span for males';     bibkey.amm = 'KoroBayt2020';   
  temp.amm = C2K(2.4);  units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lp  = 43.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'KoroBayt2020';
  comment.Lp = 'assumed to coincide with minimum length found on Emperor Mountain Range';
data.Li  = 84;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb  = 2.7e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 5640;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'KoroBayt2020';

data.Ri = 0.9e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.5';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
19.942	53.279
21.895	55.565
24.018	53.610
25.013	57.732
25.016	56.701
25.017	56.242
25.129	53.835
25.865	56.010
25.870	54.177
25.871	53.718
25.894	64.836
25.920	55.093
25.965	58.188
26.068	59.219
26.799	63.113
26.907	62.196
26.975	56.694
27.077	58.299
27.905	65.402
27.921	59.213
27.923	58.411
27.969	61.161
27.987	54.399
28.008	66.433
28.068	63.797
28.924	60.585
28.942	53.823
28.944	52.906
29.022	63.565
29.068	65.971
29.096	55.427
29.821	61.728
29.879	59.894
29.897	53.132
29.910	68.146
29.911	67.573
29.913	66.771
29.920	64.135
30.043	57.831
30.048	55.997
30.826	62.069
30.914	68.945
30.917	67.684
30.919	66.768
30.952	54.618
30.989	60.578
31.033	63.902
31.829	63.326
31.841	58.627
31.883	62.638
31.900	56.564
31.915	70.546
31.917	69.859
31.921	68.598
31.951	57.137
31.997	59.658
31.999	59.085
32.828	65.844
32.846	59.197
32.870	69.856
32.884	64.698
32.891	62.177
32.901	58.394
32.929	67.907
32.970	72.148
33.823	69.967
33.923	72.259
33.974	72.947
34.787	66.067
34.903	62.055
35.789	67.325
35.891	69.044
35.893	68.127
35.957	64.000
36.810	61.934
36.907	65.143
38.753	68.003
38.978	62.844
41.975	70.857
43.035	70.395];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.75) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(2.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KoroBayt2020';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
18.054	46.179
18.947	48.812
19.948	50.872
20.060	48.350
20.864	44.909
20.897	52.244
21.015	47.889
21.026	43.533
21.818	44.677
21.903	52.585
21.954	53.158
21.965	49.032
22.867	48.112
22.912	51.206
22.915	50.060
23.017	51.664
23.072	50.747
23.828	45.473
23.974	50.286
23.975	49.598
23.978	48.796
23.980	47.994
24.025	50.973
26.038	50.738
26.146	49.706
26.934	52.225
27.045	50.391
27.884	53.482
28.045	52.450
31.935	63.097
32.002	57.939
32.005	56.793];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.75) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(2.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KoroBayt2020';

% length-weight
data.LW = [ ... % total length (cm), weights (g)
43.335	1108.755
44.910	561.430
45.812	598.999
45.816	486.966
47.780	699.074
47.781	661.729
47.867	524.821
48.267	923.261
48.604	587.246
49.009	786.517
49.093	736.745
49.743	960.973
49.984	1172.651
50.077	774.334
50.978	836.799
51.549	973.871
51.550	961.423
51.709	1123.288
51.801	787.211
52.199	1235.443
52.699	949.261
52.936	1322.764
52.940	1160.939
53.436	1036.581
53.510	1347.803
53.757	1298.072
53.927	1086.496
54.171	1173.694
54.331	1348.007
54.579	1260.932
54.582	1173.796
55.151	1373.108
55.396	1435.409
55.651	1099.373
55.727	1335.907
56.220	1311.133
56.223	1199.101
56.634	1186.755
56.791	1435.757
56.866	1722.082
57.359	1697.309
57.519	1834.278
57.612	1460.857
57.690	1585.358
57.941	1423.595
58.010	1884.193
58.057	3191.259
58.441	1162.309
58.507	1747.387
58.567	2531.635
58.666	1921.701
58.674	1622.948
58.846	1361.580
59.001	1685.270
59.074	2033.835
59.244	1809.811
59.571	1859.685
59.827	1523.649
60.474	1859.910
60.728	1598.563
60.736	1312.257
61.129	1934.762
61.376	1897.479
61.532	2196.273
61.775	2333.263
61.810	1051.114
61.891	4088.479
62.112	2009.696
62.354	2171.582
62.700	1524.365
62.907	2968.400
62.949	1437.290
63.605	1474.798
63.747	2259.065
63.908	2383.587
63.928	1649.152
64.080	2109.771
64.101	1337.992
64.403	2309.021
64.714	2943.953
64.733	2234.415
65.138	2446.134
65.224	2296.777
65.551	2346.651
65.579	1338.360
65.980	1662.111
66.025	3018.969
66.031	2832.248
66.041	2458.807
66.643	1450.658
66.706	2135.321
66.768	2894.672
66.772	2732.848
67.094	2969.442
67.415	3230.933
67.750	2994.502
67.844	2558.841
67.999	2894.979
68.265	2173.053
68.287	1376.378
68.434	2011.270
68.568	3119.187
68.643	3368.168
68.851	1787.307
69.719	3057.233
69.731	2609.103
69.904	2297.943
70.205	3281.420
70.281	3517.953
70.771	3605.212
71.759	3505.873
71.774	2958.159
72.727	4140.969
72.805	4277.918
73.801	3904.722
75.356	4079.383
75.432	4303.468
76.873	5648.225
76.875	2585.985
77.023	3183.532
79.780	4416.584
83.944	5288.990];
units.LW = {'cm', 'g'};   label.LW = {'total length', 'weight'};  
bibkey.LW = 'KoroBayt2020'; comment.LW = 'sexes combined';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by h_a only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '67LGR'; % Cat of Life
metaData.links.id_ITIS = '164673'; % ITIS
metaData.links.id_EoL = '46564966'; % Ency of Life
metaData.links.id_Wiki = 'Antimora'; % Wikipedia
metaData.links.id_ADW = 'Antimora_microlepis'; % ADW
metaData.links.id_Taxo = '161068'; % Taxonomicon
metaData.links.id_WoRMS = '272460'; % WoRMS
metaData.links.id_fishbase = 'Antimora-microlepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Antimora}}';
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
bibkey = 'KoroBayt2020'; type = 'Article'; bib = [ ... 
'author = {N. B. Korosteleva and A. A. Baytalyukc and I. V. Maltsevc and A. M. Orlov}, ' ... 
'year = {2020}, ' ...
'title = {First Data on The age and Growth in {P}acific Flatnose \emph{Antimora microlepis} ({M}oridae) from the Waters of the Underwater {E}mperor {M}ountain {R}ange ({N}orthwestern {P}acific)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'doi = {10.1134/S0032945220060028}, ' ...
'volume = {60(6)}, ' ...
'pages = {891–899}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.org/summary/Antimora-microlepis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


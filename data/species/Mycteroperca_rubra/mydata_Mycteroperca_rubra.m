function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_rubra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_rubra'; 
metaData.species_en = 'Mottled grouper '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 12];

%% set data
% zero-variate data
data.am = 20*365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'AronGore2008';
  temp.am = C2K(19.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 34;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 144;   units.Li = 'cm';  label.Li = 'ultimate total length'; bibkey.Li  = 'fishbase'; 

data.Wwb = 1.9e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 0.712 mm of Serranus scriba: pi/6*0.0712^3';   
data.Wwi = 33.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01072*Li^3.01, see F1';

data.Ri = 19.6e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'AronGore2008';
  temp.Ri = C2K(19.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 57e4 oocytes per kg: 57e4*33.6 per yr'; 

% uni-variate data
% time-length
data.tL = [... % yr class (yr), total length
0.464	13.567
0.956	24.533
0.978	23.437
1.007	31.109
1.027	27.000
1.051	28.096
1.075	28.918
2.006	41.945
2.024	35.233
2.992	34.972
2.999	44.972
3.004	50.451
3.006	53.328
3.018	39.767
3.019	41.000
3.026	49.082
3.031	56.753
3.044	43.192
3.046	46.068
3.076	54.425
3.093	47.302
3.990	44.849
4.008	37.862
4.011	42.794
4.012	43.616
4.014	45.945
4.019	53.205
4.034	41.972
4.037	46.493
4.067	54.713
4.070	59.096
4.071	59.918
4.083	47.042
4.084	48.274
4.085	48.822
4.086	49.507
4.087	50.466
4.088	51.699
4.089	52.521
4.090	55.672
5.032	51.849
5.080	54.316
5.081	55.959
5.084	59.521
5.085	60.343
5.134	64.590
6.008	62.136
6.024	53.233
6.053	60.219
6.987	47.081
7.042	58.178
7.047	64.753
7.091	62.288
9.053	67.384
9.056	70.260
11.059	68.781
11.070	53.028
11.110	74.535
12.070	65.507
19.083	75.740];  
data.tL(:,1) =  data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AronGore2008'; 

% length-weight
data.LW = [ ... % total length (cm) weight (g)
13.380	31.390
15.426	41.854
23.010	146.488
23.947	136.024
27.440	240.658
27.867	188.341
28.634	198.804
29.656	251.121
31.103	397.608
34.597	418.535
35.705	439.462
37.918	669.656
38.175	575.486
39.534	899.850
39.877	753.363
39.963	690.583
40.728	847.534
41.070	774.290
41.580	868.461
41.836	910.314
42.008	753.363
42.431	1014.948
42.773	931.241
42.858	899.850
43.795	952.168
44.222	910.314
44.816	1109.118
44.984	1349.776
45.073	1014.948
45.839	1109.118
45.922	1234.679
46.606	1077.728
47.032	1119.582
47.284	1423.020
47.287	1171.899
48.391	1475.336
48.478	1328.849
48.987	1527.653
48.991	1234.679
49.669	1517.190
49.756	1412.556
50.097	1349.776
50.438	1391.629
50.519	1726.457
51.113	1883.408
51.371	1695.068
51.631	1402.093
51.884	1611.360
52.050	1977.578
52.140	1527.653
52.564	1747.384
52.904	1778.775
52.977	2783.259
52.988	1914.799
53.330	1810.165
53.503	1653.214
53.672	1736.921
53.841	1872.945
54.346	2343.797
54.434	2144.993
54.694	1789.238
54.948	1956.652
55.457	2092.676
55.617	2950.673
55.876	2720.478
56.138	2186.846
57.073	2385.651
57.162	2092.676
58.095	2469.357
58.259	3023.917
58.355	2113.602
58.863	2396.114
58.941	2950.673
58.944	2699.552
59.375	2333.333
59.798	2594.918
60.227	2333.333
60.819	2751.869
61.921	3254.111
62.089	3442.451
62.609	2741.405
63.455	3264.574
64.307	3233.184
64.385	3860.987
65.325	3620.329
66.088	3976.084
66.431	3777.279
66.943	3756.353
67.544	3379.671
68.392	3745.889
68.808	4541.106
70.007	4122.571
72.807	5095.665
73.911	5451.420
75.443	5650.224
76.981	5325.860];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'AronGore2008'; 
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphroditic';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'SL = 0.92 * tL, based on photo';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '44ZP7'; % Cat of Life
metaData.links.id_ITIS = '167759'; % ITIS
metaData.links.id_EoL = '46579706'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_rubra'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_rubra'; % ADW
metaData.links.id_Taxo = '180508'; % Taxonomicon
metaData.links.id_WoRMS = '273880'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-rubra'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_rubra}}';
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
bibkey = 'AronGore2008'; type = 'Article'; bib = [ ... 
'author = {Andrey Aronov and Menachem Goren}, ' ... 
'year = {2008}, ' ...
'title = {ECOLOGY OF THE MOTTLED GROUPER (\emph{Mycteroperca rubra}) IN THE EASTERN {M}EDITERRANEAN}, ' ...
'journal = {Electronic Journal of Ichthyology}, ' ...
'volume = {2}, ' ...
'pages = {43-55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Mycteroperca-rubra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

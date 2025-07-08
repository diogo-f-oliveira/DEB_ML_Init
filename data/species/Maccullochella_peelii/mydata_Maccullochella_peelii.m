  function [data, auxData, metaData, txtData, weights] = mydata_Maccullochella_peelii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Maccullochella_peelii'; 
metaData.species_en = 'Murray cod'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 13];

%% set data
% zero-variate data
data.ab = 7;      units.ab = 'd';  label.ab = 'age at puberty for females';  bibkey.ab = 'fishbase';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 48*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 55;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 180;    units.Li = 'cm'; label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 3.25 mm: pi/6*0.325^3';
data.Wwi = 113.5e3;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';          bibkey.Wwi = 'fishbase';
 
data.Ri = 9e4/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'fishbase';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length-weight
data.tL = [ ... % time since birth (yr), total length (cm)
 1	24.330
 2	34.329
 3	50.022
 4	58.657
 5	64.104
 6	66.366
 7	72.952
 8	79.311
 9	80.890
10	87.932
11	76.079
12	87.674
15	99.467
16	98.087
17	106.949
18	102.836
19	104.414
20	99.848
22	109.833
24	116.176
29	120.425
30	122.003];
data.tL (:,1) = (0.3 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Rowl1998';

% length-weight
data.LWw = [ ... % total length (cm), wet weight (g)
21.009	69.867
25.956	496.319
27.019	254.874
29.892	377.558
31.451	560.000
33.546	561.207
35.113	622.625
36.664	926.091
37.195	805.368
39.243	1532.720
39.536	1048.775
40.575	1170.402
41.349	1352.391
41.603	1473.567
44.428	2322.396
44.455	1898.811
44.943	2443.722
45.495	2020.439
45.527	1536.342
46.558	1778.994
47.316	2203.031
47.550	2626.767
47.558	2505.743
47.601	1840.110
47.800	2808.454
48.343	2506.196
48.371	2082.611
48.617	2324.810
49.105	2869.721
49.343	3232.944
49.910	2567.613
50.470	2023.306
50.898	3475.898
50.934	2931.289
50.978	2265.656
51.037	5351.924
51.450	3052.615
51.688	3415.839
52.255	2750.507
52.485	3234.755
52.489	3174.243
52.703	3900.539
53.160	4929.546
53.501	3719.455
54.072	2993.612
54.259	4143.493
54.282	3780.420
54.306	3417.348
54.377	2328.130
54.881	2630.992
55.278	4567.681
55.361	3296.927
55.489	5354.489
55.615	3418.102
56.357	4084.188
56.540	5294.581
56.583	4628.948
56.865	4326.538
57.155	3903.104
57.401	4145.304
57.619	4811.087
57.825	5658.408
57.960	3600.997
58.028	6566.240
59.396	5659.313
59.416	5356.753
59.729	4570.246
59.964	4993.982
59.964	4993.982
60.963	5720.730
60.995	5236.634
61.467	6023.593
61.523	5176.423
62.459	6871.366
62.546	5540.100
62.662	7779.198
62.967	7113.716
62.991	6750.643
63.268	6508.746
63.467	7477.090
63.546	6266.848
63.562	6024.800
63.590	5601.215
64.812	6933.236
65.621	6570.616
65.696	5420.886
66.042	8144.232
66.284	8446.943
66.323	7841.823
66.395	6752.605
66.486	9354.776
66.545	8447.094
67.410	7237.305
67.593	8447.698
68.010	10081.826
68.624	8690.350
69.227	7480.410
69.604	9719.659
69.977	8025.471
70.164	9175.352
70.719	8691.557
70.925	9538.877
71.782	8450.112
71.961	9721.017
72.715	10205.567
72.929	10931.863
73.968	11053.490
74.960	11901.263
74.972	11719.727
75.143	13111.656
75.492	11780.541
75.912	9360.208
76.476	12749.338
76.535	11841.657
77.313	11963.133
77.749	13294.701
78.269	13355.515
78.706	14687.083
79.328	13174.582
79.730	19044.708
80.538	14688.139
84.153	19470.858
85.002	18503.117
86.109	17596.039
86.779	19351.343
87.787	19957.067
88.092	19291.585
88.687	14208.720
89.644	23589.000
91.774	23045.598
92.262	23590.509
93.076	23167.377
93.469	25164.578
95.194	18811.563
96.087	25166.087
96.123	24621.478
98.249	20144.640
98.952	33397.693
99.706	29888.293
100.797	33217.213
101.252	22264.374
101.308	29405.102
104.265	40238.878
105.700	34309.297
109.890	38305.661];
units.LWw = {'cm', 'g'}; label.LWw  = {'total length', 'wet weight'};  
bibkey.LWw = 'Rowl1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 21 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 2 * weights.Ri;
weights.Li = 5 * weights.Li;
weights.Wwi = 0 * weights.Wwi;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd. k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Data \Wwi is ignored due to inconsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3WXQJ'; % Cat of Life
metaData.links.id_ITIS = '641894'; % ITIS
metaData.links.id_EoL = '357118'; % Ency of Life
metaData.links.id_Wiki = 'Maccullochella_peelii'; % Wikipedia
metaData.links.id_ADW = 'Maccullochella_peelii'; % ADW
metaData.links.id_Taxo = '452797'; % Taxonomicon
metaData.links.id_WoRMS = '991273'; % WoRMS
metaData.links.id_fishbase = 'Maccullochella-peelii'; % fishbase

%% References
bibkey = 'Rowl1998'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12439}, ' ...
'author = {Rowland, S J}, ' ...
'year = {1998}, ' ...
'title = {Age and growth of the {A}ustralian freshwater fish {M}urray cod, \emph{Maccullochella peelii peelii}}, ' ... 
'journal = {Proceedings of the Linnean Society of New South Wales}, ' ...
'volume = {120}, '...
'pages = {163--180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Maccullochella-peelii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


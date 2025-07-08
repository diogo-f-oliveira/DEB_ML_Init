  function [data, auxData, metaData, txtData, weights] = mydata_Variola_louti
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Variola_louti'; 
metaData.species_en = 'Yellow-edged lyretail'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 27];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 47.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 83;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 1327;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^3.03, see F1';
data.Wwi = 7155;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.03, see F1;max. published weight: 12 kg';

data.Ri  = 1.4e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*7000/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.709	29.416
0.710	28.896
0.929	28.506
0.940	22.649
1.137	33.973
1.570	35.275
1.678	35.796
1.694	26.816
1.784	37.488
1.809	23.692
1.892	38.139
1.909	28.378
1.917	24.213
1.919	23.172
2.012	31.762
2.014	30.851
2.018	28.509
2.020	27.728
2.443	34.757
2.648	41.655
2.661	34.237
2.666	31.764
2.767	35.799
2.768	35.539
2.778	29.942
2.880	33.717
2.883	32.415
2.990	33.327
3.082	42.568
3.202	36.451
3.303	41.006
3.303	40.616
3.308	38.273
3.844	42.700
3.944	47.516
3.949	44.913
3.957	40.878
3.969	33.850
4.056	46.084
4.065	41.269
4.067	39.837
4.081	32.288
4.180	38.015
4.181	36.974
4.928	45.826
5.033	47.909
5.034	47.128
5.149	43.875
5.904	48.041
5.910	45.048
6.007	51.426
6.117	50.905
6.124	46.871
6.990	50.257]; 
data.tL(:,1) = 365 * (0.3+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(27.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
11.260	47.930
12.074	57.293
13.907	66.813
14.823	85.430
15.738	122.522
16.450	150.346
17.266	122.758
19.100	113.802
20.420	197.146
21.744	197.350
22.561	169.762
22.655	317.583
23.375	188.363
23.471	289.995
24.085	253.138
24.284	336.309
24.290	216.218
25.002	234.803
25.612	262.611
26.629	290.481
26.828	392.128
27.342	290.591
27.539	429.189
27.647	318.351
27.743	429.221
28.047	456.981
28.154	355.381
29.168	438.678
29.376	355.569
29.378	318.618
29.474	447.963
29.674	521.896
30.080	549.673
30.188	429.597
30.289	429.613
30.692	522.053
30.903	392.756
31.306	475.959
31.400	623.779
31.508	503.703
32.014	577.684
32.220	522.289
32.628	522.351
32.825	651.712
33.339	550.175
33.538	642.584
33.645	550.222
33.846	605.680
33.941	744.263
34.248	716.596
34.353	651.947
34.448	781.292
34.452	707.390
34.664	541.141
35.057	827.575
35.163	744.451
35.268	679.802
36.071	910.873
36.080	744.592
36.382	809.304
36.680	957.155
37.093	846.365
37.098	763.224
37.392	984.979
37.397	892.601
37.695	1031.215
37.807	837.236
38.208	957.391
38.709	1123.750
38.820	939.009
39.214	1206.968
39.421	1142.335
39.633	985.324
39.840	911.453
40.031	1179.380
40.138	1077.780
40.548	1022.416
40.642	1179.474
40.731	1428.911
40.857	957.798
41.031	1539.812
41.063	911.641
41.153	1133.364
41.259	1059.477
41.458	1161.124
41.470	920.942
42.262	1364.481
42.267	1262.866
42.472	1244.421
42.572	1290.626
42.576	1198.248
42.662	1521.587
42.860	1632.472
42.867	1493.905
42.977	1336.878
43.484	1383.145
43.897	1272.354
44.597	1531.123
44.797	1595.819
44.803	1475.727
44.994	1725.179
45.215	1392.650
45.699	1891.569
45.820	1512.835
45.826	1401.982
46.011	1762.287
46.320	1688.432
46.519	1790.079
46.925	1827.093
47.232	1799.427
47.738	1854.932
47.918	2316.853
48.045	1827.266
48.137	2021.275
48.972	1633.413
49.146	2206.188
49.253	2113.826
49.767	2021.526
49.780	1762.868
49.960	2234.027
50.261	2326.452
50.893	1920.083
51.398	2003.301
51.570	2631.503
53.505	2622.563
59.067	3427.115]; 
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7FHQ3'; % Cat of Life
metaData.links.id_ITIS = '167920'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Variola_louti'; % Wikipedia
metaData.links.id_ADW = 'Variola_louti'; % ADW
metaData.links.id_Taxo = '45102'; % Taxonomicon
metaData.links.id_WoRMS = '218304'; % WoRMS
metaData.links.id_fishbase = 'Variola-louti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Variola_louti}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Variola-louti.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


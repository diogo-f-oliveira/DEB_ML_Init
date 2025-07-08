  function [data, auxData, metaData, txtData, weights] = mydata_Flavocaranx_bajad
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Flavocaranx_bajad'; 
metaData.species_en = 'Orangespotted trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 17];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 55;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 290;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'MohaMeha2022','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 3200;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MohaMeha2022';
  comment.Wwi = 'based on LW data';

data.Ri  = 5.2e5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Caranx_crysos: 1546000*1310/4804';
  

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (yr),  weight (g)
0	0.02
1	239.513
2	655.734
3	1086.734
4	1584.345
5	2089.278
6	2512.937
7	2899.504
8	3189.864];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
  temp.tW = C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'MohaMeha2022'; 

% length-weight
data.LW = [ ... % std length (cm), weight (g)
14.357	49.546
15.144	76.893
15.562	117.503
15.720	124.318
15.928	151.354
16.194	90.920
16.402	131.417
16.715	171.970
16.980	131.728
17.085	118.323
17.349	84.812
17.609	158.989
18.030	125.563
18.084	91.938
18.290	186.280
18.711	173.045
19.133	132.887
19.342	153.192
19.602	207.178
19.867	166.936
20.178	247.873
20.496	187.467
20.969	187.722
21.019	248.326
21.491	262.041
21.546	188.033
21.646	309.241
21.910	268.998
21.966	194.990
22.277	289.388
22.432	356.779
22.438	222.167
23.062	350.388
23.067	242.698
23.433	283.280
23.585	397.785
23.856	229.661
24.006	384.550
24.275	250.079
24.377	317.442
24.584	384.861
24.745	310.909
25.167	270.752
25.269	324.653
25.370	418.938
25.686	412.377
25.689	324.879
26.155	479.938
26.215	318.431
26.264	392.496
26.631	412.886
26.738	359.098
26.944	446.709
27.046	534.263
27.420	393.119
27.730	507.708
27.778	601.965
27.892	406.834
28.355	609.007
28.361	481.126
28.568	541.814
28.829	595.800
29.045	447.840
29.141	656.546
29.358	495.124
29.512	569.245
29.570	454.854
29.666	670.290
29.776	555.926
29.989	495.463
30.032	690.679
30.353	576.429
30.501	778.432
30.661	731.402
30.718	623.741
31.244	610.562
31.396	731.798
31.504	671.279
31.667	550.213
31.763	752.188
31.862	873.396
31.976	671.534
32.240	638.022
32.285	806.315
32.545	873.763
32.551	732.420
32.594	954.558
32.911	907.614
33.387	827.101
33.646	921.471
33.648	881.088
33.801	968.670
34.284	740.084
34.374	1069.940
34.434	908.434
34.801	928.824
34.850	1009.619
35.161	1104.018
35.268	1043.499
35.582	1077.321
36.000	1131.393
36.266	1044.036
36.473	1111.455
37.051	1111.766
37.204	1212.810
37.303	1340.748
37.405	1421.572
37.729	1226.554
37.935	1307.435
37.992	1206.504
38.726	1240.553
38.879	1334.866
39.237	1550.443
39.352	1328.390
39.398	1483.222
39.710	1550.698
39.981	1355.652
40.087	1335.516
40.135	1443.234
40.402	1349.147
40.444	1571.286
40.501	1483.816
40.656	1524.285
41.022	1564.866
41.492	1639.157
41.695	1787.344
42.325	1794.414
42.902	1808.186
42.907	1700.496
43.150	2138.127
43.583	1848.937
43.894	1936.605
44.156	1963.669
44.414	2058.039
45.043	2092.031
45.880	2153.059
46.031	2301.217
46.718	2207.356
46.766	2321.805
47.439	2524.091
47.551	2382.804
47.652	2456.898
48.339	2376.498
48.540	2565.068
49.220	2639.473
49.591	2552.173
49.739	2774.367
50.413	2963.192
50.419	2842.041
51.043	2963.531
51.881	3031.290];
units.LW = {'cm', 'g'};  label.LW = {'std length', 'weight'};  
bibkey.LW = 'MohaMeha2022'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^2.92'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2HH'; % Cat of Life
metaData.links.id_ITIS = '1228230'; % ITIS
metaData.links.id_EoL = '46578074'; % Ency of Life
metaData.links.id_Wiki = 'Carangoides_bajad'; % Wikipedia
metaData.links.id_ADW = 'Carangoides_bajad'; % ADW
metaData.links.id_Taxo = '106151'; % Taxonomicon
metaData.links.id_WoRMS = '218391'; % WoRMS
metaData.links.id_fishbase = 'Flavocaranx-bajad'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Carangoides_bajad}}';  
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
bibkey = 'MohaMeha2022'; type = 'article'; bib = [ ...
'author = {Ashraf S. Mohammad and Sahar F. Mehanna and Usama M. Mahmoud}, ' ...
'year = {2022}, ' ...
'title = {Age and Growth Based on the Scale Readings of the Two Carangid Species \emph{Carangoides bajad} and \emph{Caranx melampygus} from {S}halateen {F}ishing {A}rea, {R}ed {S}ea, {E}gypt}, ' ... 
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {26(2)}, '...
'pages = {399-411}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Flavocaranx-bajad.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
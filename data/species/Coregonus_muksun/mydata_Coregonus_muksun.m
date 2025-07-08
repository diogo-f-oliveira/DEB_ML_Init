  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_muksun
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_muksun'; 
metaData.species_en = 'Muksun'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THp','MN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg', 'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 11];

%% set data
% zero-variate data
data.ab = 165;   units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(1.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '150-180 d hatch';
data.am = 23*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 46.3;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 90;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 1e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.00417*Lp^3.23, see F1';
data.Wwi = 8557;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.00417*Li^3.23, see F1; max. published weight: 13.8 kg';
    
data.Ri = 3.5e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'fishbase';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coregonus_chadary: 12100*8557/2988';
  
% univariate data

% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
0.898	5.549
0.938	35.133
1.005	30.254
1.983	70.352
2.050	45.768
2.051	109.808
2.987	110.468
2.988	179.433
3.028	223.796
3.912	357.424
4.018	244.198
4.019	313.164
4.957	510.868
5.011	461.645
5.064	397.643
5.975	654.442
6.015	521.465
6.082	600.330
6.926	862.008
6.967	807.849
6.980	679.780
7.998	1000.693
8.011	818.437
8.038	1030.278
8.963	1227.973
9.003	996.474
9.030	1144.276
9.967	1460.207
10.048	1356.815
10.049	1243.515
11.066	1480.685
11.067	1451.128
11.079	1623.551
12.017	1653.768
12.098	1688.307
13.009	1881.067];
data.tW(:,1) = 365 * (0.5 + data.tW(:,1));
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MatkKras2022'; 

% length-weight
data.LW = [ ... % (body) length (cm), weight (g)
34.659	608.279
35.906	707.152
37.013	744.409
38.056	892.486
38.533	781.783
39.361	794.332
39.368	917.486
39.509	966.787
39.512	1028.364
40.206	1090.136
40.332	880.812
40.893	1028.753
40.968	1151.927
41.251	1275.159
41.303	954.977
41.451	1152.063
41.799	1201.422
41.861	1078.287
41.945	1336.931
41.945	1349.246
42.214	1213.854
42.441	1583.376
42.474	918.361
42.558	1189.320
42.687	1029.258
42.703	1324.829
43.037	1127.879
43.181	1238.757
43.249	1214.145
43.394	1337.339
43.510	943.283
43.525	1214.223
43.586	1066.457
43.601	1337.397
43.733	1226.597
43.865	1128.112
43.879	1374.421
44.221	1325.256
44.298	1460.746
44.354	1226.772
44.650	1583.998
44.695	1152.976
44.709	1411.601
44.902	1165.350
44.923	1534.814
45.193	1436.368
45.196	1485.629
45.256	1325.548
45.321	1239.359
45.659	1128.617
45.684	1571.974
45.737	1288.737
46.008	1190.291
46.021	1424.285
46.102	1645.983
46.108	1756.822
46.151	1288.854
46.227	1399.712
46.505	1436.737
46.587	1670.750
46.722	1621.527
46.938	1781.686
46.943	1880.210
46.992	1523.081
47.192	1387.669
47.265	1461.581
47.277	1683.260
47.643	2052.821
47.762	1708.026
48.034	1646.527
48.064	2176.092
48.168	1572.673
48.249	1782.055
48.256	1917.525
48.391	1855.987
48.612	2114.670
48.881	1979.277
49.005	1733.007
49.070	1659.134
49.310	2250.334
49.339	1536.057
49.358	1880.890
49.440	2114.903
49.574	2028.733
49.614	1511.503
49.788	2164.262
49.828	1647.032
49.920	2053.462
50.107	1684.056
50.282	2361.445
50.399	1979.705
50.408	2152.121
50.524	1745.750
50.739	1893.594
50.771	2472.420
50.889	2115.311
51.018	1942.933
51.034	2226.189
51.290	1869.118
51.387	2386.387
51.443	2140.097
51.632	1819.953
51.726	2275.645
51.730	2349.538
52.202	2140.311
52.230	2657.560
52.295	2571.371
52.352	2349.712
52.397	1918.691
52.702	2448.333
52.756	2177.413
52.816	2005.016
53.461	2448.547
55.201	2707.657
55.264	2609.153];
units.LW = {'d', 'cm'}; label.LW = {'(body) length','weight'};  
bibkey.LW = 'MatkKras2022'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight relationship: Ww in  g = 0.00417*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6B29X'; % Cat of Life
metaData.links.id_ITIS = '161971'; % ITIS
metaData.links.id_EoL = '46563178'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_muksun'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_muksun'; % ADW
metaData.links.id_Taxo = '171723'; % Taxonomicon
metaData.links.id_WoRMS = '274341'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-muksun'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_muksun}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman,171723 S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MatkKras2022'; type = 'Article'; bib = [ ...  
'author = {A. K. Matkovskiia and T. A. Krasnoperova}, ' ...
'year = {2022}, ' ...
'title = {Growth of Muksun \emph{Coregonus muksun} in Different Water Conditions in the {O}b {R}iver ({R}ussia)}, ' ... 
'journal = {Inland Water Biology}, ' ...
'pages = {293–304}, ' ...
'volume = {15(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-muksun}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


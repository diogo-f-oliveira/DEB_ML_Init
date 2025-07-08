function [data, auxData, metaData, txtData, weights] = mydata_Lagocephalus_sceleratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Tetraodontidae';
metaData.species    = 'Lagocephalus_sceleratus'; 
metaData.species_en = 'Silver-cheeked toadfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 27];

%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Aydi2011';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 43.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 110;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Aydi2011';
  comment.Wwb = 'based on egg diameter of 0.64 mm: pi/6*0.064^3';
data.Wwi = 9.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.87, see F1';
  
data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'Aydi2011';
  temp.GSI = C2K(27.3);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'relative fecundity 780.8 eggs/g';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	17.08
2	27.03
3	37.42
4	44.50
5	53.53
6   59.97];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Aydi2011';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
13.499	64.690
14.037	64.690
14.215	10.781
14.396	75.471
15.024	75.471
15.382	21.563
15.473	86.253
16.100	64.690
16.458	10.781
16.818	86.253
16.906	21.563
17.713	21.563
17.715	107.816
18.073	53.908
18.252	21.563
18.523	118.598
19.149	53.908
19.151	140.162
19.958	118.598
20.494	43.127
20.677	183.288
21.391	43.127
21.483	129.380
21.843	183.288
22.470	150.943
22.647	75.471
23.278	215.633
24.082	75.471
24.534	204.852
25.070	129.380
25.429	150.943
25.700	237.197
26.327	204.852
26.684	118.598
27.225	247.978
27.581	129.380
27.764	269.541
28.481	258.760
29.109	247.978
30.187	355.795
30.365	269.541
31.262	301.887
32.521	431.266
32.608	323.450
33.419	474.394
33.778	506.738
34.403	377.358
34.495	485.175
35.033	463.612
35.125	571.428
35.844	625.337
36.468	474.394
36.921	657.682
37.547	614.555
37.818	679.245
38.084	549.865
38.357	733.154
39.164	700.808
39.251	582.210
39.883	776.280
40.508	668.463
41.138	754.717
41.139	819.407
41.769	884.097
42.219	959.568
42.755	873.315
42.842	754.717
43.654	970.350
43.919	808.625
44.194	1045.822
44.460	927.223
45.090	1035.040
45.177	873.315
45.898	1067.385
46.435	981.132
46.439	1185.983
46.974	1045.822
47.068	1239.892
47.869	948.787
48.323	1185.983
48.600	1574.124
48.769	1088.949
49.219	1175.202
49.313	1347.709
49.759	1272.237
49.946	1584.906
51.201	1574.124
51.559	1530.997
51.921	1660.377
52.361	1315.364
53.089	1757.412
53.995	2167.116
54.073	1638.813
54.083	2091.644
54.344	1746.631
54.618	1951.482
55.148	1617.250
55.151	1735.849
55.334	1876.010
55.605	1962.264
55.968	2177.898
56.139	1778.975
57.040	1983.827
57.135	2242.587
58.119	2113.207
58.665	2447.439
59.021	2328.841
60.450	2080.862
60.721	2134.770
61.176	2436.658
61.182	2727.762
63.172	3471.698];
units.LW_f   = {'d', 'cm'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'Aydi2011';
%
data.LW_m = [ ... % total length (cm), weight (g)
12.882	9.655
14.368	60.037
15.067	90.299
15.417	110.493
15.591	59.831
16.640	110.287
17.162	29.186
17.252	130.437
18.300	150.513
18.823	99.792
19.696	59.138
20.134	140.077
20.918	28.552
21.095	150.041
21.619	129.700
22.406	190.326
22.578	78.905
23.366	180.037
23.451	68.631
24.066	200.173
24.675	119.057
25.376	240.458
26.510	139.001
26.599	230.125
27.385	250.245
27.645	118.556
27.908	169.144
28.522	310.813
29.044	209.459
29.918	249.818
30.096	381.433
30.879	280.035
31.318	360.974
31.840	279.873
32.542	401.274
33.505	512.504
33.852	401.053
35.249	400.817
35.339	512.194
36.211	461.414
36.563	593.000
36.739	633.477
37.347	471.349
37.442	825.763
37.613	663.709
38.400	714.209
38.484	562.296
39.010	643.220
39.188	805.215
39.795	622.834
39.885	754.465
40.844	642.911
40.847	804.935
41.194	693.484
41.635	906.068
41.637	976.954
42.244	754.067
42.684	905.891
43.384	1007.039
43.818	865.194
44.078	784.137
44.604	875.187
44.782	1027.056
45.218	976.350
45.302	824.437
45.658	1128.174
45.743	1047.147
46.353	986.285
46.969	1198.839
47.051	925.407
47.492	1117.738
47.929	1168.297
47.932	1279.689
50.030	1360.348
50.299	1684.353
51.170	1593.066
51.343	1512.025
51.871	1694.214
52.918	1663.657
55.720	1956.856
55.985	2098.583
56.154	1875.769
56.677	1804.795
57.113	1774.342
58.165	1976.696
60.621	2442.104
62.553	2948.107
65.098	3474.260];
units.LW_m   = {'d', 'cm'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'Aydi2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length - weight: Ww in g = 0.01349*(TL in cm)^2.87';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RX8X'; % Cat of Life
metaData.links.id_ITIS = '646294'; % ITIS
metaData.links.id_EoL = '46570962'; % Ency of Life
metaData.links.id_Wiki = 'Lagocephalus_sceleratus'; % Wikipedia
metaData.links.id_ADW = 'Lagocephalus_sceleratus'; % ADW
metaData.links.id_Taxo = '178094'; % Taxonomicon
metaData.links.id_WoRMS = '219954'; % WoRMS
metaData.links.id_fishbase = 'Lagocephalus-sceleratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagocephalus_sceleratus}}';
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
bibkey = 'Aydi2011'; type = 'article'; bib = [ ... 
'doi = {10.4194/1303-2712-v11_4_10}, ' ...
'author = {Mehmet Ayd{\i}n}, ' ...
'year = {2011}, ' ...
'title  = {Growth, Reproduction and Diet of Pufferfish (\emph{Lagocephalus sceleratus} {G}melin, 1789) from {T}urkey''s {M}editerranean {S}ea Coast}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {11}, ' ...
'pages = {589-596}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lagocephalus-sceleratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Limanda_aspera

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Limanda_aspera'; 
metaData.species_en = 'Yellowfin sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 02];

%% set data
% zero-variate data

data.am = 35*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'MattHels2016';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 27.3;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'fishbase';
data.Li  = 49;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NichAcun2001';
  comment.Wwb = 'based on egg diameter 0.76-0.85 mm: pi/6*0.08^3';
data.Wwi = 1.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.08, see F1';
    
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length males, females (cm)
4.087	14.057
4.129	10.161
4.180	11.135
5.026	13.080
5.079	15.028
5.089	19.898
5.122	11.889
5.180	16.110
5.184	17.950
5.978	18.813
5.984	21.951
6.024	17.189
6.025	17.947
6.063	11.995
6.080	20.761
6.168	14.916
6.227	19.894
7.031	25.520
7.076	23.247
7.077	24.221
7.107	14.156
7.114	17.511
7.115	18.268
7.123	22.164
7.134	27.900
7.215	18.917
7.218	20.000
7.965	22.270
7.967	23.244
7.968	24.110
8.000	15.235
8.020	24.976
8.101	16.209
8.107	19.131
8.123	27.464
8.126	28.980
8.170	26.057
8.180	31.036
9.004	22.159
9.008	24.107
9.063	27.029
9.064	27.678
9.099	20.318
9.111	26.271
9.151	21.184
9.165	28.543
9.204	23.024
10.067	34.060
11.144	27.888
11.146	28.970
11.148	30.052
11.201	32.000
12.002	36.219
12.039	30.050
12.093	32.106
12.146	33.945
13.034	32.103
13.035	32.536
13.186	33.942
13.226	29.072
14.036	38.160
14.077	34.048
15.016	32.963
15.067	33.720
15.069	34.802
15.113	31.988
15.123	37.075
15.219	35.668
16.063	36.747
17.099	35.012
17.115	43.021
17.999	39.663
18.138	34.684
19.033	36.738
19.088	39.768
21.012	35.974
21.013	36.840
21.960	39.759
21.970	44.954
22.006	38.136
23.016	48.198
23.147	39.323
25.974	41.803
26.030	45.158
26.065	37.798
26.083	46.998
26.089	49.920
26.926	47.861
27.057	39.094
28.101	40.931
28.206	44.177
29.002	46.339
29.043	41.902
29.089	40.170
29.094	42.659
30.086	43.738
31.228	45.034
32.007	38.754
32.018	44.057];
data.tL_f(:,1) = 365 * (.2 +data.tL_f(:,1)); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(3.4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MattHels2016';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), total length males, females (cm)
2.937	11.033
3.784	14.602
3.785	10.391
3.933	13.199
3.934	11.795
3.983	12.120
3.984	10.824
4.780	18.172
4.829	16.444
4.879	15.473
4.929	14.501
5.825	18.394
5.875	24.118
5.925	17.531
5.974	16.992
6.075	19.800
6.821	25.096
6.822	23.908
6.920	22.073
6.921	20.777
6.970	28.121
6.971	22.937
7.966	25.967
7.967	19.920
8.016	26.831
8.017	22.080
8.018	19.272
8.065	17.328
8.762	28.996
8.912	16.254
8.913	25.541
8.962	26.621
9.011	24.786
9.061	19.926
9.062	20.682
9.063	22.842
9.111	24.138
9.758	28.678
10.007	30.623
10.853	29.333
10.953	29.657
11.003	31.277
11.849	29.447
11.949	34.199
12.048	31.716
13.940	33.131
13.990	31.728
14.040	30.108
14.836	32.057
14.986	34.002
14.987	33.030
14.988	30.222
16.081	33.793
18.919	34.350
18.969	36.078
20.114	35.113
23.001	36.535
25.939	36.445
27.034	33.104
27.134	38.288
29.075	36.681
30.121	35.607];
data.tL_m(:,1) = 365 * (.2 +data.tL_m(:,1)); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(3.4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MattHels2016';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
26.970	534277.052
28.012	931284.492
28.935	931636.524
28.959	878255.621
29.077	329148.300
29.953	1008295.878
29.976	1176101.530
30.000	733737.704
30.000	726110.608
30.000	695601.967
30.000	619330.751
30.024	832899.235
30.024	665102.610
30.047	1221891.186
30.047	787145.429
30.047	764264.141
30.923	589174.398
30.923	1306123.477
30.947	764607.146
30.970	1268006.050
30.994	619709.862
30.994	802760.680
30.994	978184.401
30.994	1031574.330
30.994	1229879.340
31.018	978193.428
31.018	1145990.054
31.041	924812.782
31.964	1520080.100
31.964	1260758.065
31.964	1214995.232
31.964	993808.934
31.988	917546.744
31.988	894665.199
31.988	841275.527
31.988	742123.022
31.988	490428.083
32.012	1161623.613
32.012	1123487.876
32.012	970945.443
32.012	658233.735
32.036	1085361.423
32.036	1062479.878
32.036	818412.292
32.059	1413336.604
32.888	1207720.168
32.935	528924.622
32.935	681467.055
32.935	742484.080
32.959	1009442.237
32.959	1078086.358
32.959	1146730.223
32.959	1154357.575
32.959	1261137.176
33.006	902680.689
33.006	1695900.985
33.053	1497614.028
33.953	1375922.984
33.953	811516.082
33.976	1932711.817
33.976	1558982.829
34.000	1421703.870
34.000	1284415.628
34.000	1093737.714
34.000	697127.438
34.024	1337814.583
34.024	1231034.726
34.024	1124255.125
34.024	895441.474
34.047	1170026.984
34.047	964094.622
34.071	1620035.959
34.071	1009866.480
34.071	956476.552
34.876	1528817.449
34.970	567836.633
34.970	994955.294
34.970	1223768.688
34.970	1376311.122
34.994	1284794.739
34.994	1879710.026
35.041	1666168.876
35.941	2291935.552
35.964	2063130.928
35.964	1330927.656
35.964	835164.875
35.988	1391953.451
36.012	1712301.537
36.012	1658911.609
36.012	1468233.695
36.012	1186030.372
36.012	659759.206
36.059	1948760.337
36.864	1399914.526
36.935	2383840.072
36.959	1247408.454
36.959	1491476.040
36.982	1079620.855
37.030	1605910.073
37.929	1621507.271
37.929	1476591.933
37.953	1766431.635
37.953	1316431.430
37.976	1354576.193
38.000	2086788.747
38.024	1186797.620
38.923	3650699.956
38.923	2407479.582
38.947	2262573.527
38.947	2804098.757
38.970	1751565.580
38.970	2171056.889
38.970	2354107.963
38.970	2552412.973
38.994	1705811.774
39.018	1545651.271
39.041	1652439.898
39.041	2041423.078
39.893	3559544.631
39.964	2514656.603
39.988	2179072.378
40.036	2102819.214
40.036	1866378.467
40.059	1721472.157
40.959	2530289.906
40.959	2629442.283
41.006	1714206.119
42.024	3201882.472
42.071	1798510.622];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(3.4); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NichAcun2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
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

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PZCM'; % Cat of Life
metaData.links.id_ITIS = '172907'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Limanda_aspera'; % Wikipedia
metaData.links.id_ADW = 'Limanda_aspera'; % ADW
metaData.links.id_Taxo = '178823'; % Taxonomicon
metaData.links.id_WoRMS = '254562'; % WoRMS
metaData.links.id_fishbase = 'Limanda-aspera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limanda_aspera}}';
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
bibkey = 'MattHels2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-016-1917-y}, ' ...
'author = {Mary Elizabeth Matta and Thomas E. Helser and Bryan A. Black}, ' ... 
'year = {2016}, ' ...
'title = {Otolith biochronologies reveal latitudinal differences in growth of {B}ering {S}ea yellowfin sole \emph{Limanda aspera}}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {39}, ' ...
'pages = {2427–2439}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NichAcun2001'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-016-1917-y}, ' ...
'author = {Daniel G. Nichol and Erika I. Acuna}, ' ... 
'year = {2001}, ' ...
'title = {Annual and batch fecundities of yellowfin sole, \emph{Limanda aspera}, in the eastern {B}ering {S}ea}, ' ...
'journal = { Fish. Bull.}, ' ...
'volume = {99}, ' ...
'pages = {108–122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Limanda-aspera}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


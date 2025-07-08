function [data, auxData, metaData, txtData, weights] = mydata_Pleuronectes_quadrituberculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Pleuronectes_quadrituberculatus'; 
metaData.species_en = 'Alaska plaice'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 09];

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(3.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Pleuronectes platessa';
data.am = 37 * 365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(3.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30.2;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'size at 50% maturity 24-37 cm';
data.Li  = 87;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ZhanWild1998';
  comment.Wwb = 'based on egg diameter of 1.9 to 2.05 mm: pi/6*0.195^3';
data.Wwp = 287;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00794*Lp^3.08, see F1';
data.Wwi = 7.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.08, see F1; max piublished weight 3.5 kg';


% uni-variate data
% time-length
data.tL_f = [... % time since birth (yr), total length (cm)
3.250	11.191
3.966	12.174
4.076	14.703
4.076	17.231
4.186	13.153
4.241	13.888
5.012	20.906
5.012	15.115
5.067	29.063
5.067	19.683
5.287	16.095
5.728	30.290
6.059	18.302
6.114	31.189
6.885	33.396
6.995	34.130
6.995	30.868
6.995	28.502
6.995	22.222
6.995	15.370
7.050	29.155
7.050	27.116
7.050	23.201
7.050	20.101
7.105	36.007
7.105	32.500
7.160	16.431
7.215	20.999
7.270	26.057
7.325	19.124
7.876	25.978
7.986	23.042
7.986	31.117
8.041	18.964
8.041	20.922
8.041	30.057
8.041	32.831
8.041	36.093
8.096	21.656
8.096	15.376
8.151	23.859
8.151	25.245
8.262	27.040
8.867	26.309
8.923	31.041
9.033	37.322
9.033	34.141
9.033	29.165
9.088	41.074
9.088	33.162
9.088	25.413
9.143	44.174
9.143	32.102
9.198	38.383
9.363	35.040
9.914	45.075
9.969	39.284
10.024	38.142
10.024	35.206
10.079	37.409
10.960	35.945
11.015	40.839
11.015	42.960
11.015	44.020
11.071	38.066
11.071	47.283
11.126	34.885
11.181	34.070
11.181	38.882
11.181	40.024
11.897	45.085
11.952	38.315
12.007	42.476
12.007	41.578
12.062	46.880
12.062	44.270
12.062	40.274
12.117	38.969
12.117	36.359
12.227	48.186
12.888	37.341
12.998	40.115
13.053	41.094
13.108	33.998
13.274	45.255
14.045	44.117
14.045	41.262
14.045	38.163
14.100	45.994
14.100	45.259
14.100	40.202
14.100	39.224
14.155	43.221
15.917	43.230
15.917	47.145
16.909	46.171
18.120	42.996
18.947	47.894
19.002	46.182
19.112	49.119
19.993	45.208
19.993	43.984
20.874	47.252
20.874	51.085
20.929	46.028
20.985	43.174
20.985	44.968
21.040	44.316
21.150	50.353
22.912	50.280
23.022	43.347
23.077	46.202
26.933	50.219
30.898	49.179];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(3.3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZhanWild1998'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)];
2.974	12.413
3.966	14.621
4.021	16.252
4.131	10.951
4.131	12.011
4.131	14.050
4.186	13.235
4.902	17.154
4.957	19.275
4.957	18.133
5.012	24.251
5.012	23.109
5.067	27.024
5.122	13.321
5.232	14.382
5.948	28.089
6.059	26.866
6.114	19.199
6.114	30.129
6.169	16.182
6.169	18.058
6.885	27.115
6.885	17.164
6.940	24.097
6.940	19.285
6.995	31.112
7.050	27.932
7.050	22.874
7.050	18.144
7.050	16.104
7.105	28.829
7.105	25.159
7.105	21.814
7.160	25.811
7.160	21.162
7.160	20.020
7.986	33.075
8.041	23.043
8.041	24.021
8.041	30.057
8.096	27.937
8.096	28.997
8.096	31.036
8.151	25.816
8.151	26.714
8.262	20.107
8.812	34.874
8.867	28.267
8.978	25.984
9.033	32.183
9.088	35.935
9.088	25.332
9.143	29.166
9.198	27.616
9.253	29.900
9.969	31.291
9.969	33.819
10.024	32.922
10.134	31.862
10.905	38.147
10.960	36.190
10.960	40.186
10.960	31.948
11.126	35.456
11.126	33.091
11.126	30.399
11.181	34.315
11.181	31.378
12.007	33.340
12.062	32.117
12.117	41.987
12.943	35.139
13.769	32.044
13.935	37.918
13.935	40.120
13.990	33.106
13.990	37.021
14.045	35.145
14.045	41.833
15.036	33.274
15.036	34.171
16.028	36.134
16.138	32.219
17.019	38.178
17.955	34.105
17.955	33.207
18.010	36.226
18.065	36.960
18.947	36.475
19.002	34.926
19.993	37.133
19.993	38.927
20.158	34.034
20.874	35.180
20.874	33.875
20.929	37.382
20.985	38.198
21.976	36.001
21.976	40.324
22.086	35.023
23.959	36.093
25.886	38.386
26.823	34.313
31.119	37.516];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(3.3); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZhanWild1998'; 
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [... % total length (cm), weight (g)
18.083	51.871
19.300	96.395
23.113	168.453
25.140	178.143
25.224	274.954
26.114	213.762
26.358	231.465
26.359	266.655
28.146	390.609
28.224	293.869
29.441	312.000
30.334	365.178
31.227	400.762
31.228	435.953
32.120	418.750
32.120	418.750
33.013	463.131
33.016	586.300
33.096	524.751
33.174	419.213
34.228	437.272
35.044	631.180
35.124	560.834
35.124	596.024
35.859	763.503
35.936	640.370
36.103	807.599
36.105	877.981
36.259	578.928
37.070	588.083
37.074	737.645
37.154	702.490
37.239	843.289
37.886	764.395
37.965	711.644
37.968	799.622
37.969	834.812
39.100	685.750
39.104	852.907
39.105	879.301
39.183	747.370
39.188	932.123
39.913	782.882
39.920	1020.421
39.996	835.704
39.997	862.098
40.650	1055.934
40.971	906.514
41.132	880.192
41.217	1003.396
41.943	889.347
42.026	942.169
42.185	845.465
42.273	1083.040
42.836	916.132
43.005	1162.541
43.081	1004.217
43.165	1101.028
43.244	1021.883
43.815	1162.897
43.821	1382.842
43.898	1233.315
44.057	1101.420
44.063	1312.566
44.865	1013.799
44.877	1436.092
45.035	1269.006
45.113	1172.266
45.846	1295.755
45.848	1374.935
45.925	1216.611
46.003	1093.479
46.009	1322.220
46.827	1577.712
46.828	1621.700
46.906	1524.961
47.065	1393.066
47.797	1490.162
47.883	1657.356
47.962	1587.009
48.047	1727.809
48.945	1939.347
49.012	1429.113
49.101	1737.070
49.103	1807.452
49.671	1816.499
49.825	1499.852
49.835	1895.751
50.153	1649.556
51.045	1649.948
51.047	1737.926
52.029	2055.073
52.194	2178.313
52.358	2231.171
54.071	2610.224
55.122	2513.912];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ZhanWild1998'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [... % total length (cm), weight (g)
16.482	81.319
18.186	96.188
19.159	99.254
20.215	119.876
20.297	134.508
21.270	131.727
22.326	152.349
22.327	164.045
23.382	181.743
23.386	234.375
24.272	161.405
25.250	220.028
25.330	208.344
25.332	234.660
26.307	252.346
27.117	246.617
27.119	270.009
27.120	281.705
28.015	316.923
28.418	293.590
28.989	334.610
29.310	296.645
30.043	328.916
30.126	358.168
30.130	407.876
30.132	425.420
31.099	361.234
31.102	387.550
31.189	466.510
31.346	399.282
32.088	551.437
32.158	419.868
32.160	443.260
32.236	378.944
32.243	469.588
33.132	422.934
33.135	466.795
33.298	481.438
33.304	551.615
34.115	557.581
34.117	575.125
34.119	601.441
34.121	621.910
34.260	341.228
34.275	525.441
34.354	499.137
35.010	595.724
35.012	610.344
35.251	563.595
35.252	575.291
35.331	551.911
35.405	458.355
36.059	525.702
36.139	511.093
36.229	619.294
36.550	587.177
36.960	645.717
37.034	552.160
37.049	739.297
37.119	601.880
37.289	701.320
37.355	511.271
37.936	683.871
38.011	607.858
38.019	701.427
38.021	730.667
38.104	748.223
38.178	666.362
38.994	727.885
39.159	757.149
39.896	853.748
40.044	675.407
40.045	684.179
41.196	889.026
41.346	731.153
42.161	786.828];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ZhanWild1998'; 
comment.LW_m = 'Data for males';

% length-fecundity
data.LN = [... % total length (cm), fecundity (#)
    29  65300
    31  93200
    35 127200
    37 159500
    39 161800
    41 183000
    43 268500
    45 280800
    47 289300
    49 312600];
units.LN = {'d', '#'}; label.LN = {'temperature','fecundity'};
temp.LN = C2K(3.3); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ZhanWild1998'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '783R5'; % Cat of Life
metaData.links.id_ITIS = '172901'; % ITIS
metaData.links.id_EoL = '46570119'; % Ency of Life
metaData.links.id_Wiki = 'Pleuronectes_quadrituberculatus'; % Wikipedia
metaData.links.id_ADW = 'Pleuronectes_quadrituberculatus'; % ADW
metaData.links.id_Taxo = '184149'; % Taxonomicon
metaData.links.id_WoRMS = '254564'; % WoRMS
metaData.links.id_fishbase = 'Pleuronectes-quadrituberculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleuronectes_quadrituberculatus}}';
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
bibkey = 'Matt2012'; type = 'techreport'; bib = [ ... 
'author = {Matta, M. E.}, ' ... 
'year = {2012}, ' ...
'title = {Alaska plaice (\emph{Pleuronectes quadrituberculatus})}, ' ...
'institution = {Resource Ecology and Fisheries Management Division, Alaska Fisheries Science Center, NMFS, NOAA, 7600 Sand Point Way NE, Seattle WA 98115}, ' ...
'howpublished = {\url{http://www.afsc.noaa.gov/REFM/Age/default.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhanWild1998'; type = 'article'; bib = [ ... 
'author = {Zhang, Change and Wilderbuer, Thomas and Walters, G. E.}, ' ... 
'year = {1998}, ' ...
'title = {Biological characteristics and fishery assessment of Alaska plaice (\emph{Pleuronectes quadrituberculatus}), in the eastern {B}ering {S}ea}, ' ...
'journal = {Marine Fisheries Review}, ' ...
'volume = {60}, ' ...
'pages = {16-27'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pleuronectes-quadrituberculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  function [data, auxData, metaData, txtData, weights] = mydata_Cryodraco_antarcticus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Cryodraco_antarcticus'; 
metaData.species_en = 'long-fingered icefish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 70;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 16*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MesaCali2020';   
  temp.am = C2K(-0.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 44;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MesaCali2020'; 
data.Lpm = 37;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'MesaCali2020'; 
data.Li = 79;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'MesaCali2020';
  comment.Li = 'fishbase: 48.7 cm';
data.Lim = 53;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males';  bibkey.Lim = 'MesaCali2020';

data.Wwb = 0.0477;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MesaDona2023';
  comment.Wwb = 'based on egg diameter of 4.5 mm: pi/6*0.45^3';
data.Wwp = 621;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MesaCali2020';
  comment.Wwp = 'based on LW_f data (44/70)^3*2500';
data.Wwi = 3.9e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'MesaCali2020';
  comment.Wwi = 'based on LW_f data (79/70)^3*2500';

data.Ri = 24445/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'MesaDona2023';   
  temp.Ri = C2K(-0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time(yr), total length (cm)
0.479	8.998
0.480	10.123
0.560	11.248
1.909	20.461
2.028	21.810
2.066	19.559
3.018	26.300
3.019	26.976
3.931	31.917
4.009	30.116
4.010	31.016
4.012	34.617
4.087	28.089
4.919	31.456
4.920	32.581
4.997	28.979
5.079	34.605
5.874	42.024
5.909	34.146
5.911	37.747
5.949	36.396
5.951	38.872
5.952	40.222
5.987	32.344
5.988	34.820
6.065	31.443
6.976	35.034
6.979	39.311
7.015	33.908
7.017	36.384
7.057	37.509
7.060	44.036
7.849	41.326
7.965	36.148
8.007	41.325
8.008	42.675
8.009	44.476
8.086	39.523
8.958	45.140
8.960	47.841
8.997	43.564
9.036	42.213
9.869	48.731
9.948	48.280
9.992	55.482
10.023	40.627
10.024	41.752
10.025	43.553
10.105	45.578
11.013	45.342
11.014	46.243
11.057	51.869
11.094	48.718
11.095	49.843
11.969	57.036
12.084	50.507
12.085	52.308
12.913	49.597
12.960	61.751
12.994	52.072
14.103	57.237
14.934	58.128
14.973	56.327
14.975	61.503
14.977	64.204
15.010	52.725
15.014	59.927
15.962	58.116
15.963	59.917
16.004	63.518
16.040	57.215
16.082	61.941
16.991	60.355
18.021	65.071
18.061	66.646];
data.tL_f(:,1) = 365 * (0.3+data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'total length','females'};  
temp.tL_f = C2K(-0.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MesaCali2020'; 
%
data.tL_m = [ ... % time(yr), total length (cm)
0.553	10.540
0.632	9.193
0.791	11.435
2.055	19.049
2.095	20.170
2.963	25.545
2.964	26.667
3.004	27.788
3.043	24.422
3.123	22.402
4.032	30.693
4.110	31.365
4.111	29.571
4.112	26.654
4.150	27.327
4.190	27.999
5.057	30.906
5.098	30.008
5.099	29.111
5.100	27.540
6.008	33.139
6.046	31.568
6.047	31.119
6.087	34.036
6.996	36.718
7.075	39.409
7.115	37.614
7.116	34.248
7.984	38.726
8.063	41.642
8.064	36.257
8.182	40.070
8.183	37.153
9.051	41.406
9.090	43.649
9.091	38.713
9.130	37.816
9.170	39.610
10.039	40.498
10.040	43.414
10.041	45.209
10.119	41.394
11.028	46.096
11.067	44.973
11.146	43.402
11.186	41.607
11.897	45.637
12.055	44.514
12.094	42.494
12.095	43.616
12.964	41.587
13.041	47.195
13.042	46.073
13.043	43.829
13.992	43.594
14.032	46.959
14.110	44.266
14.111	46.061
14.112	48.753
14.941	48.295
14.980	42.237
15.099	46.947
16.008	49.854];
data.tL_m(:,1) = 365 * (0.3+data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'total length','males'};  
temp.tL_m = C2K(-0.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MesaCali2020'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
19.223	48.232
20.064	40.193
20.624	32.154
21.607	40.193
22.730	48.232
24.699	96.463
25.114	40.193
25.397	64.309
25.821	88.424
26.661	72.347
27.362	72.347
27.367	120.579
28.347	104.502
28.767	88.424
28.909	104.502
29.192	128.617
29.896	152.733
30.312	112.540
31.014	112.540
31.158	144.695
31.720	152.733
32.425	184.887
32.836	104.502
32.980	136.656
33.269	209.003
33.961	128.617
34.809	176.849
34.960	273.312
35.516	233.119
36.080	257.235
36.353	184.887
36.920	241.158
37.761	233.119
38.046	273.312
38.886	257.235
39.314	321.543
39.592	305.466
39.865	233.119
40.302	377.814
40.429	257.235
40.435	313.505
41.133	281.350
41.421	345.659
42.126	377.814
42.128	401.929
42.257	297.428
42.402	337.621
42.411	418.006
42.832	418.006
43.385	345.659
43.674	426.045
43.820	474.277
44.358	265.273
44.373	401.929
44.929	353.698
44.939	450.161
45.227	514.469
45.491	369.775
45.639	434.084
46.068	506.431
46.485	474.277
46.497	578.778
47.203	618.971
47.331	514.469
47.617	562.701
48.316	538.585
48.468	643.087
49.173	675.241
49.864	578.778
49.883	755.627
50.311	811.897
50.428	610.932
50.564	570.740
50.579	707.395
51.160	876.206
51.422	715.434
51.990	771.704
52.007	924.437
52.547	739.550
52.558	836.013
52.707	916.399
52.859	1020.900
52.974	795.820
53.265	884.244
53.828	908.360
54.367	707.395
54.415	1133.441
54.526	876.206
54.954	940.514
54.971	1085.209
55.357	779.743
55.373	924.437
55.529	1061.093
55.938	956.592
55.957	1125.402
56.276	1463.023
56.370	1053.055
56.534	1270.096
56.546	1374.598
56.644	996.785
56.801	1149.518
56.820	1318.328
57.212	1061.093
57.252	1414.791
57.616	908.360
57.789	1197.749
57.797	1270.096
57.889	836.013
57.922	1133.441
58.053	1053.055
58.411	1744.373
58.459	916.399
58.479	1101.286
58.533	1575.563
58.629	1181.672
58.647	1342.444
59.360	1446.945
59.379	1615.756
59.476	1229.904
59.621	1278.135
59.695	1937.299
59.785	1487.138
59.948	1688.103
60.353	1543.408
60.424	2178.457
60.601	1254.019
60.615	1382.637
60.734	1189.711
61.510	1856.913
61.760	1583.601
61.812	2049.839
61.913	1696.141
62.201	1760.450
62.457	1543.408
62.488	1816.720
62.578	1374.598
62.587	1454.984
63.018	1543.408
63.319	1728.296
63.329	1816.720
63.334	1856.913
63.393	1133.441
63.766	1961.415
63.838	1350.482
64.194	2025.723
64.315	1848.875
64.516	2395.498
64.751	1985.531
64.771	2162.379
65.397	1495.177
66.412	1784.566
66.771	2483.923
67.002	2041.801];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'MesaCali2020'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
17.023	16.181
18.426	16.181
18.848	24.272
19.688	16.181
21.372	16.181
22.634	16.181
23.483	56.634
24.462	40.453
25.029	72.816
25.588	64.725
26.288	56.634
26.856	97.087
27.142	129.450
27.412	64.725
27.552	64.725
28.399	97.087
28.537	80.906
28.960	97.087
29.524	113.269
30.367	121.359
31.076	161.812
31.208	113.269
31.912	129.450
31.919	169.903
32.051	121.359
32.752	121.359
33.182	177.994
33.874	121.359
33.889	210.356
34.170	210.356
34.584	169.903
35.302	266.990
35.427	177.994
35.718	242.718
36.429	299.353
36.699	234.628
36.971	186.084
37.414	315.534
37.821	234.628
37.829	283.172
38.821	339.806
39.095	299.353
39.227	250.809
39.935	291.262
39.945	347.896
40.511	380.259
41.202	315.534
41.362	436.893
41.907	339.806
41.914	380.259
42.325	323.625
42.895	372.168
42.911	469.256
43.057	501.618
43.319	396.440
43.607	436.893
43.881	396.440
43.891	461.165
44.192	582.524
44.326	542.071
44.601	509.709
45.016	477.346
45.173	574.434
45.470	671.521
45.580	493.528
45.756	703.883
46.023	622.977
46.032	679.612
46.446	639.159
46.703	493.528
46.707	517.799
46.713	558.252
47.142	606.796
47.164	736.246
47.533	428.803
47.857	687.702
47.868	752.427
47.877	800.971
47.977	566.343
47.984	606.796
48.567	736.246
49.128	736.246
49.687	720.065
49.960	679.612
52.133	1084.142
52.684	1027.508
53.048	687.702];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'MesaCali2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00083*(TL in cm)^3.46';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZCY'; % Cat of Life
metaData.links.id_ITIS = '642901'; % ITIS
metaData.links.id_EoL = '46573066'; % Ency of Life
metaData.links.id_Wiki = 'Cryodraco_antarcticus'; % Wikipedia
metaData.links.id_ADW = 'Cryodraco_antarcticus'; % ADW
metaData.links.id_Taxo = '182489'; % Taxonomicon
metaData.links.id_WoRMS = '234796'; % WoRMS
metaData.links.id_fishbase = 'Cryodraco-antarcticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cryodraco_antarcticus}}';  
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
bibkey = 'MesaCali2020'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-019-02617-x}, ' ...
'author = {La Mesa, Mario and Calì, Federico and Riginella, Emilio and Mazzoldi, Carlotta and Jones, Christopher D.}, ' ...
'year = {2020}, ' ...
'title = {Biological parameters of the High-{A}ntarctic icefish, \emph{Cryodraco antarcticus} ({C}hannichthyidae) from the {S}outh {S}hetland {I}slands}, ' ... 
'journal = {Polar Biology}, ' ...
'volume = {35}, ' ...
'pages = {100917}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MesaDona2023'; type = 'Article'; bib = [ ... 
'author = {Mario La Mesa and Fortunata Donato and Emilio Riginella}, ' ...
'year = {2023}, ' ...
'title = {Life history and population structure of the {A}ntarctic icefish, \emph{Pagetopsis maculata} ({N}otothenioidei, {C}hannichthyidae) from the {W}eddell {S}ea}, ' ... 
'journal = {Polar Science}, ' ...
'volume = {35}, ' ...
'pages = {100917}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cryodraco-antarcticus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

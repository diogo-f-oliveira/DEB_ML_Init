  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_barbus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Oxygymnocypris_stewartii'; 
metaData.species_en = 'Naked Schizothoracin'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 14];

%% set data

% zero-variate data

data.tp = 7.3*365;   units.tp = 'd';  label.tp = 'time since birth at puberty for females'; bibkey.tp = 'HuoXie2013';   
  temp.tp = C2K(9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5.1*365;  units.tpm = 'd';  label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'HuoXie2013';   
  temp.tpm = C2K(9); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'HuoXie2012';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35.7;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'HuoXie2013'; 
data.Lpm = 27.3;   units.Lpm = 'cm'; label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'HuoXie2013'; 
data.Li = 59;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'HuoXie2012';
  comment.Li = 'fishbased gives TL 67.6 cm';

data.Wwb = 6.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'HuoXie2013';
  comment.Wwb = 'Based om egg diameter of  2.32 mm: pi/6*0.232^3';
data.Wwi = 2530;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'HuoXie2013';
    
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm), female, male
    1 17.16 NaN
    2 23.46 NaN
    3 27.34 18.37
    4 31.89 24.44
    5 27.34 27.52
    6 31.89 29.69
    7 34.41 31.32
    8 37.27 35.39
    9 42.56 35.11
   10 44.96 35.23
   11 42.90 37.40
   12 43.64 35.00
   13 43.24 36.85
   14 44.42 41.77
   15 46.72 NaN
   16 47.00 NaN
   17 51.70 45.50
   18 50.15 NaN
   19 47.55 NaN
   20 54.18 NaN
   21 54.90 NaN
   22 54.95 NaN
   24 51.69 NaN
   25 50.20 NaN];
data.tL_fm(:,1) = 365 * (0.8 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm = C2K(9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'HuoXie2012';

% length-weight
data.LW_f = [ ... % std length (cm), weight (g)
4.470	2.953
5.082	1.897
5.344	1.221
5.431	1.854
5.693	1.218
6.480	1.211
8.664	2.459
8.927	5.549
9.015	7.140
9.450	14.523
9.888	11.803
10.151	13.584
10.327	26.281
10.762	5.383
11.025	13.663
11.375	20.035
11.635	17.985
11.986	5.272
12.599	26.486
13.210	7.520
13.472	12.030
14.172	26.629
14.260	32.977
15.309	52.094
15.482	14.067
16.358	45.849
16.531	20.502
17.144	52.260
17.408	71.306
18.194	65.037
19.068	71.457
19.330	65.140
20.205	96.922
20.381	115.960
21.166	90.668
21.430	116.055
21.517	103.381
22.568	154.201
22.828	122.522
23.266	128.902
23.440	128.918
23.707	211.370
24.141	160.684
24.579	173.405
24.668	205.116
25.191	186.141
25.452	160.803
25.716	192.530
25.718	243.255
26.328	192.585
26.768	262.371
26.853	211.655
26.938	173.619
27.294	287.781
27.378	237.064
28.083	338.577
28.165	243.476
28.255	294.209
28.690	249.864
28.956	319.635
29.046	370.368
29.564	256.284
29.566	300.668
29.835	421.164
30.092	326.078
30.094	364.122
30.614	288.082
30.620	389.532
30.879	338.831
31.058	414.934
31.235	459.334
31.406	389.603
31.491	338.886
32.106	415.029
32.371	472.118
32.459	484.807
32.715	358.019
33.334	491.227
33.681	440.534
33.853	383.484
33.862	580.043
33.941	402.514
34.035	529.334
34.293	453.270
34.297	535.698
34.648	561.092
34.734	523.057
35.350	624.562
35.351	630.902
35.519	510.447
35.617	713.354
35.784	567.536
36.043	485.132
36.229	713.409
36.485	605.643
36.494	783.180
36.656	529.571
36.925	656.407
37.181	529.619
37.187	650.091
37.723	891.081
37.971	612.118
38.683	859.465
38.931	567.821
39.468	834.174
39.734	897.604
40.086	961.042
40.164	764.491
40.594	637.718
40.701	1011.822
40.783	916.721
40.875	999.156
41.031	637.758
41.057	1145.006
41.126	783.600
41.237	1252.812
41.398	973.841
41.575	1030.923
41.739	815.358
42.180	897.825
42.346	707.623
42.545	1195.866
42.792	891.540
42.798	1005.671
42.983	1227.608
43.144	948.637
43.157	1202.262
43.233	974.008
43.326	1094.487
43.327	1100.828
43.485	764.791
43.762	1075.505
43.836	802.867
44.288	1100.915
44.294	1215.046
44.298	1297.474
44.368	955.089
44.635	1050.222
44.828	1411.652
45.094	1494.104
45.258	1278.539
45.699	1348.325
45.954	1221.537
46.311	1361.062
46.647	1088.447
46.656	1265.985
46.665	1449.862
46.747	1348.420
46.998	1113.842
47.013	1411.850
47.547	1614.797
47.547	1614.797
47.804	1513.371
48.328	1494.397
48.507	1595.862
48.680	1551.494
48.762	1437.371
48.935	1405.684
49.100	1215.481
49.212	1697.375
49.212	1710.057
49.279	1304.265
49.388	1735.435
49.651	1754.480
49.730	1576.951
50.019	2109.586
50.339	1519.941
50.418	1348.753
50.523	1697.494
50.536	1970.140
50.789	1792.627
50.890	2065.281
51.139	1786.318
51.883	949.429
51.931	1906.861
52.085	1488.396
52.284	1970.299
52.452	1830.821
52.906	2166.913
52.990	2103.515
53.600	2065.527
53.941	1907.043
54.333	2750.376
55.520	2027.657
55.703	2186.188
55.980	2477.880
56.086	2858.324
56.354	2966.138
56.594	2535.001
58.779	2528.858];
units.LW_f = {'cm', 'g'}; label.LW_f = {'std length','weight','female'};  
bibkey.LW_f = 'HuoXie2012';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % std length (cm), weight (g)
25.106	230.518
26.069	274.989
26.331	268.672
27.028	218.011
27.382	306.811
27.554	243.421
28.077	230.787
28.344	313.239
28.520	344.958
28.601	218.153
28.782	344.981
29.040	262.577
29.833	383.120
29.917	319.722
30.178	294.383
30.706	370.518
31.060	452.977
31.403	332.538
31.499	497.401
31.755	383.294
32.283	446.748
32.456	421.401
32.540	338.981
32.540	351.662
33.073	522.906
33.689	611.730
33.766	389.817
33.943	434.217
34.210	535.690
34.474	573.758
34.642	434.280
34.819	485.021
35.262	599.191
35.788	637.283
36.141	713.402
36.401	656.360
37.099	637.401
37.107	795.917
37.183	580.344
37.712	675.500
38.149	675.540
38.155	796.012
39.554	808.819
40.954	840.649
42.363	1062.697
42.619	923.227
45.434	1297.577];
units.LW_m = {'cm', 'g'}; label.LW_m = {'std length','weight','male'};  
bibkey.LW_m = 'HuoXie2012';
comment.LW_m = 'Data for males';

% length-fecundity
data.LN = [ ... % std length(cm), fecundity (#)
33.336	11065.574
38.889	25081.967
39.507	19426.230
39.854	20778.689
40.066	24098.364
40.407	29508.200
40.427	15368.852
40.498	26680.327
40.510	18811.478
40.813	19795.081
40.854	21516.396
40.883	31352.461
41.008	35163.936
41.231	31475.412
41.549	22745.905
41.583	29385.246
42.156	24344.265
42.340	17581.969
42.370	26680.327
42.492	32950.821
42.853	24098.364
42.931	30245.903
43.205	21393.445
43.321	31721.313
43.330	25204.918
43.406	33442.623
43.578	34918.033
43.868	44508.199
44.624	33934.427
44.744	41557.378
45.531	38729.509
45.889	32336.067
45.921	40573.772
45.992	51639.345
46.153	30368.853
46.169	19426.230
46.406	36270.492
47.240	31475.412
47.282	32459.017
48.258	50040.985
48.264	45737.706
48.291	27295.084
48.480	47459.018
48.691	51516.395
49.108	34180.328
49.344	51762.297
49.436	48196.723
49.953	52008.198
50.134	47336.068
50.476	52008.198
50.530	44508.199
50.744	47336.068
51.718	35901.640
52.131	51639.345
52.224	47704.919
52.625	41557.378
55.354	50778.690
56.067	39713.117
56.129	57049.182];    
units.LN = {'cm','#'}; label.LN = {'std length','fecundity'};  
temp.LN = C2K(9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HuoXie2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.LW_f = 3 * weights.LW_f;
weights.LN = 3 * weights.LN;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4BFBD'; % Cat of Life
metaData.links.id_ITIS = '689604'; % ITIS
metaData.links.id_EoL = '217814'; % Ency of Life
metaData.links.id_Wiki = 'Oxygymnocypris_stewartii'; % Wikipedia
metaData.links.id_ADW = 'Oxygymnocypris_stewartii'; % ADW
metaData.links.id_Taxo = '182414'; % Taxonomicon
metaData.links.id_WoRMS = '1018168'; % WoRMS
metaData.links.id_fishbase = 'Oxygymnocypris-stewartii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oxygymnocypris_stewartii}}';  
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
bibkey = 'HuoXie2012'; type = 'article'; bib = [ ...  
'author = {Bin Huo and Cong-Xin Xie and Bao-Shan Ma and Xue-Feng Yang and Hai-Ping Huang}, ' ...
'year = {2012}, ' ...
'title = {Age and Growth of \emph{Oxygymnocypris stewartii} ({C}yprinidae: {S}chizothoracinae) in the {Y}arlung {T}sangpo {R}iver, {T}ibet, {C}hina}, ' ... 
'journal = {Zoological Studies}, ' ...
'volume = {51(2)}, '...
'pages = {185-194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HuoXie2013'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-012-0031-4}, ' ...
'author = {Bin Huo and Cong-Xin Xie and Bao-Shan Ma and Xue-Feng Yang and Hai-Ping Huang}, ' ...
'year = {2013}, ' ...
'title = {Reproductive biology of \emph{Oxygymnocypris stewartii} in the {Y}arlung {Z}angbo {R}iver in {T}ibet, {C}hina}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {96}, '...
'pages = {481–493}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Oxygymnocypris-stewartii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

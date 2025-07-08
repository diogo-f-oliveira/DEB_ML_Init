function [data, auxData, metaData, txtData, weights] = mydata_Lithognathus_aureti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Lithognathus_aureti'; 
metaData.species_en = 'West coast seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 09];

%% set data
% zero-variate data

data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(25.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 50*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(25.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 46.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 100;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 1832;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01514*Lp^3.05, see F1';
data.Wwi = 19060;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01514*Li^3.05, see F1; max. published weight: 19.3 kg';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(25.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-change in length-change in weight
data.tL_N = [ ... % time since birth (yr), change in length (cm/yr), change in weight (g/yr)
0.975	21.311
0.976	20.492
1.048	33.333
1.049	31.421
1.054	26.230
1.222	23.224
1.392	17.213
1.874	34.426
1.875	33.607
1.876	31.967
1.966	23.497
2.120	37.432
2.126	30.328
2.127	28.415
2.212	25.683
2.217	20.492
2.294	26.776
2.782	37.158
2.868	32.787
2.872	28.142
2.873	27.322
2.958	23.770
3.033	33.333
3.040	25.410
3.118	30.328
3.279	35.519
3.448	31.148
3.934	44.262
3.936	42.350
4.019	41.803
4.020	40.164
4.021	39.344
4.021	38.525
4.022	37.705
4.023	36.066
4.024	35.246
4.026	33.333
4.934	35.519
5.002	53.552
5.005	49.454
5.006	48.634
5.008	46.175
5.009	45.082
5.011	42.350
5.095	40.710
5.175	44.536
5.179	39.071
5.180	38.525
5.180	37.432
5.261	39.891
5.749	50.000
5.840	40.437
5.923	39.891
6.073	57.923
6.080	50.546
6.083	45.902
6.086	42.350
6.247	47.541
6.255	38.251
6.326	52.459
6.905	52.732
7.064	60.109
7.073	49.180
7.074	48.087
7.077	44.809
7.081	40.164
7.155	50.820
7.157	47.541
7.158	46.448
7.731	53.825
7.977	56.284
8.058	58.470
8.149	48.634
8.150	47.541
8.887	57.104
8.896	45.902
9.048	61.749
9.051	57.923
9.220	54.098
9.799	54.098
9.966	52.732
10.038	65.027
10.044	57.377
10.211	56.557
10.290	60.383
10.784	63.388
10.956	55.191
10.957	54.098
10.958	52.459
11.025	71.858
11.031	64.754
11.034	60.929
12.026	61.749
12.111	58.743
12.273	62.842
12.927	72.678
12.934	64.208
12.934	63.934
13.014	67.486
13.102	61.475
14.007	66.667
14.089	68.306
14.257	65.027
15.080	70.492
15.995	63.661
16.241	66.120
16.986	66.120
17.154	63.115
18.052	77.596
18.140	71.311
19.872	76.503
20.118	79.508
20.873	66.940
22.026	72.951
22.931	78.962
23.016	76.503
24.997	81.421
25.984	88.251
25.989	82.514
29.057	73.224
29.792	84.426
31.198	84.699
31.939	89.617
32.114	77.869
32.943	75.956
33.019	84.153
33.020	82.514
35.922	74.317
35.924	72.404
41.866	88.525
41.957	78.415
47.002	80.328
49.895	82.514];
data.tL_N(:,1) = (0.1+data.tL_N(:,1))* 365; % convert yr to d
for i=2:size(data.tL_N,1); if data.tL_N(i,1)<=data.tL_N(i-1,1);data.tL_N(i,1)=data.tL_N(i-1,1)+1e-3;end;end
units.tL_N   = {'d', 'cm'};  label.tL_N = {'time since birth','fork length','northern'};  
temp.tL_N    = C2K(25.2);  units.temp.tL_N = 'K'; label.temp.tL_N = 'temperature';
bibkey.tL_N = 'HoltKirc2001'; 
%
data.tL_S = [ ... % time since birth (yr), change in length (cm/yr), change in weight (g/yr)
0.869	26.452
0.869	24.982
1.853	32.610
1.911	34.079
1.969	33.196
2.085	30.252
2.085	30.546
2.085	36.134
2.085	41.723
2.143	23.780
2.201	28.191
2.838	41.708
3.012	33.469
3.069	43.762
3.069	39.939
3.069	38.174
3.069	35.233
3.069	32.586
3.127	30.526
3.185	39.348
3.243	36.112
3.880	39.923
3.880	48.158
3.938	45.510
3.938	52.275
4.054	42.566
4.054	44.037
4.112	46.683
4.923	49.608
4.923	42.844
4.981	52.548
4.981	46.960
4.981	46.960
5.039	44.606
5.097	45.487
5.154	41.663
5.907	42.824
5.907	45.177
6.023	53.704
6.023	57.528
6.081	52.233
6.081	55.762
6.081	62.233
6.139	49.878
6.313	48.110
6.892	53.099
6.892	52.217
6.892	51.040
6.950	55.745
6.950	49.568
7.008	61.920
7.008	58.391
7.066	64.860
7.066	48.978
7.761	61.611
7.819	52.199
7.934	51.314
7.934	54.843
7.934	69.843
7.992	67.783
8.050	56.606
8.108	57.781
8.108	58.369
8.108	64.546
8.861	63.060
8.919	68.648
8.919	62.177
8.977	56.882
9.035	64.528
9.035	60.704
9.035	55.410
9.035	52.175
9.093	57.762
9.151	60.408
9.903	56.569
9.961	60.980
9.961	62.156
10.019	58.332
10.019	63.332
10.077	65.095
10.135	54.800
10.135	60.388
10.830	72.139
10.946	66.255
10.946	64.196
10.946	62.431
11.004	69.783
11.004	59.195
11.004	57.724
11.178	61.839
11.873	65.648
11.873	67.413
11.931	68.588
11.931	68.883
11.931	70.647
11.931	73.294
11.931	79.471
11.988	57.117
11.988	58.587
11.988	60.646
11.988	63.881
11.988	75.940
12.046	62.116
12.857	67.688
12.915	75.040
12.973	83.274
12.973	73.568
12.973	68.862
12.973	64.450
12.973	63.568
13.900	67.373
13.900	68.550
13.958	72.666
13.958	74.137
13.958	74.725
14.015	80.018
14.131	65.604
14.189	78.250
14.884	86.472
14.942	82.059
14.942	75.294
14.942	71.176
15.000	78.822
15.000	77.058
15.000	75.293
15.000	69.411
15.058	73.821
15.058	68.527
15.116	72.350
15.753	82.043
15.869	64.394
15.869	76.158
15.869	78.217
15.927	70.863
15.927	77.334
16.042	71.743
16.042	79.684
16.042	84.684
16.100	68.801
16.158	74.388
16.795	85.258
16.853	70.551
16.853	69.374
16.911	77.020
16.911	75.550
16.911	75.256
16.911	73.491
16.911	71.726
16.969	93.784
17.027	89.665
17.027	82.018
17.838	69.649
17.896	78.766
17.896	84.942
17.954	65.529
18.012	67.587
18.012	73.175
18.012	74.352
18.012	99.646
18.185	91.113
18.996	90.509
18.996	85.509
19.054	71.978
19.865	79.903
19.923	70.491
19.923	85.196
19.981	74.019
19.981	82.548
19.981	87.548
20.039	69.900
20.097	90.781
20.849	93.708
20.849	91.943
20.849	82.531
20.907	84.883
20.965	88.117
20.965	83.117
20.965	81.941
20.965	80.764
20.965	71.941
21.139	78.114
21.834	87.218
21.892	78.393
21.892	91.628
21.950	95.451
22.008	78.979
22.008	83.391
22.066	81.037
22.066	89.272
22.124	86.036
22.761	86.906
22.992	92.783
22.992	88.960
22.992	88.077
22.992	85.430
22.992	81.607
23.050	96.900
23.803	84.826
23.803	89.532
23.919	88.353
23.919	99.530
23.977	91.293
23.977	97.176
24.035	79.233
24.093	86.879
24.788	101.278
24.846	90.100
24.961	94.509
24.961	86.862
25.946	92.431
25.946	91.255
26.988	94.764
27.915	93.863
29.942	87.059
31.795	102.611
31.911	95.256];
for i=2:size(data.tL_S,1); if data.tL_S(i,1)<=data.tL_S(i-1,1);data.tL_S(i,1)=data.tL_S(i-1,1)+1e-3;end;end
data.tL_S(:,1) = (0.1+data.tL_S(:,1))* 365; % convert yr to d
units.tL_S   = {'d', 'cm'};  label.tL_S = {'time since birth','fork length','southern'};  
temp.tL_S    = C2K(25.2);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'HoltKirc2001'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_N = 5 * weights.tL_N;
weights.tL_S = 5 * weights.tL_S;
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
set1 = {'tL_N','tL_S'}; subtitle1 = {'Data for northern, southern population'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01514*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VKQG'; % Cat of Life
metaData.links.id_ITIS = '647950'; % ITIS
metaData.links.id_EoL = '46579958'; % Ency of Life
metaData.links.id_Wiki = 'Lithognathus_aureti'; % Wikipedia
metaData.links.id_ADW = 'Lithognathus_aureti'; % ADW
metaData.links.id_Taxo = '179016'; % Taxonomicon
metaData.links.id_WoRMS = '218605'; % WoRMS
metaData.links.id_fishbase = 'Lithognathus-aureti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithognathus_aureti}}';
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
bibkey = 'HoltKirc2001'; type = 'Article'; bib = [ ... 
'doi = {10.2989/025776101784528917}, ' ...
'author = {J. A. Holtzhausen and C. H. Kirchner}, ' ... 
'year = {2001}, ' ...
'title = {Age and growth of two populations of {W}est {C}oast steenbras \emph{Lithognathus aureti} in {N}amibian {w}aters, based on otolith readings and mark-recapture data}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {23(1)}, ' ...
'pages = {169-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lithognathus-aureti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

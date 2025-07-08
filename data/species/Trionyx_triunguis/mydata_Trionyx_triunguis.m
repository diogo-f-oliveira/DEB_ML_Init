function [data, auxData, metaData, txtData, weights] = mydata_Trionyx_triunguis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Trionychidae';
metaData.species    = 'Trionyx_triunguis'; 
metaData.species_en = 'African softshell turtle';

metaData.ecoCode.climate = {'Am', 'BWh', 'BSh', 'BSk'};
metaData.ecoCode.ecozone = {'THp','TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'; 't-Wde'; 't-JOe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 01];

%% set data
% zero-variate data

data.am = 50.6*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'EoL';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 35; units.Lp = 'cm';   label.Lp = 'plastron length at puberty for female';   bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Apalone_spinifera: 90*18.5/48';
data.Li = 90; units.Li = 'cm';   label.Li = 'ultimate plastron length for females';      bibkey.Li = 'Wiki';
  comment.Li = '85-94 cm';

data.Ww0 = 17.82; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'LeshAr1991';
data.Wwb = 11.83; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'LeshAr1991';
data.Wwi = 4e4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri  = 40/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'LeshAr1991';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-embryo wet weight
data.tWw_27 = [ ... % age (d), wet weight (g)
19.575	0.153
20.013	0.154
20.450	0.227
30.082	0.777
30.087	0.522
30.238	0.267
34.760	0.633
35.344	0.670
39.852	1.764
39.868	0.963
44.526	1.838
44.537	1.292
44.542	1.001
45.991	1.620
49.750	3.661
49.930	1.913
50.208	2.642
54.872	3.226
55.026	2.826
55.590	3.882
56.855	6.467
59.652	5.340
59.929	6.141
59.960	4.575
60.263	3.993
60.811	5.850
60.972	5.085
64.570	7.927
64.864	7.817
65.050	5.742
65.321	6.871
65.335	6.143
66.767	7.636
69.652	9.531
69.656	9.349
69.827	8.038
69.839	7.455
70.826	9.240
71.858	8.767
73.208	6.983
74.745	10.588
75.609	11.244
76.034	11.936
77.227	10.699
77.985	9.279
78.671	11.537
78.674	11.391
78.684	10.881
80.708	11.974
80.714	11.683
80.766	9.025
81.913	10.154];
units.tWw_27   = {'d', 'g'};  label.tWw_27 = {'age', 'embryo wet weight', '27 C'};  
temp.tWw_27    = C2K(27);  units.temp.tWw_27 = 'K'; label.temp.tWw_27 = 'temperature';
bibkey.tWw_27 = 'LeshAr1991';
%
data.tWw_30 = [ ... % age (d), wet weight (g)
14.662	0.056
14.887	0.084
19.624	0.587
19.962	0.335
20.188	0.056
24.812	0.279
24.925	0.531
25.263	0.782
29.774	1.061
29.775	1.508
29.887	0.782
30.113	0.531
35.075	2.291
35.076	1.844
35.301	2.877
39.812	3.911
39.813	4.022
39.814	4.358
40.150	3.687
40.151	3.855
40.152	5.056
40.153	5.447
44.887	6.955
44.888	5.056
45.113	7.291
45.114	5.642
45.226	7.430
49.398	9.106
49.624	9.385
49.737	9.804
50.188	10.112
50.189	6.453
51.880	8.994
53.008	10.894
53.233	7.514
53.459	8.827
54.925	10.642
54.926	6.453
55.940	10.196
56.278	11.089
58.308	9.944
58.985	10.531
62.143	11.006
62.256	9.916
63.947	12.291];
units.tWw_30   = {'d', 'g'};  label.tWw_30 = {'age', 'embryo wet weight', '30 C'};  
temp.tWw_30    = C2K(30);  units.temp.tWw_30 = 'K'; label.temp.tWw_30 = 'temperature';
bibkey.tWw_30 = 'LeshAr1991';
%
data.tWw_33 = [ ... % age (d), wet weight (g)
9.597	0.164
14.904	0.218
15.015	0.552
19.645	0.523
19.867	1.024
19.873	0.244
24.720	1.384
24.721	1.217
24.924	4.278
24.950	0.855
29.659	5.278
29.678	2.774
29.681	2.328
30.250	1.800
34.833	8.004
34.855	5.054
34.974	4.275
39.816	6.110
39.907	9.004
39.916	7.863
39.922	7.028
40.032	7.446
44.535	9.281
44.862	10.867
44.977	10.533
46.895	10.783
47.029	8.028
47.803	10.115
47.937	7.360
49.489	11.228
49.491	10.894
49.847	8.639
50.510	10.643];
units.tWw_33   = {'d', 'g'};  label.tWw_33 = {'age', 'embryo wet weight', '33'};  
temp.tWw_33    = C2K(33);  units.temp.tWw_33 = 'K'; label.temp.tWw_33 = 'temperature';
bibkey.tWw_33 = 'LeshAr1991';

% time-embryo dry weight
data.tWd_27 = [ ... % age (d), dry weight (g)
30.681	0.049
35.064	0.051
35.207	0.196
39.591	0.162
40.026	0.307
44.997	0.164
46.017	0.273
49.524	0.275
49.813	0.457
54.344	0.350
55.510	0.496
56.242	0.423
56.964	0.860
60.032	0.862
60.038	0.534
60.042	0.352
61.201	0.826
61.792	0.535
64.555	1.191
64.998	0.936
65.149	0.682
65.297	0.572
67.333	1.083
69.662	1.521
69.803	1.776
69.963	1.048
70.249	1.375
71.263	1.849
72.586	1.413
73.177	1.085
74.616	2.215
75.342	2.433
75.471	3.307
75.498	1.960
75.775	2.725
76.659	2.325
77.532	2.507
78.119	2.398
78.686	3.272
79.576	2.581
81.010	4.001
81.020	3.491
81.193	2.108
82.202	2.800];
units.tWd_27   = {'d', 'g'};  label.tWd_27 = {'age', 'embryo dry weight', '27 C'};  
temp.tWd_27    = C2K(27);  units.temp.tWd_27 = 'K'; label.temp.tWd_27 = 'temperature';
bibkey.tWd_27 = 'LeshAr1991';
%
data.tWd_30 = [ ... % age (d), dry weight (g)
14.887	0.140
14.888	0.112
19.624	0.112
20.075	0.140
24.925	0.056
24.926	0.223
29.662	0.140
29.887	0.391
34.850	0.112
35.188	0.335
39.925	0.279
39.926	0.531
39.927	0.782
45.000	0.447
45.001	0.726
45.002	1.034
49.962	1.760
49.963	2.067
50.301	0.810
51.992	1.676
52.782	2.430
53.008	1.089
53.120	1.508
54.925	1.899
55.263	1.006
55.714	1.788
55.940	2.654
56.842	1.816
58.083	1.844
58.872	2.514
58.873	2.626
62.030	3.045
62.256	2.067
64.173	2.598];
units.tWd_30   = {'d', 'g'};  label.tWd_30 = {'age', 'embryo dry weight', '30 C'};  
temp.tWd_30    = C2K(30);  units.temp.tWd_30 = 'K'; label.temp.tWd_30 = 'temperature';
bibkey.tWd_30 = 'LeshAr1991';
%
data.tWd_33 = [ ... % age (d), dry weight (g)
9.937	0.080
14.792	0.162
14.793	0.051
19.760	0.216
19.761	0.133
24.726	0.549
25.067	0.215
25.068	0.104
29.694	0.603
30.148	0.325
30.149	0.158
30.150	0.074
34.550	0.657
34.999	1.019
35.004	0.323
39.970	0.711
40.075	1.685
40.078	1.351
40.080	1.101
40.081	0.906
44.586	2.519
44.588	2.185
44.590	1.990
44.591	1.851
44.593	1.628
44.921	2.936
47.304	1.488
47.410	2.406
47.976	2.211
48.324	0.987
49.780	2.573
49.781	2.406
49.782	2.350
50.004	2.823
50.014	1.515
50.904	3.296];
units.tWd_33   = {'d', 'g'};  label.tWd_33 = {'age', 'embryo dry weight', '33 C'};  
temp.tWd_33    = C2K(33);  units.temp.tWd_33 = 'K'; label.temp.tWd_33 = 'temperature';
bibkey.tWd_33 = 'LeshAr1991';

% time-respiration
data.tJO_27 = [ ... % age, embryo respiration cm^3 O2/d
13.150	3.068
14.943	2.173
20.744	1.070
21.994	2.294
24.622	2.449
27.677	5.069
29.464	3.116
29.894	6.108
34.194	8.894
34.887	9.065
35.014	6.949
36.400	7.643
36.803	5.349
39.849	6.207
39.856	7.616
42.618	7.066
42.650	13.233
42.783	12.175
42.918	11.645
43.190	10.762
45.830	13.208
45.835	14.266
45.837	14.618
45.840	15.147
45.843	15.851
47.618	11.432
49.751	22.869
49.842	13.706
49.994	16.347
51.129	21.977
52.676	27.075
52.710	33.595
53.214	24.252
53.369	27.422
53.804	31.296
53.868	17.022
55.684	20.708
56.604	38.146
58.389	35.841
58.402	38.308
58.521	34.607
58.689	40.244
58.797	34.428
58.803	35.662
59.067	33.193
59.320	28.609
59.727	27.196
59.736	28.958
60.136	26.136
60.840	28.421
60.991	30.887
61.244	26.480
62.375	31.228
62.800	33.163
63.399	42.146
63.676	42.143
63.827	44.609
63.841	47.428
64.204	37.382
64.776	41.078
65.015	33.851
65.022	35.084
65.940	52.170
66.157	40.714
66.758	50.049
67.058	54.628
67.475	28.369
67.789	35.591
67.883	53.740
68.020	53.387
68.382	43.340
68.557	50.387
69.486	42.979
69.752	40.862
69.770	44.386
69.777	45.620
70.086	51.961
70.148	37.335
70.549	34.689
71.168	47.371
71.393	37.325
71.657	35.032
72.008	49.303
72.672	44.187
72.688	47.183
72.842	50.177
73.347	41.010
73.364	44.182
73.694	54.576
74.005	34.662
74.020	37.481
74.872	41.880
75.273	39.057
75.304	45.048
75.315	47.162
75.842	42.224
76.368	36.934
76.536	42.748
76.894	31.820
76.906	34.110
77.075	40.100
77.849	29.345
77.860	31.460
77.890	37.274
78.894	44.315
78.982	34.623
79.045	46.781
80.797	37.956
80.888	28.969
80.951	40.951
82.827	29.659
84.885	26.471];
units.tJO_27   = {'d', 'cm^3/d'};  label.tJO_27 = {'age', 'embryo O_2 consumption', '27 C'};  
temp.tJO_27    = C2K(27);  units.temp.tJO_27 = 'K'; label.temp.tJO_27 = 'temperature';
bibkey.tJO_27 = 'LeshAr1991';
%
data.tJO_30 = [ ... % age, embryo respiration cm^3 O2/d
12.008	0.797
13.709	1.337
14.347	1.472
14.773	2.422
17.429	1.875
19.875	3.501
20.089	4.859
23.278	5.669
23.809	5.668
24.448	6.754
25.189	4.716
26.893	7.565
26.895	8.516
28.486	6.612
29.017	6.204
29.767	11.092
30.079	5.659
30.087	12.179
30.191	10.549
30.407	13.265
31.148	10.547
31.366	14.621
31.889	8.509
33.594	12.037
34.444	12.172
34.771	18.555
34.880	20.457
34.881	21.679
35.186	10.813
35.295	12.986
35.941	19.368
36.045	17.602
36.046	18.689
37.638	16.785
37.747	19.366
38.815	23.167
39.354	28.735
39.571	32.266
39.674	30.229
39.885	28.870
39.886	29.413
40.192	19.769
40.209	32.673
40.420	31.314
40.525	30.906
40.530	34.438
40.620	22.078
41.481	30.090
42.020	36.337
42.976	36.200
42.977	36.743
43.079	33.347
43.296	37.150
43.712	30.494
43.935	37.692
44.035	33.074
44.045	40.545
44.578	42.038
44.579	42.445
44.580	43.532
44.581	43.939
44.583	45.841
44.584	46.792
44.679	38.370
44.682	40.408
44.782	35.925
44.886	33.752
44.896	41.358
44.998	38.098
45.332	49.643
45.736	34.158
46.287	48.962
46.397	51.950
47.032	49.504
48.523	52.219
48.728	46.921
48.940	45.970
49.260	47.328
49.465	41.759
49.475	49.093
49.573	42.574
49.575	44.475
49.584	50.859
49.698	56.563
49.700	58.329
49.801	54.118
50.334	55.883
50.433	50.043
50.540	50.993
50.554	61.587
50.767	61.995
51.285	51.535
51.286	52.350
51.288	54.388
51.815	50.720
51.917	47.867
52.032	54.251
52.131	48.410
52.765	45.693
52.773	52.348
52.974	43.112
53.088	49.495
53.095	54.657
53.409	50.581
53.518	53.026
53.731	53.297
53.737	58.051
53.824	43.110
55.420	44.602
55.423	47.319
55.436	56.690
55.439	58.999
55.729	37.267
55.730	38.218
55.731	39.305
55.733	40.391
55.936	33.464
55.959	50.985
56.503	60.492
56.723	65.653
57.641	37.400
57.645	40.252
57.654	47.044
57.661	52.069
57.737	29.658
57.743	34.004
57.877	54.921
58.585	27.755
58.625	57.908
58.807	35.225
58.836	56.821
58.908	31.150
59.578	55.190
59.752	26.124
59.779	46.905
59.781	48.399
59.880	42.966
59.997	50.843
60.003	55.189
60.637	52.744
60.638	53.559
60.928	31.691
61.590	50.162
61.773	28.430
62.527	35.899
62.529	37.393
62.534	41.332
62.637	38.615
62.642	42.146
62.863	49.073
62.964	44.591
63.156	28.971
63.600	43.232
63.790	26.797
64.125	39.156
64.547	36.575
64.857	29.919
64.860	31.956
65.713	34.128];
units.tJO_30   = {'d', 'cm^3/d'};  label.tJO_30 = {'age', 'embryo O_2 consumption', '30 C'};  
temp.tJO_30    = C2K(30);  units.temp.tJO_30 = 'K'; label.temp.tJO_30 = 'temperature';
bibkey.tJO_30 = 'LeshAr1991';
%
data.tJO_33 = [ ... % age, embryo respiration cm^3 O2/d
12.818	2.163
14.792	4.563
18.934	5.957
22.092	8.485
22.882	10.000
24.755	9.877
24.756	11.012
24.757	11.770
24.759	13.158
27.222	12.404
27.224	13.666
28.211	15.055
28.904	17.454
29.004	18.716
29.302	20.104
30.085	15.941
31.775	26.921
31.862	17.584
32.357	19.604
33.455	30.583
35.027	26.169
35.830	38.157
35.832	39.545
35.925	34.751
35.928	37.653
35.933	41.817
37.004	30.714
37.703	38.412
37.808	43.586
38.985	38.162
40.579	52.170
40.786	60.246
40.970	49.647
40.978	55.704
41.949	43.592
42.763	64.413
42.766	66.811
42.855	59.366
43.137	48.262
44.530	58.864
44.729	60.126
44.815	49.653
44.836	67.066
45.010	48.265
45.417	58.360
45.815	61.768
46.595	54.702
46.604	61.769
46.783	47.006
46.995	58.867
47.484	56.092
48.370	54.957
48.566	54.074
48.570	57.355
48.875	64.422
48.963	56.598
49.645	50.038
49.755	58.871
50.243	54.834
50.728	48.399
51.521	52.438
51.525	55.719
51.606	40.956
51.711	46.382
51.712	47.391
52.003	43.101
52.296	40.956
53.374	35.784
53.574	38.561
53.675	40.580
53.964	34.650
55.541	34.778
56.032	33.391
56.036	36.167
56.130	32.760
56.428	34.779
57.997	27.968];
units.tJO_33   = {'d', 'cm^3/d'};  label.tJO_33 = {'age', 'embryo O_2 consumption', '33 C'};  
temp.tJO_33    = C2K(33);  units.temp.tJO_33 = 'K'; label.temp.tJO_33 = 'temperature';
bibkey.tJO_33 = 'LeshAr1991';

% temperature-age at birth
data.Tab = [ ... % plastron length (cm), yearly fecundity (#)
    27 81.8
    30 64.5
    33 55.1];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'LeshAr1991';
    
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_33','tWw_30','tWw_27'}; subtitle1 = {'Data 33, 30, 27 C'};
set2 = {'tWd_33','tWd_30','tWd_27'}; subtitle2 = {'Data 33, 30, 27 C'};
set3 = {'tJO_33','tJO_30','tJO_27'}; subtitle3 = {'Data 33, 30, 27 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are probably smaller than females, but no data found';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Sex is determined by genetics';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58WKP'; % Cat of Life
metaData.links.id_ITIS = '551876'; % ITIS
metaData.links.id_EoL = '46559486'; % Ency of Life
metaData.links.id_Wiki = 'Trionyx_triunguis'; % Wikipedia
metaData.links.id_ADW = 'Trionyx_triunguis'; % ADW
metaData.links.id_Taxo = '48448'; % Taxonomicon
metaData.links.id_WoRMS = '397354'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Trionyx&species=triunguis'; % ReptileDB
metaData.links.id_AnAge = 'Trionyx_triunguis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trionyx_triunguis}}';
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
bibkey = 'LeshAr1991'; type = 'Article'; bib = [ ... 
'author = {Adah Leshem and Amos Ar  and Ralph A. Ackerman}, ' ... 
'year = {1991}, ' ...
'title = {Growth, Water, and Energy Metabolism of the Soft-shelled Turtle(\emph{Trionyx triunguis}) Embryo: Effects of Temperature}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {64(2)}, ' ...
'pages = {568-594}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559486}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


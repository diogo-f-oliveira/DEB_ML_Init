function [data, auxData, metaData, txtData, weights] = mydata_Katsuwonus_pelamis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Katsuwonus_pelamis'; 
metaData.species_en = 'Skipjack tuna';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 17];


%% set data
% zero-variate data

data.ab = 1.1;    units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 45;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'Wiki';
  comment.Lp = '100 to 125 cm, not clear if this is TL or FL';
data.Li  = 108;   units.Li  = 'cm';  label.Li  = 'ultimate fork lenth length';   bibkey.Li  = 'Wiki';

data.Wwb  = 5.24e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi  = 34.5e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'Wiki';

data.Ri = 14e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.277	29.485
0.301	30.412
0.313	26.701
0.324	33.566
0.348	27.814
0.359	35.606
0.359	30.040
0.359	29.298
0.370	34.121
0.370	33.379
0.371	31.895
0.406	31.894
0.406	31.894
0.417	38.758
0.418	28.183
0.429	35.418
0.430	26.699
0.451	44.509
0.463	41.911
0.475	40.798
0.487	37.087
0.488	33.376
0.488	30.037
0.499	39.127
0.510	43.765
0.523	31.891
0.533	43.023
0.556	47.289
0.558	31.890
0.580	45.619
0.580	42.836
0.591	50.443
0.592	41.166
0.592	39.682
0.592	39.682
0.593	34.487
0.603	51.926
0.604	36.713
0.616	33.188
0.626	54.894
0.627	45.803
0.662	42.278
0.663	38.010
0.673	49.327
0.674	44.318
0.687	34.114
0.687	33.557
0.697	43.947
0.721	42.647
0.721	40.050
0.722	36.154
0.733	41.719
0.755	52.108
0.778	54.149
0.779	47.655
0.791	47.284
0.791	43.017
0.802	47.469
0.815	36.708
0.824	59.342
0.826	46.541
0.849	48.025
0.860	51.178
0.871	60.269
0.908	42.828
0.921	33.552
0.930	55.258
0.932	36.705
0.941	64.535
0.942	51.733
0.944	41.158
0.944	41.158
0.955	44.497
0.966	46.352
0.966	45.981
0.967	41.157
0.978	48.578
0.988	63.049
1.012	60.266
1.012	53.401
1.013	48.948
1.014	38.744
1.036	49.319
1.048	50.432
1.048	49.690
1.060	48.762
1.060	47.092
1.071	51.916
1.107	49.688
1.107	46.720
1.118	54.141
1.118	51.915
1.119	44.679
1.129	57.109
1.153	51.914
1.154	43.565
1.165	50.244
1.166	42.080
1.166	40.596
1.187	60.076
1.202	30.762
1.212	50.614
1.223	52.469
1.247	53.581
1.247	48.572
1.247	48.572
1.247	48.201
1.247	46.160
1.282	54.694
1.283	44.490
1.317	49.869
1.319	32.986
1.339	64.154
1.340	56.177
1.363	57.475
1.374	64.339
1.375	60.072
1.387	50.795
1.389	35.025
1.399	52.836
1.412	41.147
1.423	51.536
1.435	45.599
1.446	49.310
1.458	45.228
1.480	61.554
1.480	57.101
1.482	41.702
1.493	53.576
1.508	25.189
1.527	60.254
1.527	59.697
1.528	54.688
1.550	64.520
1.551	57.099
1.551	52.647
1.552	47.823
1.552	47.452
1.553	40.216
1.564	41.700
1.574	61.737
1.575	54.130
1.589	33.536
1.598	50.790
1.632	59.138
1.634	45.038
1.644	63.405
1.666	70.826
1.692	51.345
1.702	61.734
1.703	56.354
1.704	47.448
1.705	44.294
1.716	49.860
1.728	40.954
1.738	55.611
1.738	54.126
1.738	54.126
1.739	52.457
1.750	57.095
1.773	61.918
1.832	58.206
1.853	74.718
1.856	48.743
1.866	63.957
1.867	53.381
1.879	54.680
1.880	45.403
1.884	15.904
1.891	51.897
1.948	62.841
1.949	59.873
1.949	57.090
1.950	51.153
1.973	55.234
1.983	64.696
1.984	56.904
1.984	55.791
1.996	59.686
2.008	54.677
2.008	48.925
2.031	55.975
2.090	55.417
2.090	55.231
2.090	52.820
2.090	48.924
2.101	61.725
2.114	47.253
2.136	58.013
2.148	54.117
2.182	67.845
2.184	50.591
2.195	55.600
2.230	55.599
2.231	51.889
2.240	72.297
2.253	64.319
2.253	60.051
2.253	57.825
2.254	54.115
2.264	67.287
2.289	56.526
2.289	55.598
2.300	63.019
2.311	69.327
2.311	65.802
2.325	50.031
2.346	66.728
2.348	48.546
2.359	57.452
2.359	52.628
2.371	51.329
2.379	83.425
2.382	61.533
2.394	59.677
2.418	53.554
2.419	48.174
2.440	61.531
2.453	56.151
2.464	57.635
2.486	68.209
2.489	45.018
2.499	59.118
2.500	50.769
2.510	66.910
2.510	65.240
2.511	59.118
2.523	57.819
2.546	58.004
2.569	62.456
2.569	60.230
2.580	69.320
2.582	53.550
2.582	52.808
2.583	48.170
2.583	47.057
2.594	50.025
2.618	45.757
2.627	65.980
2.640	57.816
2.650	68.206
2.651	63.753
2.651	61.526
2.663	58.929
2.686	61.526
2.698	58.557
2.699	50.765
2.710	55.959
2.722	60.968
2.722	55.217
2.734	58.556
2.744	66.534
2.746	56.144
2.756	63.750
2.770	49.650
2.803	65.419
2.803	61.894
2.805	51.690
2.816	58.925
2.828	53.174
2.861	68.386
2.874	61.521
2.876	45.009
2.876	42.412
2.884	70.797
2.898	51.688
2.932	65.416
2.933	57.253
2.945	55.768
2.956	60.035
2.956	59.108
2.957	52.057
2.967	61.519
2.978	67.827
2.980	58.736
2.990	69.682
3.002	63.188
3.026	61.332
3.027	55.766
3.049	64.300
3.050	57.621
3.074	54.281
3.074	49.457
3.086	50.385
3.095	69.123
3.097	57.806
3.108	60.403
3.120	60.588
3.132	55.764
3.143	66.710
3.154	65.040
3.178	63.184
3.190	61.328
3.202	62.441
3.215	48.341
3.215	46.114
3.225	58.916
3.272	65.965
3.272	59.842
3.273	56.503
3.296	58.172
3.307	62.995
3.307	60.398
3.308	50.379
3.341	71.900
3.366	60.397
3.389	60.767
3.390	54.088
3.400	66.704
3.400	65.405
3.402	51.490
3.425	59.282
3.448	63.178
3.450	40.358
3.471	59.838
3.472	51.118
3.482	66.702
3.483	56.127
3.507	57.425
3.518	61.877
3.542	58.908
3.542	54.456
3.576	64.845
3.577	60.763
3.601	57.052
3.602	44.436
3.623	67.255
3.623	64.843
3.623	64.101
3.624	59.278
3.660	49.629
3.670	63.173
3.683	53.896
3.704	71.150
3.705	68.367
3.729	63.913
3.729	56.678
3.752	59.646
3.764	64.840
3.764	61.501
3.765	52.781
3.776	55.934
3.811	59.830
3.823	57.047
3.823	55.562
3.869	67.064
3.869	63.910
3.869	62.426
3.869	61.498
3.880	70.032
3.893	63.167
3.904	63.538
3.917	54.818
3.939	63.908
3.987	57.599
4.011	54.259
4.045	62.793
4.057	56.856
4.082	50.362
4.116	54.999
4.127	65.759
4.138	64.831
4.174	65.202
4.197	60.934
4.290	66.683
4.315	54.809
4.327	57.220
4.397	60.744
4.432	56.105
4.513	62.967
4.537	63.709
4.561	59.441
4.653	68.345
4.665	67.417
4.701	57.768
4.747	67.786
4.747	66.116
4.806	64.445
4.853	64.444
4.854	54.425
4.879	45.519
5.075	68.891
5.203	71.857
5.204	68.703
5.321	68.886
5.450	66.471
5.558	46.988
5.616	50.140
5.649	68.507
5.649	64.796
5.673	66.651
5.696	68.320
5.743	69.247
5.848	69.616
5.886	43.826
6.071	67.941
6.341	57.174
6.375	67.377
6.867	65.881
7.290	57.337
8.239	53.234
8.276	41.544
8.451	42.839
8.557	41.352];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EvesMilli2015';
comment.tL = 'Otolith and capture-recapture measurements combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'birth is assumed to occur at hatch';
D2 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Measured from photo: FL = 0.933 * TL';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.01096 * (TL in cm)^3.11';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R3XY'; % Cat of Life
metaData.links.id_ITIS = '172401'; % ITIS
metaData.links.id_EoL = '46577294'; % Ency of Life
metaData.links.id_Wiki = 'Katsuwonus_pelamis'; % Wikipedia
metaData.links.id_ADW = 'Katsuwonus_pelamis'; % ADW
metaData.links.id_Taxo = '46680'; % Taxonomicon
metaData.links.id_WoRMS = '127018'; % WoRMS
metaData.links.id_fishbase = 'Katsuwonus-pelamis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Katsuwonus_pelamis}}';
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
bibkey = 'EvesMilli2015'; type = 'Article'; bib = [ ... 
'author = {J. P. Eveson and J. Million and F. Sardenne and G. Le Croizier}, ' ... 
'year = {2015}, ' ...
'title = {Estimating growth of tropical tunas in the {I}ndian {O}cean usingtag-recapture data and otolith-based age estimates}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {163}, ' ...
'pages = {58-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Katsuwonus-pelamis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


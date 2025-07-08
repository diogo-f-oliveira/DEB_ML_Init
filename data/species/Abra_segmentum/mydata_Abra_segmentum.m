function [data, auxData, metaData, txtData, weights] = mydata_Abra_segmentum

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Semelidae';
metaData.species    = 'Abra_segmentum'; 
metaData.species_en = 'Bivalve'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'R_i'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 01]; 


%% set data
% zero-variate data

data.am = 20*30.5; units.am = 'd';    label.am = 'life span';                     bibkey.am = 'KevrKasa2009';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'guess';
data.Li  = 1.9; units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'KevrKasa2009';
  comment.Li = 'based on tL data';

data.Wwb = 4e-6;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';

data.Ri = 2.5e4/365; units.Ri  = '#/d';   label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.93';
 
% uni-variate data
% t-L data
data.tL = [ ... % time (d), shell length (cm)
92.080	0.127
121.292	0.154
151.859	0.244
181.997	0.365
212.096	0.396
243.151	0.589
274.172	0.705
305.103	0.616
335.190	0.621
365+0.887	1.005
365+31.505	1.211
365+62.426	1.100
365+92.967	1.131
365+123.103	1.248
365+152.732	1.217
365+212.985	1.405
365+242.681	1.526];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KevrKasa2009';
comment.tL = 'data from length-frequencies; temp: 4.2 to 28.5 C';
  
% length-weight
data.LW = [ ... % shell length (cm), dry weight (mg)
0.218	0.286
0.269	0.425
0.281	0.425
0.295	0.426
0.300	0.427
0.311	0.292
0.328	0.429
0.341	0.429
0.351	0.566
0.362	0.566
0.372	0.567
0.393	0.839
0.407	1.517
0.413	1.112
0.418	0.570
0.432	1.113
0.434	0.571
0.434	0.571
0.458	1.115
0.460	0.573
0.474	1.251
0.495	0.711
0.499	1.930
0.516	1.389
0.527	0.577
0.532	3.422
0.537	2.474
0.541	0.714
0.548	1.527
0.557	0.986
0.569	1.664
0.569	2.070
0.581	2.206
0.581	1.529
0.583	0.310
0.595	1.936
0.597	0.853
0.611	1.667
0.611	3.292
0.618	3.834
0.620	1.667
0.625	2.751
0.632	5.596
0.634	3.023
0.636	4.377
0.639	1.669
0.650	2.482
0.653	1.669
0.655	3.837
0.671	2.754
0.681	1.400
0.692	8.715
0.692	3.839
0.702	2.892
0.702	1.673
0.706	3.976
0.711	5.737
0.715	4.383
0.722	2.622
0.729	5.738
0.734	1.810
0.741	2.894
0.741	4.384
0.753	2.895
0.760	5.063
0.769	2.625
0.769	3.574
0.769	4.386
0.785	4.929
0.792	3.033
0.794	4.252
0.801	4.253
0.806	6.014
0.808	3.576
0.815	5.744
0.822	4.661
0.825	2.765
0.827	3.984
0.829	2.630
0.843	4.527
0.855	3.715
0.857	5.205
0.859	2.902
0.864	7.508
0.876	5.477
0.876	6.967
0.880	4.800
0.880	3.175
0.880	2.633
0.899	3.853
0.899	6.020
0.906	6.969
0.918	3.448
0.920	5.480
0.922	7.918
0.927	3.855
0.931	7.106
0.943	5.752
0.950	8.597
0.952	5.618
0.955	4.263
0.962	4.941
0.962	7.921
0.962	5.347
0.964	6.973
0.971	5.077
0.985	6.839
0.987	6.026
0.994	13.747
0.997	2.776
1.006	8.601
1.008	7.924
1.015	6.570
1.017	12.259
1.020	6.570
1.020	4.403
1.022	9.008
1.029	7.654
1.036	9.822
1.041	5.894
1.043	8.739
1.045	10.364
1.045	7.791
1.048	6.572
1.048	6.030
1.050	11.042
1.052	6.031
1.062	12.532
1.066	6.709
1.071	8.470
1.080	7.116
1.080	10.367
1.082	7.523
1.087	8.471
1.092	9.826
1.096	10.368
1.103	6.305
1.106	7.253
1.110	13.619
1.110	8.472
1.117	12.130
1.127	11.453
1.129	7.661
1.134	6.578
1.134	8.745
1.134	4.953
1.136	10.777
1.138	12.538
1.141	9.964
1.145	4.953
1.148	7.933
1.150	8.204
1.154	10.507
1.154	11.184
1.161	7.122
1.164	9.695
1.173	13.759
1.175	11.727
1.182	10.915
1.182	7.936
1.189	10.103
1.192	14.844
1.196	9.020
1.201	16.740
1.203	11.594
1.208	9.292
1.210	7.667
1.213	12.001
1.215	8.209
1.217	10.647
1.217	7.261
1.217	9.563
1.220	8.751
1.222	19.044
1.222	12.408
1.231	13.221
1.233	9.564
1.238	12.409
1.238	11.054
1.240	6.043
1.243	15.795
1.243	9.836
1.245	18.098
1.245	14.576
1.247	29.881
1.247	15.254
1.247	17.150
1.252	13.087
1.259	10.785
1.264	9.837
1.264	11.869
1.264	11.869
1.271	13.224
1.275	18.371
1.275	13.630
1.282	16.340
1.285	10.245
1.285	12.683
1.287	11.870
1.289	7.672
1.292	15.934
1.292	15.392
1.294	17.966
1.294	16.340
1.294	11.735
1.296	25.009
1.301	13.903
1.303	14.987
1.305	23.655
1.308	17.967
1.315	12.956
1.324	12.821
1.326	17.832
1.329	17.020
1.331	11.467
1.333	13.093
1.343	14.448
1.343	16.479
1.343	10.249
1.345	28.669
1.347	19.053
1.350	26.096
1.350	19.730
1.350	12.146
1.350	8.353
1.352	13.365
1.354	22.304
1.354	17.022
1.354	13.365
1.359	15.532
1.361	20.679
1.361	17.970
1.373	26.097
1.373	21.763
1.373	14.585
1.375	23.389
1.375	17.565
1.375	13.095
1.377	19.461
1.377	18.378
1.380	10.793
1.380	15.940
1.384	12.012
1.389	20.004
1.396	24.203
1.396	20.681
1.396	13.232
1.398	14.451
1.401	15.264
1.403	17.431
1.405	21.088
1.405	19.734
1.405	16.890
1.412	18.109
1.412	14.452
1.412	10.118
1.415	22.714
1.415	16.213
1.419	25.965
1.419	12.557
1.422	11.338
1.424	13.640
1.426	21.767
1.429	14.318
1.431	30.571
1.431	27.998
1.431	24.476
1.431	16.891
1.433	19.194
1.433	12.964
1.433	15.808
1.436	9.443
1.436	10.662
1.440	23.122
1.440	18.111
1.445	12.558
1.445	14.996
1.445	15.267
1.445	8.360
1.447	22.852
1.447	16.893
1.452	30.843
1.452	28.541
1.452	26.915
1.452	25.832
1.452	14.455
1.454	22.311
1.456	20.144
1.459	19.602
1.461	10.257
1.468	12.560
1.468	17.571
1.468	16.894
1.470	13.508
1.473	25.156
1.473	18.520
1.475	28.678
1.475	12.831
1.477	32.606
1.477	20.822
1.477	22.854
1.477	19.468
1.480	14.051
1.480	15.811
1.482	11.884
1.484	9.310
1.491	30.981
1.491	15.947
1.494	27.731
1.494	24.210
1.494	23.532
1.494	8.228
1.496	18.115
1.498	12.697
1.498	21.772
1.501	22.178
1.503	19.470
1.503	20.553
1.505	30.576
1.505	15.271
1.508	17.438
1.517	25.836
1.517	22.721
1.517	14.053
1.524	18.523
1.526	16.356
1.526	17.440
1.531	38.298
1.533	30.442
1.535	20.149
1.535	15.273
1.538	33.964
1.538	28.682
1.538	29.766
1.538	16.222
1.540	25.702
1.540	14.055
1.542	27.192
1.545	23.400
1.545	24.484
1.545	17.170
1.547	18.389
1.549	20.692
1.554	32.611
1.554	19.473
1.556	25.433
1.556	21.911
1.563	17.036
1.568	18.255
1.568	14.192
1.570	21.100
1.570	20.151
1.570	12.702
1.573	46.969
1.573	30.987
1.573	22.996
1.573	26.653
1.575	15.682
1.582	30.310
1.582	22.048
1.582	24.080
1.589	36.947
1.593	19.070
1.603	31.666
1.605	13.653
1.605	12.569
1.607	22.050
1.607	16.497
1.610	28.687
1.610	25.572
1.610	18.800
1.621	15.144
1.624	14.331
1.631	36.950
1.633	17.989
1.633	19.614
1.633	31.262
1.635	15.957
1.638	34.106
1.638	28.282
1.640	21.240
1.642	16.364
1.645	19.073
1.647	22.324
1.649	39.660
1.656	18.532
1.656	34.649
1.675	15.012
1.693	20.837
1.693	16.232
1.703	16.639
1.719	22.735
1.738	25.851
1.756	42.105
1.756	41.970
1.977	13.678];
data.LW(:,2) = data.LW(:,2)/1e3; % convert mg to g
units.LW   = {'cm','g'};  label.LW = {'shell length', 'dry weight'};  
bibkey.LW = 'KevrKasa2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: log total weight (mg) = 2.667 * log length (mm) - 0.358; log shell weight (mg) = 2.719 log length (mm) - 0.627';
metaData.bibkey.F1 = 'AnseFren1980'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8LGV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46474777'; % Ency of Life
metaData.links.id_Wiki = 'Abra_(bivalve)'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3938958'; % Taxonomicon
metaData.links.id_WoRMS = '141438'; % WoRMS
metaData.links.id_molluscabase = '141438'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Abra_(bivalve)}}';
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
bibkey = 'KevrKasa2009'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10152-009-0155-x}, ' ...
'author = {Theodoros Kevrekidis and K. Kasapis  and V. Kalpia}, ' ... 
'year = {2009}, ' ...
'title = {Life cycle, population dynamics, growth and production of \emph{Abra segmentum} ({M}ollusca, {B}ivalvia) at low salinities in a {M}editerranean lagoon}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {63}, ' ...
'pages = {277-285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnseFren1980'; type = 'Article'; bib = [ ... 
'author = {A. D. Ansell and L. Frenkiel and M. Moueza}, ' ... 
'year = {1980}, ' ...
'title = {SEASONAL CHANGES IN TISSUE WEIGHT AND BIOCHEMICAL COMPOSITION FOR THE BIVALVE \emph{Donax trunculus} {L}. ON THE {A}LGERIAN COAST}, ' ...
'journal = {J. exp. mar. Biol. Ecol.}, ' ...
'volume = {45}, ' ...
'pages = {105-116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Abra-segmentum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



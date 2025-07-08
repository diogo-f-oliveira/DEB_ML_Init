function [data, auxData, metaData, txtData, weights] = mydata_Okamejei_kenojei

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Okamejei_kenojei'; 
metaData.species_en = 'Ocellate spot skate '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 30];

%% set data
% zero-variate data;
data.am = 13.3*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'JouLee2011';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 5.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on same relative length compared to Leucoraja erinacea: 9.7/57*32.4';
data.Lp  = 39;  units.Lp  = 'cm';  label.Lp  = 'disk width at pubert';   bibkey.Lp  = 'fishbase';
data.Li  = 57;  units.Li  = 'cm';  label.Li  = 'ultimate disk width for females';   bibkey.Li  = 'fishbase';

data.Ri  = 150/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.495	10.369
0.507	6.676
0.507	7.415
0.507	8.048
0.513	8.998
0.513	9.420
0.513	9.420
1.496	15.171
1.496	18.760
1.496	19.815
1.502	16.649
1.502	17.599
1.509	13.483
1.509	18.233
1.509	20.343
1.515	16.122
1.521	14.328
1.533	19.289
2.479	23.878
2.485	26.833
2.491	28.311
2.498	21.662
2.498	24.090
2.498	25.462
2.504	25.990
2.510	27.679
2.516	22.824
2.522	24.935
3.493	30.263
3.493	33.535
3.505	33.008
3.512	30.898
3.512	31.425
3.518	31.848
3.518	32.692];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(22); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YounChoi2023';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.494	9.624
0.507	7.890
0.507	7.659
0.507	6.965
0.507	6.040
0.513	9.971
0.513	8.122
1.495	14.190
1.501	19.277
1.501	18.815
1.501	16.618
1.501	16.156
1.501	14.653
1.507	20.318
1.507	17.890
1.513	15.694
1.519	18.469
2.482	29.854
2.495	25.462
2.495	25.230
2.495	24.999
2.495	24.884
2.495	24.190
2.495	23.265
2.496	21.416
2.501	28.930
2.501	28.583
2.501	27.543
2.501	26.040
2.513	26.734
3.471	32.801
3.477	33.380
3.477	32.455
3.489	31.531];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(22); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YounChoi2023';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % disc width (cm), weight (g)
12.053	32.980
16.009	116.683
17.557	137.652
17.729	95.966
20.310	156.397
20.447	174.941
20.791	172.651
21.032	200.468
21.583	202.827
21.651	216.732
21.892	188.952
22.030	242.244
22.133	221.403
22.202	251.524
22.236	235.310
22.271	230.680
22.477	202.897
22.615	256.189
22.856	256.208
22.890	267.793
22.924	226.097
23.200	249.284
23.406	249.300
23.509	270.158
23.647	302.601
23.991	286.411
23.991	300.311
24.232	339.712
24.335	288.754
24.438	281.812
24.472	328.147
24.644	304.994
24.644	346.693
24.748	279.520
24.851	314.277
25.126	344.414
25.161	372.216
25.367	309.683
25.367	400.031
25.436	427.835
25.505	369.926
25.539	346.762
25.642	455.651
25.677	400.055
25.986	446.411
26.021	388.498
26.261	414.000
26.261	439.482
26.433	400.113
26.468	453.398
26.502	383.902
26.606	358.428
26.606	358.428
26.674	446.464
26.709	411.718
26.709	476.582
26.846	328.330
26.915	432.583
27.053	467.343
27.053	383.945
27.122	437.232
27.156	529.899
27.156	495.150
27.190	481.253
27.328	414.082
27.362	548.448
27.397	504.435
27.431	453.472
27.466	427.992
27.534	522.978
27.534	488.229
27.706	474.343
27.810	534.582
27.844	451.187
27.878	497.522
27.913	518.374
27.913	620.305
27.913	562.390
27.982	441.932
28.119	490.591
28.222	479.016
28.222	601.796
28.257	573.999
28.257	539.250
28.291	520.720
28.360	523.042
28.394	555.477
28.429	430.383
28.463	594.865
28.498	634.250
28.567	381.745
28.601	585.609
28.739	648.168
28.807	601.841
28.842	543.929
28.876	326.171
28.979	571.738
29.117	576.382
29.186	680.635
29.186	659.785
29.186	590.287
29.220	618.089
29.220	557.857
29.220	650.521
29.255	641.258
29.323	421.186
29.427	581.039
29.461	625.058
29.564	671.397
29.633	676.036
29.667	766.386
29.667	650.556
29.667	537.043
29.736	611.179
29.771	650.564
29.839	597.287
29.874	692.271
29.874	544.008
29.977	731.661
30.046	462.941
30.046	414.292
30.080	692.287
30.115	794.220
30.149	664.493
30.149	655.226
30.149	713.141
30.183	764.109
30.183	632.063
30.183	604.264
30.183	673.762
30.356	734.007
30.390	671.461
30.424	706.213
30.528	752.553
30.528	738.653
30.528	604.290
30.631	645.997
30.734	724.770
30.768	759.521
30.768	592.726
30.837	683.079
30.906	747.949
30.975	778.070
30.975	738.688
30.975	727.105
31.112	768.814
31.147	717.852
31.147	513.991
31.216	685.425
31.250	754.925
31.319	690.066
31.353	868.447
31.353	815.165
31.388	710.921
31.491	796.643
31.491	690.079
31.491	632.164
31.594	727.153
31.594	736.419
31.628	944.916
31.628	854.568
31.697	847.624
31.869	933.352
31.938	768.878
31.938	655.365
31.972	870.811
32.007	847.648
32.007	743.401
32.041	782.786
32.144	961.172
32.213	919.479
32.213	801.332
32.351	907.906
32.489	863.901
32.626	931.093
32.695	907.933
32.798	843.076
32.901	1014.512
32.936	905.635
33.005	741.161
33.039	882.477
33.177	996.001
33.245	1026.122
33.245	870.910
33.417	1060.884
33.452	963.590
33.486	933.476
33.624	1026.151
33.624	803.757
33.658	850.092
34.037	866.337
34.278	1095.700
34.346	1118.871
34.966	880.309
35.172	1176.850
35.241	1107.357];
units.LW_f = {'d', 'cm'};  label.LW_f = {'disc width', 'weight', 'female'};  
bibkey.LW_f = 'YounChoi2023';
%
data.LW_m = [ ... % disc width (cm), weight (g)
10.505	14.327
12.087	14.449
13.188	42.334
19.243	112.299
20.138	181.866
21.067	181.938
21.583	228.310
21.961	242.239
22.133	237.619
23.372	246.981
23.578	318.812
23.612	263.216
23.647	314.184
23.888	263.237
23.956	216.910
23.991	267.878
24.060	284.100
24.232	362.878
24.232	330.445
24.300	300.335
24.472	284.132
24.507	314.250
24.541	335.102
24.576	344.371
24.748	295.736
24.885	395.360
24.920	372.197
25.092	311.979
25.092	351.361
25.195	397.701
25.333	323.580
25.367	342.116
25.505	372.242
25.539	406.994
25.608	388.466
25.677	358.356
25.711	409.324
25.711	328.243
25.780	390.796
25.883	483.468
25.952	356.061
25.986	439.461
26.055	437.150
26.089	413.986
26.089	386.187
26.158	439.474
26.227	369.981
26.365	425.591
26.399	379.261
26.399	411.694
26.433	471.928
26.502	319.038
26.537	434.870
26.537	467.303
26.606	427.926
26.709	404.768
26.778	455.738
26.812	495.123
26.812	400.143
26.915	488.181
26.984	467.337
26.984	288.959
26.984	421.005
27.018	437.224
27.122	448.815
27.122	414.066
27.190	511.369
27.259	476.625
27.328	518.329
27.362	502.115
27.431	483.588
27.466	437.259
27.500	455.794
27.534	597.109
27.672	416.425
27.741	534.577
27.775	483.615
27.775	423.383
27.844	446.554
27.844	455.821
27.844	513.736
27.913	478.992
27.947	509.110
27.982	543.862
28.016	492.900
28.016	520.699
28.188	543.878
28.257	590.215
28.257	474.385
28.326	536.939
28.360	497.559
28.394	569.377
28.532	504.522
28.567	634.255
28.670	578.664
28.704	601.833
28.704	569.401
28.807	527.710
28.876	622.696
28.979	590.271
29.014	659.772
29.048	557.844
29.048	685.257
29.048	715.373
29.117	620.398
29.117	641.247
29.151	604.184
29.186	585.654
29.289	583.345
29.358	671.382
29.392	659.801
29.427	645.904
29.427	622.738
29.427	576.406
29.461	599.575
29.599	323.910
29.599	652.867
29.667	627.390
29.667	671.405
29.736	720.059
29.736	613.496
29.874	782.618
29.908	557.911
29.977	676.063
30.011	597.301
30.080	641.322
30.080	696.920
30.115	650.591
30.115	754.838
30.149	729.358
30.149	564.879
30.287	778.017
30.321	618.174
30.356	701.574
30.390	659.878
30.493	736.334
30.528	676.105
30.562	636.726
30.596	708.543
30.631	752.561
30.734	773.418
30.768	629.792
30.803	729.408
30.803	685.393
30.872	734.047
30.906	757.215
30.906	794.281
31.078	680.781
31.147	787.350
31.147	583.489
31.181	650.673
31.181	849.901
31.216	805.888
31.216	734.073
31.319	750.298
31.353	706.285
31.388	829.067
31.456	729.459
31.525	785.062
31.628	859.202
31.697	805.925
31.697	671.562
31.732	736.430
31.904	889.339
31.972	757.298
32.041	877.766
32.179	717.931
32.248	877.782
32.248	805.968
32.454	870.848
32.454	856.949
32.557	736.494
32.729	836.121
32.764	845.390
32.833	859.295
33.383	933.468
33.486	657.801
34.450	986.833
34.484	908.071
34.553	792.246
34.587	928.928];
units.LW_m = {'d', 'cm'};  label.LW_m = {'disc width', 'weight', 'male'};  
bibkey.LW_m = 'YounChoi2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} anf E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00288*(TL in cm), b=3.23';
metaData.bibkey.F1 = 'JouLee2011'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74JB4'; % Cat of Life
metaData.links.id_ITIS = '564191'; % ITIS
metaData.links.id_EoL = '46560613'; % Ency of Life
metaData.links.id_Wiki = 'Okamejei_kenojei'; % Wikipedia
metaData.links.id_ADW = 'Okamejei_kenojei'; % ADW
metaData.links.id_Taxo = '181706'; % Taxonomicon
metaData.links.id_WoRMS = '279178'; % WoRMS
metaData.links.id_fishbase = 'Okamejei-kenojei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Okamejei_kenojei}}'; 
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
bibkey = 'YounChoi2023'; type = 'Article'; bib = [ ... 
'doi = {10.3390/fishes8040197}, ' ...
'author = {Byoung-Il Youn and Dong-Hyuk Choi and Tae-Hyoung Roh and Seung-Hwan Lee and Kyeong-Ho Han and Dae-Hyeon Kwon and Maeng-Jin Kim}, ' ...
'year = {2023}, ' ...
'title  = {Age and Growth Characteristics of \emph{Okamejei kenojei} in the {W}est {S}ea of {S}outh {K}orea According to Coronal Vertebral Microstructure}, ' ...
'journal = {Fishes}, ' ...
'volume = {8}, ' ...
'pages = {197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Okamejei-kenojei.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


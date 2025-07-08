function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_barracuda
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_barracuda'; 
metaData.species_en = 'Great barracuda'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 16]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.tp = 2.4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'KadiAles2010';   
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 2*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'KadiAles2010';   
  temp.tpm = C2K(27);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KadiAles2010';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 84.7; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty of females'; bibkey.Lp  = 'KadiAles2010'; 
data.Lpm  = 71.6; units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty of males'; bibkey.Lpm  = 'KadiAles2010'; 
data.Li  = 200;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'sms';
  comment.Wwb = 'based egg diameter of 0.78 mm: 4/3*pi*0.039^3'; 
data.Wwp = 4314; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'KadiAles2010';
  comment.Wwp = 'based on W = 0.0071*Lp^3, read from LW data';
data.Wwpm = 2606; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty'; bibkey.Wwpm = 'KadiAles2010';
  comment.Wwpm = 'based on W = 0.0071*Lpm^3, read from LW data';
data.Wwi = 56800; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.0071*Li^3, read from LW data';

data.GSI  = 0.017; units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'KadiAles2010';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.536	31.672
0.689	47.738
0.714	39.016
0.714	40.393
0.714	44.984
0.740	34.885
0.740	37.180
0.816	42.230
0.893	47.279
1.020	44.066
1.046	49.115
1.122	47.738
1.301	42.230
1.403	52.328
1.403	65.180
1.556	70.230
1.582	61.967
1.607	65.639
1.658	60.131
1.684	67.475
1.709	42.230
1.709	44.066
1.709	45.902
1.735	50.951
1.760	47.738
1.760	49.574
1.760	54.164
1.760	66.557
1.760	70.689
1.786	56.918
1.811	58.754
1.811	60.131
1.837	63.803
1.862	71.607
1.888	55.082
1.888	62.885
1.913	48.197
1.913	50.951
1.913	51.869
1.913	67.934
1.913	73.443
1.939	45.902
1.939	56.918
1.964	56.459
2.015	78.951
2.015	85.836
2.015	45.443
2.015	60.131
2.066	75.738
2.066	67.934
2.066	51.410
2.092	70.689
2.117	60.131
2.117	64.262
2.143	65.639
2.168	56.459
2.194	54.623
2.219	80.328
2.219	72.525
2.219	71.607
2.219	66.098
2.270	82.164
2.270	67.934
2.296	74.820
2.296	56.918
2.321	61.508
2.321	65.639
2.372	63.803
2.423	71.607
2.423	73.443
2.551	82.623
2.577	93.639
2.628	72.525
2.628	78.951
2.628	76.197
2.628	84.918
2.653	39.934
2.679	67.475
2.704	51.410
2.704	93.639
2.730	70.689
2.730	66.098
2.730	79.410
2.755	46.820
2.755	80.787
2.806	68.393
2.832	72.984
2.832	69.770
2.832	82.623
2.857	78.951
2.908	44.066
2.908	75.738
2.934	77.115
2.985	95.475
3.010	79.869
3.036	77.115
3.036	91.803
3.036	99.148
3.112	78.951
3.138	68.393
3.189	77.115
3.189	98.689
3.240	88.131
3.240	81.246
3.240	83.082
3.316	83.541
3.342	70.230
3.342	82.623
3.444	75.279
3.444	98.230
3.444	82.623
3.495	85.377
3.520	80.787
3.546	92.262
3.622	92.262
3.699	89.967
3.724	94.098
3.750	82.623
3.750	84.459
3.750	98.689
3.852	86.295
3.878	89.967
3.929	88.131
4.005	98.230
4.005	91.803
4.005	93.639
4.133	95.475
4.158	68.393
4.158	95.475
4.260	90.885
4.260	90.885
4.413	83.082
4.439	86.754
4.617	98.689
4.694	100.066
4.719	93.639
4.872	100.066
4.898	104.656
5.128	106.951
5.179	105.574
5.255	107.869
5.306	83.541
5.510	97.311
5.587	97.311
5.740	100.066
5.765	98.689
5.791	95.016
5.918	91.803
5.969	112.918
6.122	106.492
6.224	104.197
6.250	86.295
6.403	100.525
6.633	101.443
6.760	94.098
6.786	103.738
6.913	123.016
7.219	106.951
7.500	102.820
7.704	125.311
8.342	113.377
9.031	110.623
9.413	101.443
9.439	121.180
9.439	129.443
9.847	123.934
10.357	114.295
10.383	116.131
10.408	118.885
10.408	121.180
12.372	134.951
13.367	118.426
14.490	128.525
18.418	123.475];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KadiAles2010';
comment.tL_f = 'data for females';
% t-L data for males
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.631	43.313
0.682	43.313
0.682	52.500
0.732	37.625
0.758	35.438
1.010	70.000
1.212	73.500
1.263	53.813
1.288	56.438
1.389	69.563
1.591	42.875
1.616	64.750
1.641	66.938
1.641	45.500
1.692	49.000
1.717	47.250
1.717	51.625
1.768	53.813
1.768	63.438
1.818	52.063
1.843	47.250
1.843	29.750
1.869	56.000
1.995	63.000
1.995	67.375
2.045	64.313
2.045	80.500
2.172	67.813
2.222	73.500
2.273	64.750
2.399	77.000
2.500	66.938
2.500	68.250
2.551	76.125
2.551	74.813
2.601	79.625
2.652	73.938
2.753	70.438
2.778	46.375
2.803	75.250
2.879	80.500
2.955	71.750
3.005	94.938
3.030	83.563
3.030	85.750
3.131	78.750
3.182	83.563
3.207	90.563
3.283	70.438
3.283	76.563
3.283	84.875
3.359	78.313
3.384	88.813
3.409	87.500
3.409	85.750
3.434	80.938
3.434	82.250
3.460	89.250
3.510	78.313
3.510	85.750
3.510	85.750
3.586	83.125
3.687	91.000
3.763	81.813
3.889	94.063
4.015	88.813
4.040	90.563
4.116	94.938
4.318	88.375
4.318	90.125
4.343	91.000
4.419	93.625
4.470	85.750
4.495	94.500
4.545	86.188
4.571	94.063
4.798	99.750
4.924	100.188
5.126	96.250
5.126	94.938
5.152	98.000
5.227	91.000
5.379	95.813
5.404	84.000
5.404	98.000
5.480	94.938
5.505	102.813
5.530	89.250
5.530	99.750
5.808	107.625
5.985	115.938
6.035	106.750
6.212	105.000
6.237	96.688
6.439	98.875
6.490	93.188
6.869	95.813
6.894	91.875
7.020	116.375
7.121	99.750
7.449	108.500
7.551	112.000
7.576	106.750
8.056	117.688
8.409	115.938
8.409	112.000
8.485	108.063
9.015	103.688
9.470	105.438
9.470	110.688
11.288	93.625];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KadiAles2010';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % fork lenth (mm), wet weight (g)
280.906	129.555
351.510	226.721
357.651	226.721
366.861	226.721
377.601	291.498
379.111	550.607
380.640	615.385
386.786	550.607
386.808	323.887
405.229	323.887
412.898	388.664
423.641	421.053
423.672	97.166
425.157	615.385
437.435	647.773
437.444	550.607
439.001	323.887
454.324	615.385
461.996	647.773
462.021	388.664
465.054	777.328
465.069	615.385
478.876	712.551
485.001	874.494
492.679	842.105
498.813	906.883
504.957	874.494
511.110	744.939
514.161	939.271
521.858	712.551
528.008	615.385
532.588	874.494
535.634	1133.603
544.844	1133.603
544.860	971.660
555.599	1036.437
561.724	1198.381
572.470	1198.381
584.725	1457.490
584.744	1263.158
590.872	1392.713
592.382	1651.822
593.930	1522.267
598.551	1360.324
604.666	1619.433
606.226	1360.324
610.831	1360.324
612.320	1846.154
616.956	1522.267
621.555	1587.045
633.851	1425.101
636.900	1651.822
636.915	1489.879
644.597	1425.101
649.143	2040.486
649.159	1878.543
653.758	1943.320
655.302	1846.154
655.327	1587.045
662.953	2105.263
664.525	1716.599
666.042	1910.931
670.644	1943.320
672.135	2396.761
672.148	2267.206
673.742	1651.822
678.347	1651.822
681.361	2234.818
682.912	2072.874
682.928	1910.931
687.583	1392.713
695.193	2072.874
695.208	1910.931
696.706	2299.595
701.290	2526.316
701.299	2429.150
702.846	2299.595
704.369	2429.150
705.941	2040.486
708.962	2558.704
709.043	1716.599
713.586	2364.372
713.608	2137.652
722.790	2429.150
722.796	2364.372
722.809	2234.818
724.443	1198.381
728.896	2785.425
728.949	2234.818
728.968	2040.486
731.979	2655.870
731.998	2461.538
741.221	2331.984
741.255	1975.709
742.712	2785.425
744.281	2429.150
748.834	2979.757
748.862	2688.259
751.888	3141.700
755.046	2234.818
756.509	2979.757
762.615	3336.032
762.721	2234.818
764.219	2623.482
767.274	2785.425
768.781	3076.923
768.805	2817.814
773.349	3465.587
777.969	3303.644
777.994	3044.534
781.012	3595.142
782.627	2753.036
784.153	2850.202
785.657	3174.089
787.152	3595.142
787.211	2979.757
793.292	3595.142
793.308	3433.198
793.323	3271.255
796.412	3076.923
799.482	3076.923
801.002	3238.866
807.183	2817.814
817.801	4145.749
817.829	3854.251
817.857	3562.753
817.879	3336.032
817.919	2914.980
819.373	3757.085
819.389	3595.142
825.498	3919.028
831.732	2947.368
834.718	3821.862
837.766	4048.583
837.822	3465.587
837.872	2947.368
842.344	4340.081
845.451	3951.417
846.968	4145.749
847.011	3692.308
848.481	4372.470
851.501	4890.688
856.184	4080.972
857.676	4534.413
857.766	3595.142
860.765	4340.081
865.389	4145.749
870.034	3724.696
870.044	3627.530
870.068	3368.421
872.999	4825.911
876.112	4372.470
879.267	3497.976
882.234	4566.802
882.327	3595.142
883.794	4307.692
885.298	4631.579
885.304	4566.802
885.345	4145.749
885.348	4113.360
891.420	4825.911
894.543	4275.304
897.467	5797.571
897.523	5214.575
899.058	5214.575
900.680	4307.692
908.287	5020.243
908.343	4437.247
908.352	4340.081
909.878	4437.247
911.273	5894.737
912.917	4761.134
915.913	5538.462
917.551	4469.636
918.958	5797.571
919.008	5279.352
922.010	5991.903
922.187	4145.749
923.610	5311.741
925.195	4793.522
925.226	4469.636
928.113	6380.567
928.190	5570.850
929.701	5829.960
931.202	6186.235
931.273	5441.296
934.399	4858.300
935.798	6283.401
935.894	5279.352
936.034	3821.862
937.507	4469.636
938.933	5603.239
938.989	5020.243
941.985	5797.571
943.442	6607.287
946.515	6574.899
946.655	5117.409
948.081	6251.012
948.187	5149.798
948.203	4987.854
952.733	5765.182
952.764	5441.296
955.775	6056.680
965.085	5020.243
966.580	5441.296
969.489	7125.506
969.700	4923.077
971.213	5149.798
977.292	5797.571
977.323	5473.684
980.424	5149.798
980.442	4955.466
981.704	7805.668
982.046	4242.915
984.930	6186.235
984.939	6089.069
992.444	7870.445
994.286	4663.968
995.700	5927.126
997.161	6704.453
997.251	5765.182
997.297	5279.352
1000.144	7611.336
1000.159	7449.393
1004.836	6704.453
1004.895	6089.069
1004.911	5927.126
1017.095	6931.174
1024.702	7643.725
1024.724	7417.004
1024.882	5765.182
1038.605	6736.842
1038.639	6380.567
1040.152	6607.287
1044.692	7287.449
1046.277	6769.231
1055.367	8032.389
1056.970	7319.838
1059.888	8906.883
1062.927	9230.769
1063.082	7611.336
1064.568	8129.555
1069.089	9004.049
1072.203	8550.607
1072.221	8356.275
1093.691	8582.996
1099.788	9036.437
1099.825	8647.773
1102.877	8842.105
1110.546	8906.883
1112.124	8453.441
1127.466	8550.607
1128.858	10040.486
1145.784	9619.433
1154.861	11012.146
1155.001	9554.656
1159.112	14704.453
1165.738	9651.822
1173.385	9943.320
1185.510	11562.753
1191.613	11951.417
1191.654	11530.364
1191.887	9101.215
1209.842	13959.514
1219.714	7060.729
1229.984	12016.194
1233.639	5927.126
1240.500	14412.955
1248.592	10072.874
1266.544	14963.563
1283.523	13991.903
1347.701	17068.826];
data.LW(:,1) = data.LW(:,1)/10; % convert mm to cm
units.LW   = {'d', 'cm'};  label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'KadiAles2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Marine; brackish; reef-associated; depth range 1 - 100 m, usually 3 - 30 m. Subtropical, preferred 27 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2L3'; % Cat of Life
metaData.links.id_ITIS = '170429'; % ITIS
metaData.links.id_EoL = '46577239'; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_barracuda'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_barracuda'; % ADW
metaData.links.id_Taxo = '46311'; % Taxonomicon
metaData.links.id_WoRMS = '345843'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-barracuda'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_barracuda}}';
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
bibkey = 'KadiAles2010'; type = 'Article'; bib = [ ... 
'author = {E. Kadison and E. K. D''Alessandro and G. O. Davis and P. B. Hood}, ' ... 
'year = {2010}, ' ...
'title = {Age, growth, and reproductive patterns of the great barracuda, \emph{Sphyraena barracuda}, from the {F}lorida {K}eys}, ' ...
'journal = {BULLETIN OF MARINE SCIENCE}, ' ...
'volume = {86}, ' ...
'pages = {773-784}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/SpeciesSummary.php?ID=1235&genusname=Sphyraena&speciesname=barracuda&AT=Sphyraena+barracuda&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sms'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sms.si.edu/irlspec/Sphyrae_barrac.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


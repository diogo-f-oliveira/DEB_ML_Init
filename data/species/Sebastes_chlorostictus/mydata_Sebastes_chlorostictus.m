function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_chlorostictus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_chlorostictus'; 
metaData.species_en = 'Greenspotted rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 22];

%% set data
% zero-variate data

data.am = 33*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 161;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 1.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 760e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ...
  2 12.4
  9 28.0
 10 30.5
 11 33.5
 12 38.5
 13 36.9
 14 36.5
 15 38.5
 17 40.6
 18 38.3
 19 35.7
 20 39.2
 21 42.6];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(9.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... length (cm), weight (g)
13.700	37.538
13.833	63.783
14.371	53.320
14.572	74.321
14.640	55.959
15.647	56.018
15.714	56.022
15.849	42.911
15.983	58.661
16.587	63.944
16.721	90.188
16.788	87.568
17.392	87.604
17.594	71.873
17.595	58.755
17.661	95.490
18.332	103.401
18.803	90.310
19.271	124.445
19.473	113.962
20.145	116.625
20.881	184.884
21.018	129.794
21.084	142.917
21.486	166.553
21.689	129.833
21.956	174.452
22.023	187.574
22.224	198.080
22.762	187.617
22.964	156.144
23.029	232.235
23.029	226.988
23.031	174.514
23.700	234.898
23.701	198.167
23.769	195.547
24.440	213.952
24.706	269.065
24.773	266.445
25.043	232.353
25.242	305.828
25.377	292.717
25.513	245.499
25.580	248.126
25.714	271.747
25.914	308.490
26.050	261.272
26.384	305.894
26.518	313.773
26.585	316.401
26.653	290.168
26.654	269.178
27.256	332.182
27.323	342.681
27.389	368.921
27.458	329.570
27.660	298.098
28.129	334.857
28.130	300.749
28.261	403.080
28.398	337.496
28.665	376.867
29.001	371.639
29.067	403.127
29.134	397.884
29.264	518.581
29.268	413.634
29.332	489.724
29.332	484.477
29.334	434.627
29.401	455.620
29.467	463.495
29.804	439.902
30.071	487.144
30.139	468.782
30.207	437.301
30.210	371.709
30.272	508.145
30.272	500.274
30.273	474.037
30.275	408.445
30.347	295.630
30.742	510.796
30.808	534.413
30.880	413.728
31.078	500.321
31.215	424.242
31.216	411.123
31.345	550.186
31.345	529.197
31.415	468.856
31.617	445.255
31.680	571.195
31.819	442.643
31.879	623.681
31.881	581.702
31.888	382.302
31.950	539.727
31.951	505.619
32.083	550.229
32.086	487.261
32.217	565.979
32.287	500.391
32.416	634.207
32.554	539.762
32.684	652.588
32.753	592.247
32.756	539.774
32.887	615.868
32.892	476.813
32.949	749.680
32.957	550.280
33.025	508.305
33.091	545.041
33.357	623.767
33.494	550.312
33.555	697.242
33.557	647.392
33.558	631.650
33.621	731.354
33.690	686.755
33.892	678.896
34.030	581.827
34.294	692.038
34.363	665.805
34.497	676.307
34.499	623.833
34.499	608.091
34.561	757.645
34.561	757.645
34.627	789.133
34.632	647.454
34.699	639.587
34.764	713.054
34.831	718.306
34.838	516.282
34.966	686.829
34.968	647.474
35.032	723.565
35.033	686.833
35.297	815.409
35.367	755.069
35.369	684.229
35.370	665.863
35.435	734.083
35.438	639.630
35.567	791.812
35.581	411.378
35.632	839.042
36.035	852.184
36.179	597.695
36.233	928.283
36.236	860.067
36.301	899.426
36.309	702.650
36.310	684.284
36.316	513.745
36.374	757.751
36.376	718.396
36.438	833.842
36.504	873.201
36.506	818.104
36.512	655.435
36.578	686.923
36.704	904.697
36.711	726.286
36.973	912.583
37.037	970.308
37.106	946.699
37.173	936.208
37.179	786.658
37.236	1043.783
37.243	873.244
37.310	860.129
37.313	799.785
37.314	757.806
37.375	933.596
37.376	896.865
37.380	807.660
37.383	721.078
37.443	902.116
37.448	763.061
37.449	744.695
37.513	831.281
37.778	928.373
38.046	944.130
38.109	1038.587
38.182	910.030
38.182	896.912
38.244	1046.466
38.250	865.432
38.312	1001.867
38.381	967.763
38.381	967.763
38.386	833.955
38.451	894.304
38.519	857.576
38.716	978.277
38.850	996.651
38.855	862.843
38.982	1057.003
38.987	928.443
39.053	957.308
39.054	917.952
39.057	849.736
39.122	907.461
39.188	944.197
39.252	1012.417
39.319	1036.034
39.321	973.065
39.384	1075.393
39.387	1009.801
39.454	996.686
39.782	1206.600
39.856	1041.312
39.857	1004.581
39.915	1248.587
39.923	1043.940
40.050	1227.606
40.054	1114.787
40.058	1017.711
40.060	965.237
40.186	1177.763
40.250	1272.220
40.256	1101.681
40.320	1185.642
40.328	980.995
40.330	925.898
40.796	1033.496
40.849	1421.805
40.860	1133.200
40.862	1083.350
40.925	1175.183
40.925	1172.559
40.926	1154.193
40.929	1075.483
40.995	1099.100
41.002	931.184
41.056	1256.525
41.062	1114.846
41.133	1002.031
41.193	1193.564
41.527	1238.186
41.658	1324.776
41.795	1269.686
41.799	1146.373
41.800	1120.136
41.862	1256.572
41.863	1227.711
41.998	1214.601
42.196	1311.689
42.330	1314.320
42.595	1419.283
42.604	1180.528
42.798	1385.187
42.867	1340.588
43.663	1589.885
43.672	1356.377
43.732	1534.792
43.734	1492.813
43.811	1243.567
43.867	1519.057
44.342	1408.890
44.744	1429.903
45.338	1697.554];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
23.543	38840.611
23.771	58439.025
26.857	105413.324
27.543	44150.874
30.629	137301.120
30.857	121113.148
31.486	140665.386
32.400	102464.644
33.200	236282.801
33.200	150857.130
33.257	199335.373
34.800	264958.134
36.457	473713.449
38.686	756284.452
38.800	360311.645
39.657	423704.756];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(9.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79ZRS'; % Cat of Life
metaData.links.id_ITIS = '166748'; % ITIS
metaData.links.id_EoL = '46568127'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_chlorostictus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_chlorostictus'; % ADW
metaData.links.id_Taxo = '187260'; % Taxonomicon
metaData.links.id_WoRMS = '274781'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-chlorostictus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_chlorostictus}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-chlorostictus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

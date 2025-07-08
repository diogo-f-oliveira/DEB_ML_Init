function [data, auxData, metaData, txtData, weights] = mydata_Parupeneus_multifasciatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Parupeneus_multifasciatus'; 
metaData.species_en = 'Manybar goatfish';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MINE', 'MPSW'};
metaData.ecoCode.habitat = {'0pMp', 'piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Li = 'based on TL of 14 cm, using FL = 0.9 * TL, from foto';
data.Li  = 31.5;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';
  comment.Li = 'based on TL of 35 cm, using FL = 0.9 * TL, from foto';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 

data.Ri  = 26432/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [... % time (yr), fork length (cm)
0.495	12.613
0.522	6.272
0.527	14.007
0.559	5.436
0.586	5.087
0.591	5.854
0.634	5.854
0.640	9.477
0.656	4.808
0.667	5.714
0.683	5.017
0.683	9.547
0.699	5.714
0.699	5.436
0.710	5.226
0.720	8.223
0.720	8.432
0.720	9.477
0.720	14.286
0.726	13.798
0.737	12.892
0.737	13.380
0.769	5.993
0.774	8.711
0.774	8.990
0.801	13.519
0.806	5.087
0.812	6.481
0.812	8.850
0.849	5.296
0.871	5.854
0.876	6.760
0.903	11.010
0.909	14.843
0.914	6.969
0.935	13.728
0.941	11.777
0.941	15.331
0.946	16.585
1.032	14.146
1.129	14.913
1.134	9.268
1.145	12.892
1.145	14.216
1.215	13.728
1.237	14.077
1.242	11.986
1.301	12.962
1.301	13.589
1.317	13.449
1.323	12.056
1.328	13.728
1.371	14.913
1.462	13.798
1.462	13.589
1.473	13.171
1.473	12.613
1.484	13.310
1.505	17.352
1.527	15.401
1.532	12.962
1.543	15.679
1.548	12.962
1.559	12.892
1.559	13.659
1.581	12.544
1.613	14.564
1.618	13.171
1.624	13.868
1.667	13.031
1.667	13.937
1.672	15.819
1.677	13.589
1.699	14.146
1.704	15.679
1.720	14.286
1.753	15.261
1.753	11.707
1.763	14.286
1.839	15.192
1.855	12.892
1.882	12.334
1.887	14.704
1.914	12.892
1.925	14.007
1.930	16.794
1.962	12.125
2.032	16.516
2.070	15.122
2.102	15.540
2.113	14.007
2.145	13.449
2.172	15.401
2.247	14.007
2.392	13.868
2.527	14.425
2.565	14.355]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','female'};  
temp.tL_f    = C2K(27.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PavlHa2013';
comment.tL_f = 'data for females'; 
%
data.tL_m = [... % time (yr), fork length (cm)
0.520	6.503
0.530	7.972
0.558	5.664
0.579	5.105
0.584	6.084
0.622	6.154
0.632	9.720
0.655	5.105
0.671	5.804
0.697	5.944
0.703	5.455
0.703	5.105
0.718	9.161
0.726	18.112
0.756	7.622
0.761	10.140
0.783	6.084
0.796	18.671
0.805	6.643
0.805	5.175
0.813	16.364
0.826	8.741
0.842	9.650
0.853	5.524
0.869	6.923
0.880	6.084
0.895	11.119
0.906	8.741
0.911	9.510
0.932	14.406
0.952	17.692
0.991	11.958
1.012	13.706
1.084	9.161
1.099	12.937
1.169	11.608
1.191	10.979
1.200	16.643
1.253	17.972
1.276	14.406
1.292	12.378
1.298	11.538
1.303	12.517
1.329	15.175
1.373	13.497
1.443	11.469
1.481	12.098
1.534	15.035
1.577	12.378
1.592	17.203
1.593	14.406
1.608	16.503
1.662	15.734
1.706	15.105
1.716	16.503
1.727	14.056
1.802	16.154
1.828	20.000
1.952	19.161
2.023	14.615
2.049	18.531
2.065	19.650
2.205	17.902
2.333	21.049
2.657	15.664]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365;
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','male'};  
temp.tL_m    = C2K(27.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PavlHa2013';
comment.tL_m = 'data for males'; 

% length-weight
data.LW_f = [... % fork length (cm), weight (g)
4.210	1.061
4.759	1.107
4.988	1.127
5.263	2.554
5.446	3.272
5.583	3.284
5.721	1.891
5.858	3.307
6.224	2.635
6.544	4.067
6.590	2.666
6.819	4.090
6.910	6.204
7.506	5.552
8.146	7.011
8.283	9.129
8.558	11.259
8.604	11.263
8.786	13.385
9.061	13.408
9.747	16.977
9.793	15.577
10.296	21.237
10.433	22.653
10.982	24.104
11.075	17.089
11.165	25.524
11.166	22.012
11.440	26.951
11.485	29.062
11.531	27.661
11.713	32.592
11.714	29.783
11.897	28.394
11.942	35.420
12.034	33.321
12.170	36.142
12.263	32.639
12.491	35.467
12.491	33.360
12.765	37.597
12.766	34.085
12.810	42.516
12.901	46.035
12.949	36.208
13.038	46.749
13.039	41.131
13.040	39.024
13.314	41.154
13.451	44.677
13.496	47.490
13.541	55.218
13.541	52.409
13.725	48.913
13.726	43.998
13.772	44.002
13.816	52.432
14.000	47.532
14.044	58.070
14.137	49.650
14.227	55.276
14.274	49.662
14.319	55.284
14.457	51.784
14.547	60.921
14.547	58.112
14.639	58.120
14.641	48.991
14.822	60.944
14.869	51.117
15.003	71.493
15.052	52.537
15.140	70.100
15.142	63.780
15.142	60.971
15.413	79.955
15.414	75.039
15.462	65.212
15.552	72.242
15.645	65.227
15.734	78.577
15.735	74.364
15.736	68.044
15.779	80.688
15.918	76.486
15.919	70.166
16.056	72.284
16.100	81.417
16.100	80.012
16.282	87.050
16.374	85.654
16.375	80.036
16.466	82.150
16.646	100.424
16.740	87.089
16.785	89.902
16.830	95.523
16.830	92.714
16.878	80.780
16.920	103.256
16.968	89.917
17.013	97.646
17.242	96.260
17.331	111.015
17.423	106.107
17.836	100.524
19.430	148.411
20.935	181.544];
units.LW_f   = {'cm','g'};  label.LW_f = {'fork length','wet weight','female'};  
bibkey.LW_f = 'PavlHa2013';
comment.LW_f = 'data for females'; 
%
data.LW_m = [... % time (yr), fork length (cm)
4.258	1.094
4.762	1.138
4.991	2.611
5.311	2.639
5.449	2.651
5.678	4.852
6.044	1.250
6.548	3.474
6.914	4.959
6.914	6.413
7.692	5.754
7.784	7.216
7.967	7.232
8.333	8.717
8.471	11.636
8.700	10.202
8.929	10.222
9.066	13.141
9.249	11.704
9.478	13.177
9.478	15.357
9.661	13.920
9.707	18.284
9.936	16.124
10.073	16.136
10.485	19.806
10.760	22.737
10.897	21.295
11.081	21.311
11.081	16.224
11.126	30.763
11.264	26.414
11.355	22.062
11.538	29.345
11.538	26.438
11.584	51.152
11.676	19.183
11.905	29.377
11.996	27.932
12.134	30.851
12.225	33.766
12.225	35.946
12.317	30.867
12.500	33.063
12.500	37.423
12.683	36.713
12.866	33.095
12.958	37.463
12.958	40.370
13.507	39.691
13.507	42.598
13.553	46.963
13.553	48.416
13.690	44.795
13.828	49.894
13.828	42.626
14.011	49.183
14.148	49.195
14.148	44.835
14.286	52.841
14.377	49.215
14.560	53.591
14.744	57.241
14.881	54.346
15.064	62.356
15.110	60.180
15.201	66.002
15.705	67.499
15.705	69.680
15.751	73.317
15.980	68.977
15.980	78.424
16.071	60.991
16.071	66.078
16.163	71.900
16.163	77.714
16.163	75.533
16.392	66.106
16.438	61.023
16.529	70.478
16.529	72.658
16.529	84.286
16.529	86.467
16.621	77.754
16.941	76.328
17.079	81.427
17.079	86.515
17.125	79.251
17.125	82.158
17.170	95.243
17.216	84.346
17.353	83.631
17.445	95.994
17.445	99.628
17.720	110.553
17.903	96.034
17.903	90.220
17.949	112.753
17.995	101.856
18.178	95.331
18.178	98.238
18.315	112.785
18.407	98.985
18.407	123.694
18.544	104.084
18.590	111.356
18.636	122.987
18.727	112.821
18.727	120.815
18.864	130.275
18.910	109.930
18.956	122.289
18.956	130.283
18.956	135.370
19.002	111.392
19.093	115.760
19.093	112.853
19.231	135.394
19.460	130.327
19.505	147.773
19.643	150.692
19.689	157.236
19.689	159.417
19.780	142.709
19.826	126.725
19.963	147.813
20.009	130.375
20.009	160.171
20.330	133.310
20.375	146.395
20.375	150.755
20.421	168.928
20.513	157.308
20.559	176.934
20.925	166.065
21.016	199.503
21.658	181.391
22.527	217.804];
units.LW_m   = {'cm','g'};  label.LW_m = {'fork length','wet weight','male'};  
bibkey.LW_m = 'PavlHa2013';
comment.LW_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set2,set1};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '764VB'; % Cat of Life
metaData.links.id_ITIS = '169453'; % ITIS
metaData.links.id_EoL = '46578793'; % Ency of Life
metaData.links.id_Wiki = 'Parupeneus_multifasciatus'; % Wikipedia
metaData.links.id_ADW = 'Parupeneus_multifasciatus'; % ADW
metaData.links.id_Taxo = '183301'; % Taxonomicon
metaData.links.id_WoRMS = '277820'; % WoRMS
metaData.links.id_fishbase = 'Parupeneus-multifasciatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parupeneus_multifasciatus}}';
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
bibkey = 'PavlHa2013'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S003294521304005X}, ' ...
'author = {D. A. Pavlov and N. G. Emel''yanova and Vo Thi Ha and Luong Thi Bich Thuan}, ' ... 
'year = {2013}, ' ...
'title = {Age and Growth of Manybar Goatfish \emph{Parupeneus multifasciatus} ({M}ullidae) from the {N}ha {T}rang {B}ay of the {S}outh {C}hina {S}ea}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {53}, ' ...
'pages = {478-485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Parupeneus-multifasciatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

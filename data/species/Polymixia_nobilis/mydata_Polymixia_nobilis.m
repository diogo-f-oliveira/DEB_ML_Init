function [data, auxData, metaData, txtData, weights] = mydata_Polymixia_nobilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polymixiiformes'; 
metaData.family     = 'Polymixiidae';
metaData.species    = 'Polymixia_nobilis'; 
metaData.species_en = 'Stout beardfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = { 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 04];              
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

data.am = 14*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temperatures are guessed, based on deep water occurence, see F1'; 

data.Lp  = 26;  units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'GarcTuse2010'; 
data.Lpm = 30;  units.Lpm = 'cm';  label.Lpm = 'fork length at puberty for males'; bibkey.Lpm  = 'GarcTuse2010'; 
data.Li  = 48;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'GarcTuse2010';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 1 mm: 4/3*pi*0.05^3; encyclopedia: eggs are unknown, smallest individual is 3.5mm';

data.GSI  = 0.02; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'GarcTuse2010';   
  temp.GSI = C2K(9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [  ... % time since birth (yr), fork length (cm)
0.019	14.408
0.019	15.266
0.019	16.038
0.019	16.895
0.935	27.358
0.935	27.959
0.935	29.417
0.954	17.410
0.991	15.094
0.991	15.609
0.991	18.782
0.991	19.811
1.029	16.123
1.029	16.810
1.945	19.897
1.964	20.583
1.964	21.269
1.964	22.298
1.964	27.101
1.964	29.245
1.964	30.617
1.964	31.046
1.964	31.904
1.964	32.247
1.964	34.305
1.983	33.533
2.936	35.592
2.955	33.019
2.974	20.755
2.974	21.870
2.974	23.671
2.974	24.185
2.974	24.871
2.974	34.048
2.974	34.648
2.993	22.642
2.993	31.218
2.993	32.247
3.011	26.329
3.011	27.101
3.011	27.787
3.011	29.160
3.965	27.530
3.965	28.130
3.965	29.074
3.984	31.389
3.984	32.075
3.984	32.762
3.984	33.619
3.984	34.305
3.984	34.906
3.984	35.249
4.002	21.612
4.002	24.357
4.938	31.218
4.956	25.300
4.956	28.473
4.956	28.816
4.956	29.245
4.956	29.931
4.956	30.532
4.956	31.818
4.956	32.504
4.956	32.933
4.956	33.791
4.956	34.134
4.956	36.364
4.956	36.878
4.956	37.993
4.956	40.137
4.975	27.101
4.975	27.787
4.975	38.765
4.975	39.108
4.975	43.225
5.966	36.021
5.966	36.707
5.966	39.451
5.985	29.588
5.985	30.189
5.985	30.961
5.985	32.075
5.985	32.676
5.985	33.362
5.985	33.962
5.985	34.734
5.985	35.420
5.985	37.479
6.004	24.957
6.004	26.758
6.004	28.388
6.004	29.160
6.920	34.991
6.920	35.592
6.939	39.194
6.958	36.364
6.958	36.964
6.958	37.479
6.958	38.079
6.976	29.245
6.976	30.274
6.976	31.389
8.005	35.163
8.005	37.307
8.024	35.849
8.024	38.937
8.996	34.391
8.996	38.937
8.996	41.938
9.034	36.021
9.988	40.223
10.006	35.935
10.006	38.765
10.006	39.451
10.006	42.196
10.006	44.254
11.016	42.024
11.016	43.139
11.016	43.825
11.035	37.221
11.970	39.966
11.989	45.883
12.999	45.969
13.971	46.312]; 
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GarcTuse2010';
comment.tL_f = 'data for females';
% 
data.tL_m = [  ... % time since birth (yr), fork length (cm)
0.014	23.577
0.014	14.390
0.014	15.691
0.014	17.398
0.952	18.618
0.952	19.431
0.952	20.894
0.952	21.626
0.952	22.033
0.952	25.772
0.952	27.154
0.952	28.862
0.966	15.041
0.966	15.447
0.966	16.098
0.966	16.667
0.966	17.398
1.932	27.073
1.960	16.423
1.960	17.724
1.960	28.293
1.960	28.943
1.974	22.602
1.974	23.252
1.974	29.431
1.988	18.780
1.988	20.163
1.988	21.382
1.988	22.195
2.968	29.756
2.968	30.325
2.982	20.894
2.982	22.602
2.982	26.585
2.982	27.236
2.982	28.130
2.982	28.780
2.982	29.350
2.996	31.382
3.963	22.439
3.963	29.106
3.963	29.756
3.963	30.407
3.963	32.764
3.963	33.577
3.977	23.902
3.977	25.854
3.977	27.317
3.977	28.293
3.977	31.057
3.977	31.626
3.977	32.195
3.977	35.447
4.019	20.488
4.957	30.976
4.957	31.463
4.971	32.033
4.971	32.520
4.985	27.480
4.985	28.374
4.985	29.268
4.985	29.837
4.985	30.325
4.985	32.927
4.985	33.577
4.985	34.309
4.985	35.041
5.965	32.114
5.979	32.683
5.979	33.252
5.979	33.821
5.993	29.187
5.993	29.756
5.993	30.325
5.993	31.138
5.993	36.911
6.959	31.382
6.959	32.033
6.959	32.764
6.973	33.496
6.973	34.065
6.973	35.854
6.973	36.992
7.953	33.252
7.953	33.821
7.967	34.715
8.975	35.285
8.975	35.935
8.975	36.585
8.989	31.870
8.989	32.927
8.989	33.333
8.989	33.984
8.989	34.634
9.970	33.740
9.998	34.878
9.998	35.528
10.012	33.008
10.978	36.667
10.978	38.455]; 
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GarcTuse2010';
comment.tL_m = 'data for males';

% length-weight
data.LW = [  ... % fork length (cm), wet weight (g)
14.230	86.580
15.407	97.403
16.487	97.403
17.959	173.160
18.106	124.459
18.548	162.338
18.548	194.805
18.842	129.870
18.940	194.805
19.284	162.338
19.431	183.983
19.529	211.039
19.725	232.684
19.725	156.927
20.020	243.506
20.020	183.983
20.020	135.282
20.314	221.861
20.510	151.515
20.510	189.394
20.658	216.450
21.050	162.338
21.050	243.506
21.148	200.217
21.394	183.983
21.786	211.039
21.786	248.918
21.982	183.983
22.080	297.619
22.277	248.918
22.473	205.628
22.571	270.563
22.571	367.965
22.669	313.853
22.816	292.208
23.307	292.208
23.503	248.918
23.602	313.853
23.651	265.152
23.749	346.320
23.994	351.732
24.239	313.853
24.338	367.965
24.534	335.498
24.534	259.740
24.975	292.208
24.975	389.610
25.025	367.965
25.025	427.489
25.172	340.909
25.417	416.667
25.515	400.433
25.859	400.433
25.859	427.489
25.957	449.134
26.006	319.264
26.104	362.554
26.251	340.909
26.349	465.368
26.398	422.078
26.398	308.442
26.447	400.433
26.693	335.498
26.987	443.723
27.085	476.191
27.134	438.312
27.282	357.143
27.380	524.892
27.478	449.134
27.625	378.788
27.625	557.359
27.674	487.013
28.018	514.069
28.312	551.948
28.361	497.836
28.459	579.005
28.606	443.723
28.656	508.658
28.754	600.650
28.754	546.537
28.950	487.013
28.999	573.593
28.999	719.697
29.146	606.061
29.146	654.762
29.244	530.303
29.244	573.593
29.392	487.013
29.392	524.892
29.539	768.398
29.539	622.295
29.735	589.827
29.833	557.359
29.833	681.818
29.980	535.714
29.980	638.528
30.128	395.022
30.128	449.134
30.128	551.948
30.128	611.472
30.177	692.641
30.226	465.368
30.275	519.481
30.422	633.117
30.471	503.247
30.520	600.650
30.864	638.528
30.962	579.005
31.109	616.883
31.109	676.407
31.109	752.165
31.158	703.463
31.158	725.108
31.305	643.940
31.305	817.100
31.600	790.043
31.600	854.978
31.649	665.584
31.649	703.463
31.698	735.931
31.698	757.576
31.992	757.576
31.992	882.035
32.041	568.182
32.041	784.632
32.139	725.108
32.188	692.641
32.237	811.688
32.287	854.978
32.385	708.874
32.483	887.446
32.483	757.576
32.581	779.221
32.679	827.922
32.875	919.913
32.875	725.108
32.974	806.277
33.023	854.978
33.219	725.108
33.268	882.035
33.268	773.809
33.268	1001.082
33.366	714.286
33.415	822.511
33.464	757.576
33.513	817.100
33.660	854.978
33.808	660.173
33.808	952.381
33.906	854.978
33.955	795.455
34.053	752.165
34.053	974.026
34.102	903.680
34.151	898.268
34.298	795.455
34.298	844.156
34.347	1006.493
34.446	876.623
34.446	919.913
34.593	817.100
34.838	946.970
34.936	876.623
34.936	909.091
34.936	1006.493
35.034	746.753
35.034	790.043
35.182	995.671
35.231	941.559
35.378	919.913
35.427	1033.550
35.574	974.026
35.574	1233.766
35.623	1087.662
35.672	1011.905
35.672	1158.009
35.868	1055.195
36.016	1022.727
36.016	952.381
36.016	1109.307
36.016	1136.364
36.163	1055.195
36.408	1141.775
36.457	1076.840
36.457	1195.888
36.654	1033.550
36.752	974.026
36.752	1060.606
36.752	1163.420
36.801	1087.662
36.801	1103.896
36.997	1228.355
37.193	1141.775
37.193	1222.944
37.439	1282.468
37.488	1228.355
37.586	1125.541
37.586	1190.476
37.586	1314.935
37.929	1255.411
37.929	1190.476
38.126	1287.879
38.175	1228.355
38.322	1201.299
38.371	1401.515
38.567	1309.524
38.763	1239.178
38.862	1136.364
39.009	1087.662
39.058	930.736
39.107	1201.299
39.107	1158.009
39.156	1347.403
39.205	1417.749
39.254	1461.039
39.352	1396.104
39.647	1558.442
39.892	1250.000
39.941	1471.862
40.334	1417.749
40.873	1396.104
41.021	1547.619
41.806	1742.424
41.904	1504.329
42.051	1547.619
42.051	1791.126
42.100	1699.134
43.081	1856.061
43.376	1915.584
43.719	1926.407
44.210	2034.632
45.976	2202.381
45.976	2261.905
46.124	2121.212
46.614	2077.922]; 
units.LW   = {'cm', 'g'};  label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'GarcTuse2010';

%% set weights for all real data
weights = setweights(data, []);

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
F1 = 'bathydemersal; depth range 100 - 770 m (Ref. 7412), usually 360 - 540 m';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LBFJ'; % Cat of Life
metaData.links.id_ITIS = '166127'; % ITIS
metaData.links.id_EoL = '46564375'; % Ency of Life
metaData.links.id_Wiki = 'Polymixia_nobilis'; % Wikipedia
metaData.links.id_ADW = 'Polymixia_nobilis'; % ADW
metaData.links.id_Taxo = '184375'; % Taxonomicon
metaData.links.id_WoRMS = '127163'; % WoRMS
metaData.links.id_fishbase = 'Polymixia-nobilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polymixia_nobilis}}';
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
bibkey = 'GarcTuse2010'; type = 'Article'; bib = [ ... 
'author = {A. M. Garc\''{i}a-Mederos and V. M. Tuset and J. I. Santana and J. A. Gonz\''{a}lez}, ' ... 
'year = {2010}, ' ...
'title = {Reproduction, growth and feeding habits of stout beardfish \emph{Polymixia nobilis} ({P}olymixiidae) off the {C}anary {I}slands ({N}{E} {A}tlantic)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {26}, ' ...
'pages = {872-880}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/7557}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'encyclopedia'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.encyclopedia.com/environment/encyclopedias-almanacs-transcripts-and-maps/polymixiiformes-beardfishes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


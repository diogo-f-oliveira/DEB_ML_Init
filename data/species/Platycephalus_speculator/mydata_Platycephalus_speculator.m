function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_speculator
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_speculator'; 
metaData.species_en = 'Southern bluespotted flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

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

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'HyndNeir1992';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 38; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'HyndNeir1992';
  comment.Lp = 'based on tp = > 2yr and tL_f data';
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate total length of female'; bibkey.Li  = 'fishbase';
data.Lim  = 80;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = '';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HyndNeir1992';
  comment.Wwb = 'based egg diameter of 0.8 mm: pi/6*0.08^3'; 
data.Wwi = 4.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.05, see F2';

data.GSI  = 0.05;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'HyndNeir1992';   
  temp.GSI = C2K(18);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.019	2.692
0.001	1.346
0.022	2.861
0.188	5.892
0.206	0.676
0.248	2.022
0.271	5.893
0.272	8.585
0.352	4.043
0.354	8.586
0.370	0.173
0.939	24.244
1.042	25.086
1.064	27.274
1.086	30.135
1.105	27.948
1.126	27.948
1.145	26.098
1.147	28.622
1.163	21.386
1.166	26.603
1.168	29.295
1.184	21.891
1.207	25.089
1.210	30.810
1.228	25.930
1.270	27.950
1.272	31.484
1.312	30.138
1.313	30.643
1.313	31.484
1.328	22.735
1.328	22.735
1.355	33.168
1.477	31.487
1.479	33.506
1.560	33.002
1.600	29.974
1.602	34.181
1.604	37.883
1.616	21.897
1.663	32.331
1.682	29.639
1.682	30.817
1.688	39.567
1.725	33.509
1.726	35.697
1.727	36.202
1.783	26.443
1.789	37.885
1.791	40.578
1.803	25.434
1.804	28.463
1.805	29.809
1.824	26.948
1.824	26.948
1.868	31.997
1.891	35.699
1.910	33.849
1.929	29.979
1.929	30.988
1.931	34.354
1.931	34.690
1.932	36.541
1.934	39.065
1.934	39.570
1.949	29.138
1.975	38.561
1.978	43.946
1.995	37.888
2.013	34.523
2.035	36.374
2.054	32.841
2.056	37.384
2.062	47.481
2.076	36.038
2.095	33.346
2.098	38.058
2.113	28.972
2.116	34.020
2.116	34.693
2.120	40.414
2.138	36.712
2.155	30.150
2.155	31.160
2.173	25.944
2.200	37.723
2.240	35.199
2.241	36.546
2.257	30.152
2.260	34.863
2.278	30.657
2.279	31.498
2.301	34.695
2.302	36.378
2.318	29.143
2.324	38.229
2.343	36.210
2.364	37.220
2.447	37.558
2.483	29.986
2.487	35.371
2.503	28.472
2.508	36.718
2.570	36.887
2.571	39.243
2.586	29.651
2.588	32.680
2.592	40.589
2.607	30.998
2.630	34.364
2.632	37.897
2.635	42.945
2.653	38.571
2.654	40.422
2.671	35.205
2.672	35.710
2.696	42.946
2.728	27.466
2.736	40.591
2.753	33.692
2.756	38.909
2.777	39.414
2.778	42.443
2.779	43.116
2.796	37.226
2.798	41.265
2.800	43.789
2.800	44.967
2.801	45.640
2.801	46.481
2.815	35.207
2.815	35.544
2.816	35.881
2.818	40.256
2.841	44.967
2.856	34.535
2.876	34.199
2.917	33.526
2.920	38.574
2.920	39.247
2.924	46.146
2.936	30.666
2.940	37.397
2.944	43.791
2.956	30.161
2.957	32.517
2.960	36.724
2.962	40.762
2.980	35.546
2.982	39.921
2.999	33.696
3.024	40.763
3.025	42.446
3.043	38.071
3.047	44.970
3.077	25.788
3.086	41.437
3.089	46.485
3.102	33.361
3.106	40.091
3.109	45.139
3.123	35.044
3.124	35.717
3.124	36.558
3.125	38.072
3.127	41.270
3.157	57.760
3.169	42.448
3.187	38.410
3.207	37.064
3.212	45.646
3.229	40.598
3.248	38.074
3.250	40.598
3.292	42.618
3.310	38.075
3.313	42.618
3.331	39.590
3.375	43.124
3.395	42.619
3.454	39.087
3.474	37.572
3.476	41.106
3.478	44.135
3.516	38.751
3.535	36.900
3.538	41.107
3.541	46.492
3.561	44.978
3.578	38.920
3.639	38.753
3.640	40.267
3.643	44.642
3.659	37.575
3.661	41.109
3.662	42.287
3.683	43.633
3.686	49.186
3.722	39.595
3.760	34.884
3.763	40.269
3.764	41.278
3.785	41.784
3.785	42.288
3.788	47.841
3.803	37.072
3.806	43.130
3.811	51.712
3.822	35.726
3.829	47.337
3.891	48.179
3.893	50.872
3.926	36.906
3.929	42.963
3.933	49.021
3.935	52.050
3.948	39.598
3.949	40.945
3.949	41.281
3.949	42.122
3.952	45.824
3.952	46.834
3.954	49.358
3.969	40.608
3.971	44.142
3.972	45.656
3.994	48.686
3.995	50.537
4.012	44.479
4.035	47.340
4.054	46.162
4.056	48.013
4.071	39.264
4.080	55.081
4.093	41.115
4.094	43.471
4.120	52.389
4.133	39.264
4.134	41.115
4.135	42.462
4.172	35.731
4.178	46.837
4.203	54.241
4.238	43.977
4.313	31.022
4.524	40.448
4.549	47.852
4.569	47.852
4.630	46.675
4.731	43.143
4.753	45.499
4.792	42.639
4.816	48.865
4.831	39.442
4.858	49.034
4.877	47.857
4.977	43.146
4.981	49.877
5.000	45.839
5.676	43.661
5.890	56.957
5.992	56.286
6.129	45.182
7.096	46.037
7.756	51.431
9.221	62.052
10.089	69.636
10.661	63.587];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HyndLone1992';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.010	2.417
0.050	1.138
0.114	3.698
0.183	10.665
0.195	2.277
0.235	0.856
0.261	6.970
0.284	8.818
0.296	1.141
0.306	10.098
0.318	1.994
0.321	4.838
0.323	7.255
0.345	8.819
0.383	5.549
0.399	1.426
0.700	13.657
0.792	23.327
0.793	24.037
0.794	25.033
0.821	31.431
0.832	22.190
0.841	31.574
0.890	38.968
0.913	21.337
0.916	23.755
0.918	25.887
0.951	17.926
0.954	20.911
0.976	23.044
0.994	19.917
1.020	25.889
1.037	22.192
1.039	24.183
1.046	31.150
1.063	27.026
1.066	29.728
1.077	20.771
1.081	24.610
1.082	26.174
1.102	24.752
1.162	24.042
1.289	27.171
1.305	22.906
1.306	23.617
1.313	30.726
1.316	33.570
1.331	28.594
1.379	35.134
1.453	26.605
1.479	31.866
1.535	27.032
1.639	28.029
1.662	30.019
1.702	29.309
1.739	24.760
1.758	23.338
1.767	32.722
1.768	33.149
1.785	30.305
1.799	24.049
1.817	21.064
1.854	37.415
1.862	25.188
1.866	28.884
1.867	29.595
1.870	32.297
1.872	34.287
1.872	35.140
1.881	23.482
1.885	27.605
1.887	29.453
1.920	21.634
1.927	28.032
1.927	28.601
1.946	27.037
1.948	28.601
1.991	30.734
2.015	33.720
2.017	35.711
2.030	28.318
2.031	29.597
2.033	31.730
2.038	36.422
2.066	23.626
2.068	25.617
2.074	30.877
2.090	27.323
2.096	33.152
2.098	34.290
2.099	35.996
2.139	35.001
2.158	32.584
2.159	33.722
2.212	26.045
2.239	32.301
2.241	34.007
2.247	39.695
2.273	25.192
2.302	33.155
2.325	35.857
2.370	39.127
2.550	34.722
2.595	38.703
2.599	42.542
2.637	39.415
2.650	31.595
2.650	31.879
2.654	35.860
2.670	31.027
2.677	38.420
2.687	28.041
2.688	29.178
2.714	34.297
2.716	36.146
2.758	36.715
2.789	27.047
2.802	39.843
2.803	40.412
2.803	41.123
2.811	28.327
2.815	33.019
2.816	33.730
2.818	35.436
2.834	31.029
2.840	36.716
2.841	37.711
2.855	31.882
2.879	34.584
2.881	36.574
2.883	38.849
2.889	24.347
2.913	28.044
2.940	34.158
2.945	38.708
2.960	34.016
2.963	36.149
2.970	23.495
2.998	31.030
3.001	33.732
3.005	37.286
3.009	41.268
3.018	29.751
3.024	35.723
3.062	33.164
3.064	34.870
3.083	33.164
3.100	29.468
3.108	37.856
3.110	40.131
3.166	34.587
3.167	35.440
3.169	37.146
3.171	39.137
3.180	27.478
3.184	31.601
3.185	32.597
3.254	39.706
3.269	34.873
3.286	30.607
3.302	26.484
3.333	36.864
3.357	40.276
3.370	32.741
3.372	34.589
3.394	36.011
3.396	38.286
3.433	33.879
3.452	32.315
3.516	35.302
3.519	37.293
3.578	34.876
3.585	41.559
3.599	35.587
3.600	36.725
3.604	40.848
3.626	41.701
3.641	36.583
3.642	37.436
3.643	38.858
3.726	39.712
3.776	48.386
3.781	32.604
3.784	35.874
3.793	43.978
3.807	38.291
3.810	41.419
3.823	33.457
3.826	36.585
3.827	37.154
3.845	34.737
3.853	42.842
3.870	39.145
3.891	39.572
3.891	40.283
3.915	43.127
3.923	30.615
3.926	33.459
3.933	40.994
3.947	34.596
3.950	36.871
3.970	37.014
3.972	38.578
3.985	31.753
3.996	41.848
4.019	43.981
4.027	32.464
4.031	35.735
4.051	35.166
4.051	35.735
4.052	36.446
4.058	42.417
4.061	24.929
4.067	31.043
4.082	45.546
4.095	38.579
4.097	40.001
4.113	35.593
4.114	37.157
4.122	44.409
4.129	31.897
4.133	35.025
4.159	40.997
4.180	41.281
4.198	38.296
4.238	37.301
4.258	36.875
4.277	35.880
4.286	43.842
4.322	39.008
4.345	41.994
4.402	37.587
4.447	40.716
4.452	46.261
4.468	41.711
4.472	45.692
4.491	43.702
4.590	39.722
4.602	31.618
4.657	45.268
4.687	35.032
4.691	38.444
4.707	34.463
4.710	37.449
4.763	48.113
4.778	42.995
4.799	43.848
4.833	36.597
4.856	38.730
4.861	44.133
4.900	42.285
4.916	37.167
4.916	37.451
4.916	37.878
4.919	40.153
4.940	40.437
4.962	41.859
4.984	43.424
5.020	38.306
5.038	36.031
5.043	41.007
5.062	39.870
5.064	41.718
5.065	42.572
5.067	44.704
5.083	39.870
5.123	38.876
5.244	36.460
5.301	32.053
5.577	40.729
5.618	41.014
5.805	42.438
5.891	46.278
5.892	47.415
5.929	43.293
5.945	38.743
5.989	42.156
6.032	43.294
6.034	45.853
6.070	40.593
6.241	46.851
6.526	44.153
6.571	47.992
6.784	36.052
6.931	38.328
6.936	44.016
6.954	41.030
6.978	44.869
6.983	49.135
7.020	45.438
7.034	39.183
7.079	43.306
7.086	49.420
7.103	45.866
7.746	51.561
8.002	41.611
8.087	43.887
8.997	49.869
9.143	51.435
9.879	48.458
9.898	46.752
10.060	44.479
10.705	51.738
10.787	51.597];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HyndLone1992';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Marine; brackish; demersal; depth range 0 - 30 m. Subtropical';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'weight-length: weight (in g) = 0.00537 * (TL in cm)^3.05';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4JP6F'; % Cat of Life
metaData.links.id_ITIS = '167168'; % ITIS
metaData.links.id_EoL = '46568562'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus_speculator'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_speculator'; % ADW
metaData.links.id_Taxo = '183997'; % Taxonomicon
metaData.links.id_WoRMS = '274664'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-speculator'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus_speculator}}';
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
bibkey = 'HyndLone1992'; type = 'article'; bib = [ ... 
'author = {Glenn A. Hyndes and Nell R. Loneragan and Ian C. Potter}, ' ... 
'year = {1992}, ' ...
'title = {Influence of sectioning otoliths on marginal increment trends and age and growth estimates for the flathead \emph{Platycephalus speculator}}, ' ...
'journal = {Fishery Bulletin, U.S.}, ' ...
'volume = {90}, ' ...
'pages = {276-284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HyndNeir1992'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1992.tb02632.x}, ' ...
'author = {G. A. Hyndes and F. J. Neira and I. C. Potter}, ' ... 
'year = {1992}, ' ...
'title = {Reproductive biology and early life history of the marine teleost \emph{Platycephalus speculator} {K}lunzinger ({P}latycephalidae) in a temperate {A}ustralian estuary}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {40(6)}, ' ...
'pages = {859–874}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-speculator.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

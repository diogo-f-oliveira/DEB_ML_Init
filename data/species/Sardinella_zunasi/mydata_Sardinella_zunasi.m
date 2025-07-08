function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_zunasi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_zunasi'; 
metaData.species_en = 'Japanese sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 19];

%% set data
% zero-variate data;

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(19.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Oda2007';   
  temp.am = C2K(19.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 10.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Oda2007';
data.Lpm  = 10;   units.Lpm  = 'cm';   label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Oda2007';
data.Li  = 18; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwp = 16.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Oda2007'};
  comment.Wwp= 'based on 0.01230*Lp^3.06, see F1';
data.Wwi = 85.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.06, see F1';

data.Ri  = 58800/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(19.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.733	7.448
1.100	9.269
1.145	7.788
1.165	8.031
1.165	8.225
1.166	8.492
1.174	7.958
1.176	9.075
1.176	9.148
1.183	7.667
1.281	8.857
1.387	9.294
1.406	8.832
1.512	9.342
1.520	8.759
1.521	9.148
1.529	8.031
1.529	8.274
1.531	9.269
1.531	9.415
1.538	8.177
1.568	8.444
1.568	8.589
1.682	8.274
1.721	8.371
1.722	9.391
1.723	9.974
1.740	8.589
1.750	8.735
1.761	9.658
1.769	8.492
1.770	9.221
1.778	8.662
1.779	8.857
1.779	9.196
1.780	9.366
1.787	8.249
1.789	9.488
1.790	9.876
1.798	8.832
1.809	9.585
1.816	8.492
1.829	9.998
1.857	10.095
1.867	10.071
1.867	10.216
1.876	9.779
1.898	11.139
1.906	10.411
1.906	10.532
1.916	10.629
1.916	10.751
1.964	10.751
1.973	10.751
1.974	11.042
1.982	10.192
1.982	10.338
1.983	10.532
1.990	9.512
2.010	9.804
2.011	10.095
2.022	10.872
2.060	10.945
2.069	10.556
2.098	10.872
2.116	10.216
2.126	10.411
2.127	11.260
2.136	10.775
2.153	9.415
2.154	10.143
2.162	9.294
2.165	11.091
2.166	11.430
2.193	10.678
2.194	10.945
2.231	10.483
2.239	9.536
2.250	10.143
2.252	11.260
2.259	9.998
2.260	10.338
2.270	10.751
2.279	10.581
2.280	10.945
2.280	11.091
2.287	9.706
2.288	9.828
2.297	9.536
2.316	9.342
2.317	10.192
2.385	10.653
2.385	10.969
2.414	11.139
2.460	9.682
2.462	10.823
2.463	11.430
2.471	10.581
2.471	10.653
2.480	10.556
2.489	9.925
2.489	10.241
2.499	10.071
2.499	10.095
2.519	11.018
2.520	11.236
2.547	10.629
2.565	9.464
2.566	10.459
2.662	10.435
2.671	10.143
2.671	10.241
2.682	10.799
2.682	11.018
2.702	11.236
2.710	10.483
2.711	10.872
2.718	9.706
2.720	10.678
2.730	11.285
2.738	9.949
2.750	11.528
2.750	11.649
2.759	10.969
2.796	10.435
2.797	10.896
2.807	11.212
2.808	11.770
2.817	11.333
2.817	11.455
2.827	12.013
2.828	12.135
2.846	11.576
2.854	11.018
2.864	11.309
2.903	11.528
2.903	11.600
2.904	11.819
2.950	10.775
2.950	10.896
2.951	11.746
2.952	12.135
2.960	11.091
2.969	10.726
2.970	11.503
2.998	11.212
3.017	11.091
3.037	11.285
3.045	10.872
3.055	10.799
3.057	12.183
3.065	11.188
3.094	11.115
3.113	11.358
3.114	11.795
3.133	11.940
3.134	12.232
3.141	11.042
3.161	11.285
3.170	11.091
3.171	11.698
3.180	11.455
3.181	11.965
3.200	11.576
3.218	11.139
3.256	10.872
3.257	11.430
3.267	11.455
3.267	11.625
3.278	12.547
3.284	10.751
3.287	12.110
3.295	11.333
3.314	11.115
3.314	11.236
3.315	11.819
3.342	10.726
3.354	11.989
3.362	11.552
3.410	11.115
3.428	10.848
3.440	12.159
3.449	11.528
3.458	11.285
3.459	11.819
3.467	10.993
3.478	12.062
3.505	11.139
3.658	11.091
3.668	11.260
3.669	11.795
3.687	10.896
3.688	11.528
3.707	11.819
3.708	12.062
3.708	12.159
3.716	11.066
3.726	11.698
3.728	12.402
3.764	11.309
3.824	12.717
3.842	12.062
3.843	12.499
3.843	12.620
3.851	11.819
3.861	12.280
3.870	11.503
3.879	11.212
3.890	12.038
3.898	11.285
3.900	12.450
3.901	12.887
3.908	11.698
3.919	12.377
3.928	11.892
3.937	11.625
3.938	12.620
3.947	12.183
3.967	12.693
3.995	12.256
4.004	11.698
4.015	12.523
4.016	13.106
4.023	11.940
4.032	11.479
4.063	12.887
4.073	12.717
4.073	13.033
4.081	12.208
4.090	11.770
4.110	12.305
4.140	12.839
4.167	11.989
4.197	12.960
4.319	11.625
4.359	12.377
4.359	12.572
4.713	12.013
4.847	12.305
4.848	12.693
4.848	12.887
4.877	13.009
4.914	12.208
4.915	12.839
4.933	11.989
4.983	13.422
4.991	12.353
4.991	12.839
4.993	13.519
5.012	13.373
5.067	12.110
5.068	13.033
5.299	13.519
5.375	13.543
5.643	13.082
5.652	13.252
5.671	12.936
5.825	13.543
5.873	13.373]; 
data.tL_f(:,1) = 365 * (0.9+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f = C2K(19.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Oda2007';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.724	7.050
1.148	8.731
1.148	8.779
1.155	7.026
1.157	8.563
1.158	8.972
1.310	8.371
1.426	9.068
1.512	9.188
1.530	8.323
1.531	9.068
1.538	7.531
1.539	8.251
1.542	9.644
1.542	9.860
1.702	8.419
1.703	8.683
1.705	9.644
1.705	9.836
1.715	9.980
1.723	9.332
1.731	8.155
1.732	8.948
1.752	9.476
1.761	9.092
1.762	9.596
1.769	8.227
1.769	8.491
1.770	8.779
1.778	7.867
1.811	10.172
1.849	10.413
1.858	10.028
1.878	10.605
1.879	10.821
1.897	10.172
1.897	10.389
1.905	9.620
1.917	10.557
1.973	9.740
1.974	10.629
1.991	9.500
1.992	9.884
1.993	10.293
2.001	9.764
2.004	11.109
2.011	9.956
2.013	10.917
2.040	9.956
2.040	10.197
2.041	10.461
2.041	10.725
2.048	9.284
2.069	10.341
2.070	10.917
2.078	9.620
2.079	10.653
2.088	9.788
2.089	10.509
2.107	9.932
2.107	10.245
2.118	10.677
2.118	10.701
2.138	11.277
2.146	10.317
2.165	10.076
2.166	10.629
2.176	11.373
2.185	10.725
2.194	10.317
2.195	10.893
2.195	10.893
2.204	10.485
2.223	10.461
2.223	10.677
2.243	11.205
2.251	10.293
2.260	10.004
2.288	9.428
2.289	9.836
2.289	9.980
2.289	10.076
2.298	9.692
2.307	9.548
2.308	10.245
2.327	9.860
2.328	10.581
2.329	10.869
2.347	10.317
2.366	10.557
2.385	10.437
2.405	10.845
2.415	10.965
2.423	10.172
2.433	10.245
2.441	9.500
2.442	10.100
2.452	10.365
2.454	11.133
2.470	9.524
2.480	9.908
2.481	10.677
2.498	9.260
2.509	10.028
2.518	9.716
2.519	10.341
2.520	10.821
2.529	10.605
2.644	10.725
2.653	10.197
2.653	10.221
2.663	10.341
2.663	10.581
2.664	10.965
2.664	11.349
2.673	10.917
2.674	11.109
2.684	11.686
2.685	11.974
2.693	11.181
2.702	11.157
2.703	11.782
2.713	11.493
2.722	11.205
2.723	11.950
2.731	10.941
2.741	11.614
2.748	9.740
2.749	10.389
2.749	10.701
2.788	10.773
2.790	11.926
2.808	11.109
2.818	11.590
2.826	10.941
2.846	11.301
2.855	10.989
2.857	11.830
2.876	11.926
2.895	11.662
2.903	11.157
2.921	10.533
2.922	10.845
2.942	11.229
2.971	11.421
2.980	10.989
2.989	10.773
2.998	10.509
3.009	11.277
3.019	11.445
3.027	10.965
3.056	10.845
3.085	11.013
3.085	11.157
3.105	11.373
3.114	11.205
3.114	11.517
3.133	11.181
3.134	11.830
3.153	11.517
3.191	11.469
3.191	11.734
3.210	11.493
3.249	11.662
3.277	11.710
3.278	11.854
3.278	11.950
3.287	11.421
3.288	12.526
3.295	10.941
3.296	11.061
3.333	10.605
3.334	11.205
3.334	11.349
3.343	10.725
3.344	11.541
3.353	11.229
3.354	11.686
3.355	12.190
3.372	10.821
3.372	10.893
3.420	11.277
3.429	10.701
3.429	10.989
3.430	11.493
3.438	10.749
3.440	11.782
3.449	11.445
3.458	11.157
3.486	10.677
3.487	10.917
3.497	11.109
3.507	11.878
3.517	11.710
3.525	11.085
3.659	11.229
3.671	12.094
3.679	11.517
3.689	11.806
3.707	10.869
3.709	12.286
3.716	10.989
3.736	11.157
3.737	11.590
3.747	11.902
3.785	11.998
3.795	12.046
3.842	11.878
3.851	11.397
3.851	11.614
3.863	12.718
3.872	12.526
3.891	12.046
3.891	12.166
3.900	11.782
3.909	11.445
3.920	12.574
3.985	11.109
4.003	10.941
4.005	11.710
4.005	11.830
4.005	11.974
4.014	11.590
4.082	11.830
4.090	11.229
4.167	11.517
4.294	12.766
4.341	12.214
4.361	12.742
4.638	12.910
4.818	11.734
4.818	11.854
4.819	12.118
4.849	12.959
4.885	11.566
4.885	11.590
4.894	11.373
4.896	12.382
5.058	12.046
5.088	12.814
5.164	12.598
5.480	12.790
5.805	12.502
5.900	12.190]; 
data.tL_m(:,1) = 365 * (0.9+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m = C2K(19.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Oda2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  10 * weights.tL_f;
weights.tL_m =  10 * weights.tL_m;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperature (C) in tL data at Ushimado and 3 m deep is assumed to vary as T(t)=17+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79MKL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_zunasi'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_zunasi'; % ADW
metaData.links.id_Taxo = '186556'; % Taxonomicon
metaData.links.id_WoRMS = '272277'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-zunasi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_zunasi}}';
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
bibkey = 'Oda2007'; type = 'Article'; bib = [ ...
'author = {Naoki Oda}, ' ... 
'year = {0}, ' ...
'title = {Age, growth and maturity if the {J}apanese sardinells \emph{Sardinells zunasi} caught in {B}isan {S}eto of the {S}eto {I}nland {S}ea. {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {73(2)}, ' ...
'pages = {233-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Sardinella-zunasi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

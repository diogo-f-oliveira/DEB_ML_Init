function [data, auxData, metaData, txtData, weights] = mydata_Theodoxus_fluviatilis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neritopsina'; % formally a superorder, but rank is uncertain
metaData.family     = 'Neritidae';
metaData.species    = 'Theodoxus_fluviatilis'; 
metaData.species_en = 'River nerite'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 22]; 

%% set data
% zero-variate data

data.ab = 30; units.ab = 'd';    label.ab= 'age at birth';                bibkey.ab = 'Kirk2006';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Kirk2006';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';             bibkey.Lb  = 'Kirk2006';
data.Lj  = 0.081; units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';        bibkey.Lj  = 'Kirk2006';
data.Lp  = 0.56; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty for female'; bibkey.Lp  = 'Kirk2006';
data.Li  = 1.3; units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'Wiki';

data.Ri  = 750/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Kirk2006';   
  temp.Ri = C2K(10);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '100-200 eggs per capsule; 5 capsules per per assumed';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell length (cm)
0.478	0.085
0.530	0.108
0.567	0.140
0.609	0.155
0.662	0.175
0.678	0.205
0.735	0.200
0.788	0.215
0.819	0.247
0.861	0.242
0.888	0.257
0.903	0.272
0.951	0.273
1.014	0.260
1.103	0.291
1.197	0.273
1.261	0.286
1.318	0.271
1.366	0.268
1.423	0.270
1.455	0.278
1.481	0.305
1.539	0.338
1.565	0.383
1.597	0.418
1.670	0.445
1.696	0.503
1.738	0.511
1.796	0.510
1.817	0.540
1.854	0.531
1.880	0.548
1.922	0.571
1.923	0.540
1.949	0.555
1.954	0.576
2.006	0.558
2.122	0.566
2.211	0.576
2.264	0.576
2.348	0.578
2.363	0.564
2.421	0.576
2.463	0.588
2.495	0.576
2.521	0.581
2.574	0.618
2.605	0.628
2.673	0.624
2.684	0.663
2.726	0.656
2.784	0.656
2.805	0.668
2.857	0.654
2.904	0.676
2.920	0.688
2.952	0.743
2.953	0.684
3.020	0.694
3.109	0.701
3.204	0.713
3.277	0.687
3.351	0.679
3.419	0.704
3.456	0.704
3.493	0.702
3.529	0.722
3.571	0.712
3.598	0.731
3.661	0.712
3.697	0.772
3.829	0.819
3.871	0.791
3.918	0.839
4.002	0.802];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kirk2006';

% length-weight
data.LWd = [ ... % shell length, AFDW (mg)
0.079	0.018
0.084	0.038
0.090	0.099
0.097	0.079
0.102	0.079
0.115	0.078
0.123	0.078
0.128	0.119
0.132	0.078
0.140	0.078
0.142	0.017
0.152	0.098
0.157	0.159
0.164	0.158
0.167	0.199
0.175	0.199
0.181	0.117
0.185	0.158
0.191	0.219
0.197	0.239
0.203	0.239
0.207	0.320
0.208	0.198
0.217	0.238
0.223	0.218
0.225	0.380
0.226	0.319
0.229	0.197
0.234	0.299
0.237	0.299
0.240	0.421
0.241	0.258
0.242	0.217
0.247	0.400
0.247	0.502
0.250	0.258
0.252	0.461
0.252	0.339
0.261	0.542
0.262	0.257
0.262	0.379
0.270	0.338
0.271	0.460
0.277	0.440
0.277	0.541
0.278	0.277
0.284	0.399
0.287	0.562
0.291	0.561
0.291	0.460
0.297	0.683
0.301	0.419
0.303	0.277
0.305	0.622
0.309	0.480
0.314	0.703
0.314	0.541
0.315	0.845
0.322	0.987
0.324	0.622
0.324	0.256
0.325	0.561
0.328	0.886
0.333	0.723
0.338	0.946
0.340	0.621
0.340	0.763
0.347	0.621
0.350	0.844
0.360	0.844
0.360	0.986
0.363	1.108
0.367	0.946
0.376	0.945
0.378	0.905
0.379	1.108
0.379	1.250
0.388	1.209
0.388	1.087
0.388	1.026
0.394	1.046
0.395	1.209
0.403	1.412
0.403	1.554
0.405	1.270
0.412	1.148
0.412	1.249
0.431	1.574
0.433	1.411
0.448	1.655
0.448	1.776
0.459	1.837
0.467	2.040
0.472	2.324
0.474	1.816
0.477	2.263
0.479	2.162
0.480	2.080
0.482	1.715
0.484	2.588
0.484	2.426
0.488	2.304
0.489	2.182
0.495	2.141
0.495	2.019
0.496	2.568
0.497	2.466
0.498	2.852
0.498	2.019
0.500	2.181
0.500	2.364
0.501	2.588
0.508	2.892
0.509	2.750
0.509	2.628
0.509	2.466
0.510	2.364
0.511	2.222
0.518	2.892
0.519	2.120
0.519	2.770
0.520	2.547
0.520	2.648
0.521	2.445
0.526	3.440
0.527	2.567
0.527	2.953
0.527	3.115
0.527	3.643
0.530	2.404
0.531	2.790
0.536	3.440
0.537	3.217
0.537	2.668
0.538	2.973
0.538	2.505
0.539	2.810
0.549	3.541
0.550	3.033
0.551	3.176
0.555	4.069
0.557	2.993
0.558	3.094
0.558	3.744
0.560	3.216
0.568	3.785
0.568	3.703
0.568	3.155
0.569	4.049
0.569	3.581
0.570	3.053
0.571	3.358
0.572	3.277
0.575	3.439
0.577	2.687
0.577	3.256
0.578	3.703
0.578	3.764
0.578	4.008
0.578	4.170
0.587	4.678
0.587	4.455
0.588	4.211
0.589	3.337
0.590	4.922
0.590	3.540
0.590	2.992
0.591	4.170
0.591	3.804
0.592	3.987
0.592	3.865
0.597	4.251
0.597	4.414
0.597	4.576
0.600	4.129
0.601	3.763
0.601	3.865
0.602	3.601
0.608	5.003
0.608	4.901
0.608	4.738
0.608	4.596
0.609	4.454
0.611	5.043
0.611	4.332
0.611	4.190
0.611	4.027
0.611	3.662
0.612	3.966
0.612	3.865
0.617	4.799
0.617	5.043
0.618	6.343
0.618	4.068
0.619	5.734
0.620	4.291
0.620	4.393
0.620	4.494
0.620	4.738
0.627	4.697
0.629	5.490
0.631	4.149
0.631	4.474
0.638	5.022
0.638	4.453
0.640	4.270
0.647	4.961
0.647	5.164
0.649	5.591
0.650	5.997
0.650	5.875
0.650	4.676
0.658	6.911
0.659	4.757
0.659	4.839
0.659	4.920
0.661	5.469
0.680	5.163
0.680	4.635
0.681	5.610
0.683	5.976
0.687	5.976
0.687	5.813
0.689	7.154
0.689	5.305
0.699	6.849
0.718	7.722
0.731	7.417
0.741	6.950];
data.LWd(:,2) = data.LWd(:,2)/ 1000; % convert mg to g
units.LWd   = {'cm', 'g'};  label.LWd = {'shell length', 'ash-free dry weight'};  
bibkey.LWd = 'Kirk2006';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Temperature in C for tL data is assumed to vary for t in d as T(t) = 10 + 10*cos(2*pi*(t-250)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'X0 sex-determination system: only 1 sex chromosome in males';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Hatching occurs in capsule';
metaData.bibkey.F2 = 'Kirk2006';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '56C5W'; % Cat of Life
metaData.links.id_ITIS = '70178'; % ITIS
metaData.links.id_EoL = '486019'; % Ency of Life
metaData.links.id_Wiki = 'Theodoxus_fluviatilis'; % Wikipedia
metaData.links.id_ADW = 'Theodoxus_fluviatilis'; % ADW
metaData.links.id_Taxo = '34969'; % Taxonomicon
metaData.links.id_WoRMS = '153558'; % WoRMS
metaData.links.id_molluscabase = '153558'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Theodoxus_fluviatilis}}';
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
bibkey = 'Kirk2006'; type = 'Article'; bib = [ ... 
'author = {J{\o}rn Kirkegaard}, ' ... 
'year = {2006}, ' ...
'title = {Life history, growth and production of \emph{Theodoxus fluviatilis} in {L}ake {E}srom, {D}enmark}, ' ...
'journal = {Limnologica}, ' ...
'volume = {36}, ' ...
'pages = {26-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

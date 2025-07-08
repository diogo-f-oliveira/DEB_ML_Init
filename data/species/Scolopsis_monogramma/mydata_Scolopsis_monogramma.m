  function [data, auxData, metaData, txtData, weights] = mydata_Scolopsis_monogramma
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Scolopsis_monogramma'; 
metaData.species_en = 'Monogrammed monocle bream '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 20];

%% set data

% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'AkitTach2014';   
  temp.am = C2K(28.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.64; units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'AkitTach2014'; 
data.Li = 38;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.8 mm: pi/6*0.08^3';
data.Wwp = 134.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01905*Lp^3.03';
data.Wwi = 1.16e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01905*Li^3.03';

data.GSI  = 0.07; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'AkitTach2014';   
  temp.GSI = C2K(28.2);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.244	11.598
0.259	8.736
0.277	9.575
0.278	9.970
0.296	10.217
0.296	10.562
0.423	13.178
0.452	8.195
0.473	10.810
0.991	16.190
0.993	17.818
1.042	14.315
1.042	14.759
1.043	15.105
1.061	15.894
1.101	19.546
1.150	16.240
1.184	15.303
1.185	15.698
1.275	17.770
1.290	15.155
1.291	15.945
1.397	16.291
1.398	17.475
1.399	18.215
1.451	17.130
1.487	17.475
1.539	16.735
1.558	18.561
1.839	16.983
1.894	18.809
1.942	14.862
1.945	17.230
1.957	12.345
1.982	18.316
2.002	20.882
2.085	16.343
2.106	19.057
2.107	19.649
2.136	14.715
2.137	15.109
2.192	17.231
2.214	20.587
2.246	18.268
2.247	19.107
2.263	17.577
2.298	17.232
2.302	20.538
2.317	17.972
2.334	17.725
2.439	16.986
2.456	16.640
2.473	15.851
2.525	15.506
2.526	16.295
2.528	17.529
2.530	19.256
2.580	16.542
2.618	19.503
2.634	18.121
2.635	18.417
2.666	14.667
2.703	16.691
2.723	18.615
2.757	17.727
2.783	24.536
2.825	15.162
2.827	17.234
2.830	19.158
2.831	19.849
2.847	18.418
2.865	18.714
2.899	18.122
2.915	16.445
2.918	18.813
2.920	20.738
2.970	18.369
2.989	19.850
3.025	20.491
3.041	18.764
3.093	17.827
3.093	18.024
3.094	18.863
3.126	16.347
3.166	19.900
3.234	17.976
3.235	18.568
3.235	18.913
3.237	20.393
3.238	20.887
3.269	17.532
3.360	19.950
3.361	20.493
3.428	18.026
3.449	20.098
3.466	19.556
3.468	21.875
3.519	20.099
3.533	16.891
3.534	18.076
3.553	18.816
3.557	22.714
3.642	19.556
3.644	21.037
3.644	21.382
3.713	20.001
3.749	20.346
3.800	18.768
3.837	20.692
3.871	19.015
3.872	20.297
3.907	19.804
3.908	21.087
3.998	22.321
4.013	20.051
4.032	21.334
4.102	20.446
4.135	18.325
4.156	21.631
4.187	17.832
4.189	19.805
4.191	20.940
4.240	18.079
4.241	19.115
4.258	18.572
4.261	20.496
4.262	21.483
4.276	18.079
4.314	20.645
4.384	19.855
4.416	17.882
4.452	18.030
4.455	20.349
4.474	21.533
4.506	18.820
4.525	20.497
4.578	19.758
4.581	22.323
4.612	19.363
4.614	20.695
4.630	19.166
4.667	20.794
4.721	21.633
4.736	19.413
4.770	18.722
4.806	19.068
4.826	21.091
4.842	19.857
4.861	20.992
4.898	21.979
4.932	21.239
4.983	19.216
4.984	20.253
4.986	22.078
5.003	21.832
5.018	19.562
5.090	20.500
5.126	21.191
5.144	21.536
5.200	23.905
5.229	18.477
5.283	19.563
5.304	22.178
5.372	19.859
5.460	20.255
5.530	19.317
5.583	19.762
5.602	20.255
5.621	21.390
5.815	21.638
5.831	19.861
5.832	20.799
5.864	18.579
5.865	19.516
5.869	22.378
5.883	19.763
5.920	20.503
5.936	19.664
6.041	18.777
6.042	19.813
6.044	20.997
6.096	20.257
6.130	19.073
6.149	20.702
6.166	20.011
6.235	18.383
6.237	20.702
6.289	19.715
6.305	18.432
6.361	20.604
6.362	21.788
6.412	18.828
6.449	20.801
6.588	18.828
6.765	18.977
6.784	20.655
6.819	19.717
6.961	20.606
6.981	22.333
7.015	21.988
7.047	19.126
7.050	21.593
7.067	21.199
7.121	21.742
7.136	19.127
7.277	19.719
7.384	20.263
7.524	19.474
7.579	21.250
7.595	19.770
7.596	20.362
7.684	20.066
7.861	20.412
7.864	23.176
7.900	23.719
7.949	20.166
8.002	20.561
8.074	21.499
8.090	19.969
8.108	20.907
8.110	22.535
8.159	19.131
8.248	19.970
8.371	19.477
8.372	20.069
8.514	20.761
8.638	21.304
8.797	21.156
8.813	20.268
8.904	21.897
9.062	21.355
9.838	21.013
10.773	20.572];
data.tL_f(:,1) = 365 * (0.4 + data.tL_f(:,1));
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-6;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length', 'female'};  
temp.tL_f = C2K(28.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AkitTach2014';
%
data.tL_m = [ ...
2.060	24.928
2.213	20.241
2.319	19.600
2.389	19.601
2.656	21.575
2.678	25.079
2.837	25.523
2.849	20.787
2.850	21.132
2.872	24.833
2.939	22.169
2.978	25.475
3.012	23.748
3.083	24.488
3.295	24.292
3.384	25.131
3.400	23.503
3.421	26.809
3.457	27.105
3.473	25.822
3.504	22.664
3.505	23.059
3.595	24.885
3.610	22.270
3.630	23.948
3.684	24.984
3.739	26.958
3.771	24.540
3.772	25.133
3.790	25.725
3.823	23.751
3.843	25.429
3.860	24.541
3.947	24.097
3.983	24.739
3.985	26.022
4.004	27.255
4.052	22.913
4.071	24.196
4.088	23.752
4.210	22.075
4.247	23.457
4.315	21.977
4.372	25.431
4.478	24.938
4.510	22.767
4.690	25.186
4.690	25.728
4.706	23.952
4.815	26.617
4.828	22.818
4.831	25.581
4.883	24.298
4.883	24.644
4.917	23.114
4.923	28.542
4.973	25.631
4.988	23.756
5.042	24.299
5.042	24.595
5.043	25.779
5.075	22.424
5.220	25.632
5.250	21.635
5.288	23.264
5.608	26.028
5.731	25.338
5.747	23.710
5.851	22.082
5.978	24.846
6.031	25.438
6.118	24.550
6.137	24.994
6.188	23.662
6.188	23.958
6.401	24.403
6.488	23.663
6.558	23.121
6.826	25.787
6.893	23.024
7.156	21.051
7.265	24.209
7.331	20.213
7.799	27.863
7.845	22.534
7.866	24.557
7.886	26.679
7.898	22.041
7.989	24.410
8.164	23.078
8.235	23.917
8.905	23.131
9.981	22.642];
data.tL_m(:,1) = 365 * (0.4 + data.tL_m(:,1));
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-6;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length', 'male'};  
temp.tL_m = C2K(28.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AkitTach2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01905*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VSTZ'; % Cat of Life
metaData.links.id_ITIS = '551002'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scolopsis_monogramma'; % Wikipedia
metaData.links.id_ADW = 'Scolopsis_monogramma'; % ADW
metaData.links.id_Taxo = '187051'; % Taxonomicon
metaData.links.id_WoRMS = '276788'; % WoRMS
metaData.links.id_fishbase = 'Scolopsis-monogramma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scolopsis_monogramma}}';  
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
bibkey = 'AkitTach2014'; type = 'article'; bib = [ ...  
'doi = {10.1007/s12562-014-0745-7}, ' ...
'author = {Yuichi Akita and Katsunori Tachihara}, ' ...
'year = {2014}, ' ...
'title = {Age, growth, maturity, and sex changes of monogrammed monocle bream \emph{Scolopsis monogramma} in the waters around {O}kinawa-jima {I}sland, {J}apan}, ' ... 
'journal = {Fish Sci.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scolopsis-monogramma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Myxus_elongatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Myxus_elongatus'; 
metaData.species_en = 'Sand grey mullet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 15];

%% set data
% zero-variate data

data.am = 12*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'KendGray2009';   
  temp.am = C2K(21.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 61;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^2.96, see F1';
data.Wwi = 649;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.96, see F1';
  
data.Ri  = 3.5e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Chelon_saliens';
  
% uni-variate data
% time-length
data.tL_LMf = [ ... % yr class (yr), total length (cm)
1.879	24.586
2.630	26.539
2.829	26.046
3.066	26.926
3.659	28.194
3.857	28.584
4.015	29.759
4.214	28.090
4.335	26.422
4.533	27.106
4.572	27.498
4.649	29.262
5.482	29.155
6.630	31.005
7.700	31.189
8.652	31.179];
data.tL_LMf(:,1) = (data.tL_LMf(:,1) + 0.8) * 365; % convert yr to d
for i=2:size(data.tL_LMf,1); if data.tL_LMf(i,1)<=data.tL_LMf(i-1,1);data.tL_LMf(i,1)=data.tL_LMf(i-1,1)+1e-3;end;end
units.tL_LMf   = {'d', 'cm'};  label.tL_LMf = {'time since birth', 'total length', 'female'};  bibkey.tL_LMf = 'KendGray2009';
temp.tL_LMf    = C2K(18.5);  units.temp.tL_LMf = 'K'; label.temp.tL_LMf = 'temperature';
comment.tL_LMf = 'Data for females from Lake Macquarie';
%
data.tL_LMm = [ ... % yr class (yr), total length (cm)
1.799	24.979
1.800	24.097
1.912	30.860
2.112	29.191
2.149	32.132
2.308	31.052
2.550	27.716
2.586	30.951
2.591	26.147
2.901	32.712
2.980	33.202
3.058	34.377
3.099	33.004
3.138	34.082
3.141	30.651
3.616	32.214
3.656	31.135
3.731	35.448
3.812	34.271
3.812	33.781
3.813	32.996
3.815	31.428
3.973	32.014
4.089	34.856
4.090	33.974
4.090	33.189
4.092	31.719
4.128	34.954
4.249	32.796
4.367	34.069
4.409	32.108
4.525	34.949
4.526	33.479
4.607	32.498
4.644	34.458
4.681	37.007
4.722	35.535
4.881	35.926
5.041	34.650
5.042	33.669
5.122	32.884
5.160	34.060
5.162	31.707
5.276	36.706
5.278	34.941
5.397	35.430
5.594	36.702
5.635	34.937
5.676	33.368
5.792	36.406
5.794	34.347
5.795	33.955
5.872	35.327
5.910	37.385
6.072	34.442
6.110	35.913
6.149	36.696
6.309	35.224
6.429	33.556
6.508	34.143
6.665	35.612
6.704	36.200
6.705	34.926
6.742	37.964
6.981	36.687
7.021	36.687
7.062	34.726
7.138	38.450
7.141	35.803
7.178	37.764
7.338	36.487
7.379	35.703
7.498	35.407
7.575	37.465
7.655	36.484
7.732	39.228
7.774	37.267
7.854	36.482
7.855	35.109
7.894	36.089
7.971	38.245
8.011	37.460
8.013	35.500
8.171	36.576
8.211	36.086
8.288	38.144
8.607	36.277
8.647	35.787
8.765	37.060
8.803	38.824
8.845	36.765
8.846	35.294
8.962	38.430
9.004	36.273
9.041	38.528
9.084	35.586
9.161	37.840
9.202	36.173
9.241	36.957
9.955	36.851
10.232	36.750
10.549	37.727
10.666	38.902
12.649	38.881];
data.tL_LMm(:,1) = (data.tL_LMm(:,1) + 0.8) * 365; % convert yr to d
for i=2:size(data.tL_LMm,1); if data.tL_LMm(i,1)<=data.tL_LMm(i-1,1);data.tL_LMm(i,1)=data.tL_LMm(i-1,1)+1e-3;end;end
units.tL_LMm   = {'d', 'cm'};  label.tL_LMm = {'time since birth', 'total length', 'male'};  bibkey.tL_LMm = 'KendGray2009';
temp.tL_LMm    = C2K(18.5);  units.temp.tL_LMm = 'K'; label.temp.tL_LMm = 'temperature';
comment.tL_LMm = 'Data for males from Lake Macquarie';
%
data.tL_SGBf = [ ... % yr class (yr), total length (cm)
0.856	20.364
1.530	23.204
1.807	25.163
1.811	20.751
1.888	23.300
1.890	21.829
2.129	21.926
2.443	26.140
2.565	23.590
2.606	22.217
2.644	24.080
2.646	22.315
2.802	25.648
2.804	23.295
2.842	24.863
2.964	22.706
3.597	26.624
3.795	27.799
3.877	25.544
3.955	27.014
4.073	28.582
4.196	25.248
4.235	26.620
4.274	26.914
4.473	26.815
4.475	25.246
4.551	28.873
4.632	27.010
4.671	27.892
4.673	26.128
4.871	27.009
5.389	26.908
5.428	28.280
5.429	26.418
5.430	25.927
5.510	25.241
5.668	26.906
5.827	26.611
5.865	28.572
5.947	26.905
6.025	27.885
6.224	28.178
6.463	27.883
6.464	26.902
6.465	26.510
6.582	28.862
6.702	27.979
6.744	25.528
6.862	26.998
6.940	29.351
7.220	27.682
7.259	28.957
7.339	28.172
7.341	26.309
7.417	30.132
7.420	27.191
7.459	28.269
7.579	27.680
7.696	29.444
7.738	27.778
8.176	27.187
8.415	27.284
9.369	28.945
10.443	30.116];
data.tL_SGBf(:,1) = (data.tL_SGBf(:,1) + 0.8) * 365; % convert yr to d
for i=2:size(data.tL_SGBf,1); if data.tL_SGBf(i,1)<=data.tL_SGBf(i-1,1);data.tL_SGBf(i,1)=data.tL_SGBf(i-1,1)+1e-3;end;end
units.tL_SGBf   = {'d', 'cm'};  label.tL_SGBf = {'time since birth', 'total length', 'female'};  bibkey.tL_SGBf = 'KendGray2009';
temp.tL_SGBf    = C2K(18.5);  units.temp.tL_SGBf = 'K'; label.temp.tL_SGBf = 'temperature';
comment.tL_SGBf = 'Data for females from St Georges Basin';
%
data.tL_SGBm = [ ... % yr class (yr), total length (cm)
0.852	23.795
0.935	21.246
1.610	22.811
1.848	23.692
2.007	24.279
2.008	22.711
2.045	25.848
2.125	25.161
2.319	30.356
2.321	28.395
2.642	26.727
2.880	27.020
2.918	29.470
2.920	26.627
3.076	30.156
3.078	28.783
3.436	28.291
3.474	30.154
3.712	31.035
3.714	29.564
3.715	28.780
3.715	28.388
3.751	32.015
3.873	29.367
3.909	33.289
3.952	30.249
4.028	33.876
4.071	30.641
4.149	32.209
4.150	31.327
4.268	32.698
4.389	31.815
4.548	31.520
4.589	30.442
4.705	33.971
4.707	32.402
4.748	30.735
4.906	32.107
4.947	31.028
4.983	34.361
5.106	31.615
5.304	32.595
5.347	29.261
5.383	33.183
5.425	30.633
5.464	31.712
5.583	32.397
5.585	30.044
5.620	35.436
5.701	33.573
5.740	34.455
5.743	31.612
5.744	30.043
5.823	31.121
5.861	33.376
5.901	32.493
5.943	30.827
6.059	34.257
6.140	32.492
6.142	30.531
6.219	33.668
6.221	31.707
6.221	31.315
6.298	34.354
6.377	34.844
6.419	32.883
6.577	33.568
6.615	35.431
6.618	32.097
6.620	30.921
6.656	34.548
6.738	31.607
6.896	33.272
6.972	37.095
7.013	35.331
7.013	35.331
7.015	34.056
7.054	34.546
7.058	30.232
7.133	35.036
7.251	36.604
7.252	35.917
7.256	31.996
7.413	34.348
7.414	32.681
7.451	35.622
7.453	33.760
7.456	30.818
7.612	34.641
7.651	35.425
7.653	32.974
7.693	32.484
7.731	34.444
7.814	31.601
7.931	33.757
8.009	35.815
8.010	34.639
8.129	34.932
8.171	33.069
8.287	36.500
8.288	35.324
8.329	33.853
8.408	34.735
8.410	32.480
8.411	32.088
8.449	33.362
8.491	31.695
8.610	32.087
8.686	35.027
8.847	34.144
8.884	36.301
9.004	36.006
9.045	34.535
9.164	35.123
9.165	33.848
9.321	37.377
9.402	36.102
9.483	34.729
9.484	33.454
9.681	35.610
10.119	35.804
10.758	33.840
10.795	36.584
11.354	35.797
11.831	36.089];
data.tL_SGBm(:,1) = (data.tL_SGBm(:,1) + 0.8) * 365; % convert yr to d
for i=2:size(data.tL_SGBm,1); if data.tL_SGBm(i,1)<=data.tL_SGBm(i-1,1);data.tL_SGBm(i,1)=data.tL_SGBm(i-1,1)+1e-3;end;end
units.tL_SGBm   = {'d', 'cm'};  label.tL_SGBm = {'time since birth', 'total length', 'male'};  bibkey.tL_SGBm = 'KendGray2009';
temp.tL_SGBm    = C2K(18.5);  units.temp.tL_SGBm = 'K'; label.temp.tL_SGBm = 'temperature';
comment.tL_SGBm = 'Data for males from St Georges Basin';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_LMf = 3 * weights.tL_LMf;
weights.tL_LMm = 3 * weights.tL_LMm;
weights.tL_SGBf = 3 * weights.tL_SGBf;
weights.tL_SGBm = 3 * weights.tL_SGBm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_LMf','tL_LMm'}; subtitle1 = {'Data for females, males from Lake Macquarie'};
set2 = {'tL_SGBf','tL_SGBm'}; subtitle2 = {'Data for females, males from  from St Georges Basin'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45HL5'; % Cat of Life
metaData.links.id_ITIS = '170403'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Myxus_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Myxus_elongatus'; % ADW
metaData.links.id_Taxo = '180687'; % Taxonomicon
metaData.links.id_WoRMS = '276971'; % WoRMS
metaData.links.id_fishbase = 'Myxus-elongatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myxus_elongatus}}';
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
bibkey = 'KendGray2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2009.02485.x}, ' ...
'author = {B. W. Kendall and C. A. Gray and D. Bucher}, ' ... 
'year = {2009}, ' ...
'title = {Age validation and variation in growth, mortality and population structure of \emph{Liza argentea} and \emph{Myxus elongatus} ({M}ugilidae) in two temperate {A}ustralian estuaries}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {75}, ' ...
'pages = {2788–2804}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Myxus-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


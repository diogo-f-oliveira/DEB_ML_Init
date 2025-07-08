function [data, auxData, metaData, txtData, weights] = mydata_Psettodes_erumei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Psettodidae';
metaData.species    = 'Psettodes_erumei'; 
metaData.species_en = 'Indian halibut'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSE','MI'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 07];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulPaod2021';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 38; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 64; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';     bibkey.Li  = 'fishbase';

data.Wwb = 1.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RamaRama1969';
  comment.Wwb = 'based on egg diameter of 0.69 mm: pi/6*0.069^3'; 
data.Wwp = 617; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00676*Lp^3.14, see F1';
data.Wwi = 3.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 9 kg; based on 0.00676*Li^3.14, see F1, gives 3.2 kg';

data.Ri = 1.3e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), total length(cm)
0.430	16.733
0.574	19.223
0.610	13.845
0.645	20.717
0.645	18.028
0.645	14.641
0.681	21.514
0.717	19.920
0.717	19.124
0.717	17.231
0.753	20.518
0.861	14.641
0.861	15.538
0.896	15.339
0.932	17.829
0.932	16.036
1.542	29.283
1.614	30.976
1.649	28.287
1.685	28.984
1.685	23.506
1.685	22.510
1.721	29.681
1.757	25.000
1.936	30.478
2.259	34.363
2.438	32.669
2.438	30.279
2.474	33.765
2.474	27.191
2.510	28.984
2.546	33.566
2.582	26.295
2.653	29.582
2.689	33.964
2.689	25.797
2.761	31.673
2.797	27.988
2.904	34.661
2.940	39.442
2.976	38.048
3.012	34.960
3.120	30.478
3.191	35.558
3.191	31.972
3.191	34.761
3.263	36.454
3.335	35.060
3.406	31.773
3.406	29.283
3.442	30.976
3.442	31.574
3.442	33.367
3.514	37.649
3.550	36.056
3.550	28.386
3.622	30.179
3.657	34.761
3.729	34.960
3.765	38.247
3.837	37.550
3.837	32.271
3.837	37.052
3.873	39.741
3.873	33.068
3.873	27.689
3.908	31.275
3.908	35.857
3.944	37.351
4.016	33.964
4.052	30.677
4.052	34.960
4.124	34.363
4.267	39.542
4.267	38.147
4.303	37.450
4.375	32.171
4.410	35.159
4.446	38.745
4.518	32.669
4.554	30.080
4.590	38.347
4.590	37.251
4.625	29.482
4.697	35.159
4.769	31.574
4.769	33.167
4.805	39.243
4.805	34.761
4.841	42.729
5.020	32.171
5.056	39.542
5.056	39.044
5.056	37.749
5.092	36.554
5.092	34.562
5.127	41.235
5.127	34.064
5.199	43.327
5.199	40.438
5.199	35.857
5.307	42.231
5.450	37.450
5.450	32.968
5.594	37.849
5.594	30.976
5.629	40.040
5.665	36.952
5.737	34.960
5.773	40.837
5.773	30.777
5.809	32.072
5.845	39.044
5.845	36.653
5.916	37.052
6.024	37.948
6.096	32.769
6.131	41.036
6.167	46.614
6.382	36.155
6.418	37.550
6.562	35.259
6.669	41.135
6.669	36.056
6.849	40.538
6.920	37.948
7.028	41.932
7.171	43.327
7.279	39.143
7.351	40.737
7.602	31.972
7.673	46.912
7.709	37.749
7.781	37.948
8.104	43.426
8.104	37.052
8.211	42.032
8.283	44.422
8.390	39.442
8.713	39.442
8.821	37.849
8.821	43.625
9.108	40.239
9.287	36.454
11.689	40.239];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(28.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulPaod2021';
%
data.tL_m = [ ... % % time since birth (d), total length(cm)
0.541	20.916
0.577	12.450
0.613	20.319
0.685	19.821
0.685	18.825
0.685	17.530
0.685	14.243
0.721	14.940
0.758	16.534
0.794	15.837
0.902	18.127
0.902	16.135
1.299	25.598
1.587	27.291
1.731	28.984
2.056	26.793
2.164	25.199
2.164	26.295
2.236	29.980
2.273	27.390
2.381	28.586
2.489	26.394
2.525	30.677
2.561	25.598
2.597	29.582
2.633	28.586
2.669	33.964
2.705	29.482
2.814	31.673
2.814	29.183
2.814	25.199
2.814	27.490
2.886	27.191
2.994	31.773
2.994	30.677
3.102	31.076
3.102	28.287
3.138	28.486
3.138	26.693
3.174	29.681
3.355	32.371
3.463	31.076
3.499	30.378
3.535	27.888
3.643	32.271
3.643	26.195
3.643	27.092
3.679	29.283
3.715	29.482
3.788	33.267
3.824	32.470
3.896	30.777
3.896	28.586
3.932	30.777
3.968	29.781
4.040	28.386
4.040	27.590
4.112	27.092
4.220	31.175
4.257	27.590
4.257	28.984
4.257	29.681
4.509	29.980
4.653	32.968
4.653	26.992
4.725	31.275
4.762	33.964
4.906	28.586
4.942	29.681
5.014	31.773
5.050	33.167
5.158	30.976
5.194	30.279
5.375	31.873
5.411	32.669
5.483	30.777
5.483	31.375
5.519	28.984
5.627	29.183
5.988	32.869
5.988	29.681
6.168	31.873
6.168	30.578
6.168	27.888
6.277	28.287
6.313	34.163
6.385	33.068
6.385	32.570
6.457	29.781
6.565	30.976
6.637	37.749
6.709	34.263
6.854	32.171
6.998	32.769
6.998	29.183
7.070	30.677
7.106	33.267
7.287	33.167
7.503	30.080
7.756	32.171
7.828	29.382
8.152	31.972
8.224	35.558
8.224	32.470
8.477	32.669
8.549	30.777
8.729	31.574
8.802	33.964
8.838	32.769
9.054	34.661
9.198	30.677
9.198	32.371
9.451	35.159
9.703	30.080
9.848	31.375
9.992	38.048
10.100	33.267
10.317	35.458
11.363	31.673
11.363	32.371
16.377	35.259];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','females'};  
temp.tL_m    = C2K(28.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulPaod2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00676*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NT25'; % Cat of Life
metaData.links.id_ITIS = '168556'; % ITIS
metaData.links.id_EoL = '46580695'; % Ency of Life
metaData.links.id_Wiki = 'Psettodes_erumei'; % Wikipedia
metaData.links.id_ADW = 'Psettodes_erumei'; % ADW
metaData.links.id_Taxo = '178032'; % Taxonomicon
metaData.links.id_WoRMS = '218381'; % WoRMS
metaData.links.id_fishbase = 'Psettodes-erumei'; % fishbase642960

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psettodes_erumei}}';
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
bibkey = 'CoulPaod2021'; type = 'Article'; bib = [ ... 
'doi = {10.7755/FB.119.2-3.6}, ' ...
'author = {Peter G. Coulson and Jake A. Poad}, ' ... 
'year = {2021}, ' ...
'title = {Biological characteristics of the primitive flatfish {I}ndian halibut (\emph{Psettodes erumei}) from the tropical northeastern {I}ndian {O}cean, including implications of the use of incorrect aging methods on mortality estimates}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {}, ' ...
'pages = {168-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamaRama1969'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0044-8486(79)90018-8}, ' ...
'author = {N. Ramanathan and R. Natarajan}, ' ... 
'year = {1969}, ' ...
'title = {BREEDING BIOLOGY OF \emph{Psettodes erumei} ({B}LOCH \& {S}CHN.) AND \emph{Pseudorhobus arsius} ({H}AM. {B}UCH.) {P}ISCES: {P}LEURONECTIFORMES ALONG {P}ORTO {N}OVO {C}OAST ({S}. {I}NDIA)}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {18(3)}, ' ...
'pages = {269-282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/Psettodes-erumei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

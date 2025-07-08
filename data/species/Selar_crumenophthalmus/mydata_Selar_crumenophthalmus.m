function [data, auxData, metaData, txtData, weights] = mydata_Selar_crumenophthalmus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Selar_crumenophthalmus'; 
metaData.species_en = 'Bigeye scad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc','0iMr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't_Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 03];

%% set data
% zero-variate data
data.ab = 2.7;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 17.7; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 70;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.12e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'WelcHoen2013';
  comment.Wwb = 'based on egg diameter of 0.74 mm : pi/6*0.074^3';
data.Wwi = 4.25e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01349*Li^2.98, see F1';

data.Ri  = 262000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
260.910	14.871
290.233	16.991
322.945	17.357
351.484	18.950
381.786	18.614
413.657	19.331
445.561	19.521
475.760	20.764];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHari1986';
%
data.tLj = [ ... % time since hatch (d), std length (cm)
1.752	0.224
2.623	0.239
2.842	0.280
4.040	0.253
4.584	0.253
4.911	0.253
5.130	0.295
5.565	0.267
6.219	0.295
6.220	0.337
6.765	0.379
6.981	0.254
6.982	0.323
8.180	0.310
8.290	0.352
8.291	0.435
8.943	0.352
9.162	0.408
9.163	0.450
9.706	0.366
9.816	0.394
11.124	0.464
11.126	0.548
11.345	0.646
11.886	0.422
11.888	0.534
11.995	0.450
12.107	0.590
12.108	0.646
12.759	0.520
12.867	0.479
13.196	0.604
13.848	0.521
13.849	0.577
13.959	0.591
14.065	0.423
14.178	0.646
15.049	0.675
15.156	0.549
15.157	0.591
15.264	0.493
15.809	0.507
15.810	0.563
16.138	0.633
16.139	0.689
17.007	0.508
17.009	0.605
17.011	0.731
17.226	0.550
17.228	0.647
17.991	0.703
18.101	0.773
18.102	0.815
19.078	0.578
19.080	0.690
19.188	0.620
19.191	0.773
19.193	0.899
19.404	0.522
19.952	0.690
19.953	0.746
19.954	0.801
20.063	0.843
20.823	0.690
20.929	0.537
21.037	0.453
21.148	0.606
21.152	0.788
22.895	0.816
23.009	1.081
23.111	0.691
23.112	0.733
23.115	0.900
23.225	0.956
23.337	1.151
23.982	0.677
24.099	1.096
24.101	1.221
24.202	0.789
26.954	2.366
37.121	4.378
42.130	4.268
42.138	4.687
42.901	4.729
43.114	4.450
43.311	3.320
44.738	3.934
44.838	3.432
44.839	3.501
44.841	3.585
44.862	4.771
44.943	3.195
44.944	3.264
44.971	4.729
44.978	5.162
44.985	5.497
45.045	2.818
45.046	2.874
45.063	3.795
45.075	4.478
45.082	4.841
45.099	5.776
45.100	5.846
45.180	4.255
45.204	5.609
45.296	4.646
45.311	5.469
45.322	6.083];
units.tLj = {'d', 'cm'};  label.tLj = {'time since birth', 'std length'}; 
temp.tLj = C2K(21); units.temp.tLj = 'K'; label.temp.tLj = 'temperature';
bibkey.tLj = 'WelcHoen2013'; comment.tLj = 'data from culture';

data.LWj = [ ... % time since hatch (d), std length (cm)
3.275	0.055
3.558	0.195
3.817	0.264
4.076	0.546
4.476	0.615
4.594	1.250
4.688	0.755
4.712	0.897
4.736	0.685
4.901	0.684
5.065	0.966
5.183	0.965
5.183	1.318
5.301	1.318
5.325	1.177
5.490	1.458
5.607	1.387
5.702	1.881
5.702	1.316
5.725	2.587
5.866	1.386
6.008	1.810
6.173	2.374
6.267	1.597
6.408	1.879
6.503	2.302
6.620	2.019
6.715	2.442
6.785	3.007
6.832	2.513
6.856	3.995
6.974	3.571
6.974	3.006
7.092	5.195
7.115	2.653
7.327	2.934
7.421	4.558
7.421	3.216
7.492	3.640
7.586	3.569
7.681	3.710
7.798	3.639
7.846	6.110
7.846	4.274
7.916	4.344
8.034	5.121
8.105	3.991
8.152	4.343
8.293	4.272
8.340	4.908
8.340	4.766
8.411	6.108
8.482	6.320
8.812	7.095
8.929	6.459
8.953	5.753
9.118	7.588
9.236	5.540
9.448	8.505
9.448	6.386
9.471	5.963
9.495	7.022
9.495	7.516
9.707	10.411
9.730	9.563
9.872	5.608
9.895	6.173
9.919	14.294
10.013	7.302
10.131	9.774
10.154	10.127
10.249	13.516
10.296	14.010
10.319	9.208
10.343	10.903
10.414	9.419
10.461	10.690
10.579	11.537
10.579	9.419
10.602	11.961
10.626	10.195
10.791	12.737
10.932	10.194
10.979	10.688
11.026	11.324
11.073	11.606
11.120	14.643
11.191	12.665
11.215	14.360
11.238	12.947
11.262	13.300
11.356	14.854
11.356	12.594
11.474	15.277
11.497	16.689
11.545	17.183
11.545	16.053
11.545	14.358
11.592	17.395
11.592	13.158
11.733	19.160
11.757	17.182
11.780	13.510
11.851	15.982
11.874	18.241
11.874	16.617
11.921	16.758
11.945	11.461
11.945	12.874
11.969	15.416
12.039	16.546
12.110	18.664
12.110	14.709
12.204	21.277
12.204	16.969
12.204	15.627
12.251	20.641
12.251	17.039
12.298	20.641
12.298	14.497
12.322	18.734
12.393	20.075
12.487	21.770
12.487	21.205
12.510	19.439
12.510	17.956
12.534	18.945
12.558	29.821
12.581	19.227
12.652	20.074
12.675	23.182
12.675	19.933
12.746	18.309
12.770	21.486
12.793	25.370
12.817	22.404
12.840	19.438
12.935	22.051
12.958	26.712
12.958	20.285
12.982	22.192
12.982	21.344
13.029	24.451
13.029	21.627
13.052	22.050
13.076	22.827
13.147	20.426
13.170	27.205
13.170	23.109
13.170	21.061
13.194	31.654
13.194	25.651
13.217	20.990
13.241	21.555
13.288	23.744
13.288	21.696
13.335	25.933
13.335	22.332
13.359	23.038
13.382	20.707
13.406	23.179
13.429	24.379
13.429	23.249
13.453	26.145
13.453	21.978
13.476	27.698
13.500	25.226
13.547	23.602
13.547	21.483
13.594	25.862
13.618	22.613
13.665	27.062
13.688	24.731
13.759	23.107
13.759	24.025
13.759	26.920
13.901	24.731
13.901	26.779
13.901	27.132
13.948	26.002
13.971	25.719
14.018	31.722
14.042	31.580
14.042	16.538
14.089	25.648
14.113	29.108
14.136	30.026
14.207	27.413
14.230	30.026
14.254	29.814
14.277	29.108
14.301	32.144
14.325	25.718
14.348	31.297
14.372	28.472
14.442	26.494
14.466	23.740
14.513	35.251
14.513	26.776
14.560	36.169
14.607	29.671
14.631	32.214
14.654	34.544
14.654	31.790
14.702	33.202
14.702	28.823
14.749	34.897
14.772	33.131
14.772	32.284
14.796	33.413
14.843	31.012
14.890	35.037
14.890	26.845
14.914	33.272
14.961	33.978
14.961	32.636
15.008	37.297
15.055	33.836
15.173	30.163
15.526	37.719
15.573	39.201
15.762	38.565
15.903	42.378
15.997	39.623
16.092	41.812
16.257	43.083];
units.LWj = {'cm', 'g'};  label.LWj = {'total length', 'weight'}; 
bibkey.LWj = 'WelcHoen2013'; comment.LWj = 'data from culture';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WD4V'; % Cat of Life
metaData.links.id_ITIS = '168677'; % ITIS
metaData.links.id_EoL = '66646630'; % Ency of Life
metaData.links.id_Wiki = 'Selar_crumenophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Selar_crumenophthalmus'; % ADW
metaData.links.id_Taxo = '106169'; % Taxonomicon
metaData.links.id_WoRMS = '159646'; % WoRMS
metaData.links.id_fishbase = 'Selar-crumenophthalmus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Selar_crumenophthalmus}}';  
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
bibkey = 'DwipHari1986'; type = 'techreport'; bib = [ ... 
'author = {Dwiponggo, A. and Hariati, T. and Banon, S. and Palomares, M L D and Pauly, Daniel}, ' ... 
'year = {1986}, ' ...
'title = {Growth, mortality and recruitment of commercially important fishes and penaed shrimps in {I}ndonesian waters}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'series = {ICLARM Technical Reports}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'WelcHoen2013'; type = 'article'; bib = [ ... 
'author = {Aaron Welch and Ronald Hoenig and John Stieglitz and Zach Daugherty and Bruno Sardenberg and Sasa Miralao and Dan Farkas and Dan Benetti}, ' ... 
'year = {2013}, ' ...
'title = {Growth rates of larval and juvenile bigeye scad \emph{Selar crumenophthalmus} in captivity}, ' ...
'journal = {SpringerPlus}, ' ...
'pages = {634}, ' ...
'volume = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Selar-crumenophthalmus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

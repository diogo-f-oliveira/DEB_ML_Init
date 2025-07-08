function [data, auxData, metaData, txtData, weights] = mydata_Clupanodon_thrissa
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Clupanodon_thrissa'; 
metaData.species_en = 'Chinese gizzard shad '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 21];

%% set data
% zero-variate data;

data.ab = 5.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 12;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 26; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm: pi/6*0.25^3';
  
% uni-variate data

% time-length-weight data
data.tLW = [ % time since birth (yr), std length (cm), weight (g)
    0 14.872  57.90
    1 16.047  72.27
    2 16.953  85.87
    3 17.348  91.51
    4 17.624  96.55
    5 17.724 116.71];
data.tLW(:,1) = (data.tLW(:,1)+1.9)*365; % convert yr to d, set origin at birth
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(27.4);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ZhanYuan2023'; treat.tLW = {1 {'std length','weight'}};

% length-weight
data.LW_f = [ ... % std length (cm), weight (g)
11.149	24.437
11.369	26.089
12.047	33.786
12.094	34.610
12.441	32.151
12.740	38.192
13.088	33.814
13.292	39.030
13.371	40.129
13.592	42.603
13.655	42.056
13.734	38.768
13.971	38.226
14.159	47.280
14.223	40.152
14.380	49.206
14.553	46.743
14.600	54.148
14.676	77.733
14.725	62.652
14.726	51.958
14.979	51.416
14.994	57.450
14.995	46.755
15.056	66.226
15.104	61.566
15.168	52.518
15.182	71.440
15.184	49.502
15.277	62.668
15.308	72.540
15.656	62.952
15.954	81.059
15.986	70.091
16.002	73.382
16.066	63.786
16.096	76.675
16.096	73.933
16.098	54.463
16.127	77.773
16.222	75.856
16.271	67.082
16.316	88.747
16.331	92.861
16.348	77.231
16.364	74.763
16.381	70.925
16.411	80.797
16.444	71.749
16.444	71.475
16.521	85.736
16.553	84.366
16.585	74.221
16.632	78.061
16.678	92.322
16.695	82.999
16.805	84.922
16.838	68.195
16.883	93.150
16.916	78.069
16.946	90.958
16.946	90.958
16.962	87.942
17.056	101.382
17.056	95.349
17.103	105.222
17.134	102.481
17.135	93.431
17.216	76.432
17.229	102.483
17.230	90.418
17.244	104.952
17.307	109.067
17.355	101.116
17.357	87.953
17.371	103.036
17.402	104.408
17.419	95.907
17.450	100.021
17.452	86.036
17.481	103.313
17.495	120.589
17.497	105.781
17.514	93.990
17.515	80.279
17.561	96.734
17.562	84.120
17.592	99.203
17.609	88.234
17.610	82.750
17.641	83.025
17.654	110.448
17.765	103.595
17.767	88.239
17.783	87.416
17.796	113.468
17.798	90.159
17.830	83.304
17.861	89.887
17.875	109.082
17.891	101.953
17.923	106.067
17.941	80.839
17.970	101.955
17.972	85.776
17.986	105.521
18.020	82.761
18.035	90.714
18.066	88.247
18.067	83.311
18.113	92.910
18.114	89.071
18.114	85.506
18.143	111.284
18.144	101.412
18.176	99.767
18.192	89.621
18.239	95.930
18.255	97.027
18.269	110.190
18.270	98.947
18.302	94.012
18.331	124.451
18.332	109.095
18.333	99.223
18.334	97.029
18.348	112.112
18.395	111.016
18.412	106.629
18.445	87.435
18.459	100.323
18.460	93.194
18.506	107.454
18.506	107.454
18.522	103.342
18.553	112.666
18.553	110.472
18.553	109.924
18.585	102.246
18.614	129.121
18.616	107.457
18.632	114.039
18.664	102.523
18.665	95.941
18.680	106.088
18.694	119.525
18.773	117.608
18.775	102.800
18.791	95.671
18.803	137.079
18.820	121.997
18.868	115.143
18.901	99.239
18.916	109.385
18.978	118.436
19.042	108.840
19.073	114.051
19.089	111.584
19.214	126.669
19.275	148.883
19.436	116.804
19.437	106.109
19.467	122.837
19.497	134.904
19.497	132.436
19.545	124.485
19.610	112.969
19.672	120.923
19.875	138.753
19.907	132.173
19.938	135.190
19.988	110.786
20.129	119.839
20.349	126.975
20.412	133.558
20.601	129.998
20.634	122.047
20.681	121.225];
units.LW_f = {'cm', 'g'};  label.LW_f = {'std length', 'weight', 'females'};  
bibkey.LW_f = 'ZhanYuan2023'; 
%
data.LW_m = [ ...
11.984	28.299
12.205	33.241
12.253	25.565
12.379	29.681
12.567	35.994
12.662	32.157
12.725	31.062
12.788	34.629
13.009	33.538
13.214	34.366
13.387	37.661
13.466	37.389
13.717	46.720
13.844	45.078
14.144	44.264
14.239	40.701
14.253	57.703
14.253	51.945
14.269	48.380
14.347	55.512
14.586	40.437
14.615	56.617
14.646	65.392
14.727	49.216
14.820	62.381
14.869	46.751
14.914	64.303
14.931	55.528
15.197	74.457
15.247	48.956
15.262	57.731
15.355	69.525
15.388	59.928
15.389	53.073
15.482	65.690
15.513	72.272
15.547	49.786
15.561	66.240
15.610	48.966
15.623	74.194
15.624	61.854
15.625	57.741
15.685	81.326
15.702	69.809
15.719	61.583
15.748	84.070
15.750	68.988
15.765	75.295
15.782	59.391
15.810	94.492
15.845	65.425
15.859	79.685
15.938	83.527
15.939	66.251
15.970	72.284
16.003	61.591
16.019	58.300
16.020	54.461
16.033	78.867
16.034	64.608
16.082	62.964
16.082	59.399
16.113	65.433
16.208	62.967
16.253	84.084
16.285	80.520
16.332	78.327
16.363	86.006
16.397	65.989
16.429	59.957
16.476	64.894
16.489	89.575
16.553	81.350
16.586	69.559
16.586	62.703
16.665	61.335
16.726	87.662
16.740	99.454
16.743	77.516
16.743	71.209
16.757	93.695
16.835	95.343
16.932	73.956
17.010	85.750
17.151	98.368
17.200	79.996
17.372	92.890
17.420	89.874
17.514	87.957
17.547	79.457
17.687	101.125
17.781	98.934
17.798	95.369
17.971	98.116
18.256	82.219
18.270	105.254
18.477	86.338
18.884	112.675
19.089	115.697];
units.LW_m = {'cm', 'g'};  label.LW_m = {'std length', 'weight', 'males'};  
bibkey.LW_m = 'ZhanYuan2023'; 
    
% length-fecundity
data.LN = [ ... 
16.047	18768.900
16.047	6267.889
16.047	2433.414
16.953	27201.628
16.953	3367.452
16.953	18533.892
16.953	32033.690
16.953	4533.502
16.953	20533.262
16.953	30866.441
16.953	33033.075
16.953	5866.216
16.953	10366.149
16.953	12532.783
16.953	22032.640
16.953	8364.980
17.348	4635.419
17.348	10968.658
17.348	5800.869
17.348	48300.832
17.348	18467.346
17.348	3466.971
17.348	7966.304
17.348	9466.282
17.348	11799.580
17.348	17466.162
17.348	19632.796
17.348	53965.615
17.348	28465.398
17.348	1631.867
17.348	46298.464
17.348	16798.306
17.348	59131.605
17.348	63631.537
17.348	52797.767
17.6240	6901.572
17.624	17900.808
17.624	3400.426
17.624	4566.475
17.624	33732.705
17.624	37399.317
17.624	72564.857
17.724	20664.555];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(27.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ZhanYuan2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.tLW(end,2) = 0; % ignore last weight point
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'I had to add 1 yr to age-estimates to arrive at a good fit for tL and tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00933*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WCNG'; % Cat of Life
metaData.links.id_ITIS = '161811'; % ITIS
metaData.links.id_EoL = '46562502'; % Ency of Life
metaData.links.id_Wiki = 'Clupanodon_thrissa'; % Wikipedia
metaData.links.id_ADW = 'Clupanodon_thrissa'; % ADW
metaData.links.id_Taxo = '171465'; % Taxonomicon
metaData.links.id_WoRMS = '280223'; % WoRMS
metaData.links.id_fishbase = 'Clupanodon-thrissa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clupanodon_thrissa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseud46562424odata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhanYuan2023'; type = 'Article'; bib = [ ...
'doi = {10.7541/2023.2022.0036}, ' ...
'author = {Zhang, Cui-Ping and Yuan, Li-Mei and Wu, Yu-Xin and Ye, Zhi-Quan and Chen, Xiao-Ying and Lai, Xing-Xing and Li, Qiang and Shu, Hu}, ' ... 
'year = {2023}, ' ...
'title = {BIOLOGICAL CHARACTERISTICS OF \emph{Clupanodon thrissa} IN {P}EARL {R}IVER ESTUARY}, ' ...
'journal = {Acta Hydrobiologica Sinica}, ' ...
'volume = {47(4)}, ' ...
'pages = {637-647}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Clupanodon_thrissa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  

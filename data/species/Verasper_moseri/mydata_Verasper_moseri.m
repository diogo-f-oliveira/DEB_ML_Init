function [data, auxData, metaData, txtData, weights] = mydata_Verasper_moseri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Verasper_moseri'; 
metaData.species_en = 'Barfin flounder'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.1); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 02];

%% set data
% zero-variate data
data.ab = 35;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(2.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(2.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 31;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 70;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.09 mm of Microstomus kitt: pi/6*0.09^3';
data.Wwp = 379;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01148*Lp^3.09, see F1';
data.Wwi = 3.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';       bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01148*Li^3.09, see F1; max published weight 4 kg';

data.Ri = 1.2e6/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';    bibkey.Ri = 'WataMina2000';  
  temp.Ri = C2K(2.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ Length (cm)
1.154	22.377
1.185	19.798
1.186	17.402
1.186	16.665
1.193	29.015
1.216	18.694
1.235	21.829
1.236	15.746
1.264	26.070
1.264	25.702
1.295	24.045
1.334	26.812
1.335	25.153
1.365	27.551
1.375	24.418
1.377	19.994
1.394	31.055
1.405	28.475
1.407	18.706
1.435	28.661
1.436	25.159
1.467	21.659
1.474	33.456
1.476	27.005
1.485	28.112
1.494	34.195
1.495	31.061
1.495	28.297
1.527	23.137
1.546	29.406
1.547	24.797
1.554	35.305
1.556	26.273
1.565	32.909
1.567	25.352
1.575	31.251
1.575	31.251
1.576	30.145
1.587	24.247
1.605	32.359
1.615	35.493
1.615	32.728
1.646	31.255
1.960	26.113
1.998	34.410
2.030	28.698
2.039	30.358
2.061	26.119
2.061	24.645
2.069	31.650
2.080	27.779
2.089	34.600
2.089	33.126
2.110	30.362
2.131	29.073
2.151	29.443
2.151	27.046
2.169	35.711
2.190	31.657
2.209	39.400
2.211	31.658
2.230	36.452
2.230	33.872
2.239	40.508
2.249	37.559
2.261	32.767
2.261	32.767
2.279	41.064
2.309	42.909
2.310	35.904
2.328	44.569
2.330	37.564
2.330	36.274
2.332	31.482
2.351	32.957
2.361	33.695
2.362	32.589
2.370	40.147
2.381	36.462
2.389	42.914
2.400	39.965
2.403	28.352
2.409	43.652
2.441	36.465
2.452	34.623
2.471	40.338
2.471	38.495
2.480	41.813
2.491	38.865
2.493	32.782
2.499	46.607
2.533	34.443
2.540	44.398
2.543	34.628
2.543	33.338
2.551	40.896
2.560	44.399
2.564	31.311
2.572	39.054
2.583	32.787
2.591	41.451
2.612	37.582
2.693	39.246
3.013	48.298
3.022	53.091
3.025	39.635
3.044	46.640
3.074	47.380
3.076	38.716
3.084	45.721
3.125	42.590
3.135	44.434
3.155	44.435
3.156	40.380
3.185	45.728
3.195	47.203
3.195	45.175
3.204	49.784
3.205	47.756
3.206	43.517
3.206	43.517
3.209	31.535
3.215	47.941
3.218	37.435
3.228	35.592
3.234	51.629
3.308	38.730
3.334	55.138
3.354	55.692
3.355	52.374
3.364	56.798
3.365	54.033
3.365	54.033
3.376	46.845
3.377	44.818
3.386	49.611
3.396	48.505
3.406	49.059
3.414	59.198
3.468	43.349
3.487	48.511
3.498	46.300
3.504	60.678
3.509	41.323
3.517	50.356
3.527	50.725
3.527	49.251
3.528	47.408
3.535	58.468
3.556	56.626
3.556	55.889
3.561	34.506
3.566	54.599
3.566	53.309
3.597	52.389
3.607	52.389
3.659	44.282
4.009	56.838
4.018	61.078
4.040	53.153
4.041	52.232
4.079	60.160
4.123	43.758
4.221	58.694
4.343	52.435
4.361	60.546
4.371	62.390
4.373	53.358
4.391	64.419
4.396	41.009
4.401	61.470
4.402	59.259
4.422	58.154
4.441	63.132
4.442	59.077
4.462	62.027
4.462	59.447
4.486	47.651
4.492	62.029
4.514	55.947
4.533	60.188
4.551	65.904
4.562	62.771
4.573	60.744
5.057	58.930
5.058	57.824
5.097	60.223
5.118	57.091
5.119	56.722
5.138	60.041
5.179	55.988
5.379	64.111
5.419	64.851
5.459	65.406
5.548	72.048
5.571	63.754];
data.tL_f(:,1) = 365 * (0.2+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-6;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(2.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShikTaka2012'; 
%
data.tL_m = [ ... % age (years) ~ Length (cm)
1.382	28.591
1.382	22.522
1.392	21.787
1.402	21.052
1.402	20.500
1.412	20.133
1.432	23.445
1.452	29.699
1.452	27.676
1.523	27.496
1.543	35.406
1.543	29.520
1.553	25.475
1.563	33.384
1.563	33.384
1.563	30.257
1.563	26.763
1.563	20.142
1.573	27.499
1.603	24.191
1.603	23.087
1.613	31.180
1.966	30.282
1.997	29.732
2.017	28.078
2.027	26.608
2.047	25.321
2.047	24.954
2.047	32.494
2.047	31.023
2.067	24.035
2.097	38.014
2.097	32.313
2.128	35.993
2.148	27.718
2.158	33.604
2.168	30.662
2.178	35.996
2.188	30.847
2.188	27.721
2.198	29.193
2.208	37.653
2.229	34.160
2.289	33.796
2.299	35.452
2.299	36.923
2.309	36.004
2.319	30.304
2.319	32.695
2.329	36.373
2.339	40.420
2.380	31.411
2.390	44.101
2.390	27.366
2.400	38.217
2.400	27.918
2.410	45.758
2.410	42.079
2.420	39.689
2.430	35.092
2.450	36.749
2.450	40.059
2.450	31.047
2.471	33.991
2.471	33.439
2.471	31.600
2.491	42.452
2.491	38.222
2.501	30.867
2.511	35.465
2.521	38.592
2.521	43.374
2.541	31.237
2.541	33.628
2.541	33.628
2.541	45.030
2.551	40.065
2.551	41.352
2.551	41.352
2.602	30.689
2.612	37.126
2.612	41.908
2.662	40.072
3.066	30.717
3.096	43.409
3.106	34.398
3.126	41.939
3.126	34.583
3.126	34.583
3.126	37.526
3.146	36.975
3.156	42.493
3.166	39.551
3.176	37.345
3.187	35.690
3.197	36.794
3.217	37.899
3.227	32.382
3.237	43.969
3.297	42.134
3.348	42.505
3.358	42.137
3.388	45.818
3.388	44.898
3.429	46.740
3.439	39.384
3.459	38.098
3.469	43.432
3.479	47.478
3.479	47.478
3.489	42.146
3.499	40.675
3.509	48.951
3.509	44.721
3.529	46.194
3.539	43.436
3.671	47.858
4.034	41.259
4.407	54.524
4.497	42.207
4.518	46.622
4.649	41.481];
data.tL_m(:,1) = 365 * (0.2+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-6;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m = C2K(2.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShikTaka2012'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01148*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7FNJ8'; % Cat of Life
metaData.links.id_ITIS = '616033'; % ITIS
metaData.links.id_EoL = '46570178'; % Ency of Life
metaData.links.id_Wiki = 'Verasper_moseri'; % Wikipedia
metaData.links.id_ADW = 'Verasper_moseri'; % ADW
metaData.links.id_Taxo = '189982'; % Taxonomicon
metaData.links.id_WoRMS = '283141'; % WoRMS
metaData.links.id_fishbase = 'Verasper-moseri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Verasper_moseri}}';
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
bibkey = 'ShikTaka2012'; type = 'article'; bib = [ ...
'doi = {10.2331/suisan.78.1170 }, ' ...
'author = {Shikishima, Y. and T. Takatsu and T. Takashi and M. Ninomiya and S. Sakai and H. Ichinose and T. Morioka and M. Sasaki}, ' ...
'year   = {2012}, ' ...
'title  = {Age and growth of barfin flounder \emph{Verasper moseri} in the eastern coastal waters of {C}ape {E}rimo, {H}okkaido, {J}apan}, ' ... 
'journal = {Nippon Suisan Gakkasihi}, ' ...
'page = {1170-1175}, ' ...
'volume = {78(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WataMina2000'; type = 'article'; bib = [ ...
'author = {K.-I. Watanabe and T. Minami}, ' ...
'year   = {2000}, ' ...
'title  = {Fecundity of hatchery-reared barfin flounder \emph{Verasper moseri}}, ' ... 
'journal = {Nippon Suisan Gakkasihi}, ' ...
'page = {1068-1069}, ' ...
'volume = {66(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Verasper-moseri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

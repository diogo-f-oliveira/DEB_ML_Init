function [data, auxData, metaData, txtData, weights] = mydata_Ursus_arctos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Ursus_arctos'; 
metaData.species_en = 'Brown bear'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 103;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 213;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1313;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate head-body length for female';  bibkey.Li  = 'Wiki';
data.Lim  = 260;  units.Lim  = 'cm'; label.Lim  = 'ultimate head-body length for male';   bibkey.Lim  = 'Wiki';
  comment.Lim = '140-280 cm';

data.Wwb = 510;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 26000; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
  comment.Wwx = 'sex not indicated';
data.Wwi = 277500; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'sex not indicated';

data.Ri  = 2/852;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), female body weight (kg) in autumn
0.298	83.969
0.299	82.061
0.301	78.244
0.403	135.496
0.408	125.954
0.408	125.954
0.418	106.870
0.421	101.145
0.423	97.328
0.423	97.328
0.426	91.603
0.426	91.603
0.428	87.786
0.428	87.786
0.435	74.427
0.435	74.427
0.435	74.427
0.436	72.519
0.437	70.611
0.437	70.611
0.437	70.611
0.440	64.885
0.441	62.977
0.443	59.160
0.444	57.252
0.447	51.527
0.449	47.710
0.451	43.893
0.453	40.076
0.456	34.351
0.458	30.534
1.315	156.489
1.315	156.489
1.332	124.046
1.341	106.870
1.341	106.870
1.343	103.053
1.356	78.244
1.359	72.519
1.359	72.519
1.361	68.702
1.364	62.977
1.465	122.137
1.467	118.321
1.467	118.321
1.468	116.412
1.469	114.504
1.471	110.687
1.471	110.687
1.477	99.237
1.478	97.328
1.484	85.878
1.485	83.969
1.499	57.252
2.258	118.321
2.260	114.504
2.260	114.504
2.373	150.763
2.375	146.947
2.381	135.496
2.383	131.679
2.385	127.863
2.386	125.954
2.388	122.137
2.393	112.595
2.395	108.779
2.398	103.053
2.401	97.328
2.401	97.328
2.411	78.244
2.411	78.244
2.411	78.244
2.415	70.611
2.487	183.206
2.498	162.214
2.510	141.221
3.322	101.145
3.325	95.420
3.416	171.756
3.435	137.405
3.437	133.588
3.438	131.679
3.438	131.679
3.440	127.863
3.442	124.046
3.444	120.229
3.446	116.412
3.449	110.687
3.450	108.779
3.486	40.076
3.545	177.481
3.545	177.481
4.318	211.832
4.323	202.290
4.342	167.939
4.349	154.580
4.368	118.321
4.376	103.053
4.389	78.244
4.487	143.130
4.488	141.221
4.490	137.405
4.493	131.679
4.495	127.863
5.393	175.573
5.396	169.847
5.396	169.847
5.398	166.031
5.404	154.580
5.412	139.313
5.427	110.687
5.431	103.053
5.551	125.954
5.556	116.412
6.316	175.573
6.319	169.847
6.327	154.580
6.340	129.771
6.344	122.137
6.350	110.687
6.351	108.779
6.352	106.870
6.486	103.053
6.597	141.221
6.600	135.496
7.384	150.763
7.416	89.695
7.507	166.031
7.510	160.305
7.526	131.679
7.533	118.321
8.412	200.382
8.414	196.565
8.435	158.397
8.445	139.313
8.452	125.954
8.458	114.504
8.475	82.061
8.482	68.702
9.350	173.664
9.350	173.664
9.381	114.504
9.495	148.855
10.170	118.321
10.400	181.298
10.428	129.771
10.548	150.763
10.550	146.947
11.318	192.748
11.334	162.214
11.336	158.397
11.340	150.763
11.343	145.038
11.343	145.038
11.350	131.679
11.365	103.053
11.365	103.053
11.426	236.641
12.353	229.008
12.375	187.023
12.411	120.229
13.297	190.840
13.297	190.840
13.299	187.023
13.451	148.855
13.465	122.137
14.349	194.656
14.390	118.321
14.529	104.962
15.416	171.756
15.428	150.763
16.325	198.473
18.309	188.931
18.483	108.779
19.404	112.595
19.489	200.382
21.356	162.214
22.399	183.206
23.458	175.573];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = 1000 * data.tW_f(:,2); % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(37.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SwenAdam2007';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), male body weight (kg) in autumn
0.791	114.800
0.791	114.800
0.923	67.200
0.923	92.400
0.923	98.000
0.923	98.000
0.923	103.600
0.923	109.200
0.923	123.200
0.923	126.000
0.923	128.800
0.923	134.400
0.923	137.200
0.923	142.800
0.923	148.400
0.923	154.000
0.923	159.600
1.055	72.800
1.055	190.400
1.846	142.800
1.846	145.600
1.846	154.000
1.846	190.400
1.846	207.200
1.846	218.400
1.978	67.200
1.978	78.400
1.978	78.400
1.978	86.800
1.978	86.800
1.978	95.200
1.978	103.600
1.978	109.200
1.978	114.800
1.978	117.600
1.978	123.200
1.978	128.800
1.978	159.600
1.978	168.000
1.978	173.600
2.769	210.000
2.901	120.400
2.901	128.800
2.901	137.200
2.901	151.200
2.901	156.800
2.901	162.400
2.901	170.800
2.901	176.400
2.901	193.200
2.901	196.000
2.901	218.400
2.901	232.400
2.901	285.600
3.033	182.000
3.824	224.000
3.824	229.600
3.824	240.800
3.824	252.000
3.824	257.600
3.956	103.600
3.956	120.400
3.956	151.200
3.956	179.200
3.956	184.800
3.956	190.400
3.956	198.800
3.956	204.400
3.956	212.800
3.956	218.400
3.956	274.400
4.879	190.400
4.879	201.600
4.879	210.000
4.879	218.400
4.879	224.000
4.879	232.400
4.879	240.800
4.879	310.800
5.011	137.200
5.011	170.800
5.011	243.600
5.011	252.000
5.011	257.600
5.011	268.800
5.011	274.400
5.934	179.200
5.934	196.000
5.934	238.000
5.934	254.800
5.934	263.200
5.934	268.800
5.934	280.000
5.934	291.200
5.934	341.600
6.198	207.200
6.198	212.800
6.198	212.800
6.198	229.600
6.725	168.000
6.725	201.600
6.857	226.800
6.857	232.400
6.857	238.000
6.989	254.800
6.989	260.400
6.989	268.800
6.989	282.800
6.989	288.400
6.989	341.600
6.989	355.600
7.780	229.600
7.780	235.200
7.912	193.200
7.912	201.600
7.912	212.800
7.912	224.000
7.912	260.400
7.912	280.000
7.912	294.000
7.912	302.400
8.044	274.400
8.835	218.400
8.835	229.600
8.835	235.200
8.835	252.000
8.967	179.200
8.967	341.600
10.022	229.600
10.022	238.000
10.022	257.600
10.022	271.600
10.022	277.200
10.022	282.800
10.022	288.400
10.022	294.000
10.022	305.200
10.022	327.600
10.945	221.200
10.945	249.200
10.945	268.800
10.945	291.200
10.945	302.400
11.868	280.000
12.923	221.200
13.978	266.000
13.978	274.400
13.978	280.000
13.978	288.400
14.901	201.600
14.901	238.000
14.901	299.600
15.033	252.000
16.088	232.400
16.088	240.800
16.088	252.000
17.934	285.600
18.066	243.600
18.989	246.400
20.044	187.600
20.967	282.800
21.890	308.000];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = 1000 * data.tW_m(:,2); % convert kg to g
units.tW_m   = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(37.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SwenAdam2007';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'northern pop are heavier in autumn, but lighter in spring than southern and hybernate for a longer time. Am pop are heavier because salmon eating';
metaData.bibkey.F1 = 'SwenAdam2007'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7F2KB'; % Cat of Life
metaData.links.id_ITIS = '180543'; % ITIS
metaData.links.id_EoL = '328581'; % Ency of Life
metaData.links.id_Wiki = 'Ursus_arctos'; % Wikipedia
metaData.links.id_ADW = 'Ursus_arctos'; % ADW
metaData.links.id_Taxo = '170192'; % Taxonomicon
metaData.links.id_WoRMS = '1506697'; % WoRMS
metaData.links.id_MSW3 = '14000970'; % MSW3
metaData.links.id_AnAge = 'Ursus_arctos'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ursus_arctos}}';
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
bibkey = 'SwenAdam2007'; type = 'Article'; bib = [ ... 
'author = {Swenson, J.E. and Adamic, M. and Huber, D. and Stokke, S.}, ' ... 
'year = {2007}, ' ...
'title = {Brown bear body mass and growth in northern and southern {E}urope}, ' ...
'journal = {Oecologia}, ' ...
'howpublished = {\url{http://www.bearproject.info/pdf/apub/A 73.pdf}},'  ...
'volume = {153}, ' ...
'pages = {37--47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ursus_arctos}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


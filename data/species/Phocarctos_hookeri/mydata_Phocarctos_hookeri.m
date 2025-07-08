function [data, auxData, metaData, txtData, weights] = mydata_Phocarctos_hookeri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Phocarctos_hookeri'; 
metaData.species_en = 'New Zealand sea lion';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 07]; 

%% set data
% zero-variate data

data.tg = 365;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 213;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2030;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 2191;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChilDaws2010';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 75;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ChilDaws2010';
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'Wiki';
  comment.Li = '180-200 cm';
data.Lim  = 350;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'Wiki';
   comment.Lim = '240-350 cm, males';
  
data.Wwb = 11e3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ChilDaws2010';
data.Wwi = 160e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '90-160 kg';
data.Wwim = 450e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';
  comment.Wwi = '320-450';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.000	74.809
1.070	137.913
1.783	139.949
2.496	151.654
2.954	167.939
3.005	163.868
3.005	160.814
3.005	132.316
3.056	158.779
3.056	116.031
3.056	109.924
3.107	152.163
3.107	141.985
3.158	127.735
3.973	168.957
4.024	177.099
4.024	173.537
4.024	166.921
4.024	163.868
4.992	187.277
4.992	185.242
4.992	182.188
4.992	160.814
5.042	175.064
5.042	170.992
5.042	163.868
5.042	162.850
5.042	158.779
5.144	166.921
5.144	165.903
5.144	165.903
5.959	177.099
5.959	182.188
5.959	185.242
6.010	158.270
6.010	162.850
6.010	165.903
6.010	169.975
6.010	169.975
6.010	180.153
6.163	170.483
6.978	184.224
7.029	187.277
7.029	180.153
7.029	176.081
7.029	173.028
7.029	171.501
7.029	170.483
7.131	167.430
7.131	163.359
7.131	158.779
7.946	156.743
7.946	162.850
7.946	167.430
7.946	170.992
7.946	172.519
7.946	174.046
7.946	174.046
7.946	175.064
7.946	178.117
7.946	180.662
7.946	183.206
7.946	186.260
9.015	186.260
9.015	183.715
9.015	179.644
9.015	176.081
9.015	173.537
9.015	172.519
9.015	172.519
9.015	160.814
9.066	170.992
9.117	168.448
9.168	165.903
9.983	162.850
9.983	167.430
9.983	172.010
9.983	175.064
9.983	178.626
9.983	180.662
9.983	182.188
9.983	183.206
9.983	187.277
9.983	193.384
10.951	191.349
11.002	185.751
11.053	180.153
11.053	177.608
11.053	177.099
11.053	176.081
11.053	175.573
11.053	175.064
11.104	171.501
11.104	168.957
11.104	164.885
11.969	163.868
11.969	168.957
11.969	174.555
11.969	189.313
12.020	177.099
12.020	179.135
12.020	179.135
12.020	179.135
12.020	181.170
12.020	183.715
12.988	190.331
12.988	186.768
12.988	184.224
12.988	168.957
13.039	180.662
13.039	178.117
13.039	174.555
13.039	171.501
13.039	164.885
13.956	173.028
13.956	176.081
13.956	179.135
13.956	180.662
14.007	183.206
14.058	185.242
14.109	187.786
14.924	187.277
14.924	177.608
14.924	177.099
14.975	184.733
14.975	179.644
15.025	173.028
15.025	166.412
15.076	169.466
15.076	167.939
15.942	167.430
15.942	179.135
15.942	182.697
15.942	182.697
15.993	172.010
15.993	174.555
15.993	177.099
15.993	194.911
16.961	174.555
16.961	177.099
16.961	179.135
16.961	180.662
16.961	184.733
16.961	186.768
17.063	171.501
17.929	168.448
17.980	191.858
17.980	185.751
17.980	183.715
17.980	182.188
17.980	179.135
17.980	177.099
18.031	171.501
18.896	170.483
18.947	173.028
18.947	179.644
18.947	182.188
18.998	176.081
18.998	179.135
19.049	178.117
19.049	188.804
19.049	191.858
19.915	187.277
19.915	189.313
19.966	170.992
19.966	175.064
19.966	178.117
19.966	180.153
19.966	183.206
20.883	186.768
20.934	167.430
20.934	173.537
20.934	175.573
20.985	184.224
20.985	185.242
21.902	170.483
21.902	168.448
22.003	183.206
22.309	180.153
22.767	171.501
22.920	175.064
22.971	179.135
22.971	183.715
22.971	190.840
23.073	194.911
23.837	173.537
23.837	184.224
24.958	183.206
25.059	179.644
25.059	173.537
25.976	180.153];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length'};  
temp.tL_f    = C2K(38.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ChilDaws2010';
comment.tL_f = 'Data for females';
    
% time-weight
data.tWw_f = [ ... % time since birth (yr), weight (kg)
0.000	10.899
0.518	71.935
0.668	63.651
1.529	50.136
1.533	62.343
1.692	82.834
1.793	78.910
2.295	57.112
2.458	88.937
2.507	81.090
2.508	85.014
2.511	94.605
2.513	99.837
2.514	105.068
2.518	115.967
2.554	68.447
2.554	70.191
2.555	72.807
3.484	112.044
3.527	85.886
3.528	87.629
3.528	89.373
3.533	105.068
3.533	105.504
3.576	79.782
3.580	91.989
3.580	91.989
3.580	92.861
3.581	95.913
3.583	102.452
4.497	93.733
4.498	94.605
4.499	97.657
4.542	75.422
4.544	81.526
4.545	84.142
4.549	97.221
4.550	99.401
4.551	102.452
4.552	105.068
4.552	105.940
4.553	108.120
4.554	111.172
4.555	115.095
4.598	89.373
4.599	93.733
5.517	98.093
5.518	100.708
5.563	80.218
5.564	84.142
5.566	89.373
5.567	93.733
5.570	104.632
5.571	108.120
5.573	112.480
5.574	115.967
5.575	118.147
5.618	92.861
5.623	111.172
6.492	119.455
6.539	108.556
6.541	112.916
6.542	115.531
6.582	82.398
6.584	87.193
6.585	91.117
6.586	94.605
6.586	94.605
6.587	99.401
6.588	101.144
6.589	103.324
6.589	104.196
6.589	105.504
6.597	129.482
6.601	141.689
7.411	126.431
7.461	125.123
7.510	118.147
7.511	120.763
7.600	79.346
7.606	98.529
7.606	100.708
7.607	103.324
7.608	105.068
7.608	106.376
7.609	109.428
7.609	109.864
7.610	112.916
7.611	113.787
7.653	85.450
7.654	90.245
7.655	94.605
8.571	90.681
8.572	92.861
8.573	96.785
8.573	97.221
8.573	98.093
8.574	100.708
8.575	102.452
8.575	104.632
8.587	139.946
8.628	108.120
8.628	109.428
8.629	112.044
8.630	114.659
8.630	117.275
8.632	120.763
8.632	120.763
8.633	124.251
8.634	127.738
8.635	131.226
8.635	132.970
8.637	136.458
8.640	146.485
9.641	91.989
9.642	94.605
9.642	96.349
9.643	97.221
9.643	99.401
9.645	103.324
9.645	105.940
9.646	107.684
9.647	110.736
9.648	113.787
9.649	115.967
9.650	119.019
9.652	125.123
9.653	129.482
9.705	134.278
9.707	139.510
10.471	139.946
10.515	116.839
10.515	116.839
10.517	124.251
10.518	126.431
10.565	114.659
10.570	131.662
10.572	135.586
10.606	83.706
10.612	101.580
10.613	104.632
10.613	105.940
10.614	108.556
10.614	108.556
10.614	108.556
10.615	112.044
10.615	112.916
10.618	120.763
10.619	122.507
10.619	123.379
10.621	129.918
10.658	87.629
10.661	96.349
11.579	99.837
11.580	101.580
11.586	120.763
11.587	123.815
11.589	130.354
11.590	134.714
11.593	143.433
11.627	88.937
11.627	91.989
11.630	98.529
11.631	103.324
11.687	119.019
11.734	106.812
11.735	108.556
11.735	110.300
11.736	113.351
11.737	115.531
12.553	118.147
12.553	119.455
12.556	127.302
12.595	91.117
12.595	92.425
12.597	97.221
12.598	99.401
12.598	101.580
12.599	103.760
12.600	107.684
12.602	112.044
12.602	114.659
12.607	129.046
12.607	129.482
12.608	132.098
12.657	125.995
12.702	106.812
12.707	121.635
12.707	123.815
12.715	146.921
12.716	150.409
13.567	104.196
13.569	110.300
13.570	113.351
13.574	128.174
13.575	130.790
13.618	103.324
13.619	107.684
13.623	119.891
13.623	120.327
13.624	122.943
13.627	133.406
13.628	136.022
13.631	146.049
13.672	115.967
13.717	94.605
14.540	122.507
14.592	125.123
14.593	127.738
14.631	86.322
14.631	87.629
14.635	98.529
14.637	105.940
14.638	108.556
14.638	109.428
14.642	120.327
14.647	138.202
14.648	139.946
14.650	147.357
14.690	113.351
14.691	115.967
14.691	116.839
14.697	134.714
14.698	136.458
14.736	96.349
15.559	121.199
15.560	124.687
15.609	119.019
15.753	92.861
15.754	95.913
15.755	97.657
15.757	105.504
15.759	109.864
15.760	115.095
15.761	115.967
15.761	116.403
15.818	135.150
15.862	112.480
16.477	126.431
16.529	129.046
16.570	99.401
16.571	101.580
16.573	106.376
16.576	117.711
16.577	120.763
16.578	122.071
16.578	124.687
16.583	139.074
16.584	143.433
16.624	108.556
16.625	110.300
16.626	113.787
17.650	131.226
17.689	93.733
17.696	115.967
17.697	117.275
17.697	117.275
17.697	118.147
17.746	111.172
17.750	125.559
17.795	105.068
17.799	119.891
17.800	122.507
18.607	98.529
18.617	127.738
18.661	105.068
18.662	108.556
18.662	111.172
18.716	120.327
18.717	121.199
18.717	122.943
18.718	125.123
18.721	135.150
18.766	115.967
18.766	117.275
18.774	141.689
18.778	153.460
18.829	155.640
19.687	128.610
19.689	137.330
19.730	105.068
19.731	108.992
19.735	120.327
19.735	120.763
19.736	122.507
19.739	132.970
20.695	95.477
20.697	103.324
20.700	110.736
20.700	112.916
20.702	117.275
20.749	106.376
20.756	127.738
20.757	129.482
20.758	132.534
20.764	153.025
20.811	140.381
21.716	104.632
21.728	139.946
21.729	143.869
21.772	119.455
21.773	121.199
21.773	122.507
21.774	125.559
21.868	101.580
22.584	110.300
22.686	112.044
22.687	114.223
22.694	134.278
22.741	123.815
22.802	153.460
23.705	111.172
23.705	112.916
23.713	136.458
24.828	119.019
24.877	113.787
24.934	130.790
25.702	144.305
25.848	122.507];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
data.tWw_f(:,2) = data.tWw_f(:,2) * 1e3; % convert kg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight'};  
temp.tWw_f    = C2K(38.1);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ChilDaws2010';
comment.tWw_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tL_f = 5 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4GK6L'; % Cat of Life
metaData.links.id_ITIS = '180617'; % ITIS
metaData.links.id_EoL = '46559191'; % Ency of Life
metaData.links.id_Wiki = 'Phocarctos_hookeri'; % Wikipedia
metaData.links.id_ADW = 'Phocarctos_hookeri'; % ADW
metaData.links.id_Taxo = '67412'; % Taxonomicon
metaData.links.id_WoRMS = '231422'; % WoRMS
metaData.links.id_MSW3 = '14001017'; % MSW3
metaData.links.id_AnAge = 'Phocarctos_hookeri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phocarctos_hookeri}}';
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
bibkey = 'ChilDaws2010'; type = 'Article'; bib = [ ... 
'author = {Simon J. Childerhouse and Stephen M. Dawson and David J. Fletcher and Elisabeth Slooten and B. Louise Chilvers}, ' ... 
'year = {2010}, ' ...
'title = {Growth and reproduction of female {N}ew {Z}ealand sea lions}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {91(1)}, ' ...
'pages = {165–176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phocarctos_hookeri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Phocarctos_hookeri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



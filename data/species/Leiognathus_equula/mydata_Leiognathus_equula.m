function [data, auxData, metaData, txtData, weights] = mydata_Leiognathus_equula

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes '; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Leiognathus_equula'; 
metaData.species_en = 'Common ponyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc','0iMr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'Ww-N'; 'L-Ww'}; 

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
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 10.7; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 28;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'LeeLiu2005';
  comment.Wwb = 'based on egg diameter of 0.8 mm : pi/6*0.08^3';
data.Wwi = 445; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^3.06, see F1';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
194.210	12.206
254.682	14.946
284.942	16.013
313.625	16.322
730-49.2 20.260];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHari1986';

% weight-fecundity
data.WN = [ ... % weight (g), fecumdity (#)
54.763	6153.743
81.928	14101.273
87.746	20366.935
90.944	11183.825
91.002	19255.427
102.531	16896.040
107.342	22743.652
111.042	13699.984
125.457	28737.832
140.685	17056.444
142.552	32504.804
144.938	15110.503
145.429	13579.960
145.502	23739.049
152.799	26248.082
159.524	54084.829
165.657	34187.644
166.097	25559.657
172.488	41706.358
176.097	54929.044
192.798	38795.201
195.279	34760.796
196.793	35874.958
213.546	61908.142
213.958	49244.355];
units.WN = {'g', '#'};  label.WN = {'weight','fecundity'}; 
temp.WN = C2K(28); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'LeeLiu2005';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
    9.110	22.768
10.262	41.296
10.518	31.761
10.610	28.782
10.646	36.537
10.829	37.736
10.939	37.143
10.976	33.566
11.049	35.954
11.104	46.095
11.177	33.572
11.213	43.713
11.287	39.540
11.305	45.505
11.415	36.562
11.415	40.737
11.543	38.952
11.561	42.531
11.616	36.569
11.652	46.113
11.652	41.342
11.780	44.924
11.817	52.083
11.890	40.753
11.963	44.930
11.982	49.106
11.982	53.281
12.091	50.899
12.128	46.129
12.146	56.865
12.146	49.708
12.293	53.888
12.329	47.328
12.348	58.661
12.402	50.313
12.421	49.121
12.512	55.684
12.530	58.071
12.549	62.246
12.604	46.741
12.695	52.708
12.695	56.287
12.732	51.517
12.787	54.500
12.787	59.868
12.896	64.047
12.951	58.681
13.043	64.648
13.079	54.510
13.134	61.669
13.189	59.882
13.207	74.793
13.226	54.515
13.262	64.059
13.317	67.043
13.390	67.642
13.409	71.817
13.427	59.889
13.555	67.051
13.573	74.805
13.683	67.055
13.701	73.020
13.774	62.883
13.829	68.253
13.866	77.200
13.921	72.431
13.957	84.360
13.976	67.661
13.994	62.890
14.067	64.086
14.085	81.979
14.104	76.015
14.104	73.033
14.122	72.437
14.159	87.946
14.232	70.652
14.268	79.599
14.268	69.460
14.287	85.564
14.323	76.619
14.323	74.233
14.360	93.916
14.378	82.585
14.378	79.006
14.451	70.659
14.470	68.274
14.506	81.396
14.543	76.030
14.561	84.977
14.579	78.417
14.598	90.346
14.652	99.890
14.689	101.681
14.689	81.999
14.744	89.158
14.762	95.123
14.762	81.405
14.799	103.474
14.799	78.424
14.909	84.988
14.945	90.954
14.945	90.954
14.982	96.919
14.982	77.237
15.037	101.096
15.091	89.766
15.110	95.134
15.128	84.399
15.183	83.208
15.183	92.751
15.238	88.578
15.238	104.681
15.256	97.525
15.311	89.177
15.329	96.334
15.366	107.071
15.366	117.210
15.384	92.161
15.402	93.355
15.439	110.056
15.457	83.814
15.457	120.792
15.476	99.918
15.494	113.636
15.494	101.707
15.512	101.708
15.530	89.780
15.549	98.727
15.622	105.887
15.640	92.766
15.677	101.714
15.695	115.432
15.713	90.383
15.750	95.752
15.768	118.416
15.787	121.995
15.787	108.874
15.787	113.646
15.805	81.439
15.805	77.264
15.860	95.159
15.860	102.912
15.915	117.825
15.933	79.058
15.951	110.669
15.951	83.234
15.970	102.320
16.006	96.953
16.043	124.986
16.061	132.144
16.079	137.512
16.116	106.499
16.134	114.254
16.189	116.641
16.226	130.360
16.244	111.871
16.299	102.927
16.299	121.416
16.335	135.731
16.335	93.385
16.372	129.172
16.372	99.947
16.390	113.069
16.445	118.439
16.445	110.089
16.445	104.721
16.500	135.737
16.518	151.841
16.537	124.406
16.555	100.550
16.573	108.900
16.591	145.879
16.591	132.758
16.610	106.516
16.646	141.706
16.646	120.831
16.665	113.078
16.683	137.532
16.738	160.198
16.738	132.166
16.738	127.395
16.793	117.257
16.793	103.540
16.811	124.415
16.884	139.328
16.884	125.610
16.902	112.490
16.902	132.768
16.939	127.998
16.957	153.048
16.976	119.649
16.994	131.578
17.012	148.279
17.049	150.069
17.085	116.074
17.085	122.635
17.104	138.143
17.140	148.879
17.140	135.758
17.177	157.827
17.195	142.917
17.195	110.114
17.213	163.792
17.213	156.039
17.213	130.989
17.250	122.044
17.268	170.951
17.305	138.149
17.341	165.586
17.341	145.904
17.341	126.818
17.360	152.465
17.360	131.590
17.378	135.169
17.396	138.152
17.451	159.029
17.470	141.137
17.488	117.280
17.506	149.488
17.506	136.367
17.506	130.999
17.524	124.439
17.561	169.172
17.579	149.490
17.598	121.459
17.616	132.792
17.616	138.159
17.616	142.334
17.634	161.421
17.634	142.931
17.652	141.143
17.671	154.861
17.689	145.915
17.726	168.581
17.817	133.395
17.817	124.448
17.835	141.149
17.835	153.077
17.854	159.042
17.854	140.553
17.890	165.008
17.890	171.568
17.890	149.501
17.909	147.115
17.909	135.783
17.982	152.486
18.037	160.837
18.055	172.766
18.055	141.753
18.073	145.928
18.073	138.771
18.091	152.489
18.110	133.404
18.146	156.666
18.165	164.420
18.220	157.265
18.238	175.158
18.238	128.041
18.256	182.316
18.256	139.374
18.293	178.142
18.311	186.493
18.311	159.057
18.311	145.340
18.329	151.304
18.348	169.794
18.384	128.046
18.384	164.427
18.421	168.604
18.421	154.290
18.439	176.954
18.457	159.062
18.512	190.674
18.567	185.905
18.567	157.873
18.567	148.927
18.585	164.434
18.604	203.799
18.622	173.382
18.805	159.670
18.805	182.334
18.860	167.425
18.878	198.440
18.878	213.350
18.970	191.286
18.970	201.425
18.970	212.161
19.024	193.077
19.024	151.924
19.079	174.590
19.116	208.587
19.152	183.538
19.171	176.978
19.189	170.418
19.207	211.572
19.207	188.908
19.317	179.965
19.335	194.280
19.390	159.689
19.482	184.742
19.610	191.307
19.628	210.990
19.665	203.237
19.665	185.941
19.811	186.542
19.848	205.629
19.939	230.682
19.976	198.476
20.104	237.844
20.341	213.995
20.341	205.049
20.561	208.635
20.744	257.547
21.238	273.667
21.604	265.926];
units.LW = {'cm', 'g'};  label.LW = {'fork length','weight'}; 
bibkey.LW = 'LeeLiu2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
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
F1 = 'length-weight: Ww in g = 0.01660*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3SYNG'; % Cat of Life
metaData.links.id_ITIS = '168799'; % ITIS
metaData.links.id_EoL = '46578664'; % Ency of Life
metaData.links.id_Wiki = 'Leiognathus_equula'; % Wikipedia
metaData.links.id_ADW = 'Leiognathus_equula'; % ADW
metaData.links.id_Taxo = '435016'; % Taxonomicon
metaData.links.id_WoRMS = '303762'; % WoRMS
metaData.links.id_fishbase = 'Leiognathus-equula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leiognathus_equula}}';  
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
bibkey = 'LeeLiu2005'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1444-2906.2005.00999.x}, ' ...
'author = {Cheng-Fang Lee and Kwang-Ming Liu and Wei-Cheng Su and Chuen-Chi Wu}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive biology of the common ponyfish \emph{Leiognathus equulusin} the south-western waters off {T}aiwan}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'volume = {71(3)}, ' ...
'pages = {551–562}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leiognathus-equula.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

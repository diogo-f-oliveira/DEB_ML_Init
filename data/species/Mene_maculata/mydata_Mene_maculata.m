function [data, auxData, metaData, txtData, weights] = mydata_Mene_maculata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Menidae';
metaData.species    = 'Mene_maculata'; 
metaData.species_en = 'Moonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSE','MI'};
metaData.ecoCode.habitat = {'0pMp','piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 30];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(24.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';     bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Hwan1984';
  comment.Wwb = 'based on egg diameter of 0.65 mm: pi/6*0.065^3'; 
data.Wwp = 63.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02089*Li^3.04, see F1';
data.Wwi = 646.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^3.04, see F1';
 
data.Ri  = 9e4/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Hwan1984';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length 
1	10.964 10.607
2	13.964 13.429
3	16.321 15.429
4	18.321 16.964
5	19.893 18.179
6	21.286 19.143
7	22.357 19.750];
data.tL(:,1) = (data.tL(:,1)+0.8)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(24.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HwanChen2002';treat.tL = {1, {'1981-1984','1995-1997'}};

% length-weight
data.LW_81 = [ ... % std length (cm), weight (g)
10.494	31.518
10.958	31.554
11.237	38.983
11.539	42.710
11.656	46.422
11.841	43.659
12.098	56.642
12.236	51.097
12.406	82.591
12.467	49.263
12.469	55.744
12.724	55.764
12.724	58.542
12.772	65.027
12.840	57.625
12.887	62.258
13.026	58.565
13.236	65.063
13.329	67.848
13.467	64.155
13.469	72.488
13.841	77.146
13.863	71.592
14.074	83.646
14.188	78.099
14.399	86.449
14.560	82.757
14.562	91.091
14.654	89.246
14.656	97.580
14.752	111.476
14.771	92.033
15.119	94.838
15.280	89.294
15.305	99.482
15.561	105.057
15.724	107.847
15.887	111.564
15.965	148.607
16.143	117.139
16.154	164.362
16.212	114.366
16.215	125.478
16.233	105.109
16.374	111.601
16.375	117.157
16.399	121.788
16.404	140.307
16.498	146.796
16.556	97.726
16.584	119.951
16.609	127.360
16.619	170.879
16.659	144.031
16.730	147.740
16.758	169.038
16.765	99.594
16.798	143.115
16.800	152.375
16.849	162.564
16.887	127.381
16.902	192.197
16.998	106.094
17.054	145.913
17.151	166.291
17.160	106.106
17.171	151.477
17.191	138.516
17.222	173.704
17.331	143.156
17.344	99.639
17.362	176.492
17.621	194.105
17.637	163.550
17.678	141.331
17.786	208.006
17.881	117.273
17.882	221.903
18.036	186.729
18.069	128.399
18.166	248.776
18.207	124.705
18.400	156.202
18.652	247.888
18.690	209.928
18.716	222.893
18.803	197.900
18.926	228.465
18.983	176.617
19.240	184.044
19.389	227.574
19.406	202.576
19.427	192.392
19.567	197.033
19.574	223.885
19.969	230.397
20.057	211.885
20.245	223.937
20.524	225.810
20.900	251.765
21.177	247.157];
units.LW_81   = {'cm', 'g'};  label.LW_81 = {'std length', 'weight','1981-1984'};  
bibkey.LW_81 = 'HwanChen2002';
%
data.LW_95 = [ ... % std length (cm), weight (g)
10.940	42.646
11.245	40.451
11.714	46.789
12.113	58.492
12.207	55.264
12.207	61.686
12.371	53.094
12.394	55.230
12.512	66.983
12.559	57.342
12.606	62.685
12.723	61.594
12.888	77.619
12.910	58.349
12.911	63.701
12.981	61.548
13.099	70.089
13.099	74.371
13.191	55.088
13.333	73.259
13.379	63.617
13.474	68.952
13.521	74.296
13.638	79.626
13.732	86.031
13.802	75.316
13.897	98.846
14.014	93.474
14.036	74.204
14.083	70.984
14.131	91.312
14.202	98.792
14.225	93.436
14.342	92.345
14.390	104.110
14.483	98.742
14.601	100.861
14.624	98.716
14.718	100.840
14.718	106.192
14.740	87.992
14.789	112.601
14.882	102.952
14.930	117.928
14.953	109.361
15.023	107.208
15.048	129.681
15.095	126.461
15.118	121.105
15.164	108.253
15.258	115.729
15.352	116.782
15.445	114.625
15.516	116.753
15.516	125.316
15.563	119.956
15.681	128.497
15.751	125.274
15.798	134.898
15.891	113.475
15.963	138.080
15.985	127.373
16.056	139.134
16.080	144.481
16.244	136.960
16.314	141.228
16.338	144.435
16.384	129.442
16.455	141.203
16.456	152.977
16.501	127.281
16.619	144.385
16.691	161.498
16.807	156.125
16.948	159.311
17.020	174.283
17.088	144.301
17.112	156.071
17.324	167.807
17.371	165.658
17.418	180.634
17.441	166.715
17.463	151.727
17.512	183.828
17.699	173.091
17.747	186.997
17.770	176.290
17.817	181.633
17.958	186.960
17.958	192.311
17.982	198.729
18.098	176.231
18.098	180.513
18.240	205.105
18.334	207.229
18.379	176.181
18.404	204.005
18.474	198.641
18.568	190.062
18.640	218.948
18.755	190.028
18.803	199.653
18.850	212.488
18.968	213.538
19.063	244.561
19.202	218.848
19.343	227.385
19.365	205.975
19.484	223.079
19.485	240.204
19.628	269.078
19.793	290.455
19.816	276.536];
units.LW_95   = {'cm', 'g'};  label.LW_95 = {'std length', 'weight','1995-1997'};  
bibkey.LW_95 = 'HwanChen2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
set1 = {'LW_81','LW_95'}; subtitle1 = {'Data for periods 1981-1984 and 1995-1997'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.02089*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZPY3'; % Cat of Life
metaData.links.id_ITIS = '692620'; % ITIS
metaData.links.id_EoL = '46580706'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Mene_maculata'; % ADW
metaData.links.id_Taxo = '153553'; % Taxonomicon
metaData.links.id_WoRMS = '218450'; % WoRMS
metaData.links.id_fishbase = 'Mene-maculata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mene_maculata}}';
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
bibkey = 'HwanChen2002'; type = 'Article'; bib = [ ... 
'author = {Szu-Yu Hwang and Che-Tsung Chen and Kwang-Ming Liu}, ' ... 
'year = {2002}, ' ...
'title = {Age and growth of the moon fish, \emph{Mene maculata}, before and after heavy exploitation in southwestern {T}aiwan waters}, ' ...
'journal = {J. Fish. Soc. Taiwan}, ' ...
'volume = {29(4)}, ' ...
'pages = {299-311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hwan1984'; type = 'Article'; bib = [ ... 
'author = {Szu-Yu Hwang}, ' ... 
'year = {1984}, ' ...
'title = {Study on Maturity and Fecundity of Moon Fish, \emph{Mene maculata}, in Adjacent Waters of {T}aiwan}, ' ...
'journal = {Bulletin of Taiwan Fisheries Research Institude}, ' ...
'volume = {37}, ' ...
'pages = {93-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/Mene-maculata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

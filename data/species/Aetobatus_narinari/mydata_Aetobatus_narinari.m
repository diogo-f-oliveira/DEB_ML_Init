function [data, auxData, metaData, txtData, weights] = mydata_Aetobatus_narinari
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Aetobatus_narinari'; 
metaData.species_en = 'Whitespotted eagle ray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 09];

%% set data
% zero-variate data;
data.ab = 10*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 202*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BoggBass2022';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 48;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'BoggBass2022';
data.Lp = 130;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'BoggBass2022';
data.Lpm = 122;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty'; bibkey.Lpm  = 'BoggBass2022';
data.Li  = 226;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'BoggBass2022'; 
data.Lim  = 190;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width';   bibkey.Lim  = 'BoggBass2022'; 

data.Wwi  = 130e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase'; 

data.Ri  = 4/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BoggBass2022';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, 1 litter per yr';
  
% univariate data
% time-length
data.tL_f32 = [ ... % time since birth (yr), disc width (cm)
5.077	107.175
5.629	114.180
7.722	123.453
9.431	135.088
10.781	144.983];
data.tL_f32(:,1) = 365 * data.tL_f32(:,1); % convert yr to d
units.tL_f32  = {'d','cm'}; label.tL_f32  = {'time since birth','disc width','female 32'}; 
temp.tL_f32 = C2K(27.5); units.temp.tL_f32 = 'K'; label.temp.tL_f32 = 'temperature';
bibkey.tL_f32  = 'BoggBass2022';  
comment.tL_f32 = 'Data for female 32';
%
data.tL_f33 = [ ... % time since birth (yr), disc width (cm)
3.314	96.715
4.279	108.386
6.345	120.004
8.440	138.066
8.772	145.667];
data.tL_f33(:,1) = 365 * data.tL_f33(:,1); % convert yr to d
units.tL_f33  = {'d','cm'}; label.tL_f33  = {'time since birth','disc width','female 33'}; 
temp.tL_f33 = C2K(27.5); units.temp.tL_f33 = 'K'; label.temp.tL_f33 = 'temperature';
bibkey.tL_f33  = 'BoggBass2022';  
comment.tL_f33 = 'Data for female 33';
%
data.tL_f101 = [ ... % time since birth (yr), disc width (cm)
2.653	97.333
3.039	98.486
5.190	125.920
6.129	141.694];
data.tL_f101(:,1) = 365 * data.tL_f101(:,1); % convert yr to d
units.tL_f101  = {'d','cm'}; label.tL_f101  = {'time since birth','disc width','female 101'}; 
temp.tL_f101 = C2K(27.5); units.temp.tL_f101 = 'K'; label.temp.tL_f101 = 'temperature';
bibkey.tL_f101  = 'BoggBass2022';  
comment.tL_f101 = 'Data for female 101';
%
data.tL_f73 = [ ... % time since birth (yr), disc width (cm)
0.445	62.870
1.440	83.330
2.405	94.415
3.428	121.904
4.643	140.595
5.581	155.784];
data.tL_f73(:,1) = 365 * data.tL_f73(:,1); % convert yr to d
units.tL_f73  = {'d','cm'}; label.tL_f73  = {'time since birth','disc width','female 73'}; 
temp.tL_f73 = C2K(27.5); units.temp.tL_f73 = 'K'; label.temp.tL_f73 = 'temperature';
bibkey.tL_f73  = 'BoggBass2022';  
comment.tL_f73 = 'Data for female 73';
%
data.tL_m70 = [ ... % time since birth (yr), disc width (cm)
0.000	48.633
3.347	94.397
7.434	121.083
8.529	122.611
9.462	126.336
10.524	125.657
11.554	129.020
12.584	130.912];
data.tL_m70(:,1) = 365 * data.tL_m70(:,1); % convert yr to d
units.tL_m70  = {'d','cm'}; label.tL_m70  = {'time since birth','disc width','male 70'}; 
temp.tL_m70 = C2K(27.5); units.temp.tL_m70 = 'K'; label.temp.tL_m70 = 'temperature';
bibkey.tL_m70  = 'BoggBass2022';  
comment.tL_m70 = 'Data for male 70';
%
data.tL_m35 = [ ... % time since birth (yr), disc width (cm)
0.032	49.003
2.156	100.217
3.379	119.767
4.152	126.793
5.278	129.058
6.147	132.780
7.274	139.089];
data.tL_m35(:,1) = 365 * data.tL_m35(:,1); % convert yr to d
units.tL_m35  = {'d','cm'}; label.tL_m35  = {'time since birth','disc width','male 35'}; 
temp.tL_m35 = C2K(27.5); units.temp.tL_m35 = 'K'; label.temp.tL_m35 = 'temperature';
bibkey.tL_m35  = 'BoggBass2022';  
comment.tL_m35 = 'Data for male 35';
%
data.tL_m39 = [ ... % time since birth (yr), disc width (cm)
0.000	49.001
0.483	60.423
1.770	89.168
2.832	118.635
3.637	127.133
4.699	131.968
5.793	139.746];
data.tL_m39(:,1) = 365 * data.tL_m39(:,1); % convert yr to d
units.tL_m39  = {'d','cm'}; label.tL_m39  = {'time since birth','disc width','male 39'}; 
temp.tL_m39 = C2K(27.5); units.temp.tL_m39 = 'K'; label.temp.tL_m39 = 'temperature';
bibkey.tL_m39  = 'BoggBass2022';  
comment.tL_m39 = 'Data for male 39';
%
data.tL_m38 = [ ... % time since birth (yr), disc width (cm)
0.032	48.267
1.641	74.823
2.639	94.360
3.733	107.653
4.506	107.694
5.664	120.254
6.726	124.722];
data.tL_m38(:,1) = 365 * data.tL_m38(:,1); % convert yr to d
units.tL_m38  = {'d','cm'}; label.tL_m38  = {'time since birth','disc width','male 38'}; 
temp.tL_m38 = C2K(27.5); units.temp.tL_m38 = 'K'; label.temp.tL_m38 = 'temperature';
bibkey.tL_m38  = 'BoggBass2022';  
comment.tL_m38 = 'Data for males';

% length-weight
data.LW_f = [ ... % disc width (cm), weight (kg)
42.703	1.956
50.614	2.212
52.827	2.701
55.677	2.220
56.938	3.678
58.207	2.709
60.101	4.169
62.948	4.659
62.953	2.960
67.692	5.395
68.955	6.367
84.772	8.335
89.826	11.256
99.302	16.611
99.316	12.242
99.944	13.699
100.260	13.942
100.570	15.885
103.422	14.676
104.343	23.658
110.358	22.939
111.011	16.630
112.591	17.360
114.454	28.771
116.355	27.803
116.986	28.533
118.566	29.263
120.465	29.266
120.828	14.461
121.376	41.404
121.742	25.628
122.677	30.241
122.704	21.746
123.006	26.115
124.886	32.186
125.161	45.293
126.166	27.819
126.478	29.033
127.432	27.579
127.717	37.531
128.067	26.851
128.371	30.978
129.598	43.116
129.631	32.679
130.566	37.292
130.583	31.953
130.888	35.594
132.463	37.781
135.006	34.144
135.933	41.185
137.546	31.478
137.826	43.129
138.179	31.722
138.794	37.306
139.438	33.666
139.724	43.375
139.760	31.967
142.893	41.924
142.930	30.274
143.841	42.411
145.428	40.957
147.646	39.990
148.873	52.371
148.877	50.914
149.175	56.983
149.222	41.934
150.135	53.586
150.172	41.693
150.790	46.548
151.414	49.462
152.338	57.473
152.964	59.659
153.287	57.475
155.176	60.390
158.973	60.639
160.550	62.341
160.550	62.341
161.228	48.022
161.496	63.556
161.810	64.285
162.439	65.499
165.590	69.631
167.802	70.605
168.081	82.499
169.707	68.666
171.580	76.922
172.159	93.913
172.856	73.526
175.073	73.044
176.304	84.211
176.624	82.998
177.998	48.777
178.844	81.545
179.218	63.342
179.494	75.964
180.723	87.616
185.453	92.964
199.653	105.851];
data.LW_f(:,2) = 1e3 * data.LW_f(:,2); % convert kg to g
units.LW_f  = {'cm','g'}; label.LW_f  = {'disc width','weight'}; 
bibkey.LW_f  = 'BassWilk2014';  
%
data.LW_m = [ ... % disc width (cm), weight (kg)
42.071	1.712
43.336	1.957
45.232	2.931
48.083	1.965
49.030	2.694
50.926	3.668
52.506	4.399
58.205	3.437
60.103	3.441
61.690	1.987
62.316	4.415
66.745	4.665
87.911	16.350
94.259	10.292
98.662	18.794
100.266	12.001
102.167	11.518
105.632	16.378
106.564	21.962
107.207	18.808
107.502	25.362
107.853	14.440
108.161	17.111
111.933	25.369
111.962	16.146
112.264	20.758
113.520	23.673
114.792	21.733
115.108	21.976
115.113	20.520
117.901	39.456
118.896	24.895
119.198	29.507
119.869	17.615
120.168	23.198
121.128	19.559
122.036	32.667
124.268	27.331
124.563	34.370
124.590	25.632
124.919	21.749
124.921	21.021
126.481	28.063
127.097	33.646
129.640	29.767
130.618	20.788
132.773	39.966
134.348	42.153
134.676	38.513
135.320	35.116
136.299	25.651
136.898	36.332
137.186	45.313
140.032	46.046
140.053	39.492
140.058	37.793
144.144	46.538
144.149	45.081
144.486	38.529
145.396	50.909
145.403	48.724
146.678	45.814
147.284	54.310
148.256	47.272
149.525	46.304
150.113	60.382
150.765	54.558
151.394	55.530
152.683	48.251
153.290	56.504
153.943	50.194
154.238	56.991
154.250	53.107
156.145	54.324
157.091	55.539
157.383	63.064
158.005	66.706
159.682	36.611
159.883	73.262
160.214	68.408
160.599	46.807
161.162	68.895
161.471	71.323
162.400	77.878
163.721	60.404
163.767	45.841
165.987	44.146
166.234	66.234
166.252	60.651
166.268	55.311
168.719	81.043
169.054	75.219
169.057	74.248
171.884	80.806
172.236	69.641
172.833	80.807
184.498	94.904];
data.LW_m(:,2) = 1e3 * data.LW_m(:,2); % convert kg to g
units.LW_m  = {'cm','g'}; label.LW_m  = {'disc width','weight'}; 
bibkey.LW_m  = 'BassWilk2014';  

%% set weights for all real data
weights = setweights(data, []);
%weights.tL_f = 3 * weights.tL_f;
%weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f73','tL_f101','tL_f33','tL_f32'}; subtitle1 = {'Data for females'};
set2 = {'tL_m39','tL_m35','tL_m38','tL_m70'}; subtitle2 = {'Data for males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65DZC'; % Cat of Life
metaData.links.id_ITIS = '160978'; % ITIS
metaData.links.id_EoL = '46561023'; % Ency of Life
metaData.links.id_Wiki = 'Aetobatus_narinari'; % Wikipedia
metaData.links.id_ADW = 'Aetobatus_narinari'; % ADW
metaData.links.id_Taxo = '42157'; % Taxonomicon
metaData.links.id_WoRMS = '217426'; % WoRMS
metaData.links.id_fishbase = 'Aetobatus-narinari'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aetobatus_narinari}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aetobatus-narinari}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoggBass2022'; type = 'article'; bib = [ ...  
'doi = {10.3389/fmars.2022.960822}, ' ...
'author = {Boggio-Pasqua, A. and Bassos-Hull, K. and Aeberhard, W.H. and Hoopes, L.A. and Swider, D.A. and Wilkinson, K.A. and Dureuil, M.}, ' ...
'title = {Whitespotted eagle ray (\emph{Aetobatus narinari}) age and growth in wild (in situ) versus aquarium-housed (ex situ) individuals: {I}mplications for conservation and management}, ' ...
'year = {2022}, ' ...
'journal = {Front. Mar. Sci.}, '...
'volume = {9}, ' ...
'pages = {960822}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BassWilk2014'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-014-0294-z}, ' ...
'author = {Bassos-Hull, Kim and Wilkinson, Krystan A. and Hull, Peter T. and Dougherty, Dean A. and Omori, Kristen L. and Ailloud, Lisa E. and Morris, John J. and Hueter, Robert E.}, ' ...
'title = {Life history and seasonal occurrence of the spotted eagle ray,Aetobatus narinari, in the eastern Gulf of Mexico}, ' ...
'year = {2014}, ' ...
'journal = {Environmental Biology of Fishes}, '...
'volume = {97(9)}, ' ...
'pages = {1039–1056}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


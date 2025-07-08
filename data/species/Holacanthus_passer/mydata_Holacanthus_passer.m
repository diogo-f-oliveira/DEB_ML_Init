function [data, auxData, metaData, txtData, weights] = mydata_Holacanthus_passer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Holacanthus_passer'; 
metaData.species_en = 'King angelfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 22];

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 57*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 35.6;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.1e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.7 mm and width 0.5 mm of Dascyllus albisella: pi/6*0.07*0.05^2'; 
data.Wwp = 112.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.02951*Lp^2.91, see F1';
data.Wwi = 965.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02951*Li^2.91, see F1';

data.Ri  = 1.5e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hypsypops_rubicundus: 8e4*965.5/526.5';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), total length (mm)
0.480	3.256
0.481	3.953
0.482	5.271
0.525	6.434
1.440	8.992
1.461	8.140
1.484	10.078
1.495	11.240
1.504	7.132
2.497	13.256
2.518	11.938
3.477	16.202
3.498	14.109
3.499	16.977
3.509	14.961
3.521	17.829
5.471	22.171
5.502	18.837
5.503	21.240
5.513	20.078
7.484	23.023
7.506	24.884
7.507	27.829
7.518	26.124
7.519	26.977
7.528	24.341
7.540	29.147];
data.tL(:,1) = 365*(data.tL(:,1) + 0.7); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FernReye2016';

% length-weight
data.LW = [ ... % total length (cM0. weight (g)
3.085	13.959
3.923	15.976
4.057	2.198
5.029	18.007
5.097	33.766
6.002	22.001
6.103	39.731
7.007	30.575
7.008	47.659
7.009	63.414
7.041	18.121
7.044	94.926
7.077	81.142
8.114	31.966
8.116	85.139
8.248	22.127
8.249	41.821
8.250	65.453
9.120	43.839
9.121	65.502
9.220	28.090
9.290	93.083
9.991	20.256
9.992	45.858
10.027	75.400
10.061	91.157
10.061	99.034
10.127	61.620
11.033	101.059
11.064	28.194
11.134	89.248
11.165	43.954
11.233	53.805
11.233	63.652
11.938	87.324
11.972	89.295
11.976	207.457
12.007	138.531
12.070	32.189
12.071	57.791
12.072	71.576
12.140	107.029
12.976	57.842
13.012	105.109
13.111	71.635
13.111	87.390
13.113	116.930
13.114	142.532
14.150	73.663
14.152	115.020
14.152	122.897
14.185	99.266
14.187	150.470
14.187	164.256
14.218	87.452
14.250	59.883
14.289	187.894
15.022	71.742
15.125	138.707
15.126	156.431
15.156	83.566
15.157	93.413
15.157	105.229
15.157	113.107
15.158	122.954
15.227	184.008
16.096	97.405
16.096	115.129
16.097	126.945
16.097	142.700
16.099	184.057
16.131	154.518
16.131	160.426
16.974	276.666
17.001	111.241
17.004	188.047
17.037	160.477
17.037	172.293
17.038	209.711
17.040	245.160
17.072	199.866
18.012	243.245
18.042	144.779
18.077	178.260
18.080	266.882
18.112	223.557
18.949	203.911
19.017	217.700
19.051	249.212
19.052	259.059
19.053	302.385
19.083	186.194
19.989	205.939
19.989	211.847
19.991	276.836
19.992	288.652
19.992	302.438
19.993	328.040
19.993	335.917
19.994	351.672
20.024	261.083
20.057	245.330
20.088	170.496
20.088	184.281
20.090	225.638
20.095	377.279
20.096	393.034
20.158	251.244
20.896	276.887
21.100	335.979
21.101	377.336
22.071	312.402
22.106	361.638
22.109	428.596
22.943	316.389
23.048	446.373
23.148	412.900
24.014	284.940
24.026	590.192
24.052	395.226
24.090	515.360
25.069	692.658
25.104	734.016
25.968	531.220
26.096	367.770
26.199	422.918
27.177	582.492
27.184	765.643
28.224	793.273
29.025	700.758
29.158	675.164];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'FernReye2016';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02951*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3M73P'; % Cat of Life
metaData.links.id_ITIS = '169630'; % ITIS
metaData.links.id_EoL = '46581133'; % Ency of Life
metaData.links.id_Wiki = 'Holacanthus_passer'; % Wikipedia
metaData.links.id_ADW = 'Holacanthus_passer'; % ADW
metaData.links.id_Taxo = '45403'; % Taxonomicon
metaData.links.id_WoRMS = '276016'; % WoRMS
metaData.links.id_fishbase = 'Holacanthus-passer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Holacanthus_passer}}';
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
bibkey = 'FernReye2016'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIP2016.46.4.03}, ' ...
'author = {Francisco J. Ferna\''{a}ndez-Rivera Melo and H\''{e}ctor Reyes-Bonilla and Jorge A. L\''{o}pez-Rocha and Carlos A. Salomon-Aguilar}, ' ... 
'year = {2016}, ' ...
'title = {GROWTH AND MORTALITY OF THE KING ANGELFISH, \emph{Holacanthus passer} ({A}CTINOPTERYGII: {P}ERCIFORMES: {P}OMACANTHIDAE), IN THE {C}ENTRAL {G}ULF OF {C}ALIFORNIA, {M}EXICO }, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {46(4)}, ' ...
'pages = {293–301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Holacanthus-passer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

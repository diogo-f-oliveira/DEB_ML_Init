function [data, auxData, metaData, txtData, weights] = mydata_Beringraja_binoculata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Beringraja_binoculata'; 
metaData.species_en = 'Big skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2017 07 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 07 23]; 

%% set data
% zero-variate data;
data.ab = 365;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 12*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'Zein1991';
  temp.tp = C2K(7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7.5*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Zein1991';
  temp.tpm = C2K(7); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature';

% fishbase: Egg capsules are 22.8-30.5 cm long and 11.0-19.4 cm wide; 7 embryos/egg capsule 
data.Lb  = 0.07 * 244;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'guess based on same relative length, compared to Raja clavata: 0.12 * 244 cm';
data.Lp  = 130;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Zein1991';
data.Lpm  = 105;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Zein1991';
data.Li  = 244;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
 
data.Ri  = 350/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EberSmit2008';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'continuous egg production throughout the yr';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
2.978	39.044
2.979	40.699
2.980	44.338
2.981	45.993
2.982	48.971
2.983	52.279
3.973	57.243
3.983	43.346
3.983	44.669
3.984	45.993
3.984	46.654
3.984	47.978
3.985	49.963
4.000	52.279
4.001	53.603
4.001	54.596
4.001	55.588
4.003	61.875
4.969	81.728
4.980	69.816
4.986	88.015
4.988	48.309
4.988	50.956
4.989	52.279
4.989	53.934
4.990	55.919
4.990	56.581
4.991	59.228
4.992	61.544
4.992	62.868
4.993	63.860
4.993	64.522
4.994	66.838
5.946	89.338
5.949	53.603
5.955	73.456
5.956	74.449
5.956	75.110
5.956	77.096
5.957	78.750
5.958	83.051
5.959	85.037
5.965	60.221
5.966	61.875
5.966	62.206
5.966  108.199
5.967	65.846
5.968	67.169
5.977	96.287
5.988	84.375
5.988	84.375
6.011	110.846
6.967	100.257
6.970	111.176
6.971	112.169
6.972	69.816
6.976	82.059
6.976	83.051
6.977	85.368
6.978	88.015
6.978	89.669
6.979	90.993
6.979	93.640
6.980	94.963
6.980	96.618
6.983	106.213
6.984	108.199
6.985	109.522
6.988	121.434
6.989	77.757
7.962	118.787
7.962	120.441
7.963	124.081
7.964	125.404
7.965	131.029
7.967	136.324
7.973	109.522
7.974	110.846
7.974	112.831
7.975	114.485
7.975	116.471
7.986	104.559
7.987	106.213
7.997	92.978
7.999	101.250
8.000	102.904
8.934	114.154
8.935	115.809
8.935	117.794
8.936	120.441
8.936	121.434
8.937	122.757
8.945	104.228
8.946	106.213
8.958	97.941
9.955	125.735
9.956	128.051
9.958	132.684
9.958	135.000
9.981	115.809
9.982	117.132
9.982	118.787
9.983	120.110
9.983	121.765
10.976	133.346
10.986	119.118
10.986	121.103
10.987	124.412
10.988	127.721
12.031	161.140
12.032	162.463
12.095	133.346];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};
temp.tL = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Zein1991';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
40.447	688.754
43.575	687.215
44.693	686.665
45.140	1237.626
45.587	1001.185
46.704	1000.635
46.704	1315.599
46.927	685.565
48.268	763.648
48.268	369.945
48.715	842.167
49.385	841.837
50.726	1392.359
52.291	997.886
53.631	1390.929
53.631	682.266
54.078	1311.970
54.972	1311.530
55.419	1626.270
56.983	1074.319
57.430	1625.281
57.654	444.066
58.101	1467.469
58.101	2412.353
59.218	1860.622
59.888	1072.890
60.112	2017.660
61.006	1623.521
61.676	1308.231
61.676	1859.412
61.899	2725.443
63.464	2173.492
65.028	1857.763
66.145	2487.133
67.039	2171.733
67.486	2643.955
68.380	1304.932
69.274	2170.633
70.168	2406.414
73.296	3428.494
73.296	2956.056
73.296	2326.132
74.413	2325.582
75.531	3033.695
77.542	2245.303
78.659	3425.854
78.659	5866.799
79.553	4842.740
80.670	3503.608
81.341	3503.278
82.235	4290.240
82.905	4289.910
83.128	3502.398
83.575	3265.957
84.246	4367.989
85.587	3737.409
85.810	5390.842
88.268	2476.246
88.492	4523.382
89.385	3026.877
89.385	5231.601
91.173	6175.605
92.290	5545.131
93.184	5072.253
96.536	4440.680
96.536	6802.886
96.760	6487.816
97.877	6959.708
101.229	7430.496
101.229	7666.717
102.123	7981.237
105.251	8373.401
105.251	8845.843
106.145	4987.132
106.145	10420.203
106.145	10892.645
106.816	8845.073
107.933	9631.921
109.050	10025.072
109.050	8529.009
109.050	9158.933
109.721	9394.824
110.838	10024.193
112.626	10102.054
112.849	10810.605
113.296	9944.246
113.966	11676.198
115.084	10888.246
115.307	11360.576
115.754	12383.979
116.201	13879.822
116.201	11360.136
117.095	11674.658
117.095	10021.113
117.095	10493.555
118.883	11280.078
118.883	11673.779
119.106	10965.006
119.330	12618.441
120.000	12618.111
120.447	12224.190
120.447	14586.394
121.117	12617.561
121.564	14585.844
122.235	11199.687
122.458	10254.695
122.682	12144.349
122.682	13640.412
123.799	14348.523
124.469	15135.595
125.140	12851.800
125.587	14190.163
126.927	14425.725
127.821	10015.835
131.397	16234.548
132.290	13950.643
132.290	17493.952
132.514	15761.558
137.207	20562.398
160.000	31889.765
161.117	33621.498];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Zein1991';

%% set weights for all real data
weights = setweights(data, []);
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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'LKZV'; % Cat of Life
metaData.links.id_ITIS = '160848'; % ITIS
metaData.links.id_EoL = '47453944'; % Ency of Life
metaData.links.id_Wiki = 'Beringraja_binoculata'; % Wikipedia
metaData.links.id_ADW = 'Raja_binoculata'; % ADW
metaData.links.id_Taxo = '1802408'; % Taxonomicon
metaData.links.id_WoRMS = '1021330'; % WoRMS
metaData.links.id_fishbase = 'Beringraja-binoculata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beringraja_binoculata)}}';   
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
bibkey = 'Zein1991'; type = 'Phdthesis'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {S. J. Zeiner}, ' ...
'year = {1991}, ' ...
'title  = {GROWTH CHARACTERISTICS AND ESTIMATES OF AGE AT MATURITY OF TWO SPECIES OF SKATES (\emph{Raja binoculata} AND \emph{Raja rhina}) FROM {M}ONTEREY {B}AY, {C}ALIFORNIA}, ' ...
'school = {California State University, Stanislaus and Moss Landing Marine Laboratories}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EberSmit2008'; type = 'article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {David A. Ebert  and Wade D. Smith and Gregor M. Cailliet}, ' ...
'year = {2008}, ' ...
'title  = {Reproductive biology of two commercially exploited skates, \emph{Raja binoculata} and \emph{R. rhina}, in the western {G}ulf of {A}laska}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {94}, ' ...
'pages = {48-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Raja_binoculata}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Beringraja_binoculata/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/2556}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

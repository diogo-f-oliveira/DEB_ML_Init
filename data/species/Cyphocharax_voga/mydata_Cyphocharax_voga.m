function [data, auxData, metaData, txtData, weights] = mydata_Cyphocharax_voga

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Curimatidae';
metaData.species    = 'Cyphocharax_voga'; 
metaData.species_en = 'Biru'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TP','TH','TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 02];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'SchiFial1998'; 
data.Li  = 26.3;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.1^3';
data.Wwp = 34.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','SchiFial1998'};
  comment.Wwp = 'based on 0.01445*Lp^3.05, see F1';
data.Wwi = 309.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.05, see F1: max published weight is 551.3 g';

% uni-variate data

% time-length
data.tL_f = [ ... % time (yr), total length (cm)
1.825	11.403
2.142	11.821
2.301	11.940
2.620	11.701
2.774	12.836
3.122	13.313
3.344	13.433
3.600	13.194
3.882	14.149
4.167	14.507
4.261	14.806
4.549	14.507
4.802	15.045
5.087	15.224
5.246	15.403
5.596	15.463
5.816	15.940
6.103	15.881
6.423	15.642
6.580	16.119];
data.tL_f(:,1) = 365 * (1.9+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time','total length','females'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HartBarb1993';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time (yr), total length (cm)
3.059	16.369
3.342	16.964
3.594	17.188
3.753	17.188
4.095	18.601
4.284	18.899
4.505	19.122
4.854	19.271
5.136	20.015
5.293	20.387
5.418	20.685
5.768	20.610
5.988	20.908
6.210	20.982
6.461	21.652
6.717	21.280];
data.tL_m(:,1) = 365 * (1.9+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time','total length','males'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HartBarb1993';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
2.411	0.193
2.605	2.603
9.792	11.560
10.082	12.781
10.179	17.579
10.854	20.028
10.999	17.645
11.144	21.249
11.384	17.675
11.627	24.880
12.302	23.737
16.069	67.151
16.118	71.945
16.936	62.430
16.986	74.410
17.083	78.011
17.229	86.405
17.421	84.026
17.517	80.441
17.758	75.669
17.759	87.645
17.808	91.242
18.292	103.257
18.388	98.474
18.435	86.502
18.436	100.873
18.676	86.521
18.678	108.078
18.773	91.319
19.111	98.532
19.112	103.322
19.113	112.903
19.402	106.938
19.549	124.914
19.740	110.558
20.222	114.189
20.322	139.347
20.324	153.718
20.367	116.596
20.947	126.223
21.000	164.551
21.144	156.179
21.191	150.195
21.240	152.594
21.339	174.159
21.482	163.392
21.774	180.182
21.916	162.229
21.918	177.798
22.206	162.252
22.210	194.588
22.498	183.832
22.544	168.267
22.596	201.804
22.640	164.682
22.694	212.590
22.834	170.685
22.885	193.444
22.984	216.206
23.031	207.827
23.033	223.396
23.076	176.693
23.078	192.262
23.083	236.573
23.270	189.882
23.366	181.506
23.371	227.016
23.412	167.139
23.414	186.300
23.418	217.439
23.562	210.264
23.613	229.430
23.663	246.201
23.807	237.829
23.854	231.845
23.898	198.315
23.945	189.936
23.948	215.086
23.953	253.409
23.998	223.473
24.093	217.492
24.242	253.432
24.291	257.029
24.384	230.689
24.386	242.665
24.485	264.230
24.524	189.982
24.580	248.669
24.627	246.278
24.718	198.381
24.767	205.570
24.768	212.756
24.769	222.337
24.775	266.649
24.820	239.107
25.010	218.763
25.111	257.095
25.156	233.146
25.354	271.485];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'HartBarb1993';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
3.623	0.145
5.169	2.602
7.971	7.504
9.952	17.164
10.531	17.187
11.208	19.609
11.208	19.609
11.546	19.623
11.884	24.427
14.589	52.079
15.072	62.877
15.217	68.871
15.507	62.895
15.604	67.689
16.087	73.696
16.232	64.121
16.425	59.338
16.522	72.516
16.667	74.917
16.763	77.316
16.908	66.543
17.198	83.321
17.198	90.507
17.295	78.535
17.488	80.938
17.585	88.127
17.585	82.139
17.633	88.129
17.778	95.320
17.826	100.113
17.971	86.945
18.309	108.515
18.551	100.142
18.696	116.914
18.744	108.533
18.986	114.530
19.179	108.550
19.469	136.107
19.469	108.562
19.565	116.949
19.565	97.787
19.855	139.715
19.855	113.367
19.903	127.741
19.952	120.557
20.000	121.756
20.000	118.164
20.242	148.113
20.290	132.546
20.386	128.958
20.531	142.137
20.531	151.718
20.821	134.963
20.966	156.526
20.966	143.352
21.014	167.306
21.014	145.749
21.063	139.763
21.256	160.130
21.304	154.144
21.304	145.761
21.401	169.717
21.498	162.535
21.498	176.906
21.691	167.333
21.739	138.592
21.739	151.766
21.836	163.746
21.836	178.117
21.884	192.490
21.932	158.959
21.981	190.099
22.077	146.989
22.077	179.324
22.126	163.758
22.174	175.735
22.319	172.148
22.415	181.733
22.560	197.308
22.657	172.162
22.657	194.916
23.478	214.111];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'HartBarb1993';
comment.LW_m = 'data for females';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
18.086	12565.038
18.186	30969.385
18.891	15530.126
18.992	37979.417
19.198	33438.656
19.596	51776.264
19.908	33728.603
20.602	56943.297];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'SchiFial1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.LN = 3 * weights.LN;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = '1.9 yr had to be added to tL data to arrive at a natural fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01445*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BWXZ'; % Cat of Life
metaData.links.id_ITIS = '640945'; % ITIS
metaData.links.id_EoL = '219776'; % Ency of Life
metaData.links.id_Wiki = 'Cyphocharax'; % Wikipedia
metaData.links.id_ADW = 'Cyphocharax_voga'; % ADW
metaData.links.id_Taxo = '172685'; % Taxonomicon
metaData.links.id_WoRMS = '1015538'; % WoRMS
metaData.links.id_fishbase = 'Cyphocharax-voga'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyphocharax}}';
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
bibkey = 'HartBarb1993'; type = 'Article'; bib = [ ... 
'doi = {10.1080/01650529309360901}, ' ...
'author = {Hartz, S.M. and Barbieri, G.}, ' ... 
'year = {1993}, ' ...
'title = {Growth of \emph{Cyphocharax voga} ({H}ensel, 1869) in {E}mboaba Lagoon, {R}io {G}rande do {S}ul, {B}razil}, ' ...
'journal = {Studies on Neotropical Fauna and Environment}, ' ...
'volume = {28(3)}, ' ...
'pages = {169–178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchiFial1998'; type = 'Article'; bib = [ ... 
'author = {Lucia Cabral Schifino and Clarice Bernhardt Fialho and Jose Roberto Verani}, ' ... 
'year = {1998}, ' ...
'title = {REPRODUCTIVE ASPECTS OF \emph{Cyphocharax voga} ({H}ENSEL) FROM {C}USTOOIAS {L}AGOON, {R}IO {G}RANDE DO {S}UL, {B}RAZIL ({C}HARACIFORMES, {C}URIMATIDAE)}, ' ...
'journal = {Revta bras. Zool.}, ' ...
'volume = {15(3)}, ' ...
'pages = {767-773}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyphocharax-voga.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Tigriopus_brevicornis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Harpacticoida'; 
metaData.family     = 'Harpacticidae';
metaData.species    = 'Tigriopus_brevicornis'; 
metaData.species_en = 'Copepod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am';'Wwb';'Wwp';'Wwi'}; 
metaData.data_1     = {'t-V';'t-WN';'t-JN';'T-Ri'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 06 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 06 17]; 

%% set data
% zero-variate data

data.am = 2+12+23;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Harr1973';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on 2 d embryo guessed, 12 d juvenile from JageHeus2021 and 23 d adult from Harr1973';
  
data.Wwb = 0.253; units.Wwb = 'mug';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JageHeus2021';
data.Wwp = 22.4;  units.Wwp = 'mug';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'JageHeus2021';
data.Wwi = 27.3;  units.Wwi = 'mug';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'JageHeus2021';

 
% uni-variate data
% time-volume data
data.tV_f = [ ... % time since birth (d), volumetric length (mum)
0.121	63.219
0.493	69.679
0.700	45.712
0.702	80.912
0.841	69.735
0.933	64.149
1.051	85.768
1.120	76.979
1.259	74.601
1.375	85.020
1.514	72.242
1.631	89.861
1.653	73.065
1.816	80.291
1.864	102.698
1.933	97.909
2.002	85.120
2.118	82.739
2.211	91.554
2.281	97.165
2.445	113.191
2.491	105.999
2.605	86.817
2.675	92.428
2.745	98.039
2.770	120.443
2.886	116.462
3.047	96.488
3.140	102.902
3.350	110.136
3.420	125.347
3.443	117.351
3.606	130.977
3.721	114.195
3.722	127.796
3.862	134.218
3.907	119.025
3.978	135.037
4.094	130.255
4.233	136.677
4.302	123.088
4.558	130.329
4.605	143.137
4.883	135.181
4.928	123.989
5.208	145.633
5.322	108.051
5.394	143.263
5.787	132.126
5.927	131.348
6.043	141.767
6.345	140.215
6.392	150.623
6.461	145.034
6.648	158.664
6.741	165.079
6.787	153.886
6.901	133.904
6.973	165.116
7.134	149.142
7.135	160.342
7.366	141.179
7.392	173.183
7.577	173.212
7.646	163.623
7.693	173.231
7.807	140.449
7.808	159.649
7.810	182.050
8.017	161.283
8.042	186.087
8.065	178.090
8.228	182.916
8.389	175.742
8.391	197.343
8.460	187.754
8.577	196.572
8.762	191.002
8.784	182.206
8.856	205.417
8.857	217.417
8.995	199.839
9.182	219.069
9.297	215.088
9.413	207.906
9.437	219.110
9.483	211.917
9.623	222.340
9.784	208.765
9.809	235.970
9.878	219.180
10.039	201.606
10.041	228.007
10.088	244.814
10.135	246.422
10.252	259.240
10.321	248.051
10.368	256.059
10.437	256.070
10.438	264.070
10.554	264.089
10.623	255.300
10.625	280.100
10.694	268.111
10.786	257.726
10.926	270.548
11.017	254.563
11.018	263.363
11.086	244.974
11.134	260.981
11.181	275.389
11.389	256.222
11.529	265.045
11.530	277.845
11.760	258.682
11.784	265.085
11.810	305.090
11.879	292.301
11.900	269.104
11.901	275.504
11.995	297.119
11.996	305.919
12.066	314.731
12.365	281.978
12.507	310.001
12.622	301.220
12.622	307.620
12.831	306.853]; 
data.tV_f(:,2) = (data.tV_f(:,2)/ 1e4).^3; % convert mum to cm^3
units.tV_f  = {'d', 'cm^3'};  label.tV_f = {'time since birth', 'volume', 'female'};  
temp.tV_f   = C2K(20);  units.temp.tV_f = 'K'; label.temp.tV_f = 'temperature';
bibkey.tV_f = 'JageHeus2021';
comment.tV_f = 'Data for female; volumes estimated by V = A*H*2/3, where A is easured projected area and H is heigth as inferred from width';
%
data.tV_m = [ ... % time since birth (d), volumetric length (mum)
0.070	65.093
0.136	71.831
0.245	69.594
0.333	81.571
0.376	71.100
0.551	73.358
0.660	71.122
0.681	62.146
0.770	75.619
0.791	66.643
0.857	80.862
0.900	64.406
0.901	80.865
0.966	68.900
1.010	77.133
1.053	71.899
1.098	83.873
1.360	86.137
1.447	75.669
1.600	80.170
1.602	105.606
1.774	80.183
1.862	89.167
1.863	99.641
1.907	106.377
1.928	97.401
2.037	91.424
2.060	98.907
2.191	101.910
2.386	89.206
2.584	106.428
2.607	119.148
2.716	122.896
2.781	112.427
2.782	127.390
2.956	118.426
3.020	101.223
3.218	122.186
3.305	109.474
3.459	122.204
3.547	138.669
3.589	113.236
3.590	131.939
3.744	136.440
3.896	130.466
3.939	120.744
4.005	135.711
4.070	125.990
4.114	122.253
4.289	128.251
4.485	128.266
4.814	140.260
5.032	141.025
5.119	135.046
5.402	126.838
5.752	135.094
6.145	135.871
6.277	144.859
6.585	171.814
6.758	161.353
6.802	165.846
7.109	177.839
7.196	171.860
7.348	166.635
7.678	192.844
7.809	194.350
7.961	191.369
8.070	188.384
8.071	201.851
8.487	218.341
8.640	216.108
8.988	201.919
9.274	225.133
9.491	213.179
9.494	247.593
9.603	240.120
9.756	243.872
9.756	253.598
9.907	226.676
10.477	250.659
10.520	242.433
10.825	238.715
10.980	259.674
11.001	247.706
11.353	294.116
11.899	286.676
12.617	258.301
12.749	268.784];
data.tV_m(:,2) = (data.tV_m(:,2)/ 1e4).^3; % convert mum to cm^3 
units.tV_m  = {'d', 'cm^3'};  label.tV_m = {'time since birth', 'volume', 'male'};  
temp.tV_m   = C2K(20);  units.temp.tV_m = 'K'; label.temp.tV_m = 'temperature';
bibkey.tV_m = 'JageHeus2021';
comment.tV_m = 'Data for male; volumes estimated by V = A*H*2/3, where A is easured projected area and H is heigth as inferred from width';

% time-nitrogen content 
data.tWN = [ ... % time since birth (d), nitrogen content (mug)
1.151	0.030
2.705	0.033
4.375	0.054
5.238	0.065
6.216	0.079
8.632	0.176
10.818	0.263
12.714	0.401
14.782	0.557
17.770	0.789
24.496	1.187
30.593	1.388];
units.tWN  = {'d', 'mug N'};  label.tWN = {'time', 'nitrogen content'};  
temp.tWN   = C2K(15);  units.temp.tWN = 'K'; label.temp.tWN = 'temperature';
bibkey.tWN = 'Harr1973';

% time-nitrogen excretion 
data.tJN = [ ... % time since birth (d), nitrogen excretion (mug/d)
1.159	0.014
2.656	0.014
5.264	0.047
8.689	0.105
12.770	0.212
14.923	0.257
17.724	0.334
24.841	0.527
30.780	0.544];
units.tJN  = {'d', 'mug N/d'};  label.tJN = {'time', 'nitrogen excretion'};  
temp.tJN   = C2K(15);  units.temp.tJN = 'K'; label.temp.tJN = 'temperature';
bibkey.tJN = 'Harr1973';

% temperature-reproduction rate
data.TR = [ ... % temperature (C), reproduction rate (eggsper clutch/ clutch interval in #/d)
  5 25.2/15.0
 10 27.5/6.3
 15 30.1/3.0
 20 28.3/1.9
 23 35.1/1.2];
units.TR  = {'C', '#/d'};  label.TR = {'temperature', 'reproduction rate'};  
bibkey.TR = 'Harr1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tV_f = 5 * weights.tV_f;
weights.tV_m = 5 * weights.tV_m;
%weights.Wwp = 3 * weights.Wwp;
%weights.tJN = 0 * weights.tJN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 5 * weights.psd.kap;
%data.psd.p_M = 500; weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tV_f','tV_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = ['Growth in volume ceases some 1.5 d at transition from naupliar to copepodite stages and permanently at puberty; ' ...
     'the fist hold is here ignored and is also not visible in t-WN data'];
D2 = 'The temperature for tV data had to be guessed';
D3 = 'Males are assumed not to differ from females';
D4 = 'tJN data was ignorned because out of range; it is hard to believe that a 1.4 mug N animal excreates 0.55 mug N/d.';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = '6 nauplier stages, and 6 copepodite stage; nauplier stages 1-2 do not feed';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56W5P'; % Cat of Life
metaData.links.id_ITIS = '86378'; % ITIS
metaData.links.id_EoL = '46536865'; % Ency of Life
metaData.links.id_Wiki = 'Tigriopus_brevicornis'; % Wikipedia
metaData.links.id_ADW = 'Tigriopus_brevicornis'; % ADW
metaData.links.id_Taxo = '33558'; % Taxonomicon
metaData.links.id_WoRMS = '116183'; % WoRMS


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JageHeus2021'; type = 'Article'; bib = [ ... 
'doi = {0.1016/j.seares.2021.102075}, '...
'author = {T. Jager and J. Heuschele and T. Lode and K Borg{\o}}, ' ... 
'year = {2021}, ' ...
'title = {Analysing individual growth curves for the copepod \emph{Tigriopus brevicornis}, while considering changes in shape}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {174}, ' ...
'pages = {102075}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1973'; type = 'Article'; bib = [ ... 
'author = {R. P. Harris}, ' ... 
'year = {1973}, ' ...
'title = {FEEDING, GROWTH, REPRODUCTION AND NITROGEN UTILIZATION BY THE HARPACTICOID COPEPOD, \emph{Tigriopus brevicornis}}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {35}, ' ...
'pages = {785-800}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


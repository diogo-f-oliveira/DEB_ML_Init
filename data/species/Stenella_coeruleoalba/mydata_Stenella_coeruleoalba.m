function [data, auxData, metaData, txtData, weights] = mydata_Stenella_coeruleoalba

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Stenella_coeruleoalba'; 
metaData.species_en = 'Striped dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 350;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 1.5*365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Miya1977';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2834;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3025;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 57.5*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 100; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'AnAge';
data.Li = 225; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Miya1977';
data.Lim = 240; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'Miya1977';

data.Wwb = 10e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwim = 112.5e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight'; bibkey.Wwim = 'AnAge';  

data.Ri  = 1.5/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 calves per litter, 1 litter per 3 yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
0.361	154.456
1.641	173.137
2.593	185.260
3.512	191.476
4.464	196.707
5.514	202.921
6.532	206.181
7.484	212.068
8.501	215.984
9.486	218.589
10.536	221.191
11.586	224.122
12.538	225.415
13.490	225.394
14.508	225.700
15.460	225.022
16.543	224.670
17.527	224.977
18.479	227.582
19.497	225.590
20.514	226.553
21.499	222.593
22.451	228.480
23.468	231.740
24.584	226.136
25.569	224.801
26.521	227.078
27.407	222.792]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Miya1977';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.591	153.138
1.280	174.457
2.396	185.921
3.381	192.792
4.398	199.991
5.350	204.565
6.335	209.795
7.418	214.039
8.337	217.629
9.289	221.875
10.339	225.463
11.357	231.020
12.309	233.625
13.326	234.588
14.311	236.207
15.328	234.544
16.280	235.836
17.396	237.781
18.348	238.416
19.333	236.754
20.383	237.387
21.400	240.319
22.319	235.047
23.337	241.918
24.289	226.142
25.274	227.433
26.324	235.616
27.374	231.983
28.425	239.837
29.278	243.101]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Miya1977';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ...
2.675	2.298
2.959	1.995
3.714	3.036
3.794	3.494
4.030	3.158
4.851	4.177
6.458	4.701
6.627	10.289
6.755	8.586
7.042	9.682
8.629	8.919
9.186	10.897
12.028	21.099
12.065	32.826
12.583	39.319
13.636	33.457
14.855	59.871
15.445	46.092
16.456	63.534
17.204	107.081
17.525	82.453
17.904	94.887
18.241	74.546
19.022	87.513
19.432	100.710
20.252	109.099
20.707	141.636
21.110	120.585
22.440	120.521
22.517	195.197
24.401	166.097
24.436	203.056
24.446	215.671
26.534	228.907
27.007	156.242
27.625	215.441
29.442	309.140
30.675	321.700
31.983	370.148
32.641	370.082
32.674	425.967
32.688	452.431
37.844	777.319
38.579	661.788
38.623	777.181
45.538	987.666
46.728	2118.852
49.532	1416.967
53.907	2202.983
54.977	1992.078
54.977	1992.078
57.305	2201.808
63.550	2743.932
67.517	2530.696
67.594	2971.964
70.445	3219.519
73.480	3934.515
75.078	4619.741
79.742	4092.920
81.430	4434.634
81.476	4805.734
84.889	5000.993
86.723	5755.158
86.760	6112.708
88.622	6894.603
88.659	7322.942
92.124	5202.335
96.215	7617.767
100.403	9887.908
102.266	7462.265
102.280	7613.705
106.701	9493.400
106.792	10709.630
126.506	26412.080
134.384	23875.015
145.900	26379.228
152.119	30351.902
187.296	55357.659
203.258	57586.371
203.374	62405.322
212.013	70375.252
212.074	73260.676
216.809	93217.889
217.334	131169.274
225.538	77770.629
230.344	85973.733
230.475	93168.179
230.967	125935.914
235.353	100946.720
235.420	105085.591
235.621	118548.468
240.677	133712.345
245.771	144875.918
250.937	153849.231
260.669	104992.211
260.891	118443.125
261.040	128354.699
261.300	147737.224
261.486	163349.319];
units.LW  = {'cm', 'g'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'MiyaFuji1981';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 50 * weights.Li;
weights.Lim = 50 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6ZJDC'; % Cat of Life
metaData.links.id_ITIS = '180434'; % ITIS
metaData.links.id_EoL = '46559283'; % Ency of Life
metaData.links.id_Wiki = 'Stenella_coeruleoalba'; % Wikipedia
metaData.links.id_ADW = 'Stenella_coeruleoalba'; % ADW
metaData.links.id_Taxo = '68735'; % Taxonomicon
metaData.links.id_WoRMS = '137107'; % WoRMS
metaData.links.id_MSW3 = '14300089'; % MSW3
metaData.links.id_AnAge = 'Stenella_coeruleoalba'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stenella_coeruleoalba}}';
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
bibkey = 'Miya1977'; type = 'article'; bib = [ ... 
'author = {N. Miyazaki}, ' ... 
'year = {1977}, ' ...
'title = {Growth and reproduction of \emph{Stenella coeruleoalba} of the {P}acific coast of {J}apan}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {29}, ' ...
'pages = {21--48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiyaFuji1981'; type = 'article'; bib = [ ... 
'author = {N. Miyazaki and Y. Fujise and T. Fujiyama}, ' ... 
'year = {1981}, ' ...
'title = {Body and organ weight of striped and spotted dolphins off the {P}acific coast of {J}apan}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {33}, ' ...
'pages = {27--67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Stenella_coeruleoalba}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Stenella_coeruleoalba/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Alopias_vulpinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Alopiidae';
metaData.species    = 'Alopias_vulpinus'; 
metaData.species_en = 'Common thresher'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2020 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data

data.ab = 1.7*365;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(23.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 12 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GervNata2013';
  temp.tp = C2K(23.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 8 * 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'GervNata2013';
  temp.tpm = C2K(23.2); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(23.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 81;       units.Lb  = 'cm';  label.Lb  = 'fork length at birth'; bibkey.Lb  = 'GervNata2013';  
  comment.Lb = 'at TL 12-40 cm, the yolk sac is completely resorbed; birth at PCL 72-91 cm, TL 173 cm';
data.Lp  = 216;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females';  bibkey.Lp  = 'GervNata2013'; 
  comment.Lp = 'PCL 145-150 cm, TL 282-292 cm';
data.Lpm  = 188;   units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males';  bibkey.Lpm  = 'GervNata2013'; 
  comment.Lpm = 'PCL 140-145 cm, TL 267-276 cm';
data.Li  = 274.5;      units.Li  = 'cm';  label.Li  = 'ultimate fork length for females';    bibkey.Li  = 'GervNata2013';
data.Lim  = 228;     units.Lim  = 'cm';  label.Lim  = 'ultimate fork length for males';    bibkey.Lim  = 'GervNata2013';

data.Wwp = 149.6e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'GervNata2013';
  comment.Wwp = 'based on 4e?5*Lp^2.8156, see F2';
data.Wwpm = 101.2e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'GervNata2013';
  comment.Wwim = 'based on 4e?5*Lpm^2.8156, see F2';
data.Wwi = 293.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'GervNata2013';
  comment.Wwi = 'based on 4e?5*Li^2.8156, see F2';
data.Wwim = 174.2e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'GervNata2013';
  comment.Wwim = 'based on 4e?5*Lim^2.8156, see F2';

data.Ri  = 4/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter, 1 l;itter per 2 yrs assumed';
  
 % uni-variate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.317	87.674
0.444	99.603
0.444	98.565
0.444	88.188
0.476	102.715
1.428	110.977
2.284	128.064
3.934	150.307
4.981	185.028
5.044	177.761
5.108	154.409
5.108	150.777
5.964	183.949
5.964	176.166
5.996	186.542
6.028	180.315
6.155	176.677
6.885	177.685
6.948	179.239
7.011	177.679
7.011	198.434
7.043	166.782
7.107	164.704
7.107	195.836
7.931	191.651
7.963	185.942
7.995	175.563
7.995	197.874
8.058	171.409
8.058	209.806
8.090	168.814
8.090	178.672
8.090	194.757
8.090	205.653
8.122	181.265
8.122	182.303
8.154	188.528
8.598	190.066
8.915	177.600
8.915	171.893
8.947	207.693
8.947	195.241
8.947	182.788
8.978	184.343
9.010	230.002
9.010	190.049
9.042	187.972
9.074	197.311
9.105	193.677
9.137	219.101
9.518	212.339
9.645	181.721
9.930	183.266
9.930	199.351
9.930	215.436
9.962	202.463
9.994	194.159
10.089	190.004
10.089	208.165
10.089	221.137
10.121	197.267
10.184	194.151
10.945	203.978
10.977	206.571
10.977	198.788
11.009	218.504
11.041	215.908
11.041	211.239
11.041	208.125
11.041	195.672
11.041	193.078
11.041	185.295
11.072	228.360
11.104	203.453
11.104	197.226
11.136	207.084
11.929	196.154
11.961	212.238
12.024	204.971
12.056	204.451
12.056	234.027
12.056	237.659
12.088	196.667
12.088	190.440
12.088	186.808
12.088	209.120
12.151	222.089
12.944	221.018
13.039	225.165
13.039	227.240
13.039	240.212
13.071	257.852
13.103	214.266
13.103	217.379
13.103	223.087
13.135	226.199
13.135	232.425
13.198	208.555
13.642	221.508
13.928	238.619
13.991	214.748
14.023	234.983
14.086	214.744
14.118	203.847
14.118	237.054
14.118	245.875
15.070	246.354
15.133	224.559
15.197	248.424
15.197	230.783
16.022	219.853
16.022	225.560
16.022	233.862
16.022	243.202
16.117	222.443
16.117	235.933
16.117	239.566
17.989	220.809
17.989	224.441
18.020	218.213
18.115	244.152
18.147	242.076
18.179	239.999
19.067	241.000
19.067	244.113
19.099	237.885
20.019	241.998
20.114	233.692
21.066	250.256
21.098	254.406
21.129	261.669
21.986	261.114
21.986	263.709
22.145	263.183
24.080	243.386];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(23.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'GervNata2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.222	87.159
0.254	107.913
0.286	73.666
0.317	92.344
0.571	111.532
1.079	106.322
1.332	122.396
1.396	114.611
2.348	128.062
3.109	156.049
4.981	179.320
5.044	185.544
5.171	159.595
5.901	161.641
5.933	177.724
6.123	168.895
7.011	164.189
7.011	156.925
7.043	202.584
7.043	195.838
7.043	188.574
7.043	180.791
7.138	163.146
7.265	173.518
7.773	183.874
7.900	167.784
7.931	202.028
8.027	175.043
8.027	183.345
8.058	231.079
8.090	170.889
8.122	164.662
8.122	202.539
8.915	203.025
8.978	183.305
9.010	213.398
9.042	190.048
9.042	179.152
9.105	223.772
9.137	245.563
9.962	182.746
9.994	179.112
10.025	199.866
10.025	204.017
10.184	195.189
10.311	205.042
10.343	206.598
10.977	220.062
10.977	209.166
11.041	183.220
11.136	160.904
11.136	227.319
11.992	226.246
11.992	215.350
12.024	203.934
12.024	197.707
13.039	203.373
13.135	210.633
13.991	191.918
14.023	222.530
14.086	202.291
16.053	227.115
18.972	207.796
19.067	222.839
19.099	203.121
19.162	228.024
22.049	225.310
23.001	227.346];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(23.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'GervNata2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
D2 = 'Mean temp 17 C is guessed, usually 0 - 152 m deep';
metaData.bibkey.D2 = 'fishbase'; 
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Ovoviviparous, but oviphagy occurs';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in kg = 4e-5 * (FL, cm)^2.8156';
metaData.bibkey.F2 = 'GervNata2013'; 
F3 = 'length - length: FL (cm) = 0.5168 * (TL, cm) + 16.466';
metaData.bibkey.F3 = 'GervNata2013'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'C5KF'; % Cat of Life
metaData.links.id_ITIS = '159916'; % ITIS
metaData.links.id_EoL = '46559744'; % Ency of Life
metaData.links.id_Wiki = 'Alopias_vulpinus'; % Wikipedia
metaData.links.id_ADW = 'Alopias_vulpinus'; % ADW
metaData.links.id_Taxo = '41895'; % Taxonomicon
metaData.links.id_WoRMS = '105836'; % WoRMS
metaData.links.id_fishbase = 'Alopias-vulpinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alopias_vulpinus}}';
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
bibkey = 'GervNata2013'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00028487.2013.815658}, ' ...
'author = {Brian J. Gervelis and Lisa J. Natanson}, ' ... 
'year = {2013}, ' ...
'title = {Age and Growth of the Common Thresher Shark in the {W}estern {N}orth {A}tlantic {O}cean}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {142}, ' ...
'pages = {1535-1545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Alopias-vulpinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Alopias_vulpinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


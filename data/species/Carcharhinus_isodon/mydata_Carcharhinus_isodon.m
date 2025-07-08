function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_isodon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_isodon'; 
metaData.species_en = 'Finetooth shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW','MAE'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 14.4*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'CarlCort2003';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 58.5;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '51-64 cm';
data.Lp  = 123;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'CarlCort2003'; 
data.Lpm  = 118.7;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'CarlCort2003'; 
data.Li  = 190;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 55.5e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.10, see F1';

data.Ri  = 4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.032	62.716
0.056	53.333
0.104	66.173
0.140	65.185
0.140	62.222
0.141	60.247
0.164	70.123
0.297	70.123
0.297	66.667
0.298	64.198
0.381	76.543
0.816	81.481
0.817	73.580
0.827	95.309
0.937	86.914
0.986	81.481
1.093	96.296
1.094	93.333
1.094	90.370
1.094	88.395
1.119	84.444
1.217	64.691
1.228	80.000
1.941	85.926
1.963	116.049
1.966	78.025
1.989	98.272
2.060	108.642
2.060	106.173
2.061	102.716
2.061	94.321
2.062	91.358
2.062	88.889
2.062	82.963
2.255	92.346
2.943	118.519
2.943	116.049
2.944	97.778
2.967	109.630
2.992	110.617
3.076	108.148
3.089	104.198
3.100	120.988
3.100	117.531
3.100	115.062
3.101	101.728
3.101	98.765
3.245	115.556
3.294	106.667
3.306	111.111
3.318	116.543
3.862	124.444
3.946	121.975
4.031	120.000
4.054	132.346
4.055	129.383
4.079	126.914
4.104	116.049
4.104	113.086
4.117	109.630
4.285	123.457
4.285	120.000
4.285	117.037
4.818	119.506
4.925	132.840
4.938	126.420
4.999	118.519
5.047	129.877
5.058	133.827
5.071	125.432
5.082	137.778
5.109	109.630
6.014	133.827
6.074	139.753
6.086	137.778
6.221	115.062
6.293	128.395
6.293	123.951
6.957	145.185
7.030	137.778
7.089	150.123
7.103	133.827
7.961	148.148
7.961	143.704
7.985	142.222];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'CarlCort2003';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.070	59.387
0.082	61.840
0.178	54.969
0.179	60.368
0.179	63.313
0.180	77.055
0.398	77.055
0.868	53.497
1.003	83.926
1.040	89.325
1.077	98.160
1.087	75.583
1.184	83.926
1.209	89.325
1.209	92.761
1.221	86.380
1.232	80.000
1.367	95.706
1.946	81.963
2.020	101.104
2.068	89.816
2.080	97.178
2.105	105.521
2.178	108.466
2.189	88.344
2.189	93.742
2.202	100.123
2.203	110.920
2.214	105.031
2.358	94.233
3.037	112.393
3.087	124.663
3.110	115.337
3.135	118.773
3.171	122.209
3.194	100.613
3.194	102.577
3.206	106.994
3.231	117.301
3.316	122.209
3.400	109.939
3.400	115.337
3.436	105.521
4.006	119.755
4.055	135.460
4.078	114.847
4.091	131.534
4.103	126.135
4.187	119.264
4.188	127.117
4.198	105.521
4.199	112.883
4.211	116.319
4.260	123.681
4.344	122.209
4.405	120.245
4.405	123.190
4.416	110.429
4.417	115.337
4.851	99.141
5.022	124.172
5.071	135.951
5.107	130.552
5.192	129.571
5.204	132.025
5.239	108.957
6.051	127.117
6.099	131.043
6.148	134.969
6.159	128.098
6.196	131.043
6.207	121.227
6.208	133.988
7.031	129.571
7.200	135.460
7.211	119.755
7.224	130.061
8.047	131.534
8.217	136.933
8.227	109.448];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'CarlCort2003';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00479 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3NQ'; % Cat of Life
metaData.links.id_ITIS = '160409'; % ITIS
metaData.links.id_EoL = '46559782'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_isodon'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_isodon'; % ADW
metaData.links.id_Taxo = '101349'; % Taxonomicon
metaData.links.id_WoRMS = '105791'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-isodon'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_isodon}}';
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
bibkey = 'CarlCort2003'; type = 'Article'; bib = [ ... 
'author = {John K. Carlson and Enric Cort\''{e}s and Dana M. Bethea}, ' ... 
'year = {2003}, ' ...
'title = {Life history and population dynamics of the finetooth shark (\emph{Carcharhinus isodon}) in the northeastern {G}ulf of {M}exico}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {101}, ' ...
'pages = {281-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-isodon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


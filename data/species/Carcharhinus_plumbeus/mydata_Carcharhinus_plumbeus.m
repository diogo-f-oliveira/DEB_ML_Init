function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_plumbeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_plumbeus'; 
metaData.species_en = 'Sandbar shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Le'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2017 08 03];              
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

data.ab = 1.12*365;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'Wass1973';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 13 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';
  temp.tp = C2K(27); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 64;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wass1973';  
data.Lp  = 154.9;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females';  bibkey.Lp  = 'Wiki'; 
data.Lpm  = 151.6;   units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males';  bibkey.Lpm  = 'Wiki'; 
data.Li  = 250;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 180;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwi = 1.179e5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 5.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Wass1973';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'varies between 1 and 8 pups per yr';

 % uni-variate data
 
% time-length for embryo
data.tLe = [ % age (yr), total length (cm)
0.004	0.116
0.005	5.871
0.074	1.902
0.095	8.499
0.099	6.414
0.103	5.187
0.104	7.636
0.107	2.123
0.109	2.733
0.110	3.101
0.111	4.446
0.128	8.230
0.129	5.902
0.136	5.897
0.137	6.387
0.144	10.054
0.146	9.073
0.148	9.686
0.150	4.418
0.151	0.865
0.152	2.824
0.153	3.437
0.154	3.804
0.155	5.885
0.177	6.235
0.178	12.724
0.192	3.774
0.193	9.896
0.194	11.977
0.195	16.140
0.197	4.995
0.222	10.365
0.230	11.338
0.231	13.175
0.234	5.336
0.288	18.520
0.291	21.335
0.294	14.108
0.301	21.082
0.333	17.018
0.334	21.303
0.381	24.697
0.382	28.370
0.386	30.938
0.401	25.294
0.444	40.446
0.597	42.905
0.614	48.280
0.624	38.723
0.637	50.835
0.644	53.769
0.672	51.177
0.686	52.391
0.688	51.532
0.696	46.629
0.698	47.607
0.713	50.167
0.767	56.373
0.768	51.718
0.805	56.956
0.806	57.324
0.823	49.229
0.883	57.756
0.913	50.387
0.915	63.978
0.916	57.242
0.933	67.271
0.968	63.939
0.988	61.843
1.107	62.245
1.121	63.214
1.122	66.887];
[d i] = sort(data.tLe(:,1)); data.tLe(:,1) = data.tLe(i,1); % sort ages
data.tLe(:,1) = data.tLe(:,1) * 365; % convert yr to d
units.tLe   = {'d', 'cm'};  label.tLe = {'age', 'total length'};  
temp.tLe    = C2K(27);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe  = 'Wass1973';

% time-length
data.tL_f = [ ... % time since birth (yr), precaudal length (cm)
0.092	45.273
0.092	47.911
0.092	52.526
0.092	60.109
0.092	62.416
0.046	53.846
0.046	57.142
0.000	49.231
0.916	63.419
0.916	65.068
0.962	57.815
0.962	60.453
0.962	66.387
0.962	66.387
0.962	69.354
1.924	72.004
1.924	73.323
1.924	74.971
1.924	82.554
2.015	62.775
2.015	63.434
2.931	68.392
2.931	76.634
2.931	80.590
2.931	90.150
3.939	75.658
3.985	73.351
4.855	86.221
4.992	91.827
5.038	83.586
6.000	81.621
6.000	86.566
6.000	90.522
6.000	91.511
6.000	92.170
6.000	98.764
6.000	101.071
6.962	95.810
6.962	99.766
6.962	115.590
7.924	86.263
7.924	97.471
7.924	101.098
7.924	111.318
8.977	96.497
8.977	102.431
8.977	110.673
8.977	112.321
9.939	112.664
9.939	119.257
9.939	123.873
9.939	134.422
10.031	98.489
10.855	118.611
10.855	120.918
10.947	122.238
10.992	135.426
11.954	113.351
11.954	115.988
11.954	128.846
11.954	140.054
12.824	116.330
12.962	119.629
13.008	138.420
13.969	119.313
13.969	123.598
14.840	124.599
14.840	125.259
14.840	138.116
14.885	131.523
14.885	134.820
14.931	129.875
15.985	139.450
16.947	130.233
16.947	135.507
16.947	137.486
17.954	128.269
17.954	133.214
17.954	136.510
17.954	141.455
17.954	147.719
18.870	132.897
19.969	142.472
20.840	138.198
21.939	147.774
21.985	135.247
23.038	146.470];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) * 1.3; % convert precaudal length to total length
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'RomiGrub2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), precaudal length (cm)
0.002	46.281
0.003	47.934
0.004	49.587
0.004	51.240
0.005	52.893
0.006	55.537
0.007	58.843
0.937	58.182
0.938	60.165
0.939	62.149
0.939	63.471
0.940	65.124
0.987	67.769
0.988	70.413
1.922	78.017
2.009	62.810
2.009	64.793
2.011	69.091
2.012	70.083
2.012	72.066
2.898	78.347
2.899	80.661
2.939	63.802
2.948	84.959
3.924	84.298
3.925	86.612
3.967	75.702
3.969	79.669
4.945	78.347
4.946	80.992
4.949	87.603
5.883	99.504
5.972	86.942
5.972	88.926
5.973	91.570
5.974	93.223
6.015	78.347
6.951	94.215
7.972	87.603
7.975	96.198
7.978	104.132
7.980	108.099
8.954	100.496
9.932	106.116
9.933	108.430
9.938	119.339
9.983	115.372
9.983	117.355
11.008	120.331
11.938	120.331
11.939	122.314
11.980	108.430
12.028	113.719
12.080	125.620
12.864	110.083
12.865	113.058
13.011	128.926
14.036	132.231
14.961	119.339
16.128	131.240
16.917	127.273
17.011	129.587
17.940	125.620
19.011	128.595];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) * 1.3; % convert precaudal length to total length
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'RomiGrub2006';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'egg development is initially fuelled by yolk only, later also absorb nutrients from fluids in the oviducts';
metaData.bibkey.F1 = 'Wass1973'; 
F2 = 'Preferred temp 27 C,usually 20 - 65 m deep';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3Q8'; % Cat of Life
metaData.links.id_ITIS = '160289'; % ITIS
metaData.links.id_EoL = '46559788'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_plumbeus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_plumbeus'; % ADW
metaData.links.id_Taxo = '41983'; % Taxonomicon
metaData.links.id_WoRMS = '105797'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-plumbeus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_plumbeus}}';
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
bibkey = 'Wass1973'; type = 'Article'; bib = [ ... 
'author = {Wass, R. C.}, ' ... 
'year = {1973}, ' ...
'title = {Size, Growth, and Reproduction of the Sandbar Shark, \emph{Carcharhinus milberti}, in {H}awaii}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {27}, ' ...
'number = {4}, '...
'pages = {305--318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RomiGrub2006'; type = 'Article'; bib = [ ... 
'author = {J. G. Romine and R. D. Grubbs and J. A. Musick}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth of the sandbar shark, \emph{Carcharhinus plumbeus}, in {H}awaiian waters through vertebral analysis}, ' ...
'journal = {Environ Biol Fishs}, ' ...
'volume = {77}, ' ...
'pages = {229-239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-plumbeus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


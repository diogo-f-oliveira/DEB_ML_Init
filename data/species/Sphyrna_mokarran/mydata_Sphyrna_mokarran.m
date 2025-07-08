function [data, auxData, metaData, txtData, weights] = mydata_Sphyrna_mokarran

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Sphyrnidae';
metaData.species    = 'Sphyrna_mokarran'; 
metaData.species_en = 'Great hammerhead shark'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 11*30.5;     units.ab = 'd';      label.ab = 'age at birth';              bibkey.ab = 'Wiki';    
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 44*365;  units.am = 'd';      label.am = 'life span';                     bibkey.am = 'PierCarl2010';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 75;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';        bibkey.Lb  = 'PierCarl2010';
data.Lp  = 275;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty (female)'; bibkey.Lp  = 'Wiki';
data.Lpm  = 255;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty (male)';   bibkey.Lpm  = 'Wiki';
data.Li  = 610;  units.Li  = 'cm';  label.Li  = 'ultimate total length (female)';      bibkey.Li  = 'fishbase';

data.Wwi = 569e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00132*Li^3.10, see F3';

data.Ri  = 55/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'Wiki'; 
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-55 pups per litter, 1 litter per 2 yrs';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.000	68.459
0.000	60.731
0.000	54.104
0.000	114.827
0.000	83.912
0.000	79.496
0.886	193.194
0.906	119.218
0.908	111.490
0.910	102.657
0.911	97.136
0.914	87.199
0.917	78.366
0.992	146.819
1.464	134.662
1.654	125.825
1.845	112.571
1.848	102.634
2.671	176.588
2.771	155.608
2.773	147.879
2.774	143.463
2.776	136.838
2.955	168.853
2.956	163.332
3.799	165.520
3.892	171.038
3.984	177.660
3.988	162.203
3.989	158.890
3.993	141.225
3.998	122.455
4.179	147.845
4.842	124.642
4.924	165.492
4.926	158.867
4.927	154.451
4.933	133.473
5.014	179.843
5.106	187.570
5.677	154.433
5.787	93.704
7.714	251.543
7.889	299.016
7.911	213.999
8.938	232.744
9.780	237.139
9.971	223.886
10.706	282.385
10.810	242.635
10.905	238.216
10.907	230.487
11.661	216.115
12.857	302.206
12.865	272.395
12.870	252.521
12.876	230.439
14.745	252.475
14.849	212.725
16.614	273.407
17.555	260.135
20.932	253.427
23.738	277.649
35.726	322.623
38.739	272.864
43.790	318.008];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
data.tL_f(:,2) = data.tL_f(:,2)/0.786; % convert FL to TL
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(27.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PierCarl2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.000	71.608
0.000	65.435
0.000	79.012
0.750	117.263
1.031	106.145
1.031	99.972
1.031	91.330
1.031	83.922
1.781	139.457
1.969	130.810
1.969	127.106
1.969	91.304
2.063	122.166
3.000	172.757
3.000	166.584
3.000	156.708
3.000	150.535
3.000	143.128
3.844	178.907
3.938	145.571
3.938	157.917
3.938	197.423
4.031	162.852
4.031	190.013
4.125	171.492
4.875	197.397
4.875	185.051
4.875	145.545
4.875	138.138
5.063	208.503
5.813	188.729
6.000	161.564
6.094	201.067
6.938	225.736
6.938	194.871
7.031	219.560
7.031	156.597
7.125	210.916
7.125	205.977
8.156	214.591
9.000	231.852
9.094	218.269
9.094	202.220
10.031	205.898
10.031	210.836
10.031	219.478
10.031	239.231
10.125	229.352
10.969	195.995
11.063	246.610
11.063	237.968
12.000	226.831
12.000	233.004
12.094	244.113
12.094	265.100
12.938	208.287
13.031	234.210
13.031	240.383
13.031	246.556
13.031	252.729
13.969	228.012
15.094	230.450
16.031	234.128
17.063	250.149
19.031	247.626
21.188	256.209
31.125	241.121
36.188	275.550
41.250	298.868
42.469	298.835];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/0.786; % convert FL to TL
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};
  temp.tL_m = C2K(27.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PierCarl2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'leng-length from photo; FL = 0.786 * TL'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00132 * (TL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4Z2QK'; % Cat of Life
metaData.links.id_ITIS = '160515'; % ITIS
metaData.links.id_EoL = '46559948'; % Ency of Life
metaData.links.id_Wiki = 'Sphyrna_mokarran'; % Wikipedia
metaData.links.id_ADW = 'Sphyrna_mokarran'; % ADW
metaData.links.id_Taxo = '42009'; % Taxonomicon
metaData.links.id_WoRMS = '105817'; % WoRMS
metaData.links.id_fishbase = 'Sphyrna-mokarran'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyrna_mokarran}}';  
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
bibkey = 'PierCarl2010'; type = 'Article'; bib = [ ...  
'author = {Andrew N. Piercy and John K. Carlson and Michelle S. Passerotti}, ' ...
'year = {2010}, ' ...
'title  = {Age and growth of the great hammerhead shark, \emph{Sphyrna mokarran}, in the north-western {A}tlantic {O}cean and {G}ulf of {M}exico}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {61}, ' ...
'pages = {992-998}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sphyrna-mokarran.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
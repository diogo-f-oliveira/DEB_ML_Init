function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_rosenbergii

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_rosenbergii'; 
metaData.species_en = 'Giant river prawn'; 

metaData.ecoCode.climate = {'MA','Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'jiFr','0jMm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp % mean ambient reservoir water temperature in  EtimSank1998
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-W'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 17];

%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';     label.ab = 'age at birth';    bibkey.ab = 'Anon2002';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 32;  units.tj = 'd';     label.tj = 'time since birth at metam';    bibkey.tj = 'Wiki';   
  temp.tj = C2K(29);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '30-35 days';
data.tp = 9*30;  units.tp = 'd';     label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Macrobrachium vollenhovenii';
data.am = 2.5*365;  units.am = 'd';     label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Macrobrachium vollenhovenii';
 
data.Lj  = 7.7; units.Lj  = 'cm';   label.Lj  = 'total length at recruitment';  bibkey.Lj  = 'Anon2002';
data.Lp  = 11; units.Lp  = 'cm';   label.Lp  = 'length from eye-stalk to tip of tail at puberty';  bibkey.Lp  = 'Anon2002';
  comment.Lp = 'based on Wwp and LW data';
data.Li  = 17.5;   units.Li  = 'cm';   label.Li  = 'ultimate length from eye-stalk to tip of tail';  bibkey.Li  = 'Anon2002';

data.Wwb = 1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Anon2002';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.55 mm: pi/6*.055^2*.065';
data.Wwp = 17.5;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Anon2002';
  comment.Wwp = 'normally 15-20 g, but berried females have been observed as small as 6.5 g';
data.Wwi = 77;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Anon2002';

data.Ri  = 5*5e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5e4 eggs per clutch, 5 clutches per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (d), total length (cm)
 0	1.721 0.057
20	2.315 0.150
40	2.887 0.325
60	3.082 0.411
80	3.814 0.506];
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'eye-tail length', 'weight'};  
temp.tLW    = C2K(29);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'TaySuha2022'; treat.tLW = {1 {'length','weight'}};

%length-weight
data.LW = [ ... % length (cm), weight (g)
2.937	0.156
3.064	0.178
3.161	0.209
3.194	0.224
3.263	0.203
3.403	0.231
3.550	0.258
3.586	0.328
3.622	0.395
3.623	0.362
3.663	0.297
3.664	0.278
3.819	0.399
3.820	0.342
3.941	0.480
3.943	0.362
4.155	0.450
4.333	0.566
4.521	0.519
5.181	0.926
5.755	1.272
5.874	1.784
5.935	2.012
6.255	2.423
6.323	2.080
6.732	3.049
7.025	2.588
7.406	2.764
7.478	4.096
7.715	5.442
7.717	4.932
7.887	3.477
8.308	5.503
8.313	3.879
8.391	7.391
8.392	6.846
8.665	6.006
8.940	7.722
8.943	6.555
9.224	9.299
9.328	7.077
9.518	11.320
9.520	9.929
9.524	8.157
9.627	7.557
9.830	8.429
9.929	11.572
9.930	10.603
10.032	12.768
10.251	10.375
10.253	9.301
10.255	8.339
10.464	13.486
10.691	11.574
11.027	17.724
11.034	12.495
11.265	15.891
11.378	20.881
11.738	27.442
11.743	23.041
11.872	19.136
12.245	28.359
12.248	24.337
12.377	26.272
12.382	21.348
12.778	23.814
13.046	29.631
13.168	54.632
13.320	35.293
13.470	25.710
13.747	37.687
14.337	42.971
15.108	54.653
15.265	61.633
17.514	63.018];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'}; 
bibkey.LW = 'Anon2002';
comment.LW = 'length from behind the eye stalk to the tip of the tail';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.tp = 0 * weights.tp;
weights.tj = 0 * weights.tj;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Disccussion points
D1 = 'males are assumed not to differ from females (because of lack of data)';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'M. rosenbergii occurs in fresh waters, but the larvae depend on brackish water; males have 3 morpho-types';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9GQF3'; % Cat of Life
metaData.links.id_ITIS = '96343'; % ITIS
metaData.links.id_EoL = '46515413'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium_rosenbergii'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_rosenbergii'; % ADW
metaData.links.id_Taxo = '94420'; % Taxonomicon
metaData.links.id_WoRMS = '220137'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrobrachium_rosenbergii}}';
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
bibkey = 'TaySuha2022'; type = 'Article'; bib = [ ...
'doi = {10.1515/opag-2022-0085}, ' ...
'author = {Jolene Tay and Adriana Suhanizen and Malik Aziz and Noorlela Yassin and Takaomi Arai}, ' ...
'year = {2022}, ' ...
'title = {Effects of domestication and temperature on the growth and survival of the giant freshwater prawn (\emph{Macrobrachium rosenbergii}) postlarvae}, ' ...
'journal = {Open Agriculture}, ' ...
'volume = {7}, ' ...
'pages = {181–190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Anon2002'; type = 'techreport'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2002}, ' ...
'title = {FARMING FRESHWATER PRAWNS; A manual for the culture of the giant river prawn (\emph{Macrobrachium rosenbergii)}}, ' ...
'institution = {FAO FISHERIES TECHNICAL PAPER}, ' ...
'volume = {428}, ' ...
'howpublished = {\url{https://www.fao.org/4/y4100e/y4100e00.htm#TOC}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


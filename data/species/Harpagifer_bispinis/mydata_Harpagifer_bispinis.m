function [data, auxData, metaData, txtData, weights] = mydata_Harpagifer_bispinis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Harpagiferidae';
metaData.species    = 'Harpagifer_bispinis'; 
metaData.species_en = 'Magellan plunderfish'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 04];

%% set data
% zero-variate data

data.ab = 4*30.5;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'fishbase';   
  temp.ab = C2K(7.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Dani1983';   
  temp.am = C2K(7.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 9.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Dani1978';
  comment.Wwb = 'based egg diameter of 2.5 mm: pi/6*0.25^3'; 
data.Wwp = 5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Lp and LW data';
data.Wwi = 35; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Li and LW data';

data.GSI  = 0.028;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'Dani1978';   
  temp.GSI = C2K(8.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1	3.989 3.155
2	5.230 4.126
3	6.314 5.053
4	7.443 5.573
5	8.323 6.296
6	8.956 6.907
7	9.207 7.405
8	9.142 8.106
9	9.324 8.716];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1));  % convert yr to d
data.tL(:,2:3) = data.tL(:,2:3)*1.2;  % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(7.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dani1983'; treat.tL = {1 {'Paradise Harbor','Arthur Harbor'}};

% length-weight
data.LW_f = [ ... % log total length (mm), log wet weight (g)
3.929	1.327
3.931	1.327
3.969	1.274
3.984	1.641
3.987	1.451
4.006	1.512
4.022	1.548
4.042	1.515
4.043	1.386
4.068	1.826
4.091	1.802
4.092	1.717
4.094	1.588
4.108	1.959
4.109	1.660
4.109	1.757
4.119	1.838
4.119	1.761
4.123	1.870
4.129	1.838
4.157	1.834
4.158	2.019
4.158	1.716
4.169	1.829
4.172	2.096
4.172	1.918
4.172	1.753
4.173	2.136
4.182	2.043
4.185	2.173
4.188	2.177
4.188	2.128
4.189	2.124
4.200	2.128
4.205	2.084
4.205	2.051
4.206	2.144
4.234	1.877
4.236	2.217
4.238	2.386
4.243	2.342
4.245	2.309
4.248	2.386
4.249	2.313
4.250	2.055
4.261	2.136
4.261	2.507
4.272	2.257
4.272	2.224
4.273	2.293
4.274	2.515
4.278	2.515
4.291	2.511
4.293	2.467
4.294	2.596
4.299	2.523
4.302	2.426
4.305	2.644
4.313	2.466
4.318	2.523
4.327	2.596
4.331	2.180
4.342	2.563
4.364	2.720
4.369	2.708
4.372	2.591
4.378	2.599
4.392	2.841
4.406	2.926
4.420	2.894
4.443	2.768
4.443	2.688
4.501	3.139
4.544	3.438
4.556	3.430];
data.LW_f = exp(data.LW_f); data.LW_f(:,1) = data.LW_f(:,1)/10;
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight', 'females'};  
bibkey.LW_f = 'Dani1983';
%
data.LW_m = [ ... % log total length (mm), log wet weight (g)
3.902	1.654
3.910	1.375
3.920	1.654
3.963	1.823
3.979	1.423
4.023	1.657
4.025	1.919
4.028	1.911
4.039	1.507
4.039	1.875
4.041	2.036
4.058	2.089
4.058	2.004
4.075	1.741
4.078	2.085
4.078	1.931
4.095	1.887
4.096	2.040
4.098	2.000
4.109	1.915
4.112	2.084
4.117	2.080
4.140	2.096
4.146	2.282
4.165	2.173
4.183	2.035
4.186	2.338
4.193	2.379
4.194	2.467
4.196	2.185
4.216	2.302
4.229	2.423
4.235	2.592
4.235	2.516
4.238	2.552
4.242	2.253
4.252	2.742
4.256	2.382
4.258	2.338
4.285	2.681
4.309	2.466
4.327	2.717
4.332	2.680
4.340	2.761
4.341	2.632
4.341	2.591
4.358	2.918
4.366	2.466
4.371	2.951
4.371	2.753
4.373	2.591
4.386	2.801
4.416	2.849
4.430	2.974
4.433	2.918
4.456	3.136
4.468	2.970
4.487	3.099
4.520	3.353
4.532	3.386
4.555	3.523];
data.LW_m = exp(data.LW_m); data.LW_m(:,1) = data.LW_m(:,1)/10;
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'males'};  
bibkey.LW_m = 'Dani1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00537*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'From photo: TL = 1.2 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3JS87'; % Cat of Life
metaData.links.id_ITIS = '642861'; % ITIS
metaData.links.id_EoL = '46572885'; % Ency of Life
metaData.links.id_Wiki = 'Harpagifer_bispinis'; % Wikipedia
metaData.links.id_ADW = 'Harpagifer_bispinis'; % ADW
metaData.links.id_Taxo = '176128'; % Taxonomicon
metaData.links.id_WoRMS = '234626'; % WoRMS
metaData.links.id_fishbase = 'Harpagifer-bispinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Harpagifer_bispinis}}';
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
bibkey = 'Dani1983'; type = 'Article'; bib = [ ...
'author = {Robert A. Daniels}, ' ... 
'year = {1983}, ' ...
'title = {Demographic characteristics of an {A}ntarctic plunderfish. \emph{Harpagifer bispinis antarcticus}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {13}, ' ...
'pages = {181-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dani1978'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1978.tb04190.x}, ' ...
'author = {Robert A. Daniels}, ' ... 
'year = {1978}, ' ...
'title = {Nesting Behaviour of \emph{Harpagifer bispinis} in {A}rthur {H}arbour, {A}ntarctic {P}eninsula}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {12(5)}, ' ...
'pages = {465–474}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Harpagifer-bispinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

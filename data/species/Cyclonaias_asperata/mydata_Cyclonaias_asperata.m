function [data, auxData, metaData, txtData, weights] = mydata_Cyclonaias_asperata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Cyclonaias_asperata'; 
metaData.species_en = 'Alabama orb'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 04];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 72*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HaagRype2011';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Baue1987 gives 93 yrs is typical in natural populations';

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 5.6;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HaagRype2011';

data.Wwi  = 6.3; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(5.6/7.3)^3';

data.Ri = 9647/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate for SL 4.04 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL1 = [ ... % time since settlement (yr), shell length (cm)
0.952	1.142
0.952	1.027
0.952	0.926
1.810	1.294
1.810	1.230
1.905	1.966
1.905	1.624
1.905	1.167
2.000	1.484
2.762	2.423
2.857	1.852
2.857	1.776
2.857	1.712
2.952	2.030
2.952	2.169
3.810	2.588
3.905	2.765
4.000	2.892
4.000	2.195
4.000	2.080
4.190	2.436
4.286	3.133
4.952	3.006
4.952	2.905
4.952	2.512
4.952	2.436
5.048	3.717
5.048	2.727
5.048	2.651
5.048	2.588
5.238	3.323
5.429	3.108
5.810	2.994
5.810	2.829
5.905	3.945
5.905	3.235
5.905	2.765
6.000	3.704
6.000	3.412
6.095	3.095
6.667	3.362
6.667	3.412
6.952	3.780
6.952	3.209
7.048	3.463
7.048	3.298
7.143	4.402
7.143	4.021
7.143	3.552
7.905	3.856
7.905	3.450
8.000	4.579
8.000	4.135
8.000	3.691
8.000	3.755
8.190	4.021
9.048	4.465
9.238	3.780
9.333	4.008
9.810	4.402
9.810	4.402
10.190	4.909
10.190	3.818
11.048	4.922
12.857	5.036
12.952	3.970
12.952	4.161
13.810	5.061
14.095	4.059
14.190	4.123
14.190	3.932
15.048	4.338
15.048	4.059
16.000	4.858
16.095	5.264
17.238	4.934
18.000	5.404
18.190	4.681
18.952	5.518
19.048	4.795
19.048	4.693
19.238	5.023
20.952	4.782
20.952	5.087
21.048	4.681
21.048	5.658
21.905	4.922
22.000	5.290
24.095	5.556
27.143	5.201];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'Sipsey River, AL'};  
temp.tL1 = C2K(12);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'HaagRype2011';
comment.tL1 = 'Data from Sipsey River, AL; mean temperature is guessed';
%
data.tL2 = [ ... % time since settlement (yr), shell length (cm)
1.238	1.230
1.238	0.926
2.476	1.433
2.952	1.510
3.143	1.510
3.333	1.827
4.000	1.776
4.095	1.928
4.095	1.827
4.571	2.359
5.143	2.347
5.238	2.017
5.905	2.182
6.000	2.486
7.238	2.423
7.810	2.575
8.762	2.930
8.857	2.740
10.286	2.854
10.857	2.854
11.905	3.133
12.952	3.362
14.190	3.463
15.905	3.552
18.952	3.374
24.000	3.805
25.810	4.173
34.095	3.273
35.048	4.973
37.905	4.681
72.095	5.455];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Sipsey River, AL'};  
temp.tL2 = C2K(15);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'HaagRype2011';
comment.tL2 = 'Data from Sipsey River, AL; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 10 * weights.tL1;
weights.tL2 = 10 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from Aquia Creek, Tar River'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '32V68'; % Cat of Life
metaData.links.id_ITIS = '80074'; % ITIS
metaData.links.id_EoL = '52590331'; % Ency of Life
metaData.links.id_Wiki = 'Cyclonaias'; % Wikipedia
metaData.links.id_ADW = 'Quadrula_asperata'; % ADW
metaData.links.id_Taxo = '5337433'; % Taxonomicon
metaData.links.id_WoRMS = '1048232'; % WoRMS
metaData.links.id_molluscabase = '1048232'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Quadrula}}';
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
bibkey = 'HaagRype2011'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1469-185X.2010.00146.x}, ' ...
'author = {Wendell R. Haag and Andrew L. Rypel1}, ' ... 
'year = {2011}, ' ...
'title = {Growth and longevity in freshwater mussels: evolutionary and conservation implications}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {86}, ' ...
'pages = {225-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Pollicipes_polymerus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Scalpelliformes'; 
metaData.family     = 'Pollicipedidae';
metaData.species    = 'Pollicipes_polymerus'; 
metaData.species_en = 'Gooseneck barnacle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'as'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 03 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 03 10]; 

%% set data
% zero-variate data

data.ab = 25;        units.ab = 'd';      label.ab = 'age at birth';                   bibkey.ab = 'Lewi1975';   
  temp.ab = C2K(14); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ts = 42;        units.ts = 'd';      label.ts = 'time since birth at settlement'; bibkey.ts = 'Lewi1975';   
  temp.ts = C2K(12); units.temp.ts = 'K'; label.temp.ts = 'temperature'; 
data.am = 20*365;    units.am = 'd';      label.am = 'life span';                      bibkey.am = 'ADW';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'only fully grown at 20 yr';

data.Lp1  = 1.2;     units.Lp1  = 'cm';   label.Lp1  = 'capitulum height at puberty at Goleta Pt.'; bibkey.Lp1  = 'Page1996';
data.Lp2  = 1.6;     units.Lp2  = 'cm';   label.Lp2  = 'capitulum height at puberty at Holy'; bibkey.Lp2  = 'Page1996';
data.Li1  = 1.75;      units.Li1  = 'cm';    label.Li1  = 'ultimate capitulum height at Goleta Pt.';       bibkey.Li1  = 'Page1996';
data.Li2  = 3.25;      units.Li2  = 'cm';    label.Li2  = 'ultimate capitulum height at Holy';       bibkey.Li2  = 'Page1996';

data.Wwb = 5.24e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'odyssey';
  comment.Wwb = 'Based on egg diameter of 100 mum: pi/6*0.01^3';

data.Ri  = 7*24e4/ 365;    units.Ri  = '#/d';   label.Ri  = 'max reprod rate'; bibkey.Ri  = 'odyssey';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '24e4 eggs/brood, 7 broods/yr';

% uni-variate data

% LdL-data
data.LdL1 = [  ... % capitulum height (cm), change in capitulum height (cm/d)
0.36006	0.00966
0.36059	0.00869
0.39281	0.00966
0.40508	0.00718
0.44526	0.00357
0.49394	0.00438
0.52431	0.00874
0.54852	0.00438
0.55351	0.00524
0.55973	0.00384
0.59670	0.00610
0.60883	0.00389
0.63329	0.00907
0.66637	0.00847
0.71127	0.00621
0.73876	0.00583
0.79795	0.00740
0.80520	0.00411
0.80547	0.00362
0.80576	0.00308
0.82069	0.00573
0.83739	0.00513
0.92578	0.00319
0.93743	0.00184
0.95882	0.00265
1.04075	0.00254
1.06784	0.00292
1.13254	0.00438
1.17128	0.00341
1.23765	0.00179
1.30817	0.00260
1.59317	0.00044
1.60916	0.00114];
units.LdL1   = {'cm', 'cm/d'};  label.LdL1 = {'capitulum height', 'change in capitulum height', 'Goleta Pt.'};  
temp.LdL1    = C2K(16);  units.temp.LdL1 = 'K'; label.temp.LdL1 = 'temperature';
bibkey.LdL1 = 'Page1996';
comment.LdL1 = 'Data from Goleta Pt., temp is guessed';
%
data.LdL2 = [  ... % capitulum height (cm), change in capitulum height (cm/d)
0.39442	0.01672
0.44357	0.01667
0.59950	0.02098
0.74512	0.01419
0.89243	0.01430
0.90467	0.01187
1.01873	0.01289
1.09573	0.01182
1.09826	0.00718
1.14787	0.01629
1.18793	0.01289
1.23265	0.01095
1.30718	0.01440
1.34358	0.00772
1.43769	0.00529
1.50762	0.00718
1.53308	0.01052
1.53573	0.00567
1.54819	0.01284
1.57998	0.00459
1.60586	0.00718
1.61212	0.00573
1.63811	0.00810
1.78566	0.00777
1.80784	0.00713
1.93839	0.00794
2.01014	0.00648
2.10977	0.00395
2.10995	0.00362
2.17075	0.00222
2.96253	0.00157
3.00690	0.00028
3.06694	0.00028];
units.LdL2   = {'cm', 'cm/d'};  label.LdL2 = {'capitulum height', 'change in capitulum height', 'Holly'};  
temp.LdL2    = C2K(16);  units.temp.LdL2 = 'K'; label.temp.LdL2 = 'temperature';
bibkey.LdL2 = 'Page1996';
comment.LdL2 = 'Data from Holly, temp is guessed';

% L-Wd data
data.LWd1 = [ ... % capitulum height (cm), dry weight (g)
0.6646	0.0131
0.7379	0.0175
0.7779	0.0185
0.7878	0.0124
0.9000	0.0309
0.9082	0.0416
0.9864	0.0632
1.0274	0.0880
1.0492	0.0918
1.0858	0.0579
1.0955	0.0799
1.1543	0.0918
1.1767	0.1349
1.1921	0.0851
1.2030	0.1136
1.2155	0.1199
1.2430	0.0968
1.2807	0.1392
1.2981	0.0807
1.3065	0.1762
1.4525	0.1818
1.4964	0.2701
1.5096	0.3803
1.5265	0.3454
1.5289	0.2560
1.5602	0.3070
1.5641	0.1917
1.6272	0.3308
1.6630	0.2972
1.6950	0.4511
1.7562	0.2274
1.7668	0.5352
1.8300	0.2877
1.8427	0.5767
1.8447	0.4706
1.9212	0.6627
1.9806	0.8566
2.0005	0.9635
2.0052	0.6213
2.1566	0.8203
2.2006	0.9945
2.8542	2.6580];
units.LWd1   = {'cm', 'g'};  label.LWd1 = {'capitulum height', 'dry weight', 'Goleta Pt.'};  
bibkey.LWd1 = 'Page1996';
comment.LWd1 = 'Data from Goleta Pt.';
%
data.LWd2 = [ ... % capitulum height (cm), dry weight (g)
0.7280	0.0299
0.8005	0.0333
0.8164	0.0449
0.9449	0.0703
1.0145	0.1293
1.0349	0.1636
1.0595	0.1078
1.1045	0.1252
1.1291	0.1078
1.1430	0.0790
1.1441	0.0659
1.1771	0.1251
1.2127	0.1839
1.2385	0.1919
1.2394	0.1652
1.2397	0.1583
1.2788	0.1839
1.3326	0.2326
1.3330	0.2182
1.4331	0.3104
1.6243	0.4610
1.9453	0.4655
2.0022	0.8206
2.0047	0.6485
2.0068	0.5349
2.0644	1.0383
2.0819	1.5590
2.1058	1.3421
2.1358	0.6913
2.1478	1.7724
2.1527	1.1553
2.1781	0.9327
2.1787	0.8841
2.2141	2.3156
2.2460	1.1551
2.2676	1.4003
2.2968	0.9325
2.4739	0.9321
2.5242	1.1421
2.6786	2.5748
2.6896	1.1917
2.7581	4.1665
2.7643	2.7451
2.7982	2.0344
2.9263	1.3117
3.1935	6.0549];
units.LWd2   = {'cm', 'g'};  label.LWd2 = {'capitulum height', 'dry weight', 'Holly'};  
bibkey.LWd2 = 'Page1996';
comment.LWd2 = 'Data from Holly';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL2 = 10 * weights.LdL2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL1','LdL2'}; subtitle1 = {'Data from Goleta Pt., Holly'};
set2 = {'LWd1','LWd2'}; subtitle2 = {'Data from Goleta Pt., Holly'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'kap_R is set at 0.95/2, since the species is hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Hermaphroditic; Individuals separated by a distance greater than 20cm are sterile, indicating that self-fertilisation does not occur';
metaData.bibkey.F1 = 'odyssey'; 
F2 = '6 nauplius stages, 1 non-feeding(?) cyprid stage; Naulpius I is also non-feeding (lasts several h)';
metaData.bibkey.F2 = 'Lewi1975'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '63NP9'; % Cat of Life only present at genus level
metaData.links.id_ITIS = '89476'; % ITIS
metaData.links.id_EoL = '335092'; % Ency of Life
metaData.links.id_Wiki = 'Pollicipes_polymerus'; % Wikipedia
metaData.links.id_ADW = 'Pollicipes_polymerus'; % ADW
metaData.links.id_Taxo = '76206'; % Taxonomicon
metaData.links.id_WoRMS = '535329'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pollicipes_polymerus}}';
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
bibkey = 'Page1996'; type = 'Article'; bib = [ ... 
'author = {H. M. Page}, ' ... 
'year = {1986}, ' ...
'title = {Differences in population structure and growth rate of the stalked barnacle \emph{Pollicipes polymerus} between a rocky headland and an offshore oil platform}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {29}, ' ...
'pages = {157-164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lewi1975'; type = 'Article'; bib = [ ... 
'author = {C. A. Lewis}, ' ... 
'year = {1975}, ' ...
'title = {Development of the Gooseneck Barnacle \emph{Pollicipes polymerus} ({C}irripedia: {L}epadomorpha): {F}ertilization through Settlement}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {32}, ' ...
'pages = {141--153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'odyssey'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.asnailsodyssey.com/LEARNABOUT/GOOSE/goosRepr.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pollicipes_polymerus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


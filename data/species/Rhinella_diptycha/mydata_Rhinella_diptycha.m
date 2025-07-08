function [data, auxData, metaData, txtData, weights] = mydata_Rhinella_diptycha
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Rhinella_diptycha'; 
metaData.species_en = 'Cope''s toad'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp','jiTi','jiTh','jiTg','jiFm'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp (mean temperature)
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 27];

%% set data
% zero-variate data

data.tp = 365;  units.tp = 'd';    label.tp = 'time since brith at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5 * 365; units.am = 'd';    label.am = 'life span';  bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Rhinella arenarum'; 

data.Lj  = 3.7;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'guess'; 
  comment.Lj = 'based on Rhinella arenarum: 19.6*2.5/13.1';
data.Lp  = 16.76;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Rhinella arenarum: 19.60*11.2/13.1';
data.Li  = 19.60;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'AranVasc2015';
data.Lim = 17.13;   units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';   bibkey.Lim  = 'AranVasc2015';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 837; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Rhinella arenarum and Li: 250*(19.6/13.1)^3';
data.Wwim = 559; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Rhinella arenarum and Lim: 250*(17.13/13.1)^3';

data.Ri  = 1.16e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rhinella arenarum: 34535*837/250 eggs per clutch';
 
% uni-variate data
% length-change in length
data.LdL_f = [ ... % SVL (cm), change in SVL (cm/d)
6.01722	0.04869
6.43222	0.02347
6.60093	0.06985
7.11461	0.11253
7.24658	0.04429
8.02227	0.06444
8.12247	0.01704
8.18000	0.07654
8.18118	0.08024
8.33470	0.07922
8.71587	0.06846
8.84160	0.10073
9.05890	0.05871
9.20843	0.04526
10.23299	0.00187
10.36421	0.05128
10.58216	0.01128
10.78847	0.05497
10.82478	0.04825
11.06222	0.06908
11.16705	0.03614
11.22339	0.09194
11.25561	0.07244
11.31098	0.00521
11.31131	0.00622
11.35375	0.01866
11.38704	0.00252
11.58624	0.02403
11.60952	0.09663
11.66629	0.03378
11.71725	0.07277
11.73535	0.00924
11.95093	0.08184
12.49930	0.11275
12.53302	0.09796
12.82756	0.05695
12.90643	0.06299
13.17706	0.06736
13.20765	0.04282
13.27854	0.02399
13.36290	0.04719
13.55359	0.04214
13.69860	0.01457
13.93195	0.02264
13.95501	0.09457
14.48140	0.05691
14.88691	0.12211
15.05810	0.05623
15.38680	0.00177
15.49001	0.08378
15.56370	0.07369
15.73231	-0.00026
15.81936	0.03134
15.87376	0.08108
15.90791	0.06764
16.00326	0.00511
16.00487	0.01016
16.12855	0.03604
16.15624	0.00242
16.41405	0.08679
16.41890	0.10191
16.52017	0.05788
16.77259	0.00543
16.92988	0.01619];
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f    = C2K(28);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'AranVasc2015';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (cm/d)
10.31088	0.00490
10.32564	0.05095
10.95567	0.09665
12.14754	0.09528
12.27133	0.00149
12.32423	0.04654
12.50490	0.01023
12.54196	0.00586
12.55952	0.06065
12.62168	0.01460
12.62276	0.01796
12.71013	0.05056
12.81657	0.02266
12.81959	0.03207
13.00910	0.02333
13.06210	0.06871
13.06286	0.07106
13.21562	0.06769
13.40211	0.04954
13.66380	0.02600
13.66660	0.03474
13.70366	0.03037
13.73835	0.01861
13.74331	0.03407
13.78823	0.05424
13.82713	0.05558
13.93001	0.01659
14.00650	0.01524
14.18664	0.09725
14.23285	0.00145
14.26119	0.08986
14.31366	0.01355
14.32217	0.04011
14.35416	0.01994
14.35987	0.03775
14.44660	0.06834
14.48032	0.05355
14.55283	0.03977
14.58213	0.01119
14.65808	0.00817
14.70527	0.03539
14.72111	0.08480
14.77099	0.00043
14.77131	0.00144
14.77659	0.01791
14.78661	0.04917
14.87872	0.09657
14.92914	0.01388
15.08105	0.00782
15.08988	0.03539
15.11703	0.12009
15.11994	0.00917
15.12630	0.02900
15.15754	0.00648
15.16120	0.01790
15.21712	0.07236
15.23662	0.01320
15.24750	0.04715
15.36827	0.06395
15.39693	0.03336
15.46038	0.11134
15.46566	0.00781
15.51479	0.04109
15.58600	0.02327
15.60518	0.08311
15.62640	0.02932
15.68900	0.10462
15.74523	0.04008
15.78833	0.05453
15.84963	0.00579
15.85254	0.01486
15.89035	0.01285
15.93980	0.04713
15.95564	0.09654
15.96997	0.02125
16.05077	0.03335
16.08621	0.02394
16.09559	0.05318
16.11789	0.00276
16.11853	0.12478
16.11929	0.00713
16.12187	0.01520
16.12726	0.03200
16.15850	0.00948
16.15991	0.01385
16.16400	0.02662
16.17919	0.07402
16.19223	0.11469
16.24318	0.03368
16.25126	0.05889
16.27550	0.01452
16.27766	0.02124
16.27831	0.02326
16.28434	0.04208
16.29307	0.06931
16.30976	0.00141
16.31914	0.03065
16.35544	0.02393
16.36309	0.04780
16.36589	0.05653
16.38819	0.00611
16.39132	0.01586
16.39229	0.01889
16.46307	-0.00027
16.46393	0.00242
16.46404	0.00275
16.46512	0.00611
16.51274	0.03468
16.56111	0.06561
16.59052	0.03737
16.64590	0.09014
16.66141	0.01855
16.66249	0.02191
16.67024	0.04611
16.73607	0.01149
16.74986	0.05451
16.80922	-0.00028
16.81008	0.00241
16.81148	0.00678
16.81181	0.00779
16.84887	0.00342
16.92956	0.01518
16.94486	0.06291
16.99248	0.09148
17.00584	0.01316
17.08330	0.01484
17.08470	0.01921
17.08588	0.02291
17.22659	0.10189
17.23380	0.00442
17.38970	0.01080
17.42514	0.00139
17.42514	0.00139
17.42546	0.00239
17.42676	0.00643
17.42686	0.00676
17.43225	0.02357
17.47470	0.03601
17.50788	0.01954
17.62984	0.04004
17.65602	0.00172
17.69739	0.01079
17.69749	0.01113
17.70902	0.04709
17.75309	0.06457
17.77118	0.00104
17.85285	0.01583
18.04117	0.00339
18.04968	0.02994
18.05194	0.03700
18.66603	0.03296];
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m    = C2K(28);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'AranVasc2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7MX'; % Cat of Life
metaData.links.id_ITIS = '773707'; % ITIS
metaData.links.id_EoL = '62510094'; % Ency of Life
metaData.links.id_Wiki = 'Rhinella_diptycha'; % Wikipedia
metaData.links.id_ADW = 'Rhinella_diptycha'; % ADW
metaData.links.id_Taxo = '1395854'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rhinella+diptycha'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rhinella_schneideri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinella_diptycha}}';
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
bibkey = 'AranVasc2015'; type = 'Article'; bib = [ ... 
'author = {\''{I}sis da C. Arantes and Mariana M. Vasconcellos and Taissa C. V. Boas and La\''{i}s B. A. Veludo and Guarino R. Colli}, ' ... 
'year = {2015}, ' ...
'title = {Sexual Dimorphism, Growth, and Longevity of Two Toad Species ({A}nura, {B}ufonidae) in a Neotropical Savanna}, ' ...
'journal = {Copeia}, ' ...
'volume = {103(2)}, ' ...
'pages = {329–342'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rhinella+diptycha}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

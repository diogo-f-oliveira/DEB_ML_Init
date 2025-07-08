function [data, auxData, metaData, txtData, weights] = mydata_Hiatella_arctica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Adapedonta'; 
metaData.family     = 'Hiatellidae';
metaData.species    = 'Hiatella_arctica'; 
metaData.species_en = 'Wrinkled rockborer'; 

metaData.ecoCode.climate = {'MB','MC','ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-dWd'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 22]; 

%% set data
% zero-variate data

data.am = 126*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'SejrJens2002';   
  temp.am = C2K(-1.2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.075; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'Hieb2015';
data.Lp  = 1.2; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Mya arenaria: (2.34/15)*Li';
data.Li  = 7.6;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Hieb2015';

data.Wwb = 6e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Hieb2015';
  comment.Wwb = 'based on egg diameter of 120 mum: pi/9*0.012^3'; 
data.Wdi = 2.9; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on size-corrected value for Mya arenaria: 22.3*(7.6/15)^3';

data.Ri  = 5.8e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(-1.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.8, found for Mya arenaria'; 

% uni-variate data

% t-L data
data.tL = [ ... % time since birth (a), shell length (cm)
2.718	1.566
3.625	1.485
4.078	1.195
4.757	2.379
4.757	2.193
4.984	1.717
5.890	2.472
5.890	2.611
5.890	1.404
6.796	2.193
6.796	1.567
7.476	3.017
7.702	2.356
7.929	2.216
8.155	3.609
8.608	2.449
8.835	2.066
9.968	2.750
10.194	2.657
11.780	3.377
13.139	3.400
13.366	2.472
15.178	2.716
18.123	3.401
18.576	2.913
19.256	3.192
19.709	3.586
21.748	3.668
22.201	3.192
24.013	3.865
24.013	3.807
24.013	3.668
24.013	2.821
24.466	3.297
25.372	4.225
25.825	3.100
26.731	3.343
26.958	4.306
27.864	3.425
30.583	3.494
31.036	4.492
31.489	3.901
31.942	3.738
32.848	2.903
33.301	3.912
33.981	3.402
35.340	3.727
37.832	3.449
39.191	4.226
41.230	3.681
41.456	2.950
43.948	3.148
44.175	2.927
45.307	3.206
45.534	2.788
45.761	3.472
46.893	3.705
48.479	4.505
49.385	3.635
50.971	4.297
51.650	3.218
52.104	2.789
52.783	3.206
54.822	3.763
55.955	4.193
57.314	3.543
57.540	3.392
57.767	4.239
58.673	4.239
58.900	4.657
58.900	3.323
61.165	3.126
62.298	3.555
62.751	3.335
62.751	4.274
63.430	3.126
64.110	3.010
65.469	3.103
66.602	3.010
66.828	3.718
67.282	4.368
70.453	3.475
72.039	3.533
72.492	4.519
72.492	3.800
72.718	3.475
74.531	2.593
75.210	3.429
77.249	4.334
79.968	3.870
80.421	3.336
82.913	3.487
83.366	3.800
84.951	4.172
87.443	3.314
87.670	3.453
87.896	3.186
88.803	3.279
89.256	3.836
90.388	3.813
91.974	3.732
96.731	3.976
97.638	4.219
100.583	3.895
104.434	3.501
115.987	3.374
118.706	3.165
121.424	3.038
125.728	3.154];
data.tL(:,1) = 365 * data.tL(:,1); % convert a to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(-1.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SejrSand2002';

% length - growtg
data.LdWd = [ ... % shell length (cm), growth in shell-free dry weight (g/yr)
0.093960	0.000644
0.295302	0.002291
0.516779	0.004727
0.697987	0.007523
0.899329	0.010462
1.093960	0.013401
1.308725	0.016412
1.489933	0.018849
1.704698	0.021142
1.872483	0.022574
2.080537	0.023790
2.281879	0.024146
2.483221	0.023783
2.684564	0.022559
2.885906	0.020331
3.100671	0.017169
3.295302	0.012859
3.496644	0.007401
3.697987	0.000579];
units.LdWd   = {'cm', 'g/yr'};  label.LdWd = {'shell length', 'change in shell-free dry weight'};  
temp.LdWd    = C2K(-1.2);  units.temp.LdWd = 'K'; label.temp.LdWd = 'temperature';
bibkey.LdWd = 'SejrSand2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LdWd = 5 * weights.LdWd;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3LHV5'; % Cat of Life
metaData.links.id_ITIS = '81765'; % ITIS
metaData.links.id_EoL = '46473266'; % Ency of Life
metaData.links.id_Wiki = 'Hiatella_arctica'; % Wikipedia
metaData.links.id_ADW = 'Hiatella_arctica'; % ADW
metaData.links.id_Taxo = '39769'; % Taxonomicon
metaData.links.id_WoRMS = '140103'; % WoRMS
metaData.links.id_molluscabase = '140103'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hiatella_arctica}}';
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
bibkey = 'SejrSand2002'; type = 'Article'; bib = [ ... 
'author = {Mikael K. Sejr and Mikkel K. Sand and K. Thomas Jensen and Jens K. Petersen and Peter B. Christensen and S{\o}ren Rysgaard}, ' ... 
'year = {2002}, ' ...
'title = {Growth and production of \emph{Hiatella arctica} ({B}ivalvia) in a high-{A}rctic fjord ({Y}oung {S}ound, {N}ortheast {G}reenland)}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {244}, ' ...
'pages = {163-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SejrJens2002'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-002-0413-8}, ' ...
'author = {Mikael K. Sejr and K. Thomas Jense and S{\o}ren Rysgaard}, ' ... 
'year = {2002}, ' ...
'title = {Annual growth bands in the bivalve \emph{Hiatella arctica} validated by a mark-recapture study in {N}{E} {G}reenland}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {25}, ' ...
'pages = {794-796}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SejrPete2004'; type = 'Article'; bib = [ ... 
'author = {Mikael K. Sejr and J. K. Peteresen and K. T. Jensen and S{\o}ren Rysgaard}, ' ... 
'year = {2004}, ' ...
'title = {Effects of food concentration on clearance rate and energy budget of the {A}rctic bivalve \emph{Hiatella arctica} ({L}) at subzero temperature}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {311}, ' ...
'pages = {171-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hieb2015'; type = 'techreport'; bib = [ ... 
'series = {Oregon Estuarine Invertebrates: Rudys'' Illustrated Guide to Common Species}, ' ...
'author = {Hiebert, T.C.}, ' ... 
'year = {2015}, ' ...
'title = {Hiatella arctica}, ' ...
'institution = {University of Oregon Libraries and the Oregon Institute of Marine Biology, Charleston, OR}, ' ...
'howpublished = {\ulr{http://hdl.handle.net/1794/12900}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


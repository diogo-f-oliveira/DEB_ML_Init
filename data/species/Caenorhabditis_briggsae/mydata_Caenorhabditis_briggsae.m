function [data, auxData, metaData, txtData, weights] = mydata_Caenorhabditis_briggsae
%% set metaData
metaData.phylum     = 'Nematoda'; 
metaData.class      = 'Chromadorea'; 
metaData.order      = 'Rhabditida'; 
metaData.family     = 'Rhabditidae';
metaData.species    = 'Caenorhabditis_briggsae'; 
metaData.species_en = 'Roundworm'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ap'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Wwb'; 'Wwp_f'; 'Wwi_f'}; 
metaData.data_1     = {'t-Ww_f'; 'Ww-JO_f'; 'X-Ri'; 'X-ap'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 21];

%% set data
% zero-variate data

data.ab = 13/24;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Schi1982a';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 16;      units.am = 'd';    label.am = 'life span';                bibkey.am = 'Schi1982a';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.025; units.Wwb = 'mug'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Schi1982';
data.Wwp_3 = 0.404;  units.Wwp_3 = 'mug'; label.Wwp_3 = 'wet weight at puberty at high food';   bibkey.Wwp_3 = 'Schi1982';
data.Wwp_1 = 0.204;  units.Wwp_1 = 'mug'; label.Wwp_1 = 'wet weight at puberty at low food';   bibkey.Wwp_1 = 'Schi1982';
data.Wwi_3 = 0.928;   units.Wwi_3 = 'mug'; label.Wwi_3 = 'ultimate wet weight at high food';     bibkey.Wwi_3 = 'Schi1982';
data.Wwi_1 = 0.39;   units.Wwi_1 = 'mug'; label.Wwi_1 = 'ultimate wet weight at low food';     bibkey.Wwi_1 = 'Schi1982';
 
% uni-variate data
% time-weight
data.tW3 = [ ... % time since birth (h), wet weight (mug),
  0.000	0.025
 21.237	0.027
 34.499	0.066
 41.776	0.111
 48.092	0.169
 56.588	0.266
 80.975	0.545
 85.630	0.549
155.216	0.819
179.101	0.824];
data.tW3(:,1) = data.tW3(:,1)/ 24; % convert h to d
units.tW3  = {'d', '{\mu}g'};  label.tW3 = {'time', 'wet weight', '1e10 cells E.coli/ml'};  
temp.tW3   = C2K(20);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature'; 
bibkey.tW3 = 'Schi1982'; 
comment.tW3 = 'high food: 1e10 cells E.coli/ml';
%
data.tW2 = [ ... % time since birth (h), wet weight (mug),
  0.000	0.025
 29.028	0.031
 39.115	0.057
 49.800	0.096
 57.263	0.103
 78.636	0.292
175.598	0.587
246.618	0.566];
data.tW2(:,1) = data.tW2(:,1)/ 24; % convert h to d
units.tW2  = {'d', '{\mu}g'};  label.tW2 = {'time', 'wet weight', '1e9 cells E.coli/ml'};  
temp.tW2   = C2K(20);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature'; 
bibkey.tW2 = 'Schi1982'; 
comment.tW2 = 'medium food: 1e9 cells E.coli/ml';
%
data.tW1 = [ ... % time since birth (h), wet weight (mug),
  0.000	0.025
 56.697	0.040
 90.436	0.097
110.068	0.136
131.645	0.260
178.563	0.353
233.514	0.426];
data.tW1(:,1) = data.tW1(:,1)/ 24; % convert h to d
units.tW1  = {'d', '{\mu}g'};  label.tW1 = {'time', 'wet weight', '5e8 cells E.coli/ml'};  
temp.tW1   = C2K(20);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature'; 
bibkey.tW1 = 'Schi1982'; 
comment.tW1 = 'low food: 5e8 cells E.coli/ml';

% weight-respiration
data.WJO3 = [ ... % wet weight (mug), respiration (nL/h.ind)
0.045	0.149
0.055	0.203
0.059	0.164
0.064	0.253
0.072	0.246
0.075	0.267
0.080	0.302
0.086	0.506
0.087	0.267
0.088	0.298
0.090	0.401
0.098	0.556
0.100	0.604
0.101	0.527
0.102	0.506
0.108	0.499
0.111	0.588
0.114	0.701
0.137	0.731
0.151	1.225
0.160	0.793
0.165	0.683
0.174	0.741
0.188	0.804
0.189	0.693
0.203	0.816
0.206	0.922
0.283	1.131
0.287	1.071
0.304	1.194
0.317	1.406
0.325	1.211
0.326	1.332
0.359	1.407
0.370	1.611
0.371	1.211
0.380	1.725
0.391	1.656
0.396	1.506
0.397	1.426
0.398	1.297
0.399	1.102
0.407	1.569
0.489	1.507
0.495	2.004
0.524	1.370
0.539	1.823
0.546	2.088
0.570	1.899
0.571	1.774
0.673	2.527
0.674	2.361
0.743	2.330
0.774	3.058
0.775	2.207
0.796	2.331
0.807	2.529
0.866	2.208
0.915	2.300
0.928	2.635
0.929	2.091];
units.WJO3  = {'{\mu}g', 'nL/h'};  label.WJO3 = {'weight', 'O_2 consumption', '1e10 cells E.coli/ml'};  
temp.WJO3   = C2K(20);  units.temp.WJO3 = 'K'; label.temp.WJO3= 'temperature'; 
bibkey.WJO3 = 'Schi1982'; 
comment.WJO3 = 'high food: 1e10 cells E.coli/ml'; 
%
data.WJO2 = [ ... % wet weight (mug), respiration (nL/h.ind)
0.055	0.278
0.060	0.217
0.075	0.274
0.081	0.290
0.088	0.324
0.092	0.510
0.095	0.525
0.096	0.260
0.102	0.451
0.108	0.457
0.119	0.741
0.124	0.540
0.133	0.571
0.137	0.518
0.139	0.563
0.143	0.664
0.145	0.504
0.214	0.722
0.254	1.203
0.255	0.952
0.264	0.965
0.276	0.876
0.304	1.006
0.308	1.344
0.317	1.289
0.321	1.204
0.335	1.139
0.370	1.326
0.375	1.140
0.385	1.421
0.425	1.205
0.449	1.724];
units.WJO2  = {'{\mu}g', 'nL/h'};  label.WJO2 = {'weight', 'O_2 consumption', '1e9 cells E.coli/ml'};  
temp.WJO2   = C2K(20);  units.temp.WJO2 = 'K'; label.temp.WJO2 = 'temperature'; 
bibkey.WJO2 = 'Schi1982'; 
comment.WJO2 = 'medium food: 1e9 cells E.coli/ml'; 
%
data.WJO1 = [ ... % wet weight (mug), respiration (nL/h.ind)
0.068	0.368
0.071	0.261
0.090	0.423
0.104	0.659
0.115	0.379
0.135	0.607
0.139	0.543
0.156	0.906
0.169	0.624
0.184	0.737
0.185	0.583
0.206	1.196
0.209	0.882
0.221	0.986
0.227	1.101
0.233	0.824
0.243	0.769
0.250	0.986
0.264	1.086
0.268	0.920
0.292	0.824
0.331	0.813
0.340	0.718
0.375	1.284
0.391	1.434];
units.WJO1  = {'{\mu}g', 'nL/h'};  label.WJO1 = {'weight', 'O_2 consumption', '5e8 cells E.coli/ml'};  
temp.WJO1   = C2K(20);  units.temp.WJO1 = 'K'; label.temp.WJO1 = 'temperature'; 
bibkey.WJO1 = 'Schi1982'; 
comment.WJO1 = 'low food: 5e8 cells E.coli/ml'; 

% food density-reprod rate
data.XR = [ ... % food density (cells/ml), reproduction rate (#/d)
    2e8  3.3
    5e8  7.7
    1e9 10.1
    5e9 27.5
   1e10 35.4
   5e10 39.9];
units.XR   = {'cells/ml', '#/d'};  label.XR = {'food density', 'reproduction rate'};  
bibkey.XR = 'Schi1982'; treat.XR = {0};

% food density-time since birth at puberty
data.Xtp = [ ... % food density (cells/ml), time since birth at puberty (h)
    2e8 232.5
    5e8 130.0
    1e9  87.7
    5e9  74.0
   1e10  65.8
   5e10  62.2];
data.Xtp(:,2) = data.Xtp(:,2)/24; % convert h to d
units.Xtp   = {'cells/ml', 'd'};  label.Xtp = {'food density', 'time since birth at puberty'};  
bibkey.Xtp = 'Schi1982a'; treat.Xtp = {0};

%% set weights for all real data
weights = setweights(data, []);
weights.XR = 3 * weights.XR;
weights.Xtp = 3 * weights.Xtp;
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

%% Group plots
set1 = {'tW3','tW2','tW1'}; subtitle1 = {'Data for 1e10, 1e9, 5e8 cells E.coli/ml'};
set2 = {'WJO3','WJO2','WJO1'}; subtitle2 = {'Data for 1e10, 1e9, 5e8 cells E.coli/ml'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'distribution unknown, global assumed';
D2 = 'g dry weight of E.coli per cell: 8.6e-13 g/cell = 3.6e-14 mol/cell, given w_X = 23.9 g/mol';
D3 = 'the feeding levels have no simple relation with food availability, so they were estimated independently';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'freshwater';
metaData.bibkey.F1 = 'Schi1982'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8P6BR'; % Cat of Life
metaData.links.id_ITIS = '63334'; % ITIS
metaData.links.id_EoL = '464054'; % Ency of Life
metaData.links.id_Wiki = 'Caenorhabditis_briggsae'; % Wikipedia
metaData.links.id_ADW = 'Caenorhabditis_briggsae'; % ADW
metaData.links.id_Taxo = '289338'; % Taxonomicon
metaData.links.id_WoRMS = '1537707'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schi1982'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00541117}, ' ...
'author = {Schiemer, F.}, ' ... 
'year = {1982}, ' ...
'title = {Food dependence and energetics of freeliving nematodes; {I}  {R}espiration, Growth and Reproduction of \emph{Caenorhabditis briggsae} ({N}ematoda) at Different Levels of Food Supply}, ' ...
'journal = {Oecologia}, ' ...
'volume = {44}, ' ...
'pages = {108–121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schi1982a'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00541118}, ' ...
'author = {Schiemer, F.}, ' ... 
'year = {1982}, ' ...
'title = {Food dependence and energetics of freeliving nematodes; {II} {L}ife History Parameters of \emph{Caenorhabditis briggsae} ({N}ematoda) at Different Levels of Food Supply}, ' ...
'journal = {Oecologia}, ' ...
'volume = {44}, ' ...
'pages = {122-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


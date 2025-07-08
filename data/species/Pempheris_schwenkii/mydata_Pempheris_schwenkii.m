function [data, auxData, metaData, txtData, weights] = mydata_Pempheris_schwenkii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pempheridae';
metaData.species    = 'Pempheris_schwenkii'; 
metaData.species_en = 'Black-stripe sweeper';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 12]; 

%% set data
% zero-variate data

data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KoedIshi2016';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'oldest catch, max life span is probably larger';
  
data.Lp  = 5.3; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'KoedIshi2012'; 
data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KoedFuka2013';
  comment.Wwb = 'based egg diameter of 1 mm : 4/3*pi*0.05^3'; 
data.Wwp = 2.32; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'KoedIshi2012';
  comment.Wwp = 'based on 0.01585 Lp^2.99, see F1';
data.Wwi = 52; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585 Li^2.99, see F1';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), standard length (cm)
0.000	0.219
0.000	0.358
0.000	0.458
0.000	0.617
0.000	0.697
0.000	1.652
0.000	1.751
0.000	1.910
0.000	2.488
0.000	2.647
0.015	0.995
0.015	1.473
0.015	1.572
0.030	2.169
0.030	2.308
0.030	4.179
0.045	2.050
0.045	5.771
0.194	1.910
0.194	2.050
0.194	3.701
0.194	4.080
0.194	7.403
0.194	7.562
0.209	1.075
0.209	1.493
0.209	1.672
0.209	1.672
0.209	1.811
0.209	1.970
0.209	2.209
0.209	2.269
0.209	3.463
0.209	3.562
0.209	3.940
0.209	4.119
0.209	7.164
0.209	7.264
0.209	7.483
0.209	7.602
0.209	7.602
0.209	7.781
0.209	8.418
0.224	1.174
0.224	1.313
0.224	1.313
0.224	1.453
0.224	3.164
0.224	4.338
0.224	4.517
0.224	4.597
0.224	4.796
0.224	4.856
0.224	5.373
0.224	5.493
0.224	5.552
0.224	6.746
0.224	6.786
0.224	6.945
0.224	7.065
0.239	2.507
0.239	2.567
0.239	2.647
0.239	2.706
0.239	2.786
0.239	3.005
0.239	5.114
0.239	5.234
0.239	5.294
0.239	6.030
0.239	6.209
0.239	6.269
0.239	6.547
0.239	8.915
0.254	5.692
0.254	5.831
0.254	5.891
0.388	9.891
0.448	5.154
0.448	5.234
0.448	5.493
0.448	6.090
0.448	6.149
0.448	6.149
0.448	6.826
0.448	6.866
0.448	7.343
0.448	7.443
0.448	7.463
0.448	8.338
0.463	5.055
0.463	5.791
0.463	5.871
0.463	6.746
0.463	7.284
0.463	7.940
0.463	8.159
0.463	8.418
0.463	8.657
0.478	4.756
0.478	4.836
0.478	4.995
0.478	7.164
0.478	7.224
0.478	7.701
0.493	6.547
0.493	6.627
0.493	7.045
0.493	7.104
0.507	6.448
0.522	4.000
0.687	7.642
0.701	7.721
0.701	8.000
0.701	8.080
0.701	8.139
0.701	8.318
0.701	8.438
0.701	8.557
0.701	8.657
0.701	8.935
0.701	9.095
0.701	9.095
0.701	9.214
0.701	9.353
0.746	6.448
0.925	9.532
0.925	9.592
0.925	9.592
0.925	9.711
0.925	9.930
0.925	10.249
0.925	10.488
0.925	10.607
0.940	9.353
0.940	10.109
0.955	7.303
0.955	7.701
0.955	7.781
0.955	7.781
0.955	7.841
0.955	7.940
0.955	7.980
0.955	8.020
0.955	8.100
0.955	8.159
0.955	8.318
0.955	8.338
0.955	8.498
0.955	8.657
0.955	8.975
0.970	10.905
0.970	11.104
0.985	9.453
0.985	9.453
1.000	6.567
1.194	8.597
1.194	10.567
1.194	10.567
1.194	10.687
1.194	10.766
1.209	8.517
1.209	10.408
1.209	11.184
1.224	9.194
1.224	10.129
1.224	10.249
1.224	10.249
1.224	10.328
1.254	8.239
1.254	8.418
1.254	9.035
1.254	9.373
1.254	9.612
1.254	9.910
1.269	8.876
1.284	8.776
1.284	8.796
1.418	10.408
1.418	10.527
1.418	10.627
1.418	10.706
1.418	10.806
1.433	10.090
1.433	10.189
1.433	10.368
1.448	10.030
1.448	10.925
1.448	11.025
1.448	11.124
1.448	11.343
1.463	9.473
1.463	9.692
1.463	9.930
1.716	8.498
1.716	8.657
1.716	8.896
1.716	9.035
1.716	9.075
1.716	9.194
1.716	9.234
1.731	8.119
1.731	9.910
1.731	10.308
1.731	10.348
1.731	10.468
1.731	10.488
1.731	10.567
1.731	11.025
1.731	11.124
1.746	10.129
1.746	10.806
1.746	12.239
1.761	9.532
1.761	9.791
1.925	10.905
1.925	11.264
1.925	11.363
1.925	11.542
1.940	9.174
1.940	9.552
1.940	10.687
1.940	10.766
1.940	10.925
1.940	11.065
1.940	11.124
1.955	9.652
1.955	9.771
1.955	10.129
1.955	10.428
1.955	10.488
1.970	10.269
1.970	10.328
2.179	11.085
2.179	11.144
2.179	11.204
2.179	11.244
2.179	11.303
2.194	10.945
2.209	9.453
2.209	9.672
2.209	9.990
2.209	10.189
2.209	10.607
2.209	10.806
2.433	12.338
2.463	10.249
2.463	10.408
2.463	10.607
2.463	10.866
2.463	11.144
2.463	11.463
2.463	11.522
2.463	11.662
2.463	11.741
2.478	10.965
2.478	11.164
2.478	11.204
2.478	11.343
2.716	11.642
2.716	11.721
2.716	11.761
2.716	11.841
2.716	12.060
2.731	10.368
2.731	10.488
2.731	10.587
2.731	10.667
2.731	10.726
2.731	11.045
2.731	11.124
2.731	11.144
2.731	11.602
2.746	10.866
2.746	11.363
2.746	11.443
2.746	11.522
2.925	12.478
2.955	11.204
2.955	11.383
2.955	11.403
2.955	10.169
2.970	11.582
3.164	10.229
3.194	10.488
3.194	10.726
3.194	11.124
3.194	11.244
3.194	11.264
3.194	11.343
3.194	11.383
3.194	11.383
3.209	11.881
3.239	11.562
3.433	11.323
3.433	11.443
3.433	11.522
3.448	11.204
3.448	11.264
3.463	10.547
3.463	10.746
3.463	10.905
3.463	10.965
3.463	11.085
3.463	11.124
3.463	11.124
3.463	11.721
3.687	11.403
3.701	10.786
3.701	10.925
3.701	11.144
3.701	11.662
3.791	11.920
3.925	11.582
3.925	11.463
4.134	10.766
4.149	10.866
4.149	11.184
4.164	11.323
4.164	11.582
4.179	11.881
4.507	9.930
4.657	11.025
4.731	11.562
4.940	12.080
5.478	11.284
5.716	11.761
5.985	12.318
6.179	12.179
6.522	12.617];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KoedIshi2016';

data.LN = [ ... % standard length (cm), fecundity (#)
8.272	964.240
8.641	785.471
9.234	1907.448
9.830	1499.433
10.188	2550.628
10.224	1410.746
10.365	2011.218
10.423	2501.411
10.541	2001.805
10.731	3702.437
10.733	2372.445
11.085	2773.616
11.261	2444.204
11.354	2284.513
11.354	2074.513
11.377	3244.591
11.445	2994.816
11.477	3604.924
11.477	3464.925
11.711	4165.703
11.797	2675.991];
units.LN   = {'cm', '#'};  label.LN = {'standard length', 'fecundity'};  
temp.LN    = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KoedIshi2012';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship for Pempheris otaitensis and P. molucca: W = 0.01585 SL^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 5 - 40 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '76FRP'; % Cat of Life
metaData.links.id_ITIS = '645486'; % ITIS
metaData.links.id_EoL = '46581061'; % Ency of Life
metaData.links.id_Wiki = 'Pempheris'; % Wikipedia
metaData.links.id_ADW = 'Pempheris_schwenkii'; % ADW
metaData.links.id_Taxo = '183415'; % Taxonomicon
metaData.links.id_WoRMS = '218699'; % WoRMS
metaData.links.id_fishbase = 'Pempheris-schwenkii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pempheris}}';
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
bibkey = 'KoedIshi2016'; type = 'Article'; bib = [ ... 
'author = {K. Koeda and T. Ishihara and T. Fukagawa and K. Tachihara}, ' ... 
'year = {2016}, ' ...
'title = {Life cycle differences between two species of genus \emph{Pempheris} based on age determination around {O}kinawa-jima {I}sland}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {63}, ' ...
'pages = {519-528}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoedIshi2012'; type = 'Article'; bib = [ ... 
'author = {K. Koeda and T. Ishihara and K. Tachihara}, ' ... 
'year = {2012}, ' ...
'title = {The reproductive biology of \emph{Pempheris schwenkii} ({P}empheridae) on {O}kinawa {I}sland, Southwestern {J}apan}, ' ...
'journal = {Zoological studies}, ' ...
'volume = {51}, ' ...
'pages = {1086--1093}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoedFuka2013'; type = 'Article'; bib = [ ... 
'author = {K. Koeda and T. Fukagawa and T. Ishihara  and K. Tachihara}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of nocturnal reef fish \emph{Pempheris sp.} ({P}empherididae) in {O}kinawa {I}sland, {J}apan}, ' ...
'journal = {Galaxea, Journal of Coral Reef Studies}, ' ...
'volume = {special issue}, ' ...
'pages = {221--228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/12908}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

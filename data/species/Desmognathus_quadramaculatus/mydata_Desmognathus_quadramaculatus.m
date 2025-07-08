function [data, auxData, metaData, txtData, weights] = mydata_Desmognathus_quadramaculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Desmognathus_quadramaculatus'; 
metaData.species_en = 'Blackbelly salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 10]; 


%% set data
% zero-variate data

data.ab = 49;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Plethodon cinereus';
data.tp = 2.4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Bruc2016';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 9;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Bruc2016';

data.Wwb = 4.77e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 4.5 mm (3.9 to 5 mm): pi/6*0.45^3';
data.Wwi = 14.6;  units.Wwi = 'g';   label.Wwi = 'wet weight at 8.5 cm SVL';     bibkey.Wwi = 'Bruc2016';

data.Ri  = 45/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '45 eggs per clutch (38 to 55), 1 clutch each other yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0.304	1.942
0.370	1.635
0.391	1.804
1.370	2.870
1.391	2.609
1.413	2.362
2.348	3.783
2.348	2.750
2.348	2.596
2.370	3.274
2.370	3.074
2.413	3.536
2.957	3.862
2.957	4.062
3.391	3.863
3.391	3.493
3.391	3.154
3.935	4.913
3.935	4.481
3.957	4.636
3.957	4.420
3.957	4.281
4.196	5.114
4.196	4.975
4.217	5.237
4.522	6.086
4.935	5.594
4.957	5.471
4.957	5.348
4.978	5.949
5.174	6.211
5.217	6.766
5.500	6.428
5.543	6.783
5.565	6.243
5.935	6.013
6.000	6.522
6.022	7.632
6.152	7.108
6.196	7.416
6.217	7.571
6.522	7.171
7.000	7.327
7.022	7.542
7.152	6.803
7.196	7.666
7.196	7.112
7.239	6.233
7.261	7.959
7.304	8.329
7.522	7.791
7.565	8.407
8.000	7.145
8.043	7.731
8.130	8.609
8.196	7.932
8.217	8.779
8.217	7.454
8.217	7.192
8.239	7.408
8.261	8.009
8.522	7.809
8.543	8.780
8.565	8.148
8.565	7.193
9.196	8.551
9.217	9.029
9.283	8.382
9.500	8.660
10.196	8.138
10.239	8.709
10.239	8.508
10.239	8.015
10.239	7.738
10.261	8.354
10.543	8.432
10.935	7.941
11.000	8.141
11.283	9.498
12.000	7.775
12.239	8.577
13.217	8.318];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'snout-to-vent length'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bruc2016';
comment.tL = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.371	0.205
1.340	0.352
1.402	0.587
2.309	0.499
2.309	0.968
2.309	1.261
2.330	0.762
2.990	1.642
3.031	1.290
3.320	0.704
3.361	1.085
3.381	1.349
3.938	2.639
3.959	2.053
3.959	1.818
4.041	2.258
4.206	2.757
4.268	3.255
4.268	3.050
4.536	5.073
4.928	3.636
4.948	3.900
4.948	3.372
4.969	4.692
5.196	6.950
5.216	5.396
5.423	6.012
5.423	5.513
5.443	7.067
6.000	5.015
6.021	10.147
6.041	6.217
6.144	9.326
6.186	8.152
6.186	7.947
6.186	9.912
6.515	8.270
6.948	8.856
6.969	9.765
7.113	10.293
7.113	8.270
7.175	7.067
7.216	11.525
7.258	5.396
7.526	10.645
7.979	10.469
7.979	8.240
8.165	11.202
8.206	15.044
8.206	9.150
8.227	14.252
8.227	11.525
8.227	9.501
8.247	11.760
8.330	8.299
8.454	15.396
8.495	10.821
8.536	12.287
8.557	8.358
9.196	14.164
9.237	16.686
9.258	13.431
9.526	14.692
10.103	11.994
10.144	13.519
10.227	11.613
10.227	10.469
10.227	13.138
10.227	14.164
10.247	14.751
10.536	13.636
10.948	11.408
10.948	12.258
11.258	19.501
11.938	10.674
12.206	14.370
13.196	13.226];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(15); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Bruc2016';
comment.tW = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '353N2'; % Cat of Life
metaData.links.id_ITIS = '173642'; % ITIS
metaData.links.id_EoL = '330497'; % Ency of Life
metaData.links.id_Wiki = 'Desmognathus_quadramaculatus'; % Wikipedia
metaData.links.id_ADW = 'Desmognathus_quadramaculatus'; % ADW
metaData.links.id_Taxo = '47401'; % Taxonomicon
metaData.links.id_WoRMS = '1369410'; % WoRMS
metaData.links.id_amphweb = 'Desmognathus+quadramaculatus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Desmognathus_quadramaculatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmognathus_quadramaculatus}}';
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
bibkey = 'Bruc2016'; type = 'Article'; bib = [ ... 
'doi = {10.1643/CE-14-204}, ' ...
'author = {Richard C. Bruce}, ' ... 
'year = {2016}, ' ...
'title = {Application of the {G}ompertz Function in Studies of Growth in Dusky Salamanders (\emph{Plethodontidae}: {D}esmognathus)}, ' ...
'journal = {Copeia}, ' ...
'volume = {104}, ' ...
'pages = {94-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/3926}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Desmognathus_quadramaculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


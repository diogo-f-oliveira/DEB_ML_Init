function [data, auxData, metaData, txtData, weights] = mydata_Anaxyrus_fowleri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Anaxyrus_fowleri'; 
metaData.species_en = 'Fowler''s toad'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 17];

%% set data
% zero-variate data

data.ab = 5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '2 to 7 d';
data.tj = 55;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'guess';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'based on A. americanus: 50 to 60 d; AnAge gives 63 d';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on A. americanus: 2 to 4 yr';
data.am = 36*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.61;  units.Lj  = 'mm';  label.Lj  = 'tibia length at metam';   bibkey.Lj  = 'Clar1974'; 
  comment.Lj = 'SVL 7 to 12 mm; TL 2.5 cm ';
data.Li  = 32.5;   units.Li  = 'mm';  label.Li  = 'ultimate tibia length for females';   bibkey.Li  = 'Clar1974';
data.Lim  = 27.5;   units.Lim  = 'mm';  label.Lim  = 'ultimate tibia for males';   bibkey.Lim  = 'Clar1974';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 to 2 mm: pi/6*0.2^3';
data.Wwj = 0.08; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Clar1974';
  comment.Wwj = 'based on Lj amd LW data: 4.466 * (Lj/13.8)^3'; 
data.Wwi = 58.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Clar1974';
  comment.Wwi = 'based on Li amd LW data: 4.466 * (Li/13.8)^3'; 
data.Wwim = 35.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'Clar1974';
  comment.Wwim = 'based on Lim amd LW data: 4.466 * (Lim/13.8)^3'; 
  
data.Ri  = 8.5e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '7000 to 10000 eggs/clutch; 1 clutch/year';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time  since metam (d), tibia length (0.1 mm)
 -167	 36.124 % metam
 0.000	 50.554
 48.711	 74.387
 78.566	 99.108
 98.192	125.379
112.152	150.479
129.528	174.507
149.715	201.338
169.938	224.290
207.728	250.208
273.912	274.223
350.305	298.906];
data.tL_f(:,1) = data.tL_f(:,1) + 167; % set origin at metam
data.tL_f(:,2) = data.tL_f(:,2)/10; % convert 0.1 mm to mm
units.tL_f   = {'d', 'mm'};  label.tL_f = {'time since metam', 'tibia length', 'females'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Clar1974';
%
data.tL_m = [ ... % time since metam (d), tibia length (mm)
 -167	 36.124
 0.000	 51.109
 48.701	 75.496
 78.561	 99.663
 97.624	125.373
113.292	149.937
129.512	176.170
151.995	200.255
195.480	224.019
265.621	249.741
431.124	273.749];
data.tL_m(:,1) = data.tL_m(:,1) + 167; % set origin at metam
data.tL_m(:,2) = data.tL_m(:,2)/10; % convert 0.1 mm to mm
units.tL_m   = {'d', 'mm'};  label.tL_m = {'time', 'tibia length', 'males'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Clar1974';
  
% length-weight
data.LW = [ ... % tibia length (mm), body weight (g)
3.807	0.110
3.811	0.099
3.926	0.109
4.111	0.126
4.217	0.150
4.300	0.119
4.329	0.165
4.413	0.134
4.533	0.196
4.751	0.208
4.817	0.202
4.830	0.155
4.899	0.208
5.080	0.230
5.083	0.217
5.205	0.310
5.212	0.272
5.285	0.263
5.287	0.254
5.295	0.306
5.301	0.272
5.366	0.314
5.385	0.310
5.407	0.290
5.432	0.257
5.531	0.322
5.562	0.260
5.605	0.335
5.645	0.324
5.662	0.336
5.733	0.377
5.794	0.367
5.836	0.352
5.853	0.369
5.886	0.296
5.889	0.392
5.942	0.318
5.984	0.433
5.990	0.392
6.040	0.341
6.080	0.347
6.085	0.443
6.116	0.377
6.148	0.439
6.163	0.349
6.167	0.454
6.173	0.418
6.181	0.366
6.231	0.449
6.272	0.463
6.331	0.502
6.359	0.452
6.397	0.495
6.433	0.558
6.442	0.485
6.506	0.498
6.531	0.479
6.577	0.659
6.715	0.638
6.786	0.611
6.818	0.544
6.961	0.731
6.967	0.668
7.098	0.803
7.098	0.570
7.111	0.673
7.160	0.662
7.198	0.553
7.244	0.575
7.258	0.666
7.349	0.537
7.371	0.782
7.375	0.739
7.650	0.801
7.757	0.780
7.883	0.850
7.953	0.978
8.185	0.834
8.243	1.136
8.276	1.074
8.356	1.136
8.405	0.891
8.501	1.121
8.557	1.144
8.594	1.053
8.612	1.191
8.749	1.347
8.856	1.111
9.157	1.640
9.222	1.613
9.307	1.783
9.329	1.403
9.440	1.685
9.520	1.426
9.615	1.475
9.769	1.641
9.775	1.540
9.818	1.408
9.854	1.913
10.004	1.646
10.057	1.913
10.150	2.107
10.228	1.952
10.338	2.582
10.373	1.857
10.433	2.052
11.002	2.353
11.041	2.322
11.051	2.129
11.235	2.223
11.455	2.457
11.549	3.011
11.636	2.808
11.816	3.328
11.971	2.507
12.266	3.340
12.309	3.296
12.453	4.025
12.815	3.477
13.003	3.178
13.102	4.108
13.287	3.960
13.382	3.818
13.496	4.525
13.680	4.571
13.693	4.164
13.823	4.466];
units.LW   = {'mm', 'g'};  label.LW = {'tibia length', 'wet weight'};  
bibkey.LW = 'Clar1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed; Temp in tL data is assumed to change seasonaly';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hybridizes with Anaxyrus americanus and A. woodhousii';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66M6Z'; % Cat of Life
metaData.links.id_ITIS = '773520'; % ITIS
metaData.links.id_EoL = '1039131'; % Ency of Life
metaData.links.id_Wiki = 'Anaxyrus_fowleri'; % Wikipedia
metaData.links.id_ADW = 'Anaxyrus_fowleri'; % ADW
metaData.links.id_Taxo = '988894'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Anaxyrus+fowleri'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anaxyrus_fowleri}}';
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
bibkey = 'Clar1974'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z74-191}, ' ...
'author = {Clarke, R. D.}, ' ... 
'year = {1974}, ' ...
'title = {Postmetamorphic growth rates in a natural population of Fowler''s toad, \emph{Bufo woodhousei fowleri}}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {52(12)}, ' ...
'pages = {1489–1498}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?scientific_name=Anaxyrus+fowleri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


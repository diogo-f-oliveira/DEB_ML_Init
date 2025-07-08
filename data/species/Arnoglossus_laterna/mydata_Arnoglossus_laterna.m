function [data, auxData, metaData, txtData, weights] = mydata_Arnoglossus_laterna
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Bothidae';
metaData.species    = 'Arnoglossus_laterna'; 
metaData.species_en = 'Mediterranean scaldfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 09 03]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 03]; 

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'fishbase';    
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 1.8;   units.Lj = 'cm';   label.Lj = 'total length at metam (post-flexion)'; bibkey.Lj = 'CastEdwa2017';
data.Lp = 10;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'TiciMati2012';
data.Li = 25;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'CastEdwa2017';
  comment.Wwb = 'based on egg diameter of 0.7  mm: pi/6*0.07^3';

data.Ri = 3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'GibsEzzi1980';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity = 10^(3.3472 * log10(standard length in mm = 190)- 2.1064)';

% uni-variate data

% time-length data
tLW = [ ... % age (years), total length (cm), wet weight 
1  6.944  2.36
2  9.190  5.44
3 11.090 10.49
4 12.873 17.12
5 14.778 30.98
6 16.400 50.50];
tLW(:,1) = 365 * (0.75 + tLW(:,1)); % convert yr to d
data.tL = tLW(:,[1 2]);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TiciMati2012';
comment.tL = 'temp is guessed';
% time-weight
data.tW = tLW(:,[1 3]);
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TiciMati2012';
comment.tW = 'temp is guessed';

% length-weight data
data.LW = [ ... % total length (cm), wet weight (g)
5.264	0.694
5.390	1.040
5.755	1.849
5.755	0.689
5.869	1.268
5.869	1.036
5.944	1.615
6.007	1.267
6.095	1.266
6.158	1.613
6.259	1.612
6.259	1.148
6.385	1.147
6.397	1.959
6.448	1.378
6.523	2.074
6.586	2.073
6.775	2.768
6.775	2.071
6.901	2.070
6.926	2.998
7.027	2.881
7.027	2.069
7.115	1.952
7.178	3.112
7.178	2.416
7.279	2.531
7.316	2.066
7.404	3.458
7.430	2.645
7.505	2.064
7.530	3.108
7.656	3.571
7.681	2.527
7.757	2.526
7.782	3.454
7.794	3.918
7.908	2.989
7.920	3.685
7.933	2.640
8.009	3.916
8.009	2.988
8.097	4.147
8.109	2.871
8.185	3.334
8.210	4.378
8.336	4.145
8.386	5.305
8.386	3.100
8.411	4.028
8.474	4.840
8.537	3.447
8.575	5.303
8.588	4.258
8.651	3.910
8.688	5.302
8.726	4.605
8.802	3.908
8.915	4.719
8.940	5.531
8.991	4.371
9.066	5.414
9.091	6.226
9.104	4.369
9.217	5.645
9.255	4.368
9.318	5.064
9.393	6.339
9.393	5.759
9.418	6.919
9.481	5.178
9.582	6.918
9.582	5.989
9.595	4.481
9.658	5.524
9.695	7.729
9.746	6.568
9.771	7.728
9.784	5.407
9.834	6.219
9.896	7.727
9.947	6.682
10.035	7.958
10.073	6.681
10.098	8.305
10.199	7.724
10.199	6.912
10.199	5.751
10.236	9.000
10.299	9.928
10.337	8.071
10.388	7.142
10.400	9.462
10.463	6.677
10.488	8.997
10.501	8.069
10.639	9.808
10.651	10.504
10.652	8.996
10.690	7.371
10.701	11.432
10.803	9.691
10.853	11.199
10.866	8.994
10.979	8.413
11.004	9.921
11.029	10.849
11.104	12.356
11.105	8.991
11.205	10.151
11.243	11.775
11.280	13.515
11.306	10.614
11.356	12.818
11.444	12.237
11.456	13.745
11.507	11.308
11.609	8.522
11.659	11.075
11.696	11.306
11.708	13.395
11.759	12.002
11.859	13.161
11.897	15.946
11.897	12.697
11.909	15.017
12.023	15.248
12.098	15.944
12.099	11.303
12.111	13.971
12.174	12.810
12.237	16.291
12.288	12.461
12.312	15.246
12.489	11.879
12.576	20.581
12.601	17.215
12.702	17.214
12.703	15.358
12.815	18.026
12.917	15.936
12.941	18.024
12.980	14.427
13.068	16.399
13.080	15.122
13.168	19.763
13.168	17.210
13.168	15.934
13.268	21.386
13.295	14.656
13.306	19.529
13.307	17.093
13.357	19.181
13.420	18.600
13.520	20.339
13.520	19.295
13.910	22.308
13.973	23.468
14.022	26.832
14.124	23.467
15.016	29.840
15.017	26.591
15.105	27.866
15.205	30.766
15.393	33.549
15.404	42.368
16.097	37.836
16.900	52.796];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'TiciMati2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.p_M = 3 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'demersal';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.0031 * (L in cm)^3.19';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '5W53M'; % Cat of Life
metaData.links.id_ITIS = '172805'; % ITIS
metaData.links.id_EoL = '46569748'; % Ency of Life
metaData.links.id_Wiki = 'Arnoglossus_laterna'; % Wikipedia
metaData.links.id_ADW = 'Arnoglossus_laterna'; % ADW
metaData.links.id_Taxo = '46908'; % Taxonomicon
metaData.links.id_WoRMS = '127126'; % WoRMS
metaData.links.id_fishbase = 'Arnoglossus-laterna'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arnoglossus_laterna}}';
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
bibkey = 'TiciMati2012'; type = 'article'; bib = [ ...
'author = {V. Ticina and S. Matic-Skoko}, ' ... 
'year   = {2012}, ' ...
'title  = {Age, growth and mortality of scaldfish (\emph{Arnoglossus laterna} {W}albaum, 1792) from the {A}driatic {S}ea}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'page = {836-841}, ' ...
'volume = {28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GibsEzzi1980'; type = 'article'; bib = [ ...
'author = {Gibson, R. N. and Ezzi, I. A.}, ' ... 
'year   = {1980}, ' ...
'title  = {The biology of the scaldfish, \emph{Arnoglossus laterna} ({W}albaum) on the west coast of {S}cotland}, ' ...
'journal = {J. Fish Biol.}, ' ...
'page = {565--575}, ' ...
'volume = {17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/41}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastEdwa2017'; type = 'Book'; bib = [ ...  
'author = {C. Castellani and M. Edwards}, ' ...
'year = {2017}, ' ...
'title  = {Marine Plankton: A practical guide to ecology, methodology and taxonomy}, ' ...
'publisher = {Oxford Univ. Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

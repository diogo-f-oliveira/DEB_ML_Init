  function [data, auxData, metaData, txtData, weights] = mydata_Alburnus_baliki

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnus_baliki'; 
metaData.species_en = 'Antalya bleak'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 03 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 09]; 

%% set data
% zero-variate data
data.ab = 10;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess'; 
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tLW';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'InnaGull2019';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.33;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'guess';
  comment.Lp = 'based in Alburnus alburnus: 9.9*16/25';
data.Li = 16;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'InnaGull2019';

data.Wwb = 3.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 and 1.14 mm of Alburnus alburnus: pi/6*0.09^3';
data.Wwi = 44; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'InnaGull2019';

data.Ri = 5e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of Alburnus alburnus: 7000*44/60';

% univariate data

% time-length
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
0  3.03  0.21
1  5.50  1.35
2  8.22  4.93
3 11.02 12.80
4 14.70 33.21];
data.tLW(:,1) = 365 * (0.8+data.tLW(:,1));
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(19);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'InnaGull2019'; treat.tLW = {1, {'total length','weight'}};
comment.tLW = 'Data from estuary of the Manavgat River, Antalya, Turkey';

% length-weight
data.LW_f = [ ... % total length (dm), wet weight (g)
0.413	0.824
0.423	0.983
0.439	0.668
0.452	1.302
0.465	1.303
0.481	1.304
0.494	1.305
0.539	1.467
0.555	1.626
0.581	2.103
0.610	2.105
0.623	1.948
0.636	1.949
0.652	2.900
0.668	3.059
0.697	3.220
0.710	3.221
0.732	3.381
0.749	3.857
0.787	4.176
0.826	5.762
0.858	5.764
0.862	5.764
0.878	6.399
0.891	6.558
0.910	6.876
0.936	8.302
0.965	10.045
0.978	8.305
0.994	8.939
1.014	10.049
1.014	12.106
1.033	11.316
1.043	10.684
1.085	14.801
1.107	12.429
1.130	12.431
1.130	14.646
1.156	17.813
1.198	17.183
1.217	19.084
1.243	23.358
1.350	22.575
1.587	43.955];
data.LW_f(:,1) = data.LW_f(:,1) * 10; % convert dm to cm
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'wet weight', 'females'};  
bibkey.LW_f = 'InnaGull2019';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
3.923	0.385
4.036	0.513
4.149	0.385
4.216	0.449
4.239	0.449
4.352	0.449
4.442	0.513
4.600	0.641
4.712	0.513
4.825	0.833
5.028	0.641
5.299	1.154
5.367	1.026
5.480	1.346
5.593	1.538
5.728	1.346
5.909	1.731
6.180	2.115
6.270	1.987
6.315	1.987
6.405	2.051
6.473	2.051
6.630	2.115
6.744	2.628
6.901	2.564
7.127	2.821
7.263	2.949
7.263	3.526
7.421	3.077
7.556	2.885
7.579	3.782
7.646	2.885
7.714	3.333
7.782	3.333
7.827	4.103
7.873	4.808
7.917	3.718
7.986	4.551
8.121	4.744
8.166	4.359
8.279	4.615
8.551	5.577
8.574	5.962
8.595	5.064
8.664	6.090
8.822	6.410
8.911	5.256
8.912	6.538
9.114	5.833
9.590	7.885
9.635	7.436
9.864	10.513
10.068	11.410
10.247	10.513
10.363	13.397
10.992	11.538
10.993	12.308
11.063	14.359
11.810	17.308
12.125	16.859];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'wet weight', 'males'};  
bibkey.LW_m = 'InnaGull2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;

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
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females,males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'BGWQ'; % Cat of Life
metaData.links.id_ITIS = '688379'; % ITIS
metaData.links.id_EoL = '222312'; % Ency of Life
metaData.links.id_Wiki = 'Alburnus_baliki'; % Wikipedia
metaData.links.id_ADW = 'Alburnus_baliki'; % ADW
metaData.links.id_Taxo = '160303'; % Taxonomicon
metaData.links.id_WoRMS = '1008959'; % WoRMS
metaData.links.id_fishbase = 'Alburnus-baliki'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnus_baliki}}';  
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
bibkey = 'InnaGull2019'; type = 'article'; bib = [ ...  
'author = {Deniz Innal and Iskender G\"{u}lle}, ' ...
'year = {2019}, ' ...
'title = {Age and Growth Parameters of the {A}ntalya Bleak \emph{Alburnus baliki} {B}ogutskaya, {K}\"{u}\c{c}\"{u}k \& \"{U}nl\"{u}, 2000 ({A}ctinopterygii: {C}yprinidae) in the {M}anavgat {R}iver {E}stuary, {T}urkey}, ' ... 
'journal = {Acta zool. bulg., , : }, ' ...
'volume = {71(3)}, ' ...
'pages = {399-405}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnus-baliki}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Geospiza_conirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thraupidae';
metaData.species    = 'Geospiza_conirostris'; 
metaData.species_en = 'Espanola cactus finch'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Gran1981';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Gran1981';
data.Wwi = 27.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 3.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 4 eggs per clutch; 1 clutches per yr';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.075	2.480
0.114	2.054
0.114	1.550
0.941	3.253
0.959	3.873
0.960	3.640
0.960	2.865
0.960	2.632
1.960	4.994
1.961	3.637
1.977	6.776
1.979	5.420
1.979	4.800
1.980	4.412
1.980	3.870
1.997	6.118
2.959	7.626
2.960	6.386
2.960	6.037
2.961	5.804
2.979	6.812
2.982	3.866
2.999	5.455
3.000	4.796
3.038	5.261
3.940	8.824
3.940	8.553
3.941	8.243
3.941	8.010
3.941	7.623
3.958	9.910
3.959	9.483
3.959	9.134
3.961	7.274
3.980	7.041
3.981	6.770
4.001	5.413
4.959	10.682
4.961	9.131
4.961	8.550
4.962	7.271
4.963	6.961
4.979	10.216
4.979	10.023
4.980	8.860
4.981	7.891
4.997	11.030
4.999	9.557
4.999	9.286
5.002	5.798
5.016	11.147
5.999	10.678
6.015	14.089
6.016	13.779
6.016	13.546
6.020	9.438
6.020	9.322
6.020	8.856
6.036	12.577
6.036	12.267
6.037	11.996
6.037	11.608
6.037	11.221
6.037	10.988
6.978	14.086
6.979	13.776
6.979	13.466
6.980	12.613
6.980	12.303
6.980	11.993
7.000	11.644
7.000	11.373
7.000	11.179
7.001	11.024
7.020	10.752
7.020	10.404
7.021	10.171
7.034	16.101
7.034	15.907
7.036	14.706
7.996	17.532
7.998	15.168
7.998	14.858
7.999	14.238
7.999	13.928
8.015	17.338
8.016	17.028
8.034	17.958
8.034	17.803
8.036	16.137
8.036	15.749
8.036	15.478
8.961	15.824
8.980	15.552
8.996	18.576
8.997	18.382
8.997	18.033
8.999	16.172
9.002	13.110
9.017	17.645
9.017	17.374
9.020	14.118
9.020	13.769
9.021	13.459
9.022	12.296
9.022	11.637
9.023	11.366
9.039	14.389
9.977	20.510
9.997	20.123
9.998	18.766
9.998	18.378
10.000	16.906
10.002	14.968
10.002	14.541
10.016	19.774
10.018	17.991
10.022	13.766
10.022	13.456
10.039	16.518
10.039	16.208
11.000	18.414
11.018	19.809
11.019	18.802
11.036	20.584
11.039	17.484
11.040	17.135
11.040	16.708
11.041	15.778
11.041	15.429
11.042	15.042
11.042	14.344
11.079	16.243
11.998	21.860
12.039	19.806];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-2;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gran1981';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Food availability taken variable in tW data';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3FSBX'; % Cat of Life
metaData.links.id_ITIS = '560235'; % ITIS
metaData.links.id_EoL = '1050330'; % Ency of Life
metaData.links.id_Wiki = 'Geospiza_conirostris'; % Wikipedia
metaData.links.id_ADW = 'Geospiza_conirostris'; % ADW
metaData.links.id_Taxo = '58176'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '18306F20EFC1E102'; % avibase
metaData.links.id_birdlife = 'espanola-cactus-finch-geospiza-conirostris'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geospiza_scandens}}';
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
bibkey = 'Gran1981'; type = 'Article'; bib = [ ... 
'author = {Grant, P. R.}, ' ... 
'doi = {10.1098/rspb.1981.0046}, ' ...
'year = {1981}, ' ...
'title = {Patterns of Growth in Darwin''s Finches. , , }, ' ...
'journal = {Proceedings of the Royal Society B: Biological Sciences}, ' ...
'volume = {212(1189)}, ' ...
'pages = {403–432}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1050330/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


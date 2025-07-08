  function [data, auxData, metaData, txtData, weights] = mydata_Alburnus_alburnus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnus_alburnus'; 
metaData.species_en = 'Bleak'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Wd'; 'Wd-pX'; 'Wd-JO'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 03 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 09]; 

%% set data
% zero-variate data
data.ab = 4;        units.ab = 'd';  label.ab = 'age at birth';            bibkey.ab = 'fishbase'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'this is hatch, not start feeding';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';   bibkey.Lp = 'fishbase';
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 and 1.14 mm: pi/6*0.07^3';
data.Wwi = 60; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';

data.Ri = 7e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';        bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity between 3448 and 14695';

% univariate data

% time-weight
data.tWd = [ ... % time since birth (yr), dry weight (mg)
9.805	0.454
13.404	0.619
15.531	0.830
16.815	1.071
18.707	1.091
22.507	1.354
23.616	2.578
27.030	1.458
28.942	1.864
32.584	4.048
36.561	3.505
41.734	4.737
44.820	7.385
46.267	5.714
55.447	9.142
63.229	10.306
68.716	13.794
75.458	17.267
91.967	21.731];
units.tWd = {'d', 'mg'}; label.tWd = {'time since birth', 'dry weight'};  
temp.tWd = C2K(20);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'KeckSchi1990'; 

% dry weight-food intake
data.WdpX = [ ... % dry weight (mg), food intake (J/d)
0.634	23.480
0.699	18.097
0.879	15.669
0.986	17.136
1.113	33.802
1.221	38.254
1.344	26.017
1.470	21.529
1.635	19.124
1.756	25.965
1.903	36.976
2.072	17.886
2.249	33.963
2.434	40.802
2.581	55.990
2.769	60.744
3.082	61.021
3.371	54.448
3.385	66.367
3.508	59.208
3.905	59.485
4.141	74.375
4.364	71.384
4.555	84.786
4.829	76.431
5.036	64.800
5.561	63.887
5.642	83.851
6.124	77.875
6.629	85.608
6.719	80.241
7.336	68.899
7.494	64.127
7.839	83.787
8.540	88.241
8.892	94.491
8.929	84.358
9.651	87.919
10.161	81.949];
units.WdpX = {'mg', 'J/d'}; label.WdpX = {'dry weight', 'food intake'};  
temp.WdpX = C2K(20);  units.temp.WdpX = 'K'; label.temp.WdpX = 'temperature';
bibkey.WdpX = 'KeckSchi1990';
comment.WdpX = 'food consists of Artemia,  2400 ind/L';


% dry weight-O2 consumption
data.WdJO = [ ... % wdry weight (mg), O2 consumption (mumol/h);
0.299	0.092
1.175	0.239
1.372	0.166
1.535	0.267
1.937	0.460
2.142	0.428
2.619	0.277
2.871	0.267
4.043	0.370
4.919	0.765
6.364	0.692
6.853	0.758
7.122	1.120
7.657	0.845
9.556	0.943
10.278	0.772
11.914	0.838
15.279	0.853
17.915	1.611
18.388	1.100
18.569	1.272
20.215	2.097
21.528	1.432
22.565	1.829
23.020	2.704
25.405	1.368
25.909	1.846
27.105	1.471
29.473	1.829
32.401	3.518
34.158	1.897
38.150	1.897
49.443	2.704
56.285	3.184];
units.WdJO = {'mg', 'mumol/h'}; label.WdJO = {'dry weight', 'O_2 consumption'};  
temp.WdJO = C2K(20);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'KeckSchi1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tWd = 3 * weights.tWd;
weights.ab = 0 * weights.ab;
weights.WdpX = 3 * weights.WdpX;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 30 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '66876'; % Cat of Life
metaData.links.id_ITIS = '163663'; % ITIS
metaData.links.id_EoL = '46581697'; % Ency of Life
metaData.links.id_Wiki = 'Alburnus_alburnus'; % Wikipedia
metaData.links.id_ADW = 'Alburnus_alburnus'; % ADW
metaData.links.id_Taxo = '43610'; % Taxonomicon
metaData.links.id_WoRMS = '154285'; % WoRMS
metaData.links.id_fishbase = 'Alburnus-alburnus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnus_alburnus}}';  
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
bibkey = 'KeckSchi1990'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.1990.tb05632.x}, ' ...
'author = {H. Keckeis and F. Schiemer}, ' ...
'year = {1990}, ' ...
'title = {Consumption, growth and respiration of bleak, \emph{Alburnus alburnus} ({L}.), and roach, \emph{Rutilus rutilus} ({L}.), during early ontogeny}, ' ... 
'journal = {J . Fish Biol.}, ' ...
'volume = {36(6)}, ' ...
'pages = {841–851}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnus-alburnus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


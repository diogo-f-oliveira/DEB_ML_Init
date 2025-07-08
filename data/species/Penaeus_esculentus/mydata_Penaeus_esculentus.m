  function [data, auxData, metaData, txtData, weights] = mydata_Penaeus_esculentus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Penaeidae';
metaData.species    = 'Penaeus_esculentus'; 
metaData.species_en = 'Brown tiger prawn'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPSW', 'MI'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'WWb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'Ww-JO'; 't-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 24];

%% set data
% zero-variate data
data.ab = 2; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'fish';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on value for Palaemonetes varians';
data.Wwp = 32;     units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fish';
  comment.Wwp = 'based on tp = 6 mnth and tW data';
data.Wwi = 114;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fish';
  comment.Wwi = 'based on ultimate carapace length CLi=55 mm and CLp=36 mm and Wwp: 32*(55/36)^3';

data.Ri = 1.3*46780/30; units.Ri = '#/d'; label.Ri = 'ultimate reproduction rate'; bibkey.Ri = 'KeysCroc2006';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';  
  comment.Ri = '46780 eggs per spawn for wild population, 1.3 spawns per month';
  
% uni-variate data
% time-length
data.tW = [ ... % time (d), wet weight (g)
 28.240	 1.849
 50.831	 5.905
 71.883	 8.104
 90.367	12.161
100.122	14.943
115.526	16.912
134.523	22.013
156.088	26.997
175.599	32.098
196.650	31.861
238.240	37.304
265.452	40.430
302.421	43.669
333.227	46.562
358.386	51.661];
data.tW(:,1) = data.tW(:,1) - 28.24; % set origin at first data point
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KeysCroc2006';

% weight-respiration
data.WJO20 = [ ... % wet weight (g), O2 consumption (mg/h)
2.134	0.262
2.253	0.253
2.755	0.301
3.797	0.506
4.726	0.522
4.728	0.583
4.732	0.795
5.133	0.604
5.376	0.754
5.886	0.628
5.945	0.838
6.049	0.609
6.162	0.666
6.512	0.795
6.995	0.503
7.333	0.872
8.036	0.996
8.566	0.978
10.867	1.304
15.234	1.536
16.537	1.522
18.121	1.670
18.440	1.309
18.618	1.535
19.496	1.793
20.221	1.825
25.891	2.509];
units.WJO20   = {'g', 'mg/h'};  label.WJO20 = {'wet weight','O_2 consumptions','20 C'};  
temp.WJO20    = C2K(20);  units.temp.WJO20 = 'K'; label.temp.WJO20 = 'temperature';
bibkey.WJO20 = 'Dall1986';
%
data.WJO25 = [ ... % wet weight (g), O2 consumption (mg/h)
1.849	0.602
2.080	0.513
2.301	0.573
2.761	0.599
3.635	0.997
3.664	0.649
4.087	0.623
4.131	1.075
4.653	1.244
4.776	0.820
4.957	0.992
5.004	1.164
5.789	1.055
6.006	1.174
6.059	1.084
6.118	1.271
7.140	1.088
8.120	1.477
10.981	2.022
15.394	2.360
16.717	2.684
18.151	2.881
18.816	2.467
19.702	2.842
19.712	3.319
20.246	2.707
20.445	3.378
21.205	3.438
21.989	3.231
21.997	3.642
22.206	4.051
25.691	3.909];
units.WJO25   = {'g', 'mg/h'};  label.WJO25 = {'wet weight','O_2 consumptions','25 C'};  
temp.WJO25    = C2K(25);  units.temp.WJO25 = 'K'; label.temp.WJO25 = 'temperature';
bibkey.WJO25 = 'Dall1986';
%
data.WJO30 = [ ... % wet weight (g), O2 consumption (mg/h)
1.885	0.840
2.063	0.682
2.240	0.706
2.714	0.873
3.572	1.256
3.703	1.109
4.657	1.644
4.785	1.498
4.871	1.335
5.247	2.079
5.744	1.629
5.905	1.772
5.955	1.491
6.292	1.636
6.654	2.460
7.558	2.201
8.137	3.015
8.521	3.552
10.409	3.014
15.279	4.000
16.747	4.839
18.504	4.052
18.507	4.254
19.722	3.980
19.909	4.407
21.821	5.215];
units.WJO30   = {'g', 'mg/h'};  label.WJO30 = {'wet weight','O_2 consumptions','30 C'};  
temp.WJO30    = C2K(30);  units.temp.WJO30 = 'K'; label.temp.WJO30 = 'temperature';
bibkey.WJO30 = 'Dall1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;
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
set1 = {'WJO30','WJO25','WJO20'}; subtitle1 = {'Data for 30, 25, 20 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Contribution of assimilation to respiration was exclude, because Dall1986 aimed at a low respiration';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '9XW5V'; 
metaData.links.id_ITIS = '95625';
metaData.links.id_EoL = '46502068'; % Ency of Life
metaData.links.id_Wiki = 'Penaeus_esculentus'; % Wikipedia
metaData.links.id_ADW = 'Penaeus_esculentus'; % ADW
metaData.links.id_Taxo = '514328'; % Taxonomicon
metaData.links.id_WoRMS = '514328'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Penaeus_esculentus}}'];
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
bibkey = 'Dall1986'; type = 'article'; bib = [ ...
'doi = {10.1016/0022-0981(86)90013-4}, ' ...
'author = {Dall, W.}, ' ... 
'title = {Estimation of routine metabolic rate in a penaeid prawn, \emph{Penaeus esculentus} {H}aswell}, ' ... 
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ... 
'year = {1986}, ' ... 
'volume = {96(1)}, ' ... 
'pages = {57–74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'KeysCroc2006'; type = 'article'; bib = [ ...
'doi = {10.1016/j.aquaculture.2006.02.044}, ' ...
'author = {S.J. Keys and P.J. Crocos}, ' ... 
'title = {Domestication, growth and reproductive performance of wild, pond and tank-reared brown tiger shrimp \emph{Penaeus esculentus}}, ' ... 
'journal = {Aquaculture}, ' ... 
'year = {2006}, ' ... 
'volume = {257}, ' ... 
'pages = {232–240}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'BanzKenw2001'; type = 'article'; bib = [ ...
'author = {John A.H. Benzie and Matthew Kenway and Elizabeth Ballment}, ' ... 
'title = {Growth of \emph{Penaeus monodon} x \emph{Penaeus esculentus} tiger prawn hybrids relative to the parental species}, ' ... 
'journal = {Aquaculture}, ' ... 
'volume = {193}, ' ...
'pages = {227–237}, ' ...
'year = {2001}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Sealifebase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.sealifebase.se/summary/Penaeus-esculentus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
%
bibkey = 'fish'; type = 'Misc'; bib = [...
'howpublished = {\url{https://fish.gov.au/2014-Reports/TIGER_PRAWNS}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Oreochromis_niloticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Oreochromis_niloticus'; 
metaData.species_en = 'Nile tilapia'; 

metaData.ecoCode.climate = {'Am', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa', 'biPz'};
metaData.ecoCode.gender  = {'Dg', 'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-Ww_f'; 'L-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1     = [2024 10 11];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 11];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 60;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 12e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg length of 3.7 mm and width 2.5 mm: pi/6*0.37*0.25^2';
data.Wwp  = 112.3;    units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';  bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.01905*Lp^2.97, see F1';
data.Wwi = 3.64e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01905*Li^2.97, see F1';

% uni-variate data

% time-weight at 3% feeding level
data.tW3 = [ ... % time (d), wet weight (g)
0.589	42.768
7.065	46.090
7.065	48.858
13.542	48.858
13.542	50.242
20.607	54.394
27.869	59.377
34.346	63.253
41.019	71.557
48.477	84.844
55.542	89.273
62.019	95.917
62.607	94.810
62.804	98.131
69.477	105.052
69.673	101.176
69.673	103.114
76.346	117.509
76.346	114.740
83.019	128.028
83.215	131.349
83.607	116.955
90.280	124.983
90.673	141.592
90.673	143.529
97.346	155.986
97.346	158.201
97.738	146.021
104.411	165.121
104.607	151.280
104.607	176.471
111.280	160.138
111.280	173.426
111.673	175.640];
units.tW3   = {'d', 'g'};  label.tW3 = {'time', 'wet weight'};  
temp.tW3    = C2K(25);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'BhujLitt2007';
% timw-weight  at 2% feeding level
data.tW2 = [ ... % time (d), wet weight (g)
0.785	39.446
6.869	38.339
13.738	40.000
13.738	41.384
21.000	40.277
21.000	41.384
28.065	46.644
28.065	44.983
34.150	46.090
34.150	48.858
41.607	52.180
41.607	54.118
41.607	56.886
48.084	57.163
48.477	60.761
48.477	62.422
48.477	64.913
55.542	60.484
55.542	62.699
55.542	64.637
55.542	67.405
62.607	65.190
62.607	71.557
62.607	73.495
69.084	69.343
69.477	77.924
69.477	79.308
76.738	88.166
76.935	78.754
83.804	93.149
83.804	88.997
84.000	100.346
90.084	95.917
90.477	105.606
91.458	103.114
97.542	103.391
97.542	113.080
97.738	107.543
104.215	118.616
104.215	120.554
104.215	122.491
104.607	110.588
111.477	115.294
111.477	131.626
111.673	117.232];
units.tW2   = {'d', 'g'};  label.tW2 = {'time', 'wet weight'};  
temp.tW2    = C2K(25);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'BhujLitt2007';
% time-weight at 1% feeding level
data.tW1 = [ ... % time (d), wet weight (g)
0.000	33.080
7.065	34.740
13.346	35.017
13.542	39.170
21.393	38.893
29.047	42.768
35.523	43.045
35.523	45.813
42.000	44.706
42.000	48.028
48.477	46.644
48.673	51.626
55.935	48.028
55.935	52.457
63.393	50.796
63.393	53.841
70.262	57.439
70.458	53.564
76.935	55.502
76.935	59.654
76.935	61.592
84.000	61.038
84.000	67.405
84.196	58.270
90.869	63.806
90.869	67.128
91.065	61.315
97.935	62.145
97.935	66.574
98.523	70.450
104.215	71.280
104.215	69.343
105.393	66.021
111.280	67.682
112.065	75.986];
units.tW1   = {'d', 'g'};  label.tW1 = {'time', 'wet weight'};  
temp.tW1    = C2K(25);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'BhujLitt2007';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
27.816	1071.429
28.855	857.143
29.974	1367.347
30.639	2285.714
31.008	2357.143
32.117	1275.510
32.645	2714.286
32.851	1295.918
33.447	1816.327
33.503	1887.755
34.555	2020.408
35.370	1448.980
35.779	2530.612
35.897	1530.612
35.961	1816.327
36.047	1346.939
36.149	2622.449
36.174	1928.571
36.409	2581.633
37.438	2102.041
37.463	1418.367
37.774	2663.265
37.878	1316.327
38.069	2173.469
38.232	2316.327
38.912	979.592
39.025	1183.673
39.477	2040.816
40.311	1948.980
40.406	1683.673
40.491	2530.612
40.916	2683.673
41.107	2204.082
41.621	1979.592
41.702	1357.143
41.763	2908.163
41.828	1897.959
41.972	2908.163
42.043	2040.816
42.338	1551.020
42.372	2418.367
42.498	2969.388
42.600	2887.755
42.778	2112.245
42.925	1846.939
42.954	2581.633
43.022	1642.857
43.136	1887.755
43.366	2418.367
43.543	1571.429
43.683	2479.592
43.882	2224.490
43.886	2316.327
44.076	1826.531
44.350	2142.857
44.950	2744.898
45.505	2214.286
46.047	2693.878
46.856	1959.184
47.033	2459.184
47.152	2826.531
47.437	2091.837
47.924	2489.796
47.983	2653.061
48.035	1306.122
48.110	1877.551
50.921	2816.327];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(25);  units.temp.LN = 'K'; label.temp.v = 'temperature';
bibkey.LN = 'Lung1994';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW3','tW2','tW1'}; subtitle1 = {'data at feeding level 3, 2, 1%'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: LN data added; egg size revised; Lb removed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g = 0.01905*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
F2 = 'female takes freshly led eggs in her mouth till birth';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Temp range 14-33 C; fresh and brachish waters';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6SSRC'; % Cat of Life
metaData.links.id_ITIS = '553310'; % ITIS
metaData.links.id_EoL = '46572770'; % Ency of Life
metaData.links.id_Wiki = 'Oreochromis_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Oreochromis_niloticus'; % ADW
metaData.links.id_Taxo = '46085'; % Taxonomicon
metaData.links.id_WoRMS = '293639'; % WoRMS
metaData.links.id_fishbase = 'Oreochromis-niloticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreochromis_niloticus}}';
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
bibkey = 'BhujLitt2007'; type = 'Article'; bib = [ ... 
'author = {R. C. Bhujel and D. C. Little and A. Hossain}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive performance and the growth of pre-stunted and normal {N}ile tilapia (\emph{Oreochromis niloticus}) broodfish at varying feeding rates}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {273}, ' ...
'pages = {71--79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lung1994'; type = 'inproceedings'; bib = [ ... 
'author = {Lung''ayia, H.B.O.}, ' ... 
'year = {1994}, ' ...
'editor = {Okemwa, E. and Wakwabi, E.O. and Getabu, A. (Ed.) , p. }, ' ...
'title = {Reproductive performance and the growth of pre-stunted and normal {N}ile tilapia (\emph{Oreochromis niloticus}) broodfish at varying feeding rates}, ' ...
'booktitle = {Proceedings of the Second EEC Regional Seminar on Recent Trends of Research on Lake Victoria Fisheries, NAIROBI: ICIPE SCIENCE}, ' ...
'pages = {121-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Oreochromis-niloticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


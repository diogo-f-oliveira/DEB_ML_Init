function [data, auxData, metaData, txtData, weights] = mydata_Balaenoptera_physalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenopteridae';
metaData.species    = 'Balaenoptera_physalus'; 
metaData.species_en = 'Fin whale'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp usually 37 or so for a mammal
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 07 23];              
metaData.email       = {'bas.kooijman@vu.nl'};        
metaData.address     = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 342;    units.tg = 'd';    label.tg = 'gestation time';                          bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 183;    units.tx = 'd';    label.tx = 'time since birth at weaning';             bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-6 months';
data.tp = 7*365;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AguiLock1987';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL_f data for Lp';
data.tpm = 2864;  units.tpm = 'd';   label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 114 * 365;    units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 11.5e2;   units.Lb  = 'cm';  label.Lb  = 'length at birth';                     bibkey.Lb  = 'Wiki';
comment.Lb = '11-12 m';
data.Lp  = 18.3e2;   units.Lp  = 'cm';  label.Lp  = 'length at puberty';                   bibkey.Lp  = 'Wiki'; 
  comment.Lp = '17.7 till 19 m';
data.Li_f  = 20.5e2; units.Li_f  = 'cm';  label.Li_f  = 'ultimate length for females';     bibkey.Li_f  = 'AguiLock1987';
data.Li_m  = 19.2e2; units.Li_m  = 'cm';  label.Li_m  = 'ultimate length for males';       bibkey.Li_m  = 'AguiLock1987';

data.Wwb = 1.8e6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                  bibkey.Wwb = 'AnAge';

data.Ri  = 0.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
1.728	1519.713
2.752	1616.117
3.648	1767.891
4.608	1772.560
5.696	1813.599
6.720	1829.335
7.552	1865.649
8.704	1919.337
9.600	1949.319
10.560	1849.594
11.584	1949.162
12.544	1983.884
13.632	1991.706
14.720	1986.875
15.552	1977.319
16.576	1980.401
17.600	2027.772
18.560	2084.638
19.584	1937.457
20.608	1983.246
21.632	2027.453
22.656	2003.646
24.640	1886.442
25.664	2020.807
27.584	1979.531
29.632	2056.873
32.576	2181.596
34.688	2069.127
35.648	2121.248
36.672	2056.316
37.632	2038.842
38.720	2010.284
39.552	2181.045
40.640	2046.512
45.000	2190.373
49.000	2041.448
52.000	1919.494
68.000	2045.869];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'length', 'female'};  
  temp.tL_f = C2K(20); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AguiLock1987';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.354	1273.440
1.887	1475.211
3.007	1564.937
4.068	1661.656
5.012	1717.761
6.073	1743.080
7.134	1799.199
8.196	1820.318
9.316	1821.843
10.318	1875.156
11.262	1859.861
12.323	1824.980
13.443	1876.906
14.446	1878.418
15.507	1777.737
16.509	1903.849
17.512	1920.761
18.632	1836.887
19.693	1960.206
20.637	1860.911
21.816	1968.843
22.877	1935.362
23.939	1882.281
25.000	1860.000
25.943	1918.906
27.064	1919.031
29.186	1868.869
36.798	1886.380
44.775	2016.863
50.000	1917.731
70.000	1947.681
80.000	1854.715
82.000	1978.780
84.000	1871.782];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'length', 'male'};
  temp.tL_m = C2K(20); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AguiLock1987';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % length {cm}, weight (ton)
1741.134	34.496
1858.933	37.612
1914.920	40.532
1919.956	48.333
1946.791	40.254
1948.559	41.664
1989.255	48.623
2019.845	40.450
2034.445	45.621
2036.030	49.475
2036.108	48.441
2036.262	46.373
2036.291	45.997
2041.249	54.832
2046.701	32.089
2064.126	49.572
2066.063	48.726
2066.168	47.317
2069.746	49.573
2077.240	49.574
2101.420	51.926
2109.224	47.792
2136.383	60.389
2161.225	53.907
2162.676	59.546
2162.732	58.794
2162.788	58.042
2165.028	53.155
2186.933	60.865
2224.565	58.707
2224.671	57.298
2256.007	64.162
2256.436	58.429
2266.853	69.427
2280.827	57.962
2314.572	57.684];
data.LW_f(:,2) = data.LW_f(:,2) * 1e6; % convert ton to g
units.LW_f = {'cm', 'g'};     label.LW_f = {'length', 'weight', 'female'};
bibkey.LW_f = 'LockWate1986';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % length {cm}, weight (ton)
1584.498	24.610
1584.744	21.320
1586.463	23.388
1618.341	23.016
1677.786	29.790
1845.868	36.952
1859.250	33.383
1887.311	33.950
1978.028	48.434
1989.220	49.093
1989.277	48.341
2075.036	53.991
2168.303	59.453];
data.LW_m(:,2) = data.LW_m(:,2) * 1e6; % convert ton to g
units.LW_m = {'cm', 'g'};     label.LW_m = {'length', 'weight', 'male'};
bibkey.LW_m = 'LockWate1986';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li_f =  50 * weights.Li_f;
weights.Li_m =  50 * weights.Li_m;
weights.Lb =  2 * weights.Lb;
weights.Wwb =  2 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 0.5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'neonates are much longer for their weight than adults, so the shape coefficient is assumed to change linear in length till puberty';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'KF8W'; % Cat of Life
metaData.links.id_ITIS = '180527'; % ITIS
metaData.links.id_EoL = '46559438'; % Ency of Life
metaData.links.id_Wiki = 'Balaenoptera_physalus'; % Wikipedia
metaData.links.id_ADW = 'Balaenoptera_physalus'; % ADW
metaData.links.id_Taxo = '68892'; % Taxonomicon
metaData.links.id_WoRMS = '137091'; % WoRMS
metaData.links.id_MSW3 = '14300023'; % MSW3
metaData.links.id_AnAge = 'Balaenoptera_physalus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Balaenoptera_physalus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Balaenoptera_physalus}}';
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
bibkey = 'AguiLock1987'; type = 'Article'; bib = [ ... 
'author = {A. Aguilar and C. H. Lockyer}, ' ... 
'year = {1987}, ' ...
'title = {Growth, physical maturity, and mortality of fin whales (\emph{Balaenoptera physalus}) inhabiting the temperate waters of the northeast {A}tlantic}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {65}, ' ...
'pages = {253--264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LockWate1986'; type = 'Article'; bib = [ ... 
'author = {C. H. Lockyer and T. Waters}, ' ... 
'year = {1986}, ' ...
'title = {Weights and anatomical measurements of {N}ortheastern {A}tlantic fin whales (\emph{Balaenoptera physalus}, {L}innaeus) and sei (\emph{B. borealis}, {L}esson) whales}, ' ...
'journal = {Mar. Mamm. Sci.}, ' ...
'volume = {2}, ' ...
'pages = {169--185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


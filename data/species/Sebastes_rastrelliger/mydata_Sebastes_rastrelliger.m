function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_rastrelliger

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_rastrelliger'; 
metaData.species_en = 'Grass rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 23*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 56;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';

data.Ri  = 760000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at TL 46.5 cm'; bibkey.Ri  = 'LoveJohn1998';   
temp.Ri = C2K(15);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
0.846	14.546
2.019	15.696
2.914	25.204
2.915	23.944
2.915	23.601
2.916	22.914
2.916	22.685
2.916	22.341
2.958	26.464
3.907	25.781
3.907	24.865
3.948	30.132
3.995	28.530
3.995	27.614
3.997	26.239
3.998	23.835
4.041	26.812
4.806	30.251
4.895	31.167
4.897	29.221
4.897	28.648
4.939	33.687
4.946	24.412
4.988	27.389
4.989	26.931
4.989	26.588
4.991	24.526
5.075	32.199
5.841	33.576
5.842	31.859
5.843	31.286
5.843	30.828
5.931	34.493
6.880	33.008
6.924	33.925
6.924	33.352
8.005	36.105
8.860	39.086
9.898	40.007
9.898	39.549
10.755	39.667
10.844	41.614
10.932	45.279
10.978	43.104
11.973	41.047
11.974	39.902
13.865	45.750
13.913	41.285
19.863	50.816
19.863	49.785
21.896	46.818];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveJohn1998';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.890	16.721
1.875	26.802
1.967	25.200
1.967	24.055
1.971	19.474
1.971	19.016
1.972	18.215
2.060	21.421
2.956	29.441
2.957	28.525
3.054	20.052
3.142	21.770
3.951	26.239
3.951	26.239
3.995	28.759
3.996	27.156
4.897	29.335
5.033	27.618
5.081	24.870
5.123	27.962
5.885	35.294
5.887	32.775
6.069	30.257
6.927	29.917
7.060	33.353
7.061	32.093
7.148	35.414
8.004	37.823
8.009	30.838
8.050	36.563
8.051	35.647
8.051	35.304
9.900	37.488
10.843	43.332
12.016	44.139
12.920	41.166
13.911	43.346
14.002	42.430
14.815	41.633
14.949	44.267
15.987	43.813
16.889	44.619
19.957	45.320
20.812	47.958
22.934	47.280];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveJohn1998';
comment.tL_m = 'data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
14.539	51.188
15.540	140.768
17.045	102.377
18.047	127.971
18.717	89.580
19.301	127.971
20.136	166.362
20.883	377.514
21.472	198.355
22.222	262.340
22.306	249.543
23.225	287.934
23.641	358.318
23.809	294.333
24.226	364.717
24.394	313.528
24.725	454.296
24.727	383.912
25.060	435.101
25.146	319.927
25.645	435.101
25.645	403.108
25.811	473.492
26.397	415.905
26.647	467.093
27.316	409.506
28.235	428.702
28.398	607.861
28.400	537.477
28.736	435.101
28.819	486.289
29.067	575.868
29.237	486.289
29.486	550.274
30.235	691.042
30.402	665.448
30.649	812.614
30.824	518.282
30.901	767.824
31.070	697.441
31.073	582.267
31.988	748.629
31.991	620.658
32.492	659.049
32.904	870.201
32.989	812.614
32.992	710.238
33.073	812.614
33.153	953.382
33.153	934.186
33.656	902.194
34.244	761.426
34.409	831.810
34.907	991.773
35.327	902.194
35.490	1068.556
35.821	1222.121
35.999	742.230
36.239	1222.121
36.241	1100.548
37.161	1094.150
37.496	1068.556
37.828	1151.737
38.748	1113.346
38.828	1266.910
39.246	1247.715
39.331	1215.722
39.660	1433.272
40.078	1426.874
40.087	1055.759
40.247	1350.091
40.825	1625.229
40.912	1465.265
41.239	1785.192
41.496	1503.656
41.996	1599.634
42.835	1433.272
42.914	1625.229
42.917	1497.258
43.752	1516.453
43.832	1702.011
43.834	1618.830
44.250	1682.815
44.904	2297.075
44.916	1797.989
45.666	1861.974
46.489	2386.654
46.831	2066.728
47.496	2239.488
49.493	2578.611
50.400	3109.689];
units.LWw  = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'LoveJohn1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4W7PJ'; % Cat of Life
metaData.links.id_ITIS = '166759'; % ITIS
metaData.links.id_EoL = '46568183'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_rastrelliger'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_rastrelliger'; % ADW
metaData.links.id_Taxo = '187321'; % Taxonomicon
metaData.links.id_WoRMS = '274839'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-rastrelliger'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_rastrelliger}}';
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
bibkey = 'LoveJohn1998'; type = 'Article'; bib = [ ... 
'author = {Milton S. Love and Korie Johnson}, ' ... 
'year = {1998}, ' ...
'title = {Aspects of the life histories of grass rockfish, \emph{Sebastes rastrelliger}, and brown rockfish, \emph{S. auriculatus}, from southern {C}alifornia}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {87}, ' ...
'pages = {100-109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-rastrelliger.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

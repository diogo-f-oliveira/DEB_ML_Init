function [data, auxData, metaData, txtData, weights] = mydata_Caulolatilus_microps

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Latilidae';
metaData.species    = 'Caulolatilus_microps'; 
metaData.species_en = 'Grey tilefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'biMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 10];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 42.5;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'Ross1978';
data.Li = 90;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 3.1e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Ross1978';
  comment.Wwb = 'based on egg diameter of 0.843 mm: pi/6*0.0843^3';
data.Wwp = 722;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.10, see F1';
data.Wwi = 7.4e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.10, see F1';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.879	29.058
4.011	37.175
5.020	37.500
5.968	40.097
6.916	41.883
8.101	46.104
8.930	48.214
10.055	53.247
11.179	58.442
12.186	61.526
13.016	64.123
13.963	67.857
14.972	68.019
16.102	64.448
18.056	71.104
19.060	79.058
19.953	75.649
20.963	73.377
21.967	80.682
23.988	76.461
25.884	81.169
27.072	79.221
30.870	79.383
31.765	71.266
33.838	79.383
34.906	78.734
35.973	80.519
38.822	80.195
39.887	86.201];
data.tL_f(:,1) = (0 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(22.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SchmKirc2015';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.823	38.474
3.953	34.903
4.840	39.773
6.025	43.506
7.032	47.565
7.920	50.812
9.045	54.545
9.872	61.526
11.056	66.721
12.003	70.455
13.070	73.377
13.959	75.162
14.907	77.110
15.975	77.760
17.103	77.760
18.169	81.494
19.886	88.312
26.000	85.714
26.890	85.390
29.975	88.312
34.846	80.519];
data.tL_m(:,1) = (0 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(22.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SchmKirc2015';

% length-fecundity
data.LN = [  ... % total length (cm), fecundity (#)
41.007	189311.541
44.880	303441.985
44.996	385869.431
46.076	195652.024
47.031	182970.767
47.482	931159.428
48.193	1070652.097
48.633	417572.429
48.704	81521.580
50.371	176630.284
51.535	1019927.358
51.584	1349637.434
51.969	544383.841
52.030	499999.876
52.085	639492.544
52.530	1590579.579
52.737	766304.246
53.312	1381340.432
53.896	1749093.989
54.503	1432065.170
54.820	899456.430
55.727	531702.874
56.150	373188.174
56.267	436594.170
57.216	595108.579
57.937	423912.913
57.993	531702.874
58.438	1470108.652
60.080	2307065.098
60.424	962862.136
60.497	557065.098
60.632	1844202.692
61.374	1083333.354
61.503	798007.243
62.180	1926630.429
63.420	2300724.469
63.627	3232789.764
64.188	2522644.729
64.559	2116847.691
64.968	2389492.544
67.312	1850543.466
69.338	3651267.987
73.558	4082427.358];
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(22.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Ross1978';

% weight-fecundity
data.WN = [  ... % weight (g), fecundity (#)
837.768	214972.254
1002.834	316225.305
1046.663	381667.110
1124.946	173702.056
1220.638	916880.554
1257.279	197637.459
1344.500	417688.316
1374.288	1095398.764
1423.337	96778.082
1450.238	1362992.363
1466.962	203831.269
1529.862	881581.084
1564.520	566562.844
1587.208	441754.943
1625.671	1600981.650
1628.500	1024366.783
1703.983	1387072.113
1829.099	632267.099
1858.391	1411033.760
1916.728	769095.191
1973.111	525436.994
2188.990	1518428.132
2195.770	2386335.796
2215.643	585170.520
2290.864	1001376.199
2415.192	407072.230
2425.501	555697.431
2426.638	323862.588
2474.535	1810048.991
2511.263	1072972.446
2567.821	793647.350
2630.751	1465452.682
2646.921	419236.768
2650.493	1941037.581
2889.103	550304.092
2890.226	2571441.490
2980.684	2131654.716
2990.321	2417003.031
2997.335	3237354.830
3134.333	2310172.926
3423.553	1852788.907
4552.188	3530484.774
4814.171	4125248.030];
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(22.6);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Ross1978';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 10;
weights.tL_m = weights.tL_m * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = .1;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'functional hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5XF7X'; % Cat of Life
metaData.links.id_ITIS = '168543'; % ITIS
metaData.links.id_EoL = '46580663'; % Ency of Life
metaData.links.id_Wiki = 'Caulolatilus'; % Wikipedia
metaData.links.id_ADW = 'Caulolatilus_microps'; % ADW
metaData.links.id_Taxo = '166663'; % Taxonomicon
metaData.links.id_WoRMS = '159404'; % WoRMS
metaData.links.id_fishbase = 'Branchiostegus-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caulolatilus}}';  
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
bibkey = 'Ross1978'; type = 'phdthesis'; bib = [ ...
'doi = {10.25773/v5-0s0k-ds97}, ' ...
'author = {Jeffrey L. Ross}, ' ...
'year = {1978}, ' ...
'title = {Life history aspects of the gray tilefish, \emph{Caulolatilus microps} ({G}oode and {B}ean, 1878}, ' ... 
'school = {William \& Mary; Virginia Institute of Marine Science}, ' ...
'volume = {29(4)}, '...
'pages = {437-441}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchmKirc2015'; type = 'techreport'; bib = [ ...
'author = {Schmidtke, M. and K. Kirch and C.M. Jones}, ' ...
'year = {2015}, ' ...
'title = {The population dynamics of blueline and golden tilefish, snowy and {W}arsaw grouper and wreckfish}, ' ... 
'institution = {Report to Virginia Marine Resources Commission, }, ' ...
'volume = {Grant F-132-R-2, February 18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caulolatilus-microps.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


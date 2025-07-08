function [data, auxData, metaData, txtData, weights] = mydata_Takifugu_rubripes
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Tetraodontidae';
metaData.species    = 'Takifugu_rubripes'; 
metaData.species_en = 'Japanese puffer'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 22];

%% set data
% zero-variate data

data.am = 12 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'OginYama2022';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 43;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'OginYama2022'; 
data.Lpm  = 38;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty in males';  bibkey.Lpm  = 'OginYama2022'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'OginYama2022';

data.Wwb = 3.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 - 0.91 mm of Sphoeroides maculatus: pi/6*0.088^3';
data.Wwi = 9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'OginYama2022';
  comment.Wwi = 'fishbase: based on 0.01622*Li^2.92, see F1, gives 4 kg';
  
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'OginYama2022';
  temp.GSI = C2K(19); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 27.7 27.7
    2 40.5 40.0
    3 47.5 46.4
    4 51.3 49.7
    5 53.4 51.5
    6 54.6 52.4
    7 55.2 52.9
    8 55.6 53.1];
data.tL_fm(:,1) = 365 * (0.6 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(19);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'UetaSano2010'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
20.095	148.352
21.088	181.319
22.303	214.286
22.965	263.736
24.069	296.704
27.050	379.121
32.681	576.923
37.319	1104.396
38.423	989.011
39.196	1219.780
39.637	1104.396
40.079	1302.198
40.189	857.144
40.741	1351.649
41.073	1186.814
41.514	1021.979
42.508	1467.033
42.950	1500.000
43.060	1961.539
43.502	1302.198
43.612	1763.736
43.833	2010.989
44.164	1434.067
45.268	2093.407
45.710	1631.868
46.703	1747.253
46.814	1912.088
46.924	2126.374
47.366	2456.044
47.366	2274.726
47.697	1978.022
47.697	2192.308
48.028	2752.747
48.139	2538.462
49.022	2736.264
49.022	2258.242
49.795	2076.923
50.016	2159.341
50.678	2901.099
51.009	2620.879
51.230	2802.198
51.230	1829.671
51.451	2340.659
52.114	2653.846
52.445	3543.956
53.107	2752.747
53.218	3445.055
53.438	3000.000
53.549	3560.440
53.770	3890.110
53.880	3049.451
54.432	3626.374
54.432	2818.682
54.543	4071.429
55.536	4549.451
55.647	4285.714
55.757	3329.671
55.868	3906.594
56.309	4302.198
56.751	5010.989
56.751	4483.517
56.972	4285.714
56.972	3708.791
57.965	3576.923
58.738	5175.824
58.849	4549.451
60.063	5670.330
60.615	4961.539
61.167	6230.770
61.167	4928.572
61.830	4697.802
62.382	5686.813
62.492	3857.143
62.603	6445.055
62.934	6164.836
63.044	4862.637
63.375	5835.165
63.596	6576.923
63.927	6263.736
64.369	6098.901
64.700	6412.088
65.584	6329.671
65.694	7928.572
67.792	8456.044
68.013	7219.781
68.785	8637.363
69.227	7401.099];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'females'};  
bibkey.LW_f = 'OginYama2022';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
20.488	187.033
22.150	162.001
23.145	239.289
23.699	252.312
25.580	355.565
34.543	884.490
36.869	910.982
37.087	1154.652
38.528	1026.975
38.857	1257.865
39.083	963.075
39.739	1514.598
40.188	1155.788
40.301	976.342
40.733	1694.449
40.964	1079.149
41.070	1399.701
41.400	1566.488
41.511	1515.247
41.734	1425.585
41.960	1156.437
42.174	1643.695
42.175	1579.592
42.724	1900.306
42.733	1323.386
43.170	1695.341
43.725	1580.160
44.165	1823.911
44.274	1939.335
44.823	2195.947
45.593	2555.203
46.483	2273.479
46.600	1901.726
46.823	1786.423
47.145	2466.028
47.695	2684.179
47.800	3056.012
47.820	1786.789
48.134	2940.750
48.914	2671.805
49.028	2466.718
49.577	2774.611
49.790	3300.331
49.919	2159.352
49.922	1979.866
50.228	3633.824
50.693	2223.738
50.890	3762.272
50.908	2659.715
50.911	2454.587
51.035	1634.120
51.120	3249.536
51.226	3531.626
52.115	3378.105
52.133	2237.086
52.342	3032.035
53.104	3840.006
53.780	3160.766
54.227	2878.879
54.311	4558.397
54.661	3443.141
54.677	2443.146
54.762	4084.203
55.000	3033.008
55.971	4687.210
55.999	2866.708
56.877	3379.850
57.977	3880.253
58.082	4264.906
60.187	4175.934
60.490	6035.020
61.283	4971.207];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'males'};  
bibkey.LW_m = 'OginYama2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length - weight: Ww in g = 0.01622*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54KQB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46571071'; % Ency of Life
metaData.links.id_Wiki = 'Takifugu_rubripes'; % Wikipedia
metaData.links.id_ADW = 'Takifugu_rubripes'; % ADW
metaData.links.id_Taxo = '188784'; % Taxonomicon
metaData.links.id_WoRMS = '278428'; % WoRMS
metaData.links.id_fishbase = 'Takifugu-rubripes'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Takifugu_rubripes}}';
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
bibkey = 'UetaSano2010'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.15199}, ' ... 
'author = {Ueta, Y. and J. Sano and H. Uchida}, ' ... 
'year = {2010}, ' ...
'title = {Growth and age-length key of the tiger puffer \emph{Takifugu rubripes} in the {E}ast {C}hina {S}ea, {S}ea of {J}apan, and {S}eto {I}nland {S}ea, {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, '  ....
'volume = {76(5)}, ' ...
'pages = {803-811}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OginYama2022'; type = 'article'; bib = [ ... 
'author = {Yoshimi Ogino and Atsuko Yamaguchi}, ' ... 
'year = {2022}, ' ...
'title = {Reduced lifetime fitness (growth, body condition and survivability) of hatchery-reared tiger pufferfish \emph{Takifugu rubripes} compared to wild counterparts}, ' ...
'journal = {Fish Biology}, '  ....
'volume = {101}, ' ...
'pages = {1270–1284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Takifugu-rubripes.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


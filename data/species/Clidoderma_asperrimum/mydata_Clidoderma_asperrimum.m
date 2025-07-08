function [data, auxData, metaData, txtData, weights] = mydata_Clidoderma_asperrimum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Clidoderma_asperrimum'; 
metaData.species_en = 'Roughscale sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.1); % K

metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data;

data.am = 15*365;       units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishebase';   
  temp.am = C2K(2.1);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lp  = 30;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'CengIsme2014';
  comment.Lp = '29-31 cm';
data.Li  = 62;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'fishebase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 383.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishebase';
  comment.Wwp = 'based on 0.00977*Lp^3.11, see F1';
data.Wwi = 3666;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishebase';
  comment.Wwi = 'max published weight; based on 0.00977*Li^3.11, see F1, gives 3.6 kg';

data.GSI  = 0.16;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'LimJeon2012';   
  temp.GSI = C2K(2.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    6 NaN  26
    8 35.0 35.2
    9 37.6 38.0
   10 42.3 40.5
   11 45.5 NaN
   12 48.1 NaN
   13 49.5 NaN
   14 51.3 NaN
   15 54.0 NaN];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0.3); % convert year class to time since birth
units.tL_fm = {'d', 'cm'};     label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(2.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TokrOrlo2003'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    6  NaN  NaN
    8  800  856
    9 1064 1118
   10 1477 1200
   11 1823  NaN
   12 2322  NaN
   13 2475  NaN
   14 3083  NaN
   15 2950  NaN];
data.tW_fm(:,1) = 365 * (data.tW_fm(:,1) + 0.3); % convert year class to time since birth
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
  temp.tW_fm = C2K(2.1);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'TokrOrlo2003'; treat.tW_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % totla length (cm), weight (g)
21.921	179.856
23.951	215.827
24.006	263.789
24.994	347.722
24.994	263.789
25.872	347.722
25.872	335.731
25.982	443.645
26.915	479.616
26.970	419.664
27.024	323.741
27.079	371.703
27.957	443.645
28.012	407.674
29.000	371.703
31.195	551.559
32.018	455.636
32.018	527.578
32.018	611.511
32.018	647.482
32.787	575.540
32.896	647.482
33.829	827.338
33.939	755.396
33.939	707.434
34.049	587.530
34.104	659.473
34.927	995.204
34.982	779.377
34.982	695.444
35.037	911.271
35.037	839.329
35.037	671.463
35.421	923.262
35.860	899.281
35.860	803.358
35.860	743.406
35.915	719.425
35.970	1019.185
35.970	959.233
35.970	851.319
35.970	671.463
36.902	863.310
36.902	683.454
36.957	1139.089
36.957	995.204
36.957	935.252
36.957	899.281
36.957	755.396
36.957	323.741
37.012	791.367
37.780	1079.137
37.890	1007.194
37.945	1127.098
37.945	1175.060
37.945	1294.964
38.000	947.242
38.055	815.348
38.055	899.281
38.878	947.242
38.878	1582.734
38.878	1187.050
38.933	1103.117
38.933	1043.165
38.988	983.213
38.988	623.501
39.043	1306.954
39.811	1199.041
39.866	1007.194
39.921	1103.118
39.921	1151.079
39.921	1294.964
39.921	1366.906
39.921	1474.820
39.976	851.319
40.360	1223.022
40.854	1258.993
40.909	455.635
40.909	1402.878
40.909	1330.935
40.909	1211.031
40.909	1139.089
40.963	1091.127
41.951	1258.993
41.951	1390.887
41.951	1498.801
42.006	1103.118
42.006	1175.060
42.006	1522.782
42.061	1318.945
42.061	1582.734
42.116	2206.235
42.610	1223.022
42.829	1678.657
42.884	1594.724
42.884	1306.954
42.939	2482.015
42.939	1798.561
42.939	1774.580
42.939	1546.763
42.939	1342.926
42.939	1258.993
42.994	1486.811
42.994	1390.887
42.994	1378.897
43.049	1870.504
43.049	1235.012
43.543	1726.619
43.598	1534.772
43.872	1486.811
43.872	1642.686
43.872	1942.446
43.872	1978.417
43.927	1582.734
43.927	1678.657
43.927	1738.609
43.927	1786.571
43.927	1858.513
43.927	1894.485
43.927	2194.245
43.982	1151.079
43.982	1354.916
43.982	1438.849
43.982	1834.532
44.805	1762.590
44.860	1474.820
44.860	1498.801
44.860	1570.744
44.860	1810.552
44.915	1043.166
44.915	1282.974
44.915	1690.648
44.970	1618.705
44.970	2002.398
45.024	1882.494
45.024	2086.331
45.134	2230.216
45.354	1606.715
45.463	1738.609
45.902	2410.072
45.902	1906.475
45.957	2194.245
45.957	1978.417
45.957	1822.542
45.957	1774.580
45.957	1642.686
45.957	1522.782
46.012	1702.638
46.012	1570.744
46.012	1486.811
46.067	2050.360
46.616	1714.628
46.835	2062.350
46.890	1942.446
46.890	2386.091
46.890	2494.005
46.945	1594.724
46.945	2038.369
46.945	2146.283
46.945	2230.216
46.945	2577.938
47.000	1714.628
47.000	1798.561
47.055	1079.137
47.110	1882.494
47.878	2050.360
47.878	1738.609
47.933	2925.659
47.933	2482.015
47.933	2386.091
47.933	2302.158
47.933	1966.427
47.933	1954.437
47.933	1906.475
47.933	1822.542
47.988	2278.178
47.988	2230.216
47.988	2122.302
47.988	1247.003
48.043	2709.832
48.043	2182.254
48.043	2014.389
48.043	1870.504
48.043	1786.571
48.482	1954.437
48.482	2589.928
48.921	2398.082
48.921	2098.322
48.921	2062.350
48.921	2026.379
48.921	2002.398
48.921	1882.494
48.921	1822.542
48.976	2470.024
48.976	2326.139
48.976	2242.206
48.976	2146.283
49.030	2601.919
49.030	2254.197
49.085	2805.755
49.854	1978.417
49.854	3177.458
49.909	1618.705
49.909	2410.072
49.909	2470.024
49.909	2733.813
49.909	2865.707
49.909	3009.592
49.963	2350.120
49.963	2601.919
49.963	2697.842
49.963	2781.775
50.018	1930.456
50.018	2230.216
50.018	2302.159
50.073	3081.535
50.951	3297.362
51.006	2745.804
51.006	2494.005
51.006	2230.216
51.061	2613.909
51.884	3309.352
51.884	2709.832
51.994	3561.151
51.994	2901.678
52.049	2949.640
52.049	2805.755
52.982	3009.592
53.037	3297.362
53.037	3705.036
53.970	3501.199
54.024	3357.314
54.079	3093.525
55.012	3465.228
56.000	3812.950
62.091	4400.479];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'TokrOrlo2003';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1  = 'males are supposed to differ from females by {p_Am} only';
D2 = 'temperature (C) in tL data is supposed to vary as T(t)=25+5*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.11';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'W5H7'; % Cat of Life
metaData.links.id_ITIS = '172864'; % ITIS
metaData.links.id_EoL = '46570144'; % Ency of Life
metaData.links.id_Wiki = 'Clidoderma_asperrimum'; % Wikipedia
metaData.links.id_ADW = 'Clidoderma_asperrimum'; % ADW
metaData.links.id_Taxo = '171437'; % Taxonomicon
metaData.links.id_WoRMS = '280216'; % WoRMS
metaData.links.id_fishbase = 'Clidoderma-asperrimum'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clidoderma_asperrimum}}';
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
bibkey = 'TokrOrlo2003'; type = 'Article'; bib = [ ... 
'author = {Tokranov, A.M. and A.M. Orlov}, ' ...
'year = {2003}, ' ...
'title = {On the distribution and biology of roughscale sole \emph{Clidoderma asperrimum} ({T}emminck et {S}chlegel, 1846) in the {P}acific waters off the northern {K}uril islands and southeastern {K}amchatka}, ' ...
'journal = {Bul. Sea Fish. Inst.}, ' ...
'volume = {2(159)}, ' ...
'pages = {67-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LimJeon2012'; type = 'Article'; bib = [ ... 
'author = {Han Kyu Lim and Min Hwan Jeong and Yong Hyun Do and Maeng Hyun Son}, ' ...
'year = {2012}, ' ...
'title = {Sexual Maturity and Reproductive Cycle of Roughscale Sole \emph{Clidoderma asperrimum} Cultured in Indoor Tank}, ' ...
'journal = {Jour. Fish. Mar. Sci. Edu.}, ' ...
'volume = {24(6)}, ' ...
'pages = {1003~1012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Clidoderma-asperrimum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

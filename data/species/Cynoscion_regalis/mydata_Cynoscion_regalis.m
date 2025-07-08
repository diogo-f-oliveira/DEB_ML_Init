function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_regalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_regalis'; 
metaData.species_en = 'Squeteague'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 11];

%% set data
% zero-variate data

data.ab = 1.7; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'fishbase';   
  temp.ab = C2K(20.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(12.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Cynoscion_nebulosus';

data.Lp  = 17.9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 98;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm for Cynoscion_nebulosus: pi/6*0.072^3';
data.Wwi = 9.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.06, see F1';

data.Ri = 1.7e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(12.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), standard length (cm)
    1 17.59 17.63
    2 31.83 29.58
    3 42.57 37.65
    4 51.80 50.18
    5 56.25 55.30
    6 75.20 73.50];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LoweChit1995'; treat.tL = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
16.915	64.686
19.869	115.007
24.295	115.620
25.662	190.676
26.573	240.713
26.909	165.893
28.051	278.351
29.067	203.626
30.554	378.520
30.887	266.267
31.688	366.200
32.942	441.240
33.161	328.971
34.072	366.530
34.308	516.295
35.792	641.278
35.889	391.737
36.239	541.519
38.393	504.384
39.770	729.174
41.368	879.128
41.812	716.979
42.494	729.552
42.735	954.184
43.751	866.981
43.869	941.863
45.015	1104.233
46.250	904.760
46.266	1141.839
46.600	1042.064
47.406	1229.341
47.626	1117.072
47.951	880.041
48.883	1254.502
49.439	1067.413
49.673	1179.745
50.131	1242.197
50.367	1379.484
50.942	1491.864
51.294	1679.078
51.502	1379.642
51.720	1242.417
52.423	1579.413
52.621	1142.720
53.209	1454.745
53.227	1729.257
53.689	1854.098
54.829	1929.123
55.017	1330.218
55.259	1567.328
55.399	1979.113
55.724	1729.603
56.306	1954.283
56.388	1467.663
56.508	1567.502
56.639	1842.030
56.996	2104.111
57.779	1917.054
58.938	2291.546
59.722	2129.445
60.037	1742.679
60.160	1879.951
60.422	2416.529
60.905	2878.272
61.783	2416.718
62.223	2192.180
62.458	2316.990
63.255	2354.533
64.625	2479.500
66.112	2666.872
66.671	2529.695
68.257	2480.004
68.527	3141.360
69.323	3166.426
69.409	2742.196
72.867	3566.205
75.283	4065.648
87.006	6338.218
87.917	6388.256
88.236	6051.401];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight','females'};  
bibkey.LW_f = 'LoweChit1995'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
35.553	454.079
37.035	566.584
39.427	691.693
40.906	754.287
41.703	791.831
42.161	854.283
42.836	754.554
43.525	879.427
44.331	1054.227
45.693	1066.894
46.378	1116.899
46.840	1241.741
47.412	1316.686
47.509	1067.145
48.086	1216.958
48.440	1416.650
49.672	1167.267
50.016	1217.225
50.256	1416.902
50.261	1491.769
50.583	1217.304
50.919	1142.484
51.712	1117.639
52.184	1404.692
52.192	1516.992
52.659	1729.178
53.091	1379.862
53.101	1542.074
53.682	1754.276
54.237	1554.709
54.343	1442.424
54.359	1679.503
55.594	1480.031
55.602	1604.809
56.074	1879.384
56.744	1717.267
56.765	2029.213
56.865	1829.583
57.664	1892.083
57.994	1742.396
58.580	2016.987
58.706	2216.648
59.037	2066.961
60.061	2104.536
60.186	2279.241
60.392	1954.849
60.995	2503.953
61.321	2279.399
61.329	2404.177
61.770	2204.595
62.443	2092.389
64.973	2591.848
65.184	2354.801
65.332	2878.885
65.455	3028.635
65.859	2255.073
68.411	3103.911
69.539	3004.246
71.367	3191.665
71.504	3553.538
72.066	3466.272
74.118	3603.811
80.906	5027.212];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight','males'};  
bibkey.LW_m = 'LoweChit1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'ab is ignored, the value probably relates to hatch';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00759*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BVN8'; % Cat of Life
metaData.links.id_ITIS = '169241'; % ITIS
metaData.links.id_EoL = '46578977'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion_regalis'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_regalis'; % ADW
metaData.links.id_Taxo = '172639'; % Taxonomicon
metaData.links.id_WoRMS = '159313'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-regalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion_regalis}}';
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
bibkey = 'LoweChit1995'; type = 'Article'; bib = [ ... 
'author = {Susan K. Lowerre-Barbieri and Mark E. Chittenden and Luiz R. Barbier}, ' ... 
'year = {1995}, ' ...
'title = {Age and growth of weakfish, \emph{Cynoscion regalis}, in the {C}hesapeake Bay region with a discussion of historical changes in maximum size}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {93}, ' ...
'pages = {643-656}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-regalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


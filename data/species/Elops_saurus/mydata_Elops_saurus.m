function [data, auxData, metaData, txtData, weights] = mydata_Elops_saurus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Elopiformes'; 
metaData.family     = 'Elopidae';
metaData.species    = 'Elops_saurus'; 
metaData.species_en = 'Ladyfish'; 

metaData.ecoCode.climate = {'MC', 'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg','THn'};
metaData.ecoCode.habitat = {'0iMr', '0iMcp', 'piFe', 'piFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Ls'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'dLb'}; 
metaData.data_1     = {'L-Ww'}; 
metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 08 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 08]; 

%% set data
% zero-variate data;
data.ab = 2.5;   units.ab = 'd';    label.ab = 'age at birth';                            bibkey.ab = 'ADW'; 
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'temp based on Wiki for Megalops atlanticus: preferred temp 22-28C'; 
data.am = 55*365;units.am = 'd';    label.am = 'life span';                               bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ls  = 2.8;   units.Ls  = 'cm';  label.Ls  = 'standard length at metamorphosis to stage 2'; bibkey.Ls  = 'flmnh';
  comment.Ls = 'guess based on Megalops atlanticus';
data.Lp  = 52;    units.Lp  = 'cm';  label.Lp  = 'total length at birth';              bibkey.Lp  = 'SantArbo1993'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';              bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on  egg diameter of 1 mm : pi/6*0.1^3';
data.Wwp = 783; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'SantArbo1993','fishbase'};
  comment.Wwp = 'based on  0.00603*Lp^2.98, see F1';
data.Wwi = 5.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00603*Li^2.98, see F1; fishbase gives 10 kg';

data.Ri  = 519400/365; units.Ri  = '#/d';label.Ri  = 'reprod rate at TL 95 cm';       bibkey.Ri  = 'SantArbo1993';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.dLb  = 0.0667/0.8355; units.dLb  = 'cm/d';label.dLb  = 'change in TL at birth'; bibkey.dLb  = 'Leve2014';   
  temp.dLb = C2K(25); units.temp.dLb = 'K'; label.temp.dLb = 'temperature';
  comment.dLb = 'based on 0.0667 cm/d change in SL, converted to TL using F2';

% univariate data
% length - weight
data.LWw = [ ... % total length (vm), wet weight (g)
22.212	58.574
23.070	33.289
23.611	59.021
24.697	84.927
25.473	104.345
26.641	85.548
27.028	104.841
27.802	137.038
28.116	105.189
28.506	98.924
29.202	137.485
29.203	124.706
29.432	169.507
29.748	112.100
30.447	118.713
30.673	195.463
31.225	118.962
31.375	176.518
31.611	144.644
31.768	125.525
31.997	176.716
32.462	189.644
32.543	151.332
32.623	132.188
33.323	126.022
33.552	170.823
33.625	215.575
34.096	177.387
34.323	241.357
34.869	222.362
35.101	235.216
35.496	171.444
35.565	260.923
35.959	203.541
36.108	267.487
36.575	267.636
36.813	216.594
37.124	216.693
37.360	184.820
37.586	261.569
37.587	255.180
38.050	287.276
38.432	357.686
38.515	306.594
38.522	229.919
38.905	287.550
39.054	357.885
39.294	281.284
39.302	204.609
39.446	319.671
40.597	473.394
40.927	281.806
42.242	346.124
42.688	557.129
42.859	403.829
43.404	391.224
43.555	442.390
43.626	512.700
46.265	558.272
48.127	597.205
48.190	744.190
48.448	495.071
48.756	527.119
49.139	584.749
49.846	501.908
50.049	815.072
50.621	534.104
50.847	604.464
50.986	777.032
50.993	700.357
51.690	726.139
52.403	592.182
53.314	822.505
55.165	970.061
55.185	771.984
55.251	887.021
55.708	989.404
56.413	932.121
56.866	1066.451
57.031	970.657
57.581	913.325
57.802	1034.801
59.642	1303.760
60.045	1163.313
60.336	1361.489
60.423	1265.671
60.576	1291.279
60.880	1361.663
60.953	1412.805
61.124	1259.504
61.351	1323.475
61.370	1119.008
61.556	1611.080
61.561	1559.964
61.897	1304.480
62.190	1489.877
62.215	1227.904
62.531	1176.887
62.612	1144.964
62.917	1208.959
63.126	1451.838
63.285	1419.939
63.607	1305.026
63.611	1266.689
63.697	1177.260
63.749	1439.257
63.918	1305.126
63.961	1662.967
63.988	1388.215
64.304	1337.198
64.320	1164.679
64.772	1318.178
64.935	1235.163
64.947	1113.761
64.976	1618.563
65.076	1388.563
65.614	1452.632
65.700	1363.203
66.225	1561.454
66.625	1452.955
66.737	1900.275
66.852	1516.926
66.920	1612.794
67.158	1568.142
67.249	1433.985
67.323	1472.348
67.542	1612.993
67.698	1613.043
67.862	1517.249
68.025	1447.013
68.635	1562.224
68.641	1504.718
68.670	2009.519
69.006	1754.035
69.466	1818.080
69.782	1767.063
69.787	1715.946
69.794	1645.661
69.995	1971.604
70.011	1805.475
71.010	1927.200
71.030	1722.733
71.171	1869.743
72.087	2042.560
72.484	1959.620
72.984	1614.732
73.005	1397.486
73.188	1915.116
73.253	2049.322
73.256	2017.374
73.790	2119.781
74.271	1972.970
74.558	2222.263
74.810	2030.650
74.962	2062.648
75.260	2196.928
75.399	2363.107
75.643	2254.559
75.646	2229.000
75.965	2139.646
76.026	2312.189
76.108	2273.876
76.562	2401.817
76.644	2357.115
76.805	2299.658
76.950	2401.941
77.495	2395.725
77.608	2830.266
78.833	2230.019
79.521	2351.644
79.577	2568.915
79.664	2479.485
80.585	2601.185
81.424	3572.699
82.871	3074.759
84.056	3688.556];
units.LWw = {'cm', 'g'};     label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'SantArbo1993';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females (lack of data)';
D2 = 'All larval forms are given the same shape coefficient, del_M, due to lack of data';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.8355 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6F549'; % Cat of Life
metaData.links.id_ITIS = '161111'; % ITIS
metaData.links.id_EoL = '46561204'; % Ency of Life
metaData.links.id_Wiki = 'Elops_saurus'; % Wikipedia
metaData.links.id_ADW = 'Elops_saurus'; % ADW
metaData.links.id_Taxo = '42509'; % Taxonomicon
metaData.links.id_WoRMS = '157875'; % WoRMS
metaData.links.id_fishbase = 'Elops-saurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elops_saurus}}';  
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
bibkey = 'SantArbo1993'; type = 'Article'; bib = [ ...  
'author = {Adriana Santos-Mart\''{i}nex and Santiago Ardboleda}, ' ...
'year = {1993}, ' ...
'title  = {Aspectos biologicos y ecologicos del macabi \emph{Elops saurus} {L}innaeus ({P}isces: {E}lopidae) en la {C}ienaga {G}rande de {S}anta {M}arta y {C}osta {A}dyacente, {C}aribe {C}olombiano}, ' ...
'journal = {An. Inst. Invest. Mar. Punta Betin}, ' ...
'volume = {22}, ' ...
'pages = {77-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leve2014'; type = 'Article'; bib = [ ...  
'author = {Juan C. Levesque}, ' ...
'year = {2014}, ' ...
'title  = {Age and growth of juvenile ladyfish (\emph{Elops} sp) in {T}ampa {B}ay, {F}lorida, {U}{S}{A}}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {2(2)}, ' ...
'pages = {145-157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Elops-saurus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/Gallery/Descript/Tarpon/Tarpon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Megalops_atlanticus/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


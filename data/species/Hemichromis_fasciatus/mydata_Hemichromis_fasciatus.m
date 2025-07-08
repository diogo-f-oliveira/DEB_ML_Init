function [data, auxData, metaData, txtData, weights] = mydata_Hemichromis_fasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Hemichromis_fasciatus'; 
metaData.species_en = 'Banded jewelfish'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 10];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 26.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ImorAdit2020';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm: pi/6*0.128^3';
data.Wwp = 7.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 255;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1; max published weight 300 g';

% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
289.892	7.968
336.450	8.353
351.384	8.996
365+46.119	10.795
365+74.230	11.695
365+104.976	12.016
365+196.775	13.365];
data.tL(:,1) = data.tL(:,1) - 200; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
7.786	497.625
8.008	844.589
8.074	734.634
8.107	950.384
8.163	954.637
8.163	641.609
8.185	1060.400
8.185	853.124
8.185	603.547
8.218	971.581
8.262	878.537
8.274	920.843
8.285	992.760
8.285	848.936
8.296	819.330
8.384	810.907
8.384	793.987
8.384	895.510
8.395	777.071
8.395	777.071
8.406	950.510
8.429	988.591
8.451	946.299
8.473	510.606
8.495	891.326
8.495	810.954
8.506	992.854
8.506	849.030
8.506	844.800
8.550	916.730
8.561	988.647
8.573	747.535
8.584	827.912
8.584	878.673
8.595	870.218
8.606	1060.578
8.617	857.537
8.628	899.843
8.639	942.148
8.661	1064.831
8.661	933.698
8.661	853.325
8.683	874.485
8.694	984.473
8.694	806.808
8.694	772.967
8.717	1009.863
8.717	815.278
8.750	992.957
8.761	933.740
8.783	916.829
8.783	980.280
8.783	811.076
8.805	1225.637
8.805	1043.742
8.805	891.457
8.838	1001.454
8.860	1111.447
8.872	976.088
8.872	1081.841
8.872	1136.832
8.872	1157.983
8.872	883.025
8.883	1191.829
8.894	1031.089
8.894	1056.469
8.905	942.261
8.971	1069.193
8.971	976.130
8.982	1014.206
8.993	950.759
9.082	1081.930
9.082	1048.089
9.082	1031.168
9.093	997.332
9.193	1065.056
9.204	1026.990
9.215	1001.614
9.215	1043.915
9.292	1094.709
9.292	1035.487
9.292	1014.337
9.303	1060.873
9.348	1098.963
9.370	997.449
9.370	1018.600
9.370	1043.980
9.370	1077.821
9.470	1044.023
9.481	1010.186
9.481	1077.868
9.525	1010.205
9.547	1052.516
9.580	1069.450
9.602	1060.999
9.602	1014.468
9.625	1107.540
9.647	1061.018
9.658	1010.261
9.669	1090.638
9.680	1111.793
9.691	1412.137
9.735	1052.595
9.757	1090.676
9.769	1031.459
9.769	1107.601
9.769	1132.982
9.780	1196.438
9.791	942.636
9.824	1010.332
9.879	1073.807
9.879	1048.426
9.901	1120.347
9.901	1103.427
9.913	1141.503
10.068	1268.472
10.090	1293.862
10.090	1357.314
10.090	1374.234
10.101	1298.097
10.101	1315.017
10.123	1137.362
10.123	1327.717
10.189	1353.126
10.189	1205.072
10.200	1386.971
10.223	1323.529
10.223	1306.609
10.223	1285.458
10.223	1264.307
10.311	1370.098
10.322	1323.571
10.322	1344.722
10.333	1298.195
10.333	1213.593
10.389	1344.750
10.400	1382.826
10.400	1323.604
10.400	1302.453
10.488	1268.650
10.488	1327.872
10.499	1230.584
10.522	1374.417
10.522	1399.798
10.577	1340.599
10.577	1315.219
10.588	1349.064
10.610	1382.915
10.666	1382.938
10.688	1425.249
10.732	1366.046
10.754	1391.436
10.798	1332.233
10.810	1234.945
10.810	1353.388
10.810	1404.150
10.876	1459.169
10.887	1450.714
10.898	1306.894
10.920	1425.347
10.920	1404.196
10.987	1569.199
11.020	1704.577
11.031	1611.519
11.031	1480.385
11.053	1662.290
11.064	1624.223
11.086	1598.852
11.109	1708.845
11.120	1497.343
11.186	1789.250
11.186	1666.576
11.208	1581.983
11.230	1751.197
11.230	1603.143
11.275	1620.082
11.308	1704.699
11.396	1560.912
11.396	1548.222
11.485	1679.393
11.496	1797.841
11.496	1637.097
11.596	1586.377
11.607	1628.683
11.707	1654.106
11.773	1658.364
11.806	1675.299
11.806	1590.696
11.817	1802.207
11.828	1709.149
11.906	1798.014
12.017	1734.609
12.083	1730.407
12.116	1802.333
12.238	1815.075
12.271	1857.391
12.415	1853.221
12.415	1789.770
12.415	1764.389
12.471	1823.634
12.504	1789.807
12.515	1705.209
12.604	1836.381
12.626	1882.921
12.725	1781.440
12.736	1794.136
12.781	1840.686
12.781	1823.765
12.803	1887.226
13.002	1798.478
13.091	1849.277
13.235	1862.028
13.357	1862.080
13.423	1895.949
13.910	1904.615
14.198	2196.615
14.331	2298.194
14.608	2298.311
14.829	2002.297
15.184	2387.387
15.616	2408.721];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ImorAdit2020';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3KMHS'; % Cat of Life
metaData.links.id_ITIS = '169807'; % ITIS
metaData.links.id_EoL = '207344'; % Ency of Life
metaData.links.id_Wiki = 'Hemichromis_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Hemichromis_fasciatus'; % ADW
metaData.links.id_Taxo = '176295'; % Taxonomicon
metaData.links.id_WoRMS = '581701'; % WoRMS
metaData.links.id_fishbase = 'Hemichromis-fasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemichromis_fasciatus}}';
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ImorAdit2020'; type = 'Article'; bib = [ ...  
'doi = {10.3153/AR20010}, ' ...
'author = {Rachad Sidi Imorou and Alphonse Adite and Hamidou Arame and Pejanos Stanislas Sonon}, ' ...
'year  = {2020}, ' ...
'title = {Aspects of life history patterns of the cichlid fish \emph{Hemichromis fasciatus} {P}eters, 1857 from {O}kpara {S}tream, {N}orthern {B}enin, {W}est {A}frica}, ' ...  
'journal = {Aquat Res}, ' ...
'volume = {3(2)}, ' ...
'pages = {110-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hemichromis-fasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


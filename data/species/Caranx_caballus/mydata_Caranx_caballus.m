  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_caballus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_caballus'; 
metaData.species_en = 'Green jack'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 12];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 55;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 332;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01905*Lp^2.98, see F1';
data.Wwi = 2925;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01905*Li^2.98, see F1';

data.GSI = 0.035;   units.GSI = '-';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'GallEspi2007';
  temp.GSI = C2K(25.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
    1 15.86   101
    2 27.26   488
    3 35.37  1041
    4 41.14  1616
    5 45.25  2132];
data.tLW(:,1) = (0+ data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'std length', 'weight'};  
  temp.tLW = C2K(25.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'GallEspi2007'; treat.tLW = {1 {'std length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
13.270	78.603
13.723	78.603
13.853	91.703
14.241	65.502
14.565	111.354
14.888	65.502
15.212	91.703
15.601	111.354
15.665	85.153
16.118	72.052
16.119	111.354
16.701	91.703
16.896	144.105
17.090	117.904
17.477	65.502
17.544	163.755
18.060	98.253
18.061	137.555
18.385	163.755
18.449	124.454
18.773	131.004
18.966	78.603
19.033	196.507
19.421	163.755
19.484	104.803
19.486	196.507
19.939	189.956
20.068	150.655
20.070	242.358
20.522	216.157
20.715	163.755
20.846	196.507
21.297	117.904
21.299	196.507
21.299	235.808
21.365	255.459
22.013	294.760
22.075	163.755
22.143	347.162
22.595	268.559
22.722	183.406
22.723	222.707
22.789	268.559
22.854	294.760
23.112	268.559
23.308	334.061
23.695	262.009
23.699	445.415
23.760	301.310
23.895	524.017
23.956	353.712
24.020	347.162
24.472	268.559
24.668	373.362
24.731	281.659
24.734	412.664
24.996	550.218
25.055	307.860
25.123	451.965
25.250	340.611
25.378	281.659
25.506	222.707
25.575	412.664
25.962	360.262
25.963	412.664
25.965	484.716
26.160	537.118
26.416	393.013
26.479	320.961
26.676	438.865
26.677	504.367
26.869	379.913
27.000	451.965
27.130	465.066
27.196	543.668
27.324	478.166
27.520	550.218
27.775	373.362
27.907	504.367
27.975	628.821
28.101	510.917
28.229	438.865
28.426	543.668
28.620	563.319
29.074	609.170
29.137	497.817
29.138	563.319
29.140	661.572
29.327	327.511
29.394	419.214
29.462	589.520
29.529	668.122
29.911	386.463
29.915	556.769
29.917	648.472
30.049	759.825
30.108	524.017
30.306	700.873
30.435	661.572
30.561	530.568
30.627	569.869
30.629	648.472
30.954	733.624
31.019	753.275
31.341	674.672
31.666	746.725
31.730	687.773
31.734	890.830
31.991	812.227
32.248	700.873
32.314	759.825
32.575	838.428
32.767	753.275
32.962	779.476
33.024	661.572
33.159	917.031
33.544	766.376
33.615	1048.035
33.675	851.528
33.741	917.031
34.130	936.681
34.132	1002.183
34.189	681.223
34.191	766.376
34.324	903.930
34.646	858.079
34.648	943.231
35.102	989.083
35.488	864.629
35.556	1015.284
35.878	936.681
35.881	1087.336
36.012	1172.489
36.138	1015.284
36.202	989.083
36.206	1152.838
36.467	1270.742
36.786	1054.585
36.790	1205.240
36.852	1113.537
37.051	1316.594
37.117	1375.546
37.304	1028.384
37.369	1061.135
37.438	1270.742
37.823	1087.336
37.891	1264.192
38.018	1126.638
38.021	1296.943
38.084	1211.790
38.600	1126.638
38.603	1244.541
38.988	1087.336
39.116	1054.585
39.253	1388.646
39.443	1205.240
40.160	1441.048
40.358	1604.803
40.676	1316.594
40.744	1506.550
41.005	1578.603
41.390	1427.948
41.458	1591.703
41.844	1473.799
41.977	1637.555
42.045	1807.860
42.098	1251.092
42.620	1447.598
42.948	1631.004
43.081	1801.310
43.138	1434.498
43.269	1532.751
43.332	1467.249
43.337	1676.856
43.600	1860.262
43.787	1539.301
43.857	1755.459
44.308	1683.406
44.377	1879.913
44.637	1938.865
44.832	1991.266
44.891	1689.956
45.022	1781.659
45.027	2004.367
46.064	2076.419
46.383	1840.611];    
units.LW = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BrewBlab1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01905*(TL in cm)^2.98'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2MW'; % Cat of Life
metaData.links.id_ITIS = '168632'; % ITIS
metaData.links.id_EoL = '46577977'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_bucculentus'; % Wikipedia
metaData.links.id_ADW = 'Caranx_bucculentus'; % ADW
metaData.links.id_Taxo = '165424'; % Taxonomicon
metaData.links.id_WoRMS = '273270'; % WoRMS
metaData.links.id_fishbase = 'Caranx-bucculentus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_bucculentus}}';  
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
bibkey = 'GallEspi2007'; type = 'article'; bib = [ ... 
'author = {Gallardo-Cabello, M. and E. Espino-Barr and A. Garcia-Boa and E.G. Cabral-Solis and M. Puente-Gomez}, ' ...
'year = {2007}, ' ...
'title = {Study of the growth of the green jack \emph{Caranx caballus} {G}\"{u}nther 1868, in the coast of {C}olima, {M}exico}, ' ... 
'journal = {J. Fish. Aquat. Sci.}, ' ...
'volume = {2(2)}, '...
'pages = {131-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx-bucculentus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
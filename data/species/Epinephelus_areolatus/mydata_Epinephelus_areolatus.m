function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_areolatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_areolatus'; 
metaData.species_en = 'Areolate grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 05];

%% set data
% zero-variate data

data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(26.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 47;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 2.25e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.05, see F1, gives 791 g';

data.Ri  = 93607/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(26.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1 17.0
    2 24.0
    3 30.0
    4 35.7
    5 39.7
    6 43.4
    7 46.6
    8 49.7];
data.tL(:,1) = (0.1+data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.17; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AllaGana2015';
  
% length-weight
data.LW_f = [ ... % totla length (cm), weight (g)
11.567	15.009
12.659	28.750
13.532	15.252
14.478	35.777
15.714	63.141
16.806	56.474
17.169	76.927
17.751	70.196
18.406	70.277
19.134	97.578
19.425	118.022
19.861	90.865
20.007	104.488
20.370	145.350
20.807	84.179
20.952	138.619
21.462	131.879
21.680	152.314
21.898	97.919
22.335	193.212
22.480	132.005
23.280	111.696
23.280	172.921
23.935	247.832
24.081	186.625
24.444	139.051
24.808	213.926
24.881	139.105
25.608	193.617
25.681	254.850
26.190	343.349
26.336	227.720
26.481	166.514
26.700	288.990
26.918	227.792
27.209	316.264
27.573	227.873
28.009	309.560
28.082	261.950
28.591	316.435
28.737	234.820
29.101	370.919
29.246	296.107
29.828	316.588
30.046	384.642
30.265	466.301
30.265	330.247
30.701	418.736
31.210	343.969
31.356	330.382
31.429	425.629
31.574	534.491
31.938	391.678
32.011	466.517
32.665	425.782
32.738	527.832
33.029	385.011
33.102	473.455
33.102	589.101
33.538	527.931
34.484	562.061
34.484	514.442
34.557	623.295
34.557	453.227
35.575	582.605
35.866	637.062
36.012	732.319
36.594	691.574
37.176	644.027
37.321	848.126
37.394	793.714
38.194	787.010
38.267	698.584
39.140	861.957
41.978	916.730
42.123	1114.027
42.778	1012.067
42.923	1066.507
43.651	1141.426
44.160	1202.714
44.160	1080.265
48.089	1475.309
49.980	1849.692
50.344	1951.778];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'AllaGana2015';
%
data.LW_m = [ ... % totla length (cm), weight (g)
18.699	97.315
20.159	126.792
21.328	132.873
21.401	179.555
22.131	156.377
23.519	156.671
23.592	185.853
23.958	215.097
24.104	174.295
24.396	215.190
24.761	244.435
25.053	186.163
25.272	232.876
25.784	221.318
26.076	250.547
26.368	256.442
26.879	250.717
26.879	297.384
27.317	262.477
27.390	303.326
28.413	309.376
28.778	321.120
28.924	274.484
29.436	367.926
29.728	391.321
30.020	356.383
30.020	414.717
30.385	385.628
30.531	432.325
31.554	356.709
31.554	485.042
31.627	409.224
32.942	543.670
32.942	473.670
32.942	427.003
33.818	561.356
36.740	841.976
38.274	801.468
41.268	1064.603
45.797	1293.063
46.746	1444.932
48.645	1626.168];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'AllaGana2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01175*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 1.17 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6G5M7'; % Cat of Life
metaData.links.id_ITIS = '167737'; % ITIS
metaData.links.id_EoL = '46579625'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_areolatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_areolatus'; % ADW
metaData.links.id_Taxo = '105906'; % Taxonomicon
metaData.links.id_WoRMS = '218204'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-areolatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_areolatus}}';
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
bibkey = 'AllaGana2015'; type = 'Article'; bib = [ ... 
'doi = {10.11648/j.ajls.s.2015030601.12}, ' ...
'author = {Ezzat Abd-Allah and Azza El-Ganainy and Alaa Osman}, ' ... 
'year = {2015}, ' ...
'title = {Age and Growth of the Areolate Grouper \emph{Epinephelus areolatus} from the {G}ulf of {S}uez}, ' ...
'journal = {American Journal of Life Sciences}, ' ...
'volume = {3(6-1)}, ' ...
'pages = {7-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-areolatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


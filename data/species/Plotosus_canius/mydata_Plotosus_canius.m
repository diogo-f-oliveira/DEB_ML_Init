  function [data, auxData, metaData, txtData, weights] = mydata_Plotosus_canius
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Plotosidae';
metaData.species    = 'Plotosus_canius'; 
metaData.species_en = 'Gray eel-catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 20];

%% set data
% zero-variate data
data.ab = 45; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 55;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 111;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.3112;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'UsmaAmin2013';
  comment.Wwb = 'based on egg diameter of 5.94 mm: pi/6*0.5943';
data.Wwp = 1660;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00617*Lp^3.12, see F1';
data.Wwi = 14.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.12, see F1';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
218.260	18.917
247.865	20.049
279.963	24.035
309.212	24.728
340.220	25.204
365+2.345	24.798
365+36.547	27.690
365+60.521	29.473
365+94.000	30.391
365+126.442	33.500
365+310.098	44.027
730+36.363	45.672
730+94.871	48.155
730+126.594	49.728
730+157.248	49.984
730+188.259	50.679
730+218.585	53.567
730+280.247	54.299
730+310.555	55.212
1095+2.303	57.912
1095+36.835	58.392];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RabbHaqu2022';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
40.524	518.503
40.528	654.585
41.036	596.800
41.594	670.970
42.150	712.150
43.121	658.441
43.635	823.337
43.677	662.508
44.610	905.710
44.699	806.732
44.740	621.161
45.156	592.252
45.250	637.603
45.486	802.527
45.813	889.091
45.861	946.819
45.932	196.296
46.228	823.069
47.960	1486.808
48.672	484.673
49.185	641.321
49.652	764.984
51.938	1370.934
52.167	1280.189
52.948	1090.418
53.548	1012.005
55.283	166.466
56.412	801.401
60.176	1283.487];
units.LN = {'cm','#'};  label.LN = {'total length','fecundity'};  
temp.LN = C2K(28.1);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'UsmaAmin2013';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
18.945	47.508
21.421	89.196
22.713	110.036
22.820	40.261
24.004	116.923
24.220	61.094
24.973	137.785
25.834	137.725
27.018	102.759
27.234	172.511
29.494	179.330
31.324	193.156
33.046	262.803
34.338	262.713
34.876	220.815
36.060	227.709
37.029	255.549
38.321	297.319
40.151	332.075
43.057	541.175
43.057	415.593
43.272	624.881
44.026	534.131
44.672	673.620
44.779	450.357
44.887	338.722
45.318	813.110
45.425	750.312
45.963	513.065
45.963	527.019
46.394	659.547
46.609	743.253
46.717	861.850
46.932	561.835
47.255	666.463
47.470	764.123
48.009	882.690
48.547	729.164
48.654	471.017
49.300	896.553
49.300	554.693
49.408	819.801
49.408	715.150
49.623	443.042
50.484	840.657
50.592	694.138
50.592	603.440
51.130	959.216
51.130	875.495
51.776	763.822
52.099	917.288
52.745	854.453
53.606	728.811
53.929	679.951
54.252	784.580
54.252	575.277
55.221	944.977
55.759	777.498
56.082	882.127
56.620	1070.461
56.835	1851.841
57.374	979.711
57.696	916.898
58.235	1035.465
58.450	1098.240
58.558	937.768
58.881	1377.280
59.203	1447.025
59.742	1509.778
59.742	1091.174
59.849	979.538
59.957	1195.810
60.926	1335.277
61.033	1202.711
61.679	1209.643
61.679	1028.248
62.002	1111.946
62.756	1286.312
63.186	1390.933
63.294	1188.600
63.402	1132.779
64.586	1021.068
65.770	1523.311
66.200	1411.653
68.138	1634.774
68.138	1188.262
68.138	1034.774
68.461	1620.798
68.568	1844.046
70.183	1676.492
70.183	1432.306
71.259	1236.882
72.336	1990.295
73.628	1515.786
73.843	1662.283
74.058	1473.896
79.225	1822.372
79.656	2003.738];
units.LW = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'RabbHaqu2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;
weights.Li = weights.Li * 3;
weights.Lp = weights.Lp * 3;
weights.LN = weights.LN * 5;

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
D2 = 'Wwp and Wwi ignored due to inconsistency with LW data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00617*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'venomous; the only catfish in coral reefs'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6VRN5'; % Cat of Life
metaData.links.id_ITIS = '164234'; % ITIS
metaData.links.id_EoL = '46581862'; % Ency of Life
metaData.links.id_Wiki = 'Plotosus_canius'; % Wikipedia
metaData.links.id_ADW = 'Plotosus_canius'; % ADW
metaData.links.id_Taxo = '44102'; % Taxonomicon
metaData.links.id_WoRMS = '278694'; % WoRMS
metaData.links.id_fishbase = 'Plotosus-canius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Plotosus_canius}}';  
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
bibkey = 'RabbHaqu2022'; type = 'Article'; bib = [ ...
'author = {Rabby, A.F. and M.A. Haque and M.A. Islam and S.J. Hasan and M.A. Rahman and Y. Mahmud}, ' ...
'year = {2022}, ' ...
'title = {Population dynamics of gray eel catfish (\emph{Plotosus canius} {H}amilton, 1822) at mangrove estuary in {B}angladesh}, ' ... 
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {21(1)}, '...
'pages = {247-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UsmaAmin2013'; type = 'Article'; bib = [ ...
'doi = {10.3923/ajava.2013.348.354}, ' ...
'author = {Binta Isyaku Usman and S. M. Nurul Amin and Aziz Bin Arshad and M. Aminur Rah}, ' ...
'year = {2013}, ' ...
'title = {Fecundity and Egg Size of Grey-Eel Catfish \emph{Plotosus canius} ({H}amilton, 1822) from the Coastal Waters of {K}ampong {T}elok, {N}egeri {S}embilan {P}eninsular {M}alaysia}, ' ... 
'journal = {Asian Journal of Animal and Veterinary Advances}, ' ...
'volume = {8(2)}, '...
'pages = {348-354}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Plotosus-canius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


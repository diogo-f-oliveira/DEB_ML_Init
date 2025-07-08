function [data, auxData, metaData, txtData, weights] = mydata_Kurixalus_eiffingeri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Rhacophoridae';
metaData.species    = 'Kurixalus_eiffingeri'; 
metaData.species_en = 'Eiffinger''s Asian tree frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCvae', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 02]; 

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 90; units.tp = 'd';    label.tp = 'time since metam at puberty';       bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                      bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Li  = 3.7;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                  bibkey.Li  = 'EoL';
  comment.Li = '36 to 40 mm';
data.Lim  = 3.4;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';               bibkey.Lim  = 'EoL';
  comment.Lim = '31 to 35 mm';

data.Wwb = 0.022; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'LianHuan2002';
data.Wwj = 0.3;   units.Wwj = 'g'; label.Wwj = 'wet weight at metam';            bibkey.Wwj = 'LianHuan2002';
data.Wwi = 1.94;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = {'EoL','guess'};
  comment.Wwi = 'based on Li and L-Ww relationship of Hyla arborea: (3.7/5)^3*4.8';
data.Wwim = 1.5;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';          bibkey.Wwim = {'EoL','guess'};
  comment.Wwim = 'based on Li and L-Ww relationship of Hyla arborea: (3.4/5)^3*4.8';

data.Ri  = 600/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL'; bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess includes trophic eggs';
 
% uni-variate data
% time-weight
data.tW2 = [ ... % time since hatch (d), weight (g)
0.5584	0.0218
1.2655	0.0218
2.1542	0.0255
4.2779	0.0274
5.6970	0.0311
7.4622	0.0293
10.4705	0.0317
12.2407	0.0336
14.0116	0.0361
14.7220	0.0386
16.1436	0.0442
17.0282	0.0448
18.4457	0.0473
19.8656	0.0516
22.1669	0.0541
24.4731	0.0603
25.8922	0.0641
28.3760	0.0709
29.7943	0.0740
31.2084	0.0740
35.8225	0.0877
36.8889	0.0920
38.3220	0.1064
40.0913	0.1076
41.8755	0.1201
43.4920	0.1394
45.9758	0.1462
48.2796	0.1506
49.6871	0.1456
52.1726	0.1537
53.5925	0.1580
55.7277	0.1686
58.2025	0.1686
59.8173	0.1866
61.9534	0.1979
63.2081	0.2109
65.8596	0.2109
67.8115	0.2165
70.1202	0.2246
72.0737	0.2315
73.6861	0.2476
76.0006	0.2601
77.9623	0.2732
80.0852	0.2744
81.6976	0.2906
84.0046	0.2974
85.9614	0.3068
87.7357	0.3118
89.8536	0.3093]; 
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'weight', 'fed each 2 d'};  
temp.tW2    = C2K(17);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'LianHuan2002';
comment.tW2 = 'tapoles were fed each 2 d';
% time-weight
data.tW4 = [ ... % time since hatch (d), weight (g)
1.4422	0.0218
3.2148	0.0255
4.4522	0.0255
6.4008	0.0286
8.5187	0.0261
9.5908	0.0348
11.7071	0.0311
14.1901	0.0373
15.9594	0.0386
18.2722	0.0498
20.5669	0.0473
21.8042	0.0473
23.9370	0.0560
26.0698	0.0647
28.3702	0.0665
29.7885	0.0696
32.0889	0.0715
34.0457	0.0808
36.1752	0.0871
38.1386	0.1014
39.9063	0.1014
42.2224	0.1151
43.9909	0.1157
45.7817	0.1331
47.8996	0.1306
50.3901	0.1425
51.8058	0.1437
53.7635	0.1537
56.0590	0.1518
58.1909	0.1599
59.9677	0.1667
62.1384	0.2041
63.9119	0.2084
66.0512	0.2221
68.1724	0.2221
69.7906	0.2427
72.4396	0.2408
73.8893	0.2676
76.1905	0.2701
77.9789	0.2856
80.1116	0.2943
81.7389	0.3218
83.6767	0.3168
85.9755	0.3174
88.0926	0.3142
90.2385	0.3329
91.8080	0.3167
94.3116	0.3385]; 
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'weight', 'fed each 4 d'};  
temp.tW4    = C2K(17);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'LianHuan2002';
comment.tW4 = 'tapoles were fed each 4 d';
% time-weight
data.tW8 = [ ... % time since hatch (d), weight (g)
1.0879	0.0212
2.5045	0.0230
4.4514	0.0249
6.3950	0.0243
8.1627	0.0243
9.5793	0.0261
11.5270	0.0286
14.0034	0.0298
16.2997	0.0286
17.7254	0.0373
20.3744	0.0354
21.9670	0.0367
24.0849	0.0342
26.0417	0.0435
27.9886	0.0454
29.9297	0.0429
32.4053	0.0435
33.6575	0.0547
35.7804	0.0559
37.7223	0.0540
40.3763	0.0559
42.1663	0.0727
43.7704	0.0827
46.0675	0.0820
48.1805	0.0758
50.1365	0.0845
51.9165	0.0938
54.0344	0.0913
55.9838	0.0951
57.7771	0.1144
59.9032	0.1181
61.8179	0.0957
61.8179	0.0957
63.9722	0.1206
65.9703	0.1611
67.9114	0.1586
70.0277	0.1548
71.9754	0.1573
73.7935	0.1953
75.9180	0.1978
78.0375	0.1965
80.3322	0.1940
81.9487	0.2133
83.8939	0.2140
86.1869	0.2102
87.7803	0.2121
90.1361	0.2557
91.8963	0.2501
94.0109	0.2451
95.7736	0.2413
98.0898	0.2550
100.0293	0.2513]; 
units.tW8   = {'d', 'g'};  label.tW8 = {'time since birth', 'weight', 'fed each 8 d'};  
temp.tW8    = C2K(17);  units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
bibkey.tW8  = 'LianHuan2002';
comment.tW8 = 'tapoles were fed each 8 d';
% time-weight
data.tW14 = [ ... % time since hatch (d), weight (g)
0.5576	0.0212
2.1534	0.0249
3.7427	0.0237
5.6887	0.0249
7.2796	0.0249
9.2249	0.0255
9.9344	0.0274
11.5237	0.0261
13.4698	0.0274
15.7669	0.0267
17.8881	0.0267
20.3612	0.0255
21.9538	0.0267
24.4244	0.0236
26.3713	0.0254
27.7846	0.0248
30.0867	0.0279
32.2112	0.0304
33.9772	0.0291
36.0984	0.0291
38.2196	0.0291
39.8105	0.0291
42.2852	0.0291
43.8885	0.0384
46.0089	0.0378
48.1276	0.0359
49.8911	0.0328
52.1899	0.0334
54.6655	0.0340
56.6116	0.0353
58.0414	0.0471
60.1643	0.0483
62.2838	0.0471
64.2291	0.0477
66.5287	0.0489
68.1146	0.0452
70.2375	0.0464
72.3835	0.0651
73.9801	0.0695
76.2789	0.0701
78.3968	0.0676
79.9877	0.0676
82.1097	0.0682
84.2318	0.0688
85.8665	0.1018
88.5229	0.1055
89.9337	0.1030
92.2317	0.1030
94.1778	0.1043
96.2982	0.1036
98.0667	0.1042
100.0557	0.1379
102.1794	0.1397
104.1255	0.1410
105.5545	0.1522
108.1911	0.1410
110.1347	0.1403
111.7206	0.1366
113.5635	0.1933
115.8664	0.1970
118.3486	0.2026
119.7569	0.1982
122.2217	0.1907
123.9886	0.1901
125.9289	0.1870
128.0096	0.2898
130.3117	0.2929
132.0728	0.2879
133.6711	0.2935
135.9699	0.2941
138.0820	0.2872]; 
units.tW14   = {'d', 'g'};  label.tW14 = {'time since birth', 'weight', 'fed each 14 d'};  
temp.tW14    = C2K(17);  units.temp.tW14 = 'K'; label.temp.tW14 = 'temperature';
bibkey.tW14  = 'LianHuan2002';
comment.tW14 = 'tapoles were fed each 14 d';
% time-weight
data.tW20 = [ ... % time since hatch (d), weight (g)
0.5543	0.0187
1.9750	0.0237
3.2124	0.0237
4.9792	0.0230
6.3933	0.0230
8.3378	0.0230
10.2797	0.0211
11.8706	0.0211
14.1686	0.0211
16.1130	0.0211
18.0542	0.0186
20.1754	0.0186
22.2999	0.0211
24.4227	0.0223
26.5439	0.0223
27.9564	0.0211
29.7216	0.0192
32.1963	0.0192
33.9656	0.0204
36.0868	0.0204
37.8545	0.0204
39.7989	0.0204
41.7500	0.0254
44.2288	0.0285
46.1724	0.0278
48.1144	0.0260
49.7020	0.0235
52.1751	0.0222
54.4747	0.0234
56.0639	0.0222
58.0084	0.0222
60.1287	0.0215
62.2599	0.0290
64.3811	0.0290
66.1462	0.0271
68.0923	0.0284
70.3903	0.0283
72.1563	0.0271
74.0999	0.0265
76.0460	0.0277
78.1680	0.0283
80.2892	0.0283
82.0676	0.0364
84.1913	0.0383
86.3158	0.0407
88.4370	0.0407
90.0246	0.0382
92.1408	0.0345
94.2653	0.0370
96.0314	0.0357
98.3268	0.0338
100.2738	0.0357
102.5883	0.0481
104.0057	0.0506
106.3037	0.0506
108.2448	0.0481
110.1867	0.0462
112.1328	0.0475
113.8972	0.0450
116.3744	0.0468
118.1388	0.0443
119.9072	0.0449
121.6947	0.0599
123.9952	0.0618
125.7612	0.0605
127.3546	0.0624
130.0069	0.0630
131.9505	0.0623
133.8949	0.0623
136.1962	0.0648
137.7846	0.0629
140.0826	0.0629]; 
units.tW20   = {'d', 'g'};  label.tW20 = {'time since birth', 'weight', 'fed each 20 d'};  
temp.tW20    = C2K(17);  units.temp.tW20 = 'K'; label.temp.tW20 = 'temperature';
bibkey.tW20  = 'LianHuan2002';
comment.tW20 = 'tapoles were fed each 20 d';

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

%% Group plots
set1 = {'tW2','tW4','tW8','tW14','tW20'}; subtitle1 = {'Tadpoles fed each 2, 4, 8, 14, 20 d'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'the 14 d feeding regime obviously required adaptation';
metaData.discussion = struct('D1',D1,'D2',D2);  

%% Facts
F1 = 'Tadpoles are oophagous, and female frogs lay trophic eggs to feed their young in tree holes or bamboo stumps';
metaData.bibkey.F1 = {'Wiki','EoL'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RG4H'; % Cat of Life
metaData.links.id_ITIS = '665497'; % ITIS
metaData.links.id_EoL = '1020154'; % Ency of Life
metaData.links.id_Wiki = 'Kurixalus_eiffingeri'; % Wikipedia
metaData.links.id_ADW = 'Kurixalus_eiffingeri'; % ADW
metaData.links.id_Taxo = '844079'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Kurixalus+eiffingeri'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kurixalus_eiffingeri}}';
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
bibkey = 'LianHuan2002'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0952836902000249}, ' ...
'author = {M.-F. Liang and C.-H. Huang and Y.-C. Kam}, ' ... 
'year = {2002}, ' ...
'title = {Effects of intermittent feeding on the growth of oophagous (\emph{Chirixalus eiffingeri}) and herbivorous (\emph{Chirixalus idiootocus}) tadpoles from {T}aiwan}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {256}, ' ...
'pages = {207-213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1020154/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Taractichthys_steindachneri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Bramidae';
metaData.species    = 'Taractichthys_steindachneri'; 
metaData.species_en = 'Sickle pomfret'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.2 ); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 22];

%% set data
% zero-variate data

data.am = 8*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(15.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 67.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'KindWu2020'; 
data.Li  = 92;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'KindWu2020';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Robe2014';
  comment.Wwb = 'based on guessed egg diameter of 0.8 mm of Eumegistus illustris: pi/6*0.08^3';
data.Wwi = 17e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'KindWu2020';
  comment.Wwi = 'fishbase: based on 0.01820*Li^2.96, see F1, gives 3.3 kg; max published weight 11 kg';

data.Ri  = 3e4*17/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'Robe2014';   
  temp.Ri = C2K(15.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of Eumegistus illustris: 3e4/kg';
 
% uni-variate data

% time-time
data.tL = [ ... % time since birth (d), fork length (cm)
90.595	41.975
151.479	46.559
181.391	49.549
210.241	53.935
365+0.295	66.028
365+30.193	65.995
365+90.706	67.091
365+120.250	67.291
365+151.587	70.745
365+181.841	70.711
365+209.974	73.936
730+60.505	78.985
730+120.673	82.407
1095+152.028	89.814];
data.tL(:,1) = 390 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KindWu2020';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
37.632	1995.209
38.436	1994.958
38.971	1932.072
39.372	1963.305
39.908	1963.137
40.578	2057.003
41.113	1994.118
42.050	1993.824
42.594	3122.573
43.263	3028.287
43.665	3122.238
44.468	3153.344
45.397	1961.416
45.673	3090.249
46.476	3058.639
47.141	2493.971
47.144	2964.352
47.271	1992.187
47.814	2995.501
48.207	1897.817
48.346	2493.593
48.357	4030.174
49.159	3904.488
49.167	4970.687
49.963	3998.312
50.097	3998.270
50.633	4029.461
50.759	2994.578
51.562	2931.608
51.704	4029.125
51.838	4091.800
52.514	4969.638
52.775	4028.789
53.168	2962.463
53.317	4969.386
53.712	4028.495
53.719	4969.260
54.247	3996.969
54.507	2962.044
54.656	4968.966
54.783	3996.801
55.311	3024.509
55.318	3965.274
55.325	4968.756
55.846	3024.341
55.853	3965.106
56.128	4968.504
56.381	2992.815
56.664	4968.336
56.790	3964.812
56.917	2961.288
56.939	5971.734
57.319	2992.521
57.728	3995.877
57.869	4936.600
58.010	6002.758
58.129	3995.751
58.256	3054.944
58.400	4466.049
58.539	5030.466
59.199	3901.339
59.208	4998.898
59.349	5970.978
59.884	5970.810
60.018	5970.768
60.412	4998.520
60.419	5939.284
60.427	6974.124
60.948	5061.069
61.097	7036.633
61.618	5060.859
61.624	5938.906
62.153	5060.692
62.829	5969.887
63.105	7067.362
63.358	5060.314
63.767	6063.670
64.176	7067.026
64.302	6000.785
64.450	7944.989
65.262	9042.295
65.507	6000.407
65.634	5059.600
65.649	7066.564
65.789	7975.928
66.198	8947.925
66.459	8038.435
66.585	7003.552
66.868	9041.791
67.114	6031.262
67.671	9041.539
67.924	7003.132
68.081	10076.254
68.087	10891.584
68.199	8037.889
68.586	6030.800
68.594	7065.641
68.854	6030.716
68.877	9072.520
69.158	10891.248
69.419	9981.759
69.672	7974.710
70.341	7974.500
70.349	9040.700
70.356	10044.182
70.601	7002.293
70.869	7033.569
70.877	8005.691
71.546	8068.200
71.568	10984.569
71.821	9008.879
72.230	9980.877
72.744	7064.340
72.751	8005.103
73.033	9949.266
73.041	10984.107
73.554	8004.851
73.681	7032.687
73.703	9980.415
74.097	9039.525
74.120	12049.971
74.372	10011.564
74.759	8004.474
75.048	10889.401
75.569	8944.987
75.845	10042.461
75.956	6937.896
75.963	7972.737
76.246	10010.976
76.767	8003.844
77.042	9038.601
77.049	10010.724
77.570	8034.951
78.105	7972.066
78.403	11954.551
78.515	9038.139
79.452	9037.845
79.578	8034.321
80.121	9006.277
80.143	11985.364
80.403	10950.439
80.663	9946.874
81.199	9978.064
81.623	12957.026
82.285	12016.051
82.546	11012.485
82.954	11984.483
83.215	11043.634
84.152	11011.981
84.293	11952.704
84.301	13050.262
85.506	13018.526
85.513	13959.290
86.324	15056.597
86.442	12955.515
86.450	13958.996
87.123	14523.245
87.372	11951.739
88.458	13989.725
89.537	15055.589
90.477	15525.678
91.024	17030.733
92.087	15932.839];
units.LW   = {'cm', 'g'};  label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'KindWu2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 10 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01820*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54TTB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577929'; % Ency of Life
metaData.links.id_Wiki = 'Taractichthys_steindachneri'; % Wikipedia
metaData.links.id_ADW = 'Taractichthys_steindachneri'; % ADW
metaData.links.id_Taxo = '188815'; % Taxonomicon
metaData.links.id_WoRMS = '221420'; % WoRMS
metaData.links.id_fishbase = 'Taractichthys-steindachneri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taractichthys_steindachneri}}';
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
bibkey = 'KindWu2020'; type = 'Article'; bib = [ ... 
'author = {Richard Kindong and Feng Wu and Siquan Tian and Jiangfeng Zhu and Xiaojie Dai and Jiaqi Wang and Libin Dai}, ' ... 
'year = {2020}, ' ...
'title = {Biological parameters estimate for the sickle pomfret (\emph{Taractichthys steindachneri}) in the west-central and eastern {P}acific {O}cean}, ' ...
'journal = {Indian Journal of Geo Marine Sciences}, ' ...
'volume = {49(3)}, ' ...
'pages = {373-381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe2014'; type = 'phdthesis'; bib = [ ... 
'author = {Chase R. R. Roberts}, ' ... 
'year = {2014}, ' ...
'title = {Estimating the fecundity of monchong, \emph{Eumegistus illustris}, at Cross Seamont}, ' ...
'school = {University of Hawaii}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Taractichthys-steindachneri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Arctocephalus_pusillus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Arctocephalus_pusillus'; 
metaData.species_en = 'Brown fur seal'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS', 'MASE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-L'; 't-JX'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 06]; 

%% set data
% zero-variate data

data.tg = 368;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 354;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1276;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1643;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 32.1*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 5000; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ArnoHind2002';
data.Wwi = 55e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 36 to 110 kg';
data.Wwim = 230e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 190 to 280 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data 
data.tW_f = [ ... % time since birth (d), weight (kg)
13.840	3.350
13.840	6.118
13.840	6.580
13.840	7.107
13.840	8.030
14.259	4.140
14.259	4.931
14.259	5.459
15.098	2.887
72.136	6.466
72.975	7.915
73.394	7.058
73.394	8.903
73.394	10.485
74.653	11.803
74.653	12.989
77.169	10.350
77.169	12.328
77.588	6.988
78.427	11.272
78.847	7.712
78.847	8.635
84.718	6.258
84.718	5.467
127.497	13.077
127.497	14.000
127.497	15.582
127.916	5.365
128.336	9.847
128.336	10.440
128.336	11.495
136.723	13.927
140.498	17.944
140.917	13.725
140.917	10.496
140.917	8.848
142.595	12.538
143.014	9.769
220.183	12.276
221.022	16.164
221.442	20.448
221.442	23.216
221.861	20.052
222.280	20.975
223.539	21.962
224.797	19.720
224.797	23.807
225.216	18.797
231.088	11.146
231.507	19.715
231.507	23.010
236.540	17.272
237.379	19.512];
units.tW_f   = {'d', 'kg'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ArnoHind2002';
comment.tW_f = 'Data for females A. pusillus doriferus from Kanowna Island 1979';
%
data.tW_m = [ ... % time since birth (d), weight (kg)
13.840	10.600
14.259	7.634
14.259	8.491
14.259	9.018
14.259	9.545
14.259	10.007
15.098	5.919
72.136	7.059
73.814	12.792
73.814	14.176
74.233	16.087
75.072	15.230
77.588	9.559
78.427	6.922
79.266	13.710
79.266	14.765
80.944	15.225
81.363	16.279
85.557	14.166
85.976	13.309
85.976	16.275
86.396	9.156
87.235	12.649
125.819	9.453
127.916	16.702
127.916	18.416
129.594	19.074
129.594	23.226
134.207	9.974
134.626	21.706
135.046	15.246
135.046	14.653
135.465	13.071
137.562	11.619
138.401	18.869
139.659	19.988
139.659	20.713
140.079	15.506
141.337	16.362
141.337	19.394
142.176	21.766
144.273	12.141
144.273	14.316
221.442	25.194
222.280	17.415
222.700	14.910
224.377	28.883
224.797	28.091
226.055	27.431
232.765	25.910
233.185	18.000
233.185	25.052
233.604	23.931
234.862	30.654
235.701	21.689
238.218	22.741
238.637	24.257
239.895	25.113
240.315	20.301
240.734	17.334
241.573	26.561];
units.tW_m   = {'d', 'kg'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(38.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ArnoHind2002';
comment.tW_m = 'Data for males A. pusillus doriferus from Kanowna Island 1979';

% time-milk energy
data.tJX = [ ... % time since birth (d), milk energy intake (MJ/d)
11.563	4.385
13.318	6.934
13.340	5.234
13.346	4.738
13.365	3.250
76.380	3.421
78.056	12.205
78.554	8.166
79.915	6.607
80.773	9.369
82.173	4.763
136.132	14.080
136.163	11.671
136.617	11.104
137.487	12.945
138.774	17.195
139.299	11.102
139.696	14.998
139.738	11.668
140.174	12.518
229.221	4.028
230.458	12.175
230.483	10.262
230.854	16.142
230.897	12.812
232.552	23.226
232.658	14.866
232.702	11.465];
units.tJX   = {'d', 'MJ/d'};  label.tJX = {'time since birth', 'milk energy intake', 'female'};  
temp.tJX    = C2K(38.1);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
bibkey.tJX = 'ArnoHind2002';
comment.tJX = 'Data for female and male pups A. pusillus doriferus combined from Kanowna Island 1979';

% time-length
data.tL_m = [ ... %]; time since birth (yr), standard body length (cm)
0.167	95.774
0.291	93.570
0.342	117.883
0.514	110.157
0.517	107.579
0.518	106.106
0.789	116.434
0.841	106.861
0.845	103.914
0.888	101.707
1.473	120.523
1.506	126.418
1.525	110.582
1.536	135.260
1.714	122.010
1.761	116.488
1.798	119.436
2.144	134.557
2.181	137.137
2.230	163.291
2.273	128.302
2.276	125.356
2.402	121.680
2.405	119.470
2.408	150.409
2.743	141.220
2.828	137.909
3.048	157.074
3.210	157.083
3.212	154.874
3.523	165.941
3.898	156.753
4.038	142.028
4.399	144.626
4.706	158.639
4.708	156.798
4.911	189.222
4.988	159.760
5.182	166.769
5.422	202.510
5.458	172.309
5.466	165.680
5.483	151.684
5.550	163.474
5.801	190.376
7.148	214.760
7.372	196.356
7.512	214.780
7.689	202.266
8.833	193.490
8.851	212.644
9.013	212.653
9.021	205.655
9.389	202.360
9.503	208.996
11.246	206.883
12.818	212.863
12.946	207.713
13.391	208.106
13.821	220.653
14.908	225.133
15.690	215.231
16.871	209.404];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard body length', 'male'};  
temp.tL_m    = C2K(38.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewPrva2009';
comment.tL_m = 'Data for male pups A. pusillus doriferus from Kanowna Island 1979)';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;
weights.tL_m = 10 * weights.tL_m;
weights.Wwi = 2 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Male {p_Am} jumps upward at puberty, as discussed in Kooy2014 under type A acceleration';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '67RQR'; % Cat of Life
metaData.links.id_ITIS = '180629'; % ITIS
metaData.links.id_EoL = '46559194'; % Ency of Life
metaData.links.id_Wiki = 'Arctocephalus_pusillus'; % Wikipedia
metaData.links.id_ADW = 'Arctocephalus_pusillus'; % ADW
metaData.links.id_Taxo = '67392'; % Taxonomicon
metaData.links.id_WoRMS = '231410'; % WoRMS
metaData.links.id_MSW3 = '14001003'; % MSW3
metaData.links.id_AnAge = 'Arctocephalus_pusillus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctocephalus_pusillus}}';
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
bibkey = 'ArnoHind2002'; type = 'Article'; bib = [ ... 
'author = {J. P. Y. Arnould and M. A. Hindell}, ' ... 
'year = {2002}, ' ...
'title = {Milk consumption, body composition and pre-weaning growth rates of {A}ustralian fur seal (\emph{Arctocephalus pusillus doriferus}) pups}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {256}, ' ...
'pages = {351-359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StewPrva2009'; type = 'Article'; bib = [ ... 
'author = {C. L. Stewardson and T. Prvan and M. A. Meyer and R. J. Ritchie}, ' ... 
'year = {2009}, ' ...
'title = {Age Determination and Growth in the Male {S}outh {A}frican Fur Seal \emph{Arctocephalus pusillus pusillus} ({P}innipedia: {O}tariidae) Using External Body Measurements}, ' ...
'journal = {Proc. Linn. Soc. N.S.W.}, ' ...
'volume = {130}, ' ...
'pages = {119-244}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Arctocephalus_forsteri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328621/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



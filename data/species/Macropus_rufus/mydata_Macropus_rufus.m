function [data, auxData, metaData, txtData, weights] = mydata_Macropus_rufus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_rufus'; 
metaData.species_en = 'Red kangaroo'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'Ww-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2012 11 12];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data

data.tg = 33;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = {'SharCala1964','AnAge'};   
  temp.tg = C2K(36.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from CorkDove1989';
data.tx = 235;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'SharCala1964';   
  temp.tx = C2K(36.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '230-250 d';
data.tp = 483;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'SharCala1964';
  temp.tp = C2K(36.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '517 females, 806 males';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Robe1986';   
  temp.am = C2K(36.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.89;   units.Lb  = 'cm';  label.Lb  = 'head length at birth';   bibkey.Lb  = 'SharFrit1964';
data.Lx  = 13.3;   units.Lx  = 'cm';  label.Lx  = 'head length at weaning'; bibkey.Lx  = 'SharFrit1964';
data.Lp  = 16.5;   units.Lp  = 'cm';  label.Lp  = 'head length st puberty'; bibkey.Lp  = 'SharFrit1964';
data.Li  = 20.0;   units.Li  = 'cm';  label.Li  = 'ultimate head length';   bibkey.Li  = 'SharFrit1964';

data.Wwb = 0.817;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'FritShar1964','SharFirt1964'};
data.Wwx = 4500;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'MunnDaws2003';
  comment.Wwx = 'ppe at 4-5kg, SharCala1964 cited in MunnDaws2003';
data.Wwp = 14000;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'PoolCarp1982';
data.Wwi = 35000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MunnDaws2003';
  comment.Wwi = 'estimated by Adam Munn  & compared with ultimate weights of grey kangaroosestimated from mass-length curve (Murphy and Smith 1970) using length data (above)'; 

data.Ri  = 3/2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'MunnDaws2003','AnAge'};   
  temp.Ri = C2K(36.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 young per 2.5 years ';
  
data.pL  = 0.1 * 2.08e7*data.Wwi/1000 * data.Ri; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.3);  units.temp.pL = 'K'; label.temp.pL = 'temperature';

% uni-variate data
%Sharman Firth and Calaby 1964
data.tL = [ ... % d, time since birth; cm, head length 
1.1586	0.89846
1.1786	0.95429
3.0683	0.97562
6.2485	1.09677
8.5138	1.29101
9.5512	1.26811
10.261	1.20631
11.3399	1.59104
12.6309	1.40049
13.9538	1.29926
14.7617	1.51103
17.8113	1.55966
19.1418	1.77115
20.925	1.78695
21.3492	1.80347
21.7473	1.74742
23.7515	1.7966
24.9475	1.9244
25.8138	2.0077
26.7086	1.87877
28.5358	2.01741
28.5598	2.08441
30.031	2.39635
30.2685	2.18401
31.3699	2.33978
32.0777	2.27239
32.9901	2.48411
33.7783	2.34966
35.0128	2.29316
35.7101	2.48824
36.6909	2.5994
36.7314	2.42068
36.757	2.78365
37.8209	2.54295
38.0275	2.82764
38.221	2.49247
39.0188	2.67633
41.0251	2.7311
41.0751	2.87067
41.8113	2.59106
43.9542	2.73511
45.0011	3.03052
45.0821	2.67308
46.8347	2.8955
50.9874	3.39588
52.97	3.09325
53.0381	3.28309
54.7547	3.40503
56.7765	3.79485
56.8775	3.49324
57.6578	3.33646
58.3451	3.50362
58.8633	3.78256
61.0342	4.00477
62.6267	3.78054
62.8077	3.70227
64.0453	4.2377
66.209	3.85681
66.9564	4.19146
68.6619	3.69912
70.1206	4.26795
71.9462	4.11061
72.1913	4.211
73.948	4.4446
74.3061	4.27688
80.2844	4.6199
80.6585	4.49685
80.9796	4.8094
81.4659	4.99901
82.9904	4.58495
84.1078	4.78538
85.8124	4.87382
86.7248	5.08554
86.7969	5.28654
87.0349	4.78382
90.7572	5.25091
91.1274	5.11668
91.9517	5.08274
93.4913	5.29412
94.8508	5.003
97.6078	5.69398
98.7503	5.38065
99.5405	5.9839
99.6347	5.5142
99.7067	5.7152
99.7708	5.89386
101.2631	5.39047
103.8593	6.21556
104.6156	5.99178
104.8936	5.60073
106.5662	5.59983
106.6823	5.92366
107.4706	5.78921
109.5284	6.27953
109.7095	6.20126
111.27  	5.8877
111.3331	6.64714
113.4769	6.21041
113.7355	6.6865
114.6984	6.70117
115.6566	5.87418
120.5615	6.1396
121.4249	6.79809
121.5148	5.8822
123.4116	6.50664
123.7577	6.30541
125.2643	7.00823
125.6714	6.39374
127.4752	7.34211
128.2235	7.096
129.7229	7.19571
129.9841	7.34077
132.8961	6.71376
134.4237	6.89163
137.543     7.42606
139.5537	7.20161
139.7227	7.08982
141.5465	8.09404
141.6115	7.69193
142.4807	7.20004
142.651     8.84175
143.3961	8.0037
143.8953	7.64603
144.2254	7.40014
146.6724	8.39285
150.4328	7.79889
152.7326	7.79766
152.8167	8.03216
153.1397	7.18316
153.8087	8.8855
154.5133	8.09826
155.4417	8.35464
155.6379	8.9018
156.4582	8.85669
157.3434	8.40947
157.5413	7.79508
160.1623	8.1064
162.0352	8.66383
163.3346	8.20522
164.449 	7.81371
165.6126	9.3097
167.2021	8.49353
168.3697	10.00068
169.38      9.31885
169.421     8.84974
171.1025	8.2904
174.2497	8.90299
175.1341	9.03655
176.3405	8.90187
178.2151	8.29776
180.8833	9.32385
181.2214	9.10029
182.4389	9.5799
183.9434	9.11
185.5333	10.6263
187.6159	10.60464
188.41      9.31982
188.5141	9.61015
188.5572	10.31375
188.5862	9.81114
191.3692	9.40758
193.2829	9.4959
195.4097	9.59527
197.5725	9.79516
199.6242	9.1016
200.4636	9.69308
202.2643	10.04952
208.4116	10.28077
208.4747	11.04021
212.9183	10.60225
213.5455	10.60191
213.5745	10.09929
215.5024	11.39384
217.514 	10.58862
217.8022	11.39261
221.2697	12.89853
221.3815	10.87692
222.6078	10.79809
224.4175	10.59607
225.4051	11.60074
227.4897	10.41574
228.1502	12.25822
231.177     10.20155
233.1582	13.39475
234.4603	11.19381
234.8077	12.7661
235.2098	12.70119
236.4603	12.68935
237.0774	11.49396
238.3598	11.57146
242.3043	11.49116
244.9395	13.0087
246.1838	11.81298
250.1153	12.27995
279.1139	13.3226
302.509     13.9967
315.8534	15.1557
375.2195	15.5021
474.7523	15.0654
493.0676	17.7164
499.0009	15.1919
528.1937	17.6625
533.2772	15.5638
557.4572	17.8813
578.3597	18.0376
615.9861	18.258
629.3696	18.1694
764.9258	15.7314
983.1842	16.2006];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL    = C2K(36.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SharCala1964';

%Sharman Firth and Calaby 1964
data.tW = [ ... % d, time since birth (days); g (body mass)
0.0651	0.8662
2.0258	1.2049
4.8852	1.7132
8.9691	2.2166
11.9956	3.5907
14.0356	3.4092
18.0425	4.9526
18.0463	5.8191
23.0305	6.8387
24.01	6.8348
24.0154	8.0478
25.9823	9.7728
26.0531	7.3464
30.0693	10.9694
31.0535	12.0052
31.1312	11.1384
32.117	12.5208
34.1686	14.9386
36.9748	21.8592
37.1158	16.833
40.0053	24.0998
43.0387	27.0335
44.0314	29.9756
46.9109	34.9895
49.9907	48.3209
50.867	43.4651
51.8697	48.6599
53.9127	49.1715
54.8115	49.3412
55.8312	58.3485
57.7896	58.1673
61.7734	72.8814
66.847	75.6336
68.8826	19.4773
69.7558	87.2327
75.5678	109.2179
75.5903	114.2434
75.8044	107.3107 % up to 75 days graph...
2.321	0.919464255 % from graph of up to 250days (SAME PAPER: Sharman Firth & Calaby 1964)
5.2829	1.498765016
8.7847	1.954531588
11.3859	3.476577353
12.3748	3.124943128
13.9912	3.341362375
17.581	5.147249377
18.2113	4.362708104
18.8389	5.029215492
22.8782	6.987589311
24.1348	7.894863959
25.6604	9.134571723
25.6629	7.133328125
29.5218	10.40306249
30.9576	11.88669456
33.9194	14.78188623
35.8039	17.30363909
36.8796	20.54155825
36.9725	16.26157947
39.7526	23.01536222
42.5356	25.85293843
43.8814	29.1072616
46.8434	33.84872413
49.3534	46.09065102
50.9716	43.09956593
51.3294	46.86236752
55.1921	47.11628944
55.3683	56.77364233
56.2671	55.03244012
61.8315	71.3546056
66.5023	73.07657379
69.4631	86.29229206
75.7468	104.926972
75.835	112.6156107
89.206	190.6156801
97.5619	179.6734773
98.5439	221.7637194
98.8117	234.3601538
100.3439	197.2796663
102.4932	246.6216383
103.8435	225.4217641
108.6818	332.2509818
111.109     315.4179407
113.7991	362.6501406
114.6094	344.7817764
116.4039	365.679264
117.4802	383.2108726
117.6635	345.75625
119.8074	479.2766091
126.5407	529.5536706
128.6949	551.9531949
128.701     474.4242475
129.7741	537.3876263
136.5076	588.7965384
136.6914	533.4709281
138.4912	492.7769244
140.5345	835.9235092
140.6423	554.6220727
141.5167	946.0985415
142.7031	630.1501775
147.7306	676.4661951
150.5985	785.870515
152.4832	814.9637125
154.9386	395.9158069
156.6098	917.7066317
161.9982	946.0985415
167.5791	742.7420554
167.6665	784.1855591
168.8935	1429.797542
168.9134	980.9522354
171.5009	1372.66413
173.3921	1256.006487
175.5548	1107.497127
181.7384	1455.151462
184.6835	2010.776878
185.5081	1538.238966
185.5779	2136.620337
185.8578	1806.309224
186.474 	2209.902978
187.4083	1199.124251
187.7485	1685.498887
188.2707	2209.902978
196.6442	1616.194748
201.5638	2271.027014
205.1474	2623.90357
207.4682	3231.945187
207.8509	2312.431181
214.0969	4128.263543
220.0368	3582.279316
220.293     4241.615482
225.268     2684.8076
227.1148	4534.154679
228.5619	4016.873462
229.4024	2601.311309
229.5617	3453.769987
229.9066	4153.870422
230.4496	3952.105896
233.322     4062.224465
233.7389	5942.034861
235.0967	5290.308208
236.5492	4415.544815
237.1703	4839.758697
244.3647	4404.895167
244.4447	4948.458565];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SharCala1964';

% from Sharman and 
data.tW2 =[...%    Age (days),	Weight (kg) 
111.6943	0.2368
134.5862	0.528
151.7349	0.9931
226.083     2.5635
220.2596	3.7242
234.4543	5.292
234.3881	6.1047
297.3444	6.8618
320.0852	9.0106
308.5849	9.5326
311.3926	10.2293
377.0953	12.4378
405.6688	13.3096
866.2486	20.6428
868.9146	23.0809
963.3892	23.7233]; 
data.tW2(:,2) = data.tW2(:,2) * 1e3; % convert kg to g
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(36.3);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'SharCala1964';

% O2 consumption 
data.WJO = [... % Mass (in g), rate of oxygen consumption (mL per min)
             8600   45.41108987     %Munn and Dawson 2000 _ thermoregulation in juvenile kangaroos			
            23150	76.1635         %Dawson 2000_ ventilation rates			
            32490 	96.51666667     %Dawson & Hulbert 1970
];	

units.WJO   = {'g', 'ml O2/min'};  label.WJO = {'wet weight','O2 consumption'};  
temp.WJO    = C2K(36.3);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'SharCala1964';

% data.WJO_fld = [... % Mass (g), mL O2/min, from field data
%             23600	168.4658487     %Munn and Dawson 2008 _ free ranging metabolic rate
%             26200	121.091135      %McCarron and Buffenstein 2001 
%             ];
% units.WJO_fld   = {'g', 'ml O2/min'};  label.WJO_fld = {'wet weight','O2 consumption'};  
% temp.WJO_fld    = C2K(36.3);  units.temp.WJO_fld = 'K'; label.temp.WJO_fld = 'temperature';
% bibkey.WJO_fld = 'SharCala1964';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '90 percent of milk production originates from upregulation';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7VR5P'; % Cat of Life
metaData.links.id_ITIS = '552740'; % ITIS
metaData.links.id_EoL = '122672'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_rufus'; % Wikipedia
metaData.links.id_ADW = 'Macropus_rufus'; % ADW
metaData.links.id_Taxo = '168628'; % Taxonomicon
metaData.links.id_MSW3 = '11000272'; % Mammal Spec World
metaData.links.id_AnAge = 'Macropus_rufus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_rufus}}';
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
bibkey = 'CorkDove1989'; type = 'Article'; bib = [ ... 
'author = {Cork, S. J. and Dove, H.}, ' ... 
'year = {1989}, ' ...
'title = {Lactation in the tammar wallaby (\emph{Macropus eugenii}). II. {I}ntake of milk components and maternal allocation of energy}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {219}, ' ...
'pages = {399--409}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsDenn1969'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Denny, M. J. S. and Hulbert, A. J.}, ' ... 
'year = {1969}, ' ...
'title = {Thermal balance of the macropod marsupial \emph{Macropus eugenii} {D}esmarest}, ' ...
'journal = {Comparative Biochemistry and Physiology}, ' ...
'volume = {31}, ' ...
'pages = {645--653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsBlan2000a'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Blaney, C. E. and Munn, A. J. and Krockenberger, A. and Maloney, S. K.}, ' ... 
'year = {2000}, ' ...
'title = {Thermoregulation by kangaroos from mesic and arid habitats: Influence of temperature on routes of heat loss in eastern grey kangaroos (\emph{Macropus giganteus}) and red kangaroos (\emph{Macropus rufus})}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73}, ' ...
'pages = {374--381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsMcTa2006'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and McTavish, K. J. and Munn, A. J. and Holloway, J.}, ' ... 
'year = {2006}, ' ...
'title = {Water use and the thermoregulatory behaviour of kangaroos in arid regions: insights into the colonisation of arid rangelands in {A}ustralia by the Eastern Grey Kangaroo (\emph{Macropus giganteus})}, ' ...
'journal = {Journal of Comparative Physiology B-Biochemical Systemic and Environmental Physiology}, ' ...
'volume = {176}, ' ...
'pages = {45--53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsMunn2000'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Munn, A. J. and Blaney, C. E. and Krockenberger, A. and Maloney, S. K.}, ' ... 
'year = {2000}, ' ...
'title = {Ventilatory accommodation of oxygen demand and respiratory water loss in kangaroos from mesic and arid environments, the eastern grey kangaroo (\emph{Macropus giganteus}) and the red kangaroo (\emph{Macropus rufus})}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73}, ' ...
'pages = {382--388}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FritShar1964'; type = 'Article'; bib = [ ... 
'author = {Frith, H. J. and Sharman, G. B.}, ' ... 
'year = {1964}, ' ...
'title = {Breeding in wild populations of the red kangaroo, \emph{Megaleia rufa}}, ' ...
'journal = {CSIRO Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {86--114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunnDaws2003'; type = 'Article'; bib = [ ... 
'author = {Munn, A. J. and Dawson, T. J.}, ' ... 
'year = {2003}, ' ...
'title = {How important is milk for near-weaned red kangaroos (\emph{Macropus rufus}) fed different forages?}, ' ...
'journal = {Journal of Comparative Physiology B-Biochemical Systemic and Environmental Physiology}, ' ...
'volume = {173}, ' ...
'pages = {141--148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolCarp1982'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Carpenter, S. M. and Wood, J. T.}, ' ... 
'year = {1982}, ' ...
'title = {Growth of grey kangaroos and the reliability of age determination from body measurements, I. {T}he eastern grey kangaroo, \emph{Macropus giganteus}}, ' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {9--20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1986'; type = 'Article'; bib = [ ... 
'author = {Robertson, G.}, ' ... 
'year = { 1986}, ' ...
'title = {The mortality of kangaroos in drought}, ' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {13}, ' ...
'pages = {349--54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharCala1964'; type = 'Article'; bib = [ ... 
'author = {Sharman, G. B. and Calaby, J. H.}, ' ... 
'year = {1964}, ' ...
'title = {Reproductive behavior in the red kangaroo, \emph{Megaleia rufa}, in captivity.}, ' ...
'journal = {CSIRO Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {58--85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharFrit1964'; type = 'Article'; bib = [ ... 
'author = {Sharman, G. B. and Frith, H. J. and Calaby, H. H.}, ' ... 
'year = {1964}, ' ...
'title = {Growth of the pouch young, tooth eruption, and age determination in the red kangaroo, \emph{Megaleia rufa}}, ' ...
'journal = {CSIRO Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {20--49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_rufus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


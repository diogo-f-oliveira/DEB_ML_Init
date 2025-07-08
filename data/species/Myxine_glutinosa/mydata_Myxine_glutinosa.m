function [data, auxData, metaData, txtData, weights] = mydata_Myxine_glutinosa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Myxini'; 
metaData.order      = 'Myxiniformes'; 
metaData.family     = 'Myxinidae';
metaData.species    = 'Myxine_glutinosa'; 
metaData.species_en = 'Atlantic hagfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 'L-N'; 'Ww-JO'}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2010 10 10];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 11]; 

%% set data
% zero-variate data;
data.am = 20 * 365;units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.pX  = 2353;   units.pX  = 'J/d'; label.pX  = 'energy intake at 122.6 g'; bibkey.pX  = 'LessMart1996';
  temp.pX = C2K(6); units.temp.pX = 'K'; label.temp.pX = 'temperature';
  comment.pX = 'calculated by LessMart1996 on measured O2-consumption using 480 kJ/mol O2, not accounting for digestion efficiency, growth costs etc.';

data.Lb  = 9.8;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'GranBish2009';
  comment.Lb = '6 to 8 cm, no larval stage';
data.Lp  = 34.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'GranBish2009'; % 50 %
  comment.Lp = 'first mature 29.1 cm, 50% mature 34.3 cm, 100% mature 42 cm';
data.Li  = 65;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Gran2006';

data.Wwb = 0.9;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'GranBish2009';
 comment.Wwb = 'assuming eggs of 14 * 8 * 6 mm';
data.Wwp = 47;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'GranBish2009';
 comment.Wwp = 'first mature 28.7 g, 50% mature 47 g, 100% mature 76 g';
data.Wwi = 275;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'GranBish2009';
 comment.Wwi = 'large individulas are sterile (GranBish2009)';

data.Ri  = 38/365; units.Ri  = '#';   label.Ri  = 'max reproduction rate';    bibkey.Ri  = 'GranBish2009';   
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';

% uni-variate data 
% length-weight
data.LW = [ ... % length (cm), wet weight(g)
16.2672	4.3178
16.7045	6.2561
17.1903	5.7667
17.6275	5.7632
18.8421	5.2679
19.0850	7.6931
19.5223	8.1750
19.8623	12.0557
20.9312	8.6490
21.1741	13.9869
21.9514	10.5825
22.2915	11.5507
22.9717	11.5452
23.6032	13.4818
24.3806	34.8347
24.4291	15.4168
25.1579	16.8673
25.6437	18.3196
26.1781	16.3736
26.1781	24.6260
26.4211	20.7405
26.6154	20.2535
27.0040	29.4737
27.1984	19.2779
27.3441	23.1603
27.5870	28.4981
27.7328	23.6426
28.1215	28.9792
28.2672	25.5800
28.5101	22.6654
28.7530	36.7411
28.9474	24.6036
28.9960	34.3119
29.4332	27.9977
29.6761	28.4812
29.9676	37.2167
30.1619	27.0209
30.4534	31.8730
30.9393	51.2865
31.0364	38.6644
31.0364	43.0333
31.0850	28.9552
31.2308	34.7793
31.6194	57.1063
31.8138	43.0270
31.9109	32.3466
32.0081	54.1905
32.1538	33.3155
32.4939	43.9924
32.4939	49.8176
32.6397	36.2242
32.9312	56.1248
32.9798	37.6778
33.0283	45.9298
33.2713	61.9473
33.3198	47.3838
33.4170	31.8490
33.4656	34.2758
33.4656	41.5573
33.5142	55.1492
33.6113	37.6727
33.7085	36.7010
33.7085	48.8369
33.8543	42.0396
33.9514	49.8058
34.1457	42.5227
34.1943	59.5126
34.2915	50.7740
34.6316	47.3731
34.7773	53.6827
34.8745	36.6916
34.8745	40.5751
34.9717	51.7393
35.1660	45.9125
35.2632	54.1642
35.5061	63.3855
35.5061	66.2981
35.5547	48.8220
35.8462	47.8488
35.8947	56.5862
35.8947	59.0134
35.9433	63.8674
36.1377	41.0503
36.1377	52.7008
36.3806	43.4755
36.5263	63.3772
36.7692	56.5792
36.7692	59.9772
37.0121	80.3636
37.2065	47.3523
37.2065	61.4300
37.3036	72.5943
37.3522	54.1472
37.3522	62.8851
37.4008	76.9624
37.4494	80.8455
37.5466	56.5729
37.5951	56.5725
37.6923	66.2804
37.8866	48.3177
38.0324	61.9087
38.0810	66.2773
38.1781	52.6843
38.2753	70.6446
38.3725	60.4497
38.3725	76.4691
38.3725	125.9837
38.4211	57.5367
38.5668	83.7491
38.6154	61.9040
38.7125	65.7867
38.7611	48.3106
38.8583	74.0380
38.9555	31.3187
39.0526	57.5315
39.1984	69.6663
39.2470	93.9377
39.2955	59.9568
39.3441	84.7137
39.4899	51.7028
39.5385	65.2946
39.5385	76.9451
39.6356	73.0608
39.7328	75.4872
39.8300	84.7097
39.8785	57.5249
39.9757	96.3590
40.0729	79.8534
40.1700	72.0856
40.2186	65.2891
40.3644	91.9870
40.4615	58.4910
40.4615	68.1998
40.4615	77.9085
40.4615	81.3066
40.5101	82.7625
40.5101	103.6363
40.7045	76.9357
40.7530	66.7411
40.8016	97.3232
40.9474	86.6424
40.9959	94.4090
41.0445	73.0494
41.0445	81.3019
41.0931	61.8840
41.2389	70.1352
41.2874	83.2416
41.3360	104.1150
41.4332	93.9201
41.5304	83.2397
41.5304	98.7736
41.6275	62.3651
41.8219	72.5577
41.8219	92.9460
41.8704	71.5864
41.8704	100.2272
42.0162	65.7600
42.1134	77.8951
42.2591	109.4474
42.3563	87.6019
42.3563	96.3398
42.4534	104.1060
42.5020	72.5522
42.5992	90.5126
42.6964	79.3467
42.8907	123.5199
42.9393	94.8787
42.9879	66.2376
43.0364	50.2178
43.0364	61.3828
43.0850	109.4407
43.1336	102.1587
43.1822	116.2360
43.2308	71.5754
43.2794	95.3614
43.3765	92.4480
43.3765	135.1665
43.4251	81.2826
43.4251	121.5738
43.4737	103.6123
43.4737	118.1754
43.5223	87.5925
43.5223	129.3400
43.7652	68.6585
43.9595	83.2200
43.9595	100.6957
44.0567	104.5784
44.1053	113.8014
44.1053	121.5683
44.1053	125.9373
44.1538	45.8398
44.1538	95.8398
44.2024	87.5870
44.3482	78.8479
44.3968	107.0029
44.4939	110.8856
44.5425	45.8366
44.5911	74.9625
44.6883	92.4374
44.7368	123.0195
44.9312	99.7170
44.9312	104.5714
44.9312	128.3578
44.9798	82.2409
44.9798	88.0661
45.1255	112.3368
45.2227	94.3748
45.2713	119.6172
45.2713	132.2385
45.3684	100.1989
45.4656	72.5282
45.4656	77.8680
45.5142	109.9065
45.5142	124.4696
45.6113	105.5367
45.8543	77.8649
45.8543	86.6027
45.9028	134.1752
46.0486	95.8245
46.0486	104.0769
46.0486	114.2711
46.2429	91.4539
46.2429	120.0947
46.2915	83.6866
46.3401	128.8318
46.3887	104.5596
46.3887	111.3557
46.4372	108.4427
46.4858	99.2190
46.5344	123.0050
46.5344	139.9953
46.6802	89.5087
46.7773	109.4108
46.7773	114.7506
46.8745	129.3129
47.0202	139.9914
47.1660	101.6407
47.1660	127.8542
47.2146	115.2325
47.2632	144.3583
47.3117	93.3871
47.3117	120.0861
47.3603	85.6197
47.3603	118.1440
47.4089	106.4931
47.5061	116.2010
47.7004	129.3062
47.7004	137.0732
47.7490	122.0243
47.8462	106.4895
47.8947	59.8872
47.8947	128.8192
47.9433	97.7509
47.9433	118.1392
47.9433	143.3819
48.0405	78.3326
48.0405	89.4977
48.0891	126.3905
48.1862	113.2829
48.2348	109.8844
48.2834	121.5345
48.3320	100.6604
48.3806	70.5629
48.4291	114.7372
48.4777	103.5718
48.4777	128.3291
48.5749	77.3574
48.5749	83.6681
48.6235	124.4444
48.6721	93.3761
48.6721	122.5023
48.7206	109.8805
48.7692	135.6083
48.8178	140.9477
48.9150	88.0343
48.9150	129.2964
49.0607	104.5379
49.0607	114.7321
49.2551	118.6141
49.3036	98.2253
49.4494	90.9426
49.4494	130.7484
49.4494	155.9911
49.5951	122.4948
49.5951	128.8055
49.5951	138.5142
49.6437	72.4944
49.6923	113.2707
49.6923	119.5814
49.8866	108.9002
50.0810	157.4423
50.1781	120.5483
50.2267	137.5382
50.2267	145.3052
50.2753	101.1301
50.3239	132.6831
50.3725	176.3720
50.4210	111.8085
50.4696	126.8567
50.4696	164.7207
50.5182	123.9436
50.6154	151.1273
50.6640	107.4376
50.6640	142.8745
50.7125	117.1459
50.7125	133.1654
50.7611	113.7475
50.7611	137.5339
50.8097	156.9510
50.9069	125.8822
50.9555	129.7654
51.0040	147.2407
51.1498	139.9580
51.1984	131.7051
51.2470	117.1416
51.2955	133.1607
51.5385	120.0519
51.5385	150.1490
51.5870	128.3039
51.6356	139.9540
51.7328	141.4095
51.7814	117.6227
51.8300	124.4185
51.8785	134.6122
51.9271	97.2332
52.0243	125.8732
52.0729	106.4553
52.0729	114.7078
52.0729	159.8534
52.1700	117.6196
52.1700	147.7167
52.1700	153.0565
52.1700	167.1342
52.2672	178.7839
52.4130	126.8409
52.4130	140.4332
52.7045	153.5376
52.8988	121.4972
53.0445	158.3892
53.2874	157.4164
53.3846	121.0078
53.5789	149.6470
53.6275	162.2680
53.8219	185.0820
53.9190	113.7220
54.3077	154.0101
54.7935	148.1809
54.9879	170.9948
55.0364	134.1013
55.3279	137.9824
55.4737	153.0298
56.0567	128.2678
56.4453	168.5559
56.8826	190.8824
56.9798	164.6681
58.5344	176.3060
58.5344	228.7331
62.5668	240.8364
64.6073	265.5772];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'Gran2006';

% length - fecundity
data.LN = [ ... % log_10 mm, log_10 #
2.5696	1.0697
2.5799	0.9526
2.5898	1.1905
2.5900	1.1268
2.5996	1.1705
2.5996	1.2375
2.5999	1.1102
2.6097	1.1070
2.6097	1.4118
2.6099	1.1673
2.6101	1.0634
2.6193	1.0635
2.6193	1.1540
2.6193	1.2276
2.6196	1.1138
2.6196	1.3047
2.6294	1.3182
2.6296	1.2579
2.6296	1.3383
2.6299	1.1809
2.6301	1.0871
2.6397	1.2580
2.6397	1.3150
2.6397	1.3920
2.6399	1.0604
2.6399	1.1843
2.6399	1.2178
2.6399	1.3485
2.6399	1.4657
2.6500	1.0572
2.6500	1.3151
2.6500	1.3519
2.6500	1.4390
2.6502	1.1878
2.6502	1.2313
2.6502	1.2749
2.6502	1.3888
2.6596	1.5831
2.6599	1.2348
2.6599	1.2750
2.6599	1.3654
2.6603	1.4324
2.6697	1.4627
2.6699	1.1947
2.6699	1.4091
2.6699	1.5062
2.6699	1.5631
2.6796	1.2652
2.6798	1.2049
2.6798	1.2317
2.6798	1.3221
2.6800	1.3556
2.6800	1.4025
2.6802	1.4628
2.6802	1.5331
2.6896	1.6471
2.6899	1.4662
2.6899	1.5165
2.6899	1.5466
2.6899	1.5868
2.6901	1.4260
2.6903	1.3959
2.6905	1.3088
2.6905	1.3557
2.6999	1.4362
2.7102	1.6406
2.7104	1.5234
2.7104	1.6842
2.7199	1.4934
2.7199	1.6675
2.7297	1.5303
2.7297	1.5739
2.7503	1.8655];
data.LN = 10.^data.LN; data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN = {'cm', '#'};     label.LN = {'total length', 'number of eggs'};  
  temp.LN = C2K(6); units.temp.LN = 'K'; label.temp.LN = 'temperature';
  bibkey.LN = 'GranBish2009';
  comment.LN = '2008-data, were clutch size was max (possibly f = 1)';

% weight - respiration
data.WO = [ ... % wet weight (g), O2 consumption (mumol/g.h)
3.6	    26.59
15.5	 8.41
72.0	 2.19
122.6	 1.28
195.3 1.09];
units.WO = {'g', 'mumol/g.h'};     label.WO = {'wet weight', 'O2 consumption'};  bibkey.WO = 'LessMart1996';
 temp.WO = C2K(7); units.temp.WO = 'K'; label.temp.WO = 'temperature';
 comment.WO = 'Pacific species respires half this rate';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'ASSUMPTION: reproduction is once per year';
D2 = 'The only measured rate in the data below is the respiration rate';
D3 = 'blood volume = 18% of total body weight, 3 times higher than other fish (LessMart96)';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3);

%% Facts
F1 = [ ...
'No evidence of spawning or reprod-cycle synchronisation. ',...
'Larger females do not produce larger eggs. ',...
'Females are much more abundant (99:1), might be a result of catching method. ',...
'Initially both male and female gonad develop, then one of them reduces. ',...
'Hermaphrodites are rare (0.2-0.3 percent). ',...
'Male and female mature at same size. ',...
'Reduction in L_p, W_p with reduction in average ind in the pop (DEB interpretation is: k_J < k_M)'];
metaData.bibkey.F1 = 'GranBish2009';

F2 = [ ...
' "On the southwest slope of the Grand Bank, Atlantic hagfish are not ',...
'captured in shallow sub-zero waters and appear to concentrate (greatest catches) ',...
'within the warmest (5.8-9.0 C) available bottom waters which occur within ',...
'depths of 125-400 m."'];
metaData.bibkey.F2 = 'GranBish2009a';


F3 = [ ...
    '"There is no known method of aging hagfish however a recent review of ', ...
'conceptual models of hagfish fishery science and management suggested growth ',... 
'may approximate 20 mm/year"'];
metaData.bibkey.F3 = 'MartGran2007';

metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '45H8K'; % Cat of Life
metaData.links.id_ITIS = '159772'; % ITIS
metaData.links.id_EoL = '46582232'; % Ency of Life
metaData.links.id_Wiki = 'Myxine_glutinosa'; % Wikipedia
metaData.links.id_ADW = 'Myxine_glutinosa'; % ADW
metaData.links.id_Taxo = '41664'; % Taxonomicon
metaData.links.id_WoRMS = '101170'; % WoRMS
metaData.links.id_fishbase = 'Myxine-glutinosa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myxine_glutinosa}}';  
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
bibkey = 'Gran2006'; type = 'article'; bib = [ ...  
'author = {Grant, S. M.}, ' ...
'year = {2006}, ' ...
'title  = {An Exploratory Fishing Survey and Biological Resource Assessment of {A}tlantic Hagfish (\emph{Myxine glutinosa}) Occurring on the Southwest Slope of the {N}ewfoundland {G}rand {B}ank}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'volume = {36}, '...
'pages = {91-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GranBish2009'; type = 'misc'; bib = [ ...  
'author = {Grant, S. M. and Bishop, G. and Sullivan, R.}, ' ...
'year = {2009}, ' ...
'title  = {Biological Analysis of 3OPs {A}tlantic Hagfish (\emph{Myxine glutinosa}).}, ' ...
'institution = {ppt-file, pers comm}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GranBish2009a'; type = 'techreport'; bib = [ ... 
'author = {Grant, S. M. and Bishop, G. and Sullivan, R.}, ' ...
'year = {2009}, ' ...
'title  = {Assessment of the Emerging {A}tlantic Hagfish (\emph{Myxine glutinosa}); {F}ishery in {N}{A}{F}{O} {S}ubdivision 30: {Y}ear V}, ' ...
'journal = {Centre for Sustainable Aquatic Resources}, ' ...
'pages = {P-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrazYeh2011'; type = 'article'; bib = [ ...  
'author = {Drazen, J. C. and Yeh, J. and Friedman, J. and Condon, N.}, ' ...
'year = {2011}, ' ...
'title  = {Metabolism and enzyme activities of hagfish from shallow and deep water of the {P}acific {O}cean}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A}, ' ...
'volume = {159}, '...
'pages = {182-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LessMart1996'; type = 'article'; bib = [ ...  
'author = {Lesser, M. P. and Martini, F. H. and Heiser, J. B.}, ' ...
'year = {1996}, ' ...
'title  = {Ecology of the hagfish \emph{Myxini glutinosa} {L}. in the {G}ulf of {M}aine I. {M}etabolic rates and energetics}, ' ...
'journal = {J Exp. Mar. Biol. Ecol.}, ' ...
'volume = {208}, '...
'pages = {215--225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartGran2007'; type = 'techreport'; bib = [ ... 
'author = {Martini, F. H. and S. M. Grant and B. Hatcher and A. Mugridge}, ' ...
'year = {2007}, ' ...
'title  = {Conceptual models for hagfishery science and management}, ' ...
'institution = {Workshop on {C}anadian Science and Management Strategies for {A}tlantic Hagfish, {D}artmouth, {N}ova {S}cotia. 22-23 {O}ctober 2007.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

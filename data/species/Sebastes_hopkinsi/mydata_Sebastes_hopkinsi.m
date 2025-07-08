function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_hopkinsi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_hopkinsi'; 
metaData.species_en = 'Squarespot rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 21];

%% set data
% zero-variate data

data.am = 19*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 29;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 52.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 330;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 39e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
2.059	15.117
3.039	16.507
4.118	17.241
5.196	19.435
6.176	21.555
7.010	21.120
8.137	21.709
9.118	22.077
10.000	22.737
10.980	22.449
12.108	22.672
13.039	23.843
13.922	23.773
14.951	24.361
15.931	25.387
16.961	25.098
17.990	26.489
18.971	26.274];
data.tL_f(:,1) = 365*(0.9+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(10.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.235	14.026
4.118	14.468
5.147	15.712
6.078	15.570
7.108	16.303
8.088	16.453
9.118	17.333
10.098	18.212
11.029	18.945
12.010	18.949
13.039	17.055];
data.tL_m(:,1) = 365*(0.9+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(10.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... length (cm), weight (g)
10.450	15.311
11.271	19.502
12.665	29.544
13.163	24.558
13.404	34.566
13.818	29.578
14.061	37.918
14.387	43.761
14.472	37.931
14.716	43.771
14.797	45.440
14.959	51.278
15.040	52.114
15.284	57.955
15.285	57.121
15.289	48.788
15.461	37.127
15.542	39.629
15.622	43.798
15.694	61.300
15.699	52.967
15.866	48.805
16.106	61.313
16.598	64.661
16.836	78.834
17.009	66.339
17.016	53.006
17.092	63.842
17.178	58.011
17.497	75.521
17.582	72.190
17.655	88.025
17.750	65.528
17.751	63.862
17.753	60.528
17.985	85.535
17.987	82.202
18.072	78.038
18.146	92.207
18.325	68.879
18.404	73.881
18.469	103.050
18.474	94.716
18.496	58.050
18.577	60.553
18.657	64.722
18.721	94.724
18.729	81.391
18.736	69.724
18.798	103.893
18.972	88.065
19.062	74.734
19.141	81.403
19.149	67.237
19.216	93.905
19.224	80.572
19.532	116.415
19.624	99.751
19.702	107.253
19.793	92.256
19.800	80.589
19.801	78.923
19.860	118.091
20.121	94.765
20.199	103.101
20.206	91.435
20.262	135.603
20.273	117.270
20.445	104.775
20.455	88.109
20.529	101.444
20.670	142.282
20.677	129.782
20.763	123.118
20.771	109.785
20.832	146.453
20.839	134.787
20.859	99.787
20.910	153.956
20.933	113.956
20.953	80.624
20.996	147.292
21.034	83.126
21.159	149.796
21.317	161.468
21.321	154.801
21.338	125.635
21.393	172.303
21.436	99.805
21.468	185.639
21.477	169.806
21.509	114.807
21.516	103.140
21.553	180.641
21.561	166.475
21.582	130.642
21.659	140.645
21.754	118.981
21.821	144.816
21.845	104.817
21.902	148.152
21.917	122.319
21.926	106.486
21.977	159.821
21.989	138.988
22.006	110.655
22.046	182.323
22.079	127.324
22.085	116.491
22.132	175.659
22.146	153.159
22.172	108.160
22.300	170.664
22.322	133.998
22.360	208.999
22.365	200.666
22.400	141.500
22.450	195.668
22.480	144.002
22.527	204.837
22.539	184.004
22.543	178.171
22.631	168.173
22.641	151.507
22.717	161.509
22.718	159.843
22.736	129.010
22.807	149.012
23.022	203.185
23.041	170.686
23.048	159.019
23.113	189.021
23.152	122.356
23.185	205.690
23.201	179.024
23.218	150.691
23.221	145.691
23.264	211.526
23.280	184.859
23.284	177.360
23.299	153.193
23.305	142.360
23.305	141.527
23.378	158.196
23.392	134.029
23.467	146.532
23.591	215.702
23.608	187.369
23.623	162.370
23.629	151.537
23.634	142.370
23.662	234.871
23.672	218.205
23.694	180.705
23.742	239.873
23.759	210.707
23.767	196.541
23.771	190.707
23.852	193.210
23.879	145.711
24.021	185.715
24.023	181.548
24.025	179.048
24.110	174.051
24.114	167.384
24.180	194.886
24.276	172.389
24.320	237.390
24.363	164.058
24.424	200.727
24.486	234.895
24.667	207.401
24.792	274.071
24.844	185.739
24.845	184.906
24.848	179.906
24.899	233.241
24.904	223.241
24.917	202.408
24.924	189.908
25.241	210.751
25.485	216.592
25.781	272.434
25.877	249.937
25.895	219.937
25.911	192.438
25.972	229.106
25.996	188.274
26.147	210.778
26.448	259.954
26.701	249.128
27.197	246.643
27.919	279.164];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
16.882	8510.393
17.756	14867.255
18.225	11072.236
18.242	9573.987
18.416	17300.678
18.570	18917.474
18.642	20186.869
18.666	17997.117
18.806	12927.761
18.857	16156.410
18.936	16734.308
18.984	12239.555
19.077	19618.852
19.138	21925.500
19.270	17547.644
19.437	18011.935
19.900	22747.068
19.996	21826.714
20.008	20674.213
20.017	19867.464
20.027	18945.463
20.079	14104.959
20.262	21024.901
20.521	28868.491
20.597	21722.989
20.654	16421.486
20.670	22877.136
20.724	17921.384
21.144	26690.265
21.150	18160.114
21.272	14704.261
21.391	19663.306
22.439	25792.961
23.835	39537.354
25.394	29999.588
26.080	30012.760];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(10.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7MD'; % Cat of Life
metaData.links.id_ITIS = '166753'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_hopkinsi'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_hopkinsi'; % ADW
metaData.links.id_Taxo = '187280'; % Taxonomicon
metaData.links.id_WoRMS = '274800'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-hopkinsi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_hopkinsi}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-hopkinsi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

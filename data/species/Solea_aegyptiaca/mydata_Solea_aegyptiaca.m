function [data, auxData, metaData, txtData, weights] = mydata_Solea_aegyptiaca
%% set metaData 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Solea_aegyptiaca'; 
metaData.species_en = 'Egyptian sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab';'am';'Lp';'Li';'Wwb';'Wwp';'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011 

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 17];

%% set data
% zero-variate data

data.ab = 13.5;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11 * 365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'guess';  
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';        bibkey.Lp  = 'AhmeShar2010'; 
data.Li  = 65;   units.Li  = 'cm';  label.Li  = 'ultimate total length';          bibkey.Li  = 'fishbase';   

data.Wwb = 5.2e-4 ; units.Wwb = 'mug'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'AhmeShar2010'; 
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 29.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00759*Lp^3.05, see F1';   
data.Wwi = 2.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.05, see F1';   
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 17.2
    2 24.2
    3 28.7];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1)) ;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  %label.tL = {'time since hatching', 'total length'};  
temp.tL = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Gabr2015';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.805	11.632
11.361	12.201
11.948	13.353
12.196	18.590
12.845	17.409
13.185	18.567
13.278	20.895
13.618	20.304
13.680	29.623
13.773	24.378
13.834	20.299
14.112	22.623
14.329	29.025
14.360	23.782
14.452	23.197
14.453	25.527
14.453	29.605
14.546	32.515
14.638	28.436
14.947	29.593
14.948	31.341
14.978	22.602
15.041	33.669
15.041	41.242
15.102	30.755
15.380	31.913
15.380	33.661
15.411	27.253
15.473	29.581
15.566	35.404
15.628	39.481
15.844	34.233
15.844	35.398
15.875	36.562
15.938	42.968
15.967	30.735
15.999	36.559
16.091	33.062
16.123	42.964
16.154	39.468
16.184	31.312
16.215	32.477
16.216	42.962
16.339	37.134
16.339	37.716
16.339	39.464
16.369	34.221
16.400	35.385
16.401	40.045
16.402	51.695
16.433	52.860
16.463	42.956
16.555	34.799
16.556	45.867
16.556	47.032
16.587	42.371
16.617	42.370
16.710	42.368
16.865	49.355
16.866	55.762
16.927	48.771
16.956	33.042
16.957	41.780
16.989	46.439
17.019	36.536
17.019	38.283
17.049	35.370
17.051	52.263
17.081	40.612
17.112	47.601
17.143	48.766
17.234	31.288
17.236	44.103
17.266	34.200
17.298	47.597
17.328	42.354
17.330	57.499
17.360	48.761
17.483	44.680
17.513	37.107
17.513	38.854
17.515	52.252
17.515	55.165
17.545	43.514
17.576	44.095
17.638	50.502
17.639	59.239
17.700	54.578
17.760	35.353
17.792	47.585
17.794	60.401
17.853	39.429
17.916	47.583
17.916	51.660
17.977	44.086
18.009	52.823
18.041	57.483
18.071	53.404
18.133	52.820
18.165	60.975
18.194	45.246
18.195	55.731
18.257	59.808
18.288	58.059
18.317	42.913
18.320	66.214
18.349	55.728
18.411	51.066
18.442	54.561
18.503	47.569
18.597	59.217
18.627	55.721
18.658	55.721
18.659	63.876
18.660	70.284
18.751	52.223
18.751	56.883
18.814	69.698
18.844	60.959
18.968	63.286
19.153	56.292
19.154	63.282
19.154	64.447
19.309	70.851
19.369	52.791
19.370	60.947
19.401	64.441
19.402	77.257
19.463	68.517
19.494	65.022
19.495	76.672
19.555	59.777
19.556	70.845
19.556	73.758
19.557	77.836
19.619	81.329
19.678	54.532
19.712	83.075
19.772	69.675
19.835	74.916
19.895	60.934
19.896	66.760
19.897	76.080
19.929	87.147
19.990	78.991
20.020	74.912
20.050	67.921
20.081	70.833
20.113	72.580
20.114	84.813
20.143	72.579
20.236	74.325
20.237	82.480
20.266	63.838
20.268	78.402
20.268	79.567
20.359	67.331
20.361	84.807
20.454	89.465
20.455	94.125
20.485	84.804
20.485	90.629
20.546	76.647
20.546	79.560
20.546	82.473
20.576	70.822
20.670	82.470
20.733	94.119
20.794	91.205
20.824	81.301
20.826	102.272
20.857	98.194
20.917	86.542
20.949	89.454
21.042	94.694
21.071	80.713
21.072	86.538
21.073	95.276
21.133	83.624
21.134	87.702
21.166	102.847
21.258	90.029
21.288	81.873
21.350	82.454
21.383	102.842
21.444	97.597
21.505	92.936
21.535	85.362
21.567	92.352
21.597	85.943
21.598	97.011
21.629	92.350
21.630	107.496
21.691	92.931
21.722	98.173
21.722	100.504
21.723	105.746
21.753	94.678
21.785	106.327
21.785	108.657
21.785	112.153
21.813	78.948
21.814	88.851
21.938	98.751
21.969	92.925
22.123	92.339
22.154	87.095
22.156	106.319
22.186	103.988
22.187	116.221
22.279	106.316
22.311	112.723
22.373	116.217
22.402	101.653
22.433	103.982
22.434	106.895
22.465	115.049
22.557	106.309
22.588	99.901
22.619	107.473
22.650	102.230
22.713	121.451
22.714	131.937
22.742	99.315
22.805	113.876
22.837	123.779
22.866	103.390
22.898	113.874
22.898	117.952
22.929	112.126
23.085	133.676
23.113	101.636
23.144	101.635
23.144	104.548
23.147	135.422
23.208	124.352
23.299	110.370
23.301	121.438
23.301	127.845
23.517	126.093
23.547	110.364
23.549	138.325
23.672	129.002
23.732	115.020
23.764	121.427
23.826	123.756
23.827	128.416
23.858	135.988
24.043	130.158
24.105	131.322
24.230	140.057
24.353	137.141
24.384	140.053
24.475	121.410
24.630	123.737
24.661	132.474
24.662	138.882
24.693	141.794
24.786	145.869
24.816	136.548
24.817	140.043
24.847	133.635
24.910	141.789
25.158	150.521
25.283	165.081
25.311	136.536
25.343	153.429
25.373	140.613
25.408	180.806
25.498	156.338
25.531	171.483
25.590	146.433
25.622	162.160
25.655	179.053
25.962	163.900
25.993	162.152
26.117	165.061
26.119	181.372
26.459	188.354
26.552	182.527
26.581	169.711
26.644	176.700
26.984	180.769
27.016	187.176
27.726	182.500
27.975	204.630
28.160	201.130
31.165	273.293];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'}; 
bibkey.LW = 'Gabr2015';

data.LN = [ ... % total length (cm), fecundity (#)
    15.8  9899
    17.8 10968
    19.5 13677
    21.7 15129
    23.3 19475
    25.6 32514
    30.5 38506];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'}; 
temp.LN = C2K(17.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'AhmeShar2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL; 
weights.ab = 0 * weights.ab; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Y58V'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570283'; % Ency of Life
metaData.links.id_Wiki = 'Solea_aegyptiaca'; % Wikipedia
metaData.links.id_ADW = 'Solea_aegyptiaca'; % ADW
metaData.links.id_Taxo = '187833'; % Taxonomicon
metaData.links.id_WoRMS = '127158'; % WoRMS
metaData.links.id_fishbase = 'Solea-aegyptiaca'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'author = {Wikipedia},'...
'year = {2021},'...
'howpublished = {\url{https://en.wikipedia.org/wiki/Solea_aegyptiaca}},'...
'note = {Last accessed: 01/12/2021}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gabr2015'; type = 'Article'; bib = [ ... 
'author = {Mohamed H. Gabr}, ' ... 
'year   = {2015}, ' ...
'title  = {Capture production and stock assessment of \emph{Solea aegyptiaca} {C}habanaud, 1927 ({S}oleidae: {P}leuronectiformes) in {B}ardawil {L}agoon, {E}gypt}, ' ...
'journal= {Egyptian Journal of Aquatic Research}, ' ...
'volume = {41(1)}, ' ...
'doi    = {10.1016/j.ejar.2015.01.006}, '...
'pages  = {255-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];  
%
bibkey = 'AhmeShar2010'; type = 'Article'; bib = [ ... 
'author = {Ashraf I. Ahmed and Meriam M. Sharaf and Hebatullah A. Laban}, ' ... 
'year   = {2010}, ' ...
'title  = {REPRODUCTION OF THE {E}GYPTIAN SOLE, \emph{Solea aegyptiaca} {A}CTINOPTERYGII: {P}LEURONECTIFORMES: {S}OLEIDAE), FROM {P}ORT {S}AID, {E}GYPT, {M}EDITERRANEAN {S}EA}, ' ...
'journal= {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {40(2)}, ' ...
'doi    = {10.3750/AIP2010.40.2.09}, '...
'pages  = {161–166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];  
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Solea-aegyptiaca.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
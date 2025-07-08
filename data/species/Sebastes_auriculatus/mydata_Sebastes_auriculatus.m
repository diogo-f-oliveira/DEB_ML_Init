function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_auriculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_auriculatus'; 
metaData.species_en = 'Brown rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 34*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 31;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 56;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';

data.Ri  = 678000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(15);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
1.893	22.438
1.958	18.286
2.056	18.905
2.839	19.346
2.872	19.788
2.905	17.491
2.937	27.915
2.937	27.739
2.937	26.237
2.937	25.795
2.937	23.322
2.970	25.265
2.970	24.912
3.003	21.731
3.003	21.555
3.003	21.113
3.003	20.936
3.035	24.117
3.884	26.325
3.884	25.000
3.916	31.007
3.916	28.710
3.916	23.852
3.916	22.615
3.916	18.286
3.949	21.820
3.949	21.466
3.982	32.686
3.982	31.714
4.014	28.092
4.014	27.915
4.014	27.562
4.014	27.208
4.014	23.145
4.896	31.095
4.896	31.537
4.928	19.965
4.961	25.972
4.961	28.710
4.961	32.686
4.961	33.392
4.961	33.746
4.961	34.011
4.993	35.512
4.993	35.866
5.875	36.042
5.875	35.689
5.875	35.424
5.875	35.247
5.875	34.894
5.907	39.753
5.907	32.244
5.907	31.714
5.973	32.686
5.973	32.509
6.886	41.166
6.919	42.580
6.919	37.544
6.919	36.307
6.952	40.018
6.984	38.604
7.017	34.452
7.768	42.049
7.833	42.314
7.963	36.837
7.963	37.544
7.996	40.106
7.996	40.459
8.029	39.399
8.061	47.703
8.910	41.961
8.910	41.784
8.910	40.459
8.943	43.021
9.073	35.424
9.791	47.792
9.791	42.138
9.824	36.749
9.824	46.025
9.856	45.230
9.889	43.728
9.922	39.929
9.954	43.463
10.836	45.053
10.901	39.134
10.901	47.438
10.933	46.466
10.933	46.731
10.933	46.908
10.999	46.025
11.031	45.760
11.162	43.021
11.847	45.406
11.880	48.940
11.978	43.816
12.859	44.700
12.892	47.350
13.903	50.000
13.936	44.258
14.850	51.590
14.883	45.848
15.894	48.587
16.808	51.502
16.808	53.799
17.852	51.502];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr 
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveJohn1998';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.860	15.194
2.056	17.049
2.774	21.555
2.807	24.117
2.872	23.145
2.937	22.438
2.937	22.261
2.970	21.643
3.003	26.855
3.068	28.092
3.101	17.933
3.819	24.470
3.819	27.032
3.916	17.580
3.916	27.827
3.949	34.364
3.949	21.378
3.949	20.495
3.949	19.346
3.949	18.551
3.982	30.477
4.896	33.569
4.896	34.629
4.896	35.071
4.928	23.587
4.928	36.396
4.961	27.208
4.961	31.890
4.961	32.951
4.993	29.947
5.809	33.922
5.842	34.717
5.907	41.166
5.973	39.399
5.973	37.456
5.973	30.212
6.005	31.184
6.919	37.633
6.984	35.247
7.866	37.191
7.866	37.279
7.866	40.459
7.963	32.597
7.963	33.216
7.996	34.717
7.996	35.159
8.127	34.187
8.877	37.809
8.943	40.813
8.943	39.576
8.943	38.693
8.943	38.251
9.889	44.258
9.889	43.021
9.922	42.049
9.954	39.223
10.868	46.555
10.868	45.495
10.901	37.102
10.933	43.640
10.933	41.784
11.847	44.523
11.847	50.353
12.990	42.756
13.936	43.463
14.883	50.088
14.948	42.403
19.909	47.615];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveJohn1998';
comment.tL_m = 'data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
14.876	64.643
16.464	64.795
17.801	70.671
18.303	70.719
18.888	88.016
19.224	134.025
19.225	168.508
20.143	151.355
20.478	180.122
21.062	145.696
21.482	191.713
21.566	208.962
21.983	186.014
22.151	220.513
22.735	203.327
23.322	266.602
23.571	220.649
24.408	243.717
25.244	266.786
25.329	312.771
25.747	312.811
26.079	249.624
26.498	289.894
26.834	353.145
27.839	416.460
28.255	370.523
29.010	462.549
29.011	485.537
29.091	387.844
30.015	531.611
31.099	457.002
31.099	474.243
31.101	531.715
31.102	560.450
31.271	617.938
32.108	681.236
33.374	1129.634
33.444	635.387
33.448	802.054
33.615	802.070
34.028	612.455
34.448	687.208
34.533	738.940
35.451	710.292
35.869	687.344
36.205	762.089
36.294	968.994
36.456	790.848
36.876	859.854
37.044	871.364
37.047	997.801
37.294	859.894
37.552	1135.781
37.631	957.627
38.054	1158.817
38.382	911.722
38.654	1681.863
38.798	854.291
38.801	969.234
39.217	900.308
39.309	1204.915
39.635	900.348
39.641	1101.498
39.896	1256.695
40.062	1222.228
40.564	1262.506
40.647	1239.526
40.808	1021.150
40.809	1055.633
40.812	1164.829
40.813	1199.312
41.228	1090.156
41.238	1457.973
41.400	1274.080
41.479	1084.433
41.984	1222.412
42.238	1354.621
42.409	1498.315
42.487	1285.679
42.495	1573.036
42.650	1147.763
42.652	1199.488
42.660	1504.086
42.732	1084.553
42.733	1107.541
42.823	1337.435
42.904	1262.730
42.907	1383.420
43.242	1406.441
43.411	1458.181
43.413	1532.894
43.573	1280.036
43.580	1532.910
43.663	1492.688
43.668	1693.838
43.827	1377.761
43.833	1619.141
44.000	1590.421
44.006	1826.054
44.164	1475.495
44.251	1619.181
44.579	1395.075
44.671	1682.440
44.750	1515.781
44.757	1780.149
45.001	1550.287
45.256	1682.496
45.583	1423.906
45.845	1826.230
45.847	1918.185
45.925	1728.537
46.000	1418.199
46.252	1464.200
46.254	1510.178
47.026	2240.137
47.097	1774.626
48.185	1832.202
48.190	2033.352
48.686	1832.250
48.929	1562.158
49.791	2516.264
50.120	2303.651
50.618	2200.251
51.429	1303.777
51.430	1332.512
51.709	2372.769];
units.LWw  = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'LoveJohn1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'preferred temperature 15 C; ';
metaData.bibkey.F1 = 'AndrHech1996'; 
F2 = 'Demersal; depth range 20 - 275 m. Larvae and juveniles are pelagic'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'ovoviviparous (although fishbase actually reports viviparous)';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'length-weight: W in g = 0.01000*(TL in cm)^3.08'; 
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '4W7KX'; % Cat of Life
metaData.links.id_ITIS = '166708'; % ITIS
metaData.links.id_EoL = '46568119'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_auriculatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_auriculatus'; % ADW
metaData.links.id_Taxo = '187251'; % Taxonomicon
metaData.links.id_WoRMS = '274773'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-auriculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_auriculatus}}';
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
bibkey = 'LoveJohn1998'; type = 'Article'; bib = [ ... 
'author = {Milton S. Love and Korie Johnson}, ' ... 
'year = {1998}, ' ...
'title = {Aspects of the life histories of grass rockfish, \emph{Sebastes rastrelliger}, and brown rockfish, \emph{S. auriculatus}, from southern {C}alifornia}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {87}, ' ...
'pages = {100-109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-auriculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

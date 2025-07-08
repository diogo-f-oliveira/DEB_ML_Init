function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_elongatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_elongatus'; 
metaData.species_en = 'Greenstriped rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
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

data.am = 54*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 38;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 75.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 761;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 344e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
1.267	11.063
2.445	13.520
2.889	15.480
4.285	17.058
5.243	19.219
6.199	20.989
7.229	22.564
8.185	23.942
9.214	25.028
10.098	27.091
11.199	27.590
11.936	29.260
13.110	29.370
14.137	29.771
14.945	30.072
15.900	30.962
17.147	31.267
17.883	32.252
19.130	32.362
20.013	33.740
20.893	33.651
22.068	34.836
22.948	34.747
23.977	35.735
25.000	33.496
25.958	36.048
26.990	38.992
27.937	34.991];
data.tL_f(:,1) = 365*(0.8+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.191	9.791
2.152	13.810
2.963	15.872
4.283	16.080
4.948	18.336
6.122	18.934
7.005	20.410
8.109	22.083
9.136	22.191
10.018	23.471
10.901	25.143
12.073	24.274
13.103	25.751
14.203	25.468
15.011	26.259
16.112	26.465
17.066	26.963
18.093	26.778
18.978	29.427
20.077	28.753
20.955	27.784
22.131	28.969
23.010	28.391
24.037	28.596
24.918	28.996
25.942	27.148
26.826	29.112
27.927	29.906];
data.tL_m(:,1) = 365*(0.8+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... length (cm), weight (g)
11.159	28.792
11.277	16.452
11.741	20.566
12.787	26.735
13.834	24.679
14.063	49.357
14.066	26.735
14.877	43.188
14.997	18.509
15.575	41.131
15.690	55.527
16.153	65.810
16.739	37.018
16.968	61.697
17.897	71.979
17.898	63.753
18.131	57.584
18.464	164.524
18.475	90.488
18.708	90.488
18.710	78.149
18.825	84.319
19.059	71.979
19.061	59.640
19.173	88.432
19.404	98.715
19.639	82.262
19.870	94.602
20.216	115.167
21.031	104.884
21.145	119.280
21.611	115.167
21.961	104.884
22.305	139.846
22.309	111.054
22.422	135.733
22.541	121.337
23.232	162.468
23.237	131.620
23.344	191.260
23.348	164.524
23.355	119.280
23.467	150.129
23.467	146.015
23.929	166.581
23.931	152.185
24.043	180.977
24.050	135.733
24.398	143.959
24.627	168.638
24.635	113.111
24.739	193.316
24.854	203.599
24.857	180.977
24.978	152.185
25.084	220.051
25.549	220.051
25.554	187.147
25.780	232.391
26.479	226.221
26.590	261.183
26.596	217.995
26.824	248.843
26.826	238.560
26.941	244.730
27.298	187.147
27.402	275.578
27.517	285.861
27.519	267.352
27.529	201.542
27.638	250.900
27.873	234.447
28.204	359.897
28.209	320.823
28.215	281.748
28.454	236.504
28.566	267.352
28.569	242.674
28.672	339.332
28.684	252.956
28.793	302.314
28.908	310.540
28.913	277.635
28.916	257.069
29.130	386.632
29.369	339.332
29.380	267.352
29.382	248.843
29.481	372.237
29.488	324.936
29.493	285.861
29.606	310.540
29.609	292.031
29.715	364.010
29.956	302.314
30.184	335.219
30.192	277.635
30.411	372.237
30.413	361.954
30.423	287.918
30.424	285.861
30.530	353.728
30.534	324.936
30.986	415.424
30.987	407.198
30.999	326.992
31.101	423.650
31.117	314.653
31.216	435.990
31.222	392.802
31.233	318.766
31.239	275.578
31.692	357.841
32.030	431.877
32.032	419.537
32.033	411.311
32.039	372.237
32.257	468.895
32.386	382.519
32.392	341.388
32.848	407.198
32.949	507.969
32.968	378.406
33.067	497.686
33.079	413.368
33.204	357.841
33.304	470.951
33.524	553.213
33.659	423.650
33.754	573.779
33.780	396.915
33.780	390.746
33.878	520.308
33.878	516.195
33.883	487.404
33.997	497.686
34.786	674.550
34.802	561.440
34.804	547.044
34.813	489.460
34.909	627.249
35.039	534.704
35.266	569.666
35.370	656.041
35.505	522.365
35.507	510.026
35.711	709.512
36.316	549.100
36.437	516.195
36.523	723.907
36.538	616.967
36.557	485.347
36.657	598.458
36.758	703.342
36.897	547.044
37.361	559.383
37.466	631.362
37.699	631.362
37.708	569.666
38.516	610.797
40.356	750.643];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
16.311	8670.546
20.171	50289.026
22.014	46820.808
22.249	42485.558
23.381	58092.494
23.507	47687.838
24.666	39884.418
25.424	80635.819
25.998	80635.819
27.003	106647.411
27.361	95375.724
28.155	104046.223
28.472	128323.705
28.994	174277.435
29.216	181213.872
30.399	151734.109
30.811	93641.615
32.115	259248.551
33.294	133525.986
33.911	296531.781
34.053	273121.378
34.147	191618.480
34.697	212427.743
35.877	286127.126];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
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
metaData.links.id_CoL = '79ZS4'; % Cat of Life
metaData.links.id_ITIS = '166717'; % ITIS
metaData.links.id_EoL = '46568134'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_elongatus'; % ADW
metaData.links.id_Taxo = '187267'; % Taxonomicon
metaData.links.id_WoRMS = '274788'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-elongatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_elongatus}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_saxicola
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_saxicola'; 
metaData.species_en = 'Stripetail rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.5); % K, body temp
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

data.am = 38*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 38;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 16.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 761;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 230e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(6.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
1.313	9.984
2.208	11.310
3.215	12.930
4.167	14.257
5.115	16.390
6.130	15.957
7.251	17.138
8.092	17.804
8.987	19.350
10.225	19.138
11.001	22.224
12.072	21.865
13.084	21.871
14.034	23.858
15.100	24.452
16.115	24.019
17.010	25.272
17.910	25.498
18.981	24.991
19.934	25.878
20.889	26.251
21.898	27.138
22.864	24.797];
data.tL_f(:,1) = 365*(0.9+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(6.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.145	9.762
2.265	11.237
3.103	12.783
4.174	12.423
5.292	14.264
6.136	14.343];
data.tL_m(:,1) = 365*(0.9+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(6.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... length (cm), weight (g)
7.544	11.765
8.047	11.765
8.634	13.725
9.389	14.706
9.808	16.667
10.227	15.686
10.563	19.608
10.984	25.490
11.234	19.608
11.403	28.431
11.652	18.627
11.906	30.392
11.907	33.333
11.989	26.471
12.495	39.216
12.577	32.353
12.998	37.255
13.162	24.510
13.416	33.333
13.671	49.020
13.753	41.176
14.173	46.078
14.421	32.353
14.507	41.176
14.589	36.274
14.591	44.118
14.761	50.980
14.762	57.843
15.095	48.039
15.429	41.176
15.432	54.902
15.433	60.784
15.515	52.941
15.937	64.706
16.272	64.706
16.357	70.588
16.606	60.784
16.691	63.726
17.194	63.726
17.279	69.608
17.449	80.392
17.617	83.333
17.867	77.451
18.121	84.314
18.287	79.412
18.370	76.471
18.876	88.235
18.877	93.137
19.462	87.255
19.464	96.078
19.549	101.961
19.631	92.157
19.974	124.510
20.051	97.059
20.220	103.922
20.305	108.824
20.308	119.608
20.474	114.706
20.639	103.922
20.640	107.843
20.728	125.490
20.809	111.765
21.314	124.510
21.315	126.471
21.407	158.824
21.568	132.353
21.906	146.078
21.909	156.863
21.985	125.490
22.326	150.980
22.408	142.157
22.493	148.039
22.497	163.725
22.574	133.333
22.574	136.275
22.575	137.255
22.583	172.549
22.749	166.667
22.999	161.765
23.079	145.098
23.250	158.824
23.252	166.667
23.594	194.118
23.759	183.333
24.179	188.235
24.181	195.098
24.346	186.275
24.428	177.451
24.936	199.020
25.030	243.137
25.100	186.275
25.101	190.196
25.190	212.745
25.202	260.784
25.447	233.333
25.534	250.000
25.607	204.902
25.616	241.176
25.699	236.275
25.954	252.941
25.958	268.627
26.037	248.039
26.617	220.588
26.627	263.725
27.216	274.510
27.218	282.353
27.222	298.039
27.309	310.784
27.368	207.843
27.379	255.882
27.387	287.255
27.724	293.137
27.886	270.588
27.901	332.353
28.225	288.235
28.318	326.471
28.554	262.745
29.733	285.294];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'LoveMorr1990';
%
data.LW_m = [ ... length (cm), weight (g)
6.323	9.235
7.333	7.298
7.389	8.086
8.117	7.715
8.171	10.272
8.507	11.069
8.676	9.697
8.898	12.457
9.121	13.840
9.232	15.023
9.290	12.468
9.622	17.590
9.625	14.444
9.735	16.414
9.736	15.431
9.793	14.056
9.794	13.270
10.015	16.422
10.015	16.226
10.125	18.588
10.183	17.017
10.346	22.724
10.353	14.269
10.403	21.743
10.404	20.956
10.405	18.793
10.519	16.634
10.519	16.634
10.574	18.012
10.684	20.768
10.739	22.146
10.906	22.937
10.909	19.201
10.966	18.220
10.966	17.827
11.017	24.710
11.073	24.319
11.134	19.011
11.186	22.946
11.187	22.356
11.464	26.493
11.522	23.349
11.690	23.354
11.742	29.254
11.857	25.325
11.913	24.540
11.915	22.770
12.080	25.921
12.132	31.429
12.249	25.533
12.469	30.455
12.524	31.440
12.528	26.721
12.641	25.348
12.752	27.318
12.806	28.892
12.913	34.991
12.973	30.470
13.026	34.208
13.031	28.309
13.197	30.280
13.419	33.433
13.921	36.200
14.032	37.973
14.088	37.582
14.090	35.222
14.147	34.241
14.199	39.158
14.205	31.686
14.252	42.109
14.257	36.407
14.480	37.593
14.531	43.690
14.532	43.100
14.536	37.988
14.702	40.353
14.980	43.507
15.697	56.899
16.250	65.960
16.251	65.174
16.588	63.217
16.979	64.802
16.980	64.212];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight' , 'males'};  
bibkey.LW_m = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
10.495	6815.672
10.749	3587.079
11.613	7173.009
12.391	10360.106
12.734	9541.736
12.739	13966.785
13.167	12340.396
13.512	13533.393
14.457	12690.795
15.498	20292.589
16.704	22255.588
17.749	33880.184
18.784	36654.638
19.634	28574.476
20.480	87678.353
21.752	73144.440
21.757	77167.220
22.881	82754.188
22.890	90397.479
23.686	108066.640
23.850	102025.532
24.000	83916.063
25.109	77032.357
25.116	83066.549];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(6.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79ZRV'; % Cat of Life
metaData.links.id_ITIS = '166741'; % ITIS
metaData.links.id_EoL = '46568191'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_saxicola'; % ADW
metaData.links.id_Taxo = '187330'; % Taxonomicon
metaData.links.id_WoRMS = '274848'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-saxicola'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-saxicola.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

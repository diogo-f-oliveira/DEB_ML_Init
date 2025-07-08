function [data, auxData, metaData, txtData, weights] = mydata_Rhombosolea_tapirina

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Rhombosolea_tapirina'; 
metaData.species_en = 'Greenback flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.6); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 06];

%% set data
% zero-variate data
data.ab = 7.5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(16.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'SuttMacG2010';  
  temp.am = C2K(16.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'Earl2014';
data.Li = 45;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 3.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Earl2014';
  comment.Wwb = 'based on egg diameter of 0.89 mm: pi/6*0.089^3';
data.Wwp = 133;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','Earl2014'};  
  comment.Wwp = 'based on 0.01820*Lp^2.97, see F1';
data.Wwi = 1480; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01820*Li^2.97, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
    1 NaN  23.2
    2 30.2 28.7
    3 35.9 34.3
    4 38.2 36.0
    5 46.3 40.0
    6 49.0 NaN
   10 50.0 NaN];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)+0.8); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(16.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SuttMacG2010'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
26.954	270.100
27.111	304.906
27.258	270.147
27.358	254.703
27.512	270.186
27.820	301.151
28.020	274.129
28.327	301.230
28.530	301.261
28.887	312.910
28.939	328.378
29.187	282.039
29.197	359.335
29.296	340.027
29.395	324.583
29.445	316.862
29.604	370.992
29.750	324.638
29.804	347.835
30.060	367.198
30.153	305.377
30.213	378.816
30.266	390.418
30.470	405.909
30.517	371.133
30.624	413.662
30.827	421.423
30.922	367.331
30.978	409.852
31.327	359.664
31.485	406.066
31.640	433.143
31.940	394.542
31.993	413.874
31.994	421.603
31.996	437.063
32.093	406.160
32.200	448.688
32.356	479.630
32.405	464.179
32.500	417.817
32.702	406.254
32.710	471.956
32.860	456.520
33.017	491.327
33.064	464.281
33.218	479.764
33.478	530.045
33.577	514.602
33.582	553.250
33.821	437.345
33.982	503.070
33.985	526.259
34.284	487.658
34.603	603.649
34.841	480.015
35.358	557.389
35.362	588.308
35.864	549.738
35.873	623.169
36.133	673.451
36.221	569.117
36.331	630.969
36.540	685.108
36.744	692.869
36.798	719.931
36.941	642.658
37.044	661.998
37.238	592.462
37.761	712.350
37.795	580.954
38.408	615.832
38.581	782.042
38.726	727.958
39.020	642.979
39.276	666.207
39.442	774.446
39.730	646.954
49.380	1162.455];
units.LW_f = {'d', 'cm'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'SuttMacG2010'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
24.544	180.925
24.544	169.387
24.696	192.487
25.558	173.389
25.761	234.959
25.761	188.805
26.166	204.252
26.217	246.567
26.471	246.606
26.572	281.237
26.623	215.860
26.826	265.892
26.826	227.430
26.978	219.761
27.028	265.923
27.282	285.193
27.434	235.216
27.586	273.701
27.637	277.555
27.688	242.947
27.840	231.432
27.941	285.294
28.043	258.387
28.093	269.933
28.195	277.641
28.245	296.879
28.398	269.980
28.499	308.457
28.550	289.234
28.600	320.011
28.600	239.242
28.702	308.488
28.854	273.896
28.854	246.973
29.006	308.535
29.006	273.919
29.158	258.558
29.310	300.889
29.310	312.428
29.361	335.512
29.361	354.743
29.564	339.390
29.615	285.552
29.615	324.013
29.817	304.813
29.919	335.598
30.071	339.468
30.122	320.245
30.172	301.022
30.223	358.722
30.274	343.345
30.477	335.684
30.527	366.461
30.680	351.100
30.730	362.646
30.730	324.185
30.984	312.685
31.034	358.847
31.136	297.324
31.187	343.486
31.237	331.955
31.237	351.186
31.389	374.286
31.440	412.755
31.491	381.994
31.592	339.702
31.694	416.641
31.694	347.410
31.795	347.425
31.846	362.818
31.947	416.680
32.049	405.157
32.201	374.411
32.505	401.381
32.606	401.396
32.708	378.335
32.911	420.674
33.012	405.305
33.063	370.697
33.316	382.275
33.976	440.069
34.026	474.692
34.026	416.999
34.178	482.407
34.432	420.908
34.533	451.693
34.533	509.385
34.736	428.647
34.838	447.894
35.142	424.863
35.446	474.910
35.548	494.157
35.649	463.403
35.700	524.949
35.903	478.827
36.156	532.712
36.207	494.258
36.511	521.228
37.525	648.307
37.525	509.845
37.880	586.823
38.032	494.539
40.669	821.868];
units.LW_m = {'d', 'cm'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'SuttMacG2010'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
20.095	5327.106
20.285	16261.690
20.501	5607.479
21.165	3925.241
21.270	18224.301
21.400	9813.093
21.934	16261.690
22.124	28878.513
22.189	22429.915
22.595	28598.140
22.746	21869.160
22.958	32803.744
24.308	21308.414
24.395	14018.697
24.562	40934.589
24.563	31962.625
24.692	31962.625
24.840	42336.454
24.947	39532.715
25.310	43457.946
25.715	54392.531
26.318	35327.110
27.000	50467.299
27.407	47943.933
27.495	37009.348
28.285	44579.448
28.649	47383.187
28.711	57196.270
28.973	27476.638
29.096	56635.524
29.142	38411.223
29.315	30841.124
29.352	64485.987
29.439	55233.650
29.519	88878.508
29.757	71775.703
29.823	64485.987
29.829	30560.751
30.125	51028.045
30.211	48504.679
30.291	81028.041
30.618	42897.200
30.701	60000.009
30.872	62803.749
31.127	70093.461
31.316	92242.993
31.731	45420.567
32.029	54112.158
32.580	86915.892
32.642	97009.348
34.994	113271.032];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(16.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Earl2014'; 
comment.LN = 'Data from Estuary and Noth Coorong';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lp = 3 * weights.Lp;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01820*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WW8D'; % Cat of Life
metaData.links.id_ITIS = '172956'; % ITIS
metaData.links.id_EoL = '46570233'; % Ency of Life
metaData.links.id_Wiki = 'Rhombosolea_tapirina'; % Wikipedia
metaData.links.id_ADW = 'Rhombosolea_tapirina'; % ADW
metaData.links.id_Taxo = '186087'; % Taxonomicon
metaData.links.id_WoRMS = '282603'; % WoRMS
metaData.links.id_fishbase = 'Rhombosolea-tapirina'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhombosolea_tapirina}}';
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
bibkey = 'SuttMacG2010'; type = 'techreport'; bib = [ ...
'author = {Sutton, C.P. and D.J. MacGibbon and D.W. Dtevens}, ' ...
'year   = {2010}, ' ...
'title  = {Age and growth of greenback flounder (\emph{Rhombosolea tapirina} from southern {N}ew {Z}ealand}, ' ... 
'institution = {N.Z. Fish. Assess.Rep.}, ' ...
'volume = {48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Earl2014'; type = 'phdthesis'; bib = [ ...
'author = {Jason Earl,}, ' ...
'year   = {2014}, ' ...
'title  = {Population biology and ecology of the greenback flounder (\emph{Rhombosolea tapirina}) in the {C}oorong estuary, {S}outh {A}ustralia }, ' ... 
'school = {School of Biological Sciences, Flinders University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhombosolea-tapirina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

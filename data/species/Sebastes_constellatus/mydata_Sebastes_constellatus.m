function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_constellatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_constellatus'; 
metaData.species_en = 'Starry rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.1); % K, body temp
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

data.am = 32*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(12.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 46;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 196;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 1.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 230e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(12.1);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
4.051	16.570
5.002	16.235
5.955	17.226
7.935	19.762
9.110	22.743
10.062	23.071
11.090	25.279
11.897	26.824
13.215	27.040
13.875	28.254
14.975	29.687
15.933	33.774
17.026	31.006
18.052	31.776
18.930	31.884
20.028	32.433
20.837	34.862
22.006	33.642
23.030	33.195
24.129	34.297
25.014	38.827
26.107	35.838
27.060	36.608
28.020	42.575];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(12.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.024	14.584
4.120	13.585
5.003	16.788
6.027	16.895
6.912	20.872
8.155	20.093
8.965	23.739
10.064	24.066
10.798	25.943
12.042	25.939
13.143	28.146
13.878	30.244
14.903	30.461
15.854	30.458
16.951	30.122
17.903	30.561
19.008	34.758
20.028	32.433
20.978	31.434
22.005	33.089
22.739	34.523
23.907	32.971
24.936	35.621
26.027	31.858];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(12.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... length (cm), weight (g)
12.248	24.883
13.798	32.855
13.953	40.647
14.729	32.976
15.194	33.036
15.194	48.580
15.349	35.647
15.969	33.137
16.124	48.701
16.744	48.781
17.209	56.613
17.364	69.587
18.760	56.814
18.760	64.586
18.915	72.378
19.535	64.687
20.000	77.700
20.000	90.653
20.930	103.727
21.240	114.130
21.395	85.653
22.016	124.593
22.171	114.251
22.326	101.317
23.411	132.546
23.566	155.882
23.721	119.633
23.876	142.969
24.186	145.600
24.806	130.136
24.806	163.815
24.806	192.312
24.806	213.038
24.961	205.286
26.047	184.701
26.047	200.245
26.047	231.333
26.202	31.871
26.822	189.983
26.977	291.039
27.132	270.334
27.132	252.199
27.132	234.064
27.132	226.292
27.132	208.158
27.132	182.251
27.287	314.395
28.062	241.957
28.062	262.682
28.217	283.428
28.372	200.546
28.527	293.831
28.682	226.493
28.992	236.896
29.612	314.697
29.612	296.562
29.612	265.474
29.612	260.292
29.612	260.292
29.767	343.214
29.767	236.996
30.543	325.180
30.543	348.496
30.698	286.340
30.698	314.837
30.853	268.225
30.853	273.406
30.853	366.671
30.853	377.033
30.853	395.168
31.628	379.724
31.938	436.759
31.938	340.905
32.093	353.878
32.093	299.474
32.248	410.893
32.248	473.069
32.248	325.401
32.248	315.038
33.023	400.631
33.023	467.988
33.023	475.760
33.023	488.714
33.023	164.879
33.178	338.475
33.178	348.837
33.178	369.563
33.178	387.697
33.178	429.148
33.178	449.873
33.178	576.816
33.178	183.034
33.488	530.225
33.488	553.541
33.798	380.006
33.953	504.378
33.953	426.658
34.109	465.538
34.264	558.822
34.264	540.688
34.264	522.553
34.264	442.242
34.264	405.973
34.419	613.247
34.574	571.816
34.574	398.241
34.574	372.334
34.729	595.152
34.729	494.116
35.194	488.995
35.349	411.295
35.349	465.699
35.349	473.471
35.349	499.377
35.349	509.740
35.349	530.466
35.349	553.782
35.349	564.144
35.504	354.320
35.504	390.589
35.504	447.584
35.504	520.123
35.659	574.547
35.659	595.273
35.659	613.407
35.659	618.589
35.659	657.449
35.969	553.862
35.969	693.758
36.279	590.172
36.434	634.233
36.434	595.373
36.434	585.010
36.744	792.304
36.744	683.496
36.744	667.952
36.744	618.729
36.744	522.874
36.744	507.330
36.744	411.475
36.744	318.211
36.899	652.428
36.899	476.262
37.054	696.490
37.054	535.868
37.054	434.832
37.054	292.344
37.829	523.015
37.829	556.694
37.829	494.517
37.984	595.574
37.984	616.299
37.984	735.470
37.984	774.330
37.984	789.874
37.984	541.170
38.140	751.034
38.140	763.988
38.140	808.029
38.450	637.085
38.450	650.038
38.450	683.717
38.605	668.193
38.605	694.100
38.605	712.234
38.915	681.186
38.915	634.554
38.915	619.010
39.070	743.383
39.070	712.295
39.070	676.025
39.070	665.663
39.225	834.076
39.225	810.760
39.225	795.216
39.225	792.626
39.225	771.900
39.225	738.221
39.225	696.771
39.225	683.817
39.225	657.911
39.225	644.957
39.380	753.786
39.380	603.527
39.535	870.386
40.310	715.046
40.465	779.833
40.465	797.968
40.620	704.723
40.620	769.490
40.775	756.557
40.775	816.143
40.930	730.670
41.550	976.865
42.636	818.974
42.791	974.435
42.791	837.129
42.946	800.880
43.566	357.955
44.341	855.465
45.271	555.067
55.814	657.469
56.124	683.416];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
24.262	34156.983
24.599	55232.570
25.490	127906.976
25.524	55959.317
25.865	67587.220
28.043	108284.882
28.165	93750.012
28.979	83575.582
29.781	98837.218
30.137	79215.123
30.472	105377.916
30.790	166424.418
30.799	147529.070
31.251	171511.633
32.057	177325.585
32.401	183139.536
32.496	228924.423
32.640	165697.671
33.296	247819.766
34.468	213662.797];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(12.1);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
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
metaData.links.id_CoL = '4W7LJ'; % Cat of Life
metaData.links.id_ITIS = '166749'; % ITIS
metaData.links.id_EoL = '46568129'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_constellatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_constellatus'; % ADW
metaData.links.id_Taxo = '187262'; % Taxonomicon
metaData.links.id_WoRMS = '274783'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_constellatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_constellatus}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-constellatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

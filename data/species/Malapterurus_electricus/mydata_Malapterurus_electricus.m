  function [data, auxData, metaData, txtData, weights] = mydata_Malapterurus_electricus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Malapteruridae';
metaData.species    = 'Malapterurus_electricus'; 
metaData.species_en = 'Electric catfish'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww';'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 04];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'GarbArom2006';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'GarbArom2006';
data.Li = 122;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.18;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 7 mm: pi/6*0.7^3';
data.Wwp = 52.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01122*Lp^2.96, see F1';
data.Wwi = 20e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 20 kg; based on 0.01122*Li^2.96, see F1; Wiki gives 16.8 kg';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1	23.667  238.098
    2	30.974  703.641
    3	37.100 1177.051
    4	42.960 1434.716
    5	47.500 1649.302
    6	50.986 1816.812];
data.tLW(:,1) = (data.tLW(:,1) + 0.2) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'length', 'weight'};  
temp.tLW = C2K(28);  units.temp.tLW = 'K'; label.temp.tL_OA = 'temperature';
  treat.tLW = {1, {'total length','weight'}};
bibkey.tLW = 'GarbArom2006';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
23.889	256.960
24.426	306.940
24.427	194.674
25.624	307.127
26.945	400.888
27.112	301.122
27.152	375.972
27.482	382.260
27.525	319.897
27.936	432.227
28.062	288.796
28.103	357.409
28.143	419.786
28.431	488.438
28.432	426.068
28.639	426.100
28.721	476.009
28.722	357.506
28.887	382.480
28.969	432.389
29.009	550.898
29.383	413.742
29.506	438.709
29.547	507.322
29.673	370.128
29.836	501.131
29.837	432.524
29.880	326.501
30.040	675.799
30.208	494.952
30.209	426.345
30.621	538.675
30.622	482.542
30.745	532.457
30.913	345.373
30.988	856.820
30.991	632.288
30.994	470.126
30.994	413.993
31.241	488.876
31.447	557.515
31.488	607.417
31.570	644.852
31.653	632.391
31.696	470.236
31.819	520.151
31.821	432.833
31.860	582.527
31.905	326.817
32.150	532.676
32.190	588.816
32.436	726.068
32.439	507.773
32.645	576.413
32.726	669.980
32.811	507.831
32.892	613.873
33.055	838.431
33.061	389.367
33.181	694.999
33.182	576.497
33.305	670.071
33.345	738.684
33.389	545.344
33.594	663.879
33.636	607.752
33.720	539.158
34.048	726.320
34.091	607.823
34.092	539.216
34.092	508.031
34.296	751.306
34.338	657.758
34.422	576.690
34.422	539.268
34.584	813.721
34.668	713.942
34.791	757.621
34.795	520.615
34.834	657.835
34.873	795.055
34.960	489.456
35.041	614.208
35.080	782.614
35.204	807.581
35.206	676.604
35.246	738.980
35.372	589.312
35.410	832.561
35.616	901.200
35.619	701.617
35.661	639.253
35.783	782.723
35.822	963.602
35.906	838.875
36.031	739.103
36.114	695.457
36.195	882.579
36.241	477.181
36.277	926.251
36.320	782.807
36.321	726.674
36.402	845.190
36.405	626.895
36.566	938.770
36.567	820.268
36.775	757.930
36.814	901.387
36.894	1069.799
36.980	870.228
36.982	708.066
37.019	1026.159
37.061	951.322
37.063	832.819
37.147	757.988
37.186	920.156
37.270	826.614
37.395	708.131
37.432	1057.409
37.558	889.029
37.645	558.481
37.763	976.379
37.766	814.217
37.928	1032.538
37.933	664.555
37.935	552.290
38.013	889.100
38.219	926.554
38.259	1038.826
38.381	1151.112
38.384	951.528
38.384	932.817
38.385	845.499
38.426	876.690
38.629	1126.202
38.671	1076.313
38.676	702.093
38.755	1007.719
38.797	914.170
38.801	639.743
38.838	951.599
38.963	876.774
39.043	1070.134
39.046	833.128
39.131	708.401
39.292	1014.040
39.334	926.728
39.373	1126.318
39.412	1307.198
39.455	1176.227
39.459	914.274
39.582	976.663
39.665	939.254
39.746	1076.480
39.828	1120.152
39.909	1182.535
39.953	1032.854
39.955	895.640
40.117	1126.434
40.121	845.770
40.160	964.279
40.239	1257.431
40.284	995.483
40.321	1332.287
40.405	1176.375
40.490	1032.937
40.570	1226.297
40.613	1101.564
40.695	1170.183
40.821	1020.515
40.946	920.743
40.987	958.171
40.988	852.142
41.026	1139.050
41.066	1245.085
41.068	1076.686
41.106	1307.462
41.438	1195.247
41.522	1095.468
41.603	1263.880
41.604	1164.088
41.604	1151.614
41.729	1070.553
41.768	1276.380
41.852	1182.838
41.933	1301.354
41.973	1345.019
42.017	1201.575
42.141	1157.935
42.142	1064.380
42.305	1295.175
42.388	1245.292
42.476	827.426
42.514	1108.097
42.549	1557.167
42.676	1332.655
42.677	1264.048
42.758	1401.274
42.761	1151.795
42.802	1189.223
43.004	1507.342
43.010	1076.989
43.049	1276.580
43.421	1232.979
43.457	1613.442
43.460	1445.043
43.461	1307.829
43.669	1220.543
43.830	1538.656
43.838	996.037
43.910	1719.541
43.955	1445.120
44.000	1239.306
44.080	1376.533
44.203	1463.870
44.285	1513.779
44.331	1164.513
44.452	1401.539
44.494	1364.123
44.533	1532.528
44.539	1039.806
44.573	1613.616
44.741	1445.243
44.902	1732.170
44.903	1676.037
44.986	1588.732
45.025	1782.085
45.029	1495.184
45.481	1682.364
45.611	1264.505
45.646	1732.286
45.692	1376.784
45.900	1233.365
46.016	1819.662
46.062	1476.634
46.105	1376.848
46.186	1495.364
46.431	1694.987
46.558	1526.607
46.967	1813.573
47.092	1757.459
47.092	1701.327
47.382	1707.609
47.382	1670.187
47.504	1801.183
47.790	2019.523
48.040	1876.111
48.041	1813.741
48.330	1863.682
48.376	1476.995
48.458	1576.799
48.497	1714.020
48.945	2225.524
49.196	1963.609
49.811	2350.399
49.855	2119.637
49.858	1901.342
50.028	1545.859
50.473	2294.369
50.523	1670.676
50.602	1888.984
50.925	2475.313
51.388	1820.500
51.416	2781.003
51.427	2001.379
51.466	2176.021
51.511	1901.600];
units.LW = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'GarbArom2006';
comment.LW = 'sexes combined';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
  108.2 1548
  125.9 2148
  138.2 2135
  132.6 2100
  141.0  902
  184.9 2102
  269.0 4003
  369.5 3710
14850  23000]; % from Matthes 1964 
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(28);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'MokhElFa2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;
weights.Wwb = weights.Wwb * 3;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'LW data are inconsistent with weights from fishbase';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.93 * TL from photo'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3XM28'; % Cat of Life
metaData.links.id_ITIS = '164142'; % ITIS
metaData.links.id_EoL = '212707'; % Ency of Life
metaData.links.id_Wiki = 'Malapterurus_electricus'; % Wikipedia
metaData.links.id_ADW = 'Malapterurus_electricus'; % ADW
metaData.links.id_Taxo = '44080'; % Taxonomicon
metaData.links.id_WoRMS = '1023004'; % WoRMS
metaData.links.id_fishbase = 'Malapterurus-electricus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Malapterurus_electricus}}';  
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
bibkey = 'MokhElFa2023'; type = 'Article'; bib = [ ...
'author = {Islam Z. Mokhtar and Alaa M. El-Far and Alaa M. Younis and Khaled Y. AbouelFadl}, ' ...
'year = {2023}, ' ...
'title = {Age, growth and sex ratio of the Catfish \emph{Malapterurus electricus} ({G}melin, 1789) from the {L}arge {R}eservoir, {L}ake {N}asser, {E}gypt}, ' ... 
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {27(4)}, '...
'pages = {277-293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GarbArom2006'; type = 'proceedings'; bib = [ ...
'author = {Garba, O.F. and Arome, A.G.}, ' ...
'year = {2006}, ' ...
'title = {Growth, reproduction and feeding biology of \emph{Malapterurus electricus} ({G}melln,1789) in lower {B}enue {R}iver, {N}igeria}, ' ... 
'organization = {21st Annual Conference of the Fisheries Society of Nigeria (FISON)}, ' ...
'pages = {117-128}, ' ...
'howpublished = {\url{https://aquadocs.org/handle/1834/37733}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Malapterurus-electricus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


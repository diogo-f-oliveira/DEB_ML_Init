function [data, auxData, metaData, txtData, weights] = mydata_Auxis_thazard
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Auxis_thazard'; 
metaData.species_en = 'Frigate tuna'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 04];

%% set data
% zero-variate data

data.ab = 3;        units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 65;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05 mm of Scomber japonicus: pi/6*0.105^3';
data.Wwp = 318;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 3.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1; max published weight 1.7 kg';

data.Ri  = 1.37e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
 temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.982	34.836
0.988	30.820
0.989	31.550
0.992	32.097
0.993	33.193
0.994	33.923
0.995	34.166
1.000	28.081
1.001	28.994
1.002	29.724
1.006	28.324
1.007	30.454
1.008	32.645
1.976	34.824
1.982	35.493
1.986	42.491
1.987	42.187
1.988	40.057
1.989	37.562
1.990	36.893
1.991	36.771
1.992	38.353
1.993	36.588
2.000	41.091
2.001	40.665
2.006	41.517
2.012	41.760
2.013	39.691
2.018	42.917
3.000	42.844
3.001	40.166
3.002	39.558
3.006	43.635
3.007	42.174
3.008	41.444
3.009	40.775
3.010	39.679
4.024	42.953];
data.tL_f(:,1) = 365*(0.4+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'VieiCost2022'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.982	31.672
0.988	33.923
0.989	33.375
0.994	30.637
0.995	30.333
1.000	32.584
1.006	31.063
1.007	28.933
1.008	30.089
1.018	34.409
1.970	42.187
1.988	42.430
1.994	43.160
1.995	42.673
2.000	41.517
2.001	37.683
2.018	35.188
2.024	34.215
2.025	34.762
2.988	39.680
2.994	43.696
2.995	42.540
2.996	40.045
3.006	41.140
3.007	40.836
3.024	36.941
4.012	43.623
4.024	44.353];
data.tL_m(:,1) = 365*(0.4+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'VieiCost2022'; 

% length-weight
data.LW_f = [ ... % fork length (cm), weight (g)
26.858	293.487
27.278	313.714
28.349	409.556
28.539	334.151
29.005	384.570
29.516	445.061
29.519	384.699
29.613	364.603
29.798	404.891
30.170	465.346
30.354	535.815
30.544	460.410
30.632	606.308
30.636	495.645
30.919	425.293
31.054	561.142
31.150	490.744
31.567	581.392
31.989	551.317
32.171	687.177
32.458	506.163
32.548	601.759
32.830	556.558
33.012	672.299
33.290	737.761
33.483	596.964
33.759	712.728
33.901	652.401
34.505	753.157
34.602	662.638
34.605	572.095
34.927	713.022
35.157	803.623
35.248	864.008
35.440	748.362
35.621	894.283
35.769	678.022
36.184	824.002
36.228	904.496
36.280	768.694
36.422	708.367
36.508	909.596
36.650	864.360
36.880	975.082
37.025	824.213
37.394	960.121
37.770	919.974
37.818	869.684
37.904	1080.974
38.048	975.376
38.099	844.604
38.466	1045.903
38.469	950.331
39.265	905.260
39.400	1061.229
39.403	975.717
39.682	1000.938
39.724	1131.733
40.095	1207.279
40.237	1151.983
40.523	1021.270
40.799	1132.003
41.260	1313.206
41.682	1257.980
42.012	1187.641
42.056	1248.014
42.187	1494.526
42.327	1519.712
42.470	1444.295
42.519	1368.855
42.662	1303.498
43.260	1560.188
43.447	1540.114
43.591	1434.517
43.824	1459.726
43.967	1399.400
44.155	1354.175
44.569	1540.396
44.754	1585.715
45.084	1500.284
45.126	1641.140
47.505	1742.342
47.734	1878.214
49.373	1767.963];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'fork length', 'weight', 'females'};  
bibkey.LW_f = 'VieiCost2022'; 
%
data.LW_m = [ ... % fork length (cm), weight (g)
26.531	288.375
27.652	318.838
28.072	329.004
28.303	399.484
28.352	344.165
28.956	434.860
29.099	359.443
29.470	440.019
29.659	379.705
29.845	399.872
29.935	495.468
30.078	420.052
30.450	460.387
30.683	495.656
30.732	435.306
30.964	470.576
31.289	525.990
31.525	455.627
31.663	521.054
31.898	485.902
32.082	556.370
32.266	646.960
32.549	576.609
32.550	536.367
32.922	591.793
33.106	672.322
33.295	617.038
33.484	546.663
33.619	702.632
33.669	602.041
33.808	647.348
33.897	758.034
34.229	632.363
34.410	798.405
34.461	672.663
34.598	753.180
34.692	733.083
34.877	808.582
35.111	778.460
35.343	833.850
35.394	713.139
35.579	768.517
35.768	708.203
35.952	798.792
36.042	889.358
36.327	753.615
36.371	834.109
36.604	844.228
36.699	798.980
37.068	924.828
37.165	849.399
37.953	1000.503
38.184	1086.074
38.608	995.637
39.629	1187.041
39.725	1106.583
39.867	1066.377
40.381	1071.536
40.564	1167.156
40.793	1282.908
40.936	1217.551
41.537	1393.758
41.727	1298.233
42.057	1237.954
42.149	1268.158
42.193	1343.622
42.430	1258.168
42.472	1388.963
42.796	1464.498
42.848	1328.696
42.988	1323.701
43.308	1524.989
43.406	1389.199
43.724	1635.757
43.730	1474.793
43.828	1369.184
44.293	1424.633
44.332	1615.789
44.523	1505.174
44.985	1661.225
45.169	1721.634
49.091	1828.254];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'fork length', 'weight', 'males'};  
bibkey.LW_m = 'VieiCost2022'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

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

%% Facts
F1 = 'weight-length relationship: W in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'K285'; % Cat of Life
metaData.links.id_ITIS = '172456'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Auxis_thazard'; % Wikipedia
metaData.links.id_ADW = 'Auxis_thazard'; % ADW
metaData.links.id_Taxo = '46675'; % Taxonomicon
metaData.links.id_WoRMS = '127016'; % WoRMS
metaData.links.id_fishbase = 'Auxis-thazard'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Auxis_thazard}}';
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
bibkey = 'VieiCost2022'; type = 'article'; bib = [ ... 
'doi = {10.1051/alr/2022010}, ' ...
'author = {Juliana M.S. Vieira and Paulo A.S. Costa and Adriana C. Braga and Ricardo R.B. S\~{a}o-Clemente and Carlos E.L. Ferreira and Jodir P. Silva}, ' ... 
'year = {2022}, ' ...
'title = {Age, growth and maturity of frigate tuna (\emph{Auxis thazard} {L}acep\`{e}de, 1800) in the {S}outheastern {B}razilian coast}, ' ...
'journal = {Aquat. Living Resour.}, ' ...
'volume = {35(11)}, ' ...
'pages = {1-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Auxis-thazard.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

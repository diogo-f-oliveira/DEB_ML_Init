  function [data, auxData, metaData, txtData, weights] = mydata_Serranus_atricauda
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Serranus_atricauda'; 
metaData.species_en = 'Blacktail comber'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 02];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(18.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 43;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on LW data';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'VillDiez2023';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 81;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 1100*(18/43)^3';
data.Wwi = 1100;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data; based on 0.00813*Li^3.09, see F1, gives 907 g';

data.GSI = 0.03; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Dules auriga';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.977	10.686
0.978	10.050
0.982	8.397
0.983	7.888
1.000	10.495
1.001	9.859
1.002	9.605
1.006	7.570
1.025	9.287
1.026	8.778
1.044	11.258
1.901	13.741
1.922	14.567
1.924	13.550
1.971	12.851
1.973	11.706
1.984	17.747
1.985	17.111
1.994	12.533
1.998	10.816
2.016	13.233
2.018	12.215
2.020	11.325
2.935	18.831
2.960	17.623
2.981	18.323
2.982	18.196
2.985	16.479
3.003	18.959
3.931	19.979
3.932	19.534
3.953	20.361
3.972	22.332
3.992	23.349
3.993	23.095
3.997	21.188
4.003	18.136
4.003	17.945
4.005	17.373
4.018	21.696
4.021	20.615
4.024	19.089
4.024	18.771
4.048	18.326
4.909	19.029
4.912	17.503
4.922	23.925
4.938	27.041
4.941	25.387
4.943	24.624
4.946	23.035
4.953	19.728
4.954	19.411
4.963	26.150
4.966	24.370
4.974	20.555
4.975	20.174
4.980	17.757
4.993	22.590
4.995	21.382
4.996	21.000
5.016	22.081
5.036	23.417
5.912	27.807
5.916	25.900
5.918	25.137
5.938	26.345
5.952	30.605
5.957	28.189
5.958	27.553
5.959	27.362
5.960	26.790
5.964	24.819
5.966	23.801
5.971	21.512
5.977	29.715
5.985	25.582
5.987	24.501
5.990	23.293
5.996	31.559
6.001	29.015
6.021	30.033
6.025	28.507
6.033	24.183
6.914	26.348
6.929	29.972
6.931	29.146
6.932	28.701
6.934	27.874
6.938	25.840
6.946	32.770
6.947	32.389
6.949	31.562
6.949	31.308
6.950	30.990
6.951	30.545
6.953	29.591
6.956	28.256
6.957	27.493
6.962	25.267
6.967	33.851
6.968	33.152
6.971	32.071
6.981	26.921
7.898	33.600
7.904	30.739
7.918	34.999
7.926	31.184
7.927	30.485
7.928	30.230
7.928	29.912
7.929	29.531
7.930	29.213
7.930	28.959
7.938	36.398
7.941	34.681
7.954	28.323
7.960	36.716
7.967	33.028
7.968	32.583
7.969	32.202
7.970	31.820
7.976	28.577
8.943	33.159
8.959	36.656
8.963	34.685
8.967	32.777
8.968	32.014
8.970	31.188
8.980	37.292
8.986	34.367
8.995	30.171
9.006	35.639
9.007	35.066
9.011	33.413
9.015	31.506
9.019	29.598
9.899	31.763
9.923	31.445
9.924	30.937
9.937	35.515
9.960	35.133
9.962	34.180
9.963	34.053
9.966	32.272
9.970	30.619
9.980	36.850
9.981	36.024
9.984	34.816
9.984	34.498
10.009	33.480
10.026	36.533
10.907	38.252
10.916	33.865
10.919	32.784
10.929	38.698
10.931	37.744
10.932	37.172
10.934	36.154
10.940	33.293
10.981	35.709
10.989	31.894
11.001	36.854
11.909	36.666
11.929	38.256
11.932	36.921
11.935	35.331
11.937	34.377
11.939	33.487
11.953	37.302
11.956	35.967
11.958	34.950
11.961	33.805
11.970	40.037
12.924	39.722
12.929	37.369
14.960	43.290
15.920	40.050]; 
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TuseGonz2004'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
15.689	51.940
16.158	55.522
17.144	59.104
17.378	59.104
17.519	55.522
17.801	78.806
18.176	80.597
18.223	66.269
18.223	64.478
18.551	98.507
18.645	85.970
18.645	71.642
19.021	93.134
19.021	82.388
19.161	91.343
19.255	87.761
19.302	103.881
19.537	94.925
19.818	103.881
19.818	94.925
20.100	89.552
20.100	80.597
20.287	91.343
20.334	107.463
20.381	120.000
20.616	125.373
20.616	85.970
20.663	107.463
20.710	91.343
20.850	98.507
20.991	116.418
21.226	121.791
21.413	103.881
21.507	121.791
21.836	128.955
21.836	143.284
21.836	155.821
21.883	116.418
21.977	120.000
22.070	103.881
22.305	143.284
22.446	134.328
22.540	128.955
22.587	128.955
22.633	175.522
22.727	146.866
23.009	141.493
23.103	168.358
23.150	161.194
23.290	182.687
23.337	143.284
23.384	154.030
23.572	170.149
23.760	141.493
23.853	198.806
23.994	170.149
24.276	170.149
24.370	155.821
24.463	173.731
24.463	197.015
24.604	145.075
24.745	186.269
24.792	211.343
24.839	236.418
25.167	234.627
25.167	175.522
25.402	198.806
25.496	195.224
25.496	238.209
25.543	227.463
25.589	218.507
25.683	207.761
25.918	209.552
26.152	231.045
26.199	261.492
26.293	259.701
26.340	238.209
26.434	252.537
26.434	218.507
26.528	245.373
26.575	223.881
26.669	234.627
26.762	232.836
26.856	247.164
26.997	261.492
27.044	248.955
27.326	229.254
27.372	257.910
27.372	241.791
27.560	265.075
27.654	245.373
27.748	297.313
27.795	317.015
27.889	325.970
27.889	299.104
27.889	261.492
28.029	270.448
28.123	320.597
28.217	304.478
28.217	286.567
28.264	238.209
28.358	274.030
28.405	308.060
28.452	331.343
28.452	308.060
28.499	275.821
28.639	300.895
28.686	288.358
28.733	342.089
28.733	352.836
28.733	259.701
28.827	313.433
28.968	282.985
29.015	272.239
29.062	309.851
29.062	329.552
29.109	358.209
29.296	282.985
29.343	347.463
29.343	365.373
29.390	345.672
29.484	299.104
29.484	322.388
29.672	358.209
29.718	309.851
29.859	349.254
29.906	354.627
30.000	401.194
30.000	356.418
30.000	340.298
30.047	333.134
30.141	415.522
30.282	426.269
30.328	370.746
30.469	352.836
30.516	363.582
30.610	406.567
30.704	385.075
30.704	282.985
30.751	317.015
30.798	408.358
30.798	413.731
30.891	438.806
31.032	429.851
31.079	386.866
31.126	374.328
31.220	399.403
31.267	352.836
31.267	417.313
31.314	428.060
31.455	454.925
31.548	388.657
31.548	411.940
31.595	367.164
31.689	454.925
31.830	368.955
31.924	476.418
32.018	360.000
32.065	444.179
32.111	444.179
32.158	431.642
32.252	465.672
32.346	428.060
32.440	492.537
32.440	463.881
32.440	419.104
32.628	451.343
32.721	478.209
32.815	503.284
32.862	531.940
32.956	438.806
33.003	505.075
33.050	564.179
33.050	522.985
33.050	460.299
33.097	488.955
33.191	480.000
33.238	569.552
33.284	488.955
33.378	549.851
33.378	537.313
33.378	501.493
33.378	453.134
33.519	471.045
33.566	530.149
33.566	521.194
33.613	558.806
33.613	483.582
33.707	515.821
33.754	521.194
33.801	587.463
33.848	553.433
33.848	490.746
33.988	642.985
33.988	539.104
34.317	634.030
34.317	583.881
34.364	557.015
34.411	524.776
34.457	594.627
34.457	567.761
34.504	600.000
34.551	585.672
34.598	540.896
34.598	506.866
34.692	506.866
34.739	617.910
34.786	634.030
34.880	542.687
34.927	605.373
34.927	564.179
34.974	642.985
35.021	574.925
35.255	660.895
35.255	612.537
35.255	539.104
35.396	539.104
35.677	698.507
35.677	646.567
35.771	612.537
35.818	659.104
35.912	669.851
35.912	587.463
36.053	675.224
36.100	678.806
36.147	630.448
36.147	623.284
36.194	660.895
36.522	635.821
36.522	642.985
36.569	673.433
36.569	626.866
36.616	754.030
36.710	657.313
36.804	739.701
36.804	721.791
36.804	680.597
36.850	598.209
36.991	800.597
37.038	757.612
37.226	678.806
37.320	714.627
37.367	736.119
37.413	752.239
37.554	714.627
37.554	657.313
37.930	728.955
37.977	694.925
38.023	890.149
38.305	673.433
38.540	745.075
38.727	865.075
38.727	831.045
39.243	838.209
39.666	911.642
39.853	918.806
39.853	900.896
40.604	951.045
40.651	1063.881
43.185	1106.866]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'TuseGonz2004'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Data Wwp and Wwi are ignored due to inconsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WWX8'; % Cat of Life
metaData.links.id_ITIS = '167864'; % ITIS
metaData.links.id_EoL = '46579256'; % Ency of Life
metaData.links.id_Wiki = 'Serranus'; % Wikipedia
metaData.links.id_ADW = 'Serranus_atricauda'; % ADW
metaData.links.id_Taxo = '187449'; % Taxonomicon
metaData.links.id_WoRMS = '127040'; % WoRMS
metaData.links.id_fishbase = 'Serranus-atricauda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Serranus_atricauda}}';  
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
bibkey = 'RovaCard2017'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.13390}, ' ...
'author = {Rovani, A. T. and Cardoso, L. G.}, ' ... 
'year = {2017}, ' ...
'title = {Life history and initial assessment of fishing impacts on the by-catch species \emph{Dules auriga} ({T}eleostei: {S}erranidae) in southern {B}razil}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {91(3)}, ' ...
'pages = {896–911}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TuseGonz2004'; type = 'article'; bib = [ ... 
'doi = {10.1643/i2022058}, ' ...
'author = {Víctor M. Tuset and Jos\''{e} A. Gonz\''{a}lez and Ignacio J. Lozano and M. Mercedes Garc\''{i}a-D\''{i}az}, ' ... 
'year = {2004}, ' ...
'title = {AGE AND GROWTH OF THE BLACKTAIL COMBER, \emph{Serranus atricauda} ({S}ERRANIDAE), OFF THE {C}ANARY {I}SLANDS ({C}ENTRAL-{E}ASTERN {A}TLANTIC)}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'volume = {74(1)}, ' ...
'pages = {53–68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Serranus-atricauda.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


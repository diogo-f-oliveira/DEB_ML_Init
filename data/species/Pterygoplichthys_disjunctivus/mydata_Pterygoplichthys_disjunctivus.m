  function [data, auxData, metaData, txtData, weights] = mydata_Pterygoplichthys_disjunctivus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Loricariidae';
metaData.species    = 'Pterygoplichthys_disjunctivus'; 
metaData.species_en = 'Vermiculated sailfin catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 06];

%% set data
% zero-variate data
data.ab = 11.3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1.8 d till hatch: assumed: 9.5 d till start feeding';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'GibbKurt2013';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 31;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 591;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi = (31/70)^3*6.8e3';
data.Wwi = 6.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.94, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'GibbKurt2013';   
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (yr), std length (cm)
0.046	1.426
1.189	16.619
1.273	12.092
1.365	15.422
1.366	14.469
1.493	17.321
1.505	18.035
1.597	21.365
1.598	18.031
1.612	13.031
1.668	18.505
1.691	20.171
1.692	17.075
1.763	16.120
1.764	15.168
1.937	21.113
2.007	22.063
2.043	19.204
2.100	23.250
2.101	21.583
2.114	18.725
2.167	31.104
2.179	32.294
2.227	29.197
2.238	31.101
2.253	22.291
2.260	33.719
2.264	22.767
2.345	27.287
2.365	25.859
2.354	32.763
2.359	20.144
2.404	26.571
2.431	17.522
2.522	23.233
2.564	35.136
2.586	39.659
2.590	28.706
2.591	26.801
2.613	29.658
2.616	22.991
2.649	29.180
2.671	32.274
2.674	24.655
2.743	28.700
2.750	40.605
2.754	30.366
2.755	27.985
2.756	27.033
2.791	24.413
2.824	30.364
2.846	33.934
2.861	26.076
2.871	29.171
2.907	27.741
2.917	31.312
2.928	34.407
2.930	29.169
2.965	30.596
2.966	27.025
3.071	28.687
3.072	27.021
3.138	36.065
3.151	32.017
3.174	33.921
3.176	29.635
3.177	26.778
3.245	32.252
3.246	30.823
3.268	33.441
3.282	27.726
3.328	30.344
3.329	26.296
3.330	24.629
3.337	36.534
3.349	35.581
3.358	42.962
3.363	31.533
3.373	33.675
3.378	22.723
3.423	26.768
3.427	46.768
3.488	40.099
3.499	41.289
3.504	28.670
3.513	35.813
3.525	34.622
3.561	33.430
3.592	43.190
3.598	29.619
3.677	36.520
3.678	33.901
3.686	42.948
3.761	31.993
3.782	38.897
3.785	30.087
3.818	35.562
3.843	32.704
3.899	39.131
3.910	40.559
3.911	37.940
4.003	42.936
4.015	40.554
4.017	35.554
4.030	33.887
4.052	37.458
4.085	41.266
4.089	31.504
4.119	44.598
4.120	42.693
4.135	33.645
4.177	45.786
4.178	42.929
4.191	39.833
4.216	37.451
4.260	44.830
4.262	39.830
4.341	46.494
4.353	45.779
4.355	41.970
4.425	42.919
4.438	37.919
4.494	46.012
4.530	42.439
4.531	41.725
4.553	44.105
4.682	43.861
4.763	46.953
4.822	44.808
4.844	48.855
4.939	45.042
4.985	47.659
4.996	48.849
5.010	45.277
5.104	44.797
5.161	46.699];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
for i=2:size(data.tL(:,1),1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'GibbKurt2013';

% time-weight
data.tW = [ ... % time since hatch (yr), weight (cm)
1.205	169.548
1.240	29.231
1.299	354.900
1.335	68.617
1.547	113.729
1.594	231.667
1.594	141.843
1.618	57.654
1.677	226.131
1.689	147.545
1.772	102.710
1.937	209.532
2.008	254.510
2.020	147.855
2.091	232.131
2.114	265.838
2.114	299.522
2.126	170.410
2.209	810.488
2.220	636.464
2.256	703.865
2.256	265.970
2.268	209.841
2.280	760.028
2.339	400.785
2.350	821.848
2.350	198.690
2.362	350.281
2.445	120.182
2.480	423.373
2.539	311.148
2.610	440.337
2.610	474.021
2.622	1012.980
2.622	895.085
2.622	704.208
2.622	322.453
2.693	625.678
2.705	305.689
2.776	1091.720
2.776	631.369
2.776	614.527
2.776	378.737
2.787	485.415
2.846	681.961
2.858	726.885
2.858	816.710
2.858	418.113
2.882	603.398
2.906	519.210
2.929	895.372
2.941	524.857
2.965	603.476
2.965	541.721
3.012	637.204
3.024	457.566
3.024	698.969
3.035	418.279
3.035	732.665
3.118	569.935
3.130	423.981
3.201	996.679
3.224	704.771
3.224	491.438
3.236	749.695
3.236	626.186
3.260	643.050
3.272	766.570
3.283	800.265
3.283	536.406
3.295	519.574
3.343	1221.373
3.343	379.268
3.354	755.419
3.354	446.647
3.366	615.080
3.366	856.483
3.366	323.150
3.402	1013.709
3.461	457.975
3.484	929.576
3.520	1109.258
3.520	778.030
3.531	1137.339
3.531	952.076
3.531	598.392
3.543	862.263
3.614	1221.627
3.626	576.024
3.673	1187.998
3.709	817.505
3.720	1103.832
3.720	868.043
3.768	727.736
3.791	649.161
3.803	1025.313
3.874	907.484
3.874	1002.923
3.874	1165.730
3.886	761.531
3.957	1031.071
3.969	862.660
4.028	1081.663
4.028	744.821
4.039	980.622
4.063	879.591
4.087	795.403
4.110	924.548
4.122	1233.330
4.122	1205.260
4.134	1109.833
4.146	761.774
4.193	1171.643
4.205	1244.636
4.205	1093.057
4.276	952.772
4.299	1182.970
4.370	1233.563
4.382	1149.363
4.394	1115.690
4.476	1082.083
4.524	1082.127
4.535	1143.893
4.535	1183.191
4.535	1211.261
4.677	1188.938
4.724	1144.070
4.772	1239.552
4.843	1172.250
4.902	1250.902
4.937	1177.953
5.031	1228.567
5.067	1251.057
5.067	1172.460
5.150	1245.520
5.232	1189.457];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
for i=2:size(data.tW(:,1),1); if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
  temp.tW = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'GibbKurt2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 5;
weights.ab = weights.ab * 0;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02570*(TL in cm)^2.94'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Q7BB'; % Cat of Life
metaData.links.id_ITIS = '680351'; % ITIS
metaData.links.id_EoL = '223841'; % Ency of Life
metaData.links.id_Wiki = 'Pterygoplichthys_disjunctivus'; % Wikipedia
metaData.links.id_ADW = 'Pterygoplichthys_disjunctivus'; % ADW
metaData.links.id_Taxo = '3419750'; % Taxonomicon
metaData.links.id_WoRMS = '1258647'; % WoRMS
metaData.links.id_fishbase = 'Pterygoplichthys-disjunctivus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pterygoplichthys_disjunctivus}}';  
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
bibkey = 'GibbKurt2013'; type = 'Article'; bib = [ ...
'doi = {10.3391/ai.2013.8.2.08}, ' ...
'author = {Melissa A. Gibbs and Benjamin N. Kurth and Corey D. Bridges}, ' ...
'year = {2013}, ' ...
'title = {Age and growth of the loricariid catfish \emph{Pterygoplichthys disjunctivus} in {V}olusia {B}lue {S}pring, {F}lorida}, ' ... 
'journal = {Aquatic Invasions}, ' ...
'volume = {8(2)}, '...
'pages = {207–218}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pterygoplichthys-disjunctivus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


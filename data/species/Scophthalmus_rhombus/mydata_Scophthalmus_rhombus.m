function [data, auxData, metaData, txtData, weights] = mydata_Scophthalmus_rhombus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Scophthalmidae';
metaData.species    = 'Scophthalmus_rhombus'; 
metaData.species_en = 'Brill'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 17];

%% set data
% zero-variate data

data.ab = 21;          units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(11.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 38 * 365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(11.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 37;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 75;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.6e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CapuCand2001';
  comment.Wwb = 'based on egg diameter of 0.89 mm: pi/6*0.089^3';
data.Wwp = 575.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01096*Lp^3.01, see F1';
data.Wwi = 4.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.01, see F1; max prublished weight 8 kg';

data.Ri  = 2.7e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CapuCand2001';   
  temp.Ri = C2K(11.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 200 g eggs of a 1000 g fish: 200/3.6e-4/1000*4.8e3';
 
% uni-variate data
% time-length
data.tL = [ ... % age (yr), total length (cm)
0.001	33.147
0.002	16.993
0.000	15.315
0.059	14.266
1.024	35.455
1.024	24.755
1.038	37.343
1.038	34.615
1.038	22.867
1.038	22.657
1.038	22.028
1.053	26.224
1.053	23.916
1.053	23.706
1.053	20.979
1.068	31.888
1.068	31.469
1.068	29.790
1.068	29.371
1.068	28.112
1.068	27.273
1.082	30.210
1.082	30.210
1.097	33.147
1.974	29.161
1.974	31.888
1.989	26.643
1.989	30.839
1.989	33.357
1.989	35.455
1.989	36.923
1.989	41.958
1.989	45.105
2.004	27.692
2.004	34.615
2.004	43.636
2.018	47.203
2.033	24.965
2.033	38.182
2.033	38.811
2.033	39.650
2.033	40.280
2.033	43.007
2.984	33.776
2.998	40.070
2.998	32.517
2.998	31.678
2.998	30.420
2.998	29.580
3.013	41.748
3.013	38.601
3.013	33.566
3.013	27.902
3.027	47.622
3.027	46.783
3.027	45.944
3.027	39.231
3.027	28.741
3.042	44.476
3.042	37.762
3.042	37.343
3.042	36.294
3.042	35.245
4.007	31.049
4.007	53.077
4.022	39.650
4.022	43.846
4.037	35.664
4.037	48.881
4.051	48.042
4.051	51.608
4.987	48.462
5.002	27.902
5.031	41.538
5.996	40.490
6.026	56.643
7.020	57.063
7.064	45.734
8.000	57.902];    
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
for i = 2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
temp.tL = C2K(11.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HammPoos2012';
 
% length-weight
% Data from 1981-2011
data.LW = [ ... % length (cm), wet weight (g)
2.429	84.782
3.439	93.525
3.644	135.610
3.742	85.223
4.147	110.570
4.149	135.780
4.855	127.614
4.956	127.648
5.664	136.289
5.664	136.289
5.967	144.795
6.068	144.829
6.775	136.663
6.977	128.327
7.583	136.935
7.886	137.036
9.706	162.858
11.323	188.612
11.929	188.816
12.130	163.673
12.131	180.480
12.635	172.246
13.040	189.189
13.041	197.593
13.444	180.921
13.446	231.342
14.053	248.353
14.152	197.966
14.555	189.698
15.165	257.130
15.367	265.601
15.465	190.004
15.467	232.021
16.175	257.470
16.679	232.429
16.885	308.128
17.082	224.161
17.287	283.054
17.484	182.279
17.994	266.484
18.095	274.922
18.400	308.638
18.902	258.386
18.905	308.807
19.410	317.381
19.715	342.693
19.815	325.920
20.015	283.970
20.421	317.720
20.522	334.561
20.619	250.560
20.727	376.647
21.330	318.026
21.435	402.095
21.534	360.111
21.736	360.179
21.837	360.213
22.342	368.786
22.345	419.207
22.549	461.293
22.844	301.728
22.846	352.149
23.050	385.831
23.053	444.656
23.552	327.176
23.557	419.615
23.762	486.911
23.963	461.768
24.061	394.574
24.365	428.290
24.469	487.148
24.870	411.653
24.874	504.091
24.876	537.705
24.972	436.897
25.477	428.663
25.984	479.254
25.987	538.079
26.188	512.936
26.387	454.180
26.493	546.652
26.993	445.980
26.997	538.418
27.001	605.646
27.099	546.856
27.196	462.855
27.299	513.310
27.399	488.133
27.706	563.866
28.006	513.547
28.012	631.196
28.310	530.456
28.417	639.736
28.513	555.735
28.818	589.450
28.823	681.889
29.422	539.233
29.628	631.740
29.629	640.143
30.336	640.381
30.634	539.641
30.736	573.289
30.843	674.165
31.045	674.232
31.149	733.091
31.345	623.913
31.849	598.873
31.952	632.521
31.953	666.135
31.956	716.556
31.957	741.766
32.060	775.414
32.262	783.885
32.662	699.986
32.667	792.425
32.862	658.037
32.867	750.475
32.870	809.300
33.268	700.190
33.275	843.050
33.475	801.100
33.880	818.043
33.883	868.464
34.078	742.479
34.083	826.514
34.285	826.582
34.484	767.825
34.791	860.366
34.991	818.416
35.296	852.132
35.394	801.745
36.003	860.773
36.006	911.194
36.405	818.892
36.413	961.751
36.507	827.329
36.818	978.694
36.949	1583.780
37.012	827.499
37.120	961.989
37.519	869.686
37.523	953.721
37.821	852.981
37.823	894.998
37.826	945.419
38.131	987.539
38.232	979.169
38.435	1012.851
38.942	1046.635
39.050	1172.722
39.247	1088.754
39.342	954.332
39.345	1029.964
39.451	1122.436
39.546	1004.821
39.547	1013.225
39.643	920.820
39.749	1021.696
40.055	1080.623
40.256	1063.883
40.662	1097.633
40.868	1181.736
40.870	1215.350
40.976	1324.630
41.577	1207.184
41.578	1240.798
41.775	1140.024
41.778	1190.445
41.789	1417.340
42.078	1131.723
42.994	1274.888
43.604	1342.320
44.209	1325.716
44.504	1166.152
45.325	1426.932
45.524	1376.579
45.722	1292.612
46.540	1477.760
46.653	1713.092
46.937	1351.844
47.748	1394.133
51.612	1916.440
52.842	2261.391
53.127	1900.142
55.264	2220.189
56.808	2783.733
56.986	2313.204
57.989	2179.088
58.295	2229.611
59.013	2439.936];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weights'};  
bibkey.LW = 'HammPoos2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL'};  subtitle1 = {'IMARES data (frisbe) from Northsea'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VVCN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scophthalmus_rhombus'; % Wikipedia
metaData.links.id_ADW = 'Scophthalmus_rhombus'; % ADW
metaData.links.id_Taxo = '46901'; % Taxonomicon
metaData.links.id_WoRMS = '127150'; % WoRMS
metaData.links.id_fishbase = 'Scophthalmus-rhombus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scophthalmus_rhombus}}';
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
bibkey = 'HammPoos2012'; type = 'techreport'; bib = [ ... 
'author = {van der Hammen and T. and J.J. Poos}, ' ... 
'year = {2012}, ' ...
'title = {Data evaluation of data-limited stocks: dab, flounder, witch, lemon sole, brill, turbot and horse mackerel}, ' ...
'institution = {Institute for Marine Resources and Ecosystem Studies (IMARES), Wageningen}, ' ...
'volume = {Report No. C110/12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CapuCand2001'; type = 'Article'; bib = [ ...  
'doi = {10.1080/11250000109356393}, ' ...
'author = {Vincenzo Caputo and Giacomo Candi and Sabrina Colella and Enrico Arneri}, ' ...
'year = {2001}, ' ...
'title  = {Reproductive biology of turbot (\emph{Psetta maxima}) and brill (\emph{Scophthalmus rhombus}) ({T}eleostei, {P}leuronectiformes) in the {A}driatic {S}ea}, ' ...
'journal = {Italian Journal of Zoology}, ' ...
'volume = {68(2)}, ' ...
'pages = {107-113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scophthalmus-rhombus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

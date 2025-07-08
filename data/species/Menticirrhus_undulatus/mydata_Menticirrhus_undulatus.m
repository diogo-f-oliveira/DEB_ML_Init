function [data, auxData, metaData, txtData, weights] = mydata_Menticirrhus_undulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Menticirrhus_undulatus'; 
metaData.species_en = 'California kingcroaker '; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 12];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(23.6); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(23.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Cynoscion_nebulosus';

data.Lp  = 17.9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 71;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm for Cynoscion_nebulosus: pi/6*0.072^3';
data.Wwi = 4.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.08, see F1';

data.Ri = 0.78e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(23.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Cynoscion_regalis: 1.7e6*4.3e3/9.4e3';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), standard length (cm)
 1	9.667
 2	20.961
 3	27.282
 4	32.170
 5	36.389
 6	38.504
 7	40.620
 8	41.875];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jose1962'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.248	36.769
11.151	33.349
11.808	29.949
11.891	43.320
12.466	43.272
12.629	26.536
13.040	29.846
13.534	43.183
13.617	63.243
13.780	49.851
14.273	53.154
14.355	43.114
15.013	66.470
15.341	59.754
15.506	79.807
15.916	59.706
15.999	73.077
16.574	76.373
16.821	83.042
17.231	86.352
17.561	103.047
17.806	86.304
17.889	96.330
18.218	102.992
18.300	102.985
18.628	86.235
19.121	106.261
19.368	109.585
19.697	122.935
19.862	129.610
20.108	139.623
20.436	126.218
20.437	139.596
20.930	156.277
21.095	159.607
21.506	179.640
21.672	216.415
21.753	176.275
21.916	159.539
22.081	179.592
22.410	192.942
22.492	179.558
22.494	219.691
22.821	192.908
22.822	212.975
23.067	179.509
23.150	192.880
23.397	212.927
23.478	192.853
23.643	202.873
23.808	232.959
23.890	232.952
24.138	252.999
24.548	239.586
24.631	252.957
24.959	256.274
25.206	262.943
25.452	249.544
25.535	272.949
26.030	329.763
26.110	286.278
26.274	262.853
26.274	282.920
26.523	329.722
26.523	329.722
26.934	339.721
27.097	319.641
27.181	366.456
27.426	329.647
27.508	329.640
27.510	356.396
27.674	366.415
27.920	346.328
28.001	316.221
28.002	339.632
28.251	409.845
28.413	363.009
28.414	369.698
29.071	383.021
29.072	413.121
29.486	486.665
29.732	473.267
30.060	453.172
30.471	473.205
30.475	570.194
30.637	513.325
31.131	550.073
31.293	493.203
31.624	533.309
32.282	556.665
32.444	509.829
32.445	539.929
32.859	606.784
32.941	623.500
33.025	663.627
33.187	600.068
33.190	676.991
33.517	640.174
34.016	797.323
34.092	650.159
34.257	656.835
34.258	673.557
34.337	599.972
34.836	760.465
34.916	696.913
35.165	773.816
35.492	723.621
35.659	787.152
35.905	797.165
36.072	854.007
36.153	817.211
36.402	890.769
36.567	910.822
36.809	803.778
36.816	977.691
37.224	910.767
37.226	964.279
37.557	1017.763
37.801	947.508
38.048	980.932
38.293	937.434
38.374	914.016
38.627	1061.152
38.704	930.710
38.876	1141.398
39.034	967.472
39.857	1017.570
39.862	1151.349
41.098	1228.169
41.432	1358.576
41.589	1201.372
41.757	1295.004
42.173	1408.681
42.247	1208.006
42.256	1435.430
42.328	1197.966
42.342	1519.035
42.740	1221.343
42.907	1288.218
42.910	1348.419
43.163	1515.622
43.489	1465.427
43.732	1381.795
43.898	1408.537
44.065	1482.102
44.317	1609.171
44.391	1431.907
44.564	1632.562
44.569	1752.962
44.639	1465.331
44.966	1418.481
44.971	1535.538
45.226	1762.941
45.310	1796.379
45.383	1568.948
45.962	1685.956
47.529	1829.638];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Jose1962'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00933*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QZKH'; % Cat of Life
metaData.links.id_ITIS = '169280'; % ITIS
metaData.links.id_EoL = '46579056'; % Ency of Life
metaData.links.id_Wiki = 'Menticirrhus_undulatus'; % Wikipedia
metaData.links.id_ADW = 'Menticirrhus_undulatus'; % ADW
metaData.links.id_Taxo = '179855'; % Taxonomicon
metaData.links.id_WoRMS = '276150'; % WoRMS
metaData.links.id_fishbase = 'Menticirrhus-undulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Menticirrhus_undulatus}}';
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
bibkey = 'Jose1962'; type = 'Article'; bib = [ ... 
'author = {Joseph, D.}, ' ... 
'year = {1962}, ' ...
'title = {Growth characteristics of two southern, {C}alifornia surffishes, the {C}alifornia Corbina and Sponfin Croaker, family {S}ciaenidae, {C}alif. Fish Game}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {119}, ' ...
'pages = {1-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Menticirrhus-undulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


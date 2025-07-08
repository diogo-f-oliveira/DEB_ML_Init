function [data, auxData, metaData, txtData, weights] = mydata_Phasianus_colchicus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Phasianus_colchicus'; 
metaData.species_en = 'Common pheasant'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2018 10 23];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 22];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data;
data.ab = 24;      units.ab = 'd';    label.ab = 'age at birth';                          bibkey.ab = 'AnAge';  
  temp.ab = C2K(35); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 1;       units.tx = 'd';    label.tx = 'time since birth at fledging';          bibkey.tx = 'Wiki';  
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;       units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'guess';  
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';         bibkey.tR = 'Wiki'; 
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27*365;     units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';                   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 18.5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                    bibkey.Wwb = 'AnAge'; 
data.Wwi = 1e3;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'StarSutt2000';   
data.Wwim = 1.4e3;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'StarSutt2000';   

data.Ri  = 11/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 to 15 eggs per clutch, 1 or 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
0.000   18.5 % Wwb added
1.959	27.943
6.486	47.931
11.012	67.919
11.018	71.908
16.656	83.930
21.201	115.884
22.363	139.827
30.229	139.906
33.638	163.871
34.813	195.792
38.184	195.825
41.587	215.803
43.917	267.678
44.989	235.779
46.331	371.405
48.379	247.779
48.424	275.700
53.277	499.110
58.946	531.075
59.718	311.710
59.865	403.449
61.226	551.041
66.863	563.063
70.016	427.482
71.236	487.323
73.746	650.881
74.690	539.209
78.304	690.812
80.590	714.767
80.641	746.676
81.508	587.141
81.745	734.722
88.359	655.015
88.385	670.970
89.668	770.698
89.796	850.471
92.969	726.856
93.013	754.777
93.129	826.573
97.444	714.935
98.811	866.516
99.794	778.776
99.838	806.697
101.135	914.402
102.118	826.662
103.113	746.900
106.542	782.832
108.987	906.503
111.081	810.797
113.200	731.046
116.904	938.491
117.880	846.763
118.053	954.457
118.079	970.411
120.223	906.615
133.732	922.704
133.803	966.579
135.788	803.066
137.065	898.806
140.519	950.692
141.598	922.783
144.783	807.145
145.103	1006.578
155.132	954.826
158.599	1014.690
159.588	930.939
165.296	986.837
165.386	1042.678
165.430	1070.599
168.577	931.029
176.276	827.402
178.818	1010.903
178.869	1042.812
181.039	994.971
182.105	959.084
182.304	1082.733
183.095	875.333
183.235	963.084
196.738	975.184
201.450	1110.844
210.247	991.273
219.300	1031.250
237.195	979.576
237.431	1127.157];
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(41); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'StarSutt2000';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
0.000   18.5 % Wwb added
0.82	31.909
1.985	43.897
6.498	55.908
11.006	63.931
11.044	87.863
15.539	87.907
20.103	131.828
22.306	103.929
23.487	139.838
24.668	175.748
28.148	243.589
29.169	179.781
30.344	211.702
31.570	275.532
33.766	243.645
35.075	359.327
38.273	251.667
38.337	291.554
39.589	371.338
39.647	407.236
40.668	343.429
42.832	291.598
45.393	487.065
46.471	459.156
46.491	471.122
47.531	419.280
51.158	578.861
52.019	415.337
55.288	351.552
56.744	558.974
56.847	622.792
57.682	443.313
59.023	578.939
62.593	702.622
63.185	371.573
65.624	491.256
65.688	531.143
66.098	786.417
68.166	674.757
69.315	690.723
69.971	399.561
70.650	822.360
72.545	603.006
74.117	882.224
76.358	878.258
76.454	938.087
78.663	914.178
79.332	630.994
79.568	778.574
79.671	842.393
80.814	854.370
80.961	946.110
81.252	427.594
82.341	1105.668
83.221	954.109
84.357	962.098
86.630	978.075
88.545	770.687
88.999	1053.882
89.911	922.267
90.052	1010.018
92.300	1010.040
94.310	862.482
96.775	998.119
98.014	1069.926
98.155	1157.677
100.005	910.402
107.137	1153.778
110.188	954.378
118.232	1066.139
119.446	1121.992
119.535	1177.833
119.574	1201.765
120.441	1042.230
120.640	1165.879
120.800	1265.595
122.000	1313.470
137.494	1166.047
139.850	1233.876
139.888	1257.808
141.076	1297.706
141.230	1393.434
143.285	1273.797
143.336	1305.706
144.223	1158.136
157.075	1465.387
158.007	1345.738
158.874	1186.203
163.395	1202.202
163.625	1345.794
165.808	1305.930
166.103	1489.409
169.275	1365.794
182.522	1218.347
183.895	1373.917
185.988	1278.211
190.573	1334.097
191.645	1302.199
191.664	1314.165
191.715	1346.074
197.154	1234.448
206.322	1346.220
215.356	1374.230
218.701	1358.309];
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m = C2K(41); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'StarSutt2000';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Food intake is reduced just after hatch';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '4FWMN'; % Cat of Life
metaData.links.id_ITIS = '175905'; % ITIS
metaData.links.id_EoL = '45510657'; % Ency of Life
metaData.links.id_Wiki = 'Phasianus_colchicus'; % Wikipedia
metaData.links.id_ADW = 'Phasianus_colchicus'; % ADW
metaData.links.id_Taxo = '53178'; % Taxonomicon
metaData.links.id_WoRMS = '1484516'; % WoRMS
metaData.links.id_avibase = '2FA39DCD42F80BC9'; % avibase
metaData.links.id_birdlife = 'common-pheasant-phasianus-colchicus'; % birdlife
metaData.links.id_AnAge = 'Phasianus_colchicus'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phasianus_colchicus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049264/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StarSutt2000'; type = 'Article'; bib = [ ... 
'author = {Starck, J. M. and Sutter, E.}, ' ... 
'year = {2000}, ' ...
'title = {Patterns of growth and heterochrony in moundbuilders (\emph{Megapodiidae}) and fowl (\emph{Phasianidae})}, ' ...
'journal = {J. Avian Biol.}, ' ...
'volume = {31}, ' ...
'pages = {527--547}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phasianus_colchicus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Mustela_nigripes
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Mustela_nigripes'; 
metaData.species_en = 'Black-footed ferret'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 43;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'VargAnde1996';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 63;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'data for M. putorius';
data.tp = 312;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'data for M. putorius';
data.tpm = 333;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'data for M. putorius';
data.am = 11.1*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'data for M. putorius';

data.Wwb  = 9.5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'AnAge';
  comment.Wwb = 'data for M. putorius';
data.Wwi  = 756;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight for females'; bibkey.Wwi  = 'VargAnde1996';
data.Wwim  = 1035;   units.Wwim  = 'g';  label.Wwim  = 'ultimate wet weight for males'; bibkey.Wwim  = 'VargAnde1996';

data.Ri  = 1.5*7.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'data for M. putorius; 7.5 pups per litter, 1.5 litters per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
20.959	65.263
20.962	73.684
20.970	94.737
20.975	105.263
27.166	122.105
27.171	134.737
27.174	143.158
27.626	84.211
33.839	155.789
34.310	143.158
34.321	170.526
34.326	183.158
35.256	130.526
41.462	183.158
41.943	197.895
42.423	208.421
42.427	216.842
42.429	223.158
42.432	231.579
48.148	248.421
48.151	256.842
48.634	273.684
48.637	282.105
48.641	292.632
49.605	324.211
54.841	332.632
54.848	349.474
54.861	381.053
55.341	393.684
55.346	404.211
55.357	433.684
55.361	442.105
62.044	501.053
62.047	509.474
62.483	408.421
62.487	418.947
62.496	442.105
62.500	450.526
62.983	469.474
62.989	484.211
69.203	560.000
69.208	570.526
69.210	576.842
69.646	475.789
69.669	534.737
69.672	543.158
69.689	585.263
70.124	482.105
70.128	492.632
70.137	515.789
76.372	642.105
76.374	646.316
76.375	650.526
76.376	652.632
76.828	593.684
77.267	498.947
77.273	515.789
77.277	526.316
82.565	663.158
82.567	669.474
83.035	650.526
83.495	610.526
84.012	713.684
84.441	595.789
84.912	583.158
90.186	686.316
90.191	701.053
90.635	621.053
90.640	631.579
90.644	642.105
90.657	675.789
90.697	776.842
96.835	658.947
96.853	705.263
96.859	720.000
96.882	776.842
96.887	791.579
97.316	671.579
97.326	696.842
103.975	669.474
104.457	684.211
104.461	694.737
104.464	703.158
104.473	726.316
104.478	738.947
104.494	778.947
104.502	797.895
110.635	669.474
110.640	682.105
110.647	698.947
111.136	732.632
111.168	812.632
111.176	833.684
111.630	778.947
117.774	677.895
118.268	722.105
118.274	736.842
118.289	776.842
118.304	812.632
118.733	696.842
118.739	711.579
118.799	861.053
124.433	673.684
124.916	692.632
124.920	703.158
124.927	720.000
124.936	743.158
124.950	778.947
124.964	812.632
125.465	875.789
132.048	682.105
132.129	886.316
132.534	707.368
132.566	789.474
132.579	821.053
133.492	724.211
133.493	728.421
133.498	741.053
138.696	652.632
139.186	686.316
139.191	701.053
139.201	726.316
139.204	732.632
139.206	736.842
139.209	745.263
139.226	787.368
139.239	821.053
139.266	890.526
145.420	812.632
145.448	884.211
146.787	661.053
146.797	686.316
146.801	694.737
146.801	694.737
146.804	703.158
146.804	703.158
146.812	724.211
146.814	728.421
146.834	778.947
152.543	781.053
153.506	808.421
153.926	669.474
153.933	686.316
153.941	707.368
153.943	711.579
153.946	720.000
153.950	728.421
154.486	880.000
159.206	787.368
159.215	808.421
160.114	677.895
160.134	728.421
160.138	738.947
160.193	875.789
160.595	690.526
160.598	698.947
160.603	711.579
166.814	778.947
166.830	816.842
166.855	880.000
167.725	675.789
167.731	690.526
167.733	696.842
167.743	720.000
167.746	728.421
167.749	736.842
174.383	669.474
174.393	694.737
174.396	703.158
174.400	713.684
174.406	728.421
174.409	734.737
174.409	736.842
174.428	783.158
174.915	812.632
175.419	882.105
179.182	774.737
180.651	882.105
181.070	738.947
181.537	715.789
181.574	808.421
182.467	661.053
182.478	688.421
182.483	701.053
187.703	669.474
187.784	873.684
188.678	728.421
188.680	732.632
188.699	781.053
188.710	808.421
189.140	694.737
189.144	703.158
189.146	709.474 ];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(39);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'VargAnde1996';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
20.922	105.488
21.393	97.072
27.108	147.660
27.575	126.612
29.478	139.264
34.236	170.894
35.657	162.488
40.419	204.645
40.441	259.382
40.919	269.913
41.376	223.602
41.834	181.502
48.067	343.674
48.075	362.622
48.521	291.047
48.536	328.942
49.001	305.789
49.987	398.432
55.189	352.172
55.225	442.698
55.230	455.330
56.159	404.814
56.190	482.709
61.908	541.718
61.916	560.665
62.364	493.301
62.370	510.144
62.374	518.565
62.878	594.360
68.601	663.895
68.607	678.632
69.512	569.168
70.004	613.384
76.700	743.982
76.718	788.192
76.723	800.824
77.166	720.829
77.656	760.834
82.401	758.780
82.406	771.411
83.836	788.269
84.338	855.643
84.799	821.963
84.805	838.806
90.026	838.862
90.510	862.025
90.514	872.551
90.524	897.814
90.950	775.714
91.906	792.566
97.621	843.154
97.622	847.364
97.639	889.470
97.645	904.207
97.647	910.523
97.669	965.260
103.811	895.852
104.291	908.489
104.774	931.652
104.788	965.336
104.801	999.020
111.461	1039.092
112.369	935.944
112.373	944.365
112.379	961.207
118.068	944.426
118.076	965.479
118.083	982.321
118.088	994.953
118.103	1034.953
125.686	1007.666
125.692	1024.508
126.136	946.618
126.144	965.565
132.791	974.058
132.812	1026.690
133.276	999.326
133.282	1014.063
138.953	955.177
139.441	988.866
139.926	1016.240
139.936	1039.398
146.087	993.148
146.567	1007.890
146.576	1028.943
146.578	1035.259
146.585	1052.101
153.211	1007.961
153.220	1029.014
153.681	995.335
153.708	1062.704
160.810	1022.780
160.814	1031.201
160.825	1058.570
160.831	1075.412
160.838	1092.254
161.272	989.101
167.921	1001.804
167.932	1029.172
167.940	1050.225
167.946	1064.962
167.951	1077.593
168.435	1102.862
174.088	995.554
174.123	1083.976
174.607	1107.139
175.051	1031.354
175.065	1067.144
176.009	1054.522
180.766	1081.942
180.770	1092.468
181.709	1067.215
181.712	1073.531
182.639	1016.699
182.644	1029.330
182.651	1048.278
188.341	1035.707
188.350	1058.865
188.804	1006.238
188.830	1071.502
188.835	1084.134
188.841	1098.870

20.906	65.488
28.035	90.827
34.220	130.894
41.357	175.181
48.505	251.047
56.134	341.656
62.336	423.827
70.442	520.757
78.052	562.944
82.821	619.837
89.485	670.435
98.530	742.111
104.715	782.177
112.308	780.154
118.956	790.751
125.600	790.823
132.252	809.842
141.274	822.570
146.969	822.631
154.084	814.287
160.263	839.616
168.327	829.176
174.974	835.564
182.095	841.956
189.215	846.243];
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(39);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'VargAnde1996';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m(end - 0:13) = 0; % exclude deviating individual
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D2 = 'Body temperature from Neovison';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'The implantation can be delayed and extend the gestation time up to one year.';
metaData.bibkey.F1 = 'AnAge'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44QY2'; % Cat of Life
metaData.links.id_ITIS = '180557'; % ITIS
metaData.links.id_EoL = '328590'; % Ency of Life
metaData.links.id_Wiki = 'Mustela_nigripes'; % Wikipedia
metaData.links.id_ADW = 'Mustela_nigripes'; % ADW
metaData.links.id_Taxo = '66716'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001437'; % MSW3
metaData.links.id_AnAge = 'Mustela_nigripes'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustela_nigripes}}';
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
bibkey = 'VargAnde1996'; type = 'Article'; bib = [ ... 
'author = {A. Vargas and S. H. Anderson}, ' ... 
'year = {1996}, ' ...
'title = {Growth and Physical Development of Captive-Raised Black-Footed Ferrets (\emph{Mustela nigripes})}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {135}, ' ...
'number = {53}, '...
'pages = {43--52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mustela_putorius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


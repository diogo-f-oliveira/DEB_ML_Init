function [data, auxData, metaData, txtData, weights] = mydata_Streptocephalus_torvicornis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Streptocephalidae';
metaData.species    = 'Streptocephalus_torvicornis'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'THp','TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 17]; 

%% set data
% zero-variate data

data.ab = 5.06;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'BelaPeir2003';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 20;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BelaPeir2003';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 120;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'BelaPeir2003';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'males live till 285 d';

data.Lb  = 0.1; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'BelaPeir2003';
data.Lp  = 1.3;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BelaPeir2003';
data.Li  = 2.5;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BelaPeir2003';
  
data.Wdi  = 0.0266;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.5/1)^3';

data.Ri  = 2460/36.73;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BelaPeir2003';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2460 eggs in 36.73 d';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
2.879	0.214
3.500	0.347
4.779	0.444
6.701	0.577
7.367	0.500
8.303	0.684
9.606	0.669
10.564	0.745
10.862	0.873
12.481	0.898
15.057	1.010
15.400	0.929
15.683	1.123
16.024	1.051
18.587	1.220
18.905	1.255
20.520	1.301
21.162	1.337
22.129	1.373
24.354	1.608
25.077	1.271
26.615	1.674
27.280	1.603
29.553	1.613
29.868	1.659
30.838	1.684
31.126	1.853
32.443	1.776
34.045	1.883
35.663	1.914
36.972	1.873
37.958	1.822
38.565	2.021
41.492	2.016
41.821	1.996
43.766	2.021
44.091	2.021
46.029	2.077
47.980	2.072
47.986	2.047
50.575	2.098
52.202	2.088
52.841	2.139
55.445	2.123
60.628	2.200
62.590	2.149
67.784	2.175
68.428	2.205
74.605	2.200
76.847	2.353
80.526	1.874
83.680	2.318
90.174	2.348
96.994	2.374
103.816	2.390
110.968	2.385
117.146	2.369];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length','female'};  
temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'BelaPeir2003'; 
%
data.tL_m = [ ... % time since birth (d), length (cm)
0.000	0.056
1.925	0.117
2.559	0.189
4.786	0.413
5.742	0.500
6.054	0.561
6.366	0.623
7.654	0.679
9.572	0.827
9.925	0.694
12.494	0.842
13.136	0.878
14.101	0.924
15.399	0.934
17.009	1.005
17.960	1.113
18.294	1.072
19.254	1.143
20.871	1.179
22.489	1.215
22.506	1.133
24.415	1.327
24.453	1.148
25.708	1.358
26.369	1.307
27.321	1.414
28.292	1.434
30.224	1.516
30.862	1.572
30.871	1.531
33.134	1.587
33.139	1.562
34.748	1.638
36.046	1.649
36.675	1.746
37.335	1.700
39.275	1.746
40.246	1.766
41.540	1.792
42.515	1.792
44.441	1.904
44.777	1.853
47.686	1.929
48.338	1.919
48.650	1.980
51.900	1.980
51.906	1.955
53.209	1.940
55.462	2.042
60.346	2.001
62.596	2.118
67.797	2.118
68.772	2.119
74.291	2.149
77.848	2.231
81.104	2.205
84.013	2.282
88.876	2.338
90.517	2.262
95.055	2.323
97.001	2.338
101.548	2.354
104.793	2.379
108.372	2.364
110.628	2.451
115.519	2.380
118.741	2.512
122.650	2.471
123.945	2.492
129.473	2.482
131.735	2.543
137.294	2.390
138.890	2.523
145.079	2.462
145.720	2.502
150.929	2.462
151.893	2.513
156.792	2.406
158.718	2.518
163.936	2.436
166.854	2.467
170.116	2.416
173.032	2.457
178.565	2.421
179.210	2.447
185.709	2.452
187.980	2.473
193.505	2.473
194.801	2.493
199.361	2.447
200.642	2.539
205.848	2.514
208.449	2.509
213.646	2.524
215.920	2.529
220.801	2.504
222.090	2.555
227.623	2.519
229.243	2.545
234.449	2.519
236.380	2.606
241.282	2.484
243.220	2.540
249.104	2.387
251.350	2.520
255.601	2.402
256.872	2.535
262.761	2.357
264.353	2.510
269.571	2.428
270.539	2.464
277.038	2.469
283.865	2.464];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'length','male'};  
temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'BelaPeir2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Lb = 3 * weights.Lb; 

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
D1 = 'males as assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WXPR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '326791'; % Ency of Life
metaData.links.id_Wiki = 'Streptocephalus'; % Wikipedia
metaData.links.id_ADW = 'Streptocephalus_torvicornis'; % ADW
metaData.links.id_Taxo = '948469'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

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
bibkey = 'BelaPeir2003'; type = 'Article'; bib = [ ... 
'author = {Lynda Beladja and Nico Peiren and Tom T. M. Vandekerckhove and Johan Mertens}, ' ... 
'year = {2003}, ' ...
'title = {DIFFERENT LIFE HISTORIES OF THE CO-OCCURRING FAIRY SHRIMPS \emph{Branchipus schaefferi} AND \emph{Streptocephalus torvicornis} ({A}NOSTRACA)}, ' ...
'journal = {Journal of crustacean biology}, ' ...
'volume = {23(2)}, ' ...
'pages = {300–307}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Oligosarcus_jenynsii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Oligosarcus_jenynsii'; 
metaData.species_en = 'Pike characin'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TP','TH','TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 03];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'HartBarb1995';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'NunePell2004'; 
data.Li  = 31;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.1^3';
data.Wwp = 46.0;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','NunePell2004'};
  comment.Wwp = 'based on 0.00933*Lp^3.11, see F1';
data.Wwi = 366.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwim = 'max published weight is 330 g, based on 0.00933*Li^3.11, see F1, gives 366.2 g';

% uni-variate data

% time-length
data.tL_f = [ ... % time (yr), total length (cm)
1.790	13.686
2.243	13.620
2.517	13.853
2.787	15.301
3.006	15.609
3.277	16.602
3.493	17.745
3.725	18.509
3.985	18.666
4.258	19.127
4.545	19.589
4.748	20.504
5.011	19.978
5.215	20.589
5.502	20.823
5.750	20.752
6.037	21.137
6.280	22.433
6.501	21.906
6.772	22.974
7.471	23.444
8.004	24.290
8.479	26.198];
data.tL_f(:,1) = 365 * (0.9+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time','total length','females'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HartBarb1995';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time (yr), total length (cm)
1.153	12.896
1.332	13.055
1.607	13.216
1.908	13.533
2.166	15.012
2.372	15.250
2.661	15.489
2.894	15.727
3.124	17.205
3.385	17.676
4.151	19.322
4.331	18.861
4.908	19.262
5.469	20.515
5.661	20.830];
data.tL_m(:,1) = 365 * (0.9+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time','total length','males'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HartBarb1995';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % total length (mm), weight (g)
105.895	9.770
121.228	15.966
126.031	16.867
128.733	17.311
128.733	17.311
129.643	18.797
131.131	17.259
133.243	19.222
133.532	17.709
134.453	20.702
136.558	21.660
137.465	22.645
138.064	22.632
138.949	20.605
139.278	24.614
143.785	26.023
144.677	25.000
144.680	25.502
144.695	27.509
145.569	23.977
147.696	27.947
148.898	28.423
149.552	35.939
151.314	30.881
154.048	35.842
156.482	40.810
158.237	34.748
160.657	37.708
163.661	38.648
164.264	39.137
165.788	42.618
166.410	45.617
166.731	48.622
167.273	40.578
168.508	45.571
169.104	45.057
171.234	49.529
171.805	45.500
172.379	41.974
173.026	48.486
173.372	55.005
173.914	46.961
174.250	51.974
174.510	46.446
175.380	42.412
175.423	48.435
176.312	46.910
176.640	50.919
177.251	52.411
178.096	44.863
178.424	48.872
178.764	54.387
178.941	37.315
179.078	56.388
179.096	58.898
179.320	48.351
180.212	47.328
180.291	58.370
181.173	55.841
181.429	49.811
183.032	64.335
184.484	57.778
186.084	71.800
188.161	68.743
188.392	59.200
189.334	65.204
190.829	64.669
191.097	60.146
193.256	68.633
194.130	65.100
194.130	65.100
194.206	75.641
195.636	66.072
195.968	70.583
197.456	69.045
197.485	73.060
198.059	69.534
199.305	76.033
199.305	76.033
199.645	81.548
200.793	74.495
200.815	77.507
201.977	72.462
202.050	82.500
202.158	55.892
202.375	86.007
203.213	77.455
203.458	69.920
203.660	98.028
204.112	77.436
204.758	83.948
205.300	75.904
205.878	72.880
205.982	87.436
206.004	90.447
206.257	83.916
207.127	79.881
207.412	77.867
207.712	77.860
208.330	80.357
208.377	86.882
209.225	79.836
209.655	97.899
210.977	73.272
211.966	85.801
211.992	89.315
212.114	64.714
212.252	83.787
212.638	95.827
212.808	77.751
212.819	79.257
213.815	92.789
214.382	88.259
214.574	73.195
214.657	84.739
215.040	96.277
215.040	96.277
215.372	100.788
215.531	81.206
216.665	113.812
217.026	80.672
217.069	86.695
217.438	96.226
218.398	104.739
219.583	102.705
222.808	92.596
223.678	88.561
223.710	93.079
224.220	122.184
224.978	102.589
225.328	109.610
226.935	124.636
228.282	103.522
230.406	106.991
231.124	123.542
231.576	102.949
233.298	134.037
233.952	141.553
234.006	107.415
236.382	146.019
238.036	125.903
238.795	147.975
240.918	109.777];
data.LW_f(:,1) = data.LW_f(:,1)/10; % convert mm to cm
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'HartBarb1995';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (mm), weight (g)
105.310	9.891
108.904	13.413
114.887	13.402
117.880	14.909
119.678	17.426
121.473	16.918
122.670	17.420
126.557	16.405
127.458	18.924
131.048	19.421
131.348	19.925
131.946	19.420
133.145	21.434
135.836	20.925
135.838	21.933
137.333	21.930
138.532	23.440
140.922	20.916
141.224	23.435
141.225	24.443
141.226	24.947
143.023	26.960
144.515	23.933
146.012	24.939
146.913	27.457
147.513	28.968
147.808	25.440
149.613	34.509
152.302	31.480
153.500	32.990
153.804	37.022
154.699	35.004
156.492	32.984
160.088	38.018
168.768	42.539
170.566	45.056
177.750	49.075
178.356	55.122
180.456	60.159
182.552	62.171
183.444	57.633
184.944	60.655
185.251	67.207
188.541	67.201
190.334	65.182
193.621	62.655
196.021	67.691
197.221	71.218
197.514	65.673
197.821	72.225
199.937	90.366
203.815	81.790
205.007	77.756
205.900	73.722
207.102	78.760
207.998	77.247
208.002	80.775
212.498	88.327
214.289	85.300
214.887	84.291
215.184	82.778];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'HartBarb1995';
comment.LW_m = 'data for females';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
15.447	4320.988
15.928	4609.053
16.539	5041.152
19.432	11090.535
19.591	22181.070
20.310	13395.062
20.746	13539.095
21.226	13395.062
23.357	28806.584
24.443	27222.222];
data.LW_m(:,1) = data.LW_m(:,1)/10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NunePell2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
% weights.LN = 3 * weights.LN;
% weights.am = 3 * weights.am;
% weights.Lp = 3 * weights.Lp;

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6SL3P'; % Cat of Life
metaData.links.id_ITIS = '641513'; % ITIS
metaData.links.id_EoL = '585141'; % Ency of Life
metaData.links.id_Wiki = 'Oligosarcus'; % Wikipedia
metaData.links.id_ADW = 'Oligosarcus_jenynsii'; % ADW
metaData.links.id_Taxo = '181738'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Oligosarcus-jenynsii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oligosarcus}}';
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
bibkey = 'HartBarb1995'; type = 'Article'; bib = [ ... 
'author = {Hartz, S.M. and Barbieri, G.}, ' ... 
'year = {1995}, ' ...
'title = {Crescimento do peixecachorro, \emph{Oligosarcus jenynsii} ({G}unther, 1864), na lagoa {C}aconde, {R}io {G}rande do {S}ul, {B}rasil ({T}eleostei, {C}haracidae)}, ' ...
'journal = {Boletim do Instituto de Pesca}, ' ...
'volume = {22(2)}, ' ...
'pages = {33-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NunePell2004'; type = 'Article'; bib = [ ... 
'author = {Daniela M. Nunes and Mateus Pellanda and Sandra Maria Hartz}, ' ... 
'year = {2004}, ' ...
'title = {Din\^{a}mica reprodutiva de \emph{Oligosarcus jenynsii} e \emph{O. robustus} ({C}haraciformes, {C}haracidae) na {L}agoa {F}ortaleza, {R}io {G}rande do {S}ul, {B}rasil}, ' ...
'journal = {Iheringia, S\''{e}r. Zool., Porto Alegre}, ' ...
'volume = {94(1)}, ' ...
'pages = {5-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oligosarcus-jenynsii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


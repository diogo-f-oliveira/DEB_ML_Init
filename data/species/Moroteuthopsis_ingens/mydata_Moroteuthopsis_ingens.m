function [data, auxData, metaData, txtData, weights] = mydata_Moroteuthopsis_ingens

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Onychoteuthidae';
metaData.species    = 'Moroteuthopsis_ingens'; 
metaData.species_en = 'Greater hooked squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS', 'MPS', 'MIS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 500;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Jack1997';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.46;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'Wiki';
data.Lp  = 44;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'Jack1997';
data.Lpm  = 21;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';  bibkey.Lpm  = 'Jack1997';
data.Li  = 94; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'sealifebase';
data.Lim = 68; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = {'sealifebase','Jack1997'};
  comment.Lim = 'based on length ratio with females at 365 d: 94*39/54';

data.Ni  = 1.3e6; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'guess';   
  temp.Ni = C2K(8); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap=0.7';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
197.805	17.349
216.280	18.607
234.163	27.824
243.088	31.000
247.849	28.768
253.383	34.334
254.092	36.561
256.016	25.419
257.505	36.081
271.110	29.863
271.969	45.300
278.796	44.340
282.659	23.329
289.003	40.035
297.818	33.503
300.571	35.092
300.740	49.893
306.074	37.952
308.747	32.539
311.638	46.224
315.098	49.881
316.395	43.673
317.730	40.808
320.380	33.325
320.576	50.514
323.940	45.736
325.264	41.916
326.033	49.395
337.490	34.744
344.474	47.630
345.209	52.085
356.057	43.960
358.228	54.462];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Jack1997';
comment.tL_f = 'Data for females from New Zealand)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
172.500	16.891
198.472	15.916
203.311	20.527
204.738	25.778
222.425	17.807
236.742	14.135
253.927	22.079
260.124	25.893
265.636	29.549
271.182	36.229
279.944	25.082
281.408	33.516
293.757	37.166
300.448	24.270
319.050	36.669
322.422	32.528
332.016	34.430
336.175	39.361
337.501	35.699
350.489	35.370
392.919	38.679
393.596	38.042];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Jack1997';
comment.tL_m = 'Data for males from New Zealand'; 

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
197.985	276.554
216.412	242.793
236.938	666.678
243.819	1155.338
247.200	870.726
253.399	1359.467
256.203	2006.503
256.709	459.074
272.475	1041.417
272.486	1136.154
273.420	3346.569
278.279	4056.521
279.921	487.905
279.928	551.062
288.985	2160.516
297.086	1370.083
299.831	1496.073
300.770	3753.856
304.614	1542.875
311.760	4352.555
314.521	4620.649
315.645	2504.726
321.095	2409.345
321.937	3814.509
323.087	1919.634
325.992	3450.870
327.883	2076.961
343.834	4285.599
345.966	5027.452
358.046	3210.232];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Jack1997';
comment.tWw_f = 'Data for females from New Zealand'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
174.767	184.567
199.333	118.501
202.776	386.514
206.216	622.948
225.283	225.953
238.242	129.682
253.974	412.029
258.164	1248.375
261.498	553.244
266.993	852.593
282.028	1008.707
293.644	1117.859
302.439	422.080
306.613	1116.323
309.320	910.739
312.742	989.281
314.806	1131.142
317.492	736.087
319.590	1177.944
323.012	1256.486
326.389	940.297
331.174	1002.888
336.626	923.295
336.665	1270.658
338.688	1049.366
351.673	1189.934
393.325	1311.318];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Jack1997';
comment.tWw_m = 'Data for males from New Zealand'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.am = 3 * weights.am;
weights.Ni = 3 * weights.Ni;
weights.Li = 5 * weights.Li;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7S6WV'; % Cat of Life
metaData.links.id_ITIS = '1452502'; % ITIS
metaData.links.id_EoL = '59191442'; % Ency of Life
metaData.links.id_Wiki = 'Onykia_ingens'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5516759'; % Taxonomicon
metaData.links.id_WoRMS = '1452502'; % WoRMS
metaData.links.id_molluscabase = '1452502'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onykia_ingens}}';
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
bibkey = 'Jack1997'; type = 'Article'; bib = [ ... 
'author = {George D. Jackson}, ' ... 
'year = {1997}, ' ...
'title = {Age, growth and maturation of the deepwater squid \emph{Moroteuthis ingens} ({C}ephalopoda: {O}nychoteuthidae) in {N}ew {Z}ealand waters}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {17}, ' ...
'pages = {268-274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Onykia-ingens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


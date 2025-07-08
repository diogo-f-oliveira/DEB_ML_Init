function [data, auxData, metaData, txtData, weights] = mydata_Doryteuthis_gahi

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Doryteuthis_gahi'; 
metaData.species_en = 'Patagonian squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW', 'MPSE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 1.2*365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Vill2001';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.am_m = 1.2*365;   units.am_m = 'd';  label.am_m = 'life span for male';    bibkey.am_m = 'Vill2001';   
  temp.am_m = C2K(8); units.temp.am_m = 'K'; label.temp.am_m = 'temperature'; 

data.Lp  = 12;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'guess';
data.Li  = 20;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Vill2001';
data.Li_m = 25; units.Li_m = 'cm';label.Li_m  = 'mantle length at death for male'; bibkey.Li_m  = 'Vill2001';

data.Wwb  = 0.0082; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'RoseOjed2014';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi  = 100; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death for female'; bibkey.Wwi  = 'Vill2001';
data.Wwim = 130; units.Wwim = 'g'; label.Wwim = 'wet weight at death for male';   bibkey.Wwim  = 'Vill2001';

data.GSI  = 0.06; units.GSI  = '-'; label.GSI  = 'gonado somatic index at death'; bibkey.GSI  = 'Vill2001';   
  temp.GSI = C2K(8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (month), mantle length (cm)
262.270	15.671
298.623	16.291
333.760	18.286
335.032	17.859
340.273	18.761
344.804	18.619
349.928	17.529
354.554	18.999
355.846	18.904
356.455	18.241
360.947	17.435
364.948	19.285
370.082	18.384
383.083	18.907];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Vill2001';
comment.tL_f = 'data for females'; 
%
data.tL_m = [ ... % time since birth (month), mantle length (cm)
236.781	12.004
241.915	12.906
247.048	13.809
250.257	13.357
255.390	14.147
264.374	14.711
270.149	15.388
273.357	15.614
279.132	15.162
281.057	19.449
284.266	19.337
286.191	16.403
288.758	17.306
293.891	18.998
296.458	15.050
304.158	15.050
304.800	17.419
307.367	18.547
308.650	19.224
311.217	16.968
311.858	18.547
327.259	21.142
338.809	22.947
340.734	21.931
352.284	23.398
359.343	23.060
361.268	24.413
362.551	25.090
363.835	23.624
369.610	25.993
370.893	24.526
378.593	23.624
378.594	25.429
382.444	25.429
389.502	25.429
393.994	25.542];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Vill2001';
comment.tL_m = 'data for males'; 

% time-weight
data.tW_f = [ ... % time since birth (month), wet weight (g)
260.256	66.760
296.154	66.090
333.333	84.496
333.334	89.346
339.744	97.425
343.590	95.159
350.641	66.378
352.564	114.229
355.128	79.308
356.410	86.744
362.821	86.417
363.462	110.989
366.026	99.671
382.051	97.397];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Vill2001';
comment.tW_f = 'data for females'; 
%
data.tW_m = [ ... % time since birth (month), mantle length (cm)
236.504	36.779
241.645	36.779
246.144	40.024
248.072	34.615
250.000	34.615
254.499	40.024
262.853	44.351
270.566	51.923
274.422	47.596
278.920	40.024
280.848	73.558
284.704	73.558
285.347	48.678
287.918	58.413
290.488	58.413
293.059	76.803
296.915	43.269
303.985	38.942
307.198	37.861
308.483	64.904
309.769	77.885
310.411	70.313
312.339	51.923
328.406	84.375
338.046	91.947
341.260	90.865
350.900	108.173
359.254	93.029
361.825	99.519
363.111	117.909
365.039	96.274
367.609	146.034
372.751	112.500
378.535	102.764
380.463	123.317
383.033	118.990
386.889	118.990
392.031	122.236];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Vill2001';
comment.tW_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Wwb = 5 * weights.Wwb; 

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and h_a only';
D2 = 'Reproductive output is assumed to correspond to am = 1 yr, the most frequent max age';
D3 = 'Temperatures are guessed';
D4 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37FV3'; % Cat of Life
metaData.links.id_ITIS = '556654'; % ITIS
metaData.links.id_EoL = '592758'; % Ency of Life
metaData.links.id_Wiki = 'Doryteuthis_gahi'; % Wikipedia
metaData.links.id_ADW = 'Loligo_gahi'; % ADW
metaData.links.id_Taxo = '3954923'; % Taxonomicon
metaData.links.id_WoRMS = '410351'; % WoRMS
metaData.links.id_molluscabase = '410351'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Doryteuthis_gahi}}';
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
bibkey = 'Vill2001'; type = 'Article'; bib = [ ... 
'author = {Piero Villegas}, ' ... 
'year = {2001}, ' ...
'title = {Growth, life cycle and fishery biology of \emph{Loligo gahi} (d''Orbigny, 1835) off {P}eruvian coast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {54}, ' ...
'pages = {123--131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoseOjed2014'; type = 'Article'; bib = [ ... 
'doi = {10.3402/polar.v33.21636}, ' ...
'author = {Sebasti\''{a}n Rosenfeld and Jaime Ojeda and Mathias H\"{u}ne and Andr\''{e}s Mansilla and Tamara Contador}, ' ... 
'year = {2014}, ' ...
'title = {Egg masses of the {P}atagonian squid \emph{Doryteuthis (Amerigo) gahi} attached to giant kelp (\emph{Macrocystis pyrifera}) in the sub-{A}ntarctic ecoregion}, ' ...
'journal = {Polar research}, ' ...
'volume = {33}, ' ...
'pages = {21636}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

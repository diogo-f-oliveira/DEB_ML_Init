  function [data, auxData, metaData, txtData, weights] = mydata_Nannoperca_australis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Nannoperca_australis'; 
metaData.species_en = 'Southern pygmy perch'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biFr','biFm'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 16];

%% set data
% zero-variate data
data.ab = 15; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 8.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3';
data.Wwp = 0.38;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01047*Lp^3.01, see F1';
data.Wwi = 6.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.01, see F1';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (d), total length (cm), weight (g)
104.045	2.841
106.935	2.539
106.954	2.447
107.165	1.404
107.207	1.195
108.397	2.307
108.425	2.168
108.453	2.029
108.472	1.937
108.509	1.751
108.519	1.705
108.551	1.542
111.320	1.844
152.029	3.417
152.048	3.324
152.062	3.255
152.165	2.745
153.500	3.139
153.542	2.930
153.603	2.629
153.730	2.003
153.753	1.887
154.784	3.788
154.812	3.649
155.126	2.096
195.633	4.666
197.207	3.878
198.341	5.269
200.065	3.739
200.177	3.182
201.358	4.341
201.367	4.295
201.419	4.040
201.470	3.785
201.508	3.599
201.522	3.530
201.569	3.298
203.082	2.811
218.508	3.483
219.834	3.923
219.871	3.737
219.951	3.343
219.970	3.251
220.330	1.466
221.300	3.668
221.413	3.111
221.497	2.694
221.544	2.462
221.811	1.141
222.546	4.502
222.579	4.340
224.472	1.976
225.685	2.972
239.603	4.107
239.659	3.829
240.891	4.733
240.943	4.478
240.966	4.362
240.980	4.292
241.032	4.037
241.346	2.484
242.409	4.223
242.531	3.620
242.545	3.551
243.749	4.594
243.978	3.458
244.067	3.017
244.138	2.670
245.426	3.295
287.540	4.915
287.578	4.730
287.732	3.965
287.756	3.849
287.793	3.664
287.817	3.548
287.849	3.385
287.878	3.246
288.871	5.332
288.941	4.985
289.035	4.521
289.377	2.829
289.409	2.667
290.763	2.968
331.365	5.075
333.107	3.452
333.126	3.359
334.470	3.707
335.642	4.912
335.656	4.843
336.054	2.872
337.117	4.611
337.141	4.495
337.155	4.425
337.239	4.008
337.272	3.846
376.697	4.770
378.014	5.257
378.267	4.005
379.555	4.631
379.578	4.515
379.705	3.890
380.768	5.628
424.850	4.512
426.045	5.602
426.078	5.440
426.303	4.327
469.780	6.202
470.047	4.880
470.099	4.625
471.209	6.132
471.485	4.764
471.570	4.347
472.825	5.135
491.151	5.459
492.908	3.766
512.419	5.225
513.562	6.570
514.991	6.500
516.458	6.245
518.003	5.596
561.786	5.964
561.851	5.640
608.407	6.286
608.486	5.892];
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hum1995';
%
data.tL_m = [ ... % time since hatch (d), total length (cm), weight (g)
101.531	2.487
102.988	2.557
105.903	2.696
106.016	2.883
106.044	2.930
106.398	1.180
107.048	2.253
108.067	1.600
109.765	2.066
110.840	1.506
111.108	1.949
151.512	3.253
151.851	3.813
152.148	1.970
153.124	3.580
153.761	2.297
154.242	3.090
155.091	2.157
155.402	2.670
156.916	2.833
156.972	2.926
157.015	2.996
195.946	4.207
196.526	2.831
196.795	3.274
198.663	4.020
198.818	4.277
198.889	4.394
199.101	2.410
199.695	3.390
199.879	3.694
199.936	3.787
200.855	2.970
201.181	3.507
216.940	3.833
217.294	2.083
218.397	3.902
219.472	3.342
220.152	4.462
220.760	3.132
221.000	1.196
221.057	3.622
221.227	1.569
221.679	4.649
221.793	2.502
222.047	2.922
222.146	3.086
224.778	2.759
243.579	3.434
243.975	4.088
244.116	4.321
245.191	3.761
245.814	4.787
245.870	4.881
246.691	3.901
247.115	4.601
285.990	3.385
287.151	2.965
287.207	3.058
287.306	3.221
288.381	4.995
288.777	3.315
288.961	3.618
289.202	4.015
289.287	4.155
289.541	4.575
289.838	2.731
290.503	3.828
290.772	4.271
290.871	4.435
291.112	4.831
331.882	4.409
331.982	4.572
332.349	5.179
332.844	3.662
333.113	4.105
333.156	4.175
333.241	4.315
334.981	4.852
335.872	3.988
336.820	5.552
336.989	3.498
374.210	4.219
375.709	4.359
377.194	4.476
378.057	3.566
378.298	3.962
379.147	5.362
381.071	3.869
381.736	4.965
382.358	3.659
424.643	5.733
426.878	4.752
426.906	4.799
427.090	5.102
427.175	5.242
427.316	5.476
469.375	4.843
469.629	5.263
470.973	5.146
473.704	4.983
494.075	5.915
515.097	5.587
516.582	5.703
518.167	5.983
561.725	5.491
607.319	6.024
608.833	6.188];
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hum1995';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
3.690	70.279
3.698	107.813
3.892	243.273
4.106	208.306
4.406	368.163
4.499	197.632
4.507	353.577
4.515	162.951
4.604	479.068
4.693	324.427
4.701	489.036
4.794	285.292
5.008	544.910
5.097	469.692
5.105	417.694
5.206	255.816
5.210	329.456
5.910	636.027
6.302	678.782];
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
  temp.LN = C2K(15);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Hum1995';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

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
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45ML9'; % Cat of Life
metaData.links.id_ITIS = '641900'; % ITIS
metaData.links.id_EoL = '213378'; % Ency of Life
metaData.links.id_Wiki = 'Nannoperca_australis'; % Wikipedia
metaData.links.id_ADW = 'Nannoperca_australis'; % ADW
metaData.links.id_Taxo = '180735'; % Taxonomicon
metaData.links.id_WoRMS = '1020006'; % WoRMS
metaData.links.id_fishbase = 'Nannoperca-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Nannoperca_australis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...1020471
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%p
bibkey = 'Hum1995'; type = 'article'; bib = [ ...
'author = {Paul Humphries}, ' ... 
'year   = {1995}, ' ...
'title  = {Life history, food and habitata of southern pygmy perch, \emph{Nannoperca australis}, in the {M}acquartie {R}iver, {T}asmania}, ' ...
'journal = {Mar. Freshwater Res.}, ' ...
'page = {1159-1169}, ' ...
'volume = {46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Nannoperca-australis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


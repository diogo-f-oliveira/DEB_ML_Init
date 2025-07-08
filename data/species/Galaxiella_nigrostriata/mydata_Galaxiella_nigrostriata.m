function [data, auxData, metaData, txtData, weights] = mydata_Galaxiella_nigrostriata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Galaxiiformes'; 
metaData.family     = 'Galaxiidae';
metaData.species    = 'Galaxiella_nigrostriata'; 
metaData.species_en = 'Blackstriped dwarf galaxias'; 

metaData.ecoCode.climate = {'Cfa', 'BWk'};
metaData.ecoCode.ecozone = {'TA', 'TO'};
metaData.ecoCode.habitat = {'jiFc', 'jiFl', '0jMcp'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % in K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 28];

%% set data
% zero-variate data
data.am = 1.5*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'PenPott1993';  
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.7;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 4.4;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'PenPott1993';
  comment.Wwb = 'based on egg diameter of 0.08 mm : pi/6*0.08^3';
data.Wwi = 0.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.12, see F1'; 

data.Ri = 3*62/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'PenPott1993';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '62 eggs per clutch, 3 clutches assumed';
  
% uni-variate data
% time-length
data.tL_f = [ ... % age (d) ~ Length (cm) 
27.983	0.840
28.118	1.092
28.153	1.158
28.197	1.242
28.352	1.532
28.807	0.719
28.936	0.962
29.140	1.345
29.724	0.775
30.083	1.448
30.188	1.644
32.028	1.765
62.930	3.092
64.752	1.512
65.001	1.979
65.202	0.690
65.277	0.830
65.451	1.157
65.566	1.372
65.790	1.792
66.130	0.764
66.288	2.727
66.633	1.708
66.733	1.895
66.817	2.054
66.952	2.306
67.262	1.222
68.001	0.942
68.066	1.063
68.828	2.493
92.877	0.960
93.869	1.156
94.128	1.642
94.503	0.680
94.885	3.063
94.945	3.175
95.231	2.044
95.589	2.717
95.649	2.829
95.689	2.904
95.743	3.007
95.954	1.736
96.014	1.848
96.319	0.754
96.374	0.857
96.469	1.035
96.588	1.259
96.683	1.436
96.743	1.549
97.032	2.091
98.094	2.418
99.072	2.586
126.397	2.202
127.065	3.454
127.120	3.557
127.430	2.473
127.749	3.071
128.117	3.763
128.238	2.324
128.298	2.436
128.378	2.585
128.952	1.996
129.395	2.828
129.420	2.875
129.490	3.006
129.619	3.249
130.468	3.174
130.693	1.931
153.199	2.500
153.408	2.893
153.937	2.220
153.972	2.285
154.766	2.108
155.030	2.603
155.224	2.968
155.294	3.099
155.328	3.164
155.373	3.248
155.499	1.818
156.027	2.809
156.376	3.463
156.492	2.014
156.866	2.715
173.898	3.014
173.938	3.089
174.132	3.453
175.301	2.313
175.331	2.369
175.759	3.173
175.963	3.556
176.023	3.668
176.048	3.715
176.264	2.453
176.313	2.547
176.503	2.902
176.732	3.332
177.580	3.257
217.035	2.303
217.618	3.396
218.147	2.723
218.182	2.789
218.242	2.901
218.456	3.303
218.675	3.714
218.926	2.517
220.073	3.003
220.337	3.499
220.742	2.592
221.274	3.592
221.309	3.658
221.958	3.209
222.277	3.807
238.506	4.265
238.677	2.919
238.722	3.003
240.742	3.461
240.842	3.648
241.436	3.096
241.795	3.769
242.065	2.610
279.971	3.750
281.852	3.946
306.049	4.356
306.160	2.898
306.414	3.375
306.823	4.141
307.073	2.945
307.148	3.085
307.188	3.160
307.218	3.216
307.322	3.412
307.561	3.861
307.887	2.805
308.285	3.553
308.889	3.020
309.128	3.468
310.156	3.730
310.994	3.637
333.191	3.627
334.054	3.580
335.136	3.944
335.161	3.991
335.196	4.057
335.241	4.141
335.725	3.384
335.905	3.720
335.984	3.870
350.519	2.813
351.081	3.869
352.119	4.150
352.544	3.280
352.564	3.318
352.619	3.421
352.673	3.523
352.738	3.645
352.773	3.710
352.818	3.794
353.482	3.374
353.536	3.477
354.005	4.355
354.484	3.589
386.564	3.794
386.813	4.261
387.577	4.027
388.066	3.279
388.400	3.906
388.425	3.952
389.044	3.448
389.089	3.532
389.119	3.588
389.169	3.681
389.413	4.139
429.102	3.624
429.147	3.708
429.186	3.783
429.226	3.858
429.296	3.989
429.950	3.549
430.219	4.054
430.264	4.138
431.037	3.923
431.261	4.344
432.184	4.409
434.010	4.503
455.005	3.904
455.189	4.250
455.299	4.455
456.291	4.652
456.701	3.754
456.836	4.007
456.896	4.119
516.331	3.996
582.486	4.817];
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PenPott1993'; 
%
data.tL_m = [ ... % age (d) ~ Length (cm) 
241.557	3.358
243.333	3.661
245.998	2.999
309.051	3.479
310.827	3.735
310.827	3.536
310.827	3.432
310.827	3.139
310.827	3.082
311.715	3.281
311.715	3.215
311.715	3.016
311.715	2.903
311.715	2.960
335.693	3.063
336.581	3.148
336.581	3.242
338.358	3.422
338.358	3.545
341.022	3.327
353.455	3.214
353.455	3.148
354.343	3.233
355.231	4.433
356.119	3.620
356.119	2.987
357.007	3.469
389.866	3.515
389.866	3.648
389.866	3.818
391.642	3.458
391.642	3.591
392.530	3.383
393.418	3.043
393.418	3.317
394.307	2.853
395.195	3.250
430.718	3.240
431.606	3.524
431.606	3.344
431.606	3.287
431.606	3.193
435.158	3.420
436.046	3.136
436.934	3.070
459.136	3.428
461.800	3.485
490.219	3.758
491.107	3.910
491.995	3.815
519.526	3.332];
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PenPott1993'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F2XX'; % Cat of Life
metaData.links.id_ITIS = '623473'; % ITIS
metaData.links.id_EoL = '218020'; % Ency of Life
metaData.links.id_Wiki = 'Galaxiella_nigrostriata'; % Wikipedia
metaData.links.id_ADW = 'Galaxiella_nigrostriata'; % ADW
metaData.links.id_Taxo = '174663'; % Taxonomicon
metaData.links.id_WoRMS = '1049483'; % WoRMS
metaData.links.id_fishbase = 'Galaxiella-nigrostriata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galaxiella_nigrostriata}}';
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
bibkey = 'PenPott1993'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1993.tb01160.x}, ' ...
'author = {Pen, L. J. and Gill, H. S. and Humphries, P. and Potter, I. C.}, ' ... 
'year   = {1993}, ' ...
'title  = {Biology of the black-stripe minnow \emph{Galaxiella nigvostriata}, including comparisons with the other two {G}alaxiella species}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {847–863}, ' ...
'volume = {43(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Galaxiella-nigrostriata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


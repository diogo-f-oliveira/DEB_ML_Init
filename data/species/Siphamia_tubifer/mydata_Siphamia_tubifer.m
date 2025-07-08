function [data, auxData, metaData, txtData, weights] = mydata_Siphamia_tubifer
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Kurtiformes'; 
metaData.family     = 'Apogonidae';
metaData.species    = 'Siphamia_tubifer'; 
metaData.species_en = 'Tubifer cardinalfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 01 31];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 
  
metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 31]; 


%% set data
% zero-variate data

data.tj = 31;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'GoulDoug2016';
  temp.tj = C2K(28.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 57.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GoulDoug2016';
  temp.tp = C2K(28.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data for Lp';
data.am = 368; units.am = 'd';    label.am = 'life span';                bibkey.am = 'GoulDoug2016';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.10;  units.Lj  = 'cm';  label.Lj  = 'standard length at metam'; bibkey.Lj  = 'GoulDoug2016';  
data.Lp  = 2.2;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'GoulDoug2016'; 
data.Li  = 4.4;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'GoulDoug2016';
  comment.Li = 'GoulDoug2016 report 7 cm TL, found in Tahiti';

data.Wwb = 6.54e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GoulDoug2016';
  comment.Wwb = 'based on guessed egg diameter  0.5 mm: pi/6*0.05^3';
  
% uni-variate data
% t-L data
data.tL = [ ... % time (d), standard length (cm)
31.149	1.207
31.154	1.141
31.158	1.087
33.668	1.141
34.380	1.239
35.083	1.446
35.823	1.152
36.190	1.033
38.326	1.304
38.671	1.500
38.698	1.130
39.738	1.652
40.122	1.304
41.208	1.196
42.956	1.859
46.546	1.880
47.278	1.696
48.681	2.163
48.729	1.500
49.049	2.043
50.880	1.554
52.975	2.391
53.047	1.391
53.711	2.152
53.715	2.087
55.828	2.685
56.580	2.207
56.588	2.098
57.246	2.935
57.274	2.554
58.697	2.739
59.422	2.652
59.452	2.239
59.761	2.935
61.593	2.435
63.021	2.554
63.366	2.750
65.150	2.913
66.581	3.000
66.952	2.826
66.959	2.739
67.260	3.543
67.305	2.924
67.708	2.304
68.720	3.228
68.726	3.141
68.745	2.870
69.832	2.739
70.127	3.641
70.178	2.924
71.234	3.228
71.602	3.109
71.966	3.033
73.065	2.739
73.408	2.967
73.748	3.228
74.468	3.207
74.489	2.913
75.198	3.043
75.877	3.598
75.884	3.500
75.892	3.391
75.914	3.087
76.664	2.641
78.086	2.848
79.481	3.424
79.873	2.967
80.574	3.217
81.660	3.098
85.212	3.652
85.608	3.141
85.944	3.467
85.946	3.435
86.296	3.565
86.635	3.848
86.686	3.141
87.380	3.478
88.840	3.152
89.515	3.761
90.266	3.304
92.068	3.217
93.121	3.554
93.142	3.261
94.232	3.098
96.027	3.109
97.101	3.163
97.436	3.489
98.855	3.739
99.207	3.837
100.298	3.652
100.313	3.446
102.475	3.348
102.479	3.293
104.602	3.739
104.659	2.946
105.687	3.641
106.801	3.130
107.497	3.446
108.538	3.957
111.416	3.891
111.784	3.772
115.712	4.098
118.215	4.250
118.976	3.652
120.786	3.467
122.949	3.348
124.003	3.685
132.234	4.109
141.915	4.348
142.690	3.554
148.441	3.511
148.446	3.435
150.583	3.696
151.267	4.174
170.683	3.902
202.264	4.293
234.950	4.304];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GoulDoug2016';

% L-W data
data.LW = [ ... % standard length (cm), wet weight (g)
1.096	0.043
1.198	0.061
1.246	0.061
1.246	0.078
1.288	0.078
1.288	0.087
1.347	0.078
1.347	0.091
1.347	0.100
1.347	0.108
1.384	0.087
1.395	0.091
1.395	0.108
1.448	0.078
1.448	0.091
1.448	0.108
1.507	0.104
1.651	0.130
1.694	0.139
1.699	0.173
1.897	0.212
1.897	0.251
2.057	0.316
2.100	0.281
2.148	0.333
2.185	0.342
2.244	0.355
2.244	0.381
2.292	0.368
2.399	0.416
2.399	0.429
2.399	0.459
2.441	0.606
2.489	0.506
2.543	0.502
2.548	0.580
2.655	0.589
2.655	0.610
2.655	0.684
2.687	0.645
2.703	0.649
2.746	0.632
2.746	0.667
2.746	0.693
2.746	0.740
2.858	0.758
2.895	0.797
2.895	0.818
2.895	0.835
2.895	0.857
2.895	0.883
2.906	0.658
2.938	0.714
2.943	0.840
2.943	0.866
2.943	0.879
2.943	0.909
2.948	0.762
2.986	0.732
2.996	1.022
2.996	1.039
3.007	0.775
3.039	0.922
3.039	0.935
3.039	0.961
3.044	0.870
3.060	1.069
3.082	0.970
3.082	0.991
3.103	1.069
3.141	0.840
3.141	1.026
3.146	1.065
3.146	1.104
3.146	1.177
3.146	0.952
3.189	1.039
3.189	1.087
3.189	1.147
3.189	1.160
3.205	0.983
3.247	1.052
3.247	1.082
3.285	1.091
3.306	1.333
3.338	1.498
3.354	1.299
3.386	1.273
3.386	1.255
3.402	1.195
3.402	1.126
3.445	1.264
3.445	1.329
3.450	1.450
3.493	1.429
3.504	1.307
3.541	1.199
3.578	1.320
3.605	1.515
3.637	1.359
3.637	1.403
3.690	1.424
3.690	1.524
3.744	1.485
3.786	1.675
4.085	1.861
4.091	2.234
4.149	2.078
4.240	2.307
4.283	2.229];
units.LW   = {'cm', 'g'};  label.LW = {'standard length', 'wet weight'};  
bibkey.LW = 'GoulDoug2016';

% L-N data
data.LN = [ ... % time (d), standard length (cm)
2.198	412.346
2.345	437.037
2.554	412.346
2.554	558.848
2.597	461.728
2.597	491.358
2.604	420.576
2.647	478.189
2.651	489.712
2.701	539.095
2.701	644.444
2.701	664.198
2.705	438.683
2.705	465.021
2.748	651.029
2.752	484.774
2.795	570.370
2.799	585.185
2.802	614.815
2.806	649.383
2.806	476.543
2.806	466.667
2.806	417.284
2.892	506.173
2.892	519.342
2.892	545.679
2.903	792.593
2.950	647.737
2.950	692.181
2.950	425.514
2.993	418.930
2.993	616.461
2.993	632.922
3.000	683.951
3.000	688.889
3.000	698.765
3.040	458.436
3.043	590.123
3.043	595.062
3.043	609.877
3.050	544.033
3.054	698.765
3.058	774.486
3.094	863.374
3.097	710.288
3.097	731.687
3.104	525.926
3.144	873.251
3.147	655.967
3.147	609.877
3.194	779.424
3.198	649.383
3.241	570.370
3.248	731.687
3.248	799.177
3.338	787.654
3.349	698.765
3.353	563.786
3.353	598.354
3.403	690.535
3.403	639.506
3.403	604.938
3.442	463.374
3.442	535.802
3.442	649.383
3.446	600.000
3.446	614.815
3.500	621.399
3.540	603.292
3.543	683.951
3.543	736.626
3.543	754.733
3.547	690.535
3.644	718.519
3.647	774.486
3.647	807.407
3.647	970.370
3.655	856.790
3.741	876.543
3.741	868.313
3.745	820.576
3.748	715.226
3.799	767.901
3.842	794.239
3.853	976.955
3.853	988.477
3.899	920.988];
units.LN   = {'cm', '#'};  label.LN = {'standard length', 'batch fecundity'};  
temp.LN    = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GoulDoug2016';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'This analysis assumes 4 broods per yr';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Male tends the eggs by storing them in his mouth';
metaData.bibkey.F1 = 'GoulDoug2016'; 
F2 = 'Diameter of bioluminescent organ is proportional to length and number of bacteria Photobacterium mandapamensis grows exponentially with length';
metaData.bibkey.F2 = 'GoulDoug2016'; 
F3 = 'Associates with sea urchins Diadema setosum and Echinothrix calamaris';
metaData.bibkey.F3 = 'GoulDoug2016'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4XNCL'; % Cat of Life
metaData.links.id_ITIS = '642247'; % ITIS
metaData.links.id_EoL = '46577689'; % Ency of Life
metaData.links.id_Wiki = 'Siphamia'; % Wikipedia
metaData.links.id_ADW = 'Siphamia_tubifer'; % ADW
metaData.links.id_Taxo = '187807'; % Taxonomicon
metaData.links.id_WoRMS = '277708'; % WoRMS
metaData.links.id_fishbase = 'Siphamia-tubifer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siphamia_tubifer}}';
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
bibkey = 'GoulDoug2016'; type = 'Article'; bib = [ ... 
'author = {A. L. Gould and K. E. Dougan and S. T. Koenigbauer and P. V. Dunlap}, ' ... 
'year = {2016}, ' ...
'title = {Life history of the symbiotically luminous cardinalfish \emph{Siphamia tubifer} ({P}erciformes: {A}pogonidae)}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {89}, ' ...
'pages = {1359-1377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/59179}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

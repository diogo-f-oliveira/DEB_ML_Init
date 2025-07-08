function [data, auxData, metaData, txtData, weights] = mydata_Spratelloides_lewisi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Spratelloididae';
metaData.species    = 'Spratelloides_lewisi'; 
metaData.species_en = 'Lewis'' round herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 10]; 


%% set data
% zero-variate data;

data.am = 6*30.5;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MiltBlab1991';   
  temp.am = C2K(28.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 2.3;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on same realtive length, compared to Spratelloides_gracilis: 4/10.5*6 cm';
data.Li  = 6; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'Wiki';

data.Wwb = 4.8e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ShirWata2007';
  comment.Wwb = 'based on egg diameter of  0.45 mm of Spratelloides_gracilis: pi/6*0.045^3';
data.Wwi = 1.43;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.14, see F1';

data.Ri  = 1230*1.43/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(28.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL_Mun = [ % time since birth (d), standard length (cm)
17.266	1.907
17.266	2.034
18.993	1.705
19.424	1.958
22.878	1.959
28.058	2.265
31.511	2.215
31.511	2.494
33.669	2.520
33.669	2.723
34.964	2.495
36.259	2.724
38.417	2.978
38.849	2.826
42.734	2.878
50.935	3.844
53.094	3.210
53.094	3.109
53.525	3.591
53.525	3.769
55.683	3.490
56.547	3.719
56.978	3.440
57.410	3.161
58.273	2.882
58.705	3.643
58.705	4.252
59.137	3.009
59.137	3.364
59.568	3.770
60.000	3.111
61.295	3.568
62.158	3.720
62.158	3.923
62.590	3.416
62.590	3.264
63.453	4.025
64.317	2.960
65.180	3.138
65.180	3.366
65.180	3.620
65.180	3.772
65.180	4.076
66.475	4.203
67.338	4.026
68.633	3.621
69.928	3.621
69.928	3.849
69.928	4.027
70.360	4.281
70.360	4.357
71.655	4.179
72.518	3.470
73.381	4.358
73.813	3.571
73.813	3.876
75.971	3.724
76.835	4.384
77.266	4.054
78.130	4.283
78.561	3.370
79.424	3.953
80.719	4.233
81.151	3.599
81.583	3.954
82.014	4.487
82.014	4.411
83.741	4.132
83.741	4.208
85.036	4.462
85.036	4.691
85.036	4.817
88.489	4.869
90.216	4.464
91.079	4.895
95.396	5.074
95.396	4.567
97.554	4.922
102.734	4.467
103.165	5.000
105.755	4.899
110.935	4.825];  
units.tL_Mun = {'d', 'cm'};  label.tL_Mun = {'time since birth', 'standard length', 'Munda'};  
temp.tL_Mun = C2K(28.8);  units.temp.tL_Mun = 'K'; label.temp.tL_Mun = 'temperature';
bibkey.tL_Mun = 'MiltBlab1991';
comment.tL_Mun = 'Data from Munda';
%
data.tL_Von = [ % time since birth (d), standard length (cm)
25.311	1.815
25.336	1.611
26.966	2.426
29.628	1.892
30.434	2.376
30.942	1.765
32.086	3.013
33.513	1.970
34.271	2.835
34.328	2.377
35.162	2.632
35.711	1.690
36.011	2.759
36.046	2.479
36.375	3.319
36.968	2.021
37.363	2.327
37.375	2.225
38.648	2.429
39.156	1.818
41.232	2.532
42.022	3.143
42.464	3.067
42.577	2.150
42.593	2.023
43.875	2.151
45.492	3.068
47.214	3.144
48.104	2.941
49.295	3.807
49.453	2.534
50.170	3.731
50.663	3.247
51.083	3.349
52.302	3.986
52.757	3.808
53.575	4.190
54.475	3.910
54.889	4.063
55.438	3.121
55.457	2.969
55.776	3.885
55.830	3.452
56.619	4.063
57.172	3.096
57.949	3.809
59.648	4.064
59.676	3.835
60.134	3.632
60.150	3.504
61.796	4.192
62.203	4.396
62.266	3.887
62.298	3.632
62.699	3.887
62.756	3.429
63.150	3.734
63.542	4.065
64.392	4.193
65.285	3.964
65.668	4.371
66.126	4.168
68.302	4.067
69.117	4.474
69.164	4.092
69.991	4.398
70.446	4.220
71.255	4.678
72.581	4.450
73.030	4.323
74.735	4.527
75.143	4.730
75.199	4.272
75.256	3.814
76.908	4.451
77.795	4.273
78.598	4.782
78.683	4.095
81.652	4.580
82.069	4.707
83.834	4.427
84.680	4.580
89.045	4.276
95.889	4.915
97.610	4.991
101.925	5.094
104.088	5.095
106.687	5.070
109.738	4.893
111.447	5.072
113.174	5.098];  
units.tL_Von = {'d', 'cm'};  label.tL_Von = {'time since birth', 'standard length', 'Vonavona'};  
temp.tL_Von = C2K(28.8);  units.temp.tL_Von = 'K'; label.temp.tL_Von = 'temperature';
bibkey.tL_Von = 'MiltBlab1991';
comment.tL_Von = 'Data from Vonavona';
%
data.tL_Tul = [ % time since birth (d), standard length (cm)
42.101	3.409
42.146	3.229
46.764	3.848
47.229	3.720
51.738	3.026
51.923	4.030
51.949	3.927
52.325	4.158
52.357	4.030
52.446	3.670
52.708	4.364
54.047	4.210
54.047	4.210
54.060	4.159
54.360	4.699
54.876	4.365
56.158	4.443
56.688	4.057
56.713	3.954
57.428	4.572
58.346	4.366
58.378	4.237
58.716	4.624
59.290	4.058
62.377	3.853
64.469	4.162
64.622	5.294
65.279	4.394
65.642	4.677
67.237	3.494
67.620	3.700
68.257	4.626
70.394	4.756
70.426	4.627
70.770	4.987
71.166	5.142
71.427	4.087
72.052	5.065
74.693	4.911
74.744	4.705
74.980	3.753
76.204	5.812
77.218	5.221
77.257	5.066
78.188	4.809
78.271	4.475
78.883	5.504
80.261	5.196
80.612	3.781
80.720	5.093
80.765	4.913
82.149	4.579
82.933	4.914
83.329	5.068
83.705	5.300
83.730	5.197
84.745	4.605
85.325	5.763
85.720	4.168
86.001	4.786
86.071	4.503
90.421	4.452
93.578	5.714
95.523	4.866
95.555	4.737
96.544	4.248
98.553	4.892
99.675	5.613
100.326	4.738
102.437	4.971
103.324	4.894
104.810	5.898
105.926	4.894
108.713	5.899
111.315	5.900
112.750	5.360
113.682	5.102
113.784	4.691
114.147	4.974
114.447	5.514
114.498	5.309
115.939	4.743
116.080	4.177
116.220	5.361
116.488	6.030
117.432	5.721
117.789	6.030
118.070	4.898
120.238	4.898
122.311	5.285
122.496	6.289
123.861	6.032
124.518	5.131
125.902	4.797
126.565	5.621
128.300	5.621
129.199	5.493
129.225	5.390
132.656	5.545
133.166	5.237
133.479	5.726
133.504	5.623
135.392	5.006
136.859	6.087
138.792	5.290
140.578	5.084
140.609	4.956
140.941	5.368
141.828	5.291
142.663	5.420
143.014	5.754
144.034	5.137
145.361	5.034
145.603	5.806
145.642	5.652
146.879	5.910
150.138	5.010
150.916	5.370
153.786	6.040
159.444	5.965
161.242	5.708
166.370	6.018
167.792	5.530
168.080	6.122
170.018	5.299
171.587	5.968
175.618	5.455];  
units.tL_Tul = {'d', 'cm'};  label.tL_Tul = {'time since birth', 'standard length', 'Tulagi'};  
temp.tL_Tul = C2K(28.8);  units.temp.tL_Tul = 'K'; label.temp.tL_Tul = 'temperature';
bibkey.tL_Tul = 'MiltBlab1991';
comment.tL_Tul = 'Data from Tulagi';


%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 5 * weights.Ri;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Mun', 'tL_Von', 'tL_Tul'}; subtitle1 = {'Data for loc Mun, Von, Tul'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00513*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'standard-total length: SL = TL * 0.87';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4ZDQ5'; % Cat of Life
metaData.links.id_ITIS = '551213'; % ITIS
metaData.links.id_EoL = '46562436'; % Ency of Life
metaData.links.id_Wiki = 'Spratelloides'; % Wikipedia
metaData.links.id_ADW = 'Spratelloides_lewisi'; % ADW
metaData.links.id_Taxo = '187976'; % Taxonomicon
metaData.links.id_WoRMS = '272278'; % WoRMS
metaData.links.id_fishbase = 'Spratelloides-lewisi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spratelloides}}';
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
bibkey = 'ShirWata2007'; type = 'Article'; bib = [ ... 
'author = {Norio Shirafuji  and Yoshiro Watanabe and Yasuyuki Takeda and  Tomohiko Kawamura}, ' ... 
'year = {2007}, ' ...
'title = {Maturation and spawning of \emph{Spratelloides gracilis} {C}lupeidae in temperate waters off {C}ape {S}hionomisaki, central {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {73}, ' ...
'pages = {623-632}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiltBlab1991'; type = 'Article'; bib = [ ... 
'author = {D. A. Milton and S. J. M. Blaber and N. J. F. Rawlinson}, ' ... 
'year = {1991}, ' ...
'title = {Age and growth of three species of tuna baitfish (genus: \emph{Spratelloides) in the tropical {I}ndp-{P}acific}}, ' ...
'journal = {Journal of fish Biology}, ' ...
'volume = {39}, ' ...
'pages = {849-866}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Spratelloides-lewisi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

function [data, auxData, metaData, txtData, weights] = mydata_Tanymastigites_perrieri
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Tanymastigidae';
metaData.species    = 'Tanymastigites_perrieri'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'T-ap'; 'T-am'; 'T-Ri'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 18]; 

%% set data
% zero-variate data

data.Lb  = 0.075; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'BelaKhat2003';
data.Lp  = 0.88;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BelaKhat2003';
data.Li  = 2.3;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BelaKhat2003';
  
data.Wdi  = 0.0207;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.6/1)^3';

% uni-variate data
% time-length
data.tL_10f = [ ... % time since birth (d), length (cm)
0.981	0.076
2.753	0.120
4.133	0.126
5.313	0.176
6.690	0.214
8.264	0.264
8.852	0.315
11.215	0.365
13.570	0.510
14.157	0.573
15.334	0.649
16.505	0.812
16.510	0.743
18.077	0.888
19.056	0.982
22.982	1.222
24.159	1.291
27.691	1.530
29.068	1.574
30.443	1.644
34.962	1.870
37.916	1.927
41.067	1.990
43.436	1.958
45.406	1.996
49.941	2.009
52.104	2.091
55.261	2.084
57.027	2.198
62.149	2.280
64.320	2.261
66.293	2.254
68.858	2.236
71.026	2.261
73.001	2.223
75.959	2.236
80.099	2.261];
units.tL_10f   = {'d', 'cm'}; label.tL_10f = {'time since birth', 'length', 'females'};  
temp.tL_10f = C2K(10); units.temp.tL_10f = 'K'; label.temp.tL_10f = 'temperature'; 
bibkey.tL_10f = 'BelaKhat2003'; comment.tL_10f = 'females at 10 C';
%
data.tL_10m = [ ... % time since birth (d), length (cm)
0.390	0.063
1.572	0.088
2.951	0.107
4.921	0.145
5.904	0.176
7.481	0.195
8.266	0.239
9.249	0.283
9.837	0.327
11.019	0.353
11.608	0.378
12.395	0.409
15.339	0.592
16.320	0.655
16.904	0.756
17.886	0.812
18.866	0.888
19.653	0.913
20.833	0.951
21.814	1.026
22.795	1.083
23.777	1.140
26.912	1.398
28.878	1.486
30.645	1.593
35.364	1.776
37.920	1.870
41.078	1.845
45.802	1.977
49.944	1.977
52.314	1.933
55.273	1.927
57.044	1.977
61.969	2.059
64.727	2.097
65.706	2.185
69.257	2.179
73.006	2.166
75.768	2.154
76.751	2.198
80.502	2.147
84.446	2.154
87.406	2.147
91.349	2.166
94.111	2.160
97.266	2.166];
units.tL_10m   = {'d', 'cm'}; label.tL_10m = {'time since birth', 'length', 'males'};  
temp.tL_10m = C2K(10); units.temp.tL_10m = 'K'; label.temp.tL_10m = 'temperature'; 
bibkey.tL_10m = 'BelaKhat2003'; comment.tL_10m = 'males at 10 C';
%
data.tL_20f = [ ... % time since birth (d), length (cm)
0.000	0.050
1.771	0.094
3.943	0.113
6.117	0.120
7.680	0.346
10.235	0.523
11.992	0.793
13.758	0.951
16.705	1.178
17.871	1.429
20.428	1.581
22.795	1.637
24.767	1.694
26.148	1.725
27.721	1.820
28.907	1.820
29.892	1.858
31.471	1.883
34.628	1.952
36.405	1.965
37.981	2.034
39.954	2.072
42.127	2.091
43.903	2.116
46.076	2.128
48.052	2.135
50.226	2.128
51.610	2.128
53.583	2.166
55.754	2.204
57.924	2.254
59.902	2.229
61.682	2.217
63.856	2.217
65.829	2.261
67.604	2.305
70.177	2.254
72.151	2.286
73.733	2.273
75.908	2.261
77.884	2.261
79.663	2.254
81.835	2.286
85.787	2.286];
units.tL_20f   = {'d', 'cm'}; label.tL_20f = {'time since birth', 'length', 'females'};  
temp.tL_20f = C2K(20); units.temp.tL_20f = 'K'; label.temp.tL_20f = 'temperature'; 
bibkey.tL_20f = 'BelaKhat2003'; comment.tL_20f = 'females at 20 C';
%
data.tL_20m = [ ... % time since birth (d), length (cm)
4.733	0.126
7.878	0.334
10.431	0.542
11.790	0.850
13.952	1.001
16.108	1.222
17.874	1.385
20.436	1.480
22.010	1.568
25.757	1.662
27.726	1.757
27.728	1.738
29.500	1.820
32.268	1.807
36.012	1.940
38.381	1.977
40.156	2.015
42.333	1.984
43.710	2.059
45.486	2.091
47.664	2.040
49.638	2.078
52.008	2.097
53.590	2.084
55.964	2.053
57.743	2.047
60.509	2.053
61.695	2.047
64.265	2.047
65.644	2.103
67.618	2.128
69.990	2.122
71.368	2.185
73.543	2.179
75.919	2.122
77.894	2.128
80.266	2.135
82.038	2.217
86.188	2.217];
units.tL_20m   = {'d', 'cm'}; label.tL_20m = {'time since birth', 'length', 'males'};  
temp.tL_20m = C2K(20); units.temp.tL_20m = 'K'; label.temp.tL_20m = 'temperature'; 
bibkey.tL_20m = 'BelaKhat2003'; comment.tL_20m = 'males at 20 C';
%
data.tL_25f = [ ... % time since birth (d), length (cm)
0.000	0.044
1.375	0.131
2.159	0.256
3.238	0.400
3.822	0.594
4.899	0.800
5.971	1.119
6.850	1.351
7.927	1.532
9.008	1.632
9.796	1.675
11.271	1.769
11.961	1.794
13.929	1.906
15.209	1.943
15.701	1.974
16.883	2.017
18.265	1.986
18.856	1.985
19.940	2.010
20.829	1.991
21.814	2.003
22.799	2.028
24.082	2.021
24.871	2.014
26.449	2.008
29.210	2.013];
units.tL_25f   = {'d', 'cm'}; label.tL_25f = {'time since birth', 'length', 'females'};  
temp.tL_25f = C2K(25); units.temp.tL_25f = 'K'; label.temp.tL_25f = 'temperature'; 
bibkey.tL_25f = 'BelaKhat2003'; comment.tL_25f = 'females at 25 C';
%
data.tL_25m = [ ... % time since birth (d), length (cm)
0.000	0.063
1.080	0.106
2.257	0.275
3.139	0.431
3.922	0.581
5.096	0.806
5.972	1.113
7.730	1.538
9.401	1.688
10.094	1.619
11.076	1.719
11.963	1.744
12.948	1.756
14.129	1.818
14.916	1.862
16.003	1.811
17.183	1.898
17.972	1.898
18.959	1.885
19.947	1.847
21.034	1.772
22.216	1.827];
units.tL_25m   = {'d', 'cm'}; label.tL_25m = {'time since birth', 'length', 'males'};  
temp.tL_25m = C2K(25); units.temp.tL_25m = 'K'; label.temp.tL_25m = 'temperature'; 
bibkey.tL_25m = 'BelaKhat2003'; comment.tL_25m = 'males at 25 C';
%
data.tL_30f = [ ... % time since birth (d), length (cm)
0.294	0.065
1.280	0.140
2.261	0.316
2.948	0.429
4.026	0.648
5.206	0.792
5.890	1.005
7.169	1.131
8.054	1.250
9.334	1.363
10.119	1.514
11.202	1.595
12.185	1.727
12.972	1.827
14.159	1.796
15.046	1.846
15.934	1.884
17.318	1.872];
units.tL_30f   = {'d', 'cm'}; label.tL_30f = {'time since birth', 'length', 'females'};  
temp.tL_30f = C2K(30); units.temp.tL_30f = 'K'; label.temp.tL_30f = 'temperature'; 
bibkey.tL_30f = 'BelaKhat2003'; comment.tL_30f = 'females at 30 C';
%
data.tL_30m = [ ... % time since birth (d), length (cm)
0.097	0.065
1.181	0.147
1.965	0.310
2.947	0.466
5.009	0.786
6.186	1.018
6.970	1.162
7.955	1.244
8.644	1.332
9.925	1.407
11.012	1.420
11.993	1.595
12.780	1.683
13.967	1.646
15.152	1.665
16.041	1.683
17.030	1.665
18.115	1.709];
units.tL_30m   = {'d', 'cm'}; label.tL_30m = {'time since birth', 'length', 'males'};  
temp.tL_30m = C2K(30); units.temp.tL_30m = 'K'; label.temp.tL_30m = 'temperature'; 
bibkey.tL_30m = 'BelaKhat2003'; comment.tL_30m = 'males at 30 C';
%
data.tL_35f = [ ... % time since birth (d), length (cm)
0.197	0.057
0.986	0.195
2.071	0.371
3.254	0.528
4.043	0.616
5.128	0.673
6.114	0.780
7.298	0.899
8.185	1.019
9.073	1.151
10.158	1.270
11.144	1.371];
units.tL_35f   = {'d', 'cm'}; label.tL_35f = {'time since birth', 'length', 'females'};  
temp.tL_35f = C2K(35); units.temp.tL_35f = 'K'; label.temp.tL_35f = 'temperature'; 
bibkey.tL_35f = 'BelaKhat2003'; comment.tL_35f = 'females at 35 C';
%
data.tL_35m = [ ... % time since birth (d), length (cm)
0.296	0.063
1.085	0.201
2.367	0.402
2.761	0.522
4.339	0.616
5.128	0.773
5.917	0.943
7.298	0.987
8.087	1.119
9.172	1.176
10.059	1.308
11.045	1.421
12.032	1.509
13.215	1.566];
units.tL_35m   = {'d', 'cm'}; label.tL_35m = {'time since birth', 'length', 'males'};  
temp.tL_35m = C2K(35); units.temp.tL_35m = 'K'; label.temp.tL_35m = 'temperature'; 
bibkey.tL_35m = 'BelaKhat2003'; comment.tL_35m = 'males at 35 C';

% temperature-time since birth at puberty
data.Ttp = [ ... % temperature (C), time since birth at puberty (d)
    10 19.084
    20 7.275
    25 5.356
    30 4.275
    35 3.671];
units.Ttp   = {'C', 'd'}; label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'BelaKhat2003'; treat.Ttp = {0 {}};

% temperature-life span
data.Tam = [ ... % temperature (C), life span (d)
    10 99.549
    20 44.168
    25 32.598
    30 19.035
    35 14.431];
units.Tam   = {'C', 'd'}; label.Tam = {'temperature', 'life span'};  
bibkey.Tam = 'BelaKhat2003'; treat.Tam = {0 {}};

% temperature-reproduction
data.TRi = [ ... % temperature (C), reprod rate (#/d)
    10 296/32
    20 447.4/26
    25 262.2/12
    30 67.1/11
    35 25.0/2];
units.TRi   = {'C', '#/d'}; label.TRi = {'temperature', 'reproduction rate'};  
bibkey.TRi = 'BelaKhat2003'; treat.TRi = {0 {}};
comment.TRi = 'based on livetime egg number per reproduction period';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdi = weights.Wdi * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_10f','tL_10m'}; subtitle1 = {'Data for females, males at 10 C'};
set2 = {'tL_20f','tL_20m'}; subtitle2 = {'Data for females, males at 20 C'};
set3 = {'tL_25f','tL_25m'}; subtitle3 = {'Data for females, males at 25 C'};
set4 = {'tL_30f','tL_30m'}; subtitle4 = {'Data for females, males at 30 C'};
set5 = {'tL_35f','tL_35m'}; subtitle5 = {'Data for females, males at 35 C'};
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only'; 
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54PRT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Tanymastigidae'; % Wikipedia
metaData.links.id_ADW = 'Tanymastigites_perrieri'; % ADW
metaData.links.id_Taxo = '949967'; % Taxonomicon
metaData.links.id_WoRMS = '1290356'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branchinecta_gigas}}';
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
bibkey = 'BelaKhat2003'; type = 'Article'; bib = [ ... 
'author = {L. Beladjal and E. M. Khattabi and J. Mertens}, ' ... 
'year = {2003}, ' ...
'title = {Life History of \emph{Tanymastigites perrieri} ({A}nostraca) in Relation to Temperature}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {76(2)}, ' ...
'pages = {135-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

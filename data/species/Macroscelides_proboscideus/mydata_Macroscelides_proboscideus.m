function [data, auxData, metaData, txtData, weights] = mydata_Macroscelides_proboscideus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Macroscelidea'; 
metaData.family     = 'Macroscelididae';
metaData.species    = 'Macroscelides_proboscideus'; 
metaData.species_en = 'Short-eared sengis'; 

metaData.ecoCode.climate = {'BWh', 'BWk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 11];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 60.5;  units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Olbr2009';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '60-61 d; temp from AnAge';
data.tx = 20;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-25 d';
data.tp = 43;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Olbr2009';
  temp.tp = C2K(36.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '41-45 d';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Olbr2009';   
  temp.am = C2K(36.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 11;   units.Li  = 'cm';  label.Li  = 'ultimate nose-tail length';   bibkey.Li  = 'Olbr2009';

data.Wwb = 8;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Olbr2009';
data.Wwx = 22;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Olbr2009';
data.Wwi = 40;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Olbr2009';
data.Wwim = 42;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Olbr2009';

data.Ri  = 46/5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Olbr2009';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), length (cm)
0.000	4.852
0.000	4.127
0.000	6.749
0.000	6.359
0.000	5.410
0.000	5.076
1.655	5.467
1.697	3.849
3.482	4.240
13.085	7.813
17.427	6.531
17.804	5.806
48.897	11.504
90.991	8.280
100.239	11.685
121.790	11.413
156.669	9.470
194.369	9.536];units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'nose-tail length', 'female'};  
temp.tL_f  = C2K(36.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Olbr2009';
comment.tL_f = '% female, second year sub-adult, directly after emergence from hibernation';
%
data.tL_m = [ ... % time since birth (d), wet weight (g)
0.145	3.347
0.157	6.136
1.628	6.526
1.998	6.080
2.027	4.965
2.698	6.806
13.453	7.478
15.641	6.140
16.669	8.092
18.791	9.320
21.685	8.484
37.454	9.660
101.017	9.343
112.510	9.235
144.813	9.746
200.093	10.375];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'nose-tail length', 'male'};  
temp.tL_m   = C2K(36.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Olbr2009';

% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.029	4.616
0.040	6.516
0.046	7.602
4.622	5.967
49.167	23.011
101.432	33.256
193.554	43.177];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(36.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Olbr2009';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.366	1.900
2.152	5.699
2.161	7.328
2.875	8.684
38.279	30.899
101.419	31.085
143.737	29.398
199.502	35.024
266.834	28.145];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(36.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Olbr2009';
%
data.tW_f4E = [ ...
0.844	8.680
1.976	8.546
3.006	8.546
3.936	9.748
4.862	9.481
6.099	10.148
7.960	12.953
8.990	13.086
10.017	11.884
11.050	13.487
11.979	14.154
12.908	15.356
13.834	14.822
14.866	15.890
17.239	17.626
17.958	16.958
19.196	17.626
20.018	16.691
21.049	17.493
22.082	18.561
22.803	18.961
25.899	21.365
26.928	21.231
28.062	21.499
29.094	22.433
30.023	23.368
30.951	24.169
32.087	25.504
33.013	24.970
34.044	25.638
34.975	27.107
35.798	26.973
37.963	28.042
41.156	28.042
43.121	31.513
45.079	32.315
49.096	32.582
51.260	33.249
53.116	34.184
54.149	35.386
56.003	35.386
57.136	35.653
58.166	35.653
58.989	35.252
60.123	35.920
60.948	36.053
64.243	36.053
66.201	36.721
67.025	36.454
68.052	35.519
69.185	35.386
70.113	35.920
71.042	36.988
72.180	39.258
73.207	37.923
75.168	39.525
77.125	39.792
78.156	40.059
80.010	40.193
82.070	40.460
84.440	41.128
87.321	40.059
90.203	39.258
93.192	40.193
96.283	40.994];
units.tW_f4E = {'d', 'g'};  label.tW_f4E = {'time since birth', 'wet weight'};  
temp.tW_f4E  = C2K(36.2);  units.temp.tW_f4E = 'K'; label.temp.tW_f4E = 'temperature';
bibkey.tW_f4E = 'Olbr2009';
%
data.tW_f4F = [ ...
4.963	8.546
5.996	9.748
7.025	9.481
7.852	10.816
8.983	10.015
9.915	12.285
10.945	12.552
11.874	13.353
12.803	14.288
13.628	14.555
14.763	15.490
15.691	16.291
16.932	18.294
18.066	18.828
19.097	19.228
20.022	18.561
20.848	19.629
21.879	20.163
23.218	20.163
26.005	22.967
26.934	23.635
27.861	23.902
28.892	24.570
30.129	24.970
31.057	25.371
31.986	26.306
33.119	26.306
34.046	26.306
35.078	27.240
36.007	28.175
37.141	28.843
37.861	28.175
41.156	28.175
43.117	30.045
45.075	30.312
48.887	31.380
51.048	30.579
53.213	31.513
54.037	31.380
55.992	30.846
57.025	31.914
57.849	32.181
58.984	32.982
60.217	31.914
60.940	32.715
64.237	33.383
66.197	34.585
67.328	33.917
67.740	34.050
69.077	32.982
70.109	33.917
71.037	34.451
72.067	34.852
73.200	34.852
75.264	36.721
77.119	36.988
78.045	36.588
80.105	36.721
81.856	37.122
84.227	37.789
87.004	36.588
89.989	35.786
93.186	37.789
96.068	36.988];
units.tW_f4F = {'d', 'g'};  label.tW_f4F = {'time since birth', 'wet weight'};  
temp.tW_f4F  = C2K(36.2);  units.temp.tW_f4F = 'K'; label.temp.tW_f4F = 'temperature';
bibkey.tW_f4F = 'Olbr2009';
%
data.tW_m4G = [ ...
3.932	8.145
5.065	8.145
6.097	9.214
7.130	10.415
8.163	12.018
9.194	12.418
10.020	13.220
11.155	14.288
26.933	23.234
29.201	24.570
30.131	25.638
31.161	25.772
32.089	26.172
33.223	26.973
34.152	27.641
36.932	27.507
38.171	28.709
39.097	28.576
40.127	28.442
41.260	28.442
42.186	28.042
43.217	28.709
44.248	28.976
45.072	29.243
46.202	27.908
48.056	27.908
50.320	27.374
51.246	27.107
53.103	28.175
55.059	28.175
57.326	28.576
60.005	29.243
63.199	29.644
66.289	29.777
69.170	28.843
74.220	30.579
78.342	31.647
89.265	34.318
94.107	34.852];
units.tW_m4G = {'d', 'g'};  label.tW_m4G = {'time since birth', 'wet weight'};  
temp.tW_m4G  = C2K(36.2);  units.temp.tW_m4G = 'K'; label.temp.tW_m4G = 'temperature';
bibkey.tW_m4G = 'Olbr2009';
%
data.tW_m4J = [ ...
1.155	9.614
2.187	10.415
3.013	11.484
4.046	12.819
4.871	13.353
5.903	14.288
6.935	15.356
8.070	16.157
9.306	16.424
9.822	16.825
11.061	18.294
11.782	18.294
12.915	18.294
14.153	18.961
15.081	19.629
15.803	20.163
17.041	21.231
18.174	20.964
20.030	22.166
22.095	24.436
23.951	25.504
26.117	26.840
29.105	27.507
32.091	27.240
34.977	28.309
40.228	27.774
44.134	24.169
52.167	24.436
57.112	25.237
63.089	26.573
70.917	26.973
81.118	29.377];    
units.tW_m4J = {'d', 'g'};  label.tW_m4J = {'time since birth', 'wet weight'};  
temp.tW_m4J  = C2K(36.2);  units.temp.tW_m4J = 'K'; label.temp.tW_m4J = 'temperature';
bibkey.tW_m4J = 'Olbr2009';
%
data.tW_f4I = [ ...
2.084	10.549
2.912	12.418
3.944	13.487
4.974	13.220
6.004	13.353
7.034	13.487
8.065	14.021
11.057	16.291
12.089	17.359
13.018	18.294
13.844	18.961
14.876	20.163
15.907	20.430
17.042	21.499
18.176	22.166
19.004	23.635
19.931	23.635
22.100	26.573
24.061	28.576
25.196	29.243
27.051	29.777
29.115	31.647
31.075	33.383
34.167	34.184
37.052	34.985
40.246	35.653
43.029	36.721];
units.tW_f4I = {'d', 'g'};  label.tW_f4I = {'time since birth', 'wet weight'};  
temp.tW_f4I  = C2K(36.2);  units.temp.tW_f4I = 'K'; label.temp.tW_f4I = 'temperature';
bibkey.tW_f4I = 'Olbr2009';
%
data.tW_m4C = [ ...
1.775	10.549
3.014	11.751
3.840	12.819
33.133	32.448
33.958	32.982
36.940	30.846
37.868	31.246
39.209	32.448
40.135	32.181
41.064	32.982
42.094	33.116
43.023	34.050
44.157	34.184
44.980	34.184
46.013	35.252
47.144	34.585
47.971	35.920
49.207	35.786
61.157	37.656
64.247	37.789
65.276	37.389
66.204	37.789
67.135	39.659
71.048	39.258
73.316	40.593
75.168	39.525
78.050	39.125
79.290	40.861
81.970	41.929
87.324	41.128
89.282	41.929
93.089	40.326
96.284	41.395
97.306	38.056];
units.tW_m4C = {'d', 'g'};  label.tW_m4C = {'time since birth', 'wet weight'};  
temp.tW_m4C  = C2K(36.2);  units.temp.tW_m4C = 'K'; label.temp.tW_m4C = 'temperature';
bibkey.tW_m4C = 'Olbr2009';
%
data.tW_m4B = [ ...
2.290	10.682
34.365	30.579
37.245	29.377
38.480	28.976
39.408	29.377
40.439	29.777
41.159	29.510
42.499	29.777
43.325	30.712
44.663	30.712
45.283	31.380
46.314	32.047
47.241	31.914
48.271	31.914
49.303	32.849
61.259	36.988
64.453	37.923
65.377	36.588
66.306	37.255
67.338	38.457
71.251	38.190
73.519	38.991
75.371	38.457
76.502	37.389
78.459	37.656
82.273	38.991
87.524	38.591
97.411	38.858];    
units.tW_m4B = {'d', 'g'};  label.tW_m4B = {'time since birth', 'wet weight'};  
temp.tW_m4B  = C2K(36.2);  units.temp.tW_m4B = 'K'; label.temp.tW_m4B = 'temperature';
bibkey.tW_m4B = 'Olbr2009';

%% set weights for all real data
weights = setweights(data, []);

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
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
set3 = {'tW_f4E','tW_f4F','tW_f4I'}; subtitle3 = {'Data for females 4E, 4F, 4I'};
set4 = {'tW_m4G','tW_m4J','tW_m4C','tW_m4B'}; subtitle4 = {'Data for males 4G, 4J, 4C, 4B'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Individuals are assumed to differ in feeding only';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'T can drop till 0 C during hibernation';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6R3ZG'; % Cat of Life
metaData.links.id_ITIS = '584922'; % ITIS
metaData.links.id_EoL = '326395'; % Ency of Life
metaData.links.id_Wiki = 'Macroscelides_proboscideus'; % Wikipedia
metaData.links.id_ADW = 'Macroscelides_proboscideus'; % ADW
metaData.links.id_Taxo = '61602'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11200023'; % MSW3
metaData.links.id_AnAge = 'Macroscelides_proboscideus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macroscelides_proboscideus}}';
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
bibkey = 'Olbr2009'; type = 'Phdthesis'; bib = [ ... 
'author = {Olbricht, G.}, ' ... 
'year = {2009}, ' ...
'title = {Aspects of the reproductive biology of Sengis ({M}acriscelidea) in general and the postnatal development of the short-eared sengi (\emph{Macroscelides proboscideus}) in particular}, ' ...
'school = {Univ Duisburg-Essen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macroscelides_proboscideus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/site/accounts/information/Macroscelides~proboscideus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


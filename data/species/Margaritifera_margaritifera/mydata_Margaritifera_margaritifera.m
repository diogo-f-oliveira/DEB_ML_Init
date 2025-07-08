function [data, auxData, metaData, txtData, weights] = mydata_Margaritifera_margaritifera

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Margaritiferidae';
metaData.species    = 'Margaritifera_margaritifera'; 
metaData.species_en = 'Freshwater pearl mussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 03];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 280*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Baue1987 gives 93 yrs is typical in natural populations';

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'Baue1987';  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Baue1987'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 17.6;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'ADW';

data.Wwi  = 196; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(17.6/7.3)^3';

data.Ri = 8e6/365;    units.Ri = '1/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'Baue1987';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL1 = [ ... % time since birth (yr), shell length (cm)
3.141	1.239
4.435	2.832
6.167	3.705
7.026	5.297
7.028	5.008
7.356	4.504
8.121	3.641
8.216	6.024
8.220	5.374
8.872	5.232
9.300	6.389
9.302	5.956
10.183	3.576
10.818	6.611
11.040	5.746
11.043	5.168
12.129	4.956
13.317	6.043
15.042	8.216
15.046	7.566
15.268	6.556
16.235	8.365
16.456	7.644
17.317	9.019
17.335	5.770
18.294	9.023
19.171	7.510
20.359	8.525
21.337	8.240
23.185	7.742
23.290	8.464
24.264	8.973
25.022	9.193
25.452	9.989
26.318	10.425
26.325	9.198
27.192	9.346
28.055	10.432
29.243	11.520
29.362	9.499
30.008	10.512
30.232	9.285
30.235	8.780
30.336	10.008
30.439	11.163
31.309	10.733
32.185	9.437
32.290	10.087
33.150	11.607
33.156	10.452
33.911	11.249
34.126	11.755
34.245	9.878
35.213	11.398
35.318	12.049
36.191	11.113
40.313	11.707
42.909	13.305
43.025	11.934
44.216	12.444
44.974	12.736
48.127	11.881
50.066	14.416
68.952	14.489];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'River C, Scotland'};  
temp.tL1 = C2K(11);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'HastYoun2000';
comment.tL1 = 'Data from River C, Scotland; mean temperature is guessed';
%
data.tL2 = [ ... % time since birth (yr), shell length (cm)
4.011	1.133
5.606	1.207
6.832	2.375
7.077	1.609
7.641	2.850
8.956	2.376
8.982	3.361
9.638	3.070
9.914	3.471
11.939	4.749
13.129	4.567
13.669	4.896
15.112	4.240
17.933	5.518
19.264	5.665
20.992	5.738
22.867	6.360
24.985	6.142
30.023	5.888
30.171	6.472
30.975	6.764
33.901	6.985
34.143	6.072
36.948	6.730
38.527	6.220
39.733	6.658
41.197	6.805
41.304	5.820
44.002	7.427
45.173	6.551
47.143	5.749
47.153	6.114
47.162	6.479
47.465	7.902
48.227	6.589
49.010	6.078
49.035	7.027
49.042	7.283
50.104	7.283
50.109	7.466
51.566	7.357
51.575	7.685
52.084	6.882
52.339	6.481
53.274	6.700
53.421	7.211
54.889	7.541
54.896	7.796
56.341	7.213
57.287	7.833
59.133	7.396
59.292	8.382
60.207	7.835
60.210	7.944
60.464	7.506
60.983	7.069
61.260	7.507
61.263	7.616
62.076	8.237
63.100	6.814
63.124	7.690
64.451	7.690
65.508	7.508
66.029	7.144
66.867	8.677
68.294	7.436
69.119	8.532
69.133	9.043
70.326	8.970
71.100	8.131
71.111	8.569
71.222	7.730
72.549	7.730
73.866	7.329
74.683	8.096
75.889	8.534
76.110	6.856
78.007	8.316
78.014	8.572
78.130	7.915
80.522	8.025
82.259	8.464
84.128	8.866
84.249	8.428];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'River D, Scotland'};  
temp.tL2 = C2K(7);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'HastYoun2000';
comment.tL2 = 'Data from River D, Scotland; mean temperature is guessed';
%
data.tL3 = [ ... % time since birth (yr), shell length (cm)
4.751	2.710
4.942	2.249
5.151	3.304
6.320	2.251
8.719	5.683
9.895	5.289
11.070	4.763
11.078	5.423
11.894	8.061
12.072	6.413
12.079	7.006
14.033	5.757
14.055	7.801
14.242	6.878
18.972	7.544
20.137	6.095
20.145	6.755
20.756	8.667
22.137	8.999
23.711	8.936
24.091	7.683
25.490	9.663
26.268	8.807
28.232	8.481
29.008	7.493
30.611	10.067
31.614	11.848
33.166	9.741
33.174	10.532
34.743	10.007
35.131	9.480
37.111	10.604
38.088	9.946
39.080	10.672
40.069	11.135
40.456	10.543
42.814	10.282
44.004	11.075
45.388	11.671
47.527	9.300
48.129	10.422
48.728	11.148
48.949	13.390
49.506	10.358
49.510	10.688
50.091	9.831
50.719	13.261
51.285	11.086
52.457	10.230
52.480	12.340
53.864	13.002
55.244	13.202
55.831	12.873
56.398	10.764
56.812	12.610
57.201	12.215
58.959	10.965
60.334	10.703
60.547	12.220
61.927	12.420
63.081	9.982
63.688	11.566
64.272	10.973
66.045	11.107
66.847	12.427
69.994	12.300
70.212	14.278
73.761	14.877
75.094	10.791
77.470	12.113
77.851	10.993
77.869	12.575
79.049	12.511
82.199	12.648
86.911	11.666
91.866	14.838
94.994	12.996
122.753	14.026];
data.tL3(:,1) = 365 * (0 + data.tL3(:,1));
units.tL3 = {'d', 'cm'}; label.tL3 = {'time', 'shell length', 'River F, Scotland'};  
temp.tL3 = C2K(11);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'HastYoun2000';
comment.tL3 = 'Data from River F, Scotland; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 2 * weights.tL1;
weights.tL2 = 2 * weights.tL2;
weights.tL3 = 2 * weights.tL3;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2','tL3'}; subtitle1 = {'Data from rivers C, D, F Scotland'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Energy conductance is very low, but attemps to increase it affected goodness of fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Facultative hermaphroditic';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Longest lived invertebrate';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3Y44N'; % Cat of Life
metaData.links.id_ITIS = '80371'; % ITIS
metaData.links.id_EoL = '51276204'; % Ency of Life
metaData.links.id_Wiki = 'Margaritifera_margaritifera'; % Wikipedia
metaData.links.id_ADW = 'Margaritifera_margaritifera'; % ADW
metaData.links.id_Taxo = '39442'; % Taxonomicon
metaData.links.id_WoRMS = '207899'; % WoRMS
metaData.links.id_molluscabase = '207899'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Margaritifera_margaritifera}}';
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
bibkey = 'HastYoun2000'; type = 'Article'; bib = [ ...
'author = {Lee C. Hastie and Mark R. Young and Phillip J. Boon}, ' ... 
'year = {2000}, ' ...
'title = {Growth characteristics of freshwater pearl mussels, \emph{Margaritifera margaritifera} ({L}.)}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {43}, ' ...
'pages = {243-256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baue1987'; type = 'Article'; bib = [ ...
'author = {G. Bauer}, ' ... 
'year = {1987}, ' ...
'title = {Reproductive Strategy of the Freshwater Pearl Mussel \emph{Margaritifera margaritifera}}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {56(2)}, ' ...
'pages = {691-704}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Margaritifera_margaritifera/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


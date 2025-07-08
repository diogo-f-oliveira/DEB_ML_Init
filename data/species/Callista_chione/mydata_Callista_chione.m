function [data, auxData, metaData, txtData, weights] = mydata_Callista_chione
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Callista_chione'; 
metaData.species_en = 'Smooth clam'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 28]; 


%% set data
% zero-variate data

data.ab = 52/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'PereDelg2011';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 45*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EzgePeha2011';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'EzgePeha2011';
data.Li  = 8;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';      bibkey.Li  = 'EzgePeha2011';

data.Wwb = 3.8e-07;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PereDelg2011';
  comment.Wwb = 'Computed from guessed egg diameter of 90 mum: pi/6*0.009^3';
data.Wwi = 122.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'Computed as 0.0002*(Li*10)^3.041, see F1';

data.Ri  = 2e7/365; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85';
  
% uni-variate data
% t-L data
data.tL_R = [ ... %  time since birth (yr), shell length (cm)
4.216	3.093
5.201	3.604
5.331	3.111
6.128	3.798
6.130	3.604
6.132	3.446
6.178	4.927
6.186	4.151
7.116	4.080
7.226	5.385
7.227	5.297
7.228	5.226
7.294	4.874
7.295	4.750
7.963	5.949
8.082	6.373
8.089	5.808
8.090	5.685
8.092	5.473
8.104	4.433
9.257	6.549
9.258	6.478
9.262	6.091
9.264	5.932
10.014	5.332
10.187	6.514
10.190	6.284
10.264	5.156
11.242	6.320
11.243	6.267
11.298	6.849
11.300	6.690
11.303	6.461
12.040	6.990
12.104	6.849
12.299	6.020
12.302	5.703
12.421	6.143
13.215	7.201
13.216	7.096
13.218	6.919
13.219	6.813
13.220	6.743
13.222	6.602
13.224	6.373
13.228	6.002
13.961	6.937
14.084	7.060
14.150	6.708
14.268	7.201
14.273	6.796
14.275	6.620
14.275	6.567
14.343	6.055
15.080	6.584
15.082	6.426
15.083	6.302
15.194	7.536
15.258	7.342
15.259	7.219
15.261	7.078
15.262	6.919
16.247	7.484
16.254	6.849
16.258	6.549
16.500	7.078
17.303	7.237
18.359	7.043
18.421	6.972
19.411	7.096
20.215	7.201
20.217	7.060
20.219	6.849
20.273	7.572
21.210	6.884
21.212	6.708
21.267	7.290
21.269	7.149
22.195	7.484
22.208	6.284
22.261	7.060
22.382	7.342
23.194	6.778
24.427	7.272
26.225	7.149
26.283	7.484
28.451	7.519
29.381	7.466
29.385	7.060
29.388	6.849
30.250	7.342
30.252	7.096
30.315	7.025
30.367	7.907
31.549	7.484
35.395	7.043
44.491	7.995];
data.tL_R(:,1) = data.tL_R(:,1) * 365; % convert yr to d
units.tL_R   = {'d', 'cm'};  label.tL_R = {'time since settlement', 'shell length', 'Rab Island'};  
temp.tL_R    = C2K(20);  units.temp.tL_R = 'K'; label.temp.tL_R = 'temperature';
bibkey.tL_R = 'EzgePeha2011';
comment.tL_R = 'Data from Rab Island';
%
data.tL_P = [ ... %  time since birth (yr), shell length (cm)
4.259	3.672
5.432	3.742
7.222	5.446
8.148	5.235
8.210	6.044
8.210	6.325
8.272	5.745
8.272	5.868
9.198	5.446
9.259	6.289
9.321	5.604
9.321	5.674
9.321	5.797
9.321	5.938
10.185	5.779
10.247	5.920
10.309	5.392
10.309	6.289
10.370	6.359
10.370	5.480
10.370	5.533
10.370	5.586
10.370	5.621
10.370	5.691
10.370	6.078
10.370	6.148
11.296	6.710
11.358	5.656
11.358	6.078
11.358	6.148
11.358	6.218
11.420	5.831
11.420	6.007
11.420	6.341
11.420	6.429
11.420	6.570
12.284	6.095
12.284	6.271
12.346	6.640
12.469	5.954
12.469	6.429
12.469	6.517
13.210	6.305
13.210	6.428
13.272	6.077
13.272	6.499
13.272	6.639
13.272	6.850
14.383	5.989
14.383	6.270
14.444	6.586
14.444	6.727
15.370	6.990
16.420	7.113
16.420	7.113
25.432	7.267
26.358	7.355
40.494	7.560
42.593	7.612];
data.tL_P(:,1) = data.tL_P(:,1) * 365; % convert yr to d
units.tL_P   = {'d', 'cm'};  label.tL_P = {'time since settlement', 'shell length', 'Pag Bay'};  
temp.tL_P    = C2K(20);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'EzgePeha2011';
comment.tL_P = 'Data from Pag Bay';
%
data.tL_K = [ ... %  time since birth (yr), shell length (cm)
2.879	4.360
3.929	4.765
4.186	3.394
6.219	4.766
6.838	4.801
7.023	4.925
7.200	6.138
7.204	5.610
8.067	6.085
8.069	5.804
8.133	5.470
8.196	5.241
8.197	5.189
8.929	6.789
9.003	4.996
9.062	5.347
9.116	6.543
9.122	5.681
9.179	6.332
9.181	6.138
9.977	7.334
9.979	7.000
9.980	6.859
10.107	6.385
10.111	5.840
10.171	6.139
10.908	7.018
11.095	6.719
11.096	6.579
11.097	6.508
11.097	6.438
11.098	6.368
11.098	6.297
11.099	6.174
11.100	6.086
11.163	5.963
11.899	6.878
12.086	6.632
12.087	6.491
12.091	5.964
12.145	7.089
12.147	6.790
12.949	7.177
13.016	6.404
13.075	6.966
13.078	6.491
13.137	6.913
13.138	6.790
13.138	6.720
13.139	6.632
13.143	6.052
13.940	7.177
13.940	7.072
14.004	6.843
14.004	6.773
14.005	6.685
14.062	7.388
14.065	6.931
14.129	6.597
14.193	6.281
14.250	7.019
14.254	6.509
14.927	7.600
14.933	6.791
14.987	7.863
15.116	7.125
15.117	6.967
15.182	6.545
15.980	7.495
15.984	6.985
16.969	7.706
17.098	6.880
18.085	7.407
18.086	7.337
18.150	7.003
19.072	7.900];
data.tL_K(:,1) = data.tL_K(:,1) * 365; % convert yr to d
units.tL_K   = {'d', 'cm'};  label.tL_K = {'time since settlement', 'shell length', 'Kastela Bay'};  
temp.tL_K    = C2K(20);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'EzgePeha2011';
comment.tL_K = 'Data from Kastela Bay';
%
data.tL_C = [ ... %  time since birth (yr), shell length (cm)
2.626	3.795
2.749	3.654
2.809	3.460
2.870	3.248
2.930	3.019
3.807	4.554
3.808	4.678
3.812	5.225
3.872	4.907
3.872	4.996
3.873	5.049
3.873	5.119
3.930	4.378
4.864	5.172
4.865	5.349
4.869	5.984
4.870	6.143
4.873	6.531
4.924	4.961
4.928	5.455
4.928	5.525
4.929	5.684
4.930	5.737
4.930	5.808
4.931	5.914
4.933	6.284
4.991	5.649
5.861	6.196
5.865	6.708
6.736	7.432
6.739	7.820
6.852	6.285
6.855	6.709
6.918	6.850
6.919	6.956
6.920	7.079
6.920	7.167
7.973	7.256
8.032	6.815
8.033	6.938
8.034	7.097
8.836	6.709
8.837	6.921
8.839	7.115
8.842	7.556
8.966	7.627
9.021	6.674
9.952	7.063
10.016	7.345
10.080	7.663
11.071	7.734
11.875	7.628
11.936	7.505
12.859	6.729
14.046	8.264
14.103	7.594
14.969	7.418
15.032	7.665
16.020	7.347
18.996	8.072
23.885	7.862
23.891	8.709
26.182	8.799
28.961	7.970
33.115	8.837
36.949	8.432];
data.tL_C(:,1) = data.tL_C(:,1) * 365; % convert yr to d
units.tL_C   = {'d', 'cm'};  label.tL_C = {'time since settlement', 'shell length', 'Cetina River'};  
temp.tL_C    = C2K(20);  units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'EzgePeha2011';
comment.tL_C = 'Data from Cetina River';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.tL_R = 3 * weights.tL_R;
weights.tL_P = 3 * weights.tL_P;
weights.tL_K = 3 * weights.tL_K;
weights.tL_C = 3 * weights.tL_C;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_R','tL_P','tL_K','tL_C'}; subtitle1 = {'Data from Rab Island, Pag Bay, Kastela Bay, Cetina River'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight (g)- shell length (mm): 0.0002*L^3.041';
metaData.bibkey.F1 = {'GaspSant2001'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PTKR'; % Cat of Life
metaData.links.id_ITIS = '205643'; % ITIS
metaData.links.id_EoL = '46469308'; % Ency of Life
metaData.links.id_Wiki = 'Callista_chione'; % Wikipedia
metaData.links.id_ADW = 'Callista_chione'; % ADW
metaData.links.id_Taxo = '39609'; % Taxonomicon
metaData.links.id_WoRMS = '141906'; % WoRMS
metaData.links.id_molluscabase = '141906'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callista_chione}}';
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
bibkey = 'EzgePeha2011'; type = 'Article'; bib = [ ... 
'author = {Daria Ezgeta-Balic and Melita Peharda  and Christopher A. Richardson and Marina Kuzmanic and Nedo Vrgoc and Igor Isajlovic}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth, and population structure of the smooth clam \emph{Callista chione} in the eastern {A}driatic {S}ea}, ' ...
'doi = {10.1007/s10152-010-0235-y}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {65}, ' ...
'pages = {457-465}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PereDelg2011'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v37i3.1902}, ' ...
'author = {J P\''{e}rez-Larruscain and M. Delgado and J. Ignasi Gair\''{i}n}, ' ... 
'year = {2011}, ' ...
'title = {Larval growth and development of the smooth clam \emph{Callista chione} ({M}ollusca: {B}ivalvia) under laboratory conditions}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {37}, ' ...
'pages = {271-277}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaspSant2001'; type = 'Article'; bib = [ ... 
'author = {Gaspar, M. B. and Santos, M. N. and Vasconcelos, P.}, ' ... 
'year = {2001}, ' ...
'title = {Weight-length relationships of 25 bivalve species ({M}ollusca: {B}ivalvia) from the {A}lgarve coast (southern {P}ortugal)}, ' ...
'journal = {J Mar biol Ass UK}, ' ...
'volume = {81}, ' ...
'pages = {805-807}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

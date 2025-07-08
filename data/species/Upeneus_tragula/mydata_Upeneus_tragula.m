function [data, auxData, metaData, txtData, weights] = mydata_Upeneus_tragula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Upeneus_tragula'; 
metaData.species_en = 'Freckled goatfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE', 'MPSW'};
metaData.ecoCode.habitat = {'0pMp', 'piMcb', 'piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.7;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'PavlHa2015'; 
data.Li  = 22.5;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';
  comment.Li = 'based on TL of 25 cm, using FL = 0.9 * TL, from foto';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Ww13 = 35.5; units.Ww13 = 'g';   label.Ww13 = 'wet weight at FL 12.9 cm';   bibkey.Ww13 = 'PavlHa2015';

data.Ri  = 62e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Upeneus_moluccensis';
 
% uni-variate data
% time-length data
data.tL_f = [... % time (10*yr), fork length (cm)
7.373	6.908
7.431	10.034
7.681	14.097
7.757	9.020
7.881	11.598
8.402	10.351
8.596	10.664
8.857	9.884
8.864	6.603
8.919	11.369
8.919	10.978
8.970	17.384
8.994	6.603
9.243	11.292
9.248	9.026
9.373	10.824
9.693	12.778
9.829	9.810
9.833	8.169
9.893	10.513
9.942	17.701
9.958	10.123
10.217	10.515
10.279	11.687
10.341	12.859
10.405	13.406
10.607	9.814
10.651	19.658
10.667	12.236
10.800	10.439
10.802	9.502
11.124	10.675
11.246	13.957
11.312	13.410
11.314	12.473
11.378	13.020
11.382	11.067
11.385	9.895
11.508	12.786
11.509	12.239
11.510	11.693
11.697	15.365
11.763	14.584
11.769	12.162
11.773	10.053
11.774	9.506
11.834	11.928
11.901	10.757
12.023	14.351
12.034	9.507
12.081	17.398
12.099	9.039
12.101	8.570
12.164	9.117
12.225	10.915
12.291	10.524
12.292	10.055
12.349	13.415
12.351	12.712
12.411	14.665
12.480	12.947
12.550	10.682
12.607	14.354
12.608	13.807
12.613	11.385
12.674	12.948
12.677	11.932
12.734	15.214
12.805	12.558
12.997	13.809
13.059	15.137
13.061	13.887
13.063	12.950
13.066	11.856
13.066	11.465
13.071	9.434
13.121	16.309
13.315	16.623
13.317	15.294
13.318	14.826
13.325	11.935
13.332	8.341
13.455	11.545
13.512	15.452
13.523	10.295
13.590	9.358
13.645	13.733
13.782	10.062
13.784	9.125
13.834	16.078
13.837	14.672
13.898	16.781
13.971	12.797
14.099	13.501
14.163	13.814
14.348	18.502
14.357	14.127
14.366	9.987
14.427	11.627
14.430	10.456
14.616	14.441
14.689	10.691
14.757	8.895
14.870	16.629
14.872	15.614
14.934	16.942
14.936	16.005
14.942	13.192
15.008	12.880
15.071	13.818
15.134	14.287
15.144	9.990
15.201	13.506
15.202	12.881
15.325	16.007
15.327	15.303
15.395	13.507
15.515	18.195
15.520	15.773
15.528	12.023
15.535	8.976
15.724	11.321
15.775	17.884
15.777	17.024
16.047	12.025
16.108	13.822
16.111	12.182
16.369	12.808
16.424	17.574
16.443	8.824
16.546	21.012
16.628	13.044
16.685	16.716
16.695	12.184
16.815	16.560
17.017	12.733
17.335	15.859
17.338	14.140
17.595	15.470
17.726	14.767
17.737	9.689
17.852	16.565
17.991	12.190
18.241	16.488
18.247	13.754
18.822	17.350
18.958	14.538
19.019	16.257
19.212	16.805
19.739	13.057
19.924	17.199
19.998	12.980
20.243	19.622
20.320	14.232
20.387	12.982
20.644	14.155
20.835	15.797
21.277	21.033
21.292	14.158
21.607	18.222
21.664	21.972
22.370	25.413
22.517	17.054
22.579	18.539
22.970	17.447
23.539	24.012
24.068	19.249
25.101	21.128
30.346	23.574
32.546	25.146]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)/ 10) * 365; % convert to d since birth
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PavlHa2015';
comment.tL_f = 'data for females'; 
%
data.tL_m = [... % time (10*yr), fork length (cm)
9.505	10.805
9.760	12.845
9.770	8.280
9.831	9.992
9.885	14.883
9.959	10.563
10.009	17.656
10.024	10.400
10.025	10.074
10.267	18.064
10.287	8.526
10.413	10.484
10.473	12.766
10.536	13.582
10.540	11.870
10.717	19.697
10.738	9.833
10.866	10.649
10.980	17.823
10.993	12.117
11.064	9.264
11.254	11.058
11.256	10.080
11.380	12.689
11.442	13.994
11.444	13.423
11.448	11.222
11.511	12.201
11.574	13.098
11.633	15.544
11.642	11.549
11.646	9.593
11.704	13.017
11.775	10.082
11.835	12.121
11.836	11.795
12.033	10.573
12.083	17.258
12.090	14.404
12.100	9.513
12.102	8.698
12.227	10.818
12.350	13.753
12.352	13.020
12.358	10.167
12.360	9.025
12.409	16.526
12.607	14.814
12.614	11.880
12.678	11.880
12.679	11.472
12.681	10.739
12.803	14.408
12.869	13.756
12.870	13.104
12.995	15.142
13.001	12.534
13.003	11.718
13.138	9.355
13.186	17.018
13.187	16.448
13.192	14.002
13.197	11.882
13.323	13.513
13.324	13.187
13.334	8.215
13.383	15.633
13.386	14.574
13.570	19.303
13.585	12.129
13.589	10.417
13.721	9.276
13.781	11.722
13.836	16.043
13.849	10.010
13.896	18.489
13.905	13.924
13.908	12.864
13.971	13.435
14.034	14.577
14.045	9.115
14.093	16.941
14.236	10.909
14.238	9.931
14.299	11.643
14.351	17.757
14.353	16.942
14.423	14.334
14.424	13.845
14.479	18.492
14.561	10.503
14.679	15.721
14.746	14.743
14.889	8.792
14.936	17.108
14.936	16.700
14.944	13.113
15.137	13.848
15.138	13.277
15.196	16.702
15.198	15.723
15.269	12.789
15.329	15.153
15.340	9.773
15.396	14.094
15.527	13.361
15.594	12.138
15.597	11.160
15.601	9.122
15.646	18.334
15.711	18.171
15.714	17.030
15.716	15.807
15.908	17.031
16.178	12.141
16.232	16.869
16.234	16.299
16.243	11.897
16.304	13.853
16.315	8.799
16.418	21.028
16.491	17.360
16.566	12.632
16.620	17.605
16.695	12.632
16.696	12.388
16.816	16.709
16.817	16.138
17.019	12.715
17.021	11.656
17.072	18.341
17.085	12.390
17.271	16.385
17.275	14.347
17.282	11.249
17.333	17.445
17.334	16.875
17.466	15.815
17.526	18.343
17.655	18.343
17.790	16.143
17.803	9.703
17.856	15.410
17.857	15.002
18.123	11.987
18.248	13.944
18.302	18.999
18.370	17.695
18.953	17.697
18.954	17.290
19.090	14.356
19.216	15.905
19.474	16.640
19.611	12.972
19.866	15.093
20.121	17.214
20.249	17.703
20.260	12.812
20.309	19.823
20.381	16.807
20.386	14.199
20.646	14.118
20.778	13.059
20.837	15.750
21.229	14.121
21.408	21.296
21.674	18.036
21.924	22.276
22.242	25.376
22.328	15.349
22.335	12.333
22.396	13.882
22.648	17.225
22.775	18.367
22.972	17.227
23.295	17.962
23.670	24.404
24.134	19.352]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)/ 10) * 365; % convert to d since birth
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PavlHa2015';
comment.tL_m = 'data for males'; 

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DM6Z'; % Cat of Life
metaData.links.id_ITIS = '169447'; % ITIS
metaData.links.id_EoL = '46578745'; % Ency of Life
metaData.links.id_Wiki = 'Upeneus'; % Wikipedia
metaData.links.id_ADW = 'Upeneus_tragula'; % ADW
metaData.links.id_Taxo = '189747'; % Taxonomicon
metaData.links.id_WoRMS = '218689'; % WoRMS
metaData.links.id_fishbase = 'Upeneus-tragula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Upeneus}}';
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
bibkey = 'PavlHa2015'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S003294521304005X}, ' ...
'author = {D. A. Pavlov and N. G. Emel''yanova and Vo Thi Ha and Luong Thi Bich Thuan}, ' ... 
'year = {2015}, ' ...
'title = {Otolith Morphology, Age, and Growth of Freckled Goatfish \emph{Upeneus tragula} ({M}ullidae) in the Coastal Zone of {V}ietnam}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {55}, ' ...
'pages = {363-372}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Upeneus-tragula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

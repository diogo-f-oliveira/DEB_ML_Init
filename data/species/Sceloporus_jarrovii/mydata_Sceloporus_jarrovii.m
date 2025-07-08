function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_jarrovii
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_jarrovii';
metaData.species_en = 'Yarrow''s spiny lizard';

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-N_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 31];

%% set data
% zero-variate data;
data.ab = 3*30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'based on Liopholis_striata with temp correction';
data.am = 10*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'based on Liopholis_striata';

data.Lb  = 2.5;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Ball1979';
data.Lp  = 5.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Ball1979';
data.Li  = 9.2; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Ball1979';

data.Wwi = 43.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
comment.Wwi = 'based on Sceloporus_occidentalis: (10.8/8)^3*18';

data.Ri  = 16/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Ball1979';
temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL_H = [... % time since birth (yr), SVL (cm)
 1.529	2.551
 1.835	2.388
 3.364	2.559
 4.587	2.447
 5.046	2.516
 8.563	2.404
14.832	2.601
15.902	2.670
15.903	2.816
15.904	2.919
16.208	2.463
17.737	2.850
18.196	2.678
36.544	3.639
36.697	3.836
37.003	3.492
37.004	3.750
39.908	3.664
40.061	3.501
63.303	5.002
64.983	4.693
64.984	4.547
64.985	4.349
65.291	4.985
65.292	4.856
80.887	4.992
82.263	4.992
82.416	5.103
82.722	5.215
83.180	4.579
83.181	4.785
99.541	5.144
101.529	5.178
101.835	4.723
101.987	4.981
101.988	4.869
102.294	5.127
121.713	5.056
121.714	5.202
121.864	4.678
121.865	4.755
121.866	4.970
123.089	5.167
133.486	5.106
134.251	5.003
135.780	4.642
135.781	4.753
135.933	5.132
136.086	4.994
138.991	5.080
140.214	5.346
140.367	5.208
140.673	4.684
140.674	4.993
140.826	4.873];
units.tL_H  = {'d', 'cm'};  label.tL_H = {'time since birth', 'SVL', 'from high altitude parents'};  
temp.tL_H   = C2K(18);  units.temp.tL_H = 'K'; label.temp.tL_H = 'temperature';
bibkey.tL_H = 'Ball1979';
comment.tL_H = 'Data for neonates from high-altitude parents';
%
data.tL_L = [... % time since birth (yr), SVL (cm)
 0.459	2.500
 0.917	2.689
 2.141	2.482
 9.939	2.516
11.621	2.464
12.844	2.704
13.609	2.636
14.679	2.532
16.208	2.584
34.557	3.183
34.862	3.097
36.850	3.080
37.309	3.200
38.838	3.080
62.080	3.739
64.220	3.936
64.985	3.730
64.986	3.309
82.569	4.072
82.722	4.252
83.180	3.969
101.528	4.362
101.529	4.285
101.988	4.568
121.407	4.437
121.408	4.549
121.713	4.024
135.780	4.470
135.781	4.263
135.782	4.169
138.991	4.615
140.520	4.228];
units.tL_L  = {'d', 'cm'};  label.tL_L = {'time since birth', 'SVL', 'from low altitude parents'};  
temp.tL_L   = C2K(18);  units.temp.tL_L = 'K'; label.temp.tL_L= 'temperature';
bibkey.tL_L = 'Ball1979';
comment.tL_L = 'Data for neonates from low-altitude parents';

% length - clutch size
data.LN_H = [ ... % SVL (cM), number of young (#)
6.387	3.950
6.494	4.022
6.566	6.058
6.602	5.059
6.611	4.023
6.655	6.023
6.709	6.988
6.709	4.024
6.888	4.025
6.906	7.061
6.906	6.811
6.924	5.954
6.960	7.062
6.969	5.812
6.987	6.205
7.004	4.098
7.022	2.955
7.031	6.312
7.094	5.884
7.103	8.099
7.121	6.099
7.174	8.242
7.183	6.064
7.192	10.957
7.192	5.814
7.201	7.064
7.210	7.957
7.219	6.850
7.300	8.993
7.309	6.994
7.309	5.029
7.318	7.886
7.318	8.136
7.336	5.958
7.380	11.066
7.389	9.994
7.389	8.994
7.389	5.030
7.407	10.744
7.407	5.994
7.434	11.102
7.461	5.031
7.488	8.031
7.497	8.995
7.515	7.103
7.577	10.960
7.586	9.925
7.613	5.068
7.667	7.032
7.676	10.068
7.685	8.961
7.694	7.961
7.711	8.747
7.738	7.033
7.774	8.033
7.792	8.819
7.801	5.034
7.810	9.177
7.864	9.034
7.890	10.999
7.890	7.034
7.890	6.856
7.944	10.999
7.989	6.964
7.998	8.107
7.998	7.893
8.007	10.000
8.087	8.965
8.096	11.822
8.096	10.001
8.096	8.036
8.114	12.072
8.186	11.037
8.186	10.787
8.204	10.037
8.213	7.002
8.284	11.895
8.293	12.967
8.293	11.109
8.356	11.896
8.400	8.968
8.427	11.039
8.454	11.968
8.490	11.968
8.535	11.040
8.687	10.970
8.687	13.006
8.696	7.934
8.776	14.007
8.776	13.042
8.785	11.757
8.785	12.007
8.803	9.971
8.893	11.972
8.911	9.972
8.982	9.080
9.000	11.973
9.018	15.902
9.224	7.046];
units.LN_H  = {'cm', '#'};  label.LN_H = {'SVL', 'yearly fecundity', 'high altitude'};  
temp.LN_H   = C2K(14);  units.temp.LN_H = 'K'; label.temp.LN_H = 'temperature';
bibkey.LN_H = 'Ball1979';
comment.LN_H = 'Data for high-altitude';
%
data.LN_L = [ ... % SVL (cM), number of young (#)
5.199	2.006
5.713	2.019
5.731	3.984
5.777	3.985
5.804	2.022
5.867	1.988
5.876	3.202
5.894	4.024
5.966	5.062
5.993	1.991
6.093	5.101
6.093	4.780
6.093	4.065
6.111	3.780
6.111	2.994
6.129	3.995
6.129	3.138
6.183	5.139
6.183	2.996
6.201	4.068
6.273	2.891
6.282	5.142
6.291	3.249
6.300	6.071
6.309	3.892
6.309	4.142
6.309	3.000
6.381	4.073
6.381	2.073
6.418	3.860
6.445	4.146
6.454	2.075
6.481	4.076
6.490	5.326
6.508	5.041
6.517	4.219
6.562	4.221
6.571	3.792
6.598	5.079
6.598	3.186
6.698	4.010
6.707	6.082
6.707	7.082
6.725	3.939
6.761	4.226
6.779	5.048
6.788	4.227
6.788	3.941
6.797	6.120
6.860	4.086
6.923	5.123
6.986	4.089
6.995	9.125
7.005	3.090
7.014	5.126
7.077	9.056
7.077	6.056
7.104	8.092
7.131	4.093
7.149	6.058
7.185	5.023
7.212	9.952
7.212	9.095
7.221	11.095
7.302	9.098
7.312	7.062
7.321	6.134
7.402	10.029
7.429	9.101
7.465	10.102
7.600	9.248
7.609	7.034
7.609	5.034
7.619	8.963
7.646	9.071
7.646	7.035
7.718	10.109
7.718	8.073
7.718	7.037
7.736	11.074
7.790	9.182
7.808	8.111
7.826	14.969
7.826	11.076
7.826	7.112
7.835	8.969
7.862	9.113
7.889	10.113
7.898	8.149
7.907	11.078
7.916	7.900
7.926	9.829
7.935	12.043
7.935	8.150
7.971	10.116
8.025	9.117
8.025	12.081
8.043	10.117
8.097	12.083
8.124	9.120
8.187	9.121
8.205	7.158
8.214	11.122
8.242	9.266
8.242	8.944
8.296	13.089
8.305	11.232
8.305	10.946
8.305	9.124
8.341	12.090
8.404	13.091
8.413	11.127
8.413	9.056
8.521	10.166
8.530	9.131
8.621	11.919
8.630	15.026
8.693	9.063
8.711	12.993
8.819	12.995
8.901	12.105
8.928	13.034
9.054	13.145
9.126	11.111
9.226	14.006];
units.LN_L  = {'cm', '#'};  label.LN_L = {'SVL', 'yearly fecundity', 'low altitude'};  
temp.LN_L   = C2K(18);  units.temp.LN_L = 'K'; label.temp.LN_L = 'temperature';
bibkey.LN_L = 'Ball1979';
comment.LN_L = 'Data for low-altitude';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_H = 3 * weights.tL_H;
weights.tL_L = 3 * weights.tL_L;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_H','tL_L'}; subtitle1 = {'Data from high, low altitude'};
set2 = {'LN_H','LN_L'}; subtitle2 = {'Data from high, low altitude'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures are guessed. T(t) in tL data is assumed to vary as T(t)=4+25*sin(2*pi*(t+50)/365) in C';
D2 = 'The high and low elvevation populations are assumed to differ in T_A';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'Ball1979'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XVYL'; % Cat of Life
metaData.links.id_ITIS = '173872'; % ITIS
metaData.links.id_EoL = '790731'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_jarrovii'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_jarrovii'; % ADW
metaData.links.id_Taxo = '573937'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=jarrovii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_jarrovii}}';   
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
bibkey = 'Ball1979'; type = 'Article'; bib = [ ...  
'author = {Royce E. Ballinger}, ' ...
'title = {Intraspecific Variation in demography and Life History of the Lizard, \emph{Sceloporus jarrovi}, Along an Altitudinal Gradient in {S}outheastern {A}rizona}, ' ...
'journal = {Ecology}, ' ...
'volume = {60(5)}, ' ...
'pages = {901-909}, ' ...
'year = {1979}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

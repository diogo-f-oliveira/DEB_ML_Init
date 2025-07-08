function [data, auxData, metaData, txtData, weights] = mydata_Akodon_azarae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Akodon_azarae'; 
metaData.species_en = 'Azara''s grass mouse'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 04]; 

%% set data
% zero-variate data

data.tg = 22.7;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 14.5;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.4;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DaniFacu2002';
data.Wwi = 26;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '10-45 g';

data.Ri  = 2*3.2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.2 pups per litter; 2 litters per yr';

 % uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.984	3.355
1.061	3.715
1.066	4.015
1.109	2.033
1.114	2.393
1.118	2.633
1.195	2.993
1.988	3.046
1.993	3.407
2.046	2.025
2.048	2.205
2.052	2.445
2.057	2.806
2.069	3.646
2.072	3.826
2.081	4.487
3.052	1.896
3.055	2.076
3.065	2.737
3.068	2.977
3.078	3.698
3.131	2.376
4.034	5.011
4.087	3.689
4.091	3.990
4.096	4.290
4.096	4.350
4.145	2.728
4.146	2.788
4.149	3.028
4.155	3.449
4.174	4.710
4.284	2.366
5.069	6.864
5.073	7.104
5.078	2.480
5.083	7.825
5.120	5.362
5.139	6.684
5.155	2.840
5.161	3.260
5.169	3.800
5.175	4.221
5.178	4.401
5.179	4.461
5.187	5.061
6.021	2.892
6.024	3.133
6.027	3.313
6.030	3.553
6.035	3.913
6.041	4.274
6.046	4.634
6.046	9.679
6.052	10.099
6.054	5.234
6.056	10.339
6.059	5.535
6.064	5.895
6.076	6.736
6.152	6.975
7.021	7.328
7.026	7.689
7.065	5.346
7.068	5.586
7.071	5.766
7.073	5.947
7.081	6.487
7.088	6.967
7.121	4.264
7.125	4.505
7.127	4.685
7.130	4.865
7.133	5.105
7.188	3.904
7.279	10.209
7.284	10.569
7.289	10.930
7.953	7.020
7.964	7.741
7.975	8.522
7.979	8.822
8.037	7.860
8.045	3.356
8.053	3.956
8.057	4.197
8.071	5.217
8.079	5.758
8.081	5.878
8.084	6.058
8.090	6.539
8.112	8.040
8.136	4.676
8.140	4.977
8.148	10.562
8.154	10.922
8.157	11.163
8.944	5.751
8.949	6.111
8.952	6.351
8.955	6.531
8.958	6.772
8.960	6.892
8.962	7.012
8.993	4.189
9.068	4.368
9.070	4.488
9.076	4.909
9.082	5.329
9.115	7.611
9.121	8.031
9.139	9.293
9.169	11.394
9.201	3.586
9.235	10.973
9.291	9.832
9.849	3.581
9.897	6.944
9.905	7.484
9.961	6.343
9.998	3.940
10.006	4.480
10.010	4.781
10.013	9.946
10.018	5.321
10.031	11.207
10.042	11.988
10.076	9.345
10.137	8.563
10.143	8.984
11.019	4.772
11.024	5.133
11.026	5.253
11.029	5.493
11.031	5.613
11.034	5.793
11.035	5.913
11.036	5.973
11.038	6.093
11.039	6.153
11.043	6.454
11.045	6.574
11.081	4.111
11.140	8.195
11.267	6.992
11.875	4.164
11.916	7.047
11.921	7.347
11.967	5.545
11.969	5.725
11.982	6.626
12.017	9.028
12.027	4.704
12.046	6.085
12.047	6.145
12.352	12.269
13.034	4.635
13.038	4.875
13.047	5.536
13.048	5.596
13.069	7.037
13.072	12.262
13.072	7.277
13.099	9.139
13.116	10.340
13.125	5.956
13.128	6.136
13.133	6.496
13.134	6.556
13.218	12.381
13.223	7.757
13.935	12.135
14.015	12.735
14.026	13.456
14.059	10.753
14.060	5.828
14.066	6.248
14.114	4.566
14.121	5.046
14.129	5.587
14.983	4.859
14.995	5.700
14.997	5.880
14.997	5.880
15.045	9.183
15.051	9.603
15.059	10.144
15.074	6.180
15.151	6.539
15.164	7.440
15.179	8.461
16.010	6.172
16.012	11.277
16.036	12.958
16.061	9.715
16.092	6.832
16.094	6.952
16.098	7.252
16.126	14.219
16.140	5.150
16.172	12.417
16.174	7.552
16.181	8.032
17.957	6.275
17.963	6.696
17.964	6.756
18.118	7.415
18.125	7.956
19.995	12.685
20.089	14.245
20.146	13.224
20.938	13.157
21.092	13.817
21.175	14.597
22.016	12.968
22.030	13.929
22.040	14.650
28.935	13.150
28.951	14.231
28.956	14.591
29.972	15.123
30.016	13.141
30.101	14.041
35.011	14.841
35.022	15.561
43.021	15.734
43.052	17.896
48.008	16.834
48.022	17.794];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'DaniFacu2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

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

%% Discussion points
D1 = 'mod_1: p_M is reduced';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7QHTQ'; % Cat of Life
metaData.links.id_ITIS = '633031'; % ITIS
metaData.links.id_EoL = '1179809'; % Ency of Life
metaData.links.id_Wiki = 'Akodon_azarae'; % Wikipedia
metaData.links.id_ADW = 'Akodon_azarae'; % ADW
metaData.links.id_Taxo = '62425'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000547'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Akodon_azarae}}';
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
bibkey = 'DaniFacu2002'; type = 'Article'; bib = [ ...  
'doi = {10.1002/jez.1402280312}, ' ...
'author = {Antinuchi C. Daniel and Luna Facundo}, ' ...
'year = {2002}, ' ...
'title  = {Assessing the Effect of Litter Size on Growth Pattern and Homeothermy Acquisition in the Pampas Mice \emoh{Akodon azarae} ({R}odentia, {M}uridae)}, ' ...
'journal = {Growth, Development \& Aging}, ' ...
'volume = {66}, ' ...
'pages = {63-69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Akodon_azarae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


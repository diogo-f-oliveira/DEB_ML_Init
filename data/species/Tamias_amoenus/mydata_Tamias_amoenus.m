function [data, auxData, metaData, txtData, weights] = mydata_Tamias_amoenus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Tamias_amoenus'; 
metaData.species_en = 'Yellow-pine chipmunk';

metaData.ecoCode.climate = {'BSk', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 31]; 

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 44;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data is uncertain';

data.Wwb = 2.62;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 19; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 48.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'AnAge';

data.Ri  = 5.19/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.19 pups per litter; 1 litter per yr';

  % uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
1.780	2.558
5.476	3.290
8.523	4.133
9.625	5.196
10.708	5.192
12.894	6.251
13.973	6.033
18.789	8.898
23.609	11.977
24.469	11.546
25.335	11.542
25.787	12.609
29.472	12.700
31.227	13.975
36.036	16.413
37.797	18.008
38.908	19.606
42.403	21.194
45.895	22.676
46.574	24.382
49.837	25.117
52.502	28.845
54.015	28.625
58.185	31.706
61.001	31.695
62.979	33.289
64.058	33.071
67.764	34.338
68.675	36.898
71.743	38.915
73.043	38.910
74.374	40.721
76.774	41.673
78.541	43.588
80.089	45.398
83.363	46.774
85.318	47.086
86.416	47.936
91.810	46.632
93.093	45.665
97.419	45.220
101.289	43.495
103.454	43.379
104.743	42.733
106.709	43.686
108.442	43.679
109.966	44.100
113.451	45.154
114.334	46.112
118.429	44.813
123.197	44.901
129.700	45.088];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Broa1958';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
1.780	2.558
3.733	2.763
6.998	3.605
6.998	3.605
6.998	3.605
9.407	5.090
9.407	5.090
12.016	5.614
12.016	5.614
13.986	6.781
13.986	6.781
15.734	7.629
15.734	7.629
17.480	8.369
19.438	8.789
20.543	10.066
22.928	10.163
25.546	11.221
28.794	11.101
33.614	14.179
35.172	16.523
35.381	16.095
37.549	16.193
37.995	16.939
40.195	18.853
41.910	17.777
43.475	20.549
45.421	20.327
45.662	21.715
46.354	24.169
46.960	21.603
48.332	25.764
48.732	23.839
50.282	25.756
52.220	25.107
54.366	23.923
56.589	27.119
58.342	28.287
58.564	28.606
61.162	28.489
62.694	29.337
62.918	29.764
64.881	30.504
66.605	29.962
68.338	29.955
68.358	31.130
70.758	32.082
72.887	29.936
73.154	32.820
73.561	31.323
74.700	34.523
75.754	32.809
76.883	35.476
78.657	37.819
79.241	33.970
82.798	39.191
83.416	37.372
86.518	41.312
89.136	42.370
90.877	42.790
91.347	44.925
93.079	44.811
93.456	41.604
95.621	41.488
97.447	46.823
99.510	40.831
100.934	47.984
102.659	47.549
102.702	37.506
103.583	38.357
104.283	41.239
104.991	44.548
107.374	44.538
108.859	42.716
114.249	41.198
118.145	40.968
119.673	41.603
122.073	42.555
123.143	41.803
127.250	41.252
128.552	41.353];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Broa1958';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7WYYY'; % Cat of Life
metaData.links.id_ITIS = '180190'; % ITIS
metaData.links.id_EoL = '311551'; % Ency of Life
metaData.links.id_Wiki = 'Tamias_amoenus'; % Wikipedia
metaData.links.id_ADW = 'Tamias_amoenus'; % ADW
metaData.links.id_Taxo = '170031'; % Taxonomicon
metaData.links.id_MSW3 = '12401136'; % Mammal Spec World
metaData.links.id_AnAge = 'Tamias_amoenus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tamias_amoenus}}';
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
bibkey = 'Broa1958'; type = 'techreport'; bib = [ ... 
'doi = {10.2307/1378798}, ' ...
'author = {Harold E. Broadbooks}, ' ...
'year = {1958}, ' ...
'title  = {Life  History  and  Ecology  of  the Chipmunk, \emph{Eutamias  amoenus}, in Eastern Washington}, ' ...
'institution = {University of Michigan, Museum of Zoology}, ' ...
'series = {Miscellaneous  Publications}, ' ...
'volume = {103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tamias_amoenus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Tamias_amoenus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


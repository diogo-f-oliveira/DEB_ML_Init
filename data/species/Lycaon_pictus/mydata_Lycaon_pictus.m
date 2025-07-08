function [data, auxData, metaData, txtData, weights] = mydata_Lycaon_pictus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Lycaon_pictus'; 
metaData.species_en = 'African wild dog';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 05 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 13]; 

%% set data
% zero-variate data

data.tg = 72;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 91;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 639;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 318;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 26.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW: 18-36 kg';
  
 
data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 pups per litter, 1 litters per yr';
  
% uni-variate data
% time-weight
data.tWw = [ % time since birth (wk), wet weight (g)
0.386	225.116
0.773	495.278
0.773	540.323
1.157	540.215
1.157	585.260
7.682	853.693
7.873	673.459
8.258	853.531
8.640	673.243
13.443	1392.612
13.822	851.965
13.826	1302.414
14.014	942.000
14.977	1302.090
15.362	1392.072
22.077	1480.271
22.079	1660.451
22.081	1885.675
22.083	2065.855
27.836	1884.055
27.839	2154.325
28.801	2424.324
29.183	2244.036
29.372	1973.713
35.705	2152.110
35.709	2647.604
35.711	2782.739
35.905	3007.910
36.290	3233.026
40.693	2150.706
41.272	2510.903
41.466	2781.119
42.433	3546.612
42.814	3276.235
43.581	3276.019
43.584	3591.333
49.341	3769.893
49.730	4310.324
50.302	3949.802
50.883	4535.224
51.259	3724.308
52.795	3813.965
52.797	4084.235
52.798	4174.325
57.025	4848.810
57.029	5254.215
57.032	5524.484
57.034	5794.754
57.036	5929.889
63.747	5567.639
63.749	5792.863
63.944	6153.169
63.947	6378.393
63.949	6603.618
67.198	5341.442
67.585	5701.693
68.165	6151.981
68.170	6647.475
68.172	6917.744
70.867	7817.887
71.043	6196.215
71.056	7547.563
71.246	7367.329
71.431	6646.557
71.434	6961.871
77.771	7545.673
77.777	8176.302
77.780	8491.616
77.961	7410.484
84.877	8399.528
84.883	9030.157
84.885	9255.381
84.887	9435.561
84.889	9615.741
90.253	8848.465
90.840	10064.516
90.843	10334.785
91.786	8622.808
91.795	9568.751
91.801	10199.380
91.992	10109.237
92.165	8172.251
98.911	11458.640
99.082	9206.340
99.088	9836.969
99.286	10557.633
99.288	10692.768
99.292	11098.172
104.656	10330.896
104.661	10826.391
104.858	11411.921
105.055	11952.406
105.248	12087.486
105.251	12357.756
108.864	9023.405
109.065	10014.340
109.070	10464.789
109.072	10735.058
109.074	10870.193
109.461	11230.445
109.463	11455.669
109.466	11816.029
109.475	12716.927
111.390	12401.073
112.147	11319.778
112.150	11545.003
112.163	12896.351
112.165	13121.575
112.168	13481.935
118.490	12534.209
118.877	12894.460
119.071	13074.586
119.457	13389.792
119.460	13660.062
119.467	14425.826
119.470	14651.050
119.633	11678.031
125.590	12712.390
125.596	13343.019
125.598	13568.244
125.601	13883.558
125.602	13973.648
125.606	14424.097
125.615	15324.996
125.809	15595.211
125.813	15955.571
126.167	12847.363
127.699	12531.616
128.091	13432.407
128.288	13927.847
128.292	14378.296
131.752	15143.088
131.755	15413.357
131.928	13431.327
131.942	14872.764
139.996	14555.181
140.013	16311.933
140.015	16492.113
140.017	16762.383
145.569	15499.558
145.955	15769.720
145.959	16175.124
146.356	17616.454
146.361	18066.903]; 
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'total weight'};  
temp.tWw  = C2K(38.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ThomPowe2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.tp = 3 * weights.tp;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend not to differ from females, but males are slightly larger';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '73256'; % Cat of Life
metaData.links.id_ITIS = '183833'; % ITIS
metaData.links.id_EoL = '47054446'; % Ency of Life
metaData.links.id_Wiki = 'Lycaon_pictus'; % Wikipedia
metaData.links.id_ADW = 'Lycaon_pictus'; % ADW
metaData.links.id_Taxo = '66513'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000818'; % MSW3
metaData.links.id_AnAge = 'Lycaon_pictus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycaon_pictus}}';
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
bibkey = 'ThomPowe2011'; type = 'techreport'; bib = [ ... 
'author = {Patrick Thomas and David Powell and Penny Kalk and Robert Terracuso}, ' ... 
'year = {2011}, ' ...
'title = {GROWTH AND DEVELOPMENT OF AFRICAN WILD DOG (\emph{Lycaon pictus}) PUPS BORN AT THE {B}RONX {Z}OO}, ' ...
'institution = {Bronx Zoo}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/270823046}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lycaon_pictus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lycaon_pictus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


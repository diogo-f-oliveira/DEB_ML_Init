function [data, auxData, metaData, txtData, weights] = mydata_Chaetophractus_villosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cingulata'; 
metaData.family     = 'Chlamyphoridae';
metaData.species    = 'Chaetophractus_villosus'; 
metaData.species_en = 'Big hairy armadillo'; 

metaData.ecoCode.climate = {'BWk', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 15]; 

%% set data
% zero-variate data

data.tg = 67;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 76;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'DizDugg2004';   
  temp.tx = C2K(35.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 273;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 113.4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DizDugg2004';
  comment.Wwb = 'AnAge gives 128 g';
data.Wwi = 3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: max 10 kg';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per litter, 1 litter per yr; ADW says >1 litter per yr';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.006	110.708
1.994	118.979
4.417	143.811
7.200	163.094
9.623	182.390
10.880	201.724
12.137	207.218
14.021	223.764
15.547	234.785
17.164	259.644
18.780	284.503
19.498	292.783
20.935	314.880
22.192	336.983
23.270	359.092
24.348	392.273
25.515	406.075
26.682	417.108
27.580	425.382
28.927	447.482
30.453	469.576
31.800	486.139
33.327	519.306
35.033	549.698
36.650	580.093
37.817	602.199
38.985	629.841
40.243	654.712
41.949	679.568
44.281	682.258
46.077	709.879
47.064	712.614
47.782	720.894
49.219	742.991
50.745	762.316
52.181	762.268
53.529	798.209
54.697	836.923
56.403	867.316
57.211	881.129
58.112	936.462
58.921	964.116
60.178	991.756
61.078	1038.784
61.617	1052.607
62.965	1083.011
64.310	1085.734
65.389	1113.379
66.106	1099.514
67.093	1110.553
68.439	1121.581
69.965	1129.834
70.953	1157.482
71.850	1154.683
73.019	1193.398
74.099	1248.725
75.084	1226.547
75.984	1268.039
76.880	1254.168
79.034	1259.631
80.116	1356.481
81.822	1395.177
82.723	1456.047];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(35.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DizDugg2004';
%
data.tW1 = [ ... 
1.365	105.160
3.339	116.166
4.865	127.187
6.032	143.757
7.828	163.073
9.443	168.555
11.238	179.567
12.853	190.585
14.828	215.432
17.162	229.194
19.047	256.812
21.022	276.122
22.459	300.987
23.896	320.316
25.063	342.422
26.769	364.510
28.475	397.670
30.271	425.291
32.156	444.605
33.863	472.229
35.389	491.554
37.095	521.947
38.801	546.803
40.237	560.595
41.495	582.698
43.290	610.319
44.906	629.641
46.072	618.529
46.791	635.114
47.869	662.759
49.485	684.850
50.833	718.023
52.538	734.574
53.437	764.994
54.157	800.955
55.594	831.357
56.672	856.234
57.571	897.726
59.278	928.118
60.266	958.535
61.434	994.481
63.050	1005.500
64.128	1030.377
64.848	1080.179
65.833	1046.928
67.359	1049.645
68.616	1074.516
69.333	1063.419
70.501	1096.597
71.489	1115.941
72.566	1121.441
74.002	1129.697
74.363	1160.135
74.993	1190.564
75.981	1215.444
76.966	1184.961
78.133	1193.226
78.583	1218.124
79.661	1245.769
80.918	1265.104
81.996	1298.286
83.078	1386.830];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(35.1);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'DizDugg2004';

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
set1 = {'tW','tW1'}; subtitle1 = {'Data for male 1, 2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'TDLN'; % Cat of Life
metaData.links.id_ITIS = '624897'; % ITIS
metaData.links.id_EoL = '328495'; % Ency of Life
metaData.links.id_Wiki = 'Chaetophractus_villosus'; % Wikipedia
metaData.links.id_ADW = 'Chaetophractus_villosus'; % ADW
metaData.links.id_Taxo = '60564'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11700028'; % MSW3
metaData.links.id_AnAge = 'Chaetophractus_villosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetophractus_villosus}}';
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
bibkey = 'DizDugg2004'; type = 'Article'; bib = [ ... 
'author = {Mar\''{i}a Julieta Olocco Diz and Ana Duggan}, ' ... 
'doi = {10.1896/1413-4411.6.1.27}, ' ...
'year = {2004}, ' ...
'title = {The First Hand-Rearing of Larger Hairy Armadillos (\emph{Chaetophractus villosus}) at the {T}emaik\`{e}n Foundation}, ' ...
'journal = {Edentata}, ' ...
'volume = {6}, ' ...
'pages = {27-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chaetophractus_villosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Chaetophractus_villosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


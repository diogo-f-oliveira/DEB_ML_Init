function [data, auxData, metaData, txtData, weights] = mydata_Nycticeius_humeralis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Nycticeius_humeralis'; 
metaData.species_en = 'Evening bat'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 06]; 

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Nyctalus_noctula';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(34);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty female'; bibkey.tp = 'guess';
  temp.tp = C2K(34);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Nyctalus_noctula';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Jone1967';
data.Wwi = 9.75;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Jone1967: 9-11 g';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 1 litter per yr';

% univariate data

% time-weight
data.tWw = [ ...
1.118	2.024
2.211	2.240
2.757	2.321
3.854	2.632
6.033	2.808
7.392	2.835
8.213	3.024
9.029	3.024
9.850	3.227
10.937	3.227
12.029	3.403
12.579	3.605
13.941	3.727
14.759	3.808
16.393	3.944
17.758	4.146
18.032	4.214
18.304	4.214
19.119	4.214
20.481	4.336
21.567	4.283
22.386	4.418
24.023	4.647
24.834	4.513
26.196	4.621
27.562	4.851
28.108	4.945
29.472	5.121
30.285	5.027
31.100	5.027
31.913	4.960
32.731	5.055
34.092	5.123
35.454	5.231
36.541	5.232
37.630	5.313
38.721	5.435
40.080	5.435
40.897	5.516
41.713	5.530
43.890	5.625
45.246	5.545
46.335	5.626
47.427	5.775
48.244	5.843
49.337	6.032
50.149	5.924
50.968	6.046
52.050	5.898
52.869	6.033
53.960	6.168
55.047	6.142
56.136	6.237
57.495	6.251
57.763	6.116
59.125	6.211
62.661	6.334
64.298	6.550
64.853	6.927
65.396	6.928
66.755	6.928
67.845	7.036
69.204	7.037
70.016	6.943
71.652	7.119
73.283	7.119
74.639	7.039
75.182	7.039
75.729	7.134
77.088	7.148
78.171	7.014
79.261	7.135
80.080	7.243
80.895	7.230
81.166	7.230
81.984	7.311
83.612	7.231
85.251	7.528
86.604	7.340
88.784	7.530
90.418	7.638
92.052	7.747
93.142	7.855
94.246	8.435
95.319	7.964
96.142	8.233
96.964	8.449
98.067	8.989
99.683	8.504
100.240	8.963];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(34);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Jone1967';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '485K4'; % Cat of Life
metaData.links.id_ITIS = '180022'; % ITIS
metaData.links.id_EoL = '327632'; % Ency of Life
metaData.links.id_Wiki = 'Nycticeius_humeralis'; % Wikipedia
metaData.links.id_ADW = 'Nycticeius_humeralis'; % ADW
metaData.links.id_Taxo = '169095'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801926'; % MSW3
metaData.links.id_AnAge = 'Nycticeius_humeralis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nycticeius_humeralis}}';
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
bibkey = 'Jone1967'; type = 'Article'; bib = [ ... 
'author = {Clyde Jones}, ' ... 
'year = {1967}, ' ...
'title = {Growth, Development, and Wing Loading in the Evening Bat, \emph{Nycticeius humeralis}({R}afinesque)}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {48(1)}, ' ...
'pages = {1-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Nycticeius_humeralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


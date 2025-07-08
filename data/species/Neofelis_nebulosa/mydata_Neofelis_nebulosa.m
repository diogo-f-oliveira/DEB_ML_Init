function [data, auxData, metaData, txtData, weights] = mydata_Neofelis_nebulosa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Neofelis_nebulosa'; 
metaData.species_en = 'Clouded leopard'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 99;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(37.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 130;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Oreamnos';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1095;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Wwb = 235;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'NajeBrow2015';
  comment.Wwb = 'EoL: between 150 and 280 g';
data.Wwi = 18e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'EoL';
data.Wwim = 22e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'EoL';
  
data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr in captivity (EoL)';

% uni-variate data

% time-weight
data.tW_f = [ % time since birth (d), wet weight (g)
0.095	233.001
1.049	263.987
2.193	271.655
3.146	302.641
4.004	318.101
5.053	341.312
5.911	356.771
7.055	395.508
8.294	426.469
9.439	449.671
10.011	465.156
10.869	496.149
12.013	534.886
12.966	542.570
14.015	581.315
14.968	612.300
16.017	643.278
16.875	658.738
18.019	689.707
19.068	728.451
19.926	751.678
20.784	751.604
22.023	798.099
22.977	829.085
24.025	860.062
24.883	891.056
25.932	922.034
26.981	968.545
27.934	991.764
28.888	1014.983
29.841	1061.502
30.985	1092.472
32.034	1123.449
33.178	1154.418
34.036	1193.179
34.799	1216.414
35.943	1270.684
36.992	1278.361
37.850	1324.889
38.898	1379.167
39.947	1410.145
40.900	1410.063
42.044	1441.032
43.093	1464.242
43.951	1503.003
45.191	1533.964
45.953	1580.500
47.193	1572.626
48.242	1626.905
49.004	1650.140
50.053	1688.884
51.006	1696.569
52.246	1719.763
53.104	1774.058
53.867	1727.390
55.487	1804.920
55.964	1812.646
56.917	1843.632
57.966	1882.376
59.015	1905.587
60.064	1944.331
61.017	1983.084
61.970	1998.535
63.114	2029.505
64.163	2076.016
65.021	2091.476
66.165	2161.280
67.119	2114.596
68.072	2199.951
68.930	2207.644
69.883	2238.629
70.932	2300.675
72.076	2316.110
72.934	2339.337
73.983	2331.479
75.222	2440.110
76.081	2455.570
77.129	2455.480
78.083	2533.067
79.227	2494.134
80.180	2587.255
81.324	2532.788
82.373	2587.066
83.136	2594.767
84.089	2594.685
85.233	2703.324
86.282	2819.738
87.426	3184.688
87.998	3013.765
89.142	2920.463]; 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(37.0);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'NajeBrow2015';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.191	240.760
1.049	279.521
2.097	294.965
3.242	310.400
4.004	325.868
5.053	349.078
6.197	387.815
7.341	418.784
8.104	418.718
8.962	434.178
10.011	480.689
11.059	496.133
12.108	519.343
12.966	534.804
13.919	581.323
14.873	604.542
15.826	619.993
16.970	666.496
18.114	697.466
18.877	712.934
20.021	751.670
21.070	767.114
21.833	798.116
23.072	829.077
23.835	860.079
24.883	891.056
25.932	929.801
27.076	953.003
27.934	991.764
29.078	1014.966
30.032	1038.185
31.367	1100.206
31.748	1092.406
32.987	1138.901
34.322	1193.154
35.275	1231.907
36.133	1270.668
36.992	1278.361
38.136	1324.864
38.994	1386.926
40.233	1417.887
41.091	1448.881
42.044	1479.867
43.093	1510.844
44.047	1541.830
45.000	1580.582
46.144	1619.319
47.193	1665.830
48.051	1704.591
48.909	1743.352
50.053	1813.156
51.006	1813.074
51.960	1820.759
53.104	1875.029
53.962	1975.926
55.011	1944.767
56.155	2006.804
56.917	2045.573
58.061	2084.310
58.919	2115.304
60.159	2146.265
60.826	2200.576
62.161	2223.762
63.210	2285.807
64.258	2324.552
65.307	2332.228
66.165	2378.756
67.309	2417.492
68.167	2471.787
69.311	2494.989
70.169	2510.449
70.932	2580.286
71.981	2619.031
72.934	2580.114
73.983	2618.858
75.127	2696.429
76.176	2750.708
77.034	2843.837
78.559	2719.434
79.227	2633.939
80.371	2843.549
81.324	2548.322
82.182	2858.927
84.661	2656.771
85.519	2967.377
86.377	3681.866
88.379	3029.266
89.333	3269.961];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(37.0);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'NajeBrow2015';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '46H7Z'; % Cat of Life
metaData.links.id_ITIS = '183809'; % ITIS
metaData.links.id_EoL = '328675'; % Ency of Life
metaData.links.id_Wiki = 'Neofelis_nebulosa'; % Wikipedia
metaData.links.id_ADW = 'Neofelis_nebulosa'; % ADW
metaData.links.id_Taxo = '67260'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000222'; % MSW3
metaData.links.id_AnAge = 'Neofelis_nebulosa'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neofelis_nebulosa}}';
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
bibkey = 'NajeBrow2015'; type = 'article'; bib = [ ... 
'author = {F. N\''{a}jera and J. Brown and D. E. Wildt and L. Virolle and U. Kongprom and L. Revuelta and K. Goodrowe-Beck}, ' ... 
'year = {2015}, ' ...
'title = {Body Mass Dynamics in Hand Reared Clouded Leopard (\emph{Neofelis nebulosa}) Cubs From Birth to Weaning}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {34}, ' ...
'pages = {239--243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Neofelis_nebulosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Neofelis_nebulosa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328675/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


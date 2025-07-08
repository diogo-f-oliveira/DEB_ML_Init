function [data, auxData, metaData, txtData, weights] = mydata_Ardea_alba

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ardeidae';
metaData.species    = 'Ardea_alba'; 
metaData.species_en = 'Great egret'; 

metaData.ecoCode.climate = {'A','B','C','D'};
metaData.ecoCode.ecozone = {'TH','TP','TN','TA'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', 'xiFm'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCva', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 7.5*7;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 157.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 22.8*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 35;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Toml1976';
data.Wwi = 1000; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 0.7–1.5 kg';

data.Ri  = 2*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time sincde birth (d) weight (g)
 0.946	 43.507
 2.182	 72.530
 3.054	 88.860
 4.070	103.384
 4.724	117.896
 5.886	123.366
 7.048	143.329
 8.065	161.475
 9.010	186.866
 9.810	215.876
10.829	253.950
12.065	295.654
13.011	328.291
13.811	362.736
14.684	391.748
16.135	400.850
17.298	426.247
18.750	438.972
19.261	482.466
20.136	535.028
21.226	569.481
21.953	589.431
23.045	632.942
24.279	642.037
24.861	672.852
26.314	700.070
27.187	723.647
27.914	745.408
27.915	745.408
29.220	747.259
29.585	776.256
30.168	810.693
31.256	817.973
32.272	816.192
32.927	848.820
34.379	861.545
35.180	895.990
36.195	883.339
37.211	888.805
38.230	939.560
38.954	912.408
40.114	908.820
41.129	894.358
42.144	888.954
43.016	908.907
44.250	918.003
45.919	918.053
47.007	916.274
47.878	923.547
49.038	905.466
50.128	929.050
51.287	910.969
52.159	921.865
53.029	921.891
54.195	985.332
55.279	925.582
56.007	958.213
57.020	929.258
58.038	958.274
59.129	996.351
60.141	942.033];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Toml1976'; comment.tW1 = 'hand-reared';
%
data.tW2 = [ ...
 1.019	 39.886
 2.036	 67.090
 3.053	 83.426
 3.708	105.184
 5.088	123.342
 5.523	125.167
 6.830	146.945
 7.847	154.222
 8.863	156.065
10.171	186.901
11.479	224.984
12.135	257.613
12.935	288.434
12.936	288.434
14.098	317.455
15.261	344.664
16.061	380.920
17.295	379.145
18.239	395.478
18.749	426.291
19.983	429.951
21.001	464.402
21.871	458.994
23.179	480.772
24.123	493.482
25.141	526.121
26.013	551.510
26.954	515.307
28.189	533.460
29.134	566.097
30.368	573.381
30.949	580.645
32.110	580.680
33.053	586.143
34.143	606.103
34.145	636.901
34.146	636.901
34.945	655.041
36.975	633.363
37.917	622.522
39.079	644.296
40.022	631.643
40.313	651.580
42.125	622.649
43.142	638.984
44.302	626.338
44.813	668.020
45.973	660.808
46.844	668.081
47.713	649.991
49.093	659.091
50.108	660.933
50.980	668.206
52.866	675.509
53.880	646.554
55.044	690.068
55.918	742.630
56.928	659.328
58.235	668.425
59.106	682.944
60.048	668.480];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(40.5);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Toml1976'; comment.tW2 = 'hand-reared';
%
data.tW3 = [ ...
 0.946	 43.507
 1.599	 36.280
 2.834	 56.245
 4.286	 72.593
 6.173	 79.897
 7.118	103.476
 7.989	108.937
 9.006	127.084
10.169	159.727
11.041	181.493
12.276	203.269
12.930	225.028
13.876	255.854
15.039	283.063
16.057	317.514
17.001	335.658
18.168	419.027
19.113	442.606
19.841	478.860
20.784	475.265
22.237	495.237
23.181	511.569
23.981	536.956
25.071	558.728
26.160	566.007
26.668	580.515
27.903	595.045
29.135	584.213
30.660	593.317
32.983	620.561
34.144	622.408
35.014	615.188
35.886	624.272
37.047	631.553
39.079	638.861
40.023	647.948
41.981	638.949
42.997	646.226
44.304	660.758
45.974	680.736
48.077	668.118
48.949	686.261
50.328	686.302
52.284	653.753
53.010	661.021
53.952	633.875
54.752	662.885
55.620	632.114
57.076	697.375
58.230	603.207
58.884	619.532
60.191	632.252];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(40.5);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Toml1976'; comment.tW3 = 'hand-reared';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW3 = weights.tW3 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'chick 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'GCHR'; % Cat of Life
metaData.links.id_ITIS = '554135'; % ITIS
metaData.links.id_EoL = '45511352'; % Ency of Life
metaData.links.id_Wiki = 'Ardea_alba'; % Wikipedia
metaData.links.id_ADW = 'Ardea_alba'; % ADW
metaData.links.id_Taxo = '167377'; % Taxonomicon
metaData.links.id_WoRMS = '159381'; % WoRMS
metaData.links.id_avibase = '267D8CCE889A4D6F'; % avibase
metaData.links.id_birdlife = 'great-white-egret-ardea-alba'; % birdlife
metaData.links.id_AnAge = 'Ardea_alba'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ardea_alba}}';
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
bibkey = 'Toml1976'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1976.9639556}, ' ...
'author = {Tomlinson, D. N. S.}, ' ... 
'year = {1976}, ' ...
'title = {BREEDING BEHAVIOUR OF THE GREAT WHITE EGRET}, ' ...
'journal = {Ostrich}, ' ...
'volume = {47(4)}, ' ...
'pages = {161–178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Ardea_alba}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=267D8CCE889A4D6F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


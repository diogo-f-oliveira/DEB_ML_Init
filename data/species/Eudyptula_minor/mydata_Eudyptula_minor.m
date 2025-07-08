function [data, auxData, metaData, txtData, weights] = mydata_Eudyptula_minor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Eudyptula_minor'; 
metaData.species_en = 'Little penguin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MISE', 'MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 36;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 62;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NumaDavi2004';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 186;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'EoL';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 80;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NumaDavi2004';
data.Wwi = 1232;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'NumaDavi2004';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
2.977	84.718
3.945	159.468
4.014	64.784
4.141	122.093
4.143	84.718
4.725	104.651
4.854	117.110
5.046	179.402
5.047	164.452
5.891	114.618
5.953	181.894
5.954	161.960
5.955	134.552
6.082	196.844
6.795	196.844
6.796	164.452
6.924	204.319
6.988	236.711
7.895	236.711
7.896	214.286
8.087	294.020
8.803	201.827
9.253	291.528
10.098	216.777
10.099	199.336
10.875	234.219
10.877	204.319
10.936	318.937
10.999	363.787
11.000	346.346
11.067	299.003
11.068	284.053
11.907	356.312
11.911	269.103
12.033	423.588
12.036	371.262
12.884	236.711
12.942	383.721
12.943	363.787
13.006	406.146
13.012	276.578
13.069	448.505
13.070	426.080
13.204	313.954
13.972	543.189
13.975	480.897
13.977	423.588
14.044	373.754
14.111	323.920
14.112	294.020
15.011	498.339
15.013	436.047
15.077	460.963
15.788	513.289
15.864	249.169
15.920	438.538
15.989	343.854
16.044	573.090
16.958	408.638
16.959	393.688
16.960	353.821
16.961	341.362
17.858	595.515
17.925	543.189
17.926	523.256
18.895	568.106
18.897	533.223
18.957	640.365
19.033	386.213
19.872	460.963
19.930	620.432
19.932	560.631
19.935	498.339
19.936	473.422
19.990	732.558
19.990	717.608
19.995	602.990
20.962	732.558
20.963	702.658
21.031	625.415
21.032	602.990
21.229	553.156
21.995	822.259
21.996	799.834
21.999	730.066
22.001	677.741
22.127	754.983
22.970	750.000
22.971	730.066
23.027	911.960
23.103	655.316
23.105	622.924
23.117	343.854
23.951	528.239
23.952	503.322
24.071	762.458
24.073	702.658
24.916	685.216
24.917	667.774
24.980	707.641
25.044	740.033
25.105	827.243
25.171	784.884
25.816	862.126
26.012	822.259
26.027	478.405
26.077	804.817
26.079	774.917
26.918	847.176
26.982	862.126
27.051	772.425
27.110	909.468
27.111	877.076
27.118	722.591
27.119	697.674
27.120	662.791
27.825	844.684
27.887	919.435
27.888	899.502
27.954	862.126
28.796	859.635
28.860	882.060
28.919	1026.578
28.922	946.844
28.923	936.877
29.770	827.243
29.784	498.339
29.822	1116.279
29.897	887.043
29.950	1163.621
30.799	1001.661
30.807	804.817
30.809	772.425
31.012	563.123
31.839	914.452
31.843	832.226
31.899	1034.053
31.900	1001.661
31.968	949.336
32.874	971.761
32.935	1051.495
33.128	1081.395
34.035	1091.362
34.039	999.169
34.040	974.252
34.041	959.302
34.944	1051.495
35.001	1218.439
35.004	1156.146
35.915	1076.412
35.918	991.694
36.749	1268.272
36.893	934.385
37.010	1220.930
37.030	742.525
37.873	742.525
37.922	1113.787
37.931	892.027
37.934	829.734
38.047	1220.930
38.956	1163.621
38.961	1053.987
38.963	1014.120
39.094	974.252
39.094	961.794
40.055	1220.930
40.056	1205.980
40.072	822.259
40.125	1103.821
40.126	1076.412
40.786	807.309
40.894	1295.681
40.897	1220.930
40.898	1210.963
40.902	1126.246
40.905	1044.020
40.974	951.827
40.975	916.944
41.742	1171.096
41.743	1136.213
41.813	1026.578
41.940	1081.395
42.840	1260.797
42.906	1230.897
42.907	1208.472
42.908	1178.571
42.977	1083.887
43.939	1298.173
44.010	1176.080
44.066	1372.924
44.154	824.751
44.786	1203.488
44.788	1148.671
44.869	772.425
44.995	859.635
45.045	1215.947
45.249	986.711
46.019	1163.621
46.086	1103.821
46.088	1061.462
46.089	1031.561
46.090	1011.628
46.158	941.860
46.938	892.027
47.051	1258.306
47.120	1178.571
47.121	1163.621
47.129	956.811
47.894	1250.831
47.917	722.591
47.961	1203.488
47.968	1029.070
47.970	999.169
47.971	964.286
48.152	1280.731
48.934	1166.113
48.939	1066.445
48.941	1024.086
48.942	999.169
48.945	921.927
49.000	1148.671
49.970	1200.997
49.971	1163.621
49.973	1121.262
50.104	1083.887
50.108	999.169
51.002	1303.156
51.003	1280.731
51.019	906.977
51.138	1148.671
51.151	844.684
51.204	1131.229
52.041	1248.339
52.047	1108.804
52.178	1073.920
52.193	725.083
52.248	964.286
52.823	1141.196
52.825	1108.804
52.830	986.711
52.896	951.827
52.897	929.402
52.900	862.126
53.924	1148.671
54.125	1001.661
54.767	1133.721
54.769	1106.312
54.769	1088.870
54.907	909.468
57.040	1019.103
57.890	852.159
58.006	1151.163
58.925	882.060
58.991	852.159
58.993	812.292
61.905	892.027];
n=size(data.tW,1);for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-8;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Oamaru'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NumaDavi2004';
comment.tW = 'Data from Oamaru';
%
data.tW1 = [ ... % age (d) weight (g)
1.034	59.801
2.134	84.718
3.170	114.618
3.883	94.684
5.242	139.535
6.149	142.027
7.055	164.452
8.221	189.369
8.609	209.302
9.256	216.777
10.158	343.854
11.135	219.269
11.974	294.020
13.008	363.787
13.204	328.904
17.086	450.997
17.803	353.821
17.866	411.130
18.767	540.698
19.739	530.731
24.078	593.023
25.183	515.781
25.184	503.322
26.017	692.691
30.681	735.050
31.852	620.432
31.976	762.458
33.079	715.116
33.983	802.326
38.058	954.319
38.975	722.591
39.026	1036.545
39.100	842.193
40.006	857.143
40.903	1086.379
41.682	1058.970
43.429	1106.312
44.021	906.977
44.026	799.834];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Motuara Island'};  
temp.tW1    = C2K(38.2);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'NumaDavi2004';
comment.tW1 = 'Data from Motuara Island';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tW1 = weights.tW1 * 2;

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
set1 = {'tW', 'tW1'}; subtitle1 = {'Data from Oamaru, Motuara Island'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6H8KC'; % Cat of Life
metaData.links.id_ITIS = '174460'; % ITIS
metaData.links.id_EoL = '45512088'; % Ency of Life
metaData.links.id_Wiki = 'Eudyptula_minor'; % Wikipedia
metaData.links.id_ADW = 'Eudyptula_minor'; % ADW
metaData.links.id_Taxo = '51406'; % Taxonomicon
metaData.links.id_WoRMS = '225932'; % WoRMS
metaData.links.id_avibase = '151738D51BE6DDA4'; % avibase
metaData.links.id_birdlife = 'little-penguin-eudyptula-minor'; % birdlife
metaData.links.id_AnAge = 'Eudyptula_minor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eudyptula_minor}}';
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
bibkey = 'NumaDavi2004'; type = 'Article'; bib = [ ... 
'author = {M. Numata and L. S. Davis and M. Renner}, ' ... 
'year = {2004}, ' ...
'title = {Growth and survival of chicks in relation to nest attendance patterns of little penguins (\emph{Eudyptula minor}) at {O}amaru and {M}otuara {I}sland, {N}ew {Z}ealand}, ' ...
'journal = {New Zealand Journal of Zoology}, ' ...
'volume = {31}, ' ...
'number = {3}, ' ...
'pages = {263--269}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Eudyptula_minor/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049616/overview/}}';
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


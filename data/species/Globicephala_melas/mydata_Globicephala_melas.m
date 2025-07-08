function [data, auxData, metaData, txtData, weights] = mydata_Globicephala_melas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Globicephala_melas'; 
metaData.species_en = 'Long-finned pilot whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCvm', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2023 08 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 18];

%% set data
% zero-variate data

data.tg = 450;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 812;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 8.1*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'BlocLock1993';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4380;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 60*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 177; units.Lb = 'cm'; label.Lb = 'length at birth';                    bibkey.Lb = 'BlocLock1993';
data.Lp = 374.5; units.Lp = 'cm'; label.Lp = 'length at puberty for females';      bibkey.Lp = 'BlocLock1993';
data.Lpm = 470; units.Lpm = 'cm'; label.Lpm = 'length at puberty for males';       bibkey.Lpm = {'BlocLock1993','AnAge'};
  comment.Lpm = 'based on tpm and tL_m data';
data.Li = 460; units.Li = 'cm'; label.Li = 'ultimate length for females';        bibkey.Li = 'BlocLock1993';
data.Lim = 600; units.Lim = 'cm'; label.Lim = 'ultimate length for males';         bibkey.Lim = 'BlocLock1993';

data.Wwb = 75e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'BlocLock1993';
data.Wwp = 607.3e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'BlocLock1993';
data.Wwpm = 1100e3;   units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = {'BlocLock1993','AnAge'};
  comment.Wwpm = 'based on tpm and tW_m data';
data.Wwi  = 1100e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'BlocLock1993';  
data.Wwim = 2320e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'BlocLock1993';  

data.Ri  = 1/365/5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1 litter per 5 yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
0.089	214.236
0.999	264.638
2.126	283.815
2.956	309.605
3.858	325.187
4.835	340.166
5.962	355.141
7.086	358.109
8.065	381.493
9.116	393.468
10.090	395.240
10.767	409.628
12.041	411.991
12.942	419.768
13.691	422.147
15.114	419.703
15.866	431.087
16.989	428.051
17.963	431.624
18.788	435.202
20.062	439.366
21.036	438.736
22.011	443.510
23.059	444.078
23.958	441.650
25.157	443.415
25.980	439.188
26.954	440.360
28.002	439.728
28.978	446.302
29.951	445.673
30.849	439.642
31.973	443.811
33.021	440.778
34.071	446.750
34.897	454.529
35.794	448.499
36.844	450.268
37.818	452.641
38.940	444.802
39.989	448.373
40.666	459.759
41.864	456.722
42.911	448.886
43.662	460.270
44.785	456.634
45.983	455.397
47.103	435.552
47.929	447.534
48.982	468.515
51.148	439.633
53.846	442.554
54.824	462.336
58.646	474.228]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BlocLock1993';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.064	219.038
0.892	264.961
2.077	294.466
3.193	319.639
3.957	344.788
4.936	359.568
6.054	376.953
7.034	386.540
8.008	416.030
8.989	423.887
9.968	435.205
11.013	463.835
12.139	456.989
13.117	472.634
14.023	495.197
15.143	506.524
15.916	503.116
16.966	515.304
18.008	550.857
19.070	523.239
19.836	545.791
21.239	549.350
21.936	567.571
22.924	550.332
24.188	549.554
25.095	571.252
26.011	558.334
26.781	568.772
28.043	574.052
28.952	586.230
29.942	566.395
30.781	576.838
31.904	577.781
33.032	565.744
33.942	574.460
34.921	585.778
35.979	571.140
36.962	572.939
38.012	584.261
39.069	570.488
41.940	598.379
43.839	588.126
45.870	605.575]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BlocLock1993';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ % time since birth (yr), weight (kg)
0.025	146.734
0.969	259.755
2.057	312.632
2.993	372.732
4.005	430.424
5.175	512.164
6.183	543.395
7.023	492.846
8.058	690.055
8.983	690.018
10.220	704.401
11.012	829.455
12.248	846.244
13.089	800.506
14.095	819.710
15.090	776.371
16.194	925.468
17.197	923.022
18.189	860.439
19.279	922.938
20.124	906.066
21.053	922.867
22.136	946.879
23.220	968.485
24.288	898.683
24.991	953.981
25.997	973.184
26.920	961.120
28.237	997.150
29.144	886.460
30.179	1078.859
31.168	997.032
32.024	1042.702
33.178	1030.629
34.168	951.207
35.197	1109.929
36.266	1049.749
37.025	970.337
38.134	1153.110
39.095	898.089
41.056	1097.667
42.054	1073.572
42.969	1008.586
45.064	1085.478
55.122	1277.515]; 
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
units.tW_f  = {'d', 'kg'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f  = C2K(37);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BlocLock1993';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (yr), weight (kg)
0.073	168.096
1.178	266.705
2.109	348.155
3.153	408.000
4.028	511.030
5.076	613.976
5.944	648.043
7.102	686.281
8.210	819.371
9.136	849.100
9.961	1034.050
11.113	1011.947
12.161	1123.513
13.074	1006.697
14.148	1394.114
15.223	1165.151
16.265	1203.445
17.092	1409.945
18.252	1482.665
19.054	1417.626
20.052	1606.803
21.145	1567.487
22.088	1786.863
23.050	1583.816
23.866	1678.252
24.982	1888.925
26.013	1802.225
26.835	1965.624
29.051	1589.563
29.828	1890.914
30.931	1963.662
31.808	2083.932
32.931	1751.497
34.868	2108.328
36.074	2056.026
36.937	2021.131
38.015	1830.959
38.832	1934.016];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
units.tW_m  = {'d', 'kg'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m  = C2K(37);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BlocLock1993';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 0 * weights.tg;
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k = 0.3; weights.psd.k_J = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Gestation time was ignorned because of inconsistentcy with tL and tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3G9Z6'; % Cat of Life
metaData.links.id_ITIS = '552461'; % ITIS
metaData.links.id_EoL = '46559256'; % Ency of Life
metaData.links.id_Wiki = 'Globicephala_melas'; % Wikipedia
metaData.links.id_ADW = 'Globicephala_melas'; % ADW
metaData.links.id_Taxo = '68769'; % Taxonomicon
metaData.links.id_WoRMS = '137097'; % WoRMS
metaData.links.id_MSW3 = '14300052'; % MSW3
metaData.links.id_AnAge = 'Globicephala_melas'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Globicephala_melas}}';
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
bibkey = 'BlocLock1993'; type = 'article'; bib = [ ... 
'author = {Dorete Bloch and Christiana Lockyer and Martin Zachariassen}, ' ... 
'year = {1993}, ' ...
'title = {Age and growth parameters of the long-finned pilot whale off the {F}aroe {I}slands}, ' ...
'journal = {Report of the International Whaling Commission}, ' ...
'volume = {Special Issue 14}, ' ...
'pages = {163–207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Globicephala_melas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Globicephala_melas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


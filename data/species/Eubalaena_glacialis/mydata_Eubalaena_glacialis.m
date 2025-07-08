function [data, auxData, metaData, txtData, weights] = mydata_Eubalaena_glacialis

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenidae';
metaData.species    = 'Eubalaena_glacialis'; 
metaData.species_en = 'North Atlantic right whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};                            
metaData.date_subm = [2017 01 10];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data
data.tg = 350;       units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'AnAge';    
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from learner';
data.tx =  213; units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';    
  temp.tx = C2K(38); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp =  2920; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 67 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 794328;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 23e6;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';

data.Ri = 0.29/365;    units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
0/365	583.019
17/365	507.547
44/365	513.208
46/365	458.491
164/365	913.208
200/365	869.811
219/365	898.113
220/365	822.642
221/365	866.038
218/365	950.943
219/365	998.113
236/365	975.472
2.170	1000.660
1.714	1094.529
1.822	1104.138
1.661	1125.807
4.703	1130.252
6.695	1139.635
4.703	1142.280
5.645	1151.788
6.695	1154.068
6.696	1185.339
4.650	1195.207
14.664	1196.408
4.596	1202.430
7.665	1216.494
6.697	1240.665
6.643	1259.916
5.701	1267.246
8.636	1281.326
15.634	1292.511
16.682	1174.516
16.684	1299.602
14.073	1302.321
10.655	1302.732
8.663	1305.377
12.566	1312.124
15.635	1316.566
14.693	1316.680
13.670	1328.830
10.655	1329.193
19.646	1340.139
9.633	1343.749
13.697	1345.665
11.652	1350.722
20.696	1364.068
18.678	1369.121
14.613	1369.610
12.137	1379.530
20.616	1385.727
18.678	1388.365
12.702	1389.084
19.647	1400.276
18.678	1407.609
15.691	1415.185
13.699	1425.047
9.312	1466.468];
[~, in] = sort(data.tL_f(:,1));  data.tL_f = data.tL_f(in,:);
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(38);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FortTrit2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), length (cm)
41/365	354.717
20/365	362.264
4/365	415.094
5/365	492.453
71/365	701.887
85/365	701.887
100/365 762.264
217/365	875.472
218/365	928.302
219/365	950.943
220/365	966.038
236/365	981.132
1.659	1015.155
2.467	1031.896
4.675	1091.768
2.656	1101.632
5.645	1113.301
3.680	1120.753
5.672	1125.325
3.680	1144.808
1.661	1145.051
1.904	1149.833
7.610	1151.552
1.662	1159.484
4.569	1173.567
7.665	1178.006
8.688	1180.289
6.696	1180.528
8.688	1194.722
10.680	1199.293
7.719	1202.055
6.669	1204.586
5.673	1209.517
5.673	1209.517
8.634	1221.188
6.643	1221.428
14.610	1225.281
10.680	1225.753
12.645	1230.328
3.682	1231.406
11.650	1235.259
12.646	1239.950
4.597	1243.323
10.681	1254.619
18.676	1263.280
5.647	1264.847
15.634	1273.267
16.630	1275.553
13.669	1275.909
9.632	1283.611
15.634	1285.295
20.614	1296.723
14.612	1302.256
21.691	1303.810
13.643	1304.778
9.659	1314.880
17.735	1340.369
20.696	1347.229
19.727	1352.157
9.714	1355.766
12.675	1369.843];
[~, in] = sort(data.tL_m(:,1));  data.tL_m = data.tL_m(in,:);
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(38);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FortTrit2012';
comment.tL_m = 'Data for males';

% length-weight data
data.LW_f = [ ... % length (cm), weight (kg)
 600   700
 455  1130
 473  1134
 478  1151
 910 11045
1005 15000
1360 29700
1370 52640
1229 14785];
units.LW_f  = {'cm', 'kg'};  label.LW_f = {'length', 'weight', 'female'};  
bibkey.LW_f = 'FortTrit2012';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % length (cm), weight (kg)
 600  700
 412 1227
 495 1586
 417 2000
 581 2041
1030 9055
 365  749];
units.LW_m  = {'cm', 'kg'};  label.LW_m = {'length', 'weight', 'male'};  
bibkey.LW_m = 'FortTrit2012';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f; 
weights.tL_m = 10 * weights.tL_m; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3BNBR'; % Cat of Life
metaData.links.id_ITIS = '180537'; % ITIS
metaData.links.id_EoL = '46559421'; % Ency of Life
metaData.links.id_Wiki = 'Eubalaena_glacialis'; % Wikipedia
metaData.links.id_ADW = 'Eubalaena_glacialis'; % ADW
metaData.links.id_Taxo = '168088'; % Taxonomicon
metaData.links.id_WoRMS = '159023'; % WoRMS
metaData.links.id_MSW3 = '14300008'; % MSW3
metaData.links.id_AnAge = 'Eubalaena_glacialis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eubalaena_glacialis}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FortTrit2012'; type = 'Article'; bib = [ ... 
'author = {S. M. E. Fortune and A. W. Trites and W. L. Perryman and M. J. Moore and H. M. Pettis and O. S. Lynn}, ' ... 
'year = {2012}, ' ...
'title = {Growth and rapid early development of {N}orth {A}tlantic right whales (\emph{Eubalaena glacialis})}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {93}, ' ...
'pages = {1342-1354}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eubalaena_glacialis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Eubalaena_glacialis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'learner'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.learner.org/jnorth/tm/gwhale/AdaptationsBody.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


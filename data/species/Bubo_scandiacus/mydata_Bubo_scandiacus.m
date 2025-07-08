function [data, auxData, metaData, txtData, weights] = mydata_Bubo_scandiacus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Bubo_scandiacus'; 
metaData.species_en = 'Snowy owl'; 

metaData.ecoCode.climate = {'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCva', 'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 04];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 32;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Tmep is guessed';
data.tx = 46;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'raptor';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '43 till 50 d. Body temp from ChapDies1984 for B. virginiatus';
data.tp = 138;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '43 till 50 d. Body temp from ChapDies1984 for B. virginiatus';
data.tR = 730;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 45;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'AnAge';
data.Wwi = 2200;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'PotaSale2012';
data.Wwim = 1625;    units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'PotaSale2012';

data.Ri  = 6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.005	40.956
1.586	47.192
2.113	37.686
2.114	53.483
2.182	85.075
2.183	104.033
3.167	47.109
3.171	107.140
3.698	110.272
3.959	66.024
4.028	113.414
4.889	189.198
4.947	78.611
5.018	154.436
5.939	141.749
6.073	167.019
6.133	78.548
6.736	239.654
6.927	135.378
7.129	204.878
7.130	220.676
8.047	138.479
8.647	252.191
8.976	242.695
9.114	346.954
9.168	166.856
9.770	296.366
9.843	416.425
10.032	283.714
10.036	346.905
10.300	346.891
10.572	473.259
10.830	397.416
10.833	444.809
11.028	406.884
11.029	416.363
11.030	429.001
11.628	517.437
11.957	504.782
12.019	457.385
12.140	293.082
12.482	479.478
12.940	438.379
12.944	495.251
12.948	558.442
13.871	571.032
13.993	419.367
14.077	700.563
14.140	646.847
14.538	700.538
14.868	710.000
15.063	668.915
15.857	725.745
16.323	795.231
16.840	656.183
16.848	773.087
17.101	618.255
19.018	728.738
19.019	741.377
19.956	962.496
21.144	997.189
22.008	1114.047
23.003	1227.739
24.041	981.239
24.042	987.558
24.052	1155.014
24.916	1275.031
26.102	1278.128
27.875	1195.887
28.991	1138.956
30.134	1495.926
30.912	1315.790
32.162	1290.448
32.956	1340.959
35.011	1543.062
35.992	1445.064
38.040	1542.903
38.966	1593.407
41.933	1650.123
46.952	1848.910
58.022	1930.476];  
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'PotaSale2012';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.927	40.908
0.928	50.386
1.127	66.174
2.048	53.487
2.181	75.597
3.102	53.431
3.170	91.342
3.302	97.655
4.092	91.294
5.015	103.883
5.937	103.835
5.940	154.388
7.127	170.123
7.721	189.049
7.722	211.166
8.121	268.017
8.778	236.387
10.895	387.934
11.084	255.223
11.813	318.375
13.996	463.600
13.998	495.196
14.056	375.129
16.116	659.381
17.966	744.592
18.028	684.557
18.029	703.514
20.803	813.953
21.137	899.243
21.862	896.045
22.122	848.638
22.856	997.099
23.969	892.775
24.826	895.889
26.014	936.901
26.938	974.767
28.000	1097.934
29.975	1088.351
30.970	1189.405
31.886	1094.570
31.961	1236.746
32.949	1230.375
33.940	1287.194
34.981	1097.566
49.899	1602.310
57.924	1443.909];  
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'PotaSale2012';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assume to differ from females by {p_Am} only';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: males have equal state variables at b, compared to females';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'NKTJ'; % Cat of Life
metaData.links.id_ITIS = '686683'; % ITIS
metaData.links.id_EoL = '45510727'; % Ency of Life
metaData.links.id_Wiki = 'Bubo_scandiacus'; % Wikipedia
metaData.links.id_ADW = 'Nyctea_scandiaca'; % ADW
metaData.links.id_Taxo = '755750'; % Taxonomicon
metaData.links.id_WoRMS = '1459996'; % WoRMS
metaData.links.id_avibase = '5B23B360E7DEC4A9'; % avibase
metaData.links.id_birdlife = 'snowy-owl-bubo-scandiacus'; % birdlife
metaData.links.id_AnAge = 'Bubo_scandiacus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bubo_scandiacus}}';
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
bibkey = 'PotaSale2012'; type = 'Book'; bib = [ ... 
'author = {E. Potapov and R. Sale}, ' ... 
'year = {2012}, ' ...
'title = {The snowy owl}, ' ...
'address = {London}, ' ...
'publisher = {T. \& A. D. Poyser}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bubo_scandiacus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'raptor'; type = 'Misc'; bib = ...
'howpublished = {\url{http://raptormonitoring.org/wp-content/uploads/2015/05/Raptors-2014-Snowy-Owl.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChapDies1984'; type = 'Article'; bib = [ ... 
'author = {Chaplin, S. B. and diesel, D. A. and Kasparie, J. A.}, ' ... 
'year = {1984}, ' ...
'title = {Body temperature regulation in red-tailed hawks and great horned owls: Responses to air temperature and food deprivation}, ' ...
'journal = {The Condor}, ' ...
'volume = {86}, ' ...
'pages = {175--181}'];
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


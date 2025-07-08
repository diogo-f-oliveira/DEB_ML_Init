function [data, auxData, metaData, txtData, weights] = mydata_Nipponia_nippon
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Threskiornithidae';
metaData.species    = 'Nipponia_nippon'; 
metaData.species_en = 'Crested ibis';

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFe'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JX'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 19];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 28;   units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'ADW';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '26-30 d';
data.tx = 45;     units.tx = 'd';    label.tx = 'time since birth at fledging';  bibkey.tx = 'ADW';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 135;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'ADW';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25.8*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 54.2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'XiLu2001';
data.Wwi = 1900;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'avibase';

data.Ri  = 2.5*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'XiLu2001';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6 eggs per clutch, 2-3 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.142	54.225
2.147	54.225
3.087	69.014
4.160	78.873
5.033	88.732
6.039	98.592
6.845	113.380
8.055	147.887
8.995	162.676
9.938	197.183
10.879	221.831
11.955	251.408
12.964	276.056
13.974	310.563
14.917	350.000
16.064	409.155
17.072	428.873
18.151	483.099
19.163	527.465
20.040	571.831
21.253	621.127
22.329	650.704
23.273	695.070
23.947	724.648
25.158	759.155
26.102	808.451
27.180	847.887
28.393	902.113
29.132	916.901
30.072	931.690
31.078	936.620
32.022	980.986
33.030	1000.704
34.036	1015.493
34.976	1030.282
36.052	1059.859
37.126	1074.648
38.204	1114.085
39.283	1163.380
40.236	1271.831
41.105	1257.042
42.234	1192.958
43.175	1217.606
44.180	1217.606];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'XiLu2001';
 
% time-food intake
data.tJX = [ ... % times since birth (d), feeding rate (g/d)
1.068	2.347
2.076	12.906
2.951	24.639
3.959	34.025
5.169	43.411
6.043	52.798
7.184	57.491
7.991	66.877
9.134	78.610
10.209	83.303
11.217	92.689
12.159	105.596
13.034	118.502
14.111	134.928
15.253	144.314
16.126	147.834
17.134	156.047
18.076	166.606
19.217	171.300
20.225	177.166
21.233	185.379
22.242	198.285
23.317	204.152
24.192	217.058
25.202	233.484
26.276	235.830
27.417	239.350
28.156	246.390
29.363	244.043
30.437	246.390
31.379	256.949
32.252	259.296
33.259	263.989
34.268	274.549
35.473	263.989
36.211	261.643
37.354	276.895
38.421	246.390
39.294	247.563
40.364	232.310
41.369	226.444
42.441	217.058
43.454	251.083];
units.tJX   = {'d', 'g/d'};  label.tJX = {'time since birth', 'food intake'};  
temp.tJX    = C2K(40.6);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
bibkey.tJX = 'XiLu2001';
comment.tJX = 'food consists of loach, milkpowder, chicken and mealworm';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tJX = weights.tJX * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '73ZHZ'; % Cat of Life
metaData.links.id_ITIS = '174955'; % ITIS
metaData.links.id_EoL = '45516064'; % Ency of Life
metaData.links.id_Wiki = 'Nipponia_nippon'; % Wikipedia
metaData.links.id_ADW = 'Nipponia_nippon'; % ADW
metaData.links.id_Taxo = '93172'; % Taxonomicon
metaData.links.id_WoRMS = '1527951'; % WoRMS
metaData.links.id_avibase = '3E328C3C526E7ECF'; % avibase
metaData.links.id_birdlife = 'aasian-crested-ibis-nipponia-nippon'; % birdlife
metaData.links.id_AnAge = 'Nipponia_nippon'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nipponia_nippon}}';
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
bibkey = 'XiLu2001'; type = 'Article'; bib = [ ... 
'author = {Yongmei Xi and Baozhong Lu and Noboru Fujihara}, ' ... 
'year = {2001}, ' ...
'title = {Captive Rearing and Breeding of the Crested Ibis, \emph{Nipponia nippon}}, ' ...
'journal = {Journal of Poultry Science}, ' ...
'volume = {38}, ' ...
'pages = {213-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nipponia_nippon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3E328C3C526E7ECF&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Nipponia_nippon/}}';
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


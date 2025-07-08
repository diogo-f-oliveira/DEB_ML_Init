function [data, auxData, metaData, txtData, weights] = mydata_Haliaeetus_leucocephalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Haliaeetus_leucocephalus'; 
metaData.species_en = 'Bald eagle'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 35;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 80;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Bort1984';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 48*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 117;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwi = 5350; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'avibase';
data.Wwim = 4130; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch; 1 clutch/yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.000	113.122
0.645	113.122
1.840	150.829
2.942	180.995
4.045	211.161
5.148	256.410
6.343	294.117
8.365	392.157
9.193	467.572
11.033	641.026
12.323	822.021
13.791	776.772
14.346	980.392
15.266	1055.807
16.187	1199.095
17.291	1266.968
18.303	1395.174
19.216	1093.514
20.143	1538.462
21.068	1915.535
22.261	1840.121
23.186	2171.946
24.287	2156.863
26.133	2631.976
27.413	2322.775
28.339	2722.474
29.539	3031.674
31.195	3167.421
32.295	3061.840
33.313	3499.246
34.317	3159.879
35.336	3589.744
36.072	3702.866
37.172	3559.578
39.381	3815.988
40.300	3861.237
41.222	4027.149
41.868	4185.520
43.154	4185.520
45.082	4132.730
46.005	4389.140
46.924	4411.765
48.026	4426.848
48.858	4690.799
49.861	4336.350
50.877	4645.551
51.980	4653.092
52.989	4585.219
54.183	4615.385
54.920	4698.341
56.020	4622.926
57.035	4856.712
57.854	4419.306
60.064	4751.131
60.984	4803.922
62.177	4758.673
62.633	4577.677
64.750	4834.087
66.770	4819.005
69.154	4555.053
72.744	5000.000
73.757	5135.747];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight','female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'Bort1984';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.000	120.664
0.921	150.829
2.023	150.829
3.402	180.995
4.780	211.161
5.883	271.493
7.354	361.991
8.918	475.113
10.206	603.318
11.308	573.152
12.502	595.777
14.068	852.187
15.081	965.309
16.094	1146.305
17.103	1055.807
17.933	1244.344
19.128	1282.051
20.232	1365.007
21.336	1478.129
21.706	1606.335
24.282	1870.287
25.020	2051.282
25.940	2111.614
27.134	2134.238
28.146	2202.112
31.094	2699.849
32.379	2639.517
33.119	2933.635
34.039	3009.050
35.051	3076.923
36.060	3016.591
36.793	2903.469
37.991	3122.172
39.093	3122.172
39.831	3318.250
40.934	3355.958
41.757	3167.421
42.862	3295.626
43.783	3461.538
44.976	3378.582
45.900	3672.700
46.813	3393.665
47.830	3763.198
49.112	3521.870
49.939	3559.578
50.950	3604.827
51.868	3597.285
52.691	3386.124
53.889	3597.285
54.534	3695.324
55.821	3740.573
57.015	3740.573
57.756	4087.481
59.864	3846.154
60.782	3800.905
61.792	3800.905
62.803	3823.529
63.997	3838.612
66.932	3627.451
67.672	3891.403
76.676	4057.315
79.888	3936.652];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight','male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'Bort1984';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3JBJW'; % Cat of Life
metaData.links.id_ITIS = '175420'; % ITIS
metaData.links.id_EoL = '45511401'; % Ency of Life
metaData.links.id_Wiki = 'Haliaeetus_leucocephalus'; % Wikipedia
metaData.links.id_ADW = 'Haliaeetus_leucocephalus'; % ADW
metaData.links.id_Taxo = '52681'; % Taxonomicon
metaData.links.id_WoRMS = '159374'; % WoRMS
metaData.links.id_avibase = 'FED3756C12CF67FA'; % avibase
metaData.links.id_birdlife = 'bald-eagle-haliaeetus-leucocephalus'; % birdlife
metaData.links.id_AnAge = 'Haliaeetus_leucocephalus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haliaeetus_leucocephalus}}';
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
bibkey = 'Bort1984'; type = 'Article'; bib = [ ... 
'author = {Gary R. Bortolotti}, ' ... 
'year = {1984}, ' ...
'title = {PHYSICAL DEVELOPMENT OF NESTLING BALD EAGLES WITH EMPHASIS ON THE TIMING OF GROWTH EVENTS}, ' ...
'journal = {Wilson Bull.}, ' ...
'volume = {96(4)}, ' ...
'pages = {524-542}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Haliaeetus_leucocephalus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=FED3756C12CF67FA&sec=lifehistory}}';
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


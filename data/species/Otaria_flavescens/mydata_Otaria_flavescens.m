function [data, auxData, metaData, txtData, weights] = mydata_Otaria_flavescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Otaria_flavescens'; 
metaData.species_en = 'South American sea lion'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE', 'MASW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'JXi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 357;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp from Zalophus_californianus';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1461;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 2191;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 29*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 79;   units.Lb  = 'cm';  label.Lb  = 'length at birth of females';         bibkey.Lb  = 'ADW';
data.Lbm  = 82;   units.Lbm  = 'cm';  label.Lbm  = 'length at birth of males';        bibkey.Lbm  = 'ADW';
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'ADW';
data.Lim  = 250;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'ADW';
  
data.Wwb = 12.3e3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth of females';    bibkey.Wwb = 'ADW';
data.Wwbm = 13.5e3; units.Wwbm = 'g';  label.Wwbm = 'wet weight at birth of males';   bibkey.Wwbm = 'ADW';
data.Wwi = 150e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'ADW';
data.Wwim = 350e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'ADW';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
0.544	101.325
1.415	146.099
1.850	136.220
3.102	142.547
3.537	152.865
3.537	169.121
3.728	152.853
3.728	147.435
4.054	160.223
4.190	170.066
4.272	171.047
4.354	179.909
4.571	185.314
4.599	160.189
4.707	178.902
4.707	167.079
4.871	172.980
4.952	168.049
5.224	188.722
5.497	179.346
6.503	169.924
6.612	174.351
6.694	171.390
7.293	184.654
7.293	172.338
7.320	200.416
7.347	192.532
7.891	190.528
8.218	172.774
8.299	205.281
9.197	189.462
9.932	193.358
10.150	187.433
10.259	200.235
11.782	193.737
12.027	186.825
13.088	184.789
13.170	205.474
14.068	182.759];
data.tL_f(:,1) = data.tL_f(:,1) * 365.25; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(38.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RosaHaum1993';
comment.tL_f = 'data for female';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0.707	115.601
0.707	128.409
1.469	155.948
1.633	163.327
1.959	163.307
2.422	175.594
2.585	183.958
2.612	160.804
2.667	179.027
2.694	205.134
2.884	199.211
2.939	204.626
3.075	179.002
3.102	194.271
3.265	188.350
3.320	192.780
3.320	200.169
3.374	183.417
3.429	173.069
3.537	188.333
3.537	195.230
3.537	212.471
3.619	199.166
3.918	224.763
4.082	218.349
4.245	172.033
4.299	210.946
4.299	204.050
4.490	222.265
4.490	226.698
4.571	213.393
4.599	204.031
4.626	224.227
4.680	228.164
4.735	238.506
4.816	232.097
4.844	226.184
4.844	222.735
4.898	229.136
4.980	202.530
4.980	218.786
5.143	224.688
5.143	228.136
5.224	210.397
5.252	219.262
5.279	243.398
5.279	223.201
5.306	231.081
5.415	206.444
5.415	228.119
5.469	215.800
5.497	223.188
5.551	251.756
5.605	229.585
5.605	235.989
5.633	200.027
5.687	225.147
5.714	221.204
5.878	223.657
6.068	232.020
6.150	241.374
6.204	224.622
6.259	235.456
6.340	229.540
6.476	232.487
6.503	239.875
6.531	225.587
6.912	232.460
6.912	237.879
7.102	235.897
7.129	243.777
7.129	254.122
7.265	242.783
7.347	247.212
7.347	213.714
7.401	232.923
7.429	237.847
7.429	241.296
7.456	207.304
7.510	245.231
8.190	255.534
8.408	243.698
8.490	259.457
9.333	249.060
9.524	263.334
9.769	244.600
9.959	239.662
10.150	226.842
10.340	233.727
11.320	254.356
11.347	247.458
11.701	264.678
12.136	229.676
12.571	257.235
13.143	239.466
13.279	266.058
13.415	239.449
13.986	265.030
14.095	253.200
14.259	260.087
16.054	248.154];
data.tL_m(:,1) = data.tL_m(:,1) * 365.25; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(38.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RosaHaum1993';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'females', 'males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumes to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4B23F'; % Cat of Life
metaData.links.id_ITIS = '180619'; % ITIS
metaData.links.id_EoL = '46559204'; % Ency of Life
metaData.links.id_Wiki = 'Otaria_flavescens'; % Wikipedia
metaData.links.id_ADW = 'Otaria_flavescens'; % ADW
metaData.links.id_Taxo = '67409'; % Taxonomicon
metaData.links.id_WoRMS = '344630'; % WoRMS
metaData.links.id_MSW3 = '14001015'; % MSW3
metaData.links.id_AnAge = 'Otaria_flavescens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otaria_flavescens}}';
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
bibkey = 'RosaHaum1993'; type = 'Article'; bib = [ ... 
'author = {F. C. W. Rosas and M. Haumovici AND M. Cristina}, ' ... 
'year = {1993}, ' ...
'title = {AGE AND GROWTH OF THE {S}OUTH {A}MERICAN SEA LION, \emph{Otaria flavescens} ({S}HAW, 1800), IN SOUTHERN {B}RAZIL}, ' ...
'journal = {J. Mamm.}, ' ...
'volume = {74}, ' ...
'pages = {141--147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Otaria_flavescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Otaria_flavescens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



function [data, auxData, metaData, txtData, weights] = mydata_Neomonachus_schauinslandi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Neomonachus_schauinslandi'; 
metaData.species_en = 'Hawaiian monk seal'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 06]; 

%% set data
% zero-variate data

data.tg = 335 ;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1825;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)';  bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 37*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Monachus monachus';

data.Lb  = 100;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Li  = 240;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'Wiki';
  
data.Wwb = 17e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Wiki gives 14-18 kg; ADW gives 14-17 kg';
data.Wwx = 64e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
  comment.Wwx = 'ADW: 50-100 kg';
data.Wwi = 222.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';

data.Ri  = 0.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter per 2 yr';
 
% uni-variate data

% time-length
data.tL_MHI = [ ... % time since birth (yr), standard length (cm)
0.963	159.322
1.002	144.068
1.002	141.356
2.042	176.610
2.813	180.339
2.852	173.898
2.929	159.661
2.967	168.475
3.969	188.814
4.971	199.661
6.050	205.424
6.936	212.542
7.013	195.932
10.983	215.254
15.067	220.000
20.077	212.881];  
data.tL_MHI(:,1) = data.tL_MHI(:,1) * 365; % yr to d
units.tL_MHI   = {'d', 'cm'};  label.tL_MHI = {'time since birth', 'standard length', 'Main Hawaiian Islands'};  
temp.tL_MHI    = C2K(37);  units.temp.tL_MHI = 'K'; label.temp.tL_MHI = 'temperature';
bibkey.tL_MHI = 'BakeJoha2014';
comment.tL_MHI = 'Data for Main Hawaiian Islands';
%
data.tL_FFS = [ ... % time since birth (yr), standard length (cm)
0.960	121.711
0.998	144.423
1.036	141.712
1.036	140.017
1.075	150.187
1.075	148.153
1.075	137.306
1.075	133.916
1.075	132.899
1.075	130.526
1.075	127.475
1.075	125.102
1.075	122.729
1.075	118.323
1.075	111.543
1.996	166.135
1.996	161.728
1.996	159.355
1.996	158.338
1.996	156.643
1.996	154.948
1.996	153.593
1.996	150.881
2.073	148.170
2.073	145.797
2.073	142.746
2.073	140.034
2.073	137.662
2.073	135.967
2.073	133.933
2.073	130.543
2.073	127.831
2.073	126.136
2.073	123.085
2.956	171.236
2.994	135.982
2.994	153.270
2.994	156.321
2.994	157.677
2.994	159.711
3.033	167.169
3.071	142.763
3.071	145.475
3.071	148.187
3.071	150.899
3.992	171.931
4.031	181.763
4.031	147.864
4.069	165.831
4.069	158.712
5.067	163.475
6.065	163.153
6.065	161.797
6.948	163.507
6.987	158.762
7.025	179.440
7.025	187.576
8.023	156.068
8.061	206.916
9.060	194.390
10.019	210.678
10.019	207.966
10.019	202.542
10.019	198.813
10.019	189.661
10.058	191.695
11.017	190.356
11.017	193.406
11.017	210.017
11.056	186.966
11.056	204.933
11.056	206.627
11.900	217.150
11.977	214.779
11.977	212.067
12.015	197.830
12.092	206.645
12.092	202.238
12.092	176.475
13.013	221.576
13.052	203.949
13.973	192.440
13.973	198.880
14.012	212.779
15.048	220.593
15.048	191.780];  
data.tL_FFS(:,1) = data.tL_FFS(:,1) * 365; % yr to d
units.tL_FFS   = {'d', 'cm'};  label.tL_FFS = {'time since birth', 'standard length', 'French Frigate Shoal'};  
temp.tL_FFS    = C2K(37);  units.temp.tL_FFS = 'K'; label.temp.tL_FFS = 'temperature';
bibkey.tL_FFS = 'BakeJoha2014';
comment.tL_FFS = 'Data for French Frigate Shoal';
%
data.tL_LAY = [ ... % time since birth (yr), standard length (cm)
0.923	155.710
0.923	152.990
0.923	150.271
0.923	142.452
0.923	138.033
0.962	158.770
0.962	148.572
0.962	119.676
1.000	130.215
1.038	133.615
1.038	127.496
1.038	124.097
1.077	145.174
1.962	162.526
1.962	164.226
2.000	139.071
2.000	142.130
2.000	143.830
2.000	146.210
2.000	148.249
2.000	150.969
2.000	155.048
2.000	157.428
2.000	160.487
2.000	166.946
2.000	174.765
2.923	162.883
2.962	168.322
2.962	166.283
2.962	160.504
2.962	153.025
3.000	182.941
3.000	181.241
3.077	131.610
4.000	178.198
6.154	196.252
7.038	202.726
10.000	204.816
10.038	208.216
12.962	218.124
13.000	220.844
14.038	220.182
15.962	200.838
16.077	217.157
17.000	184.878];  
data.tL_LAY(:,1) = data.tL_LAY(:,1) * 365; % yr to d
units.tL_LAY   = {'d', 'cm'};  label.tL_LAY = {'time since birth', 'standard length', 'Laysan Island'};  
temp.tL_LAY    = C2K(37);  units.temp.tL_LAY = 'K'; label.temp.tL_LAY = 'temperature';
bibkey.tL_LAY = 'BakeJoha2014';
comment.tL_LAY = 'Data for Laysan Island';
%
data.tL_LIS = [ ... % time since birth (yr), standard length (cm)
0.923	146.855
0.962	135.977
0.962	140.057
0.962	149.235
1.000	133.938
1.077	122.380
1.923	163.853
1.923	157.734
1.962	152.295
1.962	148.215
1.962	144.816
2.038	138.697
2.038	133.258
2.038	131.558
2.885	170.652
2.923	153.314
2.962	160.793
2.962	158.414
4.923	193.428
8.962	179.150
11.962	209.405
14.000	203.286
17.038	197.167];  
data.tL_LIS(:,1) = data.tL_LIS(:,1) * 365; % yr to d
units.tL_LIS   = {'d', 'cm'};  label.tL_LIS = {'time since birth', 'standard length', 'Lisianski Island'};  
temp.tL_LIS    = C2K(37);  units.temp.tL_LIS = 'K'; label.temp.tL_LIS = 'temperature';
bibkey.tL_LIS = 'BakeJoha2014';
comment.tL_LIS = 'Data for Lisianski Island';
%
data.tL_PHR = [ ... % time since birth (yr), standard length (cm)
0.888	137.852
0.917	155.308
0.924	145.490
0.932	134.217
1.022	122.584
1.905	158.980
1.906	156.435
1.942	164.800
1.950	152.436
1.953	148.800
1.955	145.527
1.981	167.710
1.999	142.256
2.895	157.562
2.897	155.743
2.934	161.563
4.854	187.087
4.942	179.454
4.989	171.092
5.912	207.853
5.916	202.035
6.948	200.982
6.957	187.527
8.883	205.052
9.912	207.635
9.964	192.728
10.899	212.034
11.838	226.250
11.843	218.614
12.917	216.471
13.908	213.598
13.912	207.780
14.905	203.453];  
data.tL_PHR(:,1) = data.tL_PHR(:,1) * 365; % yr to d
units.tL_PHR   = {'d', 'cm'};  label.tL_PHR = {'time since birth', 'standard length', 'Pearl and Hermes Reef'};  
temp.tL_PHR    = C2K(37);  units.temp.tL_PHR = 'K'; label.temp.tL_PHR = 'temperature';
bibkey.tL_PHR = 'BakeJoha2014';
comment.tL_PHR = 'Data for Pearl and Hermes Reef';
%
data.tL_MDY = [ ... % time since birth (yr), standard length (cm)
0.935	143.674
0.973	150.967
0.974	148.779
0.977	141.849
1.009	167.744
1.012	159.720
1.013	154.978
1.018	140.388
1.019	137.106
1.020	134.917
1.064	126.891
1.999	158.954
2.004	146.188
2.037	169.895
2.042	153.846
2.079	167.340
2.976	190.651
2.979	182.992
3.105	174.233
3.108	166.573
4.048	186.235
4.995	184.742
6.011	220.449
6.021	193.093
6.998	222.602
7.002	211.659
7.004	205.823
8.071	213.079
9.064	197.724
10.003	222.127
10.043	223.950
10.947	226.835
11.979	219.867
12.961	233.691
14.002	198.638
14.035	223.439
16.009	227.744];  
data.tL_MDY(:,1) = data.tL_MDY(:,1) * 365; % yr to d
units.tL_MDY   = {'d', 'cm'};  label.tL_MDY = {'time since birth', 'standard length', 'Midway Atoll'};  
temp.tL_MDY    = C2K(37);  units.temp.tL_MDY = 'K'; label.temp.tL_MDY = 'temperature';
bibkey.tL_MDY = 'BakeJoha2014';
comment.tL_MDY = 'Data for Midway Atoll';
%
data.tL_KUR = [ ... % time since birth (yr), standard length (cm)
0.988	158.331
0.988	142.427
1.029	121.464
1.975	158.349
2.016	168.470
2.016	174.976
2.058	163.411
2.058	180.760
2.963	190.535
2.963	185.837
2.963	183.668
3.004	168.127
3.045	170.657
3.045	158.730
7.942	193.878
10.041	209.459
14.979	204.488
16.049	218.603
16.955	204.523
18.971	198.777];  
data.tL_KUR(:,1) = data.tL_KUR(:,1) * 365; % yr to d
units.tL_KUR   = {'d', 'cm'};  label.tL_KUR = {'time since birth', 'standard length', 'Kure Atoll'};  
temp.tL_KUR    = C2K(37);  units.temp.tL_KUR = 'K'; label.temp.tL_KUR = 'temperature';
bibkey.tL_KUR = 'BakeJoha2014';
comment.tL_KUR = 'Data for Kure Atoll)';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_MHI','tL_FFS','tL_LAY','tL_LIS'}; subtitle1 = {'data for MHI, FFS, LAY, LIS'};
set2 = {'tL_PHR','tL_MDY','tL_KUR'}; subtitle2 = {'data for PHR, MDY, KUR'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males and females are assumed not to differ';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '46N48'; % Cat of Life
metaData.links.id_ITIS = '1133135'; % ITIS
metaData.links.id_EoL = '59966020'; % Ency of Life
metaData.links.id_Wiki = 'Neomonachus_schauinslandi'; % Wikipedia
metaData.links.id_ADW = 'Monachus_schauinslandi'; % ADW
metaData.links.id_Taxo = '5529130'; % Taxonomicon
metaData.links.id_WoRMS = '255019'; % WoRMS
metaData.links.id_MSW3 = '14001052'; % MSW3
metaData.links.id_AnAge = 'Monachus_schauinslandi'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neomonachus_schauinslandi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Monachus_schauinslandi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Monachus_schauinslandi/}}';
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
bibkey = 'BakeJoha2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/mms.12035}, ' ...
'author = {Jason D. Baker and Thea C. Johans and Tracy A. Wurth and Charles L. Littnan}, ' ... 
'year = {2014}, ' ...
'title = {Body growth in {H}awaiian monk seals}, ' ...
 'journal = {Marine Mammal Science}, ' ...
'volume = {30(1)}, ' ...
'pages = {259–271}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


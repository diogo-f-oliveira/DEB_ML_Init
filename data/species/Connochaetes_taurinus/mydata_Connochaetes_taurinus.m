function [data, auxData, metaData, txtData, weights] = mydata_Connochaetes_taurinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Connochaetes_taurinus'; 
metaData.species_en = 'Blue wildebeest'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 253;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 278;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 411;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 912; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 24.3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 18.125e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'AnAge';
data.Wwi = 260e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
data.Wwim = 290e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.0); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (kg)
0.021	14.435
0.044	23.662
0.093	14.440
0.140	22.930
0.209	41.753
0.280	49.137
0.329	46.557
0.426	32.910
0.447	54.683
0.471	58.005
0.685	70.196
0.899	80.172
1.234	78.716
1.260	65.803
1.304	99.016
1.519	99.767
1.593	85.012
1.734	103.470
1.806	100.523
1.900	114.182
1.901	111.599
1.927	94.626
1.998	97.952
2.090	127.478
2.117	99.804
2.161	135.600
2.163	117.888
2.188	110.878
2.190	93.535
2.234	128.593
2.234	124.534
2.234	122.689
2.235	120.475
2.354	127.125
2.380	103.141
2.475	108.313
2.690	116.444
2.762	114.604
2.835	104.645
2.904	126.052
2.906	109.447
2.952	128.638
2.954	113.509
3.168	121.271
3.239	126.441
3.241	109.467
3.311	123.863
3.312	121.280
3.334	132.351
3.433	110.955
3.526	132.363
3.647	123.145
3.647	120.562
3.861	134.967
4.243	140.525
4.268	128.719
4.269	123.922
4.292	127.982
4.294	117.281
4.508	125.043
5.011	119.908
5.034	129.873
5.250	123.613
5.419	113.660
5.443	115.507
5.538	121.048
5.586	115.515
5.611	110.351
5.632	132.492
5.967	131.037
5.968	129.192
5.993	112.957
5.994	106.684
6.014	140.265
6.017	117.756
6.019	97.830
6.040	123.292
6.111	128.094
6.207	125.148
6.615	122.590
6.735	118.907
6.735	115.586
6.829	132.197
6.974	121.505
6.974	118.922
6.975	115.970
7.023	107.117
7.043	139.590
7.069	129.260
8.023	158.839
8.027	120.832
8.028	117.511
8.029	108.655
9.008	124.213
9.008	121.261
9.009	114.619
9.965	128.700
9.990	121.690
11.019	120.647
11.042	128.766
12.001	116.279
12.002	107.423
12.960	102.685];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.0);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'East2014';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
0.020	25.473
0.045	15.162
0.116	25.481
0.232	50.905
0.233	43.170
0.398	66.756
0.444	75.968
0.469	68.235
0.635	77.089
0.661	62.726
0.852	66.793
0.995	65.700
1.204	115.441
1.205	112.494
1.205	110.284
1.207	91.500
1.208	89.658
1.228	120.599
1.230	99.237
1.231	94.817
1.323	120.607
1.683	108.850
1.824	131.698
1.872	127.282
1.874	114.022
1.896	131.335
2.012	160.074
2.088	121.038
2.157	141.670
2.230	137.624
2.231	128.785
2.252	151.622
2.275	156.412
2.350	133.951
2.372	149.422
2.563	145.755
2.564	142.071
2.564	137.283
2.614	122.186
2.778	147.982
2.995	132.899
3.135	162.744
3.231	159.806
3.231	158.332
3.325	170.126
3.520	141.413
3.637	162.049
3.805	159.484
3.826	178.639
4.232	181.987
4.474	163.959
4.834	145.941
5.166	171.750
5.166	166.962
5.236	186.489
5.237	178.386
5.427	186.505
5.716	170.322
5.786	186.534
5.980	162.241
6.195	161.522
7.006	178.899
7.009	154.590
7.009	150.170
7.031	163.432
7.513	136.215
7.991	135.517
8.011	164.248
8.032	192.979
8.034	170.880
8.037	150.991
8.037	148.413
9.020	126.394
9.065	152.917
9.995	166.989
10.974	174.804
10.999	165.966
11.045	181.071
11.048	156.026
12.028	160.526
13.055	167.240
13.058	139.615
13.990	144.480
14.012	162.530
14.013	151.848
14.990	172.554
15.039	166.665
15.040	161.877
18.028	155.124];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.0);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'East2014';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Slow foetal development is assumed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'XPLQ'; % Cat of Life
metaData.links.id_ITIS = '625079'; % ITIS
metaData.links.id_EoL = '308531'; % Ency of Life
metaData.links.id_Wiki = 'Connochaetes_taurinus'; % Wikipedia
metaData.links.id_ADW = 'Connochaetes_taurinus'; % ADW
metaData.links.id_Taxo = '68364'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200510'; % MSW3
metaData.links.id_AnAge = 'Connochaetes_taurinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Connochaetes_taurinus}}';
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
bibkey = 'East2014'; type = 'book'; bib = [ ... 
'author = {R. Estes}, ' ... 
'year = {2014}, ' ...
'title = {The Gnu''s World: Serengeti Wildebeest Ecology and Life History}, ' ...
'publisher = {University of California Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Connochaetes_taurinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


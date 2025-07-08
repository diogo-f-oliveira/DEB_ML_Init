function [data, auxData, metaData, txtData, weights] = mydata_Delphinus_delphis

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Delphinus_delphis'; 
metaData.species_en = 'Short-beaked common dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2009 07 12];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2015 03 08];                  
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 01 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2017 11 11];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 


%% set data
% zero-variate data
data.tg = 336;       units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'Wiki';    
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 5.5 * 30.5;units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';    
  temp.tx = C2K(37); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 8 * 365; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 28 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'MurpColl2005';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 90;        units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'Wiki';
data.Lp = 180;       units.Lp = 'cm'; label.Lp = 'total length at puberty';     bibkey.Lp = 'Wiki';
data.Li = 210;       units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'Wiki';
data.Wwb = 7500;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
data.Wwi = 136000;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Wiki';

data.Ri = 0.0027;    units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), length (cm)
0.075	101.272
0.034	110.352
0.031	121.311
0.005	108.787
0.003	103.777
0.045	112.544
0.046	117.241
0.082	106.282
0.083	111.292
0.088	130.705
0.164	119.746
0.169	141.350
0.201	113.483
0.202	115.988
0.202	118.180
0.204	125.068
0.204	125.695
0.205	127.887
0.206	133.836
0.242	121.311
0.243	122.877
0.316	105.342
0.362	130.078
0.438	125.068
0.479	131.331
0.520	138.845
0.717	145.108
0.758	153.562
0.792	134.149
0.835	148.865
0.988	135.401
0.991	148.865
0.992	152.935
1.029	145.734
1.072	162.329
1.145	138.845
1.152	166.399
1.188	153.875
1.190	163.894
1.226	151.370
1.307	161.389
1.427	174.540
1.464	167.652
1.540	159.198
1.577	150.744
1.580	160.763
1.618	156.380
1.777	168.904
1.931	160.137
1.934	170.157
1.934	171.409
2.165	157.632
2.167	166.086
2.207	170.783
2.322	160.450
2.398	150.117
2.404	176.419
2.478	159.198
2.516	156.380
2.517	160.137
2.560	174.853
2.986	161.703
3.027	168.904
3.031	185.812
3.035	202.720
3.065	164.207
3.183	168.278
3.187	183.933
3.808	168.278
3.809	170.157
3.963	161.076
4.241	181.742
4.435	176.419
4.517	189.569
4.980	165.460
4.983	180.176
4.984	182.994
4.984	185.499
4.985	189.256
5.022	177.984
5.058	168.904
5.065	193.953
5.220	188.630
5.532	188.943
5.533	192.074
5.997	173.914
6.000	186.438
6.979	195.205
6.979	197.397
6.980	198.963
6.981	203.659
6.984	215.245
7.951	178.297
7.953	183.620
8.034	194.892
8.034	197.710
9.009	189.883
9.016	220.254
9.049	194.579
9.907	190.196
9.956	227.456
10.494	192.701
11.000	184.247
11.001	189.569
11.005	203.973
11.046	212.427
11.472	200.528
11.477	219.002
11.549	195.519
12.057	193.953
12.058	200.215
12.059	203.033
12.060	208.669
12.101	215.245
12.337	220.254
12.409	197.397
12.952	181.115
12.994	191.135
13.039	215.245
13.040	222.446
13.975	210.861
14.054	216.497
14.481	202.407
14.483	210.548
14.990	210.235
15.031	217.750
15.068	206.791
15.933	232.466
16.988	231.840
17.884	221.820
18.934	203.973
19.014	210.235
19.564	222.759
20.068	208.356
20.148	214.305
20.967	209.922
21.003	196.458
21.004	199.902
22.021	208.356
25.968	216.184
26.948	227.769
28.037	208.043];
units.tL  = {'yr', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MurpColl2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.tp = 0 * weights.tp;
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;
%data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '34JWM'; % Cat of Life
metaData.links.id_ITIS = '180438'; % ITIS
metaData.links.id_EoL = '46559240'; % Ency of Life
metaData.links.id_Wiki = 'Delphinus_delphis'; % Wikipedia
metaData.links.id_ADW = 'Delphinus_delphis'; % ADW
metaData.links.id_Taxo = '68711'; % Taxonomicon
metaData.links.id_WoRMS = '137094'; % WoRMS
metaData.links.id_MSW3 = '14300045'; % MSW3
metaData.links.id_AnAge = 'Delphinus_delphis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Delphinus_delphis}}'; 
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
bibkey = 'MurpColl2005'; type = 'Article'; bib = [ ... 
'author = {Murphy, S. and Collet, A. and Rogan, E.}, ' ... 
'year = {2005}, ' ...
'title = {MATING STRATEGY IN THE MALE COMMON DOLPHIN (\emph{Delphinus delphis}): WHAT GONADAL ANALYSIS TELLS US}, ' ...
'journal = {J. Mammal}, ' ...
'volume = {86}, ' ...
'pages = {1247-1258}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


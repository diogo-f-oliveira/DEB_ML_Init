  function [data, auxData, metaData, txtData, weights] = mydata_Notechis_scutatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Notechis_scutatus'; 
metaData.species_en = 'Tiger snake'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf', 'biTh', 'biTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data
data.am = 14.1*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 17;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Fear1995';
data.Lp = 65;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = 'Shin1978'; 
data.Li = 100;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1978';
data.Lim = 120;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1978';

data.Wwb = 4.5;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'Fear1995';
data.Wwi = 1400;     units.Wwi = 'g';     label.Wwi = 'ultimate weight for females';  bibkey.Wwi = 'Fear1995';
data.Wwim = 2200;     units.Wwim = 'g';     label.Wwim = 'ultimate weight for males';  bibkey.Wwim = 'Fear1995';

data.Ri = 30/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20-30 young per clutch in captivity, 1 clutch every 1 yr';
   
% univariate data
% time - length
data.tL_f = [ ... % time since 1 Sept (d), snout-vent length (cm)
192.147	19.939
221.329	18.985
227.746	18.176
238.831	16.952
239.429	20.025
243.517	20.384
245.253	17.296
255.828	31.076
365+4.228	28.816
365+8.857	20.325
365+8.874	23.787
365+10.082	32.240
365+10.097	35.317
365+11.859	37.614
365+17.620	21.808
365+17.635	24.885
365+22.900	27.160
365+42.755	28.958
365+43.911	26.643
365+45.706	35.477
365+47.494	43.158
365+49.762	29.298
365+60.248	25.001
365+60.847	28.074
365+61.977	20.375
365+63.196	31.136
365+64.933	28.048
365+73.080	22.997
365+73.105	27.997
365+111.119	42.757
365+113.418	35.435
365+126.890	44.966
365+126.907	48.427
365+127.450	39.962
365+128.599	36.109
365+133.272	36.848
365+133.871	39.921
365+142.078	47.177
365+149.077	45.979
365+150.840	48.276
365+156.087	47.089
365+161.339	46.671
365+187.644	54.198
365+214.470	49.029
365+220.332	53.992
365+233.177	54.680
365+240.167	51.559
365+241.287	41.937
365+241.325	49.629
730+8.556	78.404
730+20.097	51.023
730+21.857	52.935
730+22.548	74.854
730+24.230	60.613
730+28.276	52.510
730+28.308	59.049
730+30.684	67.495
730+31.902	77.872
730+33.158	95.941
730+44.089	63.180
730+44.192	84.333
730+45.341	80.480
730+45.870	69.323
730+49.485	92.377
730+52.879	70.048
730+52.899	74.278
730+52.961	86.970
730+54.121	85.424
730+58.184	80.783
730+58.205	85.014
730+58.729	72.703
730+59.378	86.160
730+69.733	54.941
730+72.195	81.080
730+79.110	62.574
730+83.828	72.545
730+86.085	56.377
730+86.642	50.989
730+87.965	82.903
730+89.725	84.815
730+96.670	72.464
730+97.303	82.460
730+100.157	69.365
730+104.184	57.032
730+104.837	71.258
730+106.118	94.712
730+108.926	72.002
730+112.386	63.134
730+113.052	80.053
730+114.748	68.888
730+115.955	76.958
730+117.160	84.642
730+123.562	80.756
730+127.177	103.810
730+132.847	69.543
730+132.933	87.235
730+133.367	56.463
730+135.231	79.528
730+135.794	75.294
730+148.110	87.139
730+150.303	57.895
730+150.948	70.583
730+160.263	65.524
730+161.504	80.516
730+164.924	63.572
730+175.537	85.428
730+175.554	88.889
730+180.820	91.549
730+222.779	77.053
730+225.665	70.497
730+239.154	83.488
730+255.467	76.847];
data.tL_f(:,1) = data.tL_f(:,1) - 192; % set origin at birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'snout-vent length', 'female'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shin1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since 1 Sept (d), snout-vent length (cm)
730+2.675	69.595
730+7.330	66.489
730+7.345	69.565
730+7.358	72.258
730+8.484	63.789
730+9.154	81.477
730+24.247	64.074
730+27.236	78.671
730+30.765	84.033
730+36.557	74.766
730+36.591	81.689
730+51.221	89.289
730+51.255	96.212
730+54.121	85.424
730+82.708	82.167
730+82.730	86.782
730+84.438	77.925
730+97.316	85.152
730+103.140	82.423
730+104.872	78.566
730+106.075	85.866
730+108.419	87.774
730+108.442	92.390
730+108.984	83.925
730+109.639	98.536
730+110.702	76.991
730+116.086	103.880
730+117.669	69.254
730+127.063	80.349
730+127.613	73.422
730+133.543	92.616
730+134.032	72.997
730+144.015	85.242
730+145.205	89.850
730+146.316	78.305
730+146.836	65.224
730+152.134	74.422
730+152.174	82.498
730+160.398	93.216
730+164.998	78.956
730+165.603	83.183
730+172.658	93.523
730+183.864	117.299
730+184.304	87.680
730+209.321	70.600
730+210.515	75.977
730+223.925	72.815
730+223.961	80.123
730+223.987	85.507
730+239.764	88.869
730+253.790	92.242
730+256.660	82.224];
data.tL_m(:,1) = data.tL_m(:,1) - 192; % set origin at birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'snout-vent length', 'male'};  
temp.tL_m   = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shin1978';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74B7F'; % Cat of Life
metaData.links.id_ITIS = '700644'; % ITIS
metaData.links.id_EoL = '47364845'; % Ency of Life
metaData.links.id_Wiki = 'Notechis_scutatus'; % Wikipedia
metaData.links.id_ADW = 'Notechis_scutatus'; % ADW
metaData.links.id_Taxo = '50248'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Notechis&species=scutatus'; % ReptileDB
metaData.links.id_AnAge = 'Notechis_scutatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notechis_scutatus}}';
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
bibkey = 'Shin1978'; type = 'Article'; bib = [ ...  
'author = {Richard Shine}, ' ...
'year = {1978}, ' ...
'title = {Growth Rates and Sexual Maturation in Six Species of {A}ustralian {E}lapid Snakes}, ' ... 
'journal = {Herpetologica}, ' ...
'volume = {34(1)}, '...
'pages = {73-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Fear1995'; type = 'Article'; bib = [ ...  
'author = {Somin Fearn}, ' ...
'year = {1995}, ' ...
'title = {Tiger snakes in {T}asmania}, ' ... 
'journal = {Litteratura Serpentium}, ' ...
'volume = {15(4)}, '...
'pages = {118-122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Notechis_scutatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



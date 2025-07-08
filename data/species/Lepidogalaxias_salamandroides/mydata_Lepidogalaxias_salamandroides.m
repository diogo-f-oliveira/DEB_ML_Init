function [data, auxData, metaData, txtData, weights] = mydata_Lepidogalaxias_salamandroides
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lepidogalaxiiformes'; 
metaData.family     = 'Lepidogalaxiidae';
metaData.species    = 'Lepidogalaxias_salamandroides'; 
metaData.species_en = 'Salamanderfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 23]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';    label.am = 'life span';                           bibkey.am = 'fishbase';  
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.32;    units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'MorgGill2000';
data.Lpm = 3.86;   units.Lpm = 'cm';  label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'MorgGill2000';
data.Li = 7.2;     units.Li = 'cm';   label.Li = 'ultimate total length for females';   bibkey.Li = 'MorgGill2000';
data.Lim = 5.0;    units.Lim = 'cm';  label.Lim = 'ultimate total length for males';    bibkey.Lim = 'MorgGill2000';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'MorgGill2000';
  comment.Wwb = 'based on egg diameter of 1.8 mm: 4/3*pi*0.09^3';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ Length (cm) 
0.009	0.588
0.028	0.826
0.028	0.913
0.038	1.108
0.085	3.255
0.095	2.886
0.095	3.472
0.104	2.518
0.123	1.195
0.123	1.282
0.123	1.369
0.133	1.282
0.142	1.195
0.142	1.477
0.142	1.716
0.142	1.824
0.152	0.675
0.152	1.044
0.152	1.130
0.152	1.282
0.152	1.889
0.152	2.410
0.152	2.778
0.152	2.995
0.152	3.103
0.152	3.233
0.152	3.233
0.152	3.385
0.161	2.128
0.161	2.323
0.161	2.518
0.161	2.583
0.170	1.196
0.170	1.499
0.170	1.889
0.170	2.236
0.170	2.670
0.180	1.174
0.180	2.410
0.189	1.499
0.189	1.846
0.189	2.020
0.189	2.778
0.189	3.017
0.218	2.497
0.218	2.605
0.227	2.106
0.237	1.846
0.237	1.825
0.246	1.608
0.246	2.258
0.265	2.193
0.265	2.345
0.265	2.410
0.265	2.800
0.275	2.519
0.275	3.126
0.275	3.342
0.284	2.584
0.284	2.714
0.294	2.107
0.294	2.931
0.294	2.996
0.303	3.451
0.313	3.863
0.341	2.410
0.341	2.801
0.341	2.931
0.350	3.018
0.350	3.343
0.350	3.494
0.350	3.603
0.350	3.993
0.350	4.448
0.360	3.083
0.360	3.841
0.369	2.497
0.379	2.107
0.379	1.847
0.445	2.606
0.455	2.671
0.455	3.105
0.455	3.235
0.455	3.278
0.455	3.387
0.455	3.820
0.464	2.801
0.464	3.018
0.511	4.709
0.521	4.406
0.530	3.625
0.530	3.755
0.530	3.907
0.530	3.994
0.530	4.146
0.530	4.232
0.578	3.365
0.634	3.279
0.634	3.344
0.634	3.539
0.634	3.604
0.644	2.780
0.644	3.127
0.644	3.691
0.644	4.016
0.653	2.542
0.653	2.585
0.691	1.892
0.691	1.978
0.701	2.867
0.701	2.976
0.701	3.084
0.701	3.236
0.701	3.279
0.701	3.366
0.701	3.453
0.710	2.217
0.710	2.325
0.710	2.412
0.710	2.585
0.720	2.065
0.720	2.737
0.758	4.515
0.758	4.602
0.758	4.710
0.777	3.323
0.795	2.911
0.795	3.019
0.795	3.106
0.795	3.496
0.795	3.583
0.795	4.212
0.814	3.453
0.824	2.803
0.824	3.236
0.824	3.323
0.833	4.082
0.852	3.193
0.852	3.453
0.852	3.930
0.852	4.234
0.852	4.321
0.852	4.451
0.862	3.627
0.862	3.714
0.862	3.800
0.862	3.974
0.871	2.695
0.871	3.107
0.871	3.215
0.871	3.323
0.871	3.453
0.871	4.082
0.871	4.559
0.881	2.500
0.881	3.020
0.909	3.714
0.909	3.800
0.909	4.451
0.919	4.603
0.919	4.798
0.928	2.868
0.947	4.061
1.004	3.931
1.004	4.603
1.004	4.690
1.004	4.776
1.013	3.996
1.013	4.104
1.080	5.644
1.080	5.709
1.089	4.495
1.089	5.102
1.155	5.254
1.155	5.753
1.165	4.517
1.165	5.818
1.165	6.121
1.165	6.208
1.165	6.533
1.174	3.975
1.174	5.341
1.174	5.384
1.174	5.644
1.250	4.994
1.439	5.819
1.439	5.927
1.449	6.144
1.780	5.105
1.780	5.322
1.780	5.430
1.780	5.799
1.847	4.628
1.847	4.823
1.847	4.954
1.847	5.170
1.903	5.019
1.903	5.561
1.913	5.106
1.913	5.756
2.008	5.214
2.008	5.518
2.008	5.713
2.008	6.212
2.055	6.190
2.159	6.321
2.159	6.841
2.263	6.169
2.273	5.367
2.273	5.736
2.273	5.823
2.794	6.063
2.794	6.844
2.803	6.410
2.869	5.847
2.879	5.110
2.888	5.262
2.992	6.736
2.992	6.866
3.011	7.257
3.049	6.758
3.163	7.452
3.258	7.258
3.902	5.743
3.902	6.415
3.902	6.719
4.934	6.073
4.934	6.420
4.934	7.243];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MorgGill2000';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % age (years) ~ Length (cm) 
0.009	0.454
0.009	0.584
0.038	0.823
0.038	1.128
0.114	1.584
0.123	1.236
0.133	1.084
0.142	0.932
0.142	1.388
0.142	1.584
0.142	1.671
0.142	1.758
0.142	2.627
0.152	0.823
0.152	2.366
0.152	2.540
0.152	2.736
0.152	2.866
0.152	3.366
0.161	1.084
0.161	1.149
0.161	1.258
0.161	1.845
0.161	2.258
0.161	3.062
0.161	3.214
0.161	3.584
0.171	1.932
0.180	1.497
0.180	2.627
0.190	1.236
0.190	1.801
0.190	2.345
0.199	1.149
0.199	1.671
0.199	2.040
0.199	2.258
0.199	2.453
0.199	3.149
0.209	1.562
0.218	2.344
0.228	1.931
0.228	2.149
0.228	2.540
0.228	3.453
0.237	1.562
0.237	1.670
0.237	1.953
0.237	2.040
0.285	2.714
0.285	2.931
0.285	3.149
0.304	2.105
0.304	2.235
0.304	2.344
0.304	2.453
0.304	2.540
0.370	2.887
0.380	1.648
0.380	2.974
0.389	2.518
0.389	2.626
0.389	2.713
0.389	3.061
0.389	3.170
0.398	1.931
0.398	2.018
0.436	2.496
0.455	2.604
0.455	3.430
0.455	3.517
0.455	3.778
0.465	2.713
0.465	2.930
0.465	3.017
0.465	3.148
0.465	3.930
0.503	2.930
0.512	3.582
0.512	3.669
0.512	3.778
0.512	3.865
0.512	3.930
0.512	4.039
0.512	3.061
0.522	3.169
0.522	3.278
0.617	2.756
0.626	3.277
0.626	3.321
0.645	3.451
0.645	2.625
0.674	3.234
0.674	3.495
0.683	2.364
0.683	3.082
0.693	1.929
0.693	2.299
0.693	2.451
0.693	2.560
0.693	2.647
0.693	2.755
0.693	2.886
0.693	3.016
0.731	3.581
0.731	3.842
0.750	4.038
0.778	2.755
0.787	2.559
0.797	3.798
0.797	3.907
0.797	2.690
0.797	2.885
0.797	3.168
0.797	3.581
0.806	3.059
0.806	3.277
0.816	3.429
0.825	3.581
0.835	3.081
0.844	2.820
0.844	3.363
0.844	3.407
0.854	3.233
0.854	3.320
0.863	2.842
0.863	3.081
0.863	3.559
0.873	3.668
0.882	2.885
0.882	3.168
0.882	3.776
0.882	3.907
0.892	3.450
0.901	4.102
0.996	3.928
0.996	4.058
1.110	4.123
1.120	4.254
1.148	3.949
1.167	4.449
1.167	4.362
1.186	3.732
1.186	3.666
1.252	3.818
1.414	3.535
1.414	4.035
1.414	4.122
1.480	3.861
1.480	3.969
1.490	4.122
1.670	4.056
1.670	4.164
1.755	4.055
1.755	4.186
1.765	3.946
1.765	4.620
1.774	4.359
1.812	4.381
1.822	3.772
1.822	3.946
1.831	4.577
1.841	4.098
1.869	3.902
1.869	4.011
1.869	4.446
1.869	4.533
1.879	4.098
1.983	4.424
1.983	4.967
1.992	4.532
1.992	4.619
2.097	4.967
2.116	4.641
2.125	4.880
2.144	4.445
2.144	4.249
2.154	4.684
2.163	4.184
2.192	4.684
2.429	4.291
2.571	4.399
2.666	4.138
2.742	4.160
2.742	4.768
2.846	4.159
2.856	4.463
2.856	4.616
2.941	4.485
3.112	4.723
3.226	3.940
3.833	4.590
3.852	4.763
3.947	4.154];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MorgGill2000';
comment.tL_m = 'data for males';

% fecundity, length, weight
NLW = [ ... % fecindity (#), total length (cm), weight (g)
81.7 4.17 0.35
80.4 5.21 0.83
94.9 6.21 1.47
82.0 6.10 1.40
93.7 6.53 1.67
78.9 5.24 0.71
82.4 5.34 0.88];
data.LW = NLW(:,[2 3]); % total length (cm), wet weight (g)
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'MorgGill2000';
%
data.LN = NLW(:,[2 1]); % total length (cm), fecundity (#)
temp.LN = C2K(19);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
bibkey.LN = 'MorgGill2000';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Temperature 12 till 26.5 C, spring 18.7 C';
metaData.bibkey.F1 = 'MorgGill2000'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TBYJ'; % Cat of Life
metaData.links.id_ITIS = '162127'; % ITIS
metaData.links.id_EoL = '211145'; % Ency of Life
metaData.links.id_Wiki = 'Lepidogalaxias_salamandroides'; % Wikipedia
metaData.links.id_ADW = 'Lepidogalaxias_salamandroides'; % ADW
metaData.links.id_Taxo = '107055'; % Taxonomicon
metaData.links.id_WoRMS = '1013726'; % WoRMS
metaData.links.id_fishbase = 'Lepidogalaxias-salamandroides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidogalaxias_salamandroides}}';
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
bibkey = 'MorgGill2000'; type = 'article'; bib = [ ...
'author = {D. L. Morgan and H. S. Gill and I. C. Potter}, ' ... 
'year   = {2000}, ' ...
'title  = {Age composition, growth and reproductive biology of the salamanderfish \emph{Lepidogalaxias salamandroides}: a re-examination}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'page = {191-204}, ' ...
'volume = {57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4537}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


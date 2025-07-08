function [data, auxData, metaData, txtData, weights] = mydata_Aphanius_danfordii

global tT

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Aphanius_danfordii'; 
metaData.species_en = 'Kizilirmak toothcarp'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2020 10 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.tp = 1.2 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'YugoEkme2012';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5 * 365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'YugoEkme2012';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'YugoEkme2012'; 
  comment.Lp = 'based on tp 1 yr and tL data';
data.Li  = 7.00;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'YugoEkme2012';

data.Wwb = 1.4e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';   bibkey.Wwb = 'YugoEkme2012';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 0.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'YugoEkme2012';
  comment.Wwp = 'based on Lp and LWw data';
data.Wwi = 7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'YugoEkme2012';
  comment.Wwi=  'based on Li and LWw data';
  
data.Ri  = 698/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'YugoEkme2012';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... %  year class (yr), total length (cm)
    0 2.585
    1 3.340
    2 4.135
    3 4.875
    4 5.538
    5 6.191];
data.tL_f(:,1) = 365 * (0.6 + data.tL_f(:,1)); % covert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YugoEkme2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... %  year class (yr), total length (cm)
    0 2.55
    1 3.256
    2 3.762
    3 4.147
    4 4.501
    5 4.860];
data.tL_m(:,1) = 365 * (0.6 + data.tL_m(:,1)); % covert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YugoEkme2012';
comment.tL_m = 'Data for males';

% time - weight
data.tWw_f = [ ... %  year class (yr), wet weight (g)
    0 0.283
    1 0.661
    2 1.365
    3 2.365
    4 3.657
    5 5.517];
data.tWw_f(:,1) = 365 * (0.6 + data.tWw_f(:,1)); % covert yr to d
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(15);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'YugoEkme2012';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... %  year class (yr), wet weight (g)
    0 0.267
    1 0.538
    2 0.914
    3 1.324
    4 1.796
    5 2.340];
data.tWw_m(:,1) = 365 * (0.6 + data.tWw_m(:,1)); % covert yr to d
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(15);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'YugoEkme2012';
comment.tWw_m = 'Data for males';

% time - temp
tT = [ ... % time since 1 April (d), temp (C)
75.973	20.397
106.862	23.271
166.800	21.659
197.959	17.664
230.187	15.140
258.540	11.075
289.681	5.607
319.139	6.098
365  	6.799
365+46.425	12.196];
tT(:,1) = tT(:,1) - tT(1,1); % set origin at mean birth (1 June); spawning 1 may - 1 sept

% length - weight
data.LWw_f = [ ...
1.394	0.004
1.738	0.078
1.879	0.126
1.930	0.223
1.960	0.054
2.031	0.175
2.041	0.054
2.101	0.199
2.142	0.055
2.182	0.272
2.232	0.031
2.283	0.248
2.323	0.007
2.334	0.345
2.344	0.128
2.405	0.297
2.445	0.152
2.485	0.152
2.516	0.418
2.576	0.128
2.577	0.394
2.637	0.153
2.637	0.346
2.688	0.346
2.718	0.225
2.758	0.225
2.779	0.491
2.819	0.274
2.860	0.612
2.899	0.153
2.930	0.395
2.931	0.540
3.012	0.636
3.021	0.299
3.052	0.564
3.072	0.757
3.082	0.347
3.163	0.685
3.183	0.420
3.193	0.613
3.233	0.420
3.244	0.806
3.274	0.710
3.334	0.396
3.355	0.830
3.375	0.493
3.376	0.806
3.405	0.348
3.426	0.879
3.447	1.072
3.466	0.565
3.507	0.952
3.537	0.638
3.568	1.000
3.648	0.735
3.668	0.590
3.679	0.976
3.679	1.193
3.719	0.759
3.729	0.952
3.760	1.266
3.790	1.073
3.801	1.387
3.820	0.735
3.871	1.025
3.882	1.339
3.911	0.856
3.952	1.194
3.953	1.508
4.033	1.267
4.063	0.977
4.094	1.532
4.134	1.171
4.135	1.701
4.206	1.919
4.214	1.050
4.225	1.388
4.236	1.702
4.246	1.533
4.306	1.388
4.316	1.147
4.327	1.871
4.348	1.992
4.379	2.136
4.407	1.292
4.417	1.461
4.438	1.775
4.459	2.185
4.478	1.292
4.489	1.702
4.489	1.968
4.519	1.534
4.570	2.089
4.589	1.365
4.590	1.703
4.609	1.510
4.611	2.403
4.632	2.716
4.651	1.896
4.662	2.234
4.672	2.451
4.751	1.776
4.782	1.921
4.793	2.331
4.804	2.524
4.845	2.765
4.845	2.934
4.853	1.945
4.853	2.090
4.874	2.379
4.913	1.849
4.914	2.162
4.915	2.669
4.956	2.934
5.006	2.766
5.026	2.404
5.057	3.104
5.107	2.597
5.137	2.428
5.138	2.863
5.138	3.176
5.199	3.128
5.200	3.780
5.218	2.766
5.279	2.984
5.289	2.574
5.300	3.201
5.311	3.539
5.380	2.839
5.402	3.756
5.431	3.153
5.440	2.671
5.452	3.491
5.504	4.143
5.505	4.432
5.544	3.684
5.553	3.250
5.553	3.443
5.555	4.287
5.564	3.877
5.634	3.612
5.646	4.384
5.668	4.915
5.694	3.395
5.755	3.419
5.770	5.470
5.775	3.058
5.787	4.264
5.860	4.916
5.949	4.168
6.032	5.447
6.091	4.434
6.125	6.268
6.294	4.869
6.357	6.220
6.419	6.848
6.497	5.280
6.611	6.848
6.783	7.042
6.894	6.753];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length', 'wet weight', 'female'};  
bibkey.LWw_f  = 'YugoEkme2012';
%
data.LWw_m = [ ...
1.278	0.027
1.369	0.054
1.433	0.094
1.478	0.094
1.541	0.094
1.587	0.121
1.605	0.081
1.668	0.081
1.723	0.108
1.741	0.054
1.777	0.081
1.823	0.148
1.859	0.054
1.922	0.027
1.940	0.175
2.004	0.161
2.058	0.054
2.085	0.175
2.104	0.134
2.131	0.121
2.140	0.188
2.231	0.134
2.231	0.242
2.330	0.242
2.358	0.161
2.412	0.282
2.484	0.269
2.484	0.161
2.530	0.309
2.548	0.188
2.575	0.309
2.630	0.228
2.657	0.390
2.702	0.296
2.702	0.403
2.775	0.403
2.802	0.309
2.856	0.470
2.902	0.363
2.983	0.403
2.992	0.538
3.028	0.390
3.038	0.605
3.101	0.511
3.110	0.349
3.137	0.685
3.146	0.578
3.183	0.417
3.192	0.685
3.246	0.820
3.255	0.645
3.264	0.511
3.328	0.578
3.355	0.739
3.400	0.833
3.400	0.551
3.409	0.874
3.427	0.739
3.446	0.605
3.509	0.874
3.518	0.645
3.527	1.075
3.573	0.780
3.582	0.941
3.582	0.712
3.618	0.995
3.645	0.739
3.672	0.968
3.709	0.860
3.709	0.753
3.745	1.075
3.763	0.753
3.772	0.860
3.826	1.008
3.835	1.223
3.854	1.062
3.899	0.927
3.908	1.317
3.926	1.237
3.944	1.035
3.953	1.169
3.972	1.358
3.990	0.995
4.026	1.089
4.044	1.237
4.053	1.478
4.053	1.331
4.117	1.640
4.126	1.250
4.126	1.425
4.126	1.102
4.135	1.478
4.198	1.774
4.198	1.532
4.198	1.223
4.207	1.667
4.225	1.720
4.225	1.102
4.244	1.183
4.253	1.371
4.262	1.452
4.289	1.290
4.298	1.720
4.298	1.613
4.307	1.815
4.334	1.841
4.361	1.505
4.370	1.398
4.389	1.720
4.434	1.882
4.443	1.492
4.443	1.452
4.479	1.640
4.479	1.546
4.497	1.882
4.497	1.747
4.534	1.976
4.570	2.245
4.570	1.707
4.606	1.868
4.606	1.331
4.633	2.016
4.661	1.546
4.670	2.124
4.679	2.218
4.688	2.056
4.688	1.613
4.733	2.164
4.733	1.935
4.751	2.487
4.751	1.761
4.760	1.828
4.788	2.204
4.797	2.540
4.806	2.137
4.824	2.030
4.851	2.406
4.878	2.500
4.878	2.849
4.915	2.231
4.924	2.675
4.933	2.782
4.960	2.245
4.960	1.788
4.969	2.513
4.996	2.406
4.996	2.634
4.996	2.742
5.060	1.788
5.114	2.298
5.150	3.159
5.177	3.011
5.196	2.796
5.250	3.051
5.313	2.634
5.313	2.876
5.359	3.159
5.468	3.481
5.495	3.804
5.513	3.051
5.531	4.046
5.567	3.266
5.731	4.005
5.948	4.395
5.975	4.583];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length', 'wet weight', 'male'};  
bibkey.LWw_m  = 'YugoEkme2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LWw_f', 'LWw_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males as supposed to differ from females by {p_Am} only';
D2 = 'The std model cannot capture very fast initial growth combined with slow growth later assuming constant food; the aging is possibly problematic';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00955 * (TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FB56'; % Cat of Life
metaData.links.id_ITIS = '647064'; % ITIS
metaData.links.id_EoL = '1156901'; % Ency of Life
metaData.links.id_Wiki = 'Aphanius_danfordii'; % Wikipedia
metaData.links.id_ADW = 'Aphanius_danfordii'; % ADW
metaData.links.id_Taxo = '161093'; % Taxonomicon
metaData.links.id_WoRMS = '862537'; % WoRMS
metaData.links.id_fishbase = 'Aphanius-danfordii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanius_danfordii}}';
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
bibkey = 'YugoEkme2012'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12036}, ' ...
'author = {B. Yo\v{g}urt\c{c}uo\v{g}lu and F. G. Ekmek\c{c}i}, ' ... 
'year = {2012}, ' ...
'title = {Life-history traits of \emph{Aphanius danfordii} ({B}oulenger, 1890) ({P}isces: {C}yprinodontidae), endemic to K{\i}z{\i}l{\i}rmak {B}asin ({T}urkey)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {35}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aphanius-danfordii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


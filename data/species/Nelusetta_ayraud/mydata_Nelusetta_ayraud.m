function [data, auxData, metaData, txtData, weights] = mydata_Nelusetta_ayraud

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Monacanthidae';
metaData.species    = 'Nelusetta_ayraud'; 
metaData.species_en = 'Chinaman-leatherjacket'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 26];

%% set data
% zero-variate data

data.am = 9 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MillStew2010';   
  temp.am = C2K(17.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 37;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.7e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.57 mm of Stephanolepis_hispidus: pi/6*0.057^3';
data.Wwp = 311.5;  units.Wwp = 'g';   label.Wwp = 'wet weight at birth';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^2.84, see F1';
data.Wwi = 5246;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^2.84, see F1; max published weight 3.5 kg';

data.Ri = 2e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.365	10.899
0.365	12.849
0.365	13.434
0.365	13.824
0.374	12.069
0.374	14.994
0.384	9.533
0.393	7.973
0.393	11.093
0.402	14.212
0.440	7.775
0.449	17.719
0.449	16.354
0.449	10.895
0.449	8.750
0.459	13.429
0.487	15.377
0.524	17.325
0.524	18.690
0.533	13.620
0.533	15.960
0.543	14.984
0.599	14.396
0.608	19.270
0.608	16.345
0.618	17.515
0.674	16.342
0.683	17.121
0.693	18.486
1.067	37.183
1.086	39.522
1.198	36.396
1.245	25.669
1.245	29.959
1.254	47.507
1.254	24.889
1.254	28.399
1.254	32.103
1.263	31.323
1.291	22.352
1.310	22.351
1.310	27.421
1.329	30.149
1.348	28.588
1.394	29.756
1.394	29.366
1.404	26.635
1.422	27.804
1.422	23.320
1.432	31.509
1.432	25.074
1.488	26.826
1.507	24.095
1.507	25.655
1.507	28.190
1.507	28.970
1.507	31.114
1.572	35.595
1.572	32.281
1.572	23.311
1.582	31.500
1.582	30.135
1.582	29.160
1.582	28.185
1.591	27.600
1.600	38.714
1.600	33.839
1.656	34.616
1.656	34.226
1.666	31.690
1.675	30.910
1.684	38.709
1.684	32.664
1.731	34.807
1.741	31.881
1.741	32.466
1.759	31.100
1.759	36.170
1.825	39.286
1.825	38.311
1.834	35.386
1.834	32.071
1.844	33.435
1.853	36.360
1.900	36.942
1.918	25.632
1.918	26.997
1.928	29.141
1.937	25.241
1.937	27.971
1.937	30.115
1.937	31.285
1.937	35.185
1.937	38.110
1.947	33.235
1.984	27.578
1.993	28.357
1.993	25.823
1.993	24.848
1.993	24.263
2.003	37.521
2.003	32.452
2.003	31.282
2.021	34.595
2.021	33.621
2.031	36.155
2.040	43.174
2.068	44.732
2.078	41.417
2.078	38.882
2.078	37.517
2.078	34.592
2.087	35.372
2.096	36.541
2.134	37.124
2.134	37.904
2.162	35.758
2.162	40.242
2.162	41.997
2.162	42.777
2.162	43.947
2.171	33.222
2.171	39.267
2.227	45.308
2.246	39.458
2.246	36.923
2.255	40.822
2.265	38.287
2.274	35.166
2.302	46.084
2.311	34.969
2.311	38.479
2.321	33.994
2.321	39.843
2.321	42.573
2.330	36.528
2.330	37.308
2.330	41.208
2.340	33.018
2.340	49.202
2.396	41.399
2.396	40.619
2.396	37.304
2.405	42.568
2.405	38.864
2.414	29.894
2.443	27.552
2.480	41.979
2.499	34.374
2.499	35.349
2.499	41.003
2.499	44.708
2.508	36.908
2.517	28.133
2.517	39.832
2.536	38.661
2.564	45.874
2.564	44.120
2.564	33.200
2.574	47.044
2.574	39.049
2.574	37.294
2.574	37.099
2.574	34.760
2.583	41.584
2.583	40.414
2.583	29.300
2.648	30.271
2.648	44.505
2.658	32.220
2.658	33.585
2.658	35.145
2.658	36.900
2.658	38.850
2.667	37.874
2.667	40.019
2.667	41.579
2.733	44.305
2.733	36.896
2.742	41.770
2.742	38.455
2.742	37.675
2.751	40.794
2.751	39.624
2.751	35.725
2.761	34.164
2.807	38.256
2.817	39.231
2.826	35.721
2.826	36.695
2.826	41.570
2.836	40.400
2.901	37.861
2.901	36.691
2.901	33.961
2.901	32.597
2.910	40.980
2.910	39.421
2.910	34.741
2.920	45.855
2.920	35.520
2.985	41.366
2.985	38.441
2.995	39.806
2.995	37.076
2.995	35.516
2.995	34.736
3.013	37.660
3.070	50.526
3.070	44.871
3.079	41.751
3.079	40.386
3.088	47.990
3.088	47.015
3.088	38.631
3.098	43.115
3.135	43.893
3.144	51.692
3.154	46.232
3.154	40.577
3.163	54.225
3.163	53.445
3.182	45.060
3.201	41.939
3.238	37.647
3.238	36.867
3.247	51.101
3.247	43.691
3.247	42.522
3.247	41.547
3.247	40.377
3.332	37.447
3.332	39.007
3.341	50.121
3.350	45.636
3.406	39.393
3.406	36.078
3.425	43.682
3.425	45.631
3.425	46.801
3.425	47.581
3.434	43.096
3.491	52.842
3.491	44.458
3.491	40.753
3.500	38.998
3.509	41.922
3.575	37.629
3.575	38.214
3.575	39.189
3.575	43.283
3.584	40.553
3.594	45.232
3.659	41.329
3.659	39.574
3.659	36.259
3.659	35.284
3.668	38.598
3.668	37.428
3.678	48.347
3.715	44.055
3.734	45.224
3.743	52.048
3.743	39.374
3.743	41.129
3.753	42.298
3.818	59.844
3.818	48.144
3.828	45.219
3.828	38.005
3.828	40.734
3.837	39.759
3.893	45.020
3.912	43.070
3.930	39.559
3.996	43.650
4.005	41.114
4.146	56.511
4.146	58.850
4.155	50.660
4.164	52.610
4.164	53.780
4.164	54.950
4.183	45.394
4.324	58.255
4.324	47.921
4.342	44.215
4.408	38.752
4.408	50.451
4.417	49.476
4.426	45.186
4.426	46.551
4.501	42.842
4.670	50.242
4.735	47.508
4.754	50.822
4.829	53.353
4.838	51.597
4.904	46.329
4.997	43.204
5.007	50.028
5.147	57.820
5.147	59.185
5.147	60.159
5.166	65.423
5.175	55.673
5.821	65.972
6.148	57.374
6.158	64.003];
data.tL(:,1) = 365 * (data.tL(:,1) + 0); % convert mnth to d
units.tL   = {'d', 'cm', 'g'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MillStew2010'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^2.84';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'adults feed mainly on salps';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '465R9'; % Cat of Life
metaData.links.id_ITIS = '646216'; % ITIS
metaData.links.id_EoL = '46570874'; % Ency of Life
metaData.links.id_Wiki = 'Nelusetta_ayraud'; % Wikipedia
metaData.links.id_ADW = 'Nelusetta_ayraud'; % ADW
metaData.links.id_Taxo = '691382'; % Taxonomicon
metaData.links.id_WoRMS = '281648'; % WoRMS
metaData.links.id_fishbase = 'Nelusetta-ayraud'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nelusetta_ayraud}}';
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
bibkey = 'MillStew2010'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-010-9639-4}, ' ...
'author = {Miller, M.E. and J. Stewart and R.J. West}, ' ... 
'year = {2010}, ' ...
'title = {Using otoliths to estimate age and growth of a large {A}ustralian endemic monocanthid, \emph{Nelusetta ayraudi} ({Q}uoy and {G}aimard, 1824)}, ' ...
'journal = {Environ. Biol. Fishes}, ' ...
'volume = {88}, ' ...
'pages = {263-271}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttp://www.fishbase.se/summary/Nelusetta-ayraud.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

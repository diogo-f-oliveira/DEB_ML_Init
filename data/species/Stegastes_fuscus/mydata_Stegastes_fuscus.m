function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_fuscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_fuscus'; 
metaData.species_en = 'Brazilian damsel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'SchwFerr2002';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 12.6;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 5.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^3.03, see F1';
data.Wwi = 32;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^3.03, see F1';

data.Ri  = 125; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.015	2.702
0.015	2.198
0.018	1.809
0.018	2.588
0.018	1.649
0.018	1.557
0.018	2.840
0.018	2.428
0.018	1.947
0.035	2.107
0.969	3.965
1.004	4.881
1.868	4.036
1.903	7.265
1.903	5.456
1.903	5.227
1.903	4.173
1.921	5.731
1.921	4.265
1.938	4.998
2.890	3.695
2.907	3.558
2.907	3.924
2.925	5.436
2.925	6.008
2.943	4.772
2.943	4.886
2.943	5.528
2.943	5.802
2.943	6.512
2.943	6.810
2.960	4.680
2.960	4.978
2.960	5.299
2.960	5.665
2.978	5.115
2.996	4.474
3.912	6.195
3.912	4.706
3.930	6.767
3.930	6.057
3.930	5.920
3.930	5.851
3.930	5.668
3.930	5.553
3.930	5.530
3.930	5.347
3.947	5.118
3.947	5.050
3.965	6.676
3.965	4.798
3.965	4.569
3.982	7.592
3.982	7.431
3.982	7.340
3.982	7.202
3.982	7.134
3.982	6.905
3.982	5.302
4.018	6.355
4.828	5.373
4.863	6.312
4.881	7.205
4.899	6.381
4.899	6.747
4.899	6.930
4.899	6.999
4.899	7.846
4.899	8.442
4.916	4.526
4.916	5.487
4.916	8.098
4.916	9.243
4.916	9.747
4.934	6.129
4.934	6.610
4.934	8.029
4.934	8.304
4.934	8.808
4.934	9.083
4.934	10.022
4.952	7.480
4.952	7.663
4.969	5.098
4.969	8.236
4.969	8.579
4.987	8.946
4.987	9.564
5.903	7.025
5.921	9.704
5.921	9.040
5.921	8.948
5.921	8.605
5.921	8.445
5.921	8.032
5.938	9.498
5.938	9.223
5.938	8.811
5.938	8.170
5.938	6.750
5.938	6.544
5.956	8.284
5.956	7.918
5.956	7.849
5.956	7.735
5.956	7.529
5.956	7.185
5.956	6.842
5.956	6.384
5.974	9.933
5.974	6.178
5.974	5.994
6.907	9.936
6.925	7.050
6.943	7.509
6.943	7.989
6.943	8.699
6.943	8.814
6.943	9.318
6.943	9.638
6.943	10.119
6.943	10.280
6.960	8.264
6.960	8.287
6.978	9.478
6.996	7.806
6.996	8.471
6.996	8.539
6.996	8.997
6.996	9.089
6.996	9.135
7.947	9.366
7.947	9.046
7.947	8.473
7.965	8.771
7.982	9.595
7.982	9.229
7.982	8.244
7.982	7.924
7.982	7.443
8.000	9.160
8.018	10.237
8.035	10.374
8.934	9.507
8.952	8.934
8.952	9.026
8.952	9.140
8.952	9.988
8.969	9.667
8.987	10.194
9.956	9.739
9.956	8.571
9.974	8.548
9.974	8.433
9.991	9.052
10.009	9.991
10.009	9.899
10.009	8.754
10.996	10.520
10.996	10.497
11.013	10.337
11.930	10.065
11.965	8.439
11.965	9.195
11.982	10.225
12.952	10.434
12.952	10.205
12.969	9.083
14.960	10.119
14.960	10.554
14.996	10.348];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'Galapagos'};  
bibkey.tL = 'SchwFerr2002';

% length-weight
data.LW_f = [ ...
2.878	0.370
3.513	1.667
3.725	0.926
4.000	1.481
4.169	1.296
4.508	1.852
4.656	2.407
4.720	2.407
4.804	2.407
4.931	2.222
5.016	2.222
5.122	3.148
5.249	3.333
5.333	3.519
5.418	5.556
5.481	3.889
5.651	3.519
5.714	3.704
5.757	3.148
5.778	5.185
5.905	4.259
5.947	4.074
5.968	4.630
6.201	5.185
6.201	4.259
6.286	5.185
6.349	6.296
6.413	5.370
6.455	6.481
6.540	6.111
6.582	6.852
6.624	5.741
6.646	6.481
6.772	6.481
6.772	7.593
6.794	5.556
6.836	7.037
6.836	5.741
6.921	6.667
6.963	7.037
7.005	9.630
7.090	7.963
7.090	6.667
7.175	10.000
7.175	8.519
7.196	7.222
7.217	7.963
7.259	9.074
7.344	9.259
7.471	9.259
7.471	8.148
7.513	10.556
7.513	8.704
7.619	10.000
7.619	11.111
7.640	9.444
7.704	8.519
7.725	8.519
7.788	11.667
7.810	9.444
7.831	10.741
7.852	11.667
7.873	8.704
7.894	13.519
7.915	11.111
8.000	10.370
8.085	11.296
8.106	17.037
8.127	11.481
8.127	9.815
8.148	13.519
8.169	12.593
8.212	14.444
8.212	12.778
8.275	13.889
8.275	12.593
8.360	13.148
8.381	16.111
8.381	12.963
8.402	13.704
8.508	12.593
8.529	11.667
8.571	14.074
8.593	15.556
8.593	12.037
8.635	15.000
8.635	17.037
8.656	12.963
8.720	13.704
8.720	16.667
8.783	14.444
8.825	15.370
8.889	14.074
8.889	13.148
8.952	15.926
9.016	18.148
9.037	17.222
9.037	15.000
9.079	16.296
9.122	19.259
9.122	18.519
9.143	15.741
9.164	23.148
9.206	21.852
9.206	17.222
9.228	19.074
9.291	17.407
9.312	23.148
9.418	21.296
9.439	19.630
9.460	22.222
9.503	19.259
9.630	22.222
9.630	20.000
9.630	18.333
9.630	16.481
9.651	28.148
9.672	23.519
9.672	32.407
9.672	20.370
9.714	26.667
9.757	22.778
9.799	20.556
9.820	21.667
9.841	23.519
9.841	25.926
9.884	20.926
9.905	22.963
9.905	24.074
9.926	22.407
9.947	26.111
10.074	26.852
10.074	24.815
10.095	24.074
10.095	23.333
10.159	25.185
10.180	27.407
10.243	21.481
10.307	28.519
10.392	24.074
10.392	28.148
10.413	27.037
10.476	30.185
10.519	34.630
10.561	29.630
10.561	25.926
10.582	31.852
10.603	31.111
10.603	26.852
10.624	27.593
10.709	29.630
10.751	26.667
11.026	35.926
11.048	33.148
11.048	26.481
11.302	41.852
11.471	36.852];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'standard length', 'weight', 'females'};  
bibkey.LW_f = 'CanaPess2002';
%
data.LW_m = [ ...
3.637	1.546
3.724	1.546
4.051	1.202
4.465	1.889
4.682	1.889
4.835	2.233
5.031	2.576
5.270	4.466
5.314	3.092
5.358	3.779
5.401	3.092
5.466	3.092
5.554	3.779
5.771	4.637
5.880	4.809
5.989	4.294
6.098	5.496
6.098	4.637
6.316	6.527
6.359	4.981
6.490	4.981
6.708	6.011
6.991	8.244
7.078	7.901
7.078	8.416
7.187	7.901
7.252	8.760
7.318	8.073
7.405	10.477
7.514	9.447
7.579	9.103
7.644	14.084
7.644	9.447
7.884	12.366
7.949	10.649
7.949	13.740
7.971	12.023
8.058	8.416
8.319	12.538
8.341	14.771
8.363	13.740
8.407	10.649
8.428	13.225
8.515	12.195
8.624	14.084
8.690	15.286
8.690	12.538
8.755	15.630
8.820	14.427
8.929	15.630
8.951	17.004
8.995	19.237
9.212	18.893
9.212	15.458
9.234	17.691
9.299	16.832
9.343	18.206
9.408	17.176
9.430	19.580
9.452	16.145
9.474	19.065
9.539	19.924
9.583	15.458
9.604	20.439
9.670	21.126
9.757	21.298
9.779	21.985
9.822	20.439
9.931	22.156
9.931	20.267
10.018	23.531
10.040	24.218
10.105	27.824
10.236	28.855
10.497	27.653
10.519	33.836
10.628	27.824
10.759	26.794
10.780	29.027
10.824	27.824
10.955	31.260
10.998	28.340
11.194	30.057
11.216	31.431
11.238	34.351
11.303	41.737];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'CanaPess2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNN3'; % Cat of Life
metaData.links.id_ITIS = '615421'; % ITIS
metaData.links.id_EoL = '46572333'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_fuscus'; % ADW
metaData.links.id_Taxo = '188072'; % Taxonomicon
metaData.links.id_WoRMS = '276669'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-fuscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_fuscus}}';
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
bibkey = 'SchwFerr2002'; type = 'Article'; bib = [ ... 
'doi = {10.3354/MEPS212223}, ' ...
'author = {Silvia H.L. Schwamborn and Beatrice P. Ferreira}, ' ... 
'year = {2002}, ' ...
'title = {Age structure and growth of the dusky damselfish, \emph{Stegastes fuscus}, from {T}amandar\''{e} reefs, {P}ernambuco, {B}razil}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {63}, ' ...
'pages = {79–88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CanaPess2002'; type = 'Article'; bib = [ ... 
'author = {Bhaskara Canan and Emilly Kataline Rodrigues Pessoa and Gilson Luiz Volpato and Arrilton Ara\''{u}jo and Sathyabama Chellappa}, ' ... 
'year = {2002}, ' ...
'title = {FEEDING AND REPRODUCTIVE DYNAMICS OF THE DAMSELFISH, \emph{Stegastes fuscus} IN THE COASTAL REEFS OF NORTHEASTERN {B}RAZIL}, ' ...
'journal = {Animal Biology Journal}, ' ...
'volume = {2(3)}, ' ...
'pages = {79–88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-fuscus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

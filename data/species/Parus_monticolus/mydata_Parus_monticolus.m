function [data, auxData, metaData, txtData, weights] = mydata_Parus_monticolus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Paridae';
metaData.species    = 'Parus_monticolus'; 
metaData.species_en = 'Green-backed tit'; 

metaData.ecoCode.climate = {'Cwa','Cwb'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 12.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'YeYao2021';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 19.3;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'YeYao2021';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 57.9;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5475;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Parus major';

data.Ww0 = 1.38;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 1.1;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'YeYao2021';   
data.Wwi = 14.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri = 7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'YeYao2021';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 eggs per clutch, assued 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.038	2.040
0.039	1.802
0.039	1.612
0.040	1.517
0.040	1.375
0.040	1.185
0.042	0.710
0.084	1.042
1.034	3.985
1.037	2.702
1.038	2.417
1.038	2.132
1.038	2.037
1.039	1.895
1.039	1.752
1.040	1.467
1.084	1.230
1.085	0.945
1.947	3.935
1.948	3.555
1.949	3.270
1.949	3.033
1.950	2.748
1.950	2.510
1.995	2.225
1.995	1.845
2.943	5.595
2.944	5.120
2.988	4.882
2.989	4.597
2.990	3.932
2.991	3.600
2.991	3.600
2.992	3.410
3.033	4.265
3.079	3.172
3.080	2.982
3.081	2.602
3.082	2.128
3.945	4.833
3.949	3.218
3.949	3.028
3.987	5.355
3.988	5.117
3.989	4.358
4.026	7.350
4.030	5.687
4.034	3.977
4.034	3.740
4.035	3.503
4.072	6.210
4.938	7.632
4.939	7.347
4.939	7.062
4.984	6.587
4.985	6.207
5.033	4.308
5.033	4.118
5.073	5.827
5.073	5.590
5.074	5.115
5.075	4.830
5.890	9.292
5.891	9.007
5.935	8.675
5.946	4.448
5.979	8.532
5.980	8.105
5.981	7.772
5.982	7.392
5.983	7.155
5.984	6.727
6.028	6.442
6.029	6.015
6.030	5.635
6.030	5.493
6.031	5.255
6.931	10.382
6.933	9.860
6.933	9.622
6.934	9.432
6.934	9.242
6.935	8.957
6.937	8.198
6.937	7.913
6.938	7.533
6.939	7.200
6.941	6.535
6.942	6.060
6.942	5.965
6.971	11.997
6.979	8.625
6.980	8.435
7.970	12.564
8.014	12.232
8.016	11.140
8.017	10.807
8.018	10.570
8.019	10.190
8.020	9.810
8.020	9.525
8.021	9.192
8.022	8.955
8.066	8.812
8.068	7.910
8.069	7.577
8.069	7.292
8.070	6.818
8.110	8.432
8.883	12.420
8.883	12.230
8.884	11.992
8.928	11.565
8.929	11.185
8.932	9.998
8.933	9.760
8.933	9.523
8.937	7.908
8.973	10.947
8.974	10.615
8.975	10.282
8.978	9.238
8.978	9.000
8.979	8.763
8.982	7.575
8.983	7.148
9.883	12.512
9.927	12.085
9.928	11.657
9.929	11.467
9.929	11.325
9.930	11.040
9.933	9.710
9.938	7.810
9.976	9.853
9.977	9.568
10.017	10.707
10.018	10.327
10.019	10.042
10.022	8.855
10.929	11.323
10.964	14.885
10.967	13.792
10.967	13.460
10.968	13.222
10.968	13.032
10.969	12.795
10.970	12.462
10.970	12.272
10.971	11.987
10.973	11.085
10.974	10.895
10.974	10.753
10.974	10.515
10.975	10.183
10.979	8.663
11.975	10.370
12.008	14.597
12.009	14.027
12.011	13.600
12.011	13.410
12.012	13.077
12.013	12.602
12.014	12.175
12.015	11.890
12.016	11.510
12.016	11.273
12.017	10.988
12.018	10.655
12.019	10.133
12.021	9.420
12.021	9.230
12.022	8.755
12.884	11.888
12.924	13.408
12.924	13.313
12.925	13.123
12.926	12.743
12.926	12.458
12.928	11.603
12.929	11.270
12.930	10.795
13.009	14.357
13.009	14.120
13.018	10.320
13.922	14.403
13.923	13.928
13.924	13.548
13.970	12.550
13.970	12.170
13.972	11.743
13.972	11.505
13.973	11.315
13.975	10.413
13.975	10.176
13.976	10.081
13.977	9.416
14.007	15.020
14.011	13.215
14.012	12.835
14.834	14.543
14.879	14.210
14.879	14.020
14.923	13.735
14.924	13.260
14.969	12.975
14.970	12.548
14.970	12.358
14.971	12.120
14.972	11.455
14.973	11.171
14.974	10.791
14.974	10.553
14.975	10.411
15.004	16.205
15.108	9.033
15.921	14.730
15.921	14.493
15.922	14.208
15.925	13.115
15.926	12.641
15.926	12.451
15.927	12.071
15.928	11.786
15.930	10.741
15.932	10.171
15.966	13.970
15.972	11.501
15.973	11.121
15.976	9.791
15.978	9.221
16.877	14.775
16.885	11.451
16.886	11.213
16.887	10.549
16.888	10.216
16.889	9.931
16.920	15.108
16.921	14.585
16.922	14.158
16.923	13.778
16.924	13.446
16.926	12.448
16.968	13.066
17.020	9.693
17.921	14.536
17.922	14.156
17.923	13.918
17.923	13.633
17.924	13.348
17.925	13.016
17.926	12.778
17.926	12.588
17.970	12.256
17.971	11.828
18.015	11.591
18.016	11.306
18.017	11.068
18.019	10.118
18.020	9.691
18.888	10.496
18.921	14.771
18.922	14.343
18.930	10.781
18.932	10.116
18.966	13.916
18.967	13.583
18.968	13.013
18.970	12.443
18.971	12.063
18.972	11.731
18.973	11.303
19.927	12.109
19.929	11.491
19.930	11.064
19.975	10.351
20.924	13.341];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'YeYao2021';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is lower just after hatching';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '75T7V'; % Cat of Life
metaData.links.id_ITIS = '561865'; % ITIS
metaData.links.id_EoL = '45518811'; % Ency of Life
metaData.links.id_Wiki = 'Parus_monticolus'; % Wikipedia
metaData.links.id_ADW = 'Parus_monticolus'; % ADW
metaData.links.id_Taxo = '57723'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4E1C5625FB7716EE'; % avibase
metaData.links.id_birdlife = 'green-backed-tit-parus-monticolus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parus_monticolus}}';
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
bibkey = 'YeYao2021'; type = 'Article'; bib = [ ... 
'doi = {10.1186/s40657-021-00296-z}, ' ...
'author = {Ping Ye and Xiaogang Yao and Jianli Bi and Guangrong Li and Wei Liang and Canchao Yang}, ' ... 
'year = {2021}, ' ...
'title = {Breeding biology of the Green-backed Tit (\emph{Parus monticolus}) in southwest {C}hina}, ' ...
'journal = {Avian Research}, ' ...
'volume = {12}, ' ...
'pages = {60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4E1C5625FB7716EE&sec=lifehistory}}';
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


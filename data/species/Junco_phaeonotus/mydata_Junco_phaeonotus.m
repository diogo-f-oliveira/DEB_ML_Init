function [data, auxData, metaData, txtData, weights] = mydata_Junco_phaeonotus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Passerellidae';
metaData.species    = 'Junco_phaeonotus'; 
metaData.species_en = 'Yellow-eyed junco'; 

metaData.ecoCode.climate = {'Aw','Cfa'};
metaData.ecoCode.ecozone = {'TN','THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'WeatSull1991';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.5;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 1.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'WeatSull1991';
data.Wwi = 20.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';

data.Ri  = 3.52/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 3.52 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.008	2.460
0.009	2.137
0.009	1.936
0.010	1.815
0.011	1.492
0.012	1.210
0.020	3.549
0.037	2.863
0.037	2.742
0.051	3.146
0.978	3.521
0.978	3.360
0.980	2.876
0.981	2.634
1.004	4.973
1.005	4.691
1.005	4.570
1.006	4.288
1.006	4.167
1.008	3.764
1.013	1.989
1.024	3.361
1.975	5.631
1.976	5.389
1.977	5.107
1.977	5.107
1.978	4.906
1.978	4.744
1.979	4.543
1.980	4.220
1.980	3.978
1.987	6.841
1.988	6.599
1.989	6.317
1.989	6.115
1.989	5.994
1.990	5.914
2.015	2.487
2.972	7.983
2.973	7.822
2.973	7.621
2.973	7.621
2.974	7.459
2.974	7.177
2.975	7.056
2.975	6.935
2.976	6.693
2.976	6.653
2.977	6.290
2.978	6.048
2.985	3.830
2.994	5.726
2.998	9.516
2.999	9.073
3.001	8.427
3.955	9.811
3.982	5.900
3.987	9.328
3.988	9.126
3.988	9.126
3.988	9.126
3.991	8.118
3.991	7.917
3.992	7.675
3.993	7.352
3.993	12.271
3.993	7.231
3.995	11.707
3.996	11.425
3.997	10.941
3.998	10.659
3.999	10.417
3.999	10.336
3.999	10.255
4.000	10.094
4.001	9.570
4.004	8.643
4.025	6.667
4.974	9.785
4.975	9.381
4.980	8.010
4.981	12.527
4.983	11.962
4.995	13.011
4.995	12.930
4.997	12.245
4.997	12.204
5.008	13.656
5.009	13.495
5.014	11.761
5.014	11.640
5.015	11.438
5.015	11.237
5.016	11.035
5.017	10.793
5.017	10.793
5.021	14.261
5.033	10.390
5.988	11.532
5.988	11.451
5.990	10.806
5.990	15.726
5.991	15.403
5.992	15.081
5.994	14.556
5.995	14.193
5.995	14.032
5.996	13.831
5.996	13.831
5.997	13.629
5.997	13.629
5.997	13.427
5.998	13.266
5.999	12.944
6.000	12.621
6.000	12.379
6.001	12.137
6.002	11.895
6.009	9.637
6.973	17.634
6.990	17.070
6.991	16.747
6.992	16.304
6.992	16.263
6.993	16.183
6.993	15.941
6.994	15.659
6.994	15.618
6.995	15.417
6.995	15.417
6.999	14.207
7.000	13.925
7.000	13.642
7.002	13.199
7.013	14.651
7.024	11.062
7.027	14.973
7.028	14.732
7.981	16.277
7.982	16.115
7.992	17.567
7.993	17.245
7.997	15.954
7.997	15.954
7.998	15.672
8.006	13.212
8.006	17.930
8.007	12.729
8.009	17.043
8.010	16.600
8.014	15.430
8.015	15.229
8.015	14.946
8.017	14.543
8.018	14.059
8.019	18.777
8.020	18.374
8.025	16.801
8.985	16.250
8.988	15.322
8.989	15.040
8.992	18.911
8.993	18.548
8.994	18.387
8.995	17.984
8.995	17.863
8.995	17.863
8.996	17.581
8.997	17.298
8.997	17.218
8.998	17.097
8.998	17.097
8.998	16.976
9.005	14.516
9.006	19.476
9.010	17.903
9.011	17.540
9.014	16.532
9.030	16.331
9.038	13.751
9.958	16.464
9.970	17.473
9.975	15.779
9.980	19.207
9.985	17.352
9.995	19.126
9.997	18.683
9.998	18.038
9.999	17.755
10.000	17.594
10.002	17.030
10.012	13.723
10.972	18.010
10.975	17.123
10.984	14.099
10.985	18.615
11.992	17.621
11.997	16.089];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WeatSull1991';

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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3QTCG'; % Cat of Life
metaData.links.id_ITIS = '179427'; % ITIS
metaData.links.id_EoL = '45511196'; % Ency of Life
metaData.links.id_Wiki = 'Junco_phaeonotus'; % Wikipedia
metaData.links.id_ADW = 'Junco_phaeonotus'; % ADW
metaData.links.id_Taxo = '58080'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'D552A8186738379E'; % avibase
metaData.links.id_birdlife = 'yellow-eyed-junco-junco-phaeonotus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Junco_phaeonotus}}';
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
bibkey = 'WeatSull1991'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1368615}, ' ...
'author = {Weathers, W. W. and Sullivan, K. A.}, ' ... 
'year = {1991}, ' ...
'title = {Growth and Energetics of Nestling Yellow-Eyed Juncos}, ' ...
'journal = {The Condor}, ' ...
'volume = {93(1)}, ' ...
'pages = {138–146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=D552A8186738379E&sec=lifehistory}}';
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


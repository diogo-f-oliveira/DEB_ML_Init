function [data, auxData, metaData, txtData, weights] = mydata_Tolmomyias_sulphurescens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Tyrannidae';
metaData.species    = 'Tolmomyias_sulphurescens'; 
metaData.species_en = 'Yellow-olive flatbill'; 

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
    
metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1   = [2022 11 16];              
metaData.email_mod_1  = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1= {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 20;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnciAguil2012';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 23;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AnciAguil2012';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 69;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnciAguil2012';
data.Wwi = 17.5;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'AnciAguil2012';

data.Ri  = 3.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnciAguil2012';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 3-4 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
1.000	2.980
1.000	1.721
1.000	1.263
1.937	3.552
1.940	2.351
1.940	2.065
1.975	4.130
1.976	3.672
1.977	3.157
1.980	2.070
1.981	1.669
2.025	2.814
2.074	2.413
2.116	4.588
2.923	2.761
2.969	3.219
3.012	5.107
3.013	4.764
3.015	4.020
3.015	3.848
3.016	3.505
3.160	2.304
3.916	2.422
3.958	4.940
3.962	3.223
4.048	6.714
4.050	5.856
4.051	5.513
4.051	5.398
4.051	5.398
4.052	5.112
4.053	4.540
4.055	3.510
4.101	4.311
4.102	3.911
4.757	6.546
4.850	7.233
4.856	4.544
4.899	6.547
4.899	6.318
4.900	6.261
4.900	6.032
4.940	9.294
4.948	5.574
4.949	5.403
4.997	5.002
5.936	7.410
5.937	7.067
5.981	8.440
5.982	7.925
5.983	7.811
5.983	7.639
5.986	6.552
6.034	5.980
6.035	5.637
6.835	6.957
6.931	6.442
6.932	6.041
6.968	10.848
6.971	9.475
6.972	8.960
6.972	8.845
6.973	8.617
6.973	8.445
6.974	8.273
6.974	7.987
7.014	11.592
7.027	5.527
7.821	9.822
7.914	10.166
7.914	10.166
7.923	6.504
7.961	10.510
7.962	10.223
7.964	9.194
7.965	8.736
8.007	10.968
8.062	7.592
9.004	8.970
9.005	8.455
9.008	6.910
9.045	11.545
9.046	10.973
9.047	10.858
9.048	10.286
9.088	13.662
9.090	12.575
9.091	11.945
9.100	7.997
9.896	11.377
9.897	10.805
9.945	10.347
9.988	12.293
9.989	12.064
9.989	11.893
10.034	12.808
10.035	12.637
10.174	13.724
10.890	10.638
10.975	14.758
10.976	14.072
10.978	13.213
10.979	12.927
10.981	12.012
10.982	11.554
11.021	15.445
11.114	15.846
11.874	14.133
11.919	15.163
11.920	14.534
11.965	15.736
11.973	12.131
11.980	8.869
12.011	16.194
12.021	11.731
12.022	11.444
12.065	13.276
12.957	15.569
13.004	16.027
13.006	14.768
13.007	14.482
13.009	13.681
13.010	13.337
13.050	16.313
13.190	16.943
13.899	17.004
13.900	16.661
13.901	16.317
13.901	16.031
14.044	15.746
14.092	15.174
14.755	14.719
14.893	16.265
14.893	16.093
14.894	15.807
14.894	15.521
14.895	15.235
14.933	19.240
14.984	17.867
14.985	17.467
14.985	17.181
14.986	16.723
15.885	16.269
15.931	16.842
15.931	16.613
15.975	18.158
15.977	17.128
16.024	17.472
16.782	16.445
16.825	18.448
16.874	17.705
16.874	17.533
16.874	17.419
16.875	17.304
16.875	17.132
17.918	15.535
17.958	18.911
17.959	18.511
17.959	18.339
17.960	18.110
17.960	17.767
17.961	17.252
18.058	16.165
19.049	16.914
19.093	18.287
19.093	18.230
19.094	17.887
19.094	17.715
19.095	17.486
19.138	19.146
19.139	18.745
19.900	16.746
19.945	17.376
19.990	18.521
19.991	18.120
19.992	17.720
20.935	18.468
20.936	18.182
20.937	17.610
20.938	17.381
20.986	16.980
21.971	20.018
21.978	16.813
21.979	16.527
22.020	19.217
22.022	18.416
22.826	17.847
22.827	17.333
22.866	21.052
22.872	18.420
22.914	20.709
23.959	18.311];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
data.tW(:,1) = data.tW(:,1)-1; % convert time to time since birth
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AnciAguil2012';

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
D2 = 'mod_1: v reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '57BJZ'; % Cat of Life
metaData.links.id_ITIS = '563499'; % ITIS
metaData.links.id_EoL = '45511798'; % Ency of Life
metaData.links.id_Wiki = 'Tolmomyias_sulphurescens'; % Wikipedia
metaData.links.id_ADW = 'Tolmomyias_sulphurescens'; % ADW
metaData.links.id_Taxo = '56179'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '90069CDDF5B27154'; % avibase
metaData.links.id_birdlife = 'yellow-olive-flatbill-tolmomyias-sulphurescens'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tolmomyias_sulphurescens}}';
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
bibkey = 'AnciAguil2012'; type = 'Article'; bib = [ ... 
'doi = {10.1676/09-072.1}, ' ...
'author = {Marina Anci\~{a}es and tha\''{i}s Maya Aguilar and Lemuel Ol\''{i}vio Leite and Renata Dornelas Andrade and Miguel \^{A}ngelo Marini}, ' ... 
'year = {2012}, ' ...
'title = {NESTING BIOLOGY OF THE YELLOW-OLIVE FLATBILL ({T}YRANNIDAE, {E}LANINAE) IN ATLANTIC FOREST FRAGMENTS IN {B}RAZIL}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {124}, ' ...
'pages = {547-557}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/45511798}}';
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


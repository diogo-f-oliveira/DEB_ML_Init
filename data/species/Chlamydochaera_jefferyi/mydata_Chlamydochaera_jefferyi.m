function [data, auxData, metaData, txtData, weights] = mydata_Chlamydochaera_jefferyi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Turdidae';
metaData.species    = 'Chlamydochaera_jefferyi'; 
metaData.species_en = 'Fruithunter'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 14.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MitcTuh2017';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17.8;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MitcTuh2017';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 53.4;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 350;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MitcTuh2017';
data.Wwi = 51;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'MitcTuh2017';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MitcTuh2017';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.002	3.945
0.003	4.819
0.075	5.694
1.002	4.397
1.003	4.833
1.004	5.562
1.005	6.290
1.006	6.727
1.007	7.309
1.008	8.037
1.041	9.349
1.042	9.931
1.043	10.659
2.039	6.450
2.040	8.052
2.041	8.781
2.042	9.800
2.043	10.383
2.044	14.606
2.045	14.752
2.080	13.878
2.114	11.403
2.115	12.714
2.936	12.143
2.972	13.454
2.973	15.056
3.042	10.106
3.046	16.805
3.047	17.970
3.048	19.135
4.012	19.732
4.013	22.062
4.044	14.344
4.046	17.402
4.974	17.270
5.011	18.581
5.049	22.659
5.050	24.698
5.052	27.756
5.053	29.358
5.978	23.984
5.979	25.294
5.980	26.605
6.018	29.664
6.052	28.062
6.161	30.977
6.947	30.405
6.951	38.415
6.979	24.435
7.051	25.892
7.054	31.135
7.055	32.155
7.984	32.459
7.989	41.634
8.020	33.334
8.021	35.227
8.052	28.237
8.057	35.664
8.058	36.829
8.059	37.558
8.060	39.159
8.061	40.325
8.095	39.597
9.018	31.164
9.020	33.931
9.023	39.465
9.024	40.047
9.025	41.212
9.057	36.261
9.062	44.708
9.094	37.427
9.992	46.760
10.021	35.110
10.022	36.858
10.023	37.441
10.024	38.023
10.025	40.062
10.026	42.975
10.027	43.557
10.028	44.868
10.100	47.781
10.983	31.921
10.992	47.066
11.025	42.989
11.063	45.465
11.134	44.593
11.993	49.120
12.024	39.800
12.025	41.110
12.026	42.712
12.027	46.499
12.028	47.081
12.062	44.606
12.064	48.101
13.031	51.611
13.060	40.689
13.062	44.329
13.063	46.077
13.064	48.262
13.995	51.916
14.024	40.994
14.028	47.256
14.029	48.276
14.062	43.761
14.063	45.800
14.065	49.296
14.066	50.315
14.994	49.309
15.101	49.893
15.133	43.049
15.137	50.767
15.989	41.459
15.996	52.673
16.027	45.538
16.062	44.519
16.100	48.451
16.101	49.471
16.991	45.552
16.993	47.736
16.994	48.901
17.094	38.709
17.096	41.621
18.060	41.490];
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MitcTuh2017';

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
metaData.links.id_CoL = '69WQH'; % Cat of Life
metaData.links.id_ITIS = '559198'; % ITIS
metaData.links.id_EoL = '1052810'; % Ency of Life
metaData.links.id_Wiki = 'Chlamydochaera_jefferyi'; % Wikipedia
metaData.links.id_ADW = 'Chlamydochaera_jefferyi'; % ADW
metaData.links.id_Taxo = '56839'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '69DE3A4D20F63ACD'; % avibase
metaData.links.id_birdlife = 'fruithunter-chlamydochaera-jefferyi'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlamydochaera_jefferyi}}';
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
bibkey = 'MitcTuh2017'; type = 'Article'; bib = [ ... 
'doi = {10.1676/1559-4491-129.1.36}, ' ...
'author = {Adam E. Mitchell and Fred Tuh and Thomas E. Martin}, ' ... 
'year = {2017}, ' ...
'title = {BREEDING BIOLOGY OF AN ENDEMIC {B}ORNEAN TURDID, THE FRUITHUNTER (\emph{Chlamydochaera jefferyi}), AND LIFE HISTORY COMPARISONS WITH TURDUS SPECIES OF THE WORLD}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {129}, ' ...
'pages = {36-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1052810}}';
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


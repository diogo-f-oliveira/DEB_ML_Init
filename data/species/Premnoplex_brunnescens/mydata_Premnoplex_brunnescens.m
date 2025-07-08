function [data, auxData, metaData, txtData, weights] = mydata_Premnoplex_brunnescens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Furnariidae';
metaData.species    = 'Premnoplex_brunnescens'; 
metaData.species_en = 'Spotted barbtail';

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab', 'ap', 'aR', 'am', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 27.2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MunoMart2014';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 21.7;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MunoMart2014';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 65.1;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'MunoMart2014';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.2;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MunoMart2014';
data.Wwi = 25;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MunoMart2014';
  comment.Wwi = 'asymptotic weight of nestling; adult weight 16.9 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MunoMart2014';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per year assumed';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.012	2.229
0.014	2.590
0.061	2.952
0.063	3.313
0.064	3.554
0.909	2.590
1.004	3.614
1.051	4.036
1.053	4.458
1.054	4.639
1.091	3.133
1.993	4.458
1.997	5.241
1.999	5.602
2.001	5.964
2.038	4.639
2.079	3.916
2.132	5.422
2.844	4.699
2.987	6.325
3.026	5.301
3.036	7.048
3.073	5.663
3.075	5.964
3.123	6.687
3.248	5.000
4.016	6.386
4.020	7.108
4.022	7.470
4.025	8.072
4.032	9.277
4.152	6.687
4.248	7.771
4.935	10.723
4.968	8.554
4.971	9.157
4.975	9.880
5.025	10.964
5.056	8.313
5.068	10.602
5.098	7.831
5.108	9.639
5.149	9.036
5.155	10.060
5.867	9.337
5.920	11.024
5.954	8.855
5.962	10.482
6.004	9.940
6.012	11.446
6.014	11.747
6.104	11.928
6.106	12.229
6.142	10.663
6.954	11.867
7.000	12.169
7.035	10.301
7.048	12.711
7.053	13.614
7.096	13.253
7.127	10.783
7.137	12.530
7.139	13.012
7.983	11.807
7.987	12.530
7.991	13.313
7.993	13.614
7.999	14.819
8.049	15.843
8.051	16.145
8.078	12.831
8.079	13.072
8.092	15.482
8.132	14.518
8.135	15.120
9.014	12.229
9.027	14.639
9.030	15.181
9.032	15.602
9.062	12.771
9.066	13.494
9.069	14.036
9.082	16.446
9.083	16.627
9.086	17.229
9.169	16.024
10.074	18.012
10.109	16.145
10.111	16.446
10.114	16.988
10.117	17.590
10.121	18.434
10.123	18.675
10.124	18.855
10.151	15.542
10.159	17.169
10.924	18.012
11.018	18.855
11.096	16.566
11.098	17.048
11.106	18.494
11.111	19.458
11.146	17.651
11.194	18.253
11.199	19.096
12.049	19.217
12.084	17.229
12.090	18.373
12.092	18.735
12.133	18.072
12.140	19.398
12.142	19.699
13.043	20.904
13.045	21.386
13.049	22.048
13.086	20.542
13.092	21.627
13.116	17.892
13.118	18.193
13.125	19.458
14.072	20.904
14.075	21.506
14.123	21.988
14.124	22.289
14.154	19.458
14.156	19.940
14.993	17.530
15.088	18.494
15.094	19.578
15.096	19.940
15.098	20.361
15.135	18.976
15.144	20.542
15.146	21.024
15.155	22.590
15.159	23.373
16.038	20.422
16.086	21.024
16.124	19.699
16.156	17.470
17.055	18.193
17.057	18.614
17.104	18.976
17.106	19.277
17.110	20.120
17.113	20.663
17.116	21.265
17.124	22.590
17.129	23.675
18.140	20.241
19.197	17.108
19.213	20.181
19.216	20.663
19.245	17.771
20.016	19.699
21.035	17.831];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MunoMart2014';
  
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
D1 = 'Feeding is reduced just before fledge';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6VWST'; % Cat of Life
metaData.links.id_ITIS = '562428'; % ITIS
metaData.links.id_EoL = '45511667'; % Ency of Life
metaData.links.id_Wiki = 'Premnoplex_brunnescens'; % Wikipedia
metaData.links.id_ADW = 'Premnoplex_brunnescens'; % ADW
metaData.links.id_Taxo = '74932'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B023E37883BB7D29'; % avibase
metaData.links.id_birdlife = 'spotted-barbtail-premnoplex-brunnescens'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Premnoplex_brunnescens}}';
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
bibkey = 'MunoMart2014'; type = 'Article'; bib = [ ... 
'doi = {10.1676/14-011.1}, ' ...
'author = {D. Mu\~{n}oz and T. E. Martin}, ' ... 
'year = {2014}, ' ...
'title = {Breeding biology of the Spotted Barbtail (\emph{Premnoplex brunnescens})}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {126}, ' ...
'number = {4}, '...
'pages = {717--727}'];
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


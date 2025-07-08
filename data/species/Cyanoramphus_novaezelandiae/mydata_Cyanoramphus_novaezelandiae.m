function [data, auxData, metaData, txtData, weights] = mydata_Cyanoramphus_novaezelandiae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Cyanoramphus_novaezelandiae'; 
metaData.species_en = 'Red-fronted parakeet'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-dWw'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 52.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 157.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'australianwildlife';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 6.25;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 5.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 81.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 88; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - weight increment
data.tdW_f = [ ... % time since birth (d), log 10 wet weight increment (g/d)
0.798	-0.651
0.857	-0.711
0.973	-0.777
1.661	-0.651
2.636	-0.498
2.983	-0.563
2.984	-0.645
3.671	-0.492
4.762	-0.367
4.823	-0.553
4.936	-0.454
5.968	-0.268
6.891	-0.427
6.948	-0.361
7.118	-0.246
7.979	-0.186
8.039	-0.268
8.898	-0.082
9.016	-0.219
9.820	-0.192
9.877	-0.148
9.933	-0.077
10.856	-0.219
11.027	-0.110
11.942	0.126
11.947	-0.099
12.003	-0.028
12.806	0.076
12.982	-0.082
14.014	0.093
14.016	-0.017
14.934	0.109
14.936	-0.006
15.854	0.098
15.967	0.208
16.771	0.290
16.775	0.098
17.751	0.202
17.864	0.311
17.977	0.383
19.072	0.279
19.877	0.311
19.936	0.229
19.989	0.459
19.990	0.383
20.848	0.640
20.915	0.180
21.890	0.311
21.940	0.689
21.949	0.257
23.033	0.667
23.902	0.388
23.904	0.306
23.958	0.448
23.962	0.257
25.857	0.443
25.911	0.607
25.912	0.558
25.973	0.383
26.898	0.153
27.987	0.339
28.955	0.820
28.970	0.082
29.939	0.536
30.923	0.251
32.013	0.366
32.072	0.301
32.878	0.251
33.855	0.339
34.144	0.268
35.926	0.317
36.028	0.968
36.092	0.623
38.054	0.344
40.010	0.333];
data.tdW_f(:,2) = 10.^data.tdW_f(:,2); % undo log transformation
units.tdW_f   = {'d', 'g/d'};  label.tdW_f = {'time since birth', 'wet weight increment', 'females'};  
temp.tdW_f    = C2K(41.3);  units.temp.tdW_f = 'K'; label.temp.tdW_f = 'temperature';
bibkey.tdW_f = 'CateHaub2013';
comment.tdW_f = 'data for females';
%
data.tdW_m = [ ... % time since birth (d), log 10 wet weight increment (g/d)
0.856	-0.749
1.017	-0.700
2.086	-0.567
2.087	-0.635
2.088	-0.662
2.996	-0.540
2.997	-0.628
3.050	-0.586
3.906	-0.498
4.013	-0.381
5.029	-0.460
6.046	-0.456
6.100	-0.301
6.101	-0.384
8.026	-0.141
8.027	-0.304
8.133	-0.244
9.096	-0.160
10.005	-0.205
10.166	-0.167
11.129	-0.061
11.985	-0.125
12.146	0.076
12.199	-0.061
13.109	0.042
14.072	0.042
14.179	0.133
15.035	0.186
15.998	0.384
15.999	0.027
16.052	0.118
16.105	0.152
17.068	0.361
17.924	0.551
17.978	0.354
17.979	0.130
18.031	0.076
19.208	0.589
19.957	0.202
20.064	0.525
20.065	0.358
20.974	0.149
21.134	0.601
22.044	0.384
23.061	0.271
23.062	0.612
24.024	0.290
24.131	0.559
25.094	0.301
25.201	0.620
26.003	0.358
26.110	0.229
27.020	0.666
29.000	0.548
29.053	0.222
29.214	0.484
31.140	0.636
31.141	0.438
31.142	0.389
32.210	0.613
33.227	0.621
34.083	0.773];    
data.tdW_m(:,2) = 10.^data.tdW_m(:,2); % undo log transformation
units.tdW_m   = {'d', 'g/d'};  label.tdW_m = {'time since birth', 'wet weight increment', 'males'};  
temp.tdW_m    = C2K(41.3);  units.temp.tdW_m = 'K'; label.temp.tdW_m = 'temperature';
bibkey.tdW_m = 'CateHaub2013';
comment.tdW_m = 'data for males';

% time-weight
data.tW = [ ... % time since hatch (d) wet weight (b)
0.667	5.542
0.944	4.819
1.148	6.265
2.041	7.229
2.045	5.301
3.138	9.639
3.141	8.193
4.100	10.843
4.102	9.639
5.057	14.458
5.059	13.253
5.062	12.048
6.088	15.422
6.091	13.976
7.051	15.663
7.115	18.313
7.246	21.446
7.865	21.928
7.868	20.241
8.007	19.759
8.896	22.892
8.899	21.446
8.958	26.265
9.977	32.771
10.054	29.157
10.058	26.988
11.072	36.386
11.077	33.735
11.080	32.530
11.082	31.325
11.818	41.928
12.034	37.349
12.917	43.133
12.922	40.964
13.062	39.759
14.026	40.000
14.081	46.506
14.084	45.301
15.035	51.566
15.039	49.880
15.050	44.337
15.985	58.313
17.007	63.614
17.023	55.904
17.079	62.169
17.897	66.265
17.973	63.133
18.928	67.470
19.083	58.795
20.025	69.880
20.102	65.783
20.917	71.325
21.183	76.145
21.185	74.940
22.218	75.181
22.221	73.494
22.746	86.265
22.904	76.386
23.936	76.867
23.938	75.904
24.966	78.072
24.970	76.145
25.781	83.614
25.926	80.241
26.000	78.072
27.080	88.434
27.084	86.506
27.090	83.614
27.841	86.988
27.916	83.614
28.037	92.048
28.934	91.325
29.057	98.313
29.084	85.060
29.958	95.422
29.965	92.289
30.039	89.880
30.794	91.084
30.866	89.157
31.007	87.711
31.824	92.530
31.888	94.699
31.897	90.361
32.046	84.819
32.803	85.060
32.934	88.434
32.994	92.771
33.767	85.060
33.808	98.554
34.024	94.217
34.933	87.470
35.060	92.771
35.951	94.699
36.027	91.566
36.836	99.759
36.849	93.735
37.733	99.277
37.953	92.530
40.987	90.843
40.990	89.157
41.949	92.048];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gree2003';
  
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

%% Group plots
set1 = {'tdW_f','tdW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'Ww0 data ignored due to inconsistency with Wwb data';
D5 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '32NXG'; % Cat of Life
metaData.links.id_ITIS = '177582'; % ITIS
metaData.links.id_EoL = '45517973'; % Ency of Life
metaData.links.id_Wiki = 'Cyanoramphus_novaezelandiae'; % Wikipedia
metaData.links.id_ADW = 'Cyanoramphus_novaezelandiae'; % ADW
metaData.links.id_Taxo = '54283'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B4FD10E08E165D19'; % avibase
metaData.links.id_birdlife = 'red-fronted-parakeet-cyanoramphus-novaezelandiae'; % birdlife
metaData.links.id_AnAge = 'Cyanoramphus_novaezelandiae'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyanoramphus_novaezelandiae}}';
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
bibkey = 'CateHaub2013'; type = 'article'; bib = [ ... 
'author = {Luis Ortiz-Catedral and Mark E. Hauber and Dianne H. Brunton}, ' ... 
'year = {2013}, ' ...
'title = {Growth and survival of nestlings in a population of red-crowned parakeets (\emph{Cyanoramphus novaezelandiae}) free of introduced mammalian nest predators on {T}iritiri {M}atangi {I}sland, {N}ew {Z}ealand}, ' ...
'journal = {New Zealand Journal of Ecology}, ' ...
'volume = {37(3)}, ' ...
'pages = {370-378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gree2003'; type = 'article'; bib = [ ... 
'author = {Greene, T.C.}, ' ... 
'year = {2003}, ' ...
'title = {Breeding biology of red-crowned parakeets (\emph{Cyanoramphus novaezelandiae}) on {L}ittle {B}arrier {I}sland, {H}auraki {G}ulf, {N}ew {Z}ealand,}, ' ...
'journal = {Notornis}, ' ...
'volume = {50(2)}, ' ...
'pages = {83-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cyanoramphus_novaezelandiae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B4FD10E08E165D19&sec=lifehistory}}';
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


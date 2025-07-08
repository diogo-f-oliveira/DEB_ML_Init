function [data, auxData, metaData, txtData, weights] = mydata_Synoicus_chinensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Synoicus_chinensis'; 
metaData.species_en = 'Blue-breasted quail'; 

metaData.ecoCode.climate = {'A','Cwa','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','t-pX'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 23];

%% set data
% zero-variate data

data.ab = 18;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'McGoKirw2020';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 40;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;          units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 4.8;  units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
data.Wwb = 3.6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bern1973';
data.Wwi = 35.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 41;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 6.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.5 eggs per clutch, 1 clutch per jr';
  
% uni-variate data
% time - weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	3.634
0.000	3.388
0.099	3.019
0.099	2.835
1.186	3.823
1.187	3.454
1.188	3.085
1.280	2.901
1.828	4.194
2.013	3.703
2.014	3.273
2.931	4.444
2.931	4.321
3.115	4.137
3.206	4.875
3.943	3.894
4.034	4.140
4.308	5.309
4.861	4.389
4.862	4.143
4.955	3.591
5.042	5.742
5.963	4.762
6.144	5.869
6.146	5.193
6.146	5.008
6.879	6.117
6.880	5.626
6.973	5.380
7.060	7.531
7.061	7.162
7.252	3.968
8.256	7.105
9.085	6.248
9.085	6.064
9.086	5.634
9.268	6.617
10.090	8.955
10.091	8.464
10.183	8.096
10.187	6.621
10.368	7.728
10.461	7.113
11.015	6.317
11.379	7.854
11.382	6.625
12.017	10.068
12.018	9.638
12.021	8.594
12.022	8.102
12.207	7.611
13.032	8.413
13.212	10.073
14.315	10.261
15.230	11.739
15.318	13.460
15.325	10.634
15.499	14.690
15.957	15.429
16.054	13.033
16.142	14.876
16.149	11.804
16.334	11.190
17.153	15.003
17.155	14.204
17.334	16.232
17.340	13.590
18.067	16.972
18.257	14.515
18.258	14.024
18.438	15.929
18.713	15.992
18.989	15.747
19.259	18.329
19.992	19.437
20.086	18.639
20.088	17.717
20.089	17.287
21.095	19.196
21.191	17.414
21.191	17.414
21.192	17.291
21.193	16.738
21.275	21.040
21.278	19.811
21.279	19.442
21.556	18.583
21.924	18.461
22.109	18.216
22.287	20.552
22.289	19.814
23.207	20.187
23.209	19.572
23.296	21.477
23.481	21.171
24.125	20.620
24.306	21.788
24.310	20.068
24.395	23.202
24.484	24.677
24.491	21.666
25.033	25.662
25.220	24.372
25.225	22.099
25.226	21.607
25.313	23.635
25.405	23.881
26.141	23.454
26.228	25.605
26.315	27.448
26.321	25.114
26.322	24.806
26.325	23.270
26.326	22.840
26.962	26.099
27.048	28.864
27.058	24.195
27.059	23.949
27.147	25.608
27.241	24.625
27.419	27.391
27.972	26.471
28.067	25.120
28.150	28.868
28.244	27.947
28.882	30.346
28.985	25.676
29.254	28.627
29.257	27.275
29.991	27.708
30.172	29.183
30.173	28.814
30.176	27.463
31.093	28.326
31.094	27.958
31.363	30.601
31.366	29.495
32.288	28.331
32.466	30.728
32.561	29.315
33.014	32.450
33.016	31.528
33.202	30.362
33.295	29.932
33.937	30.364
34.030	30.057
34.117	32.085
34.395	31.103
35.041	30.307
35.124	33.871
35.312	32.336
35.313	31.783
35.500	30.493
36.230	32.523
39.261	33.395
39.262	33.026
39.265	31.797
39.351	34.501
39.904	33.889
39.912	30.141
40.097	29.834
40.274	32.784
40.275	32.292
40.277	31.371
40.364	33.399
41.186	35.982
41.189	34.508
41.191	33.770
41.192	33.279
41.194	32.296
41.196	31.559
41.196	31.313
41.202	28.916
42.119	29.964
42.197	35.679
42.198	35.310
42.294	33.406
42.296	32.853
42.392	30.949
43.214	33.348
43.215	32.733
43.219	31.074
43.309	32.058
44.033	36.730
44.310	36.424
44.312	35.502
44.313	35.011
45.040	38.700
45.322	35.875
45.408	38.271
45.410	37.473
45.413	36.121
46.151	34.833
46.152	34.403
46.158	31.823
46.240	36.185
47.249	37.357
47.257	33.670
47.260	32.503
48.075	37.728
48.080	35.516
48.083	34.287
48.181	31.584
48.260	37.115
48.262	36.316
49.274	36.012
49.277	34.783
49.362	37.487
49.363	36.996
49.364	36.750
49.373	32.940];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Bern1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.ab = 2 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tp splitted from tR';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'YYSG'; % Cat of Life
metaData.links.id_ITIS = '176009'; % ITIS
metaData.links.id_EoL = '55636641'; % Ency of Life
metaData.links.id_Wiki = 'Synoicus_chinensis'; % Wikipedia
metaData.links.id_ADW = 'Coturnix_chinensis'; % ADW
metaData.links.id_Taxo = '53095'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C2579CCB48D8AF6F'; % avibase
metaData.links.id_birdlife = 'asian-blue-quail-synoicus-chinensis'; % birdlife
metaData.links.id_AnAge = 'Coturnix_chinensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synoicus_chinensis}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Coturnix_chinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bern1973'; type = 'Article'; bib = [ ...  
'title = {Development of thermoregulation in painted quail, \emph{Excalfactoria chinensis}}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
'year = {1973}, ' ...
'author = {Bernstein, M. H.}, ' ...
'volume = {44(2)}, ' ...
'pages = {355–366}, ' ...
'doi = {10.1016/0300-9629(73)90488-x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C2579CCB48D8AF6F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McGoKirw2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.blbqua1.01}, ' ...
'author = {McGowan, P. J. K. and G. M. Kirwan}, ' ... 
'year = {2020}, ' ...
'title = {Blue-breasted Quail (\emph{Synoicus chinensis}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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


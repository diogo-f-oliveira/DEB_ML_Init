function [data, auxData, metaData, txtData, weights] = mydata_Merops_apiaster

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Coraciiformes'; 
metaData.family     = 'Meropidae';
metaData.species    = 'Merops_apiaster'; 
metaData.species_en = 'European bee-eater'; 

metaData.ecoCode.climate = {'BSk','Csa','Dsa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 30.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 91.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365; units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 6.5; units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 4.85; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 56.6; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 5.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
4.244	11.972
4.379	13.949
5.225	24.327
6.223	24.311
6.246	15.733
7.188	23.635
7.191	25.779
7.196	29.738
7.199	31.882
7.972	37.643
8.205	38.134
8.230	31.700
8.262	30.050
8.269	35.988
8.505	38.294
9.149	20.469
9.168	35.974
9.196	31.684
9.207	40.262
9.208	41.581
9.278	43.889
9.462	31.680
9.539	39.926
9.568	36.132
9.942	42.394
9.946	45.693
9.948	47.507
10.146	45.689
10.201	36.286
10.220	51.626
10.244	44.203
10.249	47.997
10.272	40.409
10.275	42.553
10.534	36.281
10.546	46.178
10.608	42.878
10.677	44.361
11.217	50.125
11.223	28.352
11.273	41.547
11.279	46.166
11.314	48.144
11.506	42.038
11.545	46.161
11.888	54.073
11.888	54.073
12.221	54.068
12.277	45.819
12.280	48.128
12.487	54.063
12.925	58.015
13.158	58.176
13.220	54.051
13.281	49.926
13.282	51.081
13.486	54.047
13.491	58.335
13.893	59.978
13.929	62.617
14.154	55.685
14.198	64.592
14.218	54.035
14.226	60.303
14.229	62.447
14.270	42.157
14.464	64.422
14.493	60.298
14.495	62.442
14.551	54.029
14.825	59.798
14.994	61.774
14.997	64.414
15.233	66.389
15.235	68.203
15.240	72.162
15.253	55.997
15.258	59.956
15.264	64.409
15.288	57.646
15.295	62.594
15.458	60.117
15.494	61.931
15.496	64.240
15.507	72.323
15.824	59.946
15.827	62.255
16.126	62.086
16.155	58.126
16.157	59.941
16.219	56.641
16.231	65.878
16.296	64.392
16.427	62.740
16.465	66.534
16.831	66.033
16.866	67.847
17.156	59.759
17.161	64.213
17.192	62.068
17.207	47.387
17.230	66.026
17.233	68.006
17.366	68.498
17.523	60.248
17.564	66.516
17.763	66.347
17.798	67.831
18.067	69.806
18.096	66.177
18.097	67.331
18.158	62.382
18.160	64.031
18.170	71.949
18.189	60.567
18.214	53.969
18.217	56.443
18.396	66.172
18.423	61.718
18.436	71.944
18.488	60.397
18.859	64.020
18.898	68.803
18.929	66.328
19.100	70.284
19.125	64.016
19.152	58.407
19.157	62.366
19.164	68.468
19.228	66.323
19.366	70.280
19.492	64.174
19.495	66.484
19.496	67.803
19.517	57.741
19.827	66.148
19.886	59.549
19.899	70.436
20.057	63.670
20.088	61.855
20.101	71.917
20.132	70.102
20.137	73.896
20.140	76.205
20.152	59.875
20.160	66.143
20.196	67.957
20.386	59.871
20.393	66.139
20.406	76.201
20.432	70.097
20.726	65.969
21.118	59.859
21.121	62.333
21.125	65.632
21.129	68.766
21.751	60.178
21.756	64.137
21.989	64.133
22.025	66.277
22.027	67.926
22.086	61.822
22.118	60.337
22.145	56.048
22.260	67.923
22.289	64.128
22.383	60.003
22.819	62.305
22.824	66.264
22.827	68.243
23.013	57.683
23.034	74.343
23.049	59.992
23.055	64.446
23.060	68.239
23.091	66.259
23.118	61.970
23.348	59.492
23.352	62.131
23.392	68.069
23.423	66.254
23.551	62.128
23.689	65.755
23.913	58.493
23.949	60.637
23.951	61.792
23.977	56.348
24.008	54.203
24.021	64.595
24.282	60.467
24.313	58.652
24.350	61.950
24.682	60.625
24.717	62.109
24.912	58.642
24.914	60.291
24.925	68.538
24.950	62.105
24.989	66.888
25.019	64.413
25.217	62.431
25.281	60.615
25.978	58.459
26.935	52.010
26.941	56.464
26.946	60.753
28.861	47.855
28.936	54.452
29.976	60.538];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-6; end;end 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LessAver1989';
  
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
%txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3ZW55'; % Cat of Life
metaData.links.id_ITIS = '554661'; % ITIS
metaData.links.id_EoL = '45513614'; % Ency of Life
metaData.links.id_Wiki = 'Merops_apiaster'; % Wikipedia
metaData.links.id_ADW = 'Merops_apiaster'; % ADW
metaData.links.id_Taxo = '55295'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '66AA3934DBAD18BC'; % avibase
metaData.links.id_birdlife = 'european-bee-eater-merops-apiaster'; % birdlife
metaData.links.id_AnAge = 'Merops_apiaster'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Merops_apiaster}}';
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
bibkey = 'LessAver1989'; type = 'Article'; bib = [ ... 
'author = {C. M. Lessells and M. I. Avery}, ' ... 
'year = {1989}, ' ...
'title = {Hatching Asynchrony in European Bee-Eaters \emph{Merops apiaster}}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {58(3)}, ' ...
'pages = {815-835}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Merops_apiaster/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Merops_apiaster}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=66AA3934DBAD18BC&sec=lifehistory}}';
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


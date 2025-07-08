function [data, auxData, metaData, txtData, weights] = mydata_Lanius_excubitor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Laniidae';
metaData.species    = 'Lanius_excubitor'; 
metaData.species_en = 'Great grey shrike'; 

metaData.ecoCode.climate = {'BSk','Csa','Cfb','Dsa','Dfb'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 14;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 25;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DegePins1992';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 335;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 28.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '60-70 g';

data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs/clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.053	3.002
0.268	3.686
0.443	5.051
0.523	3.687
0.695	4.098
0.904	3.280
0.909	4.781
1.042	6.283
1.048	7.920
1.171	6.556
1.251	5.329
1.347	8.331
1.383	6.558
1.561	8.605
1.597	6.832
1.755	3.694
1.759	4.649
1.938	7.379
2.019	6.152
2.024	7.516
2.028	8.608
2.123	11.474
2.402	6.290
2.409	8.201
2.461	10.930
2.493	8.065
2.669	9.840
2.742	6.565
2.919	8.477
2.926	10.387
2.933	12.161
3.022	13.390
3.072	3.838
3.092	9.160
3.102	12.025
3.106	13.117
3.225	10.662
3.272	12.026
3.278	13.527
3.454	15.302
3.475	9.299
3.627	16.122
3.815	9.573
3.913	12.985
3.969	16.670
4.011	5.072
4.122	12.168
4.136	15.852
4.165	24.039
4.204	22.948
4.255	13.533
4.321	20.083
4.410	21.312
4.416	22.949
4.450	8.895
4.471	14.626
4.620	20.631
4.694	17.493
4.899	15.447
4.967	22.406
4.988	16.676
4.995	6.851
4.995	18.586
5.012	23.362
5.132	21.179
5.332	17.906
5.333	18.042
5.338	19.407
5.341	20.362
5.397	23.910
5.411	16.269
5.422	19.134
5.434	22.409
5.516	21.727
5.516	21.727
5.543	17.361
5.543	17.361
5.641	20.909
5.682	20.637
5.693	23.502
5.775	22.684
5.815	22.002
5.829	25.823
5.941	21.593
6.001	26.506
6.004	27.325
6.122	24.733
6.146	31.419
6.216	27.189
6.237	21.458
6.288	11.907
6.338	25.689
6.370	22.824
6.375	24.188
6.415	23.643
6.458	35.378
6.531	20.369
6.754	34.970
6.844	24.737
6.845	13.275
6.875	21.462
6.893	26.511
6.896	27.330
6.930	24.874
6.955	43.431
6.955	31.969
6.959	33.061
7.074	29.650
7.181	35.518
7.254	32.244
7.277	26.922
7.326	28.697
7.454	40.569
7.481	24.604
7.535	39.478
7.541	17.782
7.574	26.924
7.590	19.692
7.592	43.571
7.595	44.254
7.684	22.149
7.786	26.789
7.800	30.746
7.983	34.295
8.073	35.523
8.087	27.882
8.089	40.026
8.161	36.343
8.227	31.294
8.255	38.936
8.508	38.391
8.653	31.706
8.661	33.889
8.734	18.880
8.779	31.161
9.095	36.212
9.260	34.984
9.295	32.801
9.413	41.944
9.416	42.763
9.419	43.582
9.422	44.401
9.457	30.619
9.580	41.127
9.672	31.439
9.742	38.944
9.763	21.342
10.010	42.630
10.207	50.136
10.237	46.725
10.283	47.544
10.312	32.125
10.356	44.269
10.372	48.636
10.577	23.257
10.597	40.587
10.637	39.768
10.738	44.272
10.780	32.400
10.796	36.903
11.113	42.090
11.248	44.274
11.423	45.640
11.436	37.726
11.525	38.818
11.567	50.280
11.580	42.093
11.717	44.823
11.798	43.732
11.881	54.921
11.892	46.188
11.938	47.007
11.939	47.417
12.097	44.006
12.186	45.371
12.260	42.370
12.264	43.462
12.355	45.099
12.548	39.779
12.671	38.415
12.968	38.280
13.092	49.061
13.096	50.152
13.100	51.381
13.244	44.149
13.566	39.375
13.904	50.430
14.077	39.515
14.241	38.015
14.346	43.610
14.506	64.079
14.758	40.064
14.985	55.758
16.072	50.988
16.357	47.442
16.361	48.670
16.838	51.402
16.956	48.673
17.245	46.492
17.522	52.497
18.024	50.317
18.072	51.955
19.497	46.505
20.194	51.284
22.527	50.343
23.204	49.664
23.239	59.352
24.345	48.033
24.739	51.174];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DegePins1992';

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
D1 = 'Scaled functional response varies in time';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3S7BN'; % Cat of Life
metaData.links.id_ITIS = '178511'; % ITIS
metaData.links.id_EoL = '45514264'; % Ency of Life
metaData.links.id_Wiki = 'Lanius_excubitor'; % Wikipedia
metaData.links.id_ADW = 'Lanius_excubitor'; % ADW
metaData.links.id_Taxo = '56639'; % Taxonomicon
metaData.links.id_WoRMS = '1484468'; % WoRMS
metaData.links.id_avibase = '61C2E0E1983E1B16'; % avibase
metaData.links.id_birdlife = 'great-grey-shrike-lanius-excubitor'; % birdlife
metaData.links.id_AnAge = 'Lanius_excubitor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lanius_excubitor}}';
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
bibkey = 'DegePins1992'; type = 'Article'; bib = [ ... 
'author = {A. Allan Degen and Berry Pinshow and Reuven Yosef and Michael Kam and Kenneth A. Nagy}, ' ... 
'year = {1992}, ' ...
'title = {Energetics and Growth Rate of Northern Shrike (\emph{Lanius Excubitor}) Nestlings}, ' ...
'journal = {Ecology}, ' ...
'volume = {73(6)}, ' ...
'pages = {2273-2283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lanius_excubitor/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lanius_excubitor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=61C2E0E1983E1B16&sec=lifehistory}}';
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


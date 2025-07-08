function [data, auxData, metaData, txtData, weights] = mydata_Calidris_pusilla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_pusilla'; 
metaData.species_en = 'Semipalmated  sandpiper'; 

metaData.ecoCode.climate = {'Dfc','ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 20;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '18-22 d';
data.tx = 19;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 57;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.3*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'avibase';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 6.9;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 4.4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'avibase';
data.Wwi = 27;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'avibase';
data.Wwim = 25; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.145	4.785
0.298	5.044
0.529	5.406
0.611	4.468
0.648	4.828
0.842	4.633
0.918	4.803
0.921	4.301
0.923	4.092
0.952	5.763
0.953	5.653
0.955	5.161
0.956	5.020
0.956	4.910
0.992	5.409
0.993	5.262
1.036	4.508
1.041	3.788
1.300	5.656
1.306	4.636
1.340	5.426
1.346	4.473
1.347	4.267
1.380	5.279
1.381	5.037
1.383	4.727
1.536	4.901
1.537	4.728
1.578	4.474
1.757	7.276
1.769	4.808
1.806	5.166
1.808	4.729
1.810	4.402
1.842	5.536
1.847	4.626
1.962	4.903
2.001	4.783
2.002	4.627
2.031	6.481
2.033	6.099
2.065	7.777
2.074	5.568
2.081	4.403
2.114	5.269
2.117	4.824
2.120	4.331
2.140	8.403
2.144	7.279
2.150	5.772
2.151	5.693
2.154	5.014
2.156	4.745
2.159	4.237
2.192	5.155
2.194	4.918
2.199	4.099
2.311	4.732
2.348	4.865
2.424	5.271
2.460	5.727
2.463	5.086
2.500	5.525
2.505	4.554
2.531	7.203
2.537	5.696
2.545	4.382
2.620	4.787
2.622	4.322
2.806	6.105
2.809	5.512
2.851	4.842
2.852	4.736
3.066	8.793
3.068	8.321
3.072	7.288
3.074	6.821
3.074	6.617
3.079	5.669
3.081	5.203
3.082	5.104
3.083	4.924
3.084	4.685
3.108	7.984
3.109	7.788
3.111	7.129
3.115	6.158
3.116	6.041
3.117	5.828
3.119	5.409
3.123	4.596
3.157	5.530
3.158	5.320
3.194	5.909
3.230	6.455
3.230	6.297
3.244	3.852
3.247	3.478
3.379	7.877
3.429	5.177
3.430	5.036
3.465	5.656
3.501	6.230
3.505	5.532
3.508	4.899
3.541	5.977
3.571	8.303
3.812	6.013
3.853	5.520
3.882	7.795
3.958	8.148
3.993	9.176
4.036	7.949
4.072	8.565
4.073	8.355
4.116	7.119
4.118	6.792
4.154	7.298
4.344	8.289
4.345	7.865
4.809	8.023
4.812	7.184
4.915	11.177
4.922	8.814
4.941	4.543
4.958	9.683
4.965	7.657
4.974	5.422
5.000	8.647
5.000	8.481
5.005	7.127
5.011	5.842
5.012	5.605
5.034	10.065
5.036	9.420
5.041	8.004
5.048	6.242
5.068	12.078
5.076	9.164
5.082	7.327
5.084	6.838
5.270	8.673
5.350	7.985
5.351	7.661
5.352	7.330
5.359	5.796
5.392	7.130
5.421	10.042
5.692	9.991
5.809	9.720
6.083	8.469
6.084	8.284
6.120	9.100
6.151	11.863
6.154	10.652
6.155	10.080
6.165	7.237
6.190	11.701
6.195	9.645
6.503	10.196
6.504	9.702
6.540	10.746
7.073	14.732
7.078	12.176
7.079	11.747
7.080	11.147
7.081	10.783
7.085	9.471
7.112	14.332
7.114	13.413
7.152	13.713
7.163	9.290
7.580	12.665
7.975	9.249
7.998	16.157
7.999	15.804
8.072	18.449
8.073	17.555
8.081	13.028
8.083	12.396
8.117	14.271
8.118	13.730
8.126	10.388
8.159	12.886
8.161	11.796
8.346	16.075
8.352	12.818
8.466	13.698
8.668	10.225
8.778	12.825
8.816	13.185
8.927	15.435
8.940	9.786
8.975	10.900
9.009	13.188
9.011	12.207
9.048	12.830
9.053	10.663
9.064	7.324
9.078	17.675
9.093	10.230
9.391	15.317
9.395	13.195
9.396	12.835
9.402	10.263
10.157	20.208
10.157	19.876
10.165	14.873
10.166	14.468
10.206	13.805
10.242	15.291
11.090	16.861
11.091	16.088
11.093	14.891
11.097	13.151
11.125	18.936
11.133	14.446
11.635	14.616
12.051	20.369
12.091	19.490
12.092	18.545
12.094	17.260
12.136	15.456
12.978	20.849
12.979	20.338
13.018	19.949
13.058	18.671
13.060	17.329
13.062	16.173
13.065	14.765
14.175	22.312
14.257	18.700
15.257	22.344
16.222	23.253
16.225	21.405
17.075	21.907
17.109	25.642
18.386	23.971];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Safr1975'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';     
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'PK4G'; % Cat of Life
metaData.links.id_ITIS = '176667'; % ITIS
metaData.links.id_EoL = '45509225'; % Ency of Life
metaData.links.id_Wiki = 'Calidris_pusilla'; % Wikipedia
metaData.links.id_ADW = 'Calidris_pusilla'; % ADW
metaData.links.id_Taxo = '53744'; % Taxonomicon
metaData.links.id_WoRMS = '159055'; % WoRMS
metaData.links.id_avibase = 'F35821AAC21FFF20'; % avibase
metaData.links.id_birdlife = 'semipalmated-sandpiper-calidris-pusilla'; % birdlife
metaData.links.id_AnAge = 'Calidris_pusilla'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calidris_pusilla}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F35821AAC21FFF20&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HickGrat2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.semsan.01}, ' ...
'author = {Hicklin, P. and C. L. Gratto-Trevor}, ' ... 
'year = {2020}, ' ...
'title = {Semipalmated Sandpiper (\emph{Calidris pusilla}), version 1.0. In Birds of the World (A. F. Poole, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Safr1975'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1364130}, ' ...
'title = {On the Significance of Clutch Size in Nidifugous Birds}, ' ...
'journal = {Ecology}, ' ...
'volume = {56(3)}, ' ...
'year = {1975}, ' ...
'author = {Uriel N. Safriel}, ' ...
'pages = {703-708}'];
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


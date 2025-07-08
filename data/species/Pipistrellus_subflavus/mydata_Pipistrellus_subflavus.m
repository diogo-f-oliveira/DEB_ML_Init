function [data, auxData, metaData, txtData, weights] = mydata_Pipistrellus_subflavus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Pipistrellus_subflavus'; 
metaData.species_en = 'Tricolored bat'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 29]; 


%% set data
% zero-variate data

data.tg = 44;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tp = 212;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.8*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'HoyiKunz1998';
data.Wwx = 5.2; units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'AnAge';
data.Wwi = 7.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 4 to 10 g';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data 
data.tW = [ ... time (d), weight (g)
0.393	1.764
0.892	1.360
0.902	1.926
0.907	2.195
1.029	0.970
1.031	1.077
1.033	1.172
1.185	1.576
1.189	1.778
1.483	2.088
1.904	1.360
1.913	1.872
2.283	2.330
2.336	1.253
2.629	1.495
2.715	2.249
2.784	2.074
2.923	1.778
3.081	2.519
3.144	1.993
3.210	1.657
3.214	1.845
3.422	1.360
3.441	2.438
3.446	2.694
3.509	2.182
3.813	3.003
4.011	1.966
4.076	1.535
4.099	2.815
4.456	2.572
4.522	2.236
4.670	2.411
4.683	3.165
4.947	1.751
4.966	2.788
5.170	2.088
5.607	2.276
5.611	2.505
5.766	3.071
5.820	2.034
5.989	3.380
6.058	3.219
6.194	2.761
6.544	2.088
6.692	2.290
6.696	2.505
6.706	3.071
6.714	3.502
7.191	1.912
7.278	2.707
7.289	3.327
7.346	2.478
7.482	2.034
7.503	3.165
7.716	2.976
8.143	2.572
8.147	2.801
8.162	3.623
8.230	3.380
9.015	2.842
9.308	3.044
9.447	2.747
9.465	3.717
9.677	3.502
9.962	3.246
10.188	3.731
10.249	3.111
10.836	3.596
10.977	3.407
11.346	3.825
11.410	3.367
11.769	3.205
11.833	2.774
11.918	3.502
11.995	3.731
12.056	3.111
12.209	3.582
12.560	2.990
12.873	4.323
12.928	3.380
13.012	4.000
13.081	3.811
13.164	4.431
13.303	4.135
13.581	3.515
13.649	3.259
14.018	3.704
14.100	4.229
14.231	3.448
14.444	3.232
14.818	3.933
14.966	4.135
15.182	4.067
15.964	3.340
16.063	4.835
16.116	3.744
16.175	3.003
16.639	4.727
16.831	3.340
17.065	4.296
17.069	4.512
17.206	4.094
17.361	4.660
17.416	3.704
17.564	3.906
17.992	3.569
17.999	3.933
18.068	3.771
18.146	4.081
18.299	4.566
18.725	4.148
18.882	4.808
18.886	5.037
19.089	4.296
19.165	4.471
19.958	4.377
20.174	4.283
20.237	3.811
20.255	4.768
21.032	3.811
21.036	4.000
21.049	4.727
21.255	4.148
21.342	4.956
21.484	4.781
21.764	4.310
22.149	5.576
22.278	4.741
22.863	5.091
22.985	3.825
22.988	4.000
23.070	4.579
23.077	4.916
23.137	4.269
23.207	4.162
23.228	5.279
23.949	5.212
23.993	3.650
24.062	3.461
24.378	4.902
24.661	4.579
24.964	5.374
25.177	5.118
25.662	4.000
25.809	4.121
25.811	4.215
25.812	4.296
25.821	4.781
25.886	4.350
25.902	5.279
26.123	5.508
26.127	5.684
26.988	5.333
27.050	4.781
27.696	4.539
28.142	5.212
28.636	4.525
28.795	5.347
29.146	4.781
29.161	5.589
29.816	5.805
30.090	4.970
30.093	5.145
30.096	5.320
30.732	4.512
31.105	5.158
31.898	5.010
31.944	3.596
32.107	4.620
32.122	5.414
32.123	5.508
32.913	5.212
32.978	4.822
35.012	5.347
35.932	4.229
36.022	5.253
38.194	5.428
39.349	5.320
42.095	5.253
43.831	5.320
43.990	6.128
44.987	5.320
45.938	5.899
46.072	5.320
47.973	6.505];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', ' wet weight'};  
temp.tW   = C2K(34);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HoyiKunz1998';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7KKBQ'; % Cat of Life
metaData.links.id_ITIS = '180025'; % ITIS
metaData.links.id_EoL = '327665'; % Ency of Life
metaData.links.id_Wiki = 'Pipistrellus_subflavus'; % Wikipedia
metaData.links.id_ADW = 'Pipistrellus_subflavus'; % ADW
metaData.links.id_Taxo = '169457'; % Taxonomicon
metaData.links.id_WoRMS = '1505225'; % WoRMS
metaData.links.id_MSW3 = '13802110'; % MSW3
metaData.links.id_AnAge = 'Perimyotis_subflavus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pipistrellus_subflavus}}';
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
bibkey = 'HoyiKunz1998'; type = 'Article'; bib = [ ... 
'author = {K. M. Hoying and T. H. Kunz}, ' ... 
'year = {1998}, ' ...
'title = {Variation in size at birth and post-natal growth in the insectivorous bat \emph{Pipistrellus subflavus} ({C}hiroptera: {V}espertilionidae)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {245}, ' ...
'pages = {15--27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pipistrellus_subflavus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


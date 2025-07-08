function [data, auxData, metaData, txtData, weights] = mydata_Calidris_alpina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_alpina'; 
metaData.species_en = 'Dunlin'; 

metaData.ecoCode.climate = {'ET', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 25];              
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

data.ab = 21;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'StieSche1989';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.8*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 8.5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'StieSche1989';
data.Wwi = 48.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'StieSche1989';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.316	7.759
0.358	6.596
0.444	7.127
0.935	8.088
1.001	6.290
1.274	7.459
1.504	9.792
1.605	7.042
2.151	9.380
2.186	8.429
2.221	7.477
2.240	9.805
2.497	11.397
2.525	10.657
2.567	12.351
2.899	9.077
3.004	11.936
3.339	8.556
3.397	9.827
3.923	9.837
3.978	11.213
4.009	10.367
4.297	13.970
4.313	13.547
4.547	15.774
4.582	14.822
4.999	14.936
5.135	14.092
5.166	16.103
5.634	11.985
5.918	15.694
6.210	19.191
7.632	23.450
8.006	21.870
8.037	23.881
8.166	20.391
8.170	23.143
8.489	20.186
8.863	24.320
8.891	23.579
9.374	24.752
9.569	25.179
10.235	24.239
15.603	27.090
18.179	37.191
18.615	31.061
19.106	32.022
20.649	33.003
26.115	38.925
26.633	33.432
26.789	32.059
26.843	42.007
27.034	39.683
27.100	35.028
27.665	39.694
28.039	40.971
28.219	38.964
28.472	34.947
28.846	39.081
28.850	36.118
29.002	34.851
29.126	37.182
29.446	39.939
29.477	39.093
29.711	44.177
29.757	42.908
29.972	37.091
30.011	36.034
30.541	35.938
30.708	37.105
30.790	34.884
31.515	38.072
31.682	42.097
33.069	35.879
33.455	36.838
33.829	40.972
34.514	39.504
35.485	41.744
35.656	39.948
36.731	42.190
39.439	40.124
59.608	46.952
65.581	44.841
70.720	45.359
75.185	44.172
80.323	44.691
102.569	38.013
106.384	48.771
106.559	44.012
111.573	50.772
111.850	43.264
116.805	48.752
116.809	45.789];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'StieSche1989';

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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'PK42'; % Cat of Life
metaData.links.id_ITIS = '176661'; % ITIS
metaData.links.id_EoL = '45509239'; % Ency of Life
metaData.links.id_Wiki = 'Calidris_alpina'; % Wikipedia
metaData.links.id_ADW = 'Calidris_alpina'; % ADW
metaData.links.id_Taxo = '53732'; % Taxonomicon
metaData.links.id_WoRMS = '159047'; % WoRMS
metaData.links.id_avibase = '15369E8EB4CBD064'; % avibase
metaData.links.id_birdlife = 'dunlin-calidris-alpina'; % birdlife
metaData.links.id_AnAge = 'Calidris_alpina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calidris_alpina}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calidris_alpina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StieSche1989'; type = 'Book'; bib = [ ...  
'title = {Der Alpenstrandl\"{a}ufer \emph{Calidris alpina}}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'year = {1989}, ' ...
'author = {Stiefel, A. and Scheufler, H.}, ' ...
'volume = {592}, ' ...
'series = {Die Neue Brehm B\"{u}cherei}, ' ...
'address = {Wittenberg Lutherstadt}'];
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


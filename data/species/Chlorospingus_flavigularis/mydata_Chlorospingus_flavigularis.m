function [data, auxData, metaData, txtData, weights] = mydata_Chlorospingus_flavigularis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Passerellidae';
metaData.species    = 'Chlorospingus_flavigularis'; 
metaData.species_en = 'Yellow-throated bush tanager'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 17;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SancLond2016';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SancLond2016';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.3;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SancLond2016';
data.Wwi = 22;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SancLond2016';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SancLond2016';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr assumed';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.609	1.206
0.609	1.950
0.609	2.293
0.610	2.579
0.610	2.922
0.610	3.437
1.653	3.789
1.655	6.650
1.670	3.503
1.670	4.133
1.671	5.334
1.672	6.364
1.688	4.705
1.688	4.876
1.689	5.792
1.689	6.078
1.705	4.362
2.664	10.090
2.731	5.686
2.731	6.487
2.732	6.944
2.732	7.345
2.732	7.745
2.733	8.375
3.724	10.099
3.725	11.014
3.743	12.101
3.774	7.296
3.775	8.040
3.775	8.898
3.776	9.356
4.749	9.993
4.749	10.508
4.749	10.622
4.750	11.023
4.781	6.847
4.800	9.078
4.800	9.192
4.801	9.421
4.801	9.593
4.801	9.764
4.804	14.627
4.817	7.705
4.817	8.392
4.817	8.849
4.821	14.341
5.743	15.379
5.743	15.722
5.743	16.180
5.743	16.294
5.761	16.752
5.777	14.178
5.777	14.464
5.777	14.692
5.792	11.832
5.792	12.175
5.794	13.663
5.828	13.263
6.735	18.876
6.735	19.105
6.786	16.932
6.786	17.447
6.786	17.675
6.787	17.847
6.804	18.133
6.804	18.477
6.819	14.243
6.819	14.472
6.820	15.445
6.820	15.845
7.812	18.599
7.812	18.599
7.812	19.457
7.813	20.601
7.846	17.741
7.846	18.085
7.846	18.371
7.880	16.025
7.880	16.369
7.880	16.769
7.880	16.998
8.872	18.837
8.873	21.525
8.874	21.812
8.889	18.265
8.890	21.068
8.905	16.949
9.828	20.275
9.846	21.648
9.846	21.934
9.864	22.506
9.865	23.421
10.887	19.025
10.887	19.597
10.887	19.883
10.887	19.997
10.888	20.455
10.905	20.741
10.923	21.256
10.923	21.771
10.941	22.400
11.011	22.744
11.948	22.065
11.966	22.466
11.966	22.752
11.966	23.038
12.017	20.979
12.017	21.380
12.972	21.216
12.989	20.701
12.990	21.960
12.991	22.646
12.991	23.104
12.991	23.504
13.009	24.362
14.031	20.366];
n = size(data.tW,1);
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SancLond2016';

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
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5Y8ZR'; % Cat of Life
metaData.links.id_ITIS = '559234'; % ITIS
metaData.links.id_EoL = '45511959'; % Ency of Life
metaData.links.id_Wiki = 'Chlorospingus_flavigularis'; % Wikipedia
metaData.links.id_ADW = 'Chlorospingus_flavigularis'; % ADW
metaData.links.id_Taxo = '86344'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3B14D5D64BDFCAB0'; % avibase
metaData.links.id_birdlife = 'yellow-throated-bush-tanager-chlorospingus-flavigularis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlorospingus_flavigularis}}';
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
bibkey = 'SancLond2016'; type = 'Article'; bib = [ ... 
'doi = {10.1676/15-144.1}, ' ...
'author = {M. A. S\''{a}nchez-Mart\''{i}nez and G. A. Londo\~{n}o}, ' ... 
'year = {2016}, ' ...
'title = {Nesting Behavior of Three Species of \emph{Chlorospingus} (\emph{C. flavigularis}, \emph{C. Flavopectus}, and \emph{C. parvirostris}) In Southeastern {P}eru}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {128}, ' ...
'number = {4}, '...
'pages = {784-793}'];
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


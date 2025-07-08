function [data, auxData, metaData, txtData, weights] = mydata_Phlogophilus_harterti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Phlogophilus_harterti'; 
metaData.species_en = 'Peruvian piedtail';

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biHs','bxCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'DaviJank2018';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 23;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DaviJank2018';   
  temp.tx = C2K(38.1); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 69;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.62;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DaviJank2018';
data.Wwi = 3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'DaviJank2018';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DaviJank2018';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.000	1.621
0.000	1.655
0.000	1.695
0.000	1.724
0.000	1.754
0.900	1.656
1.000	1.705
1.000	1.730
1.000	1.769
1.000	1.803
1.950	1.750
1.950	1.789
2.000	1.819
2.000	1.858
2.000	1.897
2.850	1.829
2.850	1.981
2.900	1.883
2.900	1.912
2.950	1.863
3.800	1.917
3.850	1.873
3.850	1.952
3.950	1.996
3.950	2.100
4.850	2.120
4.850	2.144
4.950	2.036
4.950	2.066
4.950	2.080
4.950	2.208
5.850	2.396
5.950	2.164
5.950	2.342
6.050	2.110
6.850	2.381
6.950	2.357
7.000	2.258
7.000	2.460
7.050	2.219
7.850	2.500
7.950	2.475
7.950	2.539
7.950	2.554
7.950	2.662
8.000	2.308
8.900	2.387
8.950	2.313
8.950	2.500
8.950	2.579
8.950	2.727
8.950	2.801
9.900	2.717
9.900	2.737
9.900	2.776
10.000	2.402
10.000	2.865
11.000	2.555
11.000	2.594
11.000	2.791
11.000	2.914
11.050	2.717
11.050	2.964
11.950	2.550
11.950	2.609
11.950	2.939
11.950	3.003
12.000	2.811
12.000	2.875
12.000	2.910
12.950	2.994
13.000	2.762
13.000	2.811
13.000	3.058
13.000	3.087
14.050	2.925
14.050	2.964
14.050	3.028
14.050	3.058
14.950	2.940
14.950	2.979
14.950	3.004
14.950	3.029
15.000	3.122
15.000	3.201
15.150	3.098
15.950	2.920
15.950	2.955
15.950	3.088
15.950	3.147
15.950	3.182
16.050	2.773
16.950	2.802
17.000	2.955
17.000	3.241
17.050	3.137
17.100	3.000
17.900	2.995
17.900	3.049
18.000	2.862
18.100	3.374
19.000	3.025
19.000	3.064
19.000	3.108
19.050	3.005
19.900	2.941
19.950	2.862
20.000	2.981
20.000	3.074
20.950	3.134
20.950	3.202
21.000	2.818
21.000	3.040
21.000	3.099
21.950	3.218
21.950	3.282
22.000	2.956
22.000	3.006
22.000	3.045
23.000	2.893
23.000	3.016
23.000	3.050
23.000	3.114];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-6;end;end
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(38.1); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DaviJank2018';

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
metaData.links.id_CoL = '6VC6T'; % Cat of Life
metaData.links.id_ITIS = '555196'; % ITIS
metaData.links.id_EoL = '45512334'; % Ency of Life
metaData.links.id_Wiki = 'Phlogophilus_harterti'; % Wikipedia
metaData.links.id_ADW = 'Phlogophilus_harterti'; % ADW
metaData.links.id_Taxo = '55096'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'BDFF6CEB86CEB666'; % avibase
metaData.links.id_birdlife = 'peruvian-piedtail-phlogophilus-harterti'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phlogophilus_harterti}}';
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
bibkey = 'DaviJank2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jofo.12275}, ' ...
'author = {Santiago David and Jill E. Jankowski and Gustavo A. Londo\~{n}o}, ' ... 
'year = {2018}, ' ...
'title = {Combining multiple sources of data to uncover the natural history of an endemic {A}ndean hummingbird, the {P}eruvian Piedtail (\emph{Phlogophilus harterti})}, ' ...
'journal = {J. Field Ornithol.}, ' ...
'volume = {89}, ' ...
'pages = {315-325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/45512334}}';
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


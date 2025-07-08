function [data, auxData, metaData, txtData, weights] = mydata_Cryptotis_parva

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Cryptotis_parva'; 
metaData.species_en = 'North American least shrew'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 05 24]; 

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '21 to 23 d';
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 40;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '40 d for females, 43 for males';
data.am = 3.2*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.34; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Cona1958';
data.Wwx = 3.85;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 4.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 3*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 or more litters per yr, 3 to 6 young per litter';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.316	0.309
0.320	0.385
0.931	0.581
1.028	0.528
1.936	0.656
2.235	0.611
2.338	0.671
2.843	0.754
2.946	0.814
2.949	0.875
3.396	0.792
3.953	0.912
3.955	0.957
3.956	0.980
3.973	1.312
4.111	1.071
4.964	1.108
5.010	1.025
5.068	1.184
5.126	1.350
5.129	1.410
5.172	1.267
5.875	1.289
5.919	1.168
5.980	1.387
5.982	1.440
6.381	1.402
6.958	1.915
6.987	1.508
7.289	1.538
7.927	2.277
8.060	1.923
9.044	2.579
9.074	2.164
9.231	2.307
9.947	2.601
9.999	2.647
10.089	2.428
10.152	2.692
10.185	2.345
10.346	2.563
10.944	2.510
10.961	2.850
10.998	2.593
11.000	2.631
11.053	2.692
11.359	2.790
11.952	2.639
11.969	2.978
11.999	2.563
12.007	2.729
12.975	3.068
13.007	2.706
13.071	2.970
14.029	3.098
15.131	3.113
15.930	3.060
15.934	3.151
15.937	3.211
16.128	3.015
17.088	3.173
18.099	3.369
18.116	3.709
18.938	3.120
19.917	3.678
20.997	4.236
21.015	3.587
21.035	2.983
21.045	3.195
21.898	3.232
22.050	4.251
23.013	3.489
23.969	3.579
24.917	4.499
24.922	4.598
24.978	3.730
25.060	4.364
25.077	4.688
25.906	4.243
26.041	3.941
26.046	4.039
26.048	4.092
27.998	4.016
28.001	4.076
28.060	4.257
28.165	4.348
28.172	4.483
28.899	4.008
29.003	4.091
29.951	4.023
30.029	3.577
30.044	3.879
30.055	4.083
30.087	3.736
30.351	4.000];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Cona1958';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'T_a is taken high to allow for daily torpor';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'T can drop till 0 C during hibernation';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '323BR'; % Cat of Life
metaData.links.id_ITIS = '179971'; % ITIS
metaData.links.id_EoL = '327371'; % Ency of Life
metaData.links.id_Wiki = 'Cryptotis_parva'; % Wikipedia
metaData.links.id_ADW = 'Cryptotis_parva'; % ADW
metaData.links.id_Taxo = '60864'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700387'; % MSW3
metaData.links.id_AnAge = 'Cryptotis_parva'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cryptotis_parva}}';
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
bibkey = 'Cona1958'; type = 'Article'; bib = [ ... 
'author = {Conaway, C. H.}, ' ... 
'year = {1958}, ' ...
'title = {Maintenance, reproduction and growth of the least shrew in captivity}, ' ...
'journal = {J. Mammalogy}, ' ...
'volume = {39}, ' ...
'pages = {507-512}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cryptotis_parva}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


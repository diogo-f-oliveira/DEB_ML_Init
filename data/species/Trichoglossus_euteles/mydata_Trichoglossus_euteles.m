function [data, auxData, metaData, txtData, weights] = mydata_Trichoglossus_euteles

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Trichoglossus_euteles'; 
metaData.species_en = 'Olive-headed lorikeet'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Trichoglossus haematodus';
data.tx = 55;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Stan2020';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 165;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Trichoglossus haematodus';
data.am = 16*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Stan2020';
data.Wwi = 73.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.180	5.541
1.925	6.043
2.981	6.906
4.286	7.194
5.342	9.209
6.957	8.921
7.888	9.784
9.068	13.237
10.186	14.101
11.366	16.115
12.609	17.554
14.348	18.129
15.652	17.842
16.770	21.007
17.950	21.871
18.944	23.885
20.062	25.036
21.056	27.914
22.360	30.791
23.851	33.094
25.280	36.259
26.149	39.137
27.267	42.878
28.509	46.619
29.689	49.209
31.056	52.086
32.298	54.388
33.540	57.266
34.596	58.993
35.963	60.144
37.267	61.007
38.012	63.309
39.441	63.597
40.248	65.612
41.304	65.899
42.422	68.489
43.727	69.928
44.720	69.640
45.963	67.914
46.894	69.640
48.199	67.914
49.255	70.216
49.752	69.065
51.180	70.216
51.988	71.079
53.106	69.640
53.851	71.079
54.845	70.216];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Stan2020';
  
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
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '58CJX'; % Cat of Life
metaData.links.id_ITIS = '177428'; % ITIS
metaData.links.id_EoL = '1177805'; % Ency of Life
metaData.links.id_Wiki = 'Trichoglossus_euteles'; % Wikipedia
metaData.links.id_ADW = 'Trichoglossus_euteles'; % ADW
metaData.links.id_Taxo = '70548'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '07630935D2DEC38F'; % avibase
metaData.links.id_birdlife = 'olive-headed-lorikeet-trichoglossus-euteles'; % birdlife
metaData.links.id_AnAge = 'Trichoglossus_euteles'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trichoglossus_euteles}}';
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
bibkey = 'Stan2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Carol Stanley}, ' ... 
'year = {2020}, ' ...
'title = {Lorikeets}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {611-622}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Trichoglossus_haematodus_moluccanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=07630935D2DEC38F&sec=lifehistory}}';
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


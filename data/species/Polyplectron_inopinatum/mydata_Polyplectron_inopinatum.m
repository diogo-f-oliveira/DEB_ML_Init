function [data, auxData, metaData, txtData, weights] = mydata_Polyplectron_inopinatum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Polyplectron_inopinatum'; 
metaData.species_en = 'Mountain peacock-pheasant'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 22];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data

data.ab = 20;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(37);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(40.4); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;        units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
comment.tp = 'little is know about the bird, this is a guess.';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Polyplectron napoleonis';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Polyplectron napoleonis';

data.Wwb = 27;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Brun2003';
data.Wwi = 650;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Eric2017';
  comment.Wwi = '650 till 800 g; lower end assumed for females';
data.Wwim = 800;      units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Eric2017';
  comment.Wwi = '650 till 800 g; upper end assumed for males';

data.Ri  = 2/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(40.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Between 16 and 24 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.000	27.111
1.005	25.510
2.039	25.779
3.192	26.979
4.197	29.743
5.232	30.324
6.207	31.219
7.300	35.851
8.305	38.304
9.340	38.885
10.345	39.467
11.468	41.915
12.414	45.930
13.448	49.941
14.424	55.202
15.517	58.275
16.552	59.791
17.498	63.806
18.562	66.880
19.655	66.835
20.749	74.585
21.606	80.163
22.670	78.871
23.734	83.505
24.828	80.965
25.892	87.469
27.901	84.579
29.970	99.774];  
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Brun2003';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.000	26.799
1.064	26.132
2.069	26.090
3.133	27.293
4.138	28.498
5.202	30.014
6.236	32.153
7.182	37.416
8.305	42.047
9.340	44.498
10.315	45.705
11.438	47.842
12.443	51.854
13.360	58.676
14.424	62.686
15.458	68.256
16.552	70.394
17.498	75.968
18.621	79.975
19.567	82.431
20.660	88.622
21.724	93.568
22.788	99.760
23.734	102.216
24.798	110.280
25.862	112.418
27.901	120.754
29.852	128.469];  
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Brun2003';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assume to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '6W5GW'; % Cat of Life
metaData.links.id_ITIS = '176103'; % ITIS
metaData.links.id_EoL = '45516040'; % Ency of Life
metaData.links.id_Wiki = 'Polyplectron_inopinatum'; % Wikipedia
metaData.links.id_ADW = 'Polyplectron_inopinatum'; % ADW
metaData.links.id_Taxo = '53201'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B79C272AEE35468A'; % avibase
metaData.links.id_birdlife = 'mountain-peacock-pheasant-polyplectron-inopinatum'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polyplectron_inopinatum}}';
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
bibkey = 'Brun2003'; type = 'Article'; bib = [ ... 
'author = {D. Brunning}, ' ... 
'year = {2003}, ' ...
'title = {A co-ordinated captive-breeding programme for {R}othschild''s or Mountain peacock pheasant \emph{Polyplectron inopinatum}}, ' ...
'journal = {Int. zoo Yb.}, ' ...
'volume = {38}, ' ...
'pages = {152--159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Polyplectron_napoleonis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/915294/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eric2017'; type = 'Book'; bib = [ ...  
'author = {K. W. Erickson}, ' ...
'year = {2017}, ' ...
'title  = {Feather Craft: The Amazing Birds and Feathers Used in Classic Salmon Flies}, ' ...
'publisher = {Stackpole Books}'];
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


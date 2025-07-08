function [data, auxData, metaData, txtData, weights] = mydata_Acrocephalus_melanopogon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Acrocephalidae';
metaData.species    = 'Acrocephalus_melanopogon'; 
metaData.species_en = 'Moustached warbler'; 

metaData.ecoCode.climate = {'BSk','BSk','Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 10.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Acrocephalus_arundinaceus';
data.am = 11.1*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Acrocephalus_arundinaceus';
  
  
data.Ww0 = 1.6;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 1.1;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tW data';
data.Wwi = 12.6;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)];
0.875	0.914
0.877	1.240
0.879	1.729
1.894	2.696
1.985	1.283
1.987	1.717
1.989	2.152
2.904	2.142
2.955	2.685
2.957	3.228
2.959	3.662
2.961	4.151
2.999	1.653
3.927	4.901
3.930	5.444
3.972	3.978
3.974	4.521
4.013	2.131
4.018	3.543
4.893	5.434
4.897	6.303
4.899	6.738
4.936	4.022
4.938	4.511
4.940	5.000
4.949	7.171
4.951	7.877
4.980	3.099
4.983	3.696
5.970	9.496
5.973	10.256
5.997	4.174
6.013	8.301
6.014	8.518
6.016	8.898
6.047	4.717
6.050	5.314
6.052	5.803
6.053	6.074
6.054	6.509
6.056	6.889
6.058	7.377
6.060	7.812
6.883	8.781
6.884	8.944
6.930	8.454
6.934	9.595
6.985	10.191
7.018	6.390
7.021	7.150
7.023	7.693
7.032	9.919
7.060	4.978
8.003	11.756
8.078	6.271
8.080	6.868
8.088	8.768
8.089	9.148
8.090	9.474
8.092	9.963
8.095	10.506
8.097	11.049
8.123	5.564
8.134	8.279
8.963	10.823
8.964	11.094
8.967	11.854
9.058	10.442
9.103	9.518
9.104	9.953
9.143	7.563
9.145	8.106
9.149	9.083
9.977	11.301
9.979	11.681
10.072	10.812
10.114	9.236
10.115	9.725
10.118	10.377
11.044	12.811
11.085	11.073
11.087	11.561
11.089	12.104
11.091	12.539
11.127	9.498
11.130	10.366
12.051	11.660
12.053	12.203
12.095	10.737
12.097	11.225
12.190	10.356
13.009	10.184
13.019	12.736
13.059	10.673
13.109	11.215
14.071	10.608];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KleiHoi1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% Discussion points
D1 = 'Food availebility initialy lower';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '9L6S'; % Cat of Life
metaData.links.id_ITIS = '558420'; % ITIS
metaData.links.id_EoL = '45515420'; % Ency of Life
metaData.links.id_Wiki = 'Acrocephalus_melanopogon'; % Wikipedia
metaData.links.id_ADW = 'Acrocephalus_melanopogon'; % ADW
metaData.links.id_Taxo = '57231'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E1559C49B1A6C31F'; % avibase
metaData.links.id_birdlife = 'moustached-warbler-acrocephalus-melanopogon'; % birdlife
metaData.links.id_AnAge = 'Acrocephalus_melanopogon'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acrocephalus_melanopogon}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Acrocephalus_melanopogon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E1559C49B1A6C31F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KleiHoi1997'; type = 'Article'; bib = [ ... 
'title = {Nestling growth patterns and antipredator responses: a comparison between four \emph{Acrocephalus} warblers}, ' ...
'journal = {Biologia Bratislave}, ' ...
'year = {1997}, ' ...
'author = {Sonia Kleindorfer and Herbert Hoi and Rotraut Ille}, ' ...
'volume = {52(5)}, ' ...
'pages = {677-685}'];
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


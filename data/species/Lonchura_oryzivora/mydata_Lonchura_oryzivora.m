function [data, auxData, metaData, txtData, weights] = mydata_Lonchura_oryzivora
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Estrildidae';
metaData.species    = 'Lonchura_oryzivora'; 
metaData.species_en = 'Java sparrow'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncfm','Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','bxCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 11];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 33;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'GregBowk2020';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 99;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.5*365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GregBowk2020';
data.Wwi = 24.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';

data.Ri  = 5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g
0.439	2.013
1.693	4.025
2.571	4.282
3.638	5.365
4.767	6.499
5.895	6.652
7.118	7.270
8.279	8.146
9.408	9.074
10.599	10.209
11.885	11.188
12.920	12.064
13.861	14.128
15.115	15.366
16.118	15.519
17.436	16.808
19.129	18.768
20.258	19.644
21.230	19.384
22.171	19.589
23.143	19.536
24.178	18.812
25.432	19.327
27.439	19.169
28.380	22.730
29.540	24.020];
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight', 'ind 1'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GregBowk2020';
%
data.tW1 = [ ... % time (d), weight (g
0.470	1.084
2.697	1.958
4.296	2.317
5.707	2.677
7.808	2.932
9.220	4.479
10.568	5.458
11.760	5.921
12.857	7.572
16.118	9.168
17.028	10.354
18.063	10.817
19.035	10.196
20.164	11.021
21.042	12.207
22.202	11.586
23.300	12.049
24.272	12.977
26.279	13.852
27.408	13.592
29.446	13.693
30.418	14.414
31.422	14.774
32.551	16.115
34.557	16.629
35.686	15.956];
units.tW1 = {'d', 'g'};     label.tW1 = {'time', 'wet weight', 'ind 2'};  
temp.tW1 = C2K(41.6); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'GregBowk2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Individual 1, 2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3VYFC'; % Cat of Life
metaData.links.id_ITIS = '916658'; % ITIS
metaData.links.id_EoL = '45511037'; % Ency of Life
metaData.links.id_Wiki = 'Lonchura_oryzivora'; % Wikipedia
metaData.links.id_ADW = 'Lonchura_oryzivora'; % ADW
metaData.links.id_Taxo = '93951'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '549BEA0C618F1B97'; % avibase
metaData.links.id_birdlife = 'java-sparrow-lonchura-oryzivora'; % birdlife
metaData.links.id_AnAge = 'Lonchura_oryzivora'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lonchura_oryzivora}}';
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
bibkey = 'GregBowk2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Jo Gregson and Andrew Bowkett}, ' ... 
'year = {2020}, ' ...
'title = {Java Sparrows}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {771-777}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lonchura_oryzivora}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=549BEA0C618F1B97&sec=lifehistory}}';
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


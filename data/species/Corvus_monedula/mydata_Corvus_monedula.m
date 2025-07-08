function [data, auxData, metaData, txtData, weights] = mydata_Corvus_monedula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Corvidae';
metaData.species    = 'Corvus_monedula'; 
metaData.species_en = 'Western jackdaw'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 18.2;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'KamiJerz2015';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'varies between 17 and 20 d';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'KamiJerz2015';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Wiki';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data for Corvus frugilegus';

data.Wwb = 11.3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KamiJerz2015';
data.Wwi = 260;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KamiJerz2015';

data.Ri  = 4.9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'KamiJerz2015';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'between 2 and 6 eggs/clutch; rarely 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.132	17.378
0.528	18.125
1.189	22.644
1.717	29.434
2.113	31.692
2.708	39.992
3.170	45.272
3.566	53.575
4.160	61.119
4.226	67.919
4.755	72.441
4.887	78.484
5.349	83.764
5.811	93.577
6.340	100.367
6.604	108.674
6.868	116.225
7.264	126.040
7.660	134.343
8.123	142.646
8.453	147.928
8.783	155.478
9.377	163.022
9.708	168.304
10.368	178.869
10.830	186.416
11.491	193.203
12.151	197.723
12.679	201.489
13.208	206.768
13.670	210.536
14.198	218.081
14.925	225.622
15.519	232.411
16.113	235.420
16.840	243.717
17.434	246.727
17.962	250.494
18.887	259.542
19.811	267.834
20.604	274.618
21.660	274.595
22.453	271.556
23.575	269.264
24.434	268.490
24.962	266.212
25.887	268.459
26.547	262.399
27.538	256.332
28.462	253.290
29.585	250.243
30.906	250.214
31.632	247.176
32.887	244.126
33.745	232.017
35.000	225.945];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KamiJerz2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tp = 5;
weights.Wwb = 5;
weights.Wwi = 5;
weights.Ri = 5;
weights.ab = 5;

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
D1 = 'mod_1: v is reduced; food availability variable in tW data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'X733'; % Cat of Life
metaData.links.id_ITIS = '179746'; % ITIS
metaData.links.id_EoL = '45510000'; % Ency of Life
metaData.links.id_Wiki = 'Coloeus_monedula'; % Wikipedia
metaData.links.id_ADW = 'Corvus_monedula'; % ADW
metaData.links.id_Taxo = '59548'; % Taxonomicon
metaData.links.id_WoRMS = '1461962'; % WoRMS
metaData.links.id_avibase = 'D4C32F8E792B65BA'; % avibase
metaData.links.id_birdlife = 'eurasian-jackdaw-corvus-monedula'; % birdlife
metaData.links.id_AnAge = 'Coloeus_monedula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corvus_monedula}}';
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
bibkey = 'KamiJerz2015'; type = 'Article'; bib = [ ... 
'author = {P. Kami\''{n}ski and L. Jerzak and J. Boehner}, ' ... 
'year = {2015}, ' ...
'title = {NESTLING  DEVELOPMENT OF  JACKDAWS \emph{Corvus monedula} IN  AGRICULTURAL  LANDSCAPE}, ' ...
'journal = {Intern. Stud. Sparrows}, ' ...
'doi = {10.1515/isspar-2015-0030}, ' ...
'volume = {39}, ' ...
'pages = {4--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Corvus_frugilegus}}';
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


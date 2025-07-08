function [data, auxData, metaData, txtData, weights] = mydata_Caluromys_philander

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Caluromyidae';
metaData.species    = 'Caluromys_philander'; 
metaData.species_en = 'Bare-tailed woolly opossum'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCvr', 'xiCvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'pXi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 23]; 


%% set data
% zero-variate data

data.tg = 24;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from Didelphis virginiana';
data.tx = 100;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 304;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 11;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 350; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
 comment.Wwi = 'ADW: 140 till 390 g';
 
data.Ri  = 3*4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 young per litter, 2 litters per yr';

data.pXm  = 3e5; units.pXm  = 'J/d'; label.pXm  = 'food intake at 300 g';     bibkey.pXm  = 'ADW';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length data
data.tL = [ ... time since birth (d), body length (cm)
2.562	1.233
7.460	1.975
12.748	2.607
17.492	2.902
22.507	3.354
27.516	3.694
32.393	4.034
37.394	4.217
42.405	4.579
47.424	5.121
52.811	5.148
57.433	5.622
62.707	6.007
67.451	6.302
72.328	6.620
77.226	7.340];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'body length'};  
temp.tL    = C2K(35);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Atra1995';

% time-weight data
data.tW = [ ... time since birth (d), weight (g)
2.465	0.394
7.912	0.285
12.619	1.020
22.552	1.673
27.374	2.487
32.594	2.273
37.934	2.269
43.036	4.323
48.167	4.584
52.967	7.323
62.952	9.110
67.799	8.052
72.675	10.027
78.052	13.214];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(35);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Atra1995';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7RTG4'; % Cat of Life
metaData.links.id_ITIS = '552530'; % ITIS
metaData.links.id_EoL = '133312'; % Ency of Life
metaData.links.id_Wiki = 'Caluromys_philander'; % Wikipedia
metaData.links.id_ADW = 'Caluromys_philander'; % ADW
metaData.links.id_Taxo = '59811'; % Taxonomicon
metaData.links.id_MSW3 = '10400021'; % Mammal Spec World
metaData.links.id_AnAge = 'Caluromys_philander'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caluromys_philander}}';
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
bibkey = 'Atra1995'; type = 'Article'; bib = [ ... 
'author = {M. Atramentowicz}, ' ... 
'year = {1995}, ' ...
'title = {Growth of pouch young in the bare-taied woolly opossum, \emph{Caluromys philander}}, ' ...
'journal = {J. Morph. Physiol.}, ' ...
'volume = {46}, ' ...
'number = {1}, '...
'pages = {143--211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Caluromys_philander}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Caluromys_philander/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


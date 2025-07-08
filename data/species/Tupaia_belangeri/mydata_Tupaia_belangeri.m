function [data, auxData, metaData, txtData, weights] = mydata_Tupaia_belangeri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Scandentia'; 
metaData.family     = 'Tupaiidae';
metaData.species    = 'Tupaia_belangeri'; 
metaData.species_en = 'Northern treeshrew'; 
metaData.ecoCode.climate = {'Af', 'Cwa', 'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(38.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 25]; 

%% set data
% zero-variate data

data.tg = 46;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from AnAge; Wiki: 40-52 d';
data.tx = 36;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18-25 d';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11.1*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 10; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Wiki: 10-12 g';
data.Wwi = 140;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 190 g';

data.Ri  = 7.5*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 children per litter, 7.5 litters per yr';
  
% univariate data

% time -weight
data.tW = [ ... % time since birth (d), weight (g)
0.637	11.526
1.674	13.305
3.744	15.581
5.710	17.090
7.883	19.622
9.747	21.901
11.922	24.945
13.684	28.508
15.754	30.785
17.929	34.085
19.900	38.928
21.867	41.718
23.837	45.535
25.703	49.866
27.879	53.423
29.850	58.521
31.924	63.362
33.998	68.202
41.457	86.229
48.698	102.857
55.759	118.757
57.931	123.084
100	133.670
120	135.618];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TsanColl1985';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '59LYB'; % Cat of Life
metaData.links.id_ITIS = '573217'; % ITIS
metaData.links.id_EoL = '289557'; % Ency of Life
metaData.links.id_Wiki = 'Tupaia_belangeri'; % Wikipedia
metaData.links.id_ADW = 'Tupaia_belangeri'; % ADW
metaData.links.id_Taxo = '61380'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11900011'; % MSW3
metaData.links.id_AnAge = 'Tupaia_belangeri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tupaia_belangeri}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tupaia_belangeri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TsanColl1985'; type = 'Article'; bib = [ ... 
'author = {W. N. Tsang and P. M. Collins}, ' ... 
'year = {1985}, ' ...
'title = {Techniques for Hand-Rearing Tree-Shrews (\emph{Tupaia belangeri}) From Birth}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {4}, ' ...
'pages = {23-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


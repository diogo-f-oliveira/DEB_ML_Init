function [data, auxData, metaData, txtData, weights] = mydata_Pectinator_spekei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Ctenodactylidae';
metaData.species    = 'Pectinator_spekei'; 
metaData.species_en = 'Speke''s pectinator'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 31]; 

%% set data
% zero-variate data

data.tg = 67;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 11.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Geor2009';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ctenodactylus_gundi';

data.Wwb = 22;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Geor2009';
data.Wwi = 178;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Geor2009';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 cups per litter, 1 litters per yr';

% uni-variate data

% time-weight
data.tW = [ ... % time (d), weight (g)
6.316	28.145
13.104	37.037
21.180	40.739
28.178	50.549
34.773	50.884
41.994	56.416
48.361	63.167
56.002	71.146
62.795	77.594
70.225	84.655
76.595	90.183
83.811	98.161
90.180	103.995
98.456	113.199
104.816	122.701
118.189	135.900
124.991	138.680
139.645	150.357
159.608	165.724
167.682	170.649
174.062	171.899];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW  = C2K(36.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Geor2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

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

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '767NN'; % Cat of Life
metaData.links.id_ITIS = '573203'; % ITIS
metaData.links.id_EoL = '1036121'; % Ency of Life
metaData.links.id_Wiki = 'Pectinator_spekei'; % Wikipedia
metaData.links.id_ADW = 'Pectinator_spekei'; % ADW
metaData.links.id_Taxo = '63641'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13300012'; % MSW3
metaData.links.id_AnAge = 'Pectinator_spekei'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pectinator_spekei}}';
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
bibkey = 'Geor2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1978.tb03313.x}, ' ...
'author = {George, W.}, ' ... 
'year = {2009}, ' ...
'title = {Reproduction in female gundis ({R}odentia: {C}tenodactylidae)}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {185(1)}, ' ...
'pages = {57–71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pectinator_spekei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


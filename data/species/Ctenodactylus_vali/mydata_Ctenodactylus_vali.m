function [data, auxData, metaData, txtData, weights] = mydata_Ctenodactylus_vali

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Ctenodactylidae';
metaData.species    = 'Ctenodactylus_vali'; 
metaData.species_en = 'Val''s gundi'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

data.tg = 67;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Geor2009';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 11.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Geor2009';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ctenodactylus_gundi';

data.Wwb = 19.9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Geor2009';
data.Wwi = 174.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Geor2009';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Geor2009';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 cups per litter, 1 litter per yr';

% uni-variate data

% time-weight data
data.tW = [ ... % time (d), weight (g)
0.000	18.643
6.756	22.035
13.109	34.898
20.104	45.930
27.521	58.798
34.502	75.636
40.867	83.304
48.915	98.925
55.285	104.454
62.505	110.597
69.511	117.046
76.723	126.245
83.745	125.665
90.758	129.362
97.565	130.003
104.346	141.646
111.581	141.066
118.390	141.096
125.403	144.488
133.053	148.494
140.079	146.692
147.097	147.945
153.686	150.724
160.913	153.811
167.294	154.756
174.107	152.952];
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

%% Links
metaData.links.id_CoL = '325NW'; % Cat of Life
metaData.links.id_ITIS = '573200'; % ITIS
metaData.links.id_EoL = '1036118'; % Ency of Life
metaData.links.id_Wiki = 'Ctenodactylus_vali'; % Wikipedia
metaData.links.id_ADW = 'Ctenodactylus_vali'; % ADW
metaData.links.id_Taxo = '63635'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13300006'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ctenodactylus_vali}}';
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


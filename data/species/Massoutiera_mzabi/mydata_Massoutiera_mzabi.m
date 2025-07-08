function [data, auxData, metaData, txtData, weights] = mydata_Massoutiera_mzabi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Ctenodactylidae';
metaData.species    = 'Massoutiera_mzabi'; 
metaData.species_en = 'Mzab gundi'; 

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

data.tg = 73;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '69-79 d';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 11.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Geor2009';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ctenodactylus_gundi';

data.Wwb = 20.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Geor2009';
data.Wwi = 195;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 cups per litter, 1 litters per yr';

% uni-variate data

% time-weight data
data.tW = [ ... % time (d), weight (g)
0.000	22.311
6.324	24.783
13.340	27.259
20.577	26.068
28.008	32.518
34.796	41.105
41.606	40.523
49.232	54.920
56.009	68.396
62.571	82.482
69.787	90.154
76.797	95.074
83.357	110.077
90.583	113.470
97.798	121.448
104.373	130.033
112.016	137.401
119.043	134.987
126.072	131.350
147.366	124.109
153.955	127.194
160.756	130.279
167.978	135.506
174.565	139.202];
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
metaData.links.id_CoL = '3YCGM'; % Cat of Life
metaData.links.id_ITIS = '573202'; % ITIS
metaData.links.id_EoL = '1036120'; % Ency of Life
metaData.links.id_Wiki = 'Massoutiera_mzabi'; % Wikipedia
metaData.links.id_ADW = 'Massoutiera_mzabi'; % ADW
metaData.links.id_Taxo = '168684'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13300010'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Massoutiera_mzabi}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Massoutiera_mzabi/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


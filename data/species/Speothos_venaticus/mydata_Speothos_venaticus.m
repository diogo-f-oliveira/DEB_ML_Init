function [data, auxData, metaData, txtData, weights] = mydata_Speothos_venaticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Speothos_venaticus'; 
metaData.species_en = 'Bush dog'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 04]; 

%% set data
% zero-variate data

data.tg = 68;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 101;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 304;    units.tp = 'd';    label.tp = 'time since birth at puberty for female';bibkey.tp = 'AnAge';
  temp.tp = C2K(38.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.1*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(38.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 160;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 2*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, 2 litters per yr';
  
% uni-variate data
% time-weight data
tWWWW = [ ... % time dince birth (d), weight of 3 cubs (g), first female, then 3 males
 1 120 170 170 170
 2 161 154 154 161
 4 112  98  98 112
 6 126 126 112 126
 8 112 126 112 126
10 119 140 112 120
12 140 154 140 140
14 140 168 140 140
16 126 168 154 168
18 182 182 185 182
20 182 252 196 210
22 224 280 238 238
24 252 294 308 294
26 280 350 336 308
28 322 406 378 364
30 336 420 392 378
32 420 462 462 448
34 448 476 476 476
36 490 490 448 476
38 490 448 462 476
40 532 576 504 546]; 
%
data.tW1 = tWWWW(:,[1 2]);
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1  = C2K(38.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'CollEmer1973';
comment.tW1 = 'data for female';
%
data.tW2 = tWWWW(:,[1 3]);
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2  = C2K(38.8);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'CollEmer1973';
comment.tW2 = 'data for male';
%
data.tW3 = tWWWW(:,[1 4]);
units.tW3  = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3  = C2K(38.8);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'CollEmer1973';
comment.tW3 = 'data for male';
%
data.tW4 = tWWWW(:,[1 5]);
units.tW4  = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4  = C2K(38.8);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'CollEmer1973';
comment.tW4 = 'data for male';

data.tW5 = [ ... % time since birth (d), weight (g)
0.058	269.492
9.779	429.366
19.887	745.635
29.131	970.881
40.072	1286.879
50.038	1674.933
61.400	2245.142
70.677	2568.203
81.861	3105.861
101.215	3653.898];
units.tW5  = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight'};  
temp.tW5  = C2K(38.8);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5 = 'Jant1973';
%
data.tW6 = [ ... % time since birth (d), weight (g)
3.049	242.430
9.935	396.706
19.690	654.395
29.635	983.760
40.715	1214.930
50.865	1655.098
61.495	2036.415
70.230	2235.740
81.412	2766.877
101.208	3145.204];
units.tW6  = {'d', 'g'};  label.tW6 = {'time since birth', 'wet weight'};  
temp.tW6  = C2K(38.8);  units.temp.tW6 = 'K'; label.temp.tW6 = 'temperature';
bibkey.tW6 = 'Jant1973';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4','tW5','tW6'}; subtitle1 = {'data for 4 cubs from LA, 2 from Frankfurt Zoo'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Neonate feeding at LA Zoo is initially reduced';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4YJ85'; % Cat of Life
metaData.links.id_ITIS = '183829'; % ITIS
metaData.links.id_EoL = '328687'; % Ency of Life
metaData.links.id_Wiki = 'Speothos_venaticus'; % Wikipedia
metaData.links.id_ADW = 'Speothos_venaticus'; % ADW
metaData.links.id_Taxo = '66499'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000836'; % MSW3
metaData.links.id_AnAge = 'Speothos_venaticus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Speothos_venaticus}}';
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
bibkey = 'CollEmer1973'; type = 'Article'; bib = [ ... 
'author = {Collier, C. and Emerson, S.}, ' ... 
'doi = {10.1111/j.1748-1090.1973.tb02129.x}, ' ...
'year = {1973}, ' ...
'title = {Hand-raising Bush dogs \emph{Speothos venaticus} at the {L}os {A}ngeles {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {13}, ' ...
'pages = {139-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jant1973'; type = 'Article'; bib = [ ... 
'author = {Jantschke, F.}, ' ... 
'doi = {10.1111/j.1748-1090.1973.tb02130.x}, ' ...
'year = {1973}, ' ...
'title = {On the breeding and rearing of Bush dogs \emph{Speothos venaticus} at {F}rankfurt {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {13}, ' ...
'pages = {141-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Speothos_venaticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Speothos_venaticus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


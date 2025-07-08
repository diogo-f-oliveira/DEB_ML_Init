function [data, auxData, metaData, txtData, weights] = mydata_Chelonoidis_niger
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Chelonoidis_niger'; 
metaData.species_en = 'Galapagos tortoise'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 11];

%% set data
% zero-variate data

data.ab = 8*30.5;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'Wiki';
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '9 till 12 mnth';
data.tp = 22.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female';      bibkey.tp = 'Wiki';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '20 till 25 yr';
data.am = 177*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 6;  units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Wiki';
data.Li = 187;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'Wiki';

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 57.5 mm: pi/6*5.75^3';
data.Wwi = 417e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'Wiki';

data.Ri  = 16/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
94.459	101.538
182.323	178.002
278.983	304.613
366.881	531.078
428.429	782.104
549.270	1009.118
639.402	1410.620
731.774	2012.160
852.768	2939.176
912.176	3440.166
1006.821	4391.744
1097.057	5268.248
1191.637	5919.824
1310.550	7371.806
1370.001	8072.797
1462.566	9549.339];
units.tW   = {'d', 'cm'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RitzHamm2010';
comment.tW = 'temp is guessed';
  
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

%% Facts
F1 = 'herbivores: cacti, grasses, leaves, lichens, berries, melons, oranges, and milkweed';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'males often larger than females';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Juvenile tortoises eat an average of 16.7% of their own body weight in dry matter per day';
metaData.bibkey.F3 = 'Wiki'; 
F4 = ' Galapagos finch and mockingbirds clean insects and parasites';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '5Y2Z9'; % Cat of Life
metaData.links.id_ITIS = '949447'; % ITIS
metaData.links.id_EoL = '49802838'; % Ency of Life
metaData.links.id_Wiki = 'Chelonoidis_niger'; % Wikipedia
metaData.links.id_ADW = 'Testudo_typica'; % ADW
metaData.links.id_Taxo = '4682952'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chelonoidis&species=niger'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelonoidis_nigra}}';
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
bibkey = 'RitzHamm2010'; type = 'Article'; bib = [ ... 
'author = {J. Ritz and C. Hammer and M. Clauss}, ' ... 
'year = {2010}, ' ...
'title = {Body Size Development of Captive and Free-Ranging Leopard Tortoises (\emph{Geochelone pardalis})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {29}, ' ...
'pages = {517-525}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Geochelone_nigra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/163449/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Pardofelis_marmorata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Pardofelis_marmorata'; 
metaData.species_en = 'Marbled cat'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 10]; 

%% set data
% zero-variate data

data.tg = 74;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '66 till 82 d';
data.tx = 59;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13.4*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 85;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = 'ADW: 2.4 and 5 kg';
  
data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litters per yr';
  
% uni-variate data
% t-W data 
data.tW = [ ... % time (d), female body weight (g)
  2  100
  4  115
  7  140
 10  170
 14  185
 17  200
 28  225
 35  300
 42  340
 49  425
 56  470
 70  680
 83  925
 98 1105
112 1400
152 1925
183 2155
244 2875
274 3095
305 3405
];
units.tW = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW  = C2K(37.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Barn1976';
comment.tW = 'data for a male cup';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males may be slightly larger than females';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DJJ2'; % Cat of Life
metaData.links.id_ITIS = '621872'; % ITIS
metaData.links.id_EoL = '311554'; % Ency of Life
metaData.links.id_Wiki = 'Pardofelis_marmorata'; % Wikipedia
metaData.links.id_ADW = 'Pardofelis_marmorata'; % ADW
metaData.links.id_Taxo = '169207'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000177'; % MSW3
metaData.links.id_AnAge = 'Pardofelis_marmorata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pardofelis_marmorata}}';
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
bibkey = 'Barn1976'; type = 'Article'; bib = [ ... 
'author = {Barnes, R. G}, ' ... 
'doi = {10.1111/j.1748-1090.1976.tb00179.x}, ' ...
'year = {1976}, ' ...
'title = {Breeding and hand-rearing of the Marbled cat at the {L}os {A}ngeles {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {16}, ' ...
'pages = {205-208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pardofelis_marmorata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pardofelis_marmorata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


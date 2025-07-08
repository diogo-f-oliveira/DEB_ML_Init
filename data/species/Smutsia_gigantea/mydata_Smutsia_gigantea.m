function [data, auxData, metaData, txtData, weights] = mydata_Smutsia_gigantea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Smutsia_gigantea'; 
metaData.species_en = 'Giant pangolin'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'am','tg','tx','tp','Lb','Li', 'Wwb','Wwp','Wwi','Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2021 12 19];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, FRAM center, Tromso'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 12 20]; 

% The giant pangolin inhabits primary and secondary
% forest formations, forest-savanna
% mosaics, seasonally inundated swamp forests,
% gallery forest, wooded savanna and wet grasslands.
% eats ants but also insects like beetles
% noturnal HoffNix2020


%% set data
% zero-variate data

data.tg = 139;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = metaData.T_typical;  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'one individual in the Bloemfontein zoon';
data.tx = 3*30.5; units.tx = 'd';    label.tx = 'age at weaning'; bibkey.tx = 'guess';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'from Smutia temminckii and other pangolines';
data.tp = 2 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'when it is not exactly knowne experts guess 1-2 years till puberty.';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the 20-25 years thought to apply to S. temminckii';
 
data.Lb = 45; units.Lb = 'cm';   label.Lb = 'length at birth';     bibkey.Lb = 'HoffNix2020';  
data.Li = 178.9; units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'HoffNix2020';  
  
data.Wwb = 500;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HoffNix2020';
comment.Wwb = 'authors say just over'; 
data.Wwp = 8e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
comment.Wwp = 'based on S. temminkii, besed on the smallest adult S. temminckii'; 
data.Wwi = 32.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'HoffNix2020';
  comment.Wwi = 'possibly up to 40 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(33.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on S. temminckii';
  


%% facts
F1 = 'Widely distributed species in equatorial Africa';
metaData.bibkey.F1 = 'HoffNix2020'; 
metaData.facts = struct('F1',F1);
   
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
metaData.links.id_CoL = '7VRVD'; % Cat of Life
metaData.links.id_ITIS = '584929'; % ITIS
metaData.links.id_EoL = '337657'; % Ency of Life
metaData.links.id_Wiki = 'Smutsia_gigantea'; % Wikipedia
metaData.links.id_ADW = 'Manis_gigantea'; % ADW
metaData.links.id_Taxo = '93404'; % Taxonomicon
metaData.links.id_MSW3 = '13900011'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Smutsia_gigantea}}';
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
bibkey = 'HoffNix2020'; type = 'Incollection'; bib = [ ... 
'author = {Sam Ayebare and Tom Bruce and Tim R.B. Davenport and John Hart and Terese Hart and Martin Hega and Fiona Maisels and David Mills and and Constant Ndjassi}, ' ... 
'doi = {10.1016/B978-0-12-815507-3.00010-1}, ' ...
'year = {2020}, ' ...
'title = {Giant pangolin \emph{Smutsia gigantea} ({I}lliger, 1815)}, ' ...
'booktitle = {Pangolins: Science, Society and Conservation}, ' ...
'pages = {175--193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Manis_gigantea/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 

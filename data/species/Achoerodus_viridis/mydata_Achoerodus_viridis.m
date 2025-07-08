function [data, auxData, metaData, txtData, weights] = mydata_Achoerodus_viridis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Achoerodus_viridis'; 
metaData.species_en = 'Eastern blue groper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Ghassen Hadded'};
metaData.date_subm = [2015 03 26]; 
metaData.email    = {'ghassenhad@gmail.com'}; 
metaData.address  = {'Intitut Pasteur de Tunis, 1002, Tunisia'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 04 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 


%% set data
% zero-variate data

data.ab = 2;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 1095;   units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Gill1995';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12775;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Gill1995';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.30;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jeff2003';  
data.Lp  = 20;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'Jeff2003'; 
data.L18  = 52.6; units.L18  = 'cm'; label.L18  = 'standard length at sex change at 18 yr'; bibkey.L18  = 'fishbase'; 
  temp.L18 = C2K(20);  units.temp.L18 = 'K'; label.temp.L18 = 'temperature';
data.Li  = 72;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwp = 70;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Jeff2003';
data.Wwi = 3600;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Gill1995';

data.Ri  = 3.5e6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'taken from Epinephelus_marginatus per weight at 1.4 kg';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Females of around 71 cm may change to males; all are born as female';
metaData.bibkey.F1 = 'Gill1995'; 
metaData.facts = struct('F1',F1);

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '64H8L'; % Cat of Life
metaData.links.id_ITIS = '613265'; % ITIS
metaData.links.id_EoL = '46572113'; % Ency of Life
metaData.links.id_Wiki = 'Achoerodus_viridis'; % Wikipedia
metaData.links.id_ADW = 'Achoerodus_viridis'; % ADW
metaData.links.id_Taxo = '160085'; % Taxonomicon
metaData.links.id_WoRMS = '279498'; % WoRMS
metaData.links.id_fishbase = 'Achoerodus-viridis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Achoerodus_viridis}}';
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
bibkey = 'Gill1995'; type = 'Article'; bib = [ ... 
'author = {Gillanders, B. M.}, ' ... 
'year = {1995}, ' ...
'title = {Reproductive biology of the protogynous hermaphrodite \emph{Achoerodus viridis} ({L}abridae) from south-eastern {A}ustralia}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {46}, ' ...
'pages = {999--1008}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jeff2003'; type = 'Article'; bib = [ ... 
'author = {Jeffrey, M. L.}, ' ... 
'year = {2007}, ' ...
'title = {Larval development of \emph{Achoerodus viridis} ({P}isces: {L}abridae), the {A}ustralian eastern blue groper}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {51}, ' ...
'pages = {46--51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Achoerodus_viridis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Achoerodus_viridis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


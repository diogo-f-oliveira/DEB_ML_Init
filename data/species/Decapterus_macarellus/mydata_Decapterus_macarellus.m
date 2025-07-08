function [data, auxData, metaData, txtData, weights] = mydata_Decapterus_macarellus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Decapterus_macarellus'; 
metaData.species_en = 'Mackerel scad'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 10];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(21.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(21.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 23; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 46;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 137; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'fishbase: based on 0.01202*Lp^2.98, see F1';
data.Wwi = 1084; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01202*Li^2.98, see F1';

data.Ri  = 106200/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(21.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
135.223	18.334
165.434	19.475
256.813	21.053
286.581	19.670
317.180	20.616
365+15.332	22.216
365+135.317	23.092
365+165.122	23.553];
data.tL(:,1) = data.tL(:,1)+500; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(21.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CorpSaeg1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34CZQ'; % Cat of Life
metaData.links.id_ITIS = '168724'; % ITIS
metaData.links.id_EoL = '46577985'; % Ency of Life
metaData.links.id_Wiki = 'Decapterus_macarellus'; % Wikipedia
metaData.links.id_ADW = 'Decapterus_macarellus'; % ADW
metaData.links.id_Taxo = '172947'; % Taxonomicon
metaData.links.id_WoRMS = '126807'; % WoRMS
metaData.links.id_fishbase = 'Decapterus-macarellus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Decapterus_macarellus}}';  
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
bibkey = 'CorpSaeg1985'; type = 'techreport'; bib = [ ... 
'author = {Corpuz, A. and J. Saeger and V. Sambilay}, ' ...
'year = {1985}, ' ...
'title = {Population parameters of commercially important fishes in {P}hilippine waters}, ' ... 
'institution = {Tech. Rep. Dep. Mar. Fish. Univ. Philipp. Visayas.}, ' ...
'volume = {6}, ' ...
'pages = {1-99},' ...
'howpublished = {\url{https://digitalarchive.worldfishcenter.org/server/api/core/bitstreams/9211bb8d-9bb9-4343-966b-649ff18d9b5b/content}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Decapterus-macarellus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

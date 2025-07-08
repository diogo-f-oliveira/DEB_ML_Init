function [data, auxData, metaData, txtData, weights] = mydata_Serranus_subligarius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Serranus_subligarius'; 
metaData.species_en = 'Belted sandfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 15];

%% set data
% zero-variate data
data.ab = 6;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
    temp.ab = C2K(24.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 5;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 10;   units.Li = 'cm';  label.Li = 'ultimate total length'; bibkey.Li  = 'fishbase'; 

data.Wwb = 1.9e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess'; 
  comment.Wwb = 'baseb on  egg diameter of 0.712 mm: pi/6*0.0712^3';   
data.Wwp = 1.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase'; 
  comment.Wwp= 'based on 0.01096*L_p^3.05, see F1';
data.Wwi = 12.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.05, see F1';

data.GSI  = 0.063; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'HastBort1980';   
  temp.GSI = C2K(24.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [... % time since birth (yr), total length (cm)
    1 5.6
    2 7.0
    3 7.9
    4 8.3]; 
data.tL (:,1)= (0.2 + data.tL(:,1)) * 365; % years to days 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL='record 436';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
% auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'kap_R is set to 0.95/2 because of being hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WX88'; % Cat of Life
metaData.links.id_ITIS = '167858'; % ITIS
metaData.links.id_EoL = '46579260'; % Ency of Life
metaData.links.id_Wiki = 'Serranus_subligarius'; % Wikipedia
metaData.links.id_ADW = 'Serranus_subligarius'; % ADW
metaData.links.id_Taxo = '187470'; % Taxonomicon
metaData.links.id_WoRMS = '159236'; % WoRMS
metaData.links.id_fishbase = 'Serranus-subligarius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Serranus_subligarius}}';
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
bibkey = 'Erzi1991'; type = 'techreport'; bib = [ ... 
'author = {Erzini, K.}, ' ... 
'year = {1991}, ' ...
'title = {A compilation of data on variability in length-age in marine fishes}, ' ...
'institution = {Fisheries Stock Assessment, Title XII, Collaborative Research Support Program, University of Rhode Island}, ' ...
'volume = {Working paper 77}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HastBort1980'; type = 'article'; bib = [ ... 
'author = {Philip A. Hastings and Stephen A. Bortone.}, ' ... 
'year = {1980}, ' ...
'title = {Observations on the life history of the belted sandfish, \emph{Serrunus subligurius} ({S}erranidae)}, ' ...
'journal = {Env. Biol. Fish.}, ' ...
'volume = {5(4)}, ' ...
'pages = {365-374}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Serranus-subligarius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

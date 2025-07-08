  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_mesoprion
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Pentaprion_longimanus'; 
metaData.species_en = 'Longfin mojarra'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 04];

%% set data

% zero-variate data

data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Nemipterus_japonicus';

data.Lp = 8;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Gerres_oyena';
data.Li = 15;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Gerres_oyena: pi/6*0.05^3';
data.Wwi = 44.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.06, see F1';
    
data.Ri  = 424;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Gerres_oyena: 1006*(15/20)^3';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
231.716	7.136
258.759	7.556
443.162	10.081
507.928	10.610
602.235	10.936];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHari1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01122*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76N9C'; % Cat of Life
metaData.links.id_ITIS = '169052'; % ITIS
metaData.links.id_EoL = '46580928'; % Ency of Life
metaData.links.id_Wiki = 'Pentaprion_longimanus'; % Wikipedia
metaData.links.id_ADW = 'Pentaprion_longimanus'; % ADW
metaData.links.id_Taxo = '183442'; % Taxonomicon46581352
metaData.links.id_WoRMS = '282213'; % WoRMS
metaData.links.id_fishbase = 'Pentaprion-longimanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pentaprion_longimanus}}';  
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
bibkey = 'DwipHari1986'; type = 'techreport'; bib = [ ... 
'author = {Dwiponggo, A. and Hariati, T. and Banon, S. and Palomares, M L D and Pauly, Daniel}, ' ... 
'year = {1986}, ' ...
'title = {Growth, mortality and recruitment of commercially important fishes and penaed shrimps in {I}ndonesian waters}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'series = {ICLARM Technical Reports}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pentaprion-longimanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

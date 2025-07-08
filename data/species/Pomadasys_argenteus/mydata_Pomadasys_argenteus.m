function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_argenteus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_argenteus'; 
metaData.species_en = 'Silver grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 08];

%% set data
% zero-variate data

data.ab = 4.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'base on growth at 5 yr';
  
data.Lp  = 30.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Pomadasys_kaakan: 35*70/80';
data.Li  = 70;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Desh1973';
  comment.Wwb = 'based egg diameter of 0.8 mm: pi/6*0.08^3'; 
data.Wwi = 4.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^2.98, see F1';

data.Ri  = 286520/365;   units.Ri  = '#/d'; label.Ri  = 'reproduction rate at TL 58 cm';   bibkey.Ri  = 'Desh1973';   
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 286520 ova at TL = 58 cm';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 24.6
    2 34.4
    3 46.5
    4 52.4
    5 56.9];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Desh1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01380*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4LQLG'; % Cat of Life
metaData.links.id_ITIS = '630273'; % ITIS
metaData.links.id_EoL = '46578439'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_argenteus'; % ADW
metaData.links.id_Taxo = '184494'; % Taxonomicon
metaData.links.id_WoRMS = '218566'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-argenteus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys_argenteus}}';
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
bibkey = 'Desh1973'; type = 'Article'; bib = [ ... 
'author = {Deshmukh, V, M,}, ' ... 
'year = {1973}, ' ...
'title = {Fishery and biology of \emph{Pomadasys hasta} ({B}loch)}, ' ...
'journal = {Ind, J. Fish.}, ' ...
'volume = {20(2)}, ' ...
'pages = {497-522}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-argenteus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

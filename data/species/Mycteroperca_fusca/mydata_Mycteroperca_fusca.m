function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_fusca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_fusca'; 
metaData.species_en = 'Island grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 31];

%% set data
% zero-variate data

data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(19.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'BustLuqu2009';   
  temp.am = C2K(19.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 80;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 718;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00933*Lp^3.05, see F1';
data.Wwi = 5950;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.05, see F1; max published weight 3 kg';
 
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(19.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Mycteroperca_bonaci';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    2 26.2
    3 31.3
    4 35.2
    5 37.9
    6 41.0
    7 44.2
    8 46.4
    9 48.9
   10 51.8
   11 54.0
   12 57.4
   13 58.8
   14 60.8
   15 64.4
   16 64.2
   17 65.9
   19 67.6
   20 70.7];
data.tL(:,1) = 365*(data.tL(:,1)+0.5); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BustLuqu2009'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44ZP3'; % Cat of Life
metaData.links.id_ITIS = '551109'; % ITIS
metaData.links.id_EoL = '46579698'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_fusca'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_fusca'; % ADW
metaData.links.id_Taxo = '180505'; % Taxonomicon
metaData.links.id_WoRMS = '127038'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-fusca'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_fusca}}';
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
bibkey = 'BustLuqu2009'; type = 'article'; bib = [ ... 
'doi = {10.3989/scimar.2009.73n2319}, ' ...
'author = {Roc\''{i}o Bustos and \''{A}ngel Luque and Jos\''{e} G. Pajuelo}, ' ... 
'year = {2009}, ' ...
'title = {Age estimation and growth pattern of the island grouper, \emph{Mycteroperca fusca} ({S}erranidae) in an island population on the northwest coast of {A}frica}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {73(2)}, ' ...
'pages = {319-328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-fusca.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


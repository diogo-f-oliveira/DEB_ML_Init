function [data, auxData, metaData, txtData, weights] = mydata_Melanotaenia_boesemani

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Melanotaeniidae';
metaData.species    = 'Melanotaenia_boesemani'; 
metaData.species_en = 'Boeseman''s rainbowfish'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 12];

%% set data
% zero-variate data
data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'mdb';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 7 d, assumed: 1.5 d start feeding';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 9;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'mdb';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 0.759;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi =8.93;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1';
  
data.Ri = 2*333/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'mdb';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '333 eggs per spawn for Melanotaenia fluviatilis, 2 spawnings per yr assumed';

% univariate data
% time-length
data.tLW = [ ... % time since 1 jan(d), standard length (0.1 mm)
    1 0.468 0.0009
    7 0.550 0.0029
   14 1.079 0.0032
   28 1.766 0.0535
   37 2.068 0.1157
   42 2.271 0.1318];
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since hatch', 'total length', 'weight'};  
temp.tLW    = C2K(27);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1,{'total length','weight'}};
bibkey.tLW = 'AkhsNur2020';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight (g) = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48RN6'; % Cat of Life
metaData.links.id_ITIS = '641503'; % ITIS
metaData.links.id_EoL = '220195'; % Ency of Life
metaData.links.id_Wiki = 'Melanotaenia_boesemani'; % Wikipedia
metaData.links.id_ADW = 'Melanotaenia_boesemani'; % ADW
metaData.links.id_Taxo = '181678'; % Taxonomicon
metaData.links.id_WoRMS = '1018670'; % WoRMS
metaData.links.id_fishbase = 'Melanotaenia_-boesemani'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Melanotaenia_boesemani}}';  
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
bibkey = 'AkhsNur2020'; type = 'Article'; bib = [ ...  
'doi = {10.1088/1755-1315/441/1/012037}, ' ...
'author = {W. M. Akhsan and B. Nur and and N. N. Dewi}, ' ...
'year  = {2020}, ' ...
'title = {Growth performance and survival rate of {B}oeseman''s rainbowfish (\emph{Melanotaenia boesemani}) in natural spawning technique at {D}epok, {W}est {J}ava, {I}ndonesia}, ' ...  
'journal = {IOP Conf. Ser.: Earth Environ. Sci.}, ' ...
'volume  = {441}, ' ...
'pages = {012037}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Melanotaenia-boesemani.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'mdb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.mdb.fish/fish-fact-sheets/murray-darling-rainbowfish}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


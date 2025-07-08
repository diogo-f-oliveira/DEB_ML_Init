  function [data, auxData, metaData, txtData, weights] = mydata_Oligosarcus_hepsetus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Oligosarcus_hepsetus'; 
metaData.species_en = 'Pike characin'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
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
metaData.date_subm = [2024 08 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 04];

%% set data
% zero-variate data
data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CarmRond2011';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.6;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'GomiGaru2008';
data.Li = 32;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GomiGaru2008';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwp = 13;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'GomiGaru2008','fishbase'};
  comment.Wwp = 'based on 0.00794*Lp^3.02, see F1';
data.Wwi = 279;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.02, see F1';
  
data.Ri = 45e3/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'GomiGaru2008';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of 161/g: 279*161';

% univariate data
% time-length
data.tL = [ ... % time since 1 jan(d), total length (cm)
195.457	4.126
287.696	7.782
365+104.976	11.918
365+195.018	13.950
365+287.256	15.316
730+14.055	16.239
1095+104.537	20.339
1460+197.214	22.000];
data.tL(:,1) = data.tL(:,1) - 30; % set origin at hatch
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CarmRond2011';
comment.tL = 'data based on length frequency data';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight (g) = 0.00794*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48RN6'; % Cat of Life
metaData.links.id_ITIS = '641503'; % ITIS
metaData.links.id_EoL = '220195'; % Ency of Life
metaData.links.id_Wiki = 'Oligosarcus_hepsetus'; % Wikipedia
metaData.links.id_ADW = 'Oligosarcus_hepsetus'; % ADW
metaData.links.id_Taxo = '181678'; % Taxonomicon
metaData.links.id_WoRMS = '1018670'; % WoRMS
metaData.links.id_fishbase = 'Oligosarcus-hepsetus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Oligosarcus_hepsetus}}';  
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
bibkey = 'CarmRond2011'; type = 'Article'; bib = [ ...  
'author = {Carmassi, A.L. and G.R. Rondineli and L.M. Gomiero and F.M.S. Braga}, ' ...
'year  = {2011}, ' ...
'title = {Growth and mortality of \emph{Oligosarcus hepsetus} ({C}uvier, 1829) ({C}haraciforms, {C}haracidae) in {S}erra do {M}ar {S}tate {P}ark, {S}anta {V}irg\''{i}nia {U}nit, {S}\~{a}o {P}aulo, {B}razil}, ' ...  
'journal = {Biota Neotrop.}, ' ...
'volume  = {11(2)}, ' ...
'pages = {1012-1026}, ' ...
'howpublished = {\url{http://www.biotaneotropica.org.br/v11n2/en/ abstract?article+bn00611022011}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomiGaru2008'; type = 'Article'; bib = [ ...  
'author = {Gomiero, L.M. and Garuana, L. and Braga, F.M.S.}, ' ...
'year  = {2008}, ' ...
'title = {Reproduction of \emph{Oligosarcus hepsetus} ({C}uvier, 1829) ({C}haraciforms) in the {S}erra do {M}ar {S}tate {P}ark, {S}\~{a}o {P}aulo, {B}razil}, ' ...  
'journal = {Braz. J. Biol.}, ' ...
'volume  = {68(1)}, ' ...
'pages = {187-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oligosarcus-hepsetus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


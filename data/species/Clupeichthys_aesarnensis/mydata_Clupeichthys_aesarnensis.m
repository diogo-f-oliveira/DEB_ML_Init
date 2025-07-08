  function [data, auxData, metaData, txtData, weights] = mydata_Clupeichthys_aesarnensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Ehiravidae';
metaData.species    = 'Clupeichthys_aesarnensis'; 
metaData.species_en = 'Thai river sprat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'piFl', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 21];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*30.5; units.am = 'd';    label.am = 'life span';              bibkey.am = 'JutaSilva2003';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 7.8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'JutaSilva2003';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.58;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00871*Lp^3.03, see F1';
data.Wwi = 4.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.03, see F1';

data.GSI = 0.3; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(28.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'Spawns throught the year: GSI peaks at 0.1. Assumed 3 spawns per yr';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
40.961	2.855
55.881	3.452
69.975	3.969
85.734	4.438
98.170	4.891
113.929	5.344
126.375	5.636
140.071	5.864
154.183	6.076
167.882	6.239
182.828	6.403];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'JutaSilva2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 3;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WCW5'; % Cat of Life
metaData.links.id_ITIS = '551282'; % ITIS
metaData.links.id_EoL = '1012500'; % Ency of Life
metaData.links.id_Wiki = 'Clupeichthys'; % Wikipedia
metaData.links.id_ADW = 'Clupeichthys_aesarnensis'; % ADW
metaData.links.id_Taxo = '171468'; % Taxonomicon
metaData.links.id_WoRMS = '1012164'; % WoRMS
metaData.links.id_fishbase = 'Clupeichthys-aesarnensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupeichthys}}';  
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
bibkey = 'JutaSilva2003'; type = 'Article'; bib = [ ... 
'author = {T. Jutagate and S. S. De Silva and N. S. Mattson}, ' ...
'doi = {10.1046/j.1365-2400.2003.00338.x}, ' ...
'year = {2003}, ' ...
'title = {Yield, growth and mortality rate of the {T}hai river sprat, \emph{Clupeichthys aesarnensis}, in {S}irinthorn {R}eservoir, {T}hailand}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {10(4)}, '...
'pages = {221–231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clupeichthys-aesarnensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
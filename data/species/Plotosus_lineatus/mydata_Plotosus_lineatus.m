  function [data, auxData, metaData, txtData, weights] = mydata_Plotosus_lineatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Plotosidae';
metaData.species    = 'Plotosus_lineatus'; 
metaData.species_en = 'Striped eel catfish '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 06];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Vija1997 gives 2.19 yr';

data.Lp = 16.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
  comment.Lp = 'Vija1997 gives 15.9 cm';
data.Li = 35.2;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm for Bagrus docmak: pi/6*.125^3';
data.Wwp = 41.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00617*Lp^3.12, see F1';
data.Wwi = 412.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.12, see F1';

data.Ri = 5753/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed TL = 21 cm; Vija1997 gives a fecundity of 2298';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
119.177	6.275
141.807	6.851
269.564	13.167
325.538	15.369
667.242	21.141];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vija1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 3;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.5;

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
F1 = 'length-weight: Ww in g = 0.00617*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'venomous; the only catfish in coral reefs'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '783MS'; % Cat of Life
metaData.links.id_ITIS = '164236'; % ITIS
metaData.links.id_EoL = '46581859'; % Ency of Life
metaData.links.id_Wiki = 'Plotosus_lineatus'; % Wikipedia
metaData.links.id_ADW = 'Plotosus_lineatus'; % ADW
metaData.links.id_Taxo = '44103'; % Taxonomicon
metaData.links.id_WoRMS = '217659'; % WoRMS
metaData.links.id_fishbase = 'Plotosus-lineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Plotosus_lineatus}}';  
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
bibkey = 'Vija1997'; type = 'Article'; bib = [ ...
'author = {K. Vijakumaran}, ' ...
'year = {1997}, ' ...
'title = {Growth and mortality parameters and some aspects of biology of striped eel catfish \emph{Plotosus lineatus} ({T}hunberg) from north {A}ndhra {P}radesh coast}, ' ... 
'journal = {J. mar. biol. Ass. India}, ' ...
'volume = {39(1/2)}, '...
'pages = {108-112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Plotosus-lineatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


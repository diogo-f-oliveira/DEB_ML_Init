  function [data, auxData, metaData, txtData, weights] = mydata_Dussumieria_hasseltii
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dussumieriidae';
metaData.species    = 'Dussumieria_hasseltii'; 
metaData.species_en = 'Hasselt''s rainbow sardine'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TPi','MI'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 17];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.55*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Dussumieria_acuta';

data.Lp = 16;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'based on Dussumieria_acuta: 17*20/21.2';
data.Li = 20;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on Dussumieria elopsoides';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 39.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00776*Lp^3.08, see F1';
data.Wwi = 78.9;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.08, see F1';

data.Ri  = 20000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Dussumieria elopsoides';

% uni-variate data
data.tL = [ ... % time since brth (yr), total length (cm)
    1 13.0
    2 18.0];
data.tL(:,1) = (data.tL(:,1)+ 0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'DevaKuru1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;

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
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DQ3Z'; % Cat of Life
metaData.links.id_ITIS = '161823'; % ITIS
metaData.links.id_EoL = '65254140'; % Ency of Life
metaData.links.id_Wiki = 'Dussumieria_elopsoides'; % Wikipedia
metaData.links.id_ADW = 'Dussumieria_hasseltii'; % ADW
metaData.links.id_Taxo = '362989'; % Taxonomicon
metaData.links.id_WoRMS = '212259'; % WoRMS
metaData.links.id_fishbase = 'Dussumieria-hasseltii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Dussumieria_hasseltii}}';  
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
bibkey = 'DevaKuru1997'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://core.ac.uk/download/pdf/33017552.pdf}}, ' ...
'author = {Devaraj, M. and K.N. Kurup and N.G.K. Pillai and K. Bala and E. Vivekanandan and R. Sathiadhas}, ' ...
'year = {1997}, ' ...
'title = {Status, prospects and management of small pelagic fisheries in {I}ndia}, ' ... 
'journal = {RAP Publication: Bangkok, Thailand}, ' ...
'volume = {31}, '...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dussumieria-hasseltii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
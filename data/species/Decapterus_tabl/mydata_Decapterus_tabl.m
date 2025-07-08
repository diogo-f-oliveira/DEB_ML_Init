function [data, auxData, metaData, txtData, weights] = mydata_Decapterus_tabl
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Decapterus_tabl'; 
metaData.species_en = 'Roughear scad'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC','MAE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 13];

%% set data
% zero-variate data
data.ab = 7;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(16.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(16.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 50;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 343.6; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'fishbase: based on 0.01230*Lp^3.01, see F1';
data.Wwi = 1599; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01230*Li^3.01, see F1; max. published weight: 560.00 g';

data.Ri  = 15e4/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(16.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
136.848	10.714
169.120	12.635
227.924	14.631
258.834	16.626
319.335	18.768
350.621	19.212
365+45.440	21.429
365+76.710	22.537
365+198.090	25.197
365+228.703	25.271];
data.tL(:,1) = data.tL(:,1)+30; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(16.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NariPall2016';
 
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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34D2N'; % Cat of Life
metaData.links.id_ITIS = '168726'; % ITIS
metaData.links.id_EoL = '46577987'; % Ency of Life
metaData.links.id_Wiki = 'Decapterus'; % Wikipedia
metaData.links.id_ADW = 'Decapterus_tabl'; % ADW
metaData.links.id_Taxo = '172954'; % Taxonomicon
metaData.links.id_WoRMS = '159484'; % WoRMS
metaData.links.id_fishbase = 'Decapterus-tabl'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Decapterus}}';  
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
bibkey = 'NariPall2016'; type = 'article'; bib = [ ... 
'author = {Narido, C.I. and H.P. Palla and F.A.T. Argente and P.J.L. Geraldino}, ' ...
'year = {2016}, ' ...
'title = {Population dynamics and fishery of roughear scad \emph{Decapterus tabl} {B}erry 1968 ({P}erciformes: {C}arangidae) in {C}amotes {S}ea, {C}entral {P}hilippines}, ' ... 
'journal = {Asian Fish. Sci.}, ' ...
'volume = {29}, ' ...
'pages = {14-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Decapterus_tabl.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_macrocheilus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_macrocheilus'; 
metaData.species_en = 'Largescale sucker'; 

metaData.ecoCode.climate = {'BSk','Csb','Dsa','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'dLj'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 11]; 

%% set data
% zero-variate data
data.tp = 6*365;   units.tp = 'd';  label.tp = 'time since birth at pubert';       bibkey.tp = 'Daub1986';   
  temp.tp = C2K(14); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 41.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'Daub1986'; 
  comment.Lp = 'based on FL 40 cm and F2';
data.Li = 61;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';
  comment.Li = 'fishbase gives TL 30 cm';

data.Wwb = 8.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Daub1980';
  comment.Wwb = 'based on egg diameter of 2.1 - 3  mm of Catostomus columbianus: pi/6*0.25^3';
data.Wwp = 497; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Daub1986'};
  comment.Wwp = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 1.67e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10, see F1';

data.Ri = 2e4/365; units.Ri = '#/d'; label.Ri = 'max reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
data.dLj = 7.3/365; units.dLj = 'cm/d'; label.dLj = 'growth rate at metam';  bibkey.dLj = 'Daub1986';
  temp.dLj = C2K(14);  units.temp.dLj = 'K'; label.temp.dLj = 'temperature';


%% set weights for all real data
weights = setweights(data, []);

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
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.97 cm';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'RW4T'; % Cat of Life
metaData.links.id_ITIS = '163896'; % ITIS
metaData.links.id_EoL = '207063'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_macrocheilus'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_macrocheilus'; % ADW
metaData.links.id_Taxo = '130826'; % Taxonomicon
metaData.links.id_WoRMS = '567524'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-macrocheilus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_macrocheilus}}';  
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
bibkey = 'Daub1986'; type = 'article'; bib = [ ... 
'author = {Dennis D. Dauble}, ' ...
'year = {1986}, ' ...
'title = {Life History and Ecology of the Largescale Sucker (\emph{Castostomus macrocheilus}) in the {C}olumbia {R}iver}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {116(2)}, ' ...
'pages = {356-367}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Daub1980'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1980)109<92:LHOTBS>2.0.CO;2}, ' ...
'author = {Dennis D. Dauble}, ' ...
'year = {1980}, ' ...
'title = {Life History of the Bridgelip Sucker in the {C}entral {C}olumbia {R}iver}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {109(1)}, ' ...
'pages = {92-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-macrocheilus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Schilbe_mystus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Schilbeidae';
metaData.species    = 'Schilbe_mystus'; 
metaData.species_en = 'African butter catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 04];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Ayoa2009';
data.Lpm = 12.2;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Ayoa2009';
data.Li = 35;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.5e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Ayoa2009';
  comment.Wwb = 'based on egg diameter of 0.66 mm: pi/6*0.066^3';
data.Wwp = 25.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Ayoa2009'};
  comment.Wwp = 'based on 0.00832*Lp^3, see F1';
data.Wwi = 357;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00832*Li^3, see F1';
  
% uni-variate data
% time-length
data.tL_OA = [ ... % time since birth (yr), total length (cm)
    1 14.7 14.3
    2 19.1 19.1
    3 21.7 21.7
    4 23.5 23.7
    5 25.1 24.7
    6 26.0 25.0];
data.tL_OA(:,1) = (data.tL_OA(:,1) + 0.6) * 365; % convert yr to d
units.tL_OA = {'d', 'cm'};  label.tL_OA = {'time since birth', 'length'};  
  temp.tL_OA = C2K([24.3 27.3]);  units.temp.tL_OA = 'K'; label.temp.tL_OA = 'temperature';
  treat.tL_OA = {1, {'Oyan lake','Asejire lake'}};
bibkey.tL_OA = 'Aded2007';
comment.tL_OA = 'Data from Oyan lake, Asejire lake';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    13.4  3500
    17.7  9073 % (SL 16.5 cm)
    17.8  9088 % (SL 16.6 vm)
    24.6 35460 % *
    24.9  9700
    26.7 75670]; % *
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
bibkey.LN = 'Ayoa2009';
comment.LN = 'Data from different sources';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_OA = weights.tL_OA * 5;

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
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.93 * TL from photo'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4V883'; % Cat of Life
metaData.links.id_ITIS = '164087'; % ITIS
metaData.links.id_EoL = '223144'; % Ency of Life
metaData.links.id_Wiki = 'Schilbe_mystus'; % Wikipedia
metaData.links.id_ADW = 'Schilbe_mystus'; % ADW
metaData.links.id_Taxo = '186744'; % Taxonomicon
metaData.links.id_WoRMS = '1019298'; % WoRMS
metaData.links.id_fishbase = 'Schilbe-mystus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Schilbe_mystus}}';  
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
bibkey = 'Ayoa2007'; type = 'Article'; bib = [ ...
'author = {Ayoade, Adedolapo A.}, ' ...
'year = {2007}, ' ...
'title = {Age and growth of the {A}frican butter catfish, \emph{Schilbe mystus} ({L}innaeus, 1758) in {A}sejire and {O}yan {L}akes, south-west {N}igeria}, ' ... 
'journal = {Journal of Fisheries and Aquatic Science}, ' ...
'volume = {2(2)}, '...
'pages = {110-119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ayoa2009'; type = 'Article'; bib = [ ...
'author = {Ayoade, Adedolapo A.}, ' ...
'year = {2009}, ' ...
'title = {ASPECTS OF THE REPRODUCTIVE BIOLOGY OF THE {A}FRICAN BUTTER CATFISH \emph{Schilbe mystus} ({T}ELEOSTEI: {S}CHILBEIDAE) IN AN ARTIFICIAL LAKE IN SOUTH WESTERN {N}IGERIA}, ' ... 
'journal = {The Zoologist}, ' ...
'volume = {7}, '...
'pages = {130-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schilbe-mystus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


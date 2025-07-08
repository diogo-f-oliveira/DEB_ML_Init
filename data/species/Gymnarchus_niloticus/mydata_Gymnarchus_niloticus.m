  function [data, auxData, metaData, txtData, weights] = mydata_Gymnarchus_niloticus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Gymnarchidae';
metaData.species    = 'Gymnarchus_niloticus'; 
metaData.species_en = 'Aba aba'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 05];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(32);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(32);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 167;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.5e-2;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AgbuAbhu2021';
  comment.Wwb = 'based on egg diameter of 3.5 till 7.9 mm: pi/6*0.472^3';
data.Wwp = 344;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00372*Lp^3.10, see F1';
data.Wwi = 18.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight, based on 0.00372*Li^3.10, see F1, gives 28.9 kg';
  
data.Ri = 1378/365;       units.Ri = '#/d';  label.Ri = 'reprod rate at 94 cm';     bibkey.Ri = 'AgbuAbhu2021';
  temp.Ri = C2K(32); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
    0  10  10
   30  45  30
   60 120  55
   90 235  76
  120 300 110
  150 380 145
  180 450 180
  210 530 220];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(32);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
treat.tW = {1, {'life diet','formulated diet'}};
bibkey.tW = 'AdebObe2020';
comment.tW = 'cultures fed with young Tilipia and some live maggots or formulated diet (fishmeal, soya meal, maize)';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 5;
weights.ab = weights.ab * 0;

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
D2 = 'Weights Wwp and Wwi are inconsistent with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.9*TL from photo'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F3',F2);

%% Links
metaData.links.id_CoL = '3HPF4'; % Cat of Life
metaData.links.id_ITIS = '161927'; % ITIS
metaData.links.id_EoL = '988111'; % Ency of Life
metaData.links.id_Wiki = 'Gymnarchus_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Gymnarchus_niloticus'; % ADW
metaData.links.id_Taxo = '42773'; % Taxonomicon
metaData.links.id_WoRMS = '1022677'; % WoRMS
metaData.links.id_fishbase = 'Gymnarchus-niloticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Gymnarchus_niloticus}}';  
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
bibkey = 'AdebObe2020'; type = 'Article'; bib = [ ...
'author = {Adebayo, I.A. and Obe, B.W. and Jegede, T.}, ' ...
'year = {2020}, ' ...
'title = {Growth Performance and Survivability of \emph{Gymnarchus niloticus} ({C}uvier, 1892) Juveniles Fed Both Live and Formulated Diets in Earthen Ponds}, ' ... 
'journal = {Journal of Aquaculture Research \& Development}, ' ...
'volume = {11}, '...
'pages = {614}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AgbuAbhu2021'; type = 'Article'; bib = [ ...
'author = {Agbugui, M.O. and Abhulimen, F.E. and Adeniyi, A.O.}, ' ...
'year = {2021}, ' ...
'title = {Abundance, Distribution, Morphometric, Feeding Evaluation and the Reproductive Strategies of \emph{Gymnarchus niloticus} in the Lower {R}iver {N}iger at {A}genebode, {E}do {S}tate {N}igeria}, ' ... 
'journal = {J. Appl. Sci. Environ. Manage.}, ' ...
'volume = {25(8)}, '...
'pages = {1371-1377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnarchus-niloticus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


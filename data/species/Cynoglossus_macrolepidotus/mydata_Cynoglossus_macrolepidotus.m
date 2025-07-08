function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_macrolepidotus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_macrolepidotus'; 
metaData.species_en = 'Large-scaled tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 17];

%% set data
% zero-variate data
data.ab = 1.5;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(28.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';  
  temp.am = C2K(28.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19.1;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'RamaVija1977';
data.Li = 39.1;  units.Li = 'cm';   label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';

data.Wwb = 4.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'RamaVija1977';
  comment.Wwb = 'based on egg diameter of 0.44 mm: pi/6*0.044^3';
data.Wwp = 36.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00380*Lp^3.11, see F1';
data.Wwi = 340; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00380*Li^3.11, see F1';

% uni-variate data
% time-length        
data.tL = [ ... % age (mnth), total length (cm)
    1  2.8
    2  5.2
    3  7.0
    4  9.2
    5 11.0
    6 12.4
    7 14.0
    8 15.5
    9 16.8
   10 18.0
   11 19.4
   12 20.2
   13 21.4
   14 22.0
   15 23.0
   16 23.7
   17 24.4
   18 25.0
   19 25.8
   20 26.5
   21 27.2];
data.tL(:,1) = 30.55 * (0.2+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RaoDwiv1989'; 

% length-fecundity
data.LN = [ ... total length (mm), fecundity (#)
    20.3  25663
    20.9  73416
    21.6  79671
    21.9  87476
    22.1  96750
    24.5 109151
    25.2 111591
    26.1 192725
    27.4 215711
    29.2 252156
    33.4 317577];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(28.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RamaVija1977';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00380*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BTZG'; % Cat of Life
metaData.links.id_ITIS = '173092'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_macrolepidotus'; % ADW
metaData.links.id_Taxo = '172563'; % Taxonomicon
metaData.links.id_WoRMS = '274209'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-macrolepidotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus}}';
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
bibkey = 'RaoDwiv1989'; type = 'article'; bib = [ ...
'author = {Rao, M.R. and Dwivedi, S.N.}, ' ...
'year = {1989}, ' ...
'title = {Length frequency and growth studies on \emph{Cynoglossus macrolepidotus} ({B}leeker) off {B}ombay coast}, ' ... 
'journal = {Journal of the Indian Fisheries Association}, ' ...
'volume = {19}, ' ...
'pages = {43-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamaVija1977'; type = 'article'; bib = [ ...
'author = {N. Ramanathan and P. Vijaya and V. Ramaiyan and R. Natarajan}, ' ...
'year = {1977}, ' ...
'title = {On the biology of the large-scaled tongue sole \emph{Cynoglossus macrolepidotus} ({B}leeker)}, ' ... 
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {24}, ' ...
'pages = {83-89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-macrolepidotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

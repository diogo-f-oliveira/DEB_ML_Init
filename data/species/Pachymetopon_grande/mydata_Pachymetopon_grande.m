function [data, auxData, metaData, txtData, weights] = mydata_Pachymetopon_grande

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pachymetopon_grande'; 
metaData.species_en = 'Bronze seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 06];

%% set data
% zero-variate data

data.am = 38*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BuxtClar1992';   
  temp.am = C2K(24.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 65;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 533; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02188*Lp^2.97, see F1';
data.Wwi = 5302; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02188*Li^2.97, see F1';

data.GSI  = 0.11; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'BuxtClar1992';   
  temp.GSI = C2K(24.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    0  9.58 NaN
    1 13.78 NaN
    2 18.78 NaN
    3 23.37 NaN
    4 27.55 29.10
    5 31.39 31.47
    6 30.74 32.85
    7 33.80 33.40
    8 35.44 35.80
    9 36.94 35.37
   10 37.25 38.33
   11 35.47 36.04
   12 NaN   42.10
   13 41.70 NaN
   14 NaN   44.80
   15 NaN   43.40
   16 NaN   43.65
   17 49.20 45.23
   18 41.00 44.90
   19 47.30 NaN
   20 43.80 NaN
   21 NaN   43.70
   22 44.25 NaN
   23 44.10 NaN
   24 46.05 45.50
   25 50.50 NaN
   26 NaN   NaN
   28 NaN   43.20
   38 48.60 NaN];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0.5);
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm  = C2K(24.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BuxtClar1992'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02188*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BT54'; % Cat of Life
metaData.links.id_ITIS = '647957'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pachymetopon_grande'; % Wikipedia
metaData.links.id_ADW = 'Pachymetopon_grande'; % ADW
metaData.links.id_Taxo = '182468'; % Taxonomicon
metaData.links.id_WoRMS = '218608'; % WoRMS
metaData.links.id_fishbase = 'Pachymetopon-grande'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pachymetopon_grande}}';
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
bibkey = 'BuxtClar1992'; type = 'article'; bib = [ ... 
'doi = {10.10520/AJA00445096_661}, ' ...
'author = {Buxton, C.D. and J.R. Clarke}, ' ... 
'year = {1992}, ' ...
'title = {The biology of the bronze bream, \emph{Pachymetopon grande} ({T}eleostei: {S}paridae) from the south-east {C}ape coast, {S}outh {A}frica}, ' ...
'journal = {S. Afr. J. Zool.}, ' ...
'chapter = {27(1)}, ' ...
'pages = {21-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pachymetopon-grande.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


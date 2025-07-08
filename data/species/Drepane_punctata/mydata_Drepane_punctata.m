function [data, auxData, metaData, txtData, weights] = mydata_Drepane_punctata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Drepaneidae';
metaData.species    = 'Drepane_punctata'; 
metaData.species_en = 'Spotted sicklefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 03];

%% set data
% zero-variate data

data.am = 40*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PillDeva1975';
  comment.Wwb = 'based egg diameter of 0.75 mm: pi/6*0.075^3'; 
data.Wwp = 337; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^3.06, see F1';
data.Wwi = 5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PillDeva1975';
  comment.Wwi = 'based on 0.01778*Li^3.06, see F1, gives 2.8 kg';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
365-171.155	13.978
365-139.531	16.887
365-109.393	17.241
365+195.665	28.107
365+226.576	28.972
365+255.039	31.539
365+317.811	29.355
365+380.285	34.661
730+196.127	36.447
730+256.404	37.156
730+321.474	37.017
730+379.336	38.575];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHari1986';

% length-weight-fecundity
LWN = [ ... % total length (cm), weight (g), fecundity (#)
    37.3 2750 149251
    38.0 3250 152797
    38.3 3000 281784
    41.0 3250 223390
    41.8 3500 315859
    42.5 3500 406492
    43.6 3500 490819
    44.0 3750 438648
    44.3 3500 429742
    45.0 3750 628103
    45.6 3750 796932];
data.LN = LWN(:,[1 3]); % ignore weights, they seem to be guessed
units.LN   = {'d', 'cm'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(28.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PillDeva1975';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ws in g = 0.01778*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6DKT4'; % Cat of Life
metaData.links.id_ITIS = '645673'; % ITIS
metaData.links.id_EoL = '46581366'; % Ency of Life
metaData.links.id_Wiki = 'Drepane_punctata'; % Wikipedia
metaData.links.id_ADW = 'Drepane_punctata'; % ADW
metaData.links.id_Taxo = '173423'; % Taxonomicon
metaData.links.id_WoRMS = '220046'; % WoRMS
metaData.links.id_fishbase = 'Drepane-punctata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Drepane_punctata}}';
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
bibkey = 'DwipHari1986'; type = 'techreport'; bib = [ ... 
'author = {Dwiponggo, A. and Hariati, T. and Banon, S. and Palomares, M L D and Pauly, Daniel}, ' ... 
'year = {1986}, ' ...
'title = {Growth, mortality and recruitment of commercially important fishes and penaed shrimps in {I}ndonesian waters}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'series = {ICLARM Technical Reports}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'PillDeva1975'; type = 'techreport'; bib = [ ... 
'author = {Pillai, P. K. Mahadevan and P. Devadoss}, ' ... 
'year = {1975}, ' ...
'title = {A note on the fecundity and spawning period of \emph{Drepane punctata} ({L}innaeus)}, ' ...
'institution = {Indian councel of Scientific Reseach}, ' ...
'pages = {262-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Drepane-punctata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

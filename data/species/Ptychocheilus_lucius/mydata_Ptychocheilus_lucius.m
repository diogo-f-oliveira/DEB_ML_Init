function [data, auxData, metaData, txtData, weights] = mydata_Ptychocheilus_lucius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Ptychocheilus_lucius'; 
metaData.species_en = 'Colorado pikeminnow'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 17]; 

%% set data
% zero-variate data

data.tp = 3 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'ValdRyel2002';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Li = 180;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'Wiki'; 
  
data.Wwb = 3.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Insl1983';
  comment.Wwb = 'based on egg diameter of 1.86 mm: pi/6*0.186^3';
data.Wwi = 57.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = {'Wiki','VaniKram1969'};
     
% % univariate data
 
% time-length
data.tL = [ ... % days post hatch, total length (cm)
 1  4.4
 2  9.5
 3 16.2
 4 23.8
 5 32.0
 6 39.1
 7 45.4
 8 49.9
 9 53.6
10 57.0
11 60.0];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VaniKram1969'; 
comment.tL = 'Data from Green River, Colorado 1964-1966';
%  
% time-weight
data.tWw = [ ... % time since hatch (d), wet weight (g)
 1    1
 2    6
 3   30
 4  104
 5  260
 6  478
 7  757
 8 1040
 9 1220
10 1575
11 1850];
data.tWw(:,1) = 365 * (0 + data.tWw(:,1));
units.tWw = {'d', 'g'}; label.tWw = {'time since hatch', 'wet weight'};  
temp.tWw = C2K(16);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'VaniKram1969'; 
comment.tWw = 'Data from Green River, Colorado 1964-1966';

% weight - fecundity
WwN = [ ... weight (lb, oz), vol of eggs (ml), egg diameter (mm), number of egg per ml
2 12 510 1.94 161.6 
2 6 425 1.84  186.8 
2 8 410 2.19 112.0 
2 3 300 1.70 237.7 
1 10 275 1.90 170.3 
1 8 250 1.97 154.2 
1 15 450 1.86 188.3 
1 12 225 1.85 183.8 
1 12 300 1.92 166.0 
1 13 350 1.88 175.0 
1 14 380 1.86 182.3 
2 0 350 1.87 187.1 
1 12 225 1.82 193.2 
1 9 250 1.77 212.0 
1 10 375 1.89 172.3 
1 12 320 1.78 207.8 
2 3 420 1.89 172.8 
2 3 325 1.89 174.4];
data.WwN = [453.59237*WwN(:,1)+28.35*WwN(:,2), WwN(:,3).*WwN(:,5)];
units.WwN = {'g', '#'}; label.WwN = {'wet weight','fecundity'};  
temp.WwN = C2K(16);  units.temp.WwN = 'K'; label.temp.WwN = 'temperature';
bibkey.WwN = 'Insl1983'; 
comment.WwN = 'All fish had age class 8';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: log10 W in g = -5.4177 + 3.126 * log10 (TL in mm)';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1', F1); 

%% Links
metaData.links.id_CoL = '4Q9YK'; % Cat of Life
metaData.links.id_ITIS = '163525'; % ITIS
metaData.links.id_EoL = '223956'; % Ency of Life
metaData.links.id_Wiki = 'Ptychocheilus_lucius'; % Wikipedia
metaData.links.id_ADW = 'Ptychocheilus_lucius'; % ADW
metaData.links.id_Taxo = '43664'; % Taxonomicon
metaData.links.id_WoRMS = '1021391'; % WoRMS
metaData.links.id_fishbase = 'Ptychocheilus-lucius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ptychocheilus_lucius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Ptychocheilus-lucius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'VaniKram1969'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1969)98[193:LHOTCS]2.0.CO;2}, ' ...
'author = {C. David Vanicek and Robert H. Kramer}, ' ...
'year = {1969}, ' ...
'title  = {Life History of the {C}olorado Squawfish, \emph{Ptychocheilus lucius}, and the {C}olorado Chub, \emph{Gila robusta}, in the {G}reen {R}iver in {D}inosaur {N}ational {M}onument, 1964-1966}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'pages = {193-208}, ' ...
'volume = {98}, ' ...
'number = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Insl1983'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://www.nativefishlab.net}}, ' ...
'author = {Theophilus D. Inslee}, ' ...
'year = {1983}, ' ...
'title  = {SPAWNING AND HATCHING OF THE COLORADO SQUAWFISH (\emph{Ptychocheilus lucius})}, ' ...
'institution = {U.S. Fish and Wildlife Service P.O. Box 217 Dexter, New Mexico 88230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ValdRyel2002'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://www.nativefishlab.net}}, ' ...
'author = {Richard Valdez and Ronald Ryel and Stephen Carothers}, ' ...
'year = {2002}, ' ...
'title  = {Colorado pikeminnow(\emph{Ptychocheilus lucius}) recovery goals}, ' ...
'institution = {U.S. Fish and Wildlife Service Mountain-Prairie Region(6) Denver, colorado}'];
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

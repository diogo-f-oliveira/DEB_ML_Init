  function [data, auxData, metaData, txtData, weights] = mydata_Crystallaria_asprella
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Crystallaria_asprella'; 
metaData.species_en = 'Crystal darter';

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp

metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'GeorSlac1996';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.7;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'GeorSlac1996'; 
  comment.Lp = 'based on SL 5 cm and F2';
data.Li = 16;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GeorSlac1996';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwi = 22.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri = 576/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  
temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
bibkey.Ri = 'GeorSlac1996';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
    0 4.734
    1 6.917
    2 8.865];
data.tL_f(:,1) = 365 * (0.9 + data.tL_f(:,1));  % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.88;  % convert SL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GeorSlac1996';
comment.tL_f = 'data for females from Saline River, Arkansas June 1969';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
    0 4.734
    1 7.239
    2 9.443];
data.tL_m(:,1) = 365 * (0.9 + data.tL_m(:,1));  % convert yr to d
data.tL_m(:,2) = data.tL_f(:,2)/ 0.88;  % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GeorSlac1996';
comment.tL_m = 'data for males from Saline River, Arkansas June 1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;
%weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.88 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '323XG'; % Cat of Life
metaData.links.id_ITIS = '201982'; % ITIS
metaData.links.id_EoL = '216442'; % Ency of Life
metaData.links.id_Wiki = 'Crystallaria_asprella'; % Wikipedia
metaData.links.id_ADW = 'Crystallaria_asprella'; % ADW
metaData.links.id_Taxo = '338263'; % Taxonomicon
metaData.links.id_WoRMS = '1042350'; % WoRMS
metaData.links.id_fishbase = 'Crystallaria-asprella'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Crystallaria_asprella}}';  
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
bibkey = 'GeorSlac1996'; type = 'article'; bib = [ ...
'author = {Steven G. George and William T. Slack and Neil H. Douglas}, ' ...
'year = {1996}, ' ...
'title = {Demography, Habitat, Reproduction, and Sexual Dimorphism of the Crystal Darter, \emph{Crystallaria asprella} ({J}ordan), from South-Central {A}rkansas}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1996(2)}, ' ...
'pages = {68-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Crystallaria-asprella.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

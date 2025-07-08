function [data, auxData, metaData, txtData, weights] = mydata_Microchirus_variegatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Microchirus_variegatus'; 
metaData.species_en = 'Thickback sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.3); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'}; 
metaData.date_subm  = [2019 02 14]; 
metaData.email      = {'bas.kooijman@vu.nl'}; 
metaData.address    = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.am = 8*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(10.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'Deni1990';
data.Li = 20.5;    units.Li = 'cm';   label.Li = 'ultimate total length for females';   bibkey.Li = 'Deni1990';
data.Lim = 17.5;    units.Lim = 'cm';   label.Lim = 'ultimate total length for males'; bibkey.Lim = 'Deni1990';

data.Wwb = 1.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7  mm: pi/6*0.07^3';
data.Wwp = 25.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'Deni1990','fishbase'};
  comment.Wwp = 'based on 0.00851*Lp^3.03, see F2';
data.Wwi = 80.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = {'Deni1990','fishbase'};
  comment.Wwi = 'based on 0.00851*Li^3.03, see F2';


data.Ri = 3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'GibsEzzi1980';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity = 10^(3.3472 * log10(standard length in mm = 190)- 2.1064)';

% uni-variate data

% time-length
data.tL_f = [ ... % age (years), total length (cm)
 0  3.2
 1  7
 2 14
 3 15
 4 16.2
 5 18.3
 6 19.5];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(10.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Deni1990';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (years), total length (cm)
 0  3.2
 2 13
 3 13
 5 16.8
 6 18];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(10.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Deni1990';
comment.tL_m = 'Data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 10.3 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Length-Weight relationship: Ww in g = 0.00851*(TL in cm)^3.03';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '73FPL'; % Cat of Life
metaData.links.id_ITIS = '173026'; % ITIS
metaData.links.id_EoL = '46570271'; % Ency of Life
metaData.links.id_Wiki = 'Microchirus_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Microchirus_variegatus'; % ADW
metaData.links.id_Taxo = '179970'; % Taxonomicon
metaData.links.id_WoRMS = '274304'; % WoRMS
metaData.links.id_fishbase = 'Microchirus-variegatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microchirus_variegatus}}';
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
bibkey = 'Deni1990'; type = 'article'; bib = [ ...
'author = {C. Deniel}, ' ... 
'year   = {1990}, ' ...
'title  = {Comparative study of growth of flatfishes on the west coast of {B}rittany}, ' ...
'journal = {Journalof Fish Biology}, ' ...
'page = {149-166}, ' ...
'volume = {37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Microchirus-variegatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

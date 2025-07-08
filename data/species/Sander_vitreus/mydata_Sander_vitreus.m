  function [data, auxData, metaData, txtData, weights] = mydata_Sander_vitreus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Sander_vitreus'; 
metaData.species_en = 'Walleye'; 

metaData.ecoCode.climate = {'Dwa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFe'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 05];                           
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
data.ab = 15;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12 to 18 d';
data.am = 29*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase'; 
data.Li = 107;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Aart2007';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Sander lucioperca: pi/6*0.09^3';
data.Wwp = 430;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 11.3e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';

data.Ri = 612e3/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';           bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1 16.8
2 25.4
3 32.1
4 36.7
5 39.8
6 42.0
7 43.6];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HeRuds2005';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1 16.4
2 25.0
3 31.2
4 35.2
5 37.7
6 39.4
7 40.8];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HeRuds2005';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6XHMF'; % Cat of Life
metaData.links.id_ITIS = '650173'; % ITIS
metaData.links.id_EoL = '46580136'; % Ency of Life
metaData.links.id_Wiki = 'Sander_vitreus'; % Wikipedia
metaData.links.id_ADW = 'Sander_vitreus'; % ADW
metaData.links.id_Taxo = '691816'; % Taxonomicon
metaData.links.id_WoRMS = '275311'; % WoRMS
metaData.links.id_fishbase = 'Sander-vitreus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sander_vitreus}}';  
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
bibkey = 'HeRuds2005'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2005.00696.x}, ' ...
'author = {J. X. He and L. G. Rudstam and J. L. Forney and A. J. Vandevalk and D. J. Steward}, ' ...
'year = {2005}, ' ...
'title = {Long-term patterns in growth of {O}neida {L}ake walleye: a multivariate and stage-explicit approach for applying the von {B}ertalanffy growth function}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, '...
'pages = {1459-1470}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aart2007'; type = 'Techreport'; bib = [ ...  
'author = {Aarts, T. W. P. M.}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument snoekbaars, \emph{Sander lucioperca} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {16}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-pos_4554.pdf}+}'];
%
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sander-vitreus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Polydactylus_quadrifilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Polydactylus_quadrifilis'; 
metaData.species_en = 'African giant threadfin'; 

metaData.ecoCode.climate = {'MA', 'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 07];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Polydactylus_macrochir';  
data.Lp  = 82.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ButlChil2018'; 
data.Li  = 200;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm as typical for Polydactylus: pi/6*0.0775^3'; 
data.Wwi  = 85e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on  0.00661*Li^3.09, see F1; max published weight 75 kg';

data.GSI = 0.055; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'ButlChil2018';
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1.5	46.175
2.5	63.433
3.5	71.316
4.5	79.207
5.5	86.650];
data.tL(:,1) = 365 * (0.6+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_Eig','tL_Roe','tL_Der','tL_Cha','tL_Rop'}; subtitle1 = {'Data for loc Eig, Roe, Der, Cha, Rop'};
% set2 = {'tL_Fli','tL_Spr','tL_Fit','tL_Mar','tL_Bri'}; subtitle2 = {'Data for loc Fli, Spr, Fit, Mar, Bri'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Locations are assumed to vary in food availebility, not in guessed temperatures';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protandrous hermaphrodite (first male, then female)';
metaData.bibkey.F2 = 'ButlChil2018'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '77SDS'; % Cat of Life
metaData.links.id_ITIS = '645936'; % ITIS
metaData.links.id_EoL = '46578853'; % Ency of Life
metaData.links.id_Wiki = 'Polydactylus_quadrifilis'; % Wikipedia
metaData.links.id_ADW = 'Polydactylus_quadrifilis'; % ADW
metaData.links.id_Taxo = '46320'; % Taxonomicon
metaData.links.id_WoRMS = '276599'; % WoRMS
metaData.links.id_fishbase = 'Polydactylus-quadrifilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polydactylus_quadrifilis}}';
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ButlChil2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-017-0699-6}, ' ...
'author = {Edward C. Butler and Amber-Robyn Childs and Alexander C. Winkler and Marianne V. Milner and Warren M. Potts}, ' ... 
'year = {2018}, ' ...
'title = {Evidence for protandry in \emph{Polydactylus quadrifilis} in the {K}wanza {E}stuary, {A}ngola, and its implications for local fisheries}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {101}, ' ...
'pages = {301–313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Polydactylus-quadrifilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Semotilus_atromaculatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Semotilus_atromaculatus'; 
metaData.species_en = 'Creek chub'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', '0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2019 03 05];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'total';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;  units.Lp = 'cm'; label.Lp = 'fork length at puberty for females'; bibkey.Lp = 'Wiki';
  comment.Lp = 'based on a_p = 1.5 yr, but temp unknown';
data.Li = 30.3;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';

data.Ri = 2255/365; units.Ri = '#/d';  label.Ri = 'reprod rate for FL 40.2 cm';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    1 1.82
    2 2.02
    3 2.15
    4 2.21
    5 2.05];
data.tL_f(:,1) = 365 * (0.75+data.tL_f(:,1)); % convert yr to d
data.tL_f(:,2) = 10.^data.tL_f(:,2)/ 10; % cm, remove log transform
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HensSper2006';
comment.tL_f = 'data for females in Little Indian Creek';
%
data.tL_m = [ ... % time since birth (yr), log10 total length (cm)
    1 1.85
    2 2.07
    3 2.18
    4 2.31
    5 2.25];
data.tL_m(:,1) = 365 * (0.75+data.tL_m(:,1)); % convert yr to d
data.tL_m(:,2) = 10.^data.tL_m(:,2)/ 10; % cm, remove log transform
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HensSper2006';
comment.tL_m = 'data for males in Little Indian Creek';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
    1 0.53
    2 1.02
    3 1.48
    4 1.69
    5 1.20];
data.tW_f(:,1) = 365 * (0.75+data.tW_f(:,1)); % convert yr to d
data.tW_f(:,2) = 10.^data.tW_f(:,2); % cm, remove log transform
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(18);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'HensSper2006';
comment.tW_f = 'data for females in Little Indian Creek';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
    1 0.62
    2 1.25
    3 1.61
    4 2.01
    5 1.84];
data.tW_m(:,1) = 365 * (0.75+data.tW_m(:,1)); % convert yr to d
data.tW_m(:,2) = 10.^data.tW_m(:,2); % cm, remove log transform
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(18);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'HensSper2006';
comment.tW_m = 'data for males in Little Indian Creek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.tL_f(end) = 0;
weights.tL_m(end) = 0;
weights.tW_f(end) = 0;
weights.tW_m(end) = 0;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4WHNV'; % Cat of Life
metaData.links.id_ITIS = '163376'; % ITIS
metaData.links.id_EoL = '136002'; % Ency of Life
metaData.links.id_Wiki = 'Semotilus_atromaculatus'; % Wikipedia
metaData.links.id_ADW = 'Semotilus_atromaculatus'; % ADW
metaData.links.id_Taxo = '42292'; % Taxonomicon
metaData.links.id_WoRMS = '590495'; % WoRMS
metaData.links.id_fishbase = 'Semotilus-atromaculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Semotilus_atromaculatus}}';  
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
bibkey = 'HensSper2006'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2005.00875.x}, ' ...
'author = {D. S. Henshell and D. W. Sparks and T. P. Simon and M. J. Tosick}, ' ...
'year = {2006}, ' ...
'title = {Age structure and growth of \emph{Semotilus atromaculatus} ({M}itchill) in {P}{C}{B}-contaminated streams}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {68}, '...
'pages = {44-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Semotilus-atromaculatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


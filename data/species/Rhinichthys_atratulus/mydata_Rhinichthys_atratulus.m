  function [data, auxData, metaData, txtData, weights] = mydata_Rhinichthys_atratulus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rhinichthys_atratulus'; 
metaData.species_en = 'Eastern blacknose dace'; 

metaData.ecoCode.climate = {'Cfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 05 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                        bibkey.am = 'ReedMoul1973';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.75;  units.Lp = 'cm'; label.Lp = 'total length at puberty';               bibkey.Lp = 'FrakSnod2002'; 
data.Li = 8.5;    units.Li = 'cm'; label.Li = 'ultimate total length for females';    bibkey.Li = 'ReedMoul1973';
data.Lim = 7.2;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males';   bibkey.Lim = 'ReedMoul1973';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 1.44;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';             bibkey.Wwp = {'FrakSnod2002','ReedMoul1973'};
  comment.Wwp = 'based on 10^(-4.795 + 2.954 * log10(10*Lp)), see F1';
data.Wwi = 4.6;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'ReedMoul1973';
  comment.Wwi = 'based on 10^(-4.795 + 2.954 * log10(10*Li)), see F1';
data.Wwim = 2.77;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';               bibkey.Wwim = 'ReedMoul1973';
  comment.Wwim = 'based on 10^(-4.795 + 2.954 * log10(10*Lim))), see F1';

data.Ri = 2674/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max rate';           bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    0 4.08
    1 5.46
    2 6.16
    3 7.90];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ReedMoul1973';
comment.tL_f = 'data for females, Harts Brook';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    0 4.08
    1 5.39
    2 6.03
    3 7.02];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ReedMoul1973';
comment.tL_m = 'data for males, Harts Brook';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 10^(-4.795 + 2.954 * log10(TL in mm))';
metaData.bibkey.F1 = 'ReedMoul1973'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WTP4'; % Cat of Life
metaData.links.id_ITIS = '163382'; % ITIS
metaData.links.id_EoL = '212618'; % Ency of Life
metaData.links.id_Wiki = 'Rhinichthys_atratulus'; % Wikipedia
metaData.links.id_ADW = 'Rhinichthys_atratulus'; % ADW
metaData.links.id_Taxo = '43666'; % Taxonomicon
metaData.links.id_WoRMS = '159985'; % WoRMS
metaData.links.id_fishbase = 'Rhinichthys-atratulus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhinichthys_atratulus}}';  
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
bibkey = 'ReedMoul1973'; type = 'Article'; bib = [ ...  
'doi = {10.2307/2424282}, ' ...
'author = {Reed, R. J. and Moulton, J. C.}, ' ...
'year = {1973}, ' ...
'title = {Age and Growth of Blacknose Dace, \emph{Rhinichthys atratulus} and Longnose Dace, \emph{R. cataractae} in {M}assachusetts}, ' ... 
'journal = {American Midland Naturalist}, ' ...
'volume = {90}, '...
'pages = {206}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FrakSnod2002'; type = 'Article'; bib = [ ...  
'doi = {10.1643/0045-8511(2002)002[1122:DIGAMO]2.0.CO;2}, ' ...
'author = {Michael E. Fraker and Joel W. Snodgrass and Fanta Morgan}, ' ...
'year = {2002}, ' ...
'title = {Differences in Growth and Maturation of Blacknose Dace (\emph{Rhinichthys atratulus}) across an Urban-Rural Gradient}, ' ... 
'journal = {Copeia}, ' ...
'volume = {2002}, '...
'pages = {1122-1127}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhinichthys-atratulus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  function [data, auxData, metaData, txtData, weights] = mydata_Vimba_vimba

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Vimba_vimba'; 
metaData.species_en = 'Vimba bream'; 

metaData.ecoCode.climate = {'BSk', 'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2019 03 26];                           
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
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.7;  units.Lp = 'cm'; label.Lp = 'fork length at puberty for females'; bibkey.Lp = 'OkgeElp2011';
  comment.Lp = 'value for Sapance Lake, Turkey, 25 cm in Finland';
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate fork length';             bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'WiesSchi1992';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 1.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';

data.Ri = 2e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
    2 12.62
    3 14.58
    4 17.03
    5 17.87
    6 19.43];
data.tL_f(:,1) = 365 * (0.25+data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OkgeElp2011';
comment.tL_f = 'data for females, Sapanca Lake, Turkey, 2003 & 2004';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
    2 12.21
    3 14.04
    4 15.60
    5 17.09
    6 19.30];
data.tL_m(:,1) = 365 * (0.25+data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OkgeElp2011';
comment.tL_m = 'data for males, Sapanca Lake, Turkey, 2003 & 2004';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
    2  27.47
    3 46.49
    4 71.38
    5 82.75
    6 103.58];
data.tW_f(:,1) = 365 * (0.25+data.tW_f(:,1)); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(20);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'OkgeElp2011';
comment.tW_f = 'data for females, Sapanca Lake, Turkey, 2003 & 2004';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
    2 24.38
    3 40.69
    4 54.77
    5 69.01
    6 94.50];
data.tW_m(:,1) = 365 * (0.25+data.tW_m(:,1)); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(20);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'OkgeElp2011';
comment.tW_m = 'data for males, Sapanca Lake, Turkey, 2003 & 2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0 * weights.psd.k_J; weights.psd.k = 0.2 * weights.psd.k;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature during reproduction in tL/tW data was 14.8C, 25 in June and 25.6 in July';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5BFDX'; % Cat of Life
metaData.links.id_ITIS = '639696'; % ITIS
metaData.links.id_EoL = '46581687'; % Ency of Life
metaData.links.id_Wiki = 'Vimba_vimba'; % Wikipedia
metaData.links.id_ADW = 'Vimba_vimba'; % ADW
metaData.links.id_Taxo = '43687'; % Taxonomicon
metaData.links.id_WoRMS = '283150'; % WoRMS
metaData.links.id_fishbase = 'Vimba-vimba'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Vimba_vimba}}';  
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
bibkey = 'OkgeElp2011'; type = 'article'; bib = [ ...  
'doi = {10.3906/zoo-0901-16}, ' ...
'author = {Hacer Okgerman and Mahmut Elp and Cumhur H. Yardimci}, ' ...
'year = {2011}, ' ...
'title = {Growth, the length-weight relationship, and reproduction in vimba (\emph{Vimba vimba} {L}. 1758) sampled from an oligo-mesotrophic lake in northwest {A}natolia ({T}urkey)}, ' ... 
'journal = {Turk J Zool}, ' ...
'volume = {35}, '...
'pages = {87-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WiesSchi1992'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {W. Wieser and F. Schiemer and A. Goldschmidt and K. Kotrschal}, ' ...
'year = {1992}, ' ...
'title  = {Environmental biology of European cyprinids}, ' ...
'publisher = {Springer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Vimba-vimba.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


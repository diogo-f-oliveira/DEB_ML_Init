function [data, auxData, metaData, txtData, weights] = mydata_Zearaja_chilensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Zearaja_chilensis'; 
metaData.species_en = 'Yellownose skate '; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW', 'MPSE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.7); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 03 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.am = 21*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'LicaLami2006';   
  temp.am = C2K(6.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 17;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on on Beringraja_binoculata';
data.Lp  = 106;   units.Lp  = 'cm';  label.Lp  = 'total lengtb at puberty for females';   bibkey.Lp  = 'LicaLami2006';
data.Lpm = 86;    units.Lpm  = 'cm';  label.Lpm  = 'total lengtb at puberty  for males';   bibkey.Lpm  = 'LicaLami2006';
data.Li  = 210; units.Li  = 'cm';  label.Li  = 'ultimate disk width for females';   bibkey.Li  = 'fishbase';

data.Wwp = 9.4e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00309*Lp^3.20, see F1';
data.Wwpm = 2.05e3; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for females';   bibkey.Wwpm = 'fishbase';
  comment.Wwpm = 'based on 0.00309*Lpm^3.20, see F1';
data.Wwi = 83.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.20, see F1';

data.Ri  = 200/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(6.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Beringraja_binoculata, with temperature correction';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), disc width (cm)
  1  23.0
  2  33.0
  3  39.8
  4  48.6
  5  58.6
  6  62.3
  7  70.7
  8  77.7
  9  85.3
 10  91.5
 11  98.1
 12 100.9
 13 104.3
 14 103.9
 15 104.2
 16 106.6
 17 106.7
 18 112.0
 19 113.3
 20 115.5
 21 116.5];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(6.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LicaLami2006';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
  2  36.0
  3  41.0
  4  53.8
  5  58.7
  6  62.8
  7  69.4
  8  74.2
  9  77.3
 10  84.9
 11  85.9
 12  89.1
 13  95.2
 14  90.8
 15  95.3
 16  97.4
 17 102.0
 18  93.0];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(6.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LicaLami2006';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

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
D1 = 'males are assumed to differ from females by {p_Am} anf E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00309*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7GCM8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560637'; % Ency of Life
metaData.links.id_Wiki = 'Zearaja'; % Wikipedia
metaData.links.id_ADW = 'Zearaja_chilensis'; % ADW
metaData.links.id_Taxo = '1684069'; % Taxonomicon
metaData.links.id_WoRMS = '315953'; % WoRMS
metaData.links.id_fishbase = 'Zearaja-chilensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zearaja}}'; 
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
bibkey = 'LicaLami2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2006.00936.x}, ' ...
'author = {R. R. Licandeo and J. G. Lamilla and P. G. Rubilar and R. M. Vega}, ' ...
'year = {2006}, ' ...
'title  = {Age, growth, and sexual maturity of the yellownose skate \emph{Dipturus chilensis} in the south-eastern {P}acific}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {68}, ' ...
'pages = {488-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Zearaja-chilensis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Synodus_saurus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Synodus_saurus'; 
metaData.species_en = 'Atlantic lizardfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MA', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 14];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'ManaAvsa2008';  
  temp.am = C2K(19.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16.6;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'ManaAvsa2008';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Saurida undosquamis: pi/6*0.09^3';
data.Wwi = 553; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.16, see F1';

data.Ri = 2*58599/365; units.Ri = '#/d';  label.Ri = 'reprod rate at TL 31 cm'; bibkey.Ri = 'ManaAvsa2008';
  temp.Ri = C2K(19.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'spawns twice per yr';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ fork length (cm) 
    1 10.70 11.70
    2 14.86 15.48
    3 18.24 17.90
    4 20.97 20.03
    5 24.37 22.03
    6 25.59 NaN
   10 29.56 NaN];
data.tL_fm(:,1) = 365 * (.7 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(19.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ManaAvsa2008'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data for females, males';

% time-weight
data.tW_fm = [ ... % age (yrs), weight (g) 
    1   9.11 10.87
    2  24.01 30.78
    3  48.68 45.23
    4  77.35 61.75
    5 118.6  84.90
    6 130.1  NaN 
   10 207.4  NaN];
data.tW_fm(:,1) = 365 * (.7 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(19.8);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ManaAvsa2008'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'data for females, males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00479*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53XVJ'; % Cat of Life
metaData.links.id_ITIS = '162380'; % ITIS
metaData.links.id_EoL = '66649516'; % Ency of Life
metaData.links.id_Wiki = 'Synodus_saurus'; % Wikipedia
metaData.links.id_ADW = 'Synodus_saurus'; % ADW
metaData.links.id_Taxo = '188741'; % Taxonomicon
metaData.links.id_WoRMS = '126372'; % WoRMS
metaData.links.id_fishbase = 'Synodus-saurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synodus_saurus}}';
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
bibkey = 'ManaAvsa2008'; type = 'article'; bib = [ ...
'doi = {10.3153/jfscom.2008029}, ' ...
'author = {Meltem Mana\c{s}irli and Dursun Av\c{s}ar and Hacer Yeldan and Erdo\v{g}an \c{C}i\c{c}ek}, ' ... 
'year   = {2008}, ' ...
'title  = {POPULATION DYNAMICAL PARAMETERS OF THE ATLANTIC LIZARDFISH (\emph{Synodus saurus}) FROM THE {B}ABADILLIMANI {B}IGHT ({S}ILIFKE-{M}ERSIN) IN {T}URKEY}, ' ...
'journal = {Journal Fisheries Science}, ' ...
'page = {645-652}, ' ...
'volume = {2(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Synodus-saurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


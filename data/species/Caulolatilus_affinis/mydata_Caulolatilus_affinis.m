function [data, auxData, metaData, txtData, weights] = mydata_Caulolatilus_affinis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes';
metaData.family     = 'Latilidae';
metaData.species    = 'Caulolatilus_affinis'; 
metaData.species_en = 'Bighead tilefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 04 27]; 
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

data.am = 21*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'RamiMelo2011';   
  temp.am = C2K(15.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 49.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: 4/3*pi*0.0425^3'; 
data.Wwi = 1.68e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'RamiMelo2011';
  comment.Wwi = 'based on 0.000084*(Li*10)^2.71, see F1';

data.Ri  = 4.5e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on kap = 0.8 as found for Lutjanus species';

% uni-variate data
% t-L data
data.tL_f = [ ... % time since birth (yr), total length (cm)
    4 29.7
    5 32.8
    6 32.2
    7 34.2
    8 35.5
    9 35.4
   10 38.3
   11 37.4
   12 38.4
   13 38.9
   14 40.9
   15 41.1
   16 39.8
   17 41.7
   18 43.2
   19 45.5
   20 44.8];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(15.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RamiMelo2011';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    3 24.8
    4 30.3
    5 30.9
    6 32.8
    7 33.8
    8 34.6
    9 35.3
   10 38.6
   11 38.4
   12 40.4
   13 40.4
   14 41.3
   15 41.0
   16 41.4
   17 42.9
   18 43.6
   20 45.3
   21 45.8];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(15.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RamiMelo2011';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'Temperatures are guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.000084*(TL in mm)^2.71';
metaData.bibkey.F1 = 'RamiMelo2011'; 
F2 = 'Marine; brackish; reef-associated; depth range 30 - 185 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'RXCJ'; % Cat of Life
metaData.links.id_ITIS = '645611'; % ITIS
metaData.links.id_EoL = '46580671'; % Ency of Life
metaData.links.id_Wiki = 'Caulolatilus'; % Wikipedia
metaData.links.id_ADW = 'Caulolatilus_affinis'; % ADW
metaData.links.id_Taxo = '166655'; % Taxonomicon
metaData.links.id_WoRMS = '276217'; % WoRMS
metaData.links.id_fishbase = 'Caulolatilus-affinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caulolatilus}}';
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
bibkey = 'RamiMelo2011'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v37i1.1718}, ' ...
'author = {J. S. Ram\''{i}rez-P\''{e}rez and F. N. Melo-Barrera and L. E. Ayala-Bobadilla}, ' ... 
'year = {2011}, ' ...
'title = {Age and growth of Pacific golden-eye tilefish (\emph{Caulolatilus affinis}) in the central region of the {G}ulf of {C}alifornia}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {37}, ' ...
'pages = {71-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Caulolatilus-affinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

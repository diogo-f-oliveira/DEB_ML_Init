function [data, auxData, metaData, txtData, weights] = mydata_Paralichthys_patagonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Paralichthys_patagonicus'; 
metaData.species_en = 'Patagonian flounder'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 19];

%% set data
% zero-variate data

data.ab = 4; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 13*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'ArauHaiv2000';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 48; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 5.6e-04; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.02 mm of P. dentatus: pi/6*0.102^3';
data.Wwp = 287; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00537*Lp^3.16, see F1';
data.Wwi = 875;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.16, see F1';
 
data.GSI = 0.04;       units.GSI = 'g/g';  label.GSI = 'gonado somatic index';     bibkey.GSI = 'ArauHaiv2000';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), total length (cm)
    1 19.6 19.4
    2 32.4 29.8
    3 41.0 35.1
    4 45.3 39.6
    5 48.7 41.5
    6 51.0 43.8
    7 52.6 45.2
    8 53.9 47.0
    9 54.4 48.8
   10 56.0 50.0
   11 56.5 NaN
   12 58.0 NaN]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'age', 'total length'};  
temp.tL_fm = C2K(17); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ArauHaiv2000'; treat.tL_fm = {1 {'females','males'}}; 
comment.tL_fm = 'temperature varies between 12 and 23 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CYVW'; % Cat of Life
metaData.links.id_ITIS = '616424'; % ITIS
metaData.links.id_EoL = '46570514'; % Ency of Life
metaData.links.id_Wiki = 'Paralichthys'; % Wikipedia
metaData.links.id_ADW = 'Paralichthys_patagonicus'; % ADW
metaData.links.id_Taxo = '182816'; % Taxonomicon
metaData.links.id_WoRMS = '275818'; % WoRMS
metaData.links.id_fishbase = 'Paralichthys-patagonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralichthys}}';
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
bibkey = 'ArauHaiv2000'; type = 'article'; bib = [ ...
'author = {J\''{u}lio Neves de Ara\''{u}jol and Manuel Haimovici}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of the white flounder \emph{Paralichthys patagonicus} ({J}ordan, 1889) in southern {B}razil}, ' ...
'journal = {Rev. bras. oceanogr.}, ' ...
'volume = {48(1)}, ' ...
'pages = {61-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Paralichthys-patagonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


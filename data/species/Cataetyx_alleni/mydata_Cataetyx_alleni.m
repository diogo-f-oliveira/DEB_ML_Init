function [data, auxData, metaData, txtData, weights] = mydata_Cataetyx_alleni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Bythitidae';
metaData.species    = 'Cataetyx_alleni'; 
metaData.species_en = 'Allen''s brotula'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 10];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(13.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'FallPorc2011';
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 4.4e-4;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'FallPorc2011';
  comment.Wwb = 'based on egg diameter of 0.943 mm: pi/6*0.0943^3';
data.Wwp = 2.56;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','FallPorc2011'};
  comment.Wwp = 'based on 0.00457*Lp^3.10, see F1';
data.Wwi = 10.1;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.10, see F1';
 
data.Ri = 1e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(13.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Genypterus_blacodes: 5e5*20/1e4';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    0 3
    2 9
    3 9
    4 9
    5 9];
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'length'};  
temp.tL    = C2K(13.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mora1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_fN','tL_mN'}; subtitle1 = {'Data for females, males, north austral zone'};
% set2 = {'tL_fS','tL_mS'}; subtitle2 = {'Data for females, males, south austral zone'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'RRM7'; % Cat of Life
metaData.links.id_ITIS = '164900'; % ITIS
metaData.links.id_EoL = '46565166'; % Ency of Life
metaData.links.id_Wiki = 'Cataetyx_alleni'; % Wikipedia
metaData.links.id_ADW = 'Cataetyx_alleni'; % ADW
metaData.links.id_Taxo = '166606'; % Taxonomicon
metaData.links.id_WoRMS = '126656'; % WoRMS
metaData.links.id_fishbase = 'Cataetyx-alleni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cataetyx_alleni}}';
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
bibkey = 'Mora1990'; type = 'Article'; bib = [ ... 
'author = {Beatriz Morales-Nin}, ' ... 
'year = {1990}, ' ...
'title = {A first attempt at determining growth patterns of some Mediterranean deep-sea fishes}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {54(3)}, ' ...
'pages = {241-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FallPorc2011'; type = 'Article'; bib = [ ... 
'doi = {10.3989/scimar.2011.75n2391}, ' ...
'author = {Maria Cristina Fallesa and Cristina Porcu and Antonello Mulas and Susanna Salvadori and Angelo Cau}, ' ... 
'year = {2011}, ' ...
'title = {Reproductive characteristics of the bathyal viviparous fish \emph{Cataetyx alleni} ({O}steichthyes: {B}ythitidae) from the southeastern {S}ardinian {S}ea (central-western {M}editerranean)}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {75(2)}, ' ...
'pages = {391-397}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cataetyx-alleni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


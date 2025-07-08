function [data, auxData, metaData, txtData, weights] = mydata_Lepidion_lepidion

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Moridae';
metaData.species    = 'Lepidion_lepidion'; 
metaData.species_en = 'Mediterranean codling'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.2); % K, body temp
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
  temp.am = C2K(13.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 88.9;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 2.7e-4;   units.Wwb  = 'cm';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Pseudophycis_bachus: pi/6*0.08^3';
data.Wwp = 155.7;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00288*Lp^3.22, see F1';
data.Wwi = 5.4e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00288*Li^3.22, see F1';
 
data.Ri = 2.3e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(13.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.6';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    1 12.0
    2 13.0
    3 14.0
    4 16.6
    5 19.4
    6 20.5
    7 20.9
    8 21.8
    9 22.5
   10 22.2
   11 26.7];
data.tL(:,1) = 365 * (0.8+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'length'};  
temp.tL    = C2K(13.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mora1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

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
F1 = 'length-weight: Ww in g = 0.00288*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6P9N2'; % Cat of Life
metaData.links.id_ITIS = '550674'; % ITIS
metaData.links.id_EoL = '46565004'; % Ency of Life
metaData.links.id_Wiki = 'Lepidion'; % Wikipedia
metaData.links.id_ADW = 'Lepidion_lepidion'; % ADW
metaData.links.id_Taxo = '178348'; % Taxonomicon
metaData.links.id_WoRMS = '126495'; % WoRMS
metaData.links.id_fishbase = 'Lepidion-lepidion'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidion}}';
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
'title = {A first attempt at determining growth patterns of some {M}editerranean deep-sea fishes}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {54(3)}, ' ...
'pages = {241-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepidion-lepidion.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


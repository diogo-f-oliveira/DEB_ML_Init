function [data, auxData, metaData, txtData, weights] = mydata_Inimicus_japonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Synanceiidae';
metaData.species    = 'Inimicus_japonicus'; 
metaData.species_en = 'Devil stinger'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 20];

%% set data
% zero-variate data

data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(20.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'WataKait2003';   
  temp.am = C2K(20.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 29;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.4e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'NaraVela2021';
  comment.Wwb = 'based on egg diameter of 0.44 mm: pi/6*0.044^3';
data.Wwi = 425;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on tW_fm data; 0.01000*Li^3.12, see F1, gives 365 g';
 
data.GSI = 0.07;     units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'WataKait2003';   
  temp.GSI = C2K(20.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % tie since birth (cm), total length (cm)
    1  9.2  8.6
    2 13.6 12.8
    3 17.1 16.1
    4 20.0 18.7
    5 22.4 20.8
    6 24.3 22.4
    7 25.8 23.6
    8 27.0 24.6
    9 28.0 25.4
   10 NaN  26.0
   11 NaN  26.5
   12 NaN  26.9];
data.tL_fm(:,1) = 365 * (0.75 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(20.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'WataKait2003'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % tie since birth (cm), weight (g)
    1  12  11
    2  45  38
    3  98  78
    4 164 124
    5 238 171
    6 312 216
    7 383 256
    8 448 292
    9 507 321
   10 NaN 346
   11 NaN 366
   12 NaN 383];
data.tW_fm(:,1) = 365 * (0.75 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(20.5);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'WataKait2003'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_fm = 3 * weights.tL_fm; 
weights.tW_fm = 3 * weights.tW_fm;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01000*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PQBS'; % Cat of Life
metaData.links.id_ITIS = '167087'; % ITIS
metaData.links.id_EoL = '46568359'; % Ency of Life
metaData.links.id_Wiki = 'Inimicus'; % Wikipedia
metaData.links.id_ADW = 'Inimicus_japonicus'; % ADW
metaData.links.id_Taxo = '177553'; % Taxonomicon
metaData.links.id_WoRMS = '212577'; % WoRMS
metaData.links.id_fishbase = 'Inimicus-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Inimicus}}';
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
bibkey = 'WataKait2003'; type = 'Article'; bib = [ ... 
'author = {Watanabe, K. and M. Kaita and R. Hanada and A. Ito}, ' ... 
'year = {2003}, ' ...
'title = {Age, growth and spawning season of the devil stinger, \emph{Inimicus japonicus}, in the coastal waters of {N}iigata {P}refecture}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {69(2)}, ' ...
'pages = {201-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Inimicus-japonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


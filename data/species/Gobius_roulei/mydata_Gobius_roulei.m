function [data, auxData, metaData, txtData, weights] = mydata_Gobius_roulei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobius_roulei'; 
metaData.species_en = 'Roule''s goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 26];

%% set data
% zero-variate data

data.ab = 15;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(13.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Kova2001';   
  temp.am = C2K(13.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.41;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Kova2001'; 
  comment.Lp = 'based on Gobius niger: 6*8.5/18';
data.Li  = 7;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Kova2001';
data.Lim  = 8.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Kova2001';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm of G.niger: pi/6*0.15*0.045^2';
data.Wwp = 0.32;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Kova2001'};
  comment.Wwp = 'based on 0.00741*Lp^3.08, see F1';
data.Wwi = 3.0;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'fishbase','Kova2001'};
  comment.Wwi = 'based on 0.00741*Li^3.08, see F1';
data.Wwim = 5.4;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = {'fishbase','Kova2001'};
  comment.Wwim = 'based on 0.00741*Lim^3.08, see F1';

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Kova2001';
  temp.GSI = C2K(13.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  yr class (yr), total length (cm)
    0 1.96 1.79
    1 2.91 2.90
    2 3.80 4.33
    3 4.83 4.99
    4 5.51 5.81
    5 6.14 6.59
    6 6.47 6.97
    7 6.40 7.21];
data.tL_fm(:,1) = 365 * (1 + data.tL_fm(:,1)); 
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(13.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kova2001'; treat.tL_fm = {1 {'female','male'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

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
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00741*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KP33'; % Cat of Life
metaData.links.id_ITIS = '171855'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Gobius_roulei'; % Wikipedia
metaData.links.id_ADW = 'Gobius_roulei'; % ADW
metaData.links.id_Taxo = '175377'; % Taxonomicon
metaData.links.id_WoRMS = '126894'; % WoRMS
metaData.links.id_fishbase = 'Gobius-roulei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobius_roulei}}';
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
bibkey = 'Kova2001'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2001.tb00150.x }, ' ...
'author = {M. Kova\v{c}či\''{c}}, ' ... 
'year = {2001}, ' ...
'title = {The biology of Roule''s goby in the {K}varner area, northern {A}driatic {S}ea}, ' ...
'journal = {Journal of Fish Biology }, ' ...
'volume = {59(4)}, ' ...
'pages = {795–809}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Gobius-roulei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


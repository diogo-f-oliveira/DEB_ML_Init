function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_canariensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_canariensis'; 
metaData.species_en = 'Canary tonguesole'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 3.3;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(17.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Chau1972';  
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 2.245e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.35 mm of Cynoglossus_robustus: pi/6*0.035^3';
data.Wwp = 191;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00380*Lp^3.07, see F1';
data.Wwi = 1.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00380*Li^3.07, see F1';

data.Ri = 4.4e5/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 40 cm'; bibkey.Ri = 'guess';
  temp.Ri = C2K(17.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Cynoglossus_robustus';

% uni-variate data
% time-length        
data.tL_fm = [ ... % age (yrs), total length (cm) 
    1 27.5 27.4
    2 34.3 34.3
    3 41.0 39.8
    4 44.8 43.2
    5 49.9 44.5
    6 48.7 46.2
    7 53.2 49.0];
data.tL_fm(:,1) = 365 * (0.2+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Chau1972'; treat.tL_fm = {1, {'females','males'}};


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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00380*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5Y2'; % Cat of Life
metaData.links.id_ITIS = '616314'; % ITIS
metaData.links.id_EoL = '2721'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus_canariensis'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_canariensis'; % ADW
metaData.links.id_Taxo = '172541'; % Taxonomicon
metaData.links.id_WoRMS = '274196'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-canariensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus_canariensis}}';
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
bibkey = 'Chau1972'; type = 'article'; bib = [ ...
'author = {Chauvet, C.}, ' ...
'year = {1972}, ' ...
'title = {Croissance et détermination de l''\^{a}ge par lecture d''\''{e}cailles d''un poisson plat de C\^{o}te d''Ivoire, \emph{Cynoglossus canariensis} ({S}teind. 1882)}, ' ... 
'journal = {Doc. Scient. Centr Rech. Oceanogr. Abidjan}, ' ...
'volume = {III}, ' ...
'pages = {1-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-canariensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

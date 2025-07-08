function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_striatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_striatus'; 
metaData.species_en = 'Striped weakfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 04];

%% set data
% zero-variate data

data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'VieiHaim1993';   
  temp.am = C2K(15.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 60;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 203;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.01023*Lp^2.97, see F1';
data.Wwi = 1954;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.97, see F1';

data.GSI  = 0.03; units.GSI  = '#/d'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(15.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cynoscion_guatucupa';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 1	11.124 10.774
 2	18.131 17.693
 3	24.088 24.088
 4	29.518 29.168
 5	34.861 34.861
 6	38.803 37.314
 7	41.431 39.504
 8	43.095 41.080
 9	44.584 41.781
10	45.898 42.131
11	45.810 43.095
12	46.774 44.146
13	47.299 NaN
14	48.526 NaN
15	48.876 NaN];
data.tL_fm(:,1) = 365 * (0.1+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(15.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'VieiHaim1993'; treat.tL_fm = {1 {'females','males'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BVMY'; % Cat of Life
metaData.links.id_ITIS = '646597'; % ITIS
metaData.links.id_EoL = '46578997'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_striatus'; % ADW
metaData.links.id_Taxo = '172645'; % Taxon
metaData.links.id_WoRMS = '276093'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-striatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion}}';
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
bibkey = 'VieiHaim1993'; type = 'article'; bib = [ ... 
'author = {Vieira, P.C. and M. Haimovici}, ' ... 
'year = {1993}, ' ...
'title = {Idade e crescimento da pescada-olhuda \emph{Cynoscion striatus} ({P}isces, {S}ciaenidae) no sul do {B}rasil}, ' ...
'journal = {Atlantica, Rio Grande}, ' ...
'volume = {15}, ' ...
'pages = {73-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-striatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


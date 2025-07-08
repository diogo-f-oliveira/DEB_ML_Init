  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_simplicispina
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_simplicispina'; 
metaData.species_en = 'Sakarya spined loach'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 03];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ZaneMrak2003';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.5;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
data.Li = 13.4;    units.Li = 'cm'; label.Li = 'ultimate std length for females'; bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'EkmeErka2003';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 0.74;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00437*Lp^3.01, see F1';
data.Wwi = 10.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00437*Li^3.01, see F1; max published weight 15.1 g';

data.Ri = 2141/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'EkmeErka2003';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
1	4.806 4.890
2	6.599 6.342
3	7.688 7.400
4   8.370 8.000];
data.tL_fm(:,1) = 365 * (0.4+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'EkmeErka2003'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
1	0.95 0.91
2	1.98 1.64
3	3.54 2.65
4   4.51 4.32];
data.tW_fm(:,1) = 365 * (0.4+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(22);  units.temp.tW_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tW_fm = 'EkmeErka2003'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00437*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known from Anatolia, Turkey';
metaData.bibkey.F2 = 'EkmeErka2003';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WK3P'; % Cat of Life
metaData.links.id_ITIS = '687869'; % ITIS
metaData.links.id_EoL = '210640'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_simplicispina'; % ADW
metaData.links.id_Taxo = '171520'; % Taxonomicon
metaData.links.id_WoRMS = '1016306'; % WoRMS
metaData.links.id_fishbase = 'Cobitis-simplicispina'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EkmeErka2003'; type = 'Article'; bib = [ ...  
'author = {Fitnat G\"{u}ler Ekmek\c{c}\''{y} and F\"{u}sun Erk''akan}, ' ...
'year = {2003}, ' ...
'title = {Preliminary Data on Growth and Reproduction of \emph{Cobitis simplicispina} from {T}urkey}, ' ... 
'journal = {Folia biologica (Krak\''{o}w)}, ' ...
'volume = {51, Supplement}, '...
'pages = {147-154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cobitis-simplicispina}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


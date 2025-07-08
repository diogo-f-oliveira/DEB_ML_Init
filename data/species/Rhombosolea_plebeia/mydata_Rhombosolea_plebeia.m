function [data, auxData, metaData, txtData, weights] = mydata_Rhombosolea_plebeia

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Rhombosolea_plebeia'; 
metaData.species_en = 'Sand flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 06];

%% set data
% zero-variate data
data.ab = 7.5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(17.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Wiki';  
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 43;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 4.78e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.97 mm: pi/6*0.097^3';
data.Wwp = 80.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','guess'};  
  comment.Wwp = 'based on0.01479*Lp^2.92, see F1';
data.Wwi = 870; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01479*Li^2.92, see F1';

data.Ri  = 0.5e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
    1  7.4  5.3
    2 23.2 20.0
    3 34.0 27.2];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)-0.7); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Colm1974'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data for Hauraki Gulf, New Zealand';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01479*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4SK9C'; % Cat of Life
metaData.links.id_ITIS = '172953'; % ITIS
metaData.links.id_EoL = '52229045'; % Ency of Life
metaData.links.id_Wiki = 'Rhombosolea_plebeia'; % Wikipedia
metaData.links.id_ADW = 'Rhombosolea_plebeia'; % ADW
metaData.links.id_Taxo = '186085'; % Taxonomicon
metaData.links.id_WoRMS = '282601'; % WoRMS
metaData.links.id_fishbase = 'Rhombosolea-plebeia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhombosolea_plebeia}}';
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
bibkey = 'Colm1974'; type = 'article'; bib = [ ...
'doi = {10.1080/00288330.1974.9515510}, ' ...
'author = {J. A. Colman}, ' ...
'year   = {1974}, ' ...
'title  = {Growth of two species of flounders in the {H}auraki {G}ulf, {N}ew {Z}ealand}, ' ... 
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'page = {351-370}, ' ...
'volume = {8:()}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhombosolea-plebeia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

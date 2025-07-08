function [data, auxData, metaData, txtData, weights] = mydata_Macruronus_magellanicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macruronidae';
metaData.species    = 'Macruronus_magellanicus'; 
metaData.species_en = 'Patagonian  grenadier'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSE','MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data

data.am = 19*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 54;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 115;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1  mm of Macruronus_novaezelandiae: pi/6*0.1^3';
data.Wwp = 568.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00407*Lp^2.97, see F1';
data.Wwi = 5.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00407*Li^2.97, see F1';

data.Ri = 1e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 1 23.8 25.2
 2 37.5 38.1
 3 48.8 48.4
 4 58.1 56.7
 5 65.7 63.3
 6 72.0 68.6
 7 77.2 72.9
 8 81.4 76.3
 9 84.9 79.0
10 87.8 81.2
11 90.2 83.0
12 92.1 84.4
13 93.7 85.5
14 95.0 86.4];
data.tL_fm(:,1) = 365*(data.tL_fm(:,1)+0.9); % convert yr to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(3.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ChonAqua2007'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Ri = 23 * weights.Ri;

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
F1 = 'length-weight Ww in g = 0.00407*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 3.57*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3XD3D'; % Cat of Life
metaData.links.id_ITIS = '550662'; % ITIS
metaData.links.id_EoL = '46564932'; % Ency of Life
metaData.links.id_Wiki = 'Macruronus_magellanicus'; % Wikipedia
metaData.links.id_ADW = 'Macruronus_magellanicus'; % ADW
metaData.links.id_Taxo = '179491'; % Taxonomicon
metaData.links.id_WoRMS = '272449'; % WoRMS
metaData.links.id_fishbase = 'Macruronus-magellanicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macruronus_magellanicus}}';
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
bibkey = 'ChonAqua2007'; type = 'article'; bib = [ ... 
'author = {Javier V. Chong and Mario Aguayo and Ignacio Pay\''{a}}, ' ... 
'year = {2007}, ' ...
'title = {Determination of age, growth and natural mortality of {C}hilean hoki, \emph{Macruronus magellanicus}, {L}\"{o}nnberg, 1907 ({M}acruronidae, {G}adiformes) from the {S}outheastern {P}acific {O}cean}, ' ...
'journal = {Revista de Biolog\''{i}a Marina y Oceanograf\''{i}a}, ' ...
'volume = {42(3)}, '...
'pages = {311-333}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macruronus-magellanicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


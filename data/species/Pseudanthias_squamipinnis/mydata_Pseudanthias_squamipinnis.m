function [data, auxData, metaData, txtData, weights] = mydata_Pseudanthias_squamipinnis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anthiadidae';
metaData.species    = 'Pseudanthias_squamipinnis'; 
metaData.species_en = 'Sea goldie'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 14];

%% set data
% zero-variate data

data.am = 10 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on sex change at TL 7 cm';
data.Li  = 15;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 4;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0569*Lp^2.650, see F1';
data.Wwi = 74.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0569*Li^2.650, see F1';

data.R7  = 14e3/365; units.R7  = '#/d'; label.R7  = 'reprod rate at TL 7 cm'; bibkey.R7  = 'guess';   
temp.R7 = C2K(27.6);  units.temp.R7 = 'K';  label.temp.R7 = 'temperature';
 comment.R7 = 'based on kap = 0.9';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
 90	4.973
120	6.400
150	6.949
180	6.921
210	7.985
240	8.109
270	8.506
300	8.479
330	8.876
360	9.970
390	10.912];
data.tL(:,1) = data.tL(:,1) + 30; % set origin ar birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GundPopp1975';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.R7 = 0 * weights.R7;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'sex change from female to male at 7 cm, mimicked by a change in f, but actually {p_Am} changes';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.0569*(TL in cm)^2.650';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NKPQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579401'; % Ency of Life
metaData.links.id_Wiki = 'Pseudanthias_squamipinnis'; % Wikipedia
metaData.links.id_ADW = 'Pseudanthias_squamipinnis'; % ADW
metaData.links.id_Taxo = '105809'; % Taxonomicon
metaData.links.id_WoRMS = '218278'; % WoRMS
metaData.links.id_fishbase = 'Pseudanthias-squamipinnis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudanthias_squamipinnis}}';
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
bibkey = 'GundPopp1975'; type = 'Article'; bib = [ ... 
'author = {N. Gundermann and D. Popper}, ' ... 
'year = {1975}, ' ...
'title = {Some Aspects of Recolonization of Coral Rocks in {E}ilat ({G}ulf of {A}qaba) by Fish Populations after Poisoning}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {33}, ' ...
'pages = {675–678109-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pseudanthias-squamipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


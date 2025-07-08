function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_obtusata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_obtusata'; 
metaData.species_en = 'Obtuse barracuda'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI', 'MAm'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 23];

%% set data
% zero-variate data

data.am = 28*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KasiBala1990';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Sphyraena_barracuda: 84.7*150/200';
data.Li  = 55;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.45 mm: pi/6*0.145^3'; 
data.Wwp = 81; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on W = 0.00692*Lp^2.91, see F1';
data.Wwi = 803; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.00692*Li^2.91, see F1';

data.Ri  = 8e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sphyraena_flavicauda';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
3.163	12.103
3.841	14.276
4.946	16.916
5.947	19.090
7.109	21.421
8.006	23.285
9.059	25.692
10.013	27.169
10.813	28.026
12.037	29.504
13.155	30.749
14.004	32.071
16.029	34.173
17.045	34.953
19.024	36.358
19.985	37.138
21.116	37.221
27.866	40.820];
data.tL(:,1) = 365 * (0 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KasiBala1990'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2MS'; % Cat of Life
metaData.links.id_ITIS = '646740'; % ITIS
metaData.links.id_EoL = '46577226'; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_obtusata'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_obtusata'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '212045'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-obtusata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_obtusata}}';
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
bibkey = 'KasiBala1990'; type = 'Article'; bib = [ ... 
'author = {H. Mohamad Kasim and T. S. Balasubramanian}, ' ... 
'year = {1990}, ' ...
'title = {FiSHERY, GROWTH, YIELD PER RECRUIT AND STOCK ASSESSMENT OF \emph{Sphyraena obtusata} {C}UVIER OFF {T}UTICORIN, {G}ULF OF {M}ANNAR}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {37(4)}, ' ...
'pages = {281-288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sphyraena-obtusata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


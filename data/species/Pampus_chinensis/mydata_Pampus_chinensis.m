function [data, auxData, metaData, txtData, weights] = mydata_Pampus_chinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Stromateidae';
metaData.species    = 'Pampus_chinensis'; 
metaData.species_en = 'Chinese silver pomfret';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0pMp', 'piMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwi'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 18];

%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.15 mm of Pampus_argenteus: pi/6*0.115^3'; 
data.Wwp = 143;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01738*Lp^3.01, see F1';
data.Wwi = 1154;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^3.01, see F1';

data.Ri  = 6.5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Pampus_argenteus: 221894*(40/60)^3';

% uni-variate data

% time-length
data.tL = [... % time (d), total length (cm)
218.678	13.533
369.824	20.111
398.767	20.931
365+369.020	27.146
365+398.767	27.551
730+397.159	30.035]; 
data.tL(:,1) = data.tL(:,1)+80; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KariLiu2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight (in g) = 0.01738*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '75LLG'; % Cat of Life
metaData.links.id_ITIS = '172573'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pampus'; % Wikipedia
metaData.links.id_ADW = 'Pampus_chinensis'; % ADW
metaData.links.id_Taxo = '46776'; % Taxonomicon
metaData.links.id_WoRMS = '273993'; % WoRMS
metaData.links.id_fishbase = 'Pampus_chinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pampus}}';
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
bibkey = 'KariLiu2020'; type = 'article'; bib = [ ... 
'doi = {10.22092/ijfs.2018.119873}, ' ...
'author = {Karim E. and Liu Q. and Forruq Rahman M. and Khatun M.H. and Protim Barman P. and Shamsuzzaman M.M. and Mahmud Y.}, ' ... 
'year = {2020}, ' ...
'title = {Comparative assessment of population biology of three popular pomfret species, \emph{Pampus argenteus}, \emph{Pampus chinensis} and \emph{Parastromateus niger} in the {B}ay of {B}engal, {B}angladesh}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {19(2)}, ' ...
'pages = {793-813}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pampus-chinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

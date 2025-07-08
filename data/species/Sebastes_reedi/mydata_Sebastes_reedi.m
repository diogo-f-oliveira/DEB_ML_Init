function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_reedi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_reedi'; 
metaData.species_en = 'Yellowmouth rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 25];

%% set data
% zero-variate data

data.am = 99*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Sebastes_entomelas';
data.Li  = 58;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 590;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 2.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 1.1e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sebastes_entomelas';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    9 37.9 31.0
   10 38.0 35.0
   11 39.0 38.7
   12 39.0 39.0
   13 39.0 37.8
   14 40.6 40.0
   15 43.0 41.8
   16 42.4 40.9
   17 42.6 42.1
   18 42.1 41.9
   19 42.0 42.6
   20 44.4 43.8
   21 44.9 43.6
   22 44.8 42.7
   23 46.0 43.3
   24 45.2 43.7
   25 46.8 45.5
   26 46.7 44.0
   27 48.0 45.3
   28 47.4 46.0
   29 NaN  44.0
   30 47.0 45.0
   31 47.0 46.0
   32 49.0 46.0
   33 49.0 45.5
   34 NaN  43.0];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr 
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(5.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ShawArch1981';  treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7PK'; % Cat of Life
metaData.links.id_ITIS = '166737'; % ITIS
metaData.links.id_EoL = '46568184'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_reedi'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_reedi'; % ADW
metaData.links.id_Taxo = '187322'; % Taxonomicon
metaData.links.id_WoRMS = '274840'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_reedi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_reedi}}';
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
bibkey = 'ShawArch1981'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://publications.gc.ca/collections/collection_2013/mpo-dfo/Fs97-13-289-eng.pdf}}, ' ...
'author = {Shaw, W. and C.P. Archibald},' ...
'year = {1981}, ' ...
'title = {Length and age data of rockfishes collected from {B}.{C}. coastal waters during 1977, 1978, and 1979}, ' ...
'institution = {Can. Data Rep. Fish. Aquat. Sci.}, ' ...
'volume = {289}, ' ...
'pages = {1-119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-reedi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

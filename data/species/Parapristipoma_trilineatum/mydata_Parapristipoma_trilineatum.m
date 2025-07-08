function [data, auxData, metaData, txtData, weights] = mydata_Parapristipoma_trilineatum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Parapristipoma_trilineatum'; 
metaData.species_en = 'Chicken grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 04];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'DoiuKoku2007';   
  temp.am = C2K(24.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 56; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on length-weight of 0.00933*Lp^3.01, see F1';
data.Wwi = 619.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.00933*Li^3.01, see F1';

data.Ri  = 862140/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time (D), total length (cm)
    0 12.5 13.3
    1 19.6 19.3
    2 23.9 24.0
    3 24.5 25.5
    4 26.6 26.3
    5 27.1 27.2
    6 29.1 29.1
    7 29.5 29.1
    8 29.3 28.2
    9 32.7 31.5
   10 NaN  30.9
   11 NaN  32.7
   13 31.0 NaN
   15 32.4 NaN
   16 NaN  32.5
   17 NaN  33.9
   18 NaN  36.0
   21 NaN  35.6];
data.tL_fm(:,1) = 365*(0.8+data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'}; 
treat.tL_fm = {1 {'females','males'}};
temp.tL_fm    = C2K(24.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DoiuKoku2007';

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

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.00933*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4D9R4'; % Cat of Life
metaData.links.id_ITIS = '630263'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Parapristipoma'; % Wikipedia
metaData.links.id_ADW = 'Parapristipoma_trilineatum'; % ADW
metaData.links.id_Taxo = '183069'; % Taxonomicon
metaData.links.id_WoRMS = '273480'; % WoRMS
metaData.links.id_fishbase = 'Parapristipoma-trilineatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parapristipoma}}';
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
bibkey = 'DoiuKoku2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1444-2906.2007.01396.x}, ' ...
'author = {Ryu Doiuchi and Tomoyoshi Kokubo and Mitsuya Ogawa}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth of threeline grunt \emph{Parapristipoma trilineatum} along the south-western coast of {K}ii {P}eninsula, {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {73(4)}, ' ...
'pages = {777–783}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Parapristipoma-trilineatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

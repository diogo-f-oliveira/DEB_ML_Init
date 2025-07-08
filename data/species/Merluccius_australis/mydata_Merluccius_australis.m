function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_australis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_australis'; 
metaData.species_en = 'Southern hake'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MS','MPS','MIS','MAS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.6); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 22];

%% set data
% zero-variate data
data.am = 30*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';  
  temp.am = C2K(8.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 74.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
data.Li = 155;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BuscBalb2006';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 2554;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00398*Lp^3.10, see F1';
data.Wwi = 24542;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00398*Li^3.10, see F1';
  
data.Ri  = 8.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of 334 #/g: 334*24542'; 
  
% uni-variate data
% time-length 
data.tL_fm_SA = [ ... % time since birth (yr), total length (cm) 
   3.7  62.2 60.6
   4.7  68.0 66.5
   5.7  74.7 71.1
   6.7  78.2 76.0
   7.7  86.3 78.0
   8.7  90.6 79.9
   9.7  94.1 80.1
  10.7  97.8 83.6
  11.7 101.5 86.6
  12.7 105.1 88.5
  13.7 106.4 89.9
  14.7 108.3 NaN
  15.7 110.4 NaN
  16.7 110.5 NaN
  17.7 113.0 NaN];
data.tL_fm_SA(:,1) = (0+data.tL_fm_SA(:,1))*365; % convert yr to d
units.tL_fm_SA = {'d', 'cm'}; label.tL_fm_SA = {'time since birth', 'total length'};  
temp.tL_fm_SA = C2K(8.6);  units.temp.tL_fm_SA = 'K'; label.temp.tL_fm_SA = 'temperature';
bibkey.tL_fm_SA = 'Horn1998'; treat.tL_fm_SA = {1, {'females','males'}};
title.tL_fm_SA = 'Sub-Antarctic';
%
data.tL_fm_PB = [ ... % time since birth (yr), total length (cm) 
   3.7  60.7 60.7
   4.7  66.1 65.9
   5.7  68.6 68.8
   6.7  73.9 71.2
   7.7  80.2 80.6
   8.7  86.8 79.4
   9.7  89.6 82.3
  10.7  90.7 84.5
  11.7  95.0 79.1
  12.7  98.2 91.7
  13.7 100.0 NaN
  14.7  99.5 92.9
  15.7 103.4 NaN 
  16.7  96.3 NaN
  17.7  99.2 NaN];
data.tL_fm_PB(:,1) = (0+data.tL_fm_PB(:,1))*365; % convert yr to d
units.tL_fm_PB = {'d', 'cm'}; label.tL_fm_PB = {'time since birth', 'total length'};  
temp.tL_fm_PB = C2K(8.6);  units.temp.tL_fm_PB = 'K'; label.temp.tL_fm_PB = 'temperature';
bibkey.tL_fm_PB = 'Horn1998'; treat.tL_fm_PB = {1, {'females','males'}};
title.tL_fm_PB = 'Puysegur Bank';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm_SA = 5 * weights.tL_fm_SA;
weights.tL_fm_PB = 5 * weights.tL_fm_PB;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';  
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00398*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZV6P'; % Cat of Life
metaData.links.id_ITIS = '164797'; % ITIS
metaData.links.id_EoL = '46564946'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_australis'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_australis'; % ADW
metaData.links.id_Taxo = '44366'; % Taxonomicon
metaData.links.id_WoRMS = '272452'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_australis}}';
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
bibkey = 'Horn1998'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://fs.fish.govt.nz/Doc/17626/1998%20FARDs/98_34_FARD.pdf.ashx}}, ' ...
'author = {P. L. Horn}, ' ... 
'year = {1998}, ' ...
'title = {Horn, P.L., 1998. The stock affinity of hake (\emph{Merluccius australis}) from {P}uysegur {B}ank, and catch-at-age data and revised productivity parameters for hake stocks HAK 1, 4, and 7)}, ' ...
'institution = {New Zealand Fish. Assess. Res.}, ' ...
'volume = {Doc 98/34  (Unpubl. Rep., NIWA Library, Wellington)}, ' ...
'pages = {1-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BuscBalb2006'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.fishres.2006.08.010}, ' ...
'author = {Claudia A. Bustosa and Fernando Balbont\''{i}nb and Mauricio F. Landaeta}, ' ... 
'year = {2006}, ' ...
'title = {Spawning of the southern hake \emph{Merluccius australis} ({P}isces: {M}erlucciidae) in {C}hilean fjords}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {83}, ' ...
'pages = {23–32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-australis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


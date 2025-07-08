  function [data, auxData, metaData, txtData, weights] = mydata_Champsocephalus_gunnari
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Champsocephalus_gunnari'; 
metaData.species_en = 'Mackerel icefish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(1.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'KockEver1997';   
  temp.am = C2K(1.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 26.2;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 66;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 0.031;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KockEver1997';
  comment.Wwb = 'based on egg diameter of 3.5-4.1 mm: pi/6*0.39^3';
data.Wwp = 97.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00117*Lp^3.47, see F1, F2';
data.Wwi = 2.4e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00117*Li^3.47, see F1, F2';

data.Ri = 11664/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'KockEver1997';   
  temp.Ri = C2K(1.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 14.0 NaN
    2 21.1 21.3
    3 27.2 28.0
    4 32.7 32.8
    5 37.5 36.7
    6 41.6 40.3
    7 45.3 41.6
    8 48.6 42.8
    9 51.4 44.5
   10 53.9 44.8
   11 56.1 44.7
   12 58.0 48.7
   13 59.7 48.6
   14 NaN  48.9
   15 NaN  51.4];
data.tL(:,1) = 365 * (0.7 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(1.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KockEver1997'; treat.tL = {1, {'Kochkin 1985','Sosinski 1981'}};
comment.tL = 'Data from South Georgia, Kochkin 1985, Sosinski 1981';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
% weights.Ri =  5 * weights.Ri;
% weights.Wwi =  5 * weights.Wwi;
% weights.Wwb =  10 * weights.Wwb;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00117*(TL in cm)^3.47';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XQ96'; % Cat of Life
metaData.links.id_ITIS = '642743'; % ITIS
metaData.links.id_EoL = '46573063'; % Ency of Life
metaData.links.id_Wiki = 'Champsocephalus_gunnari'; % Wikipedia
metaData.links.id_ADW = 'Champsocephalus_gunnari'; % ADW
metaData.links.id_Taxo = '170495'; % Taxonomicon
metaData.links.id_WoRMS = '234797'; % WoRMS
metaData.links.id_fishbase = 'Champsocephalus-gunnari'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Champsocephalus_gunnari}}';  
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
bibkey = 'KockEver1997'; type = 'Article'; bib = [ ... 
'author = {Karl-Hemann Kock and lnigo Everson}, ' ...
'year = {1997}, ' ...
'title = {Biology and Ecology of Mackerel Icefish, \emph{ChampsocephaEus gunnari}: {A}n Antarctic Fish Lacking Hemoglobin}, ' ... 
'journal = {Comp. Blochem. Physiol. Vol.}, ' ...
'volume = {118A(4)}, ' ...
'pages = {1067-1077}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Champsocephalus-gunnari.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

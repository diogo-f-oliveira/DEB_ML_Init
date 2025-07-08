function [data, auxData, metaData, txtData, weights] = mydata_Umbrina_roncador

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Umbrina_roncador'; 
metaData.species_en = 'Yellowfin drum'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 19];

%% set data
% zero-variate data


data.am = 18*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(22.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'guess'; 
 comment.Lp = 'based on Umbrina_canariensis: 23*56/80';
data.Li  = 56;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 38.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00794*Lp^3.06, see F1';
data.Wwi = 1775;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.06, see F1; max published weight 2.5 kg';

data.Ri = 752e3/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(22.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.86';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % yr class (yr), std length (cm)
 0 14.3 14.5
 1 17.4 16.9
 2 19.2 17.4
 3 23.4 21.0
 4 26.4 22.0
 5 26.8 23.6
 6 26.8 25.2
 7 28.1 26.7
 8 30.6 27.1
 9 29.2 29.0
10 32.4 29.9
11 31.2 30.7
12 35.1 NaN
13 35.6 NaN];
data.tL_fm(:,1) = (.8 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm    = C2K(22.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PondFroe2008'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Ri = 0 * weights.Ri;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00794*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7DGKK'; % Cat of Life
metaData.links.id_ITIS = '169307'; % ITIS
metaData.links.id_EoL = '46578943'; % Ency of Life
metaData.links.id_Wiki = 'Umbrina_cirrosa'; % Wikipedia
metaData.links.id_ADW = 'Umbrina_cirrosa'; % ADW
metaData.links.id_Taxo = '189715'; % Taxonomicon
metaData.links.id_WoRMS = '127012'; % WoRMS
metaData.links.id_fishbase = 'Umbrina-cirrosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Umbrina_cirrosa}}';
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
bibkey = 'PondFroe2008'; type = 'Article'; bib = [ ... 
'author = {Daniel J. Pondella and John T. Froeschke and Lynne S. Wetmore and Eric Miller and Charles F. Valle and Lea Medeiros}, ' ... 
'year = {2008}, ' ...
'title = {Demographic Parameters of Yellowfin Croaker, \emph{Umbrina roncador} ({P}erciformes: {S}ciaenidae), from the {S}outhern {C}alifornia {B}ight}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {62}, ' ...
'pages = {555-568}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Umbrina-cirrosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_zanzibarensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_zanzibarensis'; 
metaData.species_en = 'Zanzibar tongue sole'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.2); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 10];

%% set data
% zero-variate data
data.ab = 16;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(11.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';  
  temp.am = C2K(11.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'BootWalm2000';
data.Li = 42;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'BootWalm2000';
  comment.Li = 'based on tL data; fishbase gives TL 32 cm';

data.Wwb = 8.17e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.16  mm: pi/6*0.116^3';
data.Wwp = 315;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'fishbase','BootWalm2000'};  
  comment.Wwp = 'based on 0.01514*Lp^3.00, see F4';
data.Wwi = 1.12e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = {'fishbase','BootWalm2000'};  
  comment.Wwi = 'based on 0.01514*Li^3.00, see F4';

data.Ri = 4.5e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(11.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Cynoglossus_lida: (42/20)^3*5e4';

% uni-variate data
% time-length        
data.tL_fm = [ ... % age (years) ~ Length (cm) 
1	22.79 19.13
2	23.30 27.54
3	29.83 29.92
4	31.46 30.44
5	34.35 32.29
6	34.91 31.29
7	35.93 34.40
8	40.00 36.50];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(11.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BootWalm2000'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01514*(TL in cm)^3.00';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5ZS'; % Cat of Life
metaData.links.id_ITIS = '616347'; % ITIS
metaData.links.id_EoL = '46570074'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus_zanzibarensis'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_zanzibarensis'; % ADW
metaData.links.id_Taxo = '172583'; % Taxonomicon
metaData.links.id_WoRMS = '274226'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus_zanzibarensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus_zanzibarensis}}';
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
bibkey = 'BootWalm2000'; type = 'article'; bib = [ ...
'author = {A. J. Booth and S. A. Walmsley-Hart}, ' ...
'year = {2000}, ' ...
'title = {BIOLOGY OF THE REDSPOTTED TONGUESOLE \emph{Cynoglossus_zanzibarensis} ({P}LEURONECTIFORMES: {C}YNOGLOSSIDAE) ON THE {A}GULHAS {B}ANK, {S}OUTH {A}FRICA}, ' ... 
'journal = {S. Afr. J. mar. Sci.}, ' ...
'volume = {22}, ' ...
'pages = {185–197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-zanzibarensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Synodus_variegatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Synodus_variegatus'; 
metaData.species_en = 'Variegated lizardfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 12 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 01];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'guess';  
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Synodus saurus';

data.Lp = 14;   units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Saurida undosquamis: pi/6*0.09^3';
data.Wwp = 23.2; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00513*Lp^3.19, see F1';
data.Wwi = 662; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.19, see F1';

data.Ri = 2*58599/365; units.Ri = '#/d';  label.Ri = 'reprod rate at TL 31 cm'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Synodus saurus';

% uni-variate data
% time-length
data.tL = [ ... % age (d) ~ std length (cm) 
14.989	11.191
73.891	12.526
134.645	13.599
288.189	15.887
349.286	16.264
365+14.869	17.278
365+134.481	18.642];
data.tL(:,1) = 320 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00513*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53XVZ'; % Cat of Life
metaData.links.id_ITIS = '162387'; % ITIS
metaData.links.id_EoL = '46563925'; % Ency of Life
metaData.links.id_Wiki = 'Synodus_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Synodus_variegatus'; % ADW
metaData.links.id_Taxo = '94349'; % Taxonomicon
metaData.links.id_WoRMS = '217670'; % WoRMS
metaData.links.id_fishbase = 'Synodus-variegatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synodus_variegatus}}';
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
bibkey = 'Murt2002'; type = 'techreport'; bib = [ ... 
'author = {Murty, V.S.}, ' ... 
'year = {2002}, ' ...
'title = {Marine ornamental fish resources of Lakshadweep}, ' ...
'institution = {CMFRI Spec. Publ.}, ' ...
'volume = {72}, ' ...
'pages = {1-384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Synodus-variegatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


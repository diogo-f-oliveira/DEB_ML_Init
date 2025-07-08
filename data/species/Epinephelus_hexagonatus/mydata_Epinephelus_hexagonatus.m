function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_hexagonatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_hexagonatus'; 
metaData.species_en = 'Starspotted grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 01];

%% set data
% zero-variate data

data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Epinephelus_areolatus';

data.Lp  = 19;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 27.5;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 65.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00955*Lp^3.00, see F1';
data.Wwi = 199;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.00, see F1';

data.Ri  = 93622/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Epinephelus_areolatus';
 
% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (cm)
319.090	15.336
365+15.619	17.295
365+73.548	19.045
365+106.318	20.241
365+227.298	22.471
365+319.491	23.372
365+349.446	24.129
730+15.200	24.882
730+226.704	26.549
730+348.807	27.302];
data.tL(:,1) = data.tL(:,1) - 90; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00955*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FTPH'; % Cat of Life
metaData.links.id_ITIS = '167712'; % ITIS
metaData.links.id_EoL = '46579644'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_hexagonatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_hexagonatus'; % ADW
metaData.links.id_Taxo = '105900'; % Taxonomicon
metaData.links.id_WoRMS = '218232'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-hexagonatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_hexagonatus}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-hexagonatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


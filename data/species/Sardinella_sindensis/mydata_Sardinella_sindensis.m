function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_sindensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_sindensis'; 
metaData.species_en = 'Sind sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 26];

%% set data
% zero-variate data;

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(26.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(26.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Sardinella_lemuru';

data.Lp  = 9;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 18.6; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.1^3';
data.Wwp = 6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00832*Lp^3.00, see F1';
data.Wwi = 53.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.00, see F1';

data.Ri  = 11400/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(26.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sardinella_lemuru: 25560*53.5/119.6';
  
% uni-variate data
% time-length
data.tL = [ ...    % time since birth (yr), total length (cm) 
    0  9.2
    1 12.8
    2 15.9
    3 18.2]; 
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DehgKamr2013';

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00832*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79MKJ'; % Cat of Life
metaData.links.id_ITIS = '551458'; % ITIS
metaData.links.id_EoL = '46562419'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_sindensis'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_sindensis'; % ADW
metaData.links.id_Taxo = '186554'; % Taxonomicon
metaData.links.id_WoRMS = '212273'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-sindensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_sindensis}}';
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
bibkey = 'DehgKamr2013'; type = 'article'; bib = [ ... 
'howpublished = {\url{https://worldfishcenter.org/publication/atlas-growth-mortality-and-recruitment-philippine-fishes}}, ' ...
'author = {Dehghani, M. and Kamrani, E. and Salarpouri, A. and Kamali, E}, ' ... 
'year = {2013}, ' ...
'title = {Age and growth of Sind sardine (\emph{Sardinella sindensis}) using otolith from {Q}eshm {I}sland ({P}ersian {G}ulf)}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ', ...
'volume = {14(1)}, ' ...
'pages = {236-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Sardinella-sindensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

function [data, auxData, metaData, txtData, weights] = mydata_Aphanopus_intermedius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Trichiuridae';
metaData.species    = 'Aphanopus_intermedius'; 
metaData.species_en = 'Intermediate scabbardfish'; 

metaData.ecoCode.climate = {'MB', 'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.ab = 11;   units.ab = 'd';   label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(9.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*365;   units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(9.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(9.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 80;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'Wiki';
  comment.Lp = 'based on Aphanopus carbo';
data.Li  = 147.6;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'DelgReis2013';
data.Lim  = 136.5;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length of male';  bibkey.Lim  = 'DelgReis2013';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 5.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = {'DelgReis2013','fishbase'};
  comment.Wwi = 'based on 0.00110*Li^3.09, see F1';
data.Wwim = 4.3e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';      bibkey.Wwim = {'DelgReis2013','fishbase'};
  comment.Wwim = 'based on 0.00110*Lim^3.09, see F1';

data.Ri  = 1.3e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 8	111.232
 9	117.254
10	119.789
11	122.958
12	129.930
13	134.366
14	136.585];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(8.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DelgReis2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00110*(TL in cm)^3.09';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FBJY'; % Cat of Life
metaData.links.id_ITIS = '551129'; % ITIS
metaData.links.id_EoL = '46577357'; % Ency of Life
metaData.links.id_Wiki = 'Aphanopus'; % Wikipedia
metaData.links.id_ADW = 'Aphanopus_intermedius'; % ADW
metaData.links.id_Taxo = '161104'; % Taxonomicon
metaData.links.id_WoRMS = '159833'; % WoRMS
metaData.links.id_fishbase = 'Aphanopus-intermedius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanopus}}';
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
bibkey = 'DelgReis2013'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12230}, ' ...
'author = {J. Delgado and S. Reis and J. A. Gonz\''{a}lez and E. Isidro and M. Biscoito and M. Freitas and V. M. Tuset}, ' ... 
'year = {2013}, ' ...
'title = {Reproduction and growth of \emph{Aphanopus carbo} and \emph{A. intermedius} ({T}eleostei: {T}richiuridae) in the northeastern {A}tlantic}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {25}, ' ...
'pages = {1008–1014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Aphanopus-intermedius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

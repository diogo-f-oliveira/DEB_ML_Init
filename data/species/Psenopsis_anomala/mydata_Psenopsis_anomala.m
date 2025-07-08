function [data, auxData, metaData, txtData, weights] = mydata_Psenopsis_anomala
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Centrolophidae';
metaData.species    = 'Psenopsis_anomala'; 
metaData.species_en = 'Pacific rudderfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 24];

%% set data
% zero-variate data

data.ab = 13.5;   units.ab = 'd';   label.ab = 'life span';                 bibkey.ab = 'guess';   
  temp.ab = C2K(18.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'WangHung2020';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 30;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.75 mm of Hyperoglyphe antarctica: pi/6*0.075^3';
data.Wwi = 484;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^3.07, see F`1';

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(18.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    0 13.49 13.28
    1 16.36 16.58
    2 18.93 18.61
    3 20.22 19.83
    4 21.96 21.33];
data.tL_fm(:,1) = 365 * (1.3 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(18.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'WangHung2020'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Ri = 0 * weights.Ri;
weights.Li = 3 * weights.Li;
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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assume to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = 'juveniles associate with jellyfish, adults are bottom-dwellers';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4NGDL'; % Cat of Life
metaData.links.id_ITIS = '172529'; % ITIS
metaData.links.id_EoL = '46577436'; % Ency of Life
metaData.links.id_Wiki = 'Psenopsis_anomala'; % Wikipedia
metaData.links.id_ADW = 'Psenopsis_anomala'; % ADW
metaData.links.id_Taxo = '184929'; % Taxonomicon
metaData.links.id_WoRMS = '277902'; % WoRMS
metaData.links.id_fishbase = 'Psenopsis-anomala'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psenopsis_anomala}}';
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
bibkey = 'WangHung2020'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315420000302}, ' ...
'author = {Wang, S.-B. and Hung, L.-Y. and Liu, K.-M.}, ' ... 
'year = {2020}, ' ...
'title = {Age and growth of the {J}apanese butterfish \emph{Psenopsis anomala} in the waters off north-eastern {T}aiwan}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {100}, ' ...
'pages = {427–433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Psenopsis-anomala.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

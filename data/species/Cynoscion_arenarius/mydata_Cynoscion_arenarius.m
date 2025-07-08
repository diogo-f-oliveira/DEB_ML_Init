function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_arenarius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_arenarius'; 
metaData.species_en = 'Sand weakfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 03];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(24.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 63.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Bort2003';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 28.3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00955*Lp^3.03, see F1';
data.Wwi = 2.77e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.03, see F1; max published weight 2.8 kg';

data.Ri = 324900/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SL 22.4';  bibkey.Ri = 'DittBour1991';
  temp.Ri = C2K(24.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL_CKfm = [ ... % time since birth (yr), total length (cm)
1	21.2 19.0
2	26.8 24.7
3	30.7 29.1
4   30.2 28.4
5   32.5 29.1];
data.tL_CKfm(:,1) = 365 * (0.5+data.tL_CKfm(:,1)); % convert yr to d
units.tL_CKfm = {'d', 'cm'}; label.tL_CKfm = {'time since birth', 'total length'};  
temp.tL_CKfm = C2K(24.8);  units.temp.tL_CKfm = 'K'; label.temp.tL_CKfm = 'temperature';
bibkey.tL_CKfm = 'NemeJack2006'; treat.tL_CKfm = {1 {'females','males'}};
title.tL_CKfm = 'Cedar Key';
%
data.tL_TBfm = [ ... % time since birth (yr), total length (cm)
1	23.0 21.9
2	26.9 24.9
3	27.1 27.2
4   30.0 26.8];
data.tL_TBfm(:,1) = 365 * (0.9+data.tL_TBfm(:,1)); % convert yr to d
units.tL_TBfm = {'d', 'cm'}; label.tL_TBfm = {'time since birth', 'total length'};  
temp.tL_TBfm = C2K(24.8);  units.temp.tL_TBfm = 'K'; label.temp.tL_TBfm = 'temperature';
bibkey.tL_TBfm = 'NemeJack2006'; treat.tL_TBfm = {1 {'females','males'}};
title.tL_TBfm = 'Tampa Bay';
%
data.tL_CHfm = [ ... % time since birth (yr), total length (cm)
1	22.1 20.6
2	26.8 25.1
3	29.3 25.5
4   27.2 26.6
5   32.4 27.7];
data.tL_CHfm(:,1) = 365 * (0.6+data.tL_CHfm(:,1)); % convert yr to d
units.tL_CHfm = {'d', 'cm'}; label.tL_CHfm = {'time since birth', 'total length'};  
temp.tL_CHfm = C2K(24.8);  units.temp.tL_CHfm = 'K'; label.temp.tL_CHfm = 'temperature';
bibkey.tL_CHfm = 'NemeJack2006'; treat.tL_CHfm = {1 {'females','males'}};
title.tL_CHfm = 'Charlotte Harbor';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_CKfm = 5 * weights.tL_CKfm;
weights.tL_TBfm = 5 * weights.tL_TBfm;
weights.tL_CHfm = 5 * weights.tL_CHfm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BVLG'; % Cat of Life
metaData.links.id_ITIS = '169243'; % ITIS
metaData.links.id_EoL = '46578981'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion_arenarius'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_arenarius'; % ADW
metaData.links.id_Taxo = '172626'; % Taxonomicon
metaData.links.id_WoRMS = '276077'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-arenarius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion_arenarius}}';
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
bibkey = 'NemeJack2006'; type = 'article'; bib = [ ... 
'doi = {10.18785/goms.2401.07 }, ' ...
'author = {Nemeth, D. J. and J. B. Jackson and A. R. Knapp and C. H. Purtlebaugh}, ' ... 
'year = {2006}, ' ...
'title = {Age and Growth of Sand Seatrout (\emph{Cynoscion arenarius}) in the Estuarine Waters of the Eastern {G}ulf of {M}exico}, ' ...
'journal = {Gulf of Mexico Science}, ' ...
'vplume = {24(1/2)}, ' ...
'pages = {45~60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DittBour1991'; type = 'article'; bib = [ ... 
'author = {James G. Ditty and Marty Bourgeois and Rick Kasprzak}, ' ... 
'year = {1991}, ' ...
'title = {LIFE HISTORY AND ECOLOGY OF SAND SEATROUT \emph{Cynoscion arenarius} {G}INSBURG, IN THE NORTHERN {G}ULF OF {M}EXICO: A REVIEW}, ' ...
'journal = {Northeast Gulf Science}, ' ...
'vplume = {12(1)}, ' ...
'pages = {35-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-arenarius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Ambassis_gymnocephalus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Ambassidae';
metaData.species    = 'Ambassis_gymnocephalus'; 
metaData.species_en = 'Bald glassy';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMc','0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 26];

%% set data
% zero-variate data
data.am = 4*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Ambassis_agassizii';

data.Lp = 7;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
  comment.Lp = 'based on SL 3.72 cm, see F2';
data.Li = 16;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';
  comment.Li = 'based on SL 7.5 cm, see F2';

data.Wwb = 1.8e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Ambassis_agassizii: pi/6*0.07^3';
data.Wwp = 4.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01318*Lp^3.01, see F1';
data.Wwi = 55.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.01, see F1';

data.Ri = 3e3/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Ambassis_agassizii: 740*55.5/13.4';

% uni-variate data

% time - length
data.tL = [ ... % time since birth (yr), std length (cm)
152.978	7.319
212.184	9.140
244.839	10.355
274.442	11.265
332.642	12.779];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'InglPaul1984'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = 'CKRP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580173'; % Ency of Life
metaData.links.id_Wiki = 'Ambassis_gymnocephalus'; % Wikipedia
metaData.links.id_ADW = 'Ambassis_gymnocephalus'; % ADW
metaData.links.id_Taxo = '160508'; % Taxonomicon
metaData.links.id_WoRMS = '220044'; % WoRMS
metaData.links.id_fishbase = 'Ambassis-gymnocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ambassis_gymnocephalus}}';  
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
bibkey = 'InglPaul1984'; type = 'techreport'; bib = [ ...  
'author = {Ingles, J. and D. Pauly}, ' ...
'year = {1984}, ' ...
'title = {An atlas of the growth, mortality and recruitment of {P}hilippines fishes}, ' ... 
'institution = {International Center for Living Aquatic Resources Management, Manila, Philippines}, ' ...
'volume = {13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ambassis-gymnocephalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

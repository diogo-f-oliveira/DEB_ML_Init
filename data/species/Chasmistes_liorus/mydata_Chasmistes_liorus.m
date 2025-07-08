  function [data, auxData, metaData, txtData, weights] = mydata_Chasmistes_liorus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Chasmistes_liorus'; 
metaData.species_en = 'June sucker'; 

metaData.ecoCode.climate = {'Dsa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - 
metaData.data_0     = {'ab'; 'ap'; 'am';'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 25]; 

%% set data
% zero-variate data
data.ab = 9;   units.ab = 'd';  label.ab = 'life span';                         bibkey.ab = 'WarrBurr2014';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'this is incubation time for Chasmistes table 13.4 - life history of Chasmiste - time to first feeding is likely a bit longer';
data.tp = mean([5,7])*365;   units.tp = 'd';  label.tp = 'life span';            bibkey.tp = 'WarrBurr2014';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guessed temp and we here took the mean value of age at puberty from table 13.4 - life history of Chasmistes.';
data.am = 44 * 365;   units.am = 'd';  label.am = 'life span';                   bibkey.am = 'WarrBurr2014';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guessed temp; 44+ years table 13.4 - life history of Chasmiste; the source says 44+, fishbase says 40+ for this species.';
  
data.Lp = mean([44,49]);  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'WarrBurr2014'; 
    comment.Lp = 'mean value of length at puberty from table 13.4 - life history of Chasmistes.'; 
data.Li = 67;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'WarrBurr2014';
 comment.Li= 'table 13.4 - life history of Chasmistes.';
 
data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = {'guess', 'WarrBurr2014'};
  comment.Wwb = 'Computed from egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 3559; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'guess';
   comment.Wwi = '0.01*Li^3.04, see discussion.';
   
data.Ri = 60000/365;   units.Ri = '#/d';  label.Ri = 'Ultimate reprod rate';    bibkey.Ri = 'WarrBurr2014';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed; max value from table 13.4 - life history of Chasmistes.';

 % univariate data

% time-length
data.tL_f = [ ... % time since birth (d), total length (m=cm)
0        1.155
356     12.098
734     23.392
1090	29.907
1440	34.092
1818	37.343
2196	39.546
2545	41.516
2901	43.952
3279	44.756
3642	46.492];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Belk1998';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), total length (m=cm)
0       1.271
356     9.418
734     22.693
1090	30.723
1440	35.373
1818	38.159
2196	40.479
2545	42.332
2901	43.951
3279	45.223
3642	45.676];	
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Belk1998';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'weight length relationship: Ww = 0.01 * TL^3.04';
  metaData.bibkey.D1 = 'fishbase';
D2 = 'egg diameter of Chasmistes genus is about 2 mm';
  metaData.bibkey.D2 = 'fishbase';
D3 = 'We use life history data for Chasmistes that were compiled in this book, when no other source was available for this species in particular.';  
  metaData.bibkey.D3 = 'WarrBurr2014';
D4 = 'All temperatures are assumed to be at 13 deg C. ';  
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'TQ73'; % Cat of Life
metaData.links.id_ITIS = '163963'; % ITIS
metaData.links.id_EoL = '207087'; % Ency of Life
metaData.links.id_Wiki = 'Chasmistes_liorus'; % Wikipedia
metaData.links.id_ADW = 'Chasmistes_liorus'; % ADW
metaData.links.id_Taxo = '192522'; % Taxonomicon
metaData.links.id_WoRMS = '1020097'; % WoRMS
metaData.links.id_fishbase = 'Chasmistes-liorus'; % fishbase


%% References
bibkey = 'Belk1998'; type = 'Article'; bib = [ ...  
'author = {Mark C. Belk}, ' ...
'year = {1998}, ' ...
'title = {AGE AND GROWTH OF JUNE SUCKER (\emph{Chasmistes liorus}) FROM OTOLITHS}, ' ... 
'journal = {Great Basin Naturalist}, ' ...
'volume = {58}, ' ...
'number = {4}, ' ...
'pages = {390-392}'];
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
 bibkey = 'WarrBurr2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Melvin L. Jr. Warren and Brooks M. Burr}, ' ...
'year = {2014}, ' ...
'title  = {Freshwater Fishes of North America: Volume 1: Petromyzontidae to Catostomidae}, ' ...
'publisher = {JHU Press, Science}, ' ...
'pages = {664}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Chasmistes-liorus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


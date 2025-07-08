  function [data, auxData, metaData, txtData, weights] = mydata_Percopsis_transmontana
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Percopsidae';
metaData.species    = 'Percopsis_transmontana'; 
metaData.species_en = 'Sand roller';

metaData.ecoCode.climate = {'BWk','Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 09]; 

%% set data
% zero-variate data
data.tp = 0.8*365;  units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'GrayDaub1979';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 6*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'GrayDaub1979';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;   units.Lp = 'cm';  label.Lp = 'fork length at puberty';bibkey.Lp = 'GrayDaub1979'; 
data.Li = 10.3;    units.Li = 'cm';  label.Li = 'ultimate fork length';  bibkey.Li = 'GrayDaub1979';

data.Wwb = 2.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GrayDaub1979';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3; the actual data given is 0.17 mm, but in view of P.omiscomaycus this is probably an error';
data.Wwi = 17; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'GrayDaub1979';
  comment.Wwi = 'based on exp(-10.65 + 2.91*log(103)), see F1';
      
data.R9 = 3368/365;units.R9 = '#/d'; label.R9 = 'reprod rate at FL 9.1 cm';    bibkey.R9 = 'GrayDaub1979';   
  temp.R9 = C2K(15);  units.temp.R9 = 'K'; label.temp.R9 = 'temperature';
  comment.R9 = 'temp is guessed';
data.Ri = 5380/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';
  
% uni-variate data
% time - length
data.tL = [ ... ; % time since birth (yr) fork length (cm)
    1 4.5
    2 6.7
    3 7.7
    4 8.4
    5 9.3
    6 9.4];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(17); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'GrayDaub1979'};
    
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

%% Discussion points
D1 = 'No clear difference between males and females';
D2 = 'temperatures varied seasonally between 2.5 and 20.5 C';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts 
F1 = 'length-weight: Ww in g = exp(-10.65 + 2.91* FL in mm)';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-legnth from photo: FL = 0.94 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7743B'; % Cat of Life
metaData.links.id_ITIS = '164410'; % ITIS
metaData.links.id_EoL = '212345'; % Ency of Life
metaData.links.id_Wiki = 'Percopsis_transmontana'; % Wikipedia
metaData.links.id_ADW = 'Percopsis_transmontana'; % ADW
metaData.links.id_Taxo = '44206'; % Taxonomicon
metaData.links.id_WoRMS = '1467848'; % WoRMS
metaData.links.id_fishbase = 'Percopsis-transmontana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Percopsis_transmontana}}';  
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
bibkey = 'GrayDaub1979'; type = 'Article'; bib = [ ...  
'author = {Robert H. Gray and Dennis D. Dauble}, ' ...
'year = {1979}, ' ...
'title = {Biology of the sandroller in the {C}entral {C}olumbia {R}iver}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {108}, '...
'pages = {645-649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percopsis-transmontana.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


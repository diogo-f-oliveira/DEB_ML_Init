function [data, auxData, metaData, txtData, weights] = mydata_Scaphirhynchus_suttkusi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Scaphirhynchus_suttkusi'; 
metaData.species_en = 'Alabama sturgeon'; 

metaData.ecoCode.climate = {'Cfb','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 22];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 22]; 

%% set data
% zero-variate data

data.ab = 8; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'Wiki';    
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed, wiki says 5-8 days for hatching for S. albus, and we are not sure how long between hatch and first feeding'; 
data.tp = 5*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'KuhaRide2016';
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature'; comment.tp = 'temp is guessed- 5-6 yr';
data.am = 20*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wiki';   
  temp.am = C2K(19);units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temperature is guessed, 12-20 yrs';

data.Lp  = 42;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KuhaRide2016';
    comment.Lp = 'this is the smallest ripe female who was about 7 yr old, so expect larger predicted Lp for f=1.';
data.Li  = 78;       units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'KuhaRide2016';

data.Wwb = 1.41e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GeorSlac2012';
  comment.Wwb = 'guessed: based on egg diameter of 3 mm: pi/6*0.3^3 for S. albus'; 
data.Wwi = 1.4e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';

data.Ri  = 4000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'KuhaRide2016';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temperature is guessed, size is unknown. authors say fecundity is potentially higher than 4000 eggs/female';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '79TKM'; % Cat of Life
metaData.links.id_ITIS = '201895'; % ITIS
metaData.links.id_EoL = '46561195'; % Ency of Life
metaData.links.id_Wiki = 'Scaphirhynchus_suttkusi'; % Wikipedia
metaData.links.id_ADW = 'Scaphirhynchus_suttkusi'; % ADW
metaData.links.id_Taxo = '186649'; % Taxonomicon
metaData.links.id_WoRMS = '282668'; % WoRMS
metaData.links.id_fishbase = 'Scaphirhynchus-suttkusi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alabama_sturgeon}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'KuhaRide2016'; type = 'article'; bib = [ ...    
'author = {Kuhajda, B.R. and Rider, S.J.}, ' ...
'year  = {2016}, ' ...
'volume = {32}, ' ...
'journal = {J Appl Ichthyol}, ' ...
'doi = {10.1111/jai.13237}, ' ...
'pages = {15--29}, ' ... 
'title = {Status of the imperiled {A}labama Sturgeon (\emph{Scaphirhynchus suttkusi} {W}illiams and {C}lemmer, 1991)}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GeorSlac2012'; type = 'Article'; bib = [ ...    
'author = {S. G. George and W. T. Slack and J. J. Hoover}, ' ...
'year  = {2012}, ' ...
'title = {A note on the fecundity of pallid sturgeon}, ' ...  
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {28}, ' ...
'number = {4}, ' ...
'doi = {10.1111/j.1439-0426.2011.01931.x},' ...
'pages = {1--4}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

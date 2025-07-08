function [data, auxData, metaData, txtData, weights] = mydata_Scaphirhynchus_platorynchus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Scaphirhynchus_platorynchus'; 
metaData.species_en = 'Shovelnose sturgeon'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 11];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 11]; 

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'ADW';    
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch 3-5 days (wiki), 5-8 d (ADW)'; 
data.tp = 6.5*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 43*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'fishbase';   
  temp.am = C2K(19);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 54.7;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
    comment.Lp = 'this is the smallest ripe female who was about 7 yr old, so expect larger predicted Lp for f=1.';
data.Li  = 108;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = 'guessed: based on egg diameter of 2-3 mm: pi/6*0.25^3 for S. albus'; 
data.Wwi = 6.2e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';

data.Ri  = 51217/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temperature is guessed, size is unknown. authors say fecundity is potentially higher than 4000 eggs/female';
  
% univariate data
% time - length
data.tL = [ ... time since birth (yr),  fork length (cm)
    1  8.5
    2 14.0
    3 18.7
    4 22.0];
data.tL(:,2) = data.tL(:,2) * 2.54/ 0.85; % convert FL in inach to  TL in cm
data.tL(:,1) = (0.2 + data.tL(:,1)) * 365;  % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'Helm1974';
   temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Age at puberty is ignored because (tp,Lp) is inconsistent with tL data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00488 * (TL in cm)^3';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Length-length from photo: FL = 0.85 * TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);
 
%% Links
metaData.links.id_CoL = '6XTKM'; % Cat of Life
metaData.links.id_ITIS = '161082'; % ITIS
metaData.links.id_EoL = '205910'; % Ency of Life
metaData.links.id_Wiki = 'Scaphirhynchus_platorynchus'; % Wikipedia
metaData.links.id_ADW = 'Scaphirhynchus_platorynchus'; % ADW
metaData.links.id_Taxo = '186648'; % Taxonomicon
metaData.links.id_WoRMS = '1022840'; % WoRMS
metaData.links.id_fishbase = 'Scaphirhynchus-platorynchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scaphirhynchus_platorynchus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Helm1974'; type = 'Article'; bib = [ ...    
'author = {Helms, Don R.}, ' ...
'year  = {1974}, ' ...
'title = {Age and Growth of Shovelnose Sturgeon, \emph{Scaphirhynchus platorynchus} ({R}afinesque), in the {M}ississippi {R}iver}, ' ...  
'journal = {Proceedings of the Iowa Academy of Science}, ' ...
'volume = {81}, ' ...
'number = {2}, ' ...
'howpublished = {\url{https://scholarworks.uni.edu/pias/vol81/iss2/10}},' ...
'pages = {73-75}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scaphirhynchus-platorynchus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Scaphirhynchus_platorynchus/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


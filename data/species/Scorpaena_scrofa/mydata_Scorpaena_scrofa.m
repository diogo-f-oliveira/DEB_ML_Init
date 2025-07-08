function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_scrofa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_scrofa'; 
metaData.species_en = 'Red scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 21];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(14.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'MatiStag2015';   
  temp.am = C2K(14.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'MatiStag2015'; 
  comment.Lp = '24.9 for males';
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwi = 1.78e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.02, see F1';
 
data.Ri = 32850/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(14.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Scorpaena_elongata';

% uni-variate data
% time-length-weight 
data.tLW = [ ... %  year class (yr), total length(cm), weight (g)
    1 12.76   37.03
    2 16.82   81.05
    3 20.29  142.35
    4 24.94  269.95
    5 28.19  392.01
    6 30.78  513.69
    7 34.50  727.83
    8 37.59  935.14
    9 39.78 1075.96
   10 41.69 1342.00
   11 43.02 1344.44
   12 44.44 1632.50
   13 44.80 1760.00
   14 52.93 2816.67
   25 58.20 3650.00];
data.tLW(:,1) = (data.tLW(:,1) + 0.75) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(14.4); units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'MatiStag2015'; treat.tLW = {1 {'total length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79YXW'; % Cat of Life
metaData.links.id_ITIS = '166839'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena_scrofa'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_scrofa'; % ADW
metaData.links.id_Taxo = '44913'; % Taxonomicon
metaData.links.id_WoRMS = '127248'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena-scrofa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_scrofa}}';
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
bibkey = 'MatiStag2015'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.ecss.2014.11.019}, ' ...
'author = {Sanja Mati\''{c}c-Skoko and Nika Stagli\v{c}i\''{c} and Miro Kraljevi\''{c} and Armin Pallaoro and Jakov Dul\v{c}i\''{c}}, ' ... 
'year = {2015}, ' ...
'title = {The biological traits of the large red scorpionfish, \emph{Scorpaena scrofa}: {T}emporal and ontogenetic dynamics}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {152}, ' ...
'pages = {91-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-scrofa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


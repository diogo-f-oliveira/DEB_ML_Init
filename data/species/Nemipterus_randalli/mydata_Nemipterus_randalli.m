  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_randalli

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_randalli'; 
metaData.species_en = 'Randall''s threadfin bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 14];

%% set data

% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'UyanFili2019';   
  temp.am = C2K(21.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'TaylYapi2021'; 
data.Li = 27;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TaylYapi2021';
  comment.Wwb = 'based on egg diameter of  0.65 mm: pi/6*0.065^3';
data.Wwi = 220;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 330 g, based on 0.01318*Li^2.95, see F1, gives 220 g';
  
data.Ri  = 55000/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at TL 20 cm'; bibkey.Ri  = 'TaylYapi2021';   

% univariate data

% time-length
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1 14.03  39.41
    2 16.35  62.80
    3 18.09  82.38
    4 19.71 106.22
    5 21.05 116.62];
data.tLW(:,1) = 365 * (0.9 + data.tLW(:,1));
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(21.4);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1, {'total length','weight'}};
bibkey.tLW = 'UyanFili2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01318*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467YZ'; % Cat of Life
metaData.links.id_ITIS = '168990'; % ITIS
metaData.links.id_EoL = '46581023'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus_randalli'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_randalli'; % ADW
metaData.links.id_Taxo = '180967'; % Taxonomicon
metaData.links.id_WoRMS = '278120'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-randalli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus_randalli}}';  
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
bibkey = 'UyanFili2019'; type = 'article'; bib = [ ...  
'author = {Umut Uyan and Halit Filiz and Ali Serhan Tarkan and Murat \c{C}elik and Nildeniz Top}, ' ...
'year = {2019}, ' ...
'title = {Age and growth of \emph{Nemipterus randalli} in the southern {A}egean {S}ea, {T}urkey}, ' ... 
'journal = {J. Black Sea/Mediterranean Environment}, ' ...
'volume = {25(2)}, '...
'pages = {140-149}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaylYapi2021'; type = 'article'; bib = [ ...  
'author = {Burcu Taylan and Sercan Yapici}, ' ...
'year = {2021}, ' ...
'title = {Reproductive biology of non-native \emph{Nemipterus randalli} {R}ussell, 1986 and native \emph{Pagellus erythrinus} ({L}innaeus, 1758) from the {A}egean {S}ea}, ' ... 
'journal = {North-Western Journal of Zoology}, ' ...
'volume = {17(2)}, '...
'pages = {180-186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-randalli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

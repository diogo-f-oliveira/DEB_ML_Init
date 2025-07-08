function [data, auxData, metaData, txtData, weights] = mydata_Trachinotus_falcatus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachinotus_falcatus'; 
metaData.species_en = 'Permit'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 30];

%% set data
% zero-variate data
data.ab = 3.2;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CrabHood2002';   
  temp.am = C2K(26.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 54.7; units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 122;   units.Li = 'cm'; label.Li = 'ultimate fork length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 36e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.02754*Li^2.85, see F1, gives 24.3 kg';

data.GSI  = 0.06; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'CrabHood2002';   
  temp.GSI = C2K(26.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    0 27.7 NaN
    1 31.0 33.4
    2 47.9 46.5
    3 55.5 57.2
    4 62.0 60.4
    5 66.4 63.2
    6 65.8 68.0
    7 68.7 68.7
    8 69.5 71.5
    9 71.0 71.7
   10 75.4 68.8
   11 81.1 71.4
   12 79.7 69.8
   13 80.3 75.4
   14 78.3 73.7
   15 73.7 75.9
   18 79.3 69.6
   20 78.2 68.7
   21 91.6 68.7
   23 78.3 78.1];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.5)*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'}; 
temp.tL_fm = C2K(26.1); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CrabHood2002'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02754*(TL in cm)^2.85';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PCJ'; % Cat of Life
metaData.links.id_ITIS = '168709'; % ITIS
metaData.links.id_EoL = '46578050'; % Ency of Life
metaData.links.id_Wiki = 'Trachinotus_falcatus'; % Wikipedia
metaData.links.id_ADW = 'Trachinotus_falcatus'; % ADW
metaData.links.id_Taxo = '45252'; % Taxonomicon
metaData.links.id_WoRMS = '151169'; % WoRMS
metaData.links.id_fishbase = 'Trachinotus-falcatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trachinotus_falcatus}}';  
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
bibkey = 'CrabHood2002'; type = 'article'; bib = [ ...
'author = {Roy E. Crabtree and Peter B. Hood and Derke Snodgrass}, ' ...
'year = {2002}, ' ...
'title = {Age, growth, and reproduction of permit (\emph{Trachinotus falcatus}) in {F}lorida waters}, ' ... 
'journal = {Fish. Bull.}, ' ...
'volume = {100}, ' ...100
'pages = {26–34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Trachinotus-falcatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

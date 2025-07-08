function [data, auxData, metaData, txtData, weights] = mydata_Prionotus_stephanophrys

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Prionotus_stephanophrys'; 
metaData.species_en = 'Lumptail searobin'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.2); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 30];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(24.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SchmCast1994';  
  temp.am = C2K(24.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';    bibkey.Lp = 'fishbase';
data.Li = 43;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Yusc1985';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm of Prionotus evolans: pi/6*0.115^3';
data.Wwp = 114.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01122*Lp^2.96, see F1';
data.Wwi = 767.5; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';     bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01122*Li^2.96, see F1';

data.Ri = 1e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(24.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on P. evolans for TL 43 cm';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (years), std length (cm), weight (g) 
    1  6.628   6.9
    2  8.822  14.6
    3 11.881  22.8
    4 14.998  78.4
    5 19.290 150.1
    6 21.791 236.9
    7 23.900 280.9
    8 25.150 353.2
    9 28.000 433.0];
data.tLW(:,1) = 365 * (0.4+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'std length', 'weight'}; 
treat.tLW = {1, {'std length','weight'}};
temp.tLW = C2K(24.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SchmCast1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Wwi and Wwp are ignorned, due to inconsistency with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01122*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MGH7'; % Cat of Life
metaData.links.id_ITIS = '166995'; % ITIS
metaData.links.id_EoL = '46568750'; % Ency of Life
metaData.links.id_Wiki = 'Prionotus'; % Wikipedia
metaData.links.id_ADW = 'Prionotus_stephanophrys'; % ADW
metaData.links.id_Taxo = '184738'; % Taxonomicon
metaData.links.id_WoRMS = '276291'; % WoRMS
metaData.links.id_fishbase = 'Prionotus-stephanophrys'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionotus}}';
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
bibkey = 'SchmCast1991'; type = 'article'; bib = [ ...
'author = {Juan Jacobo Schmitter-Sotol and Jos\''{e} Luis Castro-Aguifre}, ' ... 
'year   = {1991}, ' ...
'title  = {Edad y crecimiento de \emph{Prionotus stephanophrys} ({O}steichthyes: {T}riglidae) en la costa occidental de Baja California Sur, M\''{e}xico}, ' ...
'journal = {Rev. Biol. Trop.}, ' ...
'page = {23-29}, ' ...
'volume = {39(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Prionotus-stephanophrys.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Atractoscion_aequidens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Atractoscion_aequidens'; 
metaData.species_en = 'Geelbeck croaker'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'SGI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 25];

%% set data
% zero-variate data


data.am = 28*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'RomoHerz2015';   
  temp.am = C2K(18.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 65;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 150;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter og 0.8 mm: pi/6*0.08^3';
data.Wwp = 3264;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Anon2001','fishbase'};
  comment.Wwp = 'based on 0.00851*Lp^3.08, see F1';
data.Wwi = 27.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00851*Li^3.08, see F1';

data.GSI = 0.055; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'GrifHech1995';
  temp.GSI = C2K(18.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), fork length (cm)
 1	 41.673
 2	 58.471
 3	 70.056
 4	 83.537
 5	 90.856
 6	 96.992
 7	 97.675
 8	100.967
 9	101.414];
data.tL(:,1) = (.9 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(18.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrifHech1995'; comment.tL = 'from fig 4, but the assumption is that mm should be cm';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00851*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'JJR2'; % Cat of Life
metaData.links.id_ITIS = '169389'; % ITIS
metaData.links.id_EoL = '46579090'; % Ency of Life
metaData.links.id_Wiki = 'Atractoscion_aequidens'; % Wikipedia
metaData.links.id_ADW = 'Atractoscion_aequidens'; % ADW
metaData.links.id_Taxo = '162586'; % Taxonomicon
metaData.links.id_WoRMS = '218634'; % WoRMS
metaData.links.id_fishbase = 'Atractoscion-aequidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atractoscion_aequidens}}';
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
bibkey = 'GrifHech1995'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1995.tb06022.x}, ' ...
'author = {Griffiths, M. H. and Hecht, T.}, ' ... 
'year = {1995}, ' ...
'title = {On the life-history of \emph{Atractoscion aequidens}, a migratory sciaenid off the east coast of southern {A}frica}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {47(6)}, ' ...
'pages = {962–985}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Atractoscion-aequidens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


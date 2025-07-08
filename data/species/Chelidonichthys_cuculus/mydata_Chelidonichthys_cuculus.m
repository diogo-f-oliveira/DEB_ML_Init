function [data, auxData, metaData, txtData, weights] = mydata_Chelidonichthys_cuculus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Chelidonichthys_cuculus'; 
metaData.species_en = 'Red gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.1); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 01];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(20.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 21*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(10.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26.6;  units.Lp = 'cm';   label.Lp = 'total length at puberty';    bibkey.Lp = 'fishbase';
data.Li = 70;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Yusc1985';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm of Prionotus evolans: pi/6*0.115^3';
data.Wwp = 176;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00794*Lp^3.05, see F1';
data.Wwi = 3.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';    bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00794*Li^3.05, see F1';

data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'CollCard2003';
  temp.GSI = C2K(10.1); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (years), total length (cm)
    1 13.82 13.14
    2 18.94 17.77
    3 21.68 20.28];
data.tL_fm(:,1) = 365 * (0.95+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'}; 
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(10.1); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'McPhShip2001';

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
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00794*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XQWC'; % Cat of Life
metaData.links.id_ITIS = '643887'; % ITIS
metaData.links.id_EoL = '46568653'; % Ency of Life
metaData.links.id_Wiki = 'Chelidonichthys_cuculus'; % Wikipedia
metaData.links.id_ADW = 'Chelidonichthys_cuculus'; % ADW
metaData.links.id_Taxo = '170730'; % Taxonomicon
metaData.links.id_WoRMS = '218120'; % WoRMS
metaData.links.id_fishbase = 'Chelidonichthys-cuculus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelidonichthys_cuculus}}';
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
bibkey = 'CollCard2003'; type = 'article'; bib = [ ...
'author = {F. Colloca and M. Cardinale and A. Marcello and G. D. Ardizzone}, ' ... 
'year   = {2003}, ' ...
'title  = {Tracing the life history of red gurnard (\emph{Aspitrigla cuculus}) using validated otolith annual rings}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'page = {1–9}, ' ...
'volume = {19)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chelidonichthys-cuculus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


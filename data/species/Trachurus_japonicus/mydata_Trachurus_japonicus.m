function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_japonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_japonicus'; 
metaData.species_en = 'Japanese jack mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 31];

%% set data
% zero-variate data

data.ab = 13;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(13.8);units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12 * 365;   units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase'; 
  temp.am = C2K(13.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'for females';
data.Li  = 50;        units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.78e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.71-0.92 mm of Trachurus_mediterraneus: pi/6*0.081^3';
data.Wwp = 67.3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01072*Lp^2.97, see F1';
data.Wwi = 1.2e3;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.97, see F1';

data.Ri  = 410400/ 365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(13.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
  
% time-length data
data.tL = [  % yesr class (yr), total length (cm)
1	16.040
2	20.992
4	29.393
5	32.148
6	34.673];
data.tL(:,1) = (data.tL(:,1) + 0.9) * 365; % convert yr class to time since birth (d)
units.tL   = {'d', 'g'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(13.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuraShin1949';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% facts
F1 = 'length-weight: wet weight (g) = 0.01072*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PKT'; % Cat of Life
metaData.links.id_ITIS = '642012'; % ITIS
metaData.links.id_EoL = '46578063'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_japonicus'; % ADW
metaData.links.id_Taxo = '189251'; % Taxonomicon
metaData.links.id_WoRMS = '273302'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_japonicus}}';
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
bibkey = 'MuraShin1949'; type = 'Article'; bib = [...
'doi = {10.2331/SUISAN.15.155}, ' ...
'author = {S. Murakami and S. Shindo}, ' ...
'year   = {1949},.' ...
'title = {Studies on the stocks of some economically important marine fishes caught around {A}makusa. {V}. A consideration on the age of \emph{Trachurus japonicus} ({T}emminck \& {S}chlegel)}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'pages = {155-157}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Trachurus-japonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Stethojulis_albovittata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Stethojulis_albovittata'; 
metaData.species_en = 'Bluelined wrasse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 29];

%% set data
% zero-variate data

data.ab = 3.6;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Centrolabrus exoletus';
  
data.Lp  = 6.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 14;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 3;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 32.2;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1';

data.GSI = 0.1; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Centrolabrus exoletus';
  
% univariate data
% time-length
data.tL = [ ... % time since birht (d), std length (cm)
73.528	8.526
103.390	8.718
133.682	8.966
286.032	10.718
316.726	10.621
345.751	11.045
365+13.151	10.943
365+73.333	11.783
365+286.149	12.374];
data.tL(:,1) = data.tL(:,1) + 370; % set origin at birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 5 * weights.tL;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52GF5'; % Cat of Life
metaData.links.id_ITIS = '170635'; % ITIS
metaData.links.id_EoL = '46571849'; % Ency of Life
metaData.links.id_Wiki = 'Stethojulis_albovittata'; % Wikipedia
metaData.links.id_ADW = 'Stethojulis_albovittata'; % ADW
metaData.links.id_Taxo = '46361'; % Taxonomicon
metaData.links.id_WoRMS = '219058'; % WoRMS
metaData.links.id_fishbase = 'Stethojulis-albovittata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stethojulis_albovittata}}';
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
bibkey = 'Murt2002'; type = 'techreport'; bib = [ ... 
'author = {Murty, V.S.}, ' ... 
'year = {2002}, ' ...
'title = {Marine ornamental fish resources of Lakshadweep}, ' ...
'institution = {CMFRI Spec. Publ.}, ' ...
'volume = {72}, ' ...
'pages = {1-384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stethojulis-albovittata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


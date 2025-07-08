function [data, auxData, metaData, txtData, weights] = mydata_Centropomus_robalito

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centropomiformes'; 
metaData.family     = 'Centropomidae';
metaData.species    = 'Centropomus_robalito'; 
metaData.species_en = 'Yellowfin snook'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMm', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 04];

%% set data
% zero-variate data

data.tb = 5.5;   units.tb = 'd';    label.tb = 'time since hatch at birth';   bibkey.tb = 'guess';   
  temp.tb = C2K(27.5);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.am =  20* 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 37.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 24; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00741*Lp^3.06, see F1';
data.Wwi = 482; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.06, see F1;max. published weight: 626.00 g ';

data.Ri  = 1.5e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm) 
131.117	12.245
159.466	13.835
166.553	13.837
232.112	16.796
271.092	18.503
308.301	20.096
349.053	21.804];
data.tL(:,1) = data.tL(:,1)+110; %set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Warb1979';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_fBosque','tL_mBosque'}; subtitle1 = {'data for females, males at Barra el Bosque'};
% set2 = {'tL_fPedro','tL_mPedro'}; subtitle2 = {'data for females, males at Barra San Pedro'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight relationship: Ww in g  = 0.00741*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XHHG'; % Cat of Life
metaData.links.id_ITIS = '167651'; % ITIS
metaData.links.id_EoL = '46580161'; % Ency of Life
metaData.links.id_Wiki = 'Centropomus'; % Wikipedia
metaData.links.id_ADW = 'Centropomus_robalito'; % ADW
metaData.links.id_Taxo = '45045'; % Taxonomicon
metaData.links.id_WoRMS = '280067'; % WoRMS
metaData.links.id_fishbase = 'Centropomus-robalito'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centropomus}}';
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
bibkey = 'Warb1979'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1979.tb03542.x}, ' ...
'author = {Warburton, K.}, ' ... 
'year = {1979}, ' ...
'title = {Growth and production of some important species of fish in a {M}exican coastal lagoon system}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {14(5)}, ' ...
'pages = {449–464}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Centropomus-robalito}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

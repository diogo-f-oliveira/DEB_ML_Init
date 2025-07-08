function [data, auxData, metaData, txtData, weights] = mydata_Diapterus_peruvianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Diapterus_peruvianus'; 
metaData.species_en = 'Peruvian mojarra'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

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

data.am = 8.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temps are guessed; am of 10 yr is oldest year class in tL data';
  
data.Lp  = 16;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on SL 13.9 cm and F2';
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.54e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based guessed egg diameter of 0.5 mm: pi/6*0.05^3'; 
data.Wwp = 62; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01318*Lp^3.05, see F1';
data.Wwi = 675; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.05, see F1; max published weight 471.98 g';

data.R20  = 367200/365; units.R20  = '#/d';label.R20  = 'max reprod rate at TL 20.1 cm';  bibkey.R20  = 'guess';   
  temp.R20 = C2K(27); units.temp.R20 = 'K'; label.temp.R20 = 'temperature';
  comment.R20 = 'based on Gerres oyena';
  
% uni-variate data
% time - length
data.tL = [  ... % time since birth (d), standard length (cm)
33.465	2.432
60.187	4.619
104.545	8.446
131.444	9.110
146.479	9.727
154.782	10.154
169.606	10.200
186.025	10.555
202.886	10.100
222.205	10.288
266.933	11.116];
data.tL(:,1) = data.tL(:,1)+0; % set origin at birth
data.tL(:,2) = data.tL(:,2)/ 0.83; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Warb1979';

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01318*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35DFJ'; % Cat of Life
metaData.links.id_ITIS = '645669'; % ITIS
metaData.links.id_EoL = '46580875'; % Ency of Life
metaData.links.id_Wiki = 'Diapterus'; % Wikipedia
metaData.links.id_ADW = 'Diapterus_peruvianus'; % ADW
metaData.links.id_Taxo = '173115'; % Taxonomicon
metaData.links.id_WoRMS = '276414'; % WoRMS
metaData.links.id_fishbase = 'Diapterus-peruvianus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diapterus}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Diapterus-peruvianus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


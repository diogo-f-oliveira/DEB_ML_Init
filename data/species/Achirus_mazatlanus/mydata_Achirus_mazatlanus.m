function [data, auxData, metaData, txtData, weights] = mydata_Achirus_mazatlanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Achiridae';
metaData.species    = 'Achirus_mazatlanus'; 
metaData.species_en = 'Mazatlan sole'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE','TN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd','0iFe','0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 28];

%% set data
% zero-variate data

data.am = 12*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'guess'; 
  comment.Lp = '';
data.Li  = 22.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 17.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Lp^3.15, see F1';
data.Wwi = 228.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.15, see F1';

data.Ri  = 34e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (yr), std length (cm)
77.113	3.352
114.812	4.916
147.371	6.480
162.793	8.156
181.643	7.933
198.779	8.715
209.061	8.492
219.343	8.156
233.052	10.056
239.906	9.162
262.183	10.391
274.178	10.950
296.455	10.838
366.714	13.184
365-3.427	13.408
365+22.277	12.849
365+41.127	12.737
365+51.408	14.078
365+61.690	13.296
365+179.930	17.318
365+191.925	16.760
365+272.465	17.207
365+298.169	18.101
365+298.169	16.983
365+370.141	17.095]; 
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(24.7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Warb1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
F1 = 'length - weight: Ww in g = 0.01259*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '97XK'; % Cat of Life
metaData.links.id_ITIS = '172989'; % ITIS
metaData.links.id_EoL = '46570643'; % Ency of Life
metaData.links.id_Wiki = 'Achirus_mazatlanus'; % Wikipedia
metaData.links.id_ADW = 'Achirus_mazatlanus'; % ADW
metaData.links.id_Taxo = '160077'; % Taxonomicon
metaData.links.id_WoRMS = '279494'; % WoRMS
metaData.links.id_fishbase = 'Achirus-mazatlanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Achirus_mazatlanus}}';
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
'author = {K. Warburton}, ' ...
'year = {1979}, ' ...
'title  = {Growth and production of some important species of fish in a {M}exican coastal lagoon system}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {14(5)}, ' ...
'pages = {449–464}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Achirus-mazatlanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


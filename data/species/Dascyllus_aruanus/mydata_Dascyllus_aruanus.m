function [data, auxData, metaData, txtData, weights] = mydata_Dascyllus_aruanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Dascyllus_aruanus'; 
metaData.species_en = 'Whitetail dascyllus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 29];

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.1e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Baen2024';
  comment.Wwb = 'based on egg length of 0.7 mm and width 0.5 mm of Dascyllus_albisella: pi/6*0.07*0.05^2'; 
data.Wwp = 2.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.02239*Lp^2.95, see F1';
data.Wwi = 20;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02239*Li^2.95, see F1';

data.Ri  = 2e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
348.853	2.992
365+13.986	4.859
365+73.739	7.184
365+135.382	8.138];
data.tL(:,1) = data.tL(:,1) - 300; % set origin at birth 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02239*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6CCJX'; % Cat of Life
metaData.links.id_ITIS = '170123'; % ITIS
metaData.links.id_EoL = '46572530'; % Ency of Life
metaData.links.id_Wiki = 'Dascyllus_aruanus'; % Wikipedia
metaData.links.id_ADW = 'Dascyllus_aruanus'; % ADW
metaData.links.id_Taxo = '46270'; % Taxonomicon
metaData.links.id_WoRMS = '212843'; % WoRMS
metaData.links.id_fishbase = 'Dascyllus-aruanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dascyllus_aruanus}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Dascyllus-aruanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baen2024'; type = 'Misc'; bib = [ ...
'year = {2024}, ' ...
'author = {Frank Baensch}, ' ... 
'howpublished = {\url{https://www.frankbaensch.com/marine-aquarium-fish-culture/my-research/hawaiian-dascyllus-culture/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


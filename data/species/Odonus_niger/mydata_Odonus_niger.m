function [data, auxData, metaData, txtData, weights] = mydata_Odonus_niger

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Odonus_niger'; 
metaData.species_en = 'Red-toothed triggerfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 27];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'VaitMala2015: 2.5 yrs';

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.95e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MacK2008';
  comment.Wwb = 'based on egg diameter of 0.62 mm of Balistes_capriscus: pi/6*0.062^3';
data.Wwi = 3.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03236*Li^2.96, see F1';

data.Ri  = 312420/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'SuyaRaje2021';   
  temp.Ri = C2K(27.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
244.074	17.399
271.638	17.961
303.203	18.277
333.435	19.459
365+244.963	23.040
365+272.527	23.292
365+304.537	24.165
365+334.324	24.418];
data.tL(:,1) = 360 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VaitMala2015';

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.03236*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48SD8'; % Cat of Life
metaData.links.id_ITIS = '173222'; % ITIS
metaData.links.id_EoL = '46570702'; % Ency of Life
metaData.links.id_Wiki = 'Odonus_niger'; % Wikipedia
metaData.links.id_ADW = 'Odonus_niger'; % ADW
metaData.links.id_Taxo = '47013'; % Taxonomicon
metaData.links.id_WoRMS = '219883'; % WoRMS
metaData.links.id_fishbase = 'Odonus-niger'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Odonus_niger}}';
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
bibkey = 'VaitMala2015'; type = 'Article'; bib = [ ... 
'author = {T. Vaitheeswaran and S. Malathi and K. Prabakar and N. Neethiselvan, V. K. Venkataramani}, ' ... 
'year = {2015}, ' ...
'title = {Age and growth of red toothed triggerfish \emph{Odonus niger} ({R}uppell, 1836) (Family: {B}alistidae) off {T}hoothukudi, {S}outheast coast of {I}ndia}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {2(5)}, ' ...
'pages = {204-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SuyaRaje2021'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315421000771}, ' ...
'author = {Nitin Kanji Suyani and Mridula Rajesh and Mridula Rajesh and Kothanahally Mallegowda Rajesh}, ' ... 
'year = {2021}, ' ...
'title = {First report on the diet and reproductive biology of red-toothed triggerfish \emph{Odonus niger} ({R}uppell, 1836) from the south-eastern {A}rabian {S}ea}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {101(5)}, ' ...
'pages = {827-837}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacK2008'; type = 'Phdthesis'; bib = [ ... 
'author = {C. MacKichan Simmons}, ' ... 
'year = {2008}, ' ...
'title = {Gray triggerfish \emph{Balistes capriscus}, reproductive behaviour, early life history, and competitive iteractions between red snapper, \emph{Lutjanus campechanus}, in the nothern {G}ulf of {M}exico}, ' ...
'school = {Auburn University}, ' ...
'volume = {59}, ' ...
'pages = {231--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Odonus-niger.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


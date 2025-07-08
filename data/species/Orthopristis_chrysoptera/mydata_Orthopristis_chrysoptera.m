function [data, auxData, metaData, txtData, weights] = mydata_Orthopristis_chrysoptera
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Orthopristis_chrysoptera'; 
metaData.species_en = 'Pigfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 18];

%% set data
% zero-variate data

data.am = 4*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(24.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 46;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BroaOhs2024';
  comment.Wwb = 'based egg diameter of 0.9 mm : pi/6*0.09^3'; 
data.Wwp = 146.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^3.01, see F1';
data.Wwi = 1.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^3.01, see F1';

data.Ri  = 2.6e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'BroaOhs2024';   
  temp.Ri = C2K(24.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of 1439 eggs per g';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (cm)
 32.065	 0.697
 59.438	 1.265
 88.168	 2.710
120.670	 8.000
148.950	11.277
180.387	14.503
210.011	15.510
240.643	15.613
271.268	15.742];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HildCabl1930';
comment.tL = 'based on max values';

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01778*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '74WRN'; % Cat of Life
metaData.links.id_ITIS = '169077'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Orthopristis_chrysoptera'; % Wikipedia
metaData.links.id_ADW = 'Orthopristis_chrysoptera'; % ADW
metaData.links.id_Taxo = '182224'; % Taxonomicon
metaData.links.id_WoRMS = '158810'; % WoRMS
metaData.links.id_fishbase = 'Orthopristis_chrysoptera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orthopristis_chrysoptera}}';
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
bibkey = 'HildCabl1930'; type = 'article'; bib = [ ...  
'author = {Hildebrand, S. F. and L. E. Cable}, ' ...
'year = {1930}, ' ...
'title = {Development and life history of fourteen teleostean fishes at {B}eaufort, {N}orth {C}arolina}, ' ... 
'journal = {Bull. U.S. Bur. Fish.}, ' ...
'volume = {43}, ' ...
'pages = {383–488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BroaOhs2024'; type = 'article'; bib = [ ...  
'doi = {10.24966/AAF-5523/100084}, ' ...
'author = {Jason S. Broach and Cortney L. Ohs and Nancy E. Breen}, ' ...
'year = {2024}, ' ...
'title = {Natural Spawning of Pigfish \emph{Orthopristis Chrysoptera} in Captivity and Predictors of Egg and Larval Quality}, ' ... 
'journal = {Journal of Aquaculture & Fisheries}, ' ...
'volume = {8}, ' ...
'pages = {084}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Orthopristis_chrysoptera.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

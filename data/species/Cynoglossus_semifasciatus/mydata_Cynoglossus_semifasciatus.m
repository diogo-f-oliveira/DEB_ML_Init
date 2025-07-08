function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_semifasciatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_semifasciatus'; 
metaData.species_en = 'Bengal tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 02];

%% set data
% zero-variate data
data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(28.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';  
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'guess';
data.Li = 15;  units.Li = 'cm';   label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';

data.Wwb = 1.44e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Bens1965';
  comment.Wwb = 'based on egg diameter of 0.65 mm: pi/6*0.065^3';
data.Wwp = 5.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01514*Lp^3.00, see F1';
data.Wwi = 51; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01514*Li^3.00, see F1';

data.Ri  = 2e4/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cynoglossus_lida';

% uni-variate data
% time-length        
data.tL = [ ... % age (mnt), total length (cm)
    4	5.562
    6	6.024
    7	6.801
    8	8.153
    9	8.737
   10	10.411
   11	8.679
   12	10.743
   16	13.319
   17	13.644
   18	13.723];
data.tL(:,1) = 30.5 *(0+data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sesh1964'; 
comment.tL = 'data from 1959/1969';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01514*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5ZR'; % Cat of Life
metaData.links.id_ITIS = '616345'; % ITIS
metaData.links.id_EoL = '46570072'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_semifasciatus'; % ADW
metaData.links.id_Taxo = '172581'; % Taxonomicon
metaData.links.id_WoRMS = '274224'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-semifasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus}}';
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
bibkey = 'Sesh1964'; type = 'article'; bib = [ ...
'author = {Seshappa, G.}, ' ...
'year = {1964}, ' ...
'title = {Length frequency studies on the {M}alabar sole, \emph{Cynoglossus semifasciatus} {D}ay at {W}est {H}ill, {C}alicut, {I}ndia during the years 1959-60 to 1962-63}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {11(2)}, ' ...
'pages = {533-546}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bens1965'; type = 'article'; bib = [ ...
'author = {Bensam, P}, ' ...
'year = {1965}, ' ...
'title = {On the eggs and larval stages of the {M}alabar sole}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {12}, ' ...
'pages = {90-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-semifasciatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

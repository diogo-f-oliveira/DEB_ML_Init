function [data, auxData, metaData, txtData, weights] = mydata_Parastromateus_niger
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Parastromateus_niger'; 
metaData.species_en = 'Black pomfret'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 04];

%% set data
% zero-variate data
data.ab = 3.2;      units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess'; 
  temp.ab = C2K(28.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23; units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 75;   units.Li = 'cm'; label.Li = 'ultimate fork length'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 6.74e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.89, see F1';

data.Ri  = 151796/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1.726	29.896
2.212	36.400
2.748	42.310
3.722	47.970
4.770	52.738];
data.tL(:,1) = (data.tL(:,1)-0.3)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(28.1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TaghBagh2005'; 

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

%% Facts
F1 = 'length-weight: Ww in g = 0.02570*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PCJ'; % Cat of Life
metaData.links.id_ITIS = '168709'; % ITIS
metaData.links.id_EoL = '46578050'; % Ency of Life
metaData.links.id_Wiki = 'Parastromateus_niger'; % Wikipedia
metaData.links.id_ADW = 'Parastromateus_niger'; % ADW
metaData.links.id_Taxo = '45252'; % Taxonomicon
metaData.links.id_WoRMS = '151169'; % WoRMS
metaData.links.id_fishbase = 'Parastromateus-niger'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Parastromateus_niger}}';  
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
bibkey = 'TaghBagh2005'; type = 'article'; bib = [ ...
'author = {Taghavi Motlagh, A. and Bagheri, Z. and Ashja Ardalan, A. and Vosoughi, A. and Noori Dafrazi, R.}, ' ...
'year = {2005}, ' ...
'title = {Estimation growth parameters of \emph{Parastromateus_niger} in the coastal waters of {S}istan and {B}aluchestan, {O}man {S}ea}, ' ... 
'journal = {Iranian Sci. Fish. J.}, ' ...
'volume = {13(4)}, ' ...
'pages = {26–34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Parastromateus-niger.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

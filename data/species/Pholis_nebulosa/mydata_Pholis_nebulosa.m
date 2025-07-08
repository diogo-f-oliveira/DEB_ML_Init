function [data, auxData, metaData, txtData, weights] = mydata_Pholis_nebulosa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Pholidae';
metaData.species    = 'Pholis_nebulosa'; 
metaData.species_en = 'Tidepool gunnel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 19];

%% set data
% zero-variate data

data.am = 5*365;      units.am = 'd';    label.am = 'life span';        bibkey.am = 'guess';   
  temp.am = C2K(18.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on same relative length, compared to Pholis gunnellus';
data.Li  = 30;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Sawy1967';
  comment.Wwb = 'based on egg diameter of 2 mm of Pholis gunnellus: pi/6*0.2^3';
data.Wwi = 174;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00257*Li^3.27, see F1';

data.Ri  = 7300/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.080	1.356
0.178	3.081
0.251	4.561
0.324	6.660
0.395	9.996
0.483	9.867
0.557	9.615
0.966	11.259
1.072	10.572
1.133	12.486
1.237	13.346
1.292	15.569
1.409	16.181
1.488	18.093
1.985	18.619
2.077	19.232
2.318	20.887
2.419	19.706
2.496	24.216
2.825	24.443
3.246	24.974
3.346	24.535
3.419	27.067];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KimuOkaz1987';
comment.tL = 'temperature fluctuates seasonally between 9 and 25 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature varies seasonally from 3 to 25 C, hatch in Nov till Feb at 5 C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00257*(TL in cm)^3.27';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GMJ6'; % Cat of Life
metaData.links.id_ITIS = '631241'; % ITIS
metaData.links.id_EoL = '46574592'; % Ency of Life
metaData.links.id_Wiki = 'Pholis'; % Wikipedia
metaData.links.id_ADW = 'Pholis_nebulosa'; % ADW
metaData.links.id_Taxo = '691584'; % Taxonomicon
metaData.links.id_WoRMS = '273691'; % WoRMS
metaData.links.id_fishbase = 'Pholis-nebulosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pholidae}}';
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
bibkey = 'Sawy1967'; type = 'Article'; bib = [ ... 
'author = {Philip J. Sawyer}, ' ... 
'year = {1967}, ' ...
'title = {Intertidal Life-History of the Rock Gunnel, \emph{Pholis gunnellus}, in the {W}estern {A}tlantic}, ' ...
'journal = {Copeia}, ' ...
'volume = {1967}, ' ...
'pages = {55-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KimuOkaz1987'; type = 'Article'; bib = [ ... 
'author = {Kimura, S. and T. Okazawa and K. Mori}, ' ... 
'year = {1987}, ' ...
'title = {Growth of the tidepool gunnel in {A}go {B}ay, {C}entral {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {53(11)}, ' ...
'pages = {1965-1968}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pholis-nebulosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


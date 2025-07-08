function [data, auxData, metaData, txtData, weights] = mydata_Protomyctophum_arcticum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Protomyctophum_arcticum'; 
metaData.species_en = 'Arctic telescope'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAN',''};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.2); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(6.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.2;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on Electrona antarctica: 0.7*6 cm';
data.Li = 6;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Benthosema_suborbitale: pi/6*0.05^3';
data.Wwp = 0.756; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwp = 'based on 0.00871*Lp^3.11, see F3';
data.Wwi = 2.29;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00871*Li^3.11, see F3';
  
data.Ri  = 2.6e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(6.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Benthosema_suborbitale: 400*(6/3.2)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
75.241	0.811
131.272	1.194
140.877	1.330
188.904	1.589
204.912	1.549
256.140	1.840
264.145	1.833
358.597	2.625
377.807	2.735
435.439	3.078
501.075	3.492];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(6.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mauc1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g =  0.00871*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4N67R'; % Cat of Life
metaData.links.id_ITIS = '162689'; % ITIS
metaData.links.id_EoL = '46564226'; % Ency of Life
metaData.links.id_Wiki = 'Protomyctophum_arcticum'; % Wikipedia
metaData.links.id_ADW = 'Protomyctophum_arcticum'; % ADW
metaData.links.id_Taxo = '184850'; % Taxonomicon
metaData.links.id_WoRMS = '158917'; % WoRMS
metaData.links.id_fishbase = 'Protomyctophum-arcticum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Protomyctophum_arcticum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for Protomyctophum_arcticummetabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mauc1988'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00391115}, ' ...
'author = {J. Mauchline}, ' ... 
'year = {1988}, ' ...
'title = {Growth and breeding of meso- and bathypelagic organisms of the {R}ockall {T}rough, northeastern {A}tlantic {O}cean and evidence of seasonality}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {98(3)}, ' ...
'pages = {387–393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Protomyctophum-arcticum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


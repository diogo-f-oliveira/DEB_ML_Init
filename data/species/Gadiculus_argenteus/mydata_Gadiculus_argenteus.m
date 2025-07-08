function [data, auxData, metaData, txtData, weights] = mydata_Gadiculus_argenteus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Gadiculus_argenteus'; 
metaData.species_en = 'Silvery pout'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', '0iMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.am = 3*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 15;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'MunkNiel2005';
  comment.Wwb = 'based on egg diameter of 1  mm: 4/3*pi*0.05^3';
data.Wwi = 29; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.0048 * Li^3.096, see F4';

data.Ri = 5e5/365; units.Ri = '#/d';  label.Ri = 'reprod rate at ...'; bibkey.Ri = 'guess';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
1.988	12.067
3.001	12.989
3.002	14.041
3.002	14.492
3.002	15.019
3.002	15.244
3.002	15.921
3.011	16.372
4.007	16.090
4.007	16.692
4.014	13.008
4.014	14.511
4.015	15.113
4.015	15.414
4.015	15.790];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Magn2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature ?';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'pelagically in schools near bottom';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.0048 * (L in cm)^3.096';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6K6ZR'; % Cat of Life
metaData.links.id_ITIS = '164772'; % ITIS
metaData.links.id_EoL = '46564412'; % Ency of Life
metaData.links.id_Wiki = 'Gadiculus_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Gadiculus_argenteus'; % ADW
metaData.links.id_Taxo = '44309'; % Taxonomicon
metaData.links.id_WoRMS = '126435'; % WoRMS
metaData.links.id_fishbase = 'Gadiculus-argenteus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gadiculus_argenteus}}';
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
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Magn2007'; type = 'article'; bib = [ ...
'author = {E. Magnussen}, ' ... 
'year   = {2007}, ' ...
'title  = {Interpopulation comparison of growth patterns of 14 fish species on {F}aroe {B}ank: are all fishes on the bank fast-growing?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {453-475}, ' ...
'volume = {71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1875}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

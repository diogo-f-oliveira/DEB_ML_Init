function [data, auxData, metaData, txtData, weights] = mydata_Pseudocrenilabrus_philander
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Pseudocrenilabrus_philander'; 
metaData.species_en = 'Southern mouthbrooder'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

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

data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 1.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^2.966, see F1';
data.Wwi = 29;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^2.966, see F1'; 

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% initial length-length after 1 yr
data.LL = [ ... % total length at t (cm), total length at t + 1 yr (cm)
3.095	3.974
3.552	4.412
3.572	4.096
4.090	4.450
4.091	4.934
4.193	4.154
4.421	4.342
4.589	4.993
4.629	4.656
4.816	4.865
5.026	5.979
5.066	5.452
5.210	5.135
5.378	5.955
5.438	5.365
5.625	5.574
5.937	5.971
6.166	6.432];
units.LL   = {'cm', 'cm'};  label.LL = {'total length at t', 'total length at t + 1 yr', 'shelving shore'};  
temp.LL    = C2K(23);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'HustMars1990';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LL1','LL2'}; subtitle1 = {'Data for shelving, steep shore'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4FVMC'; % Cat of Life
metaData.links.id_ITIS = '649234'; % ITIS
metaData.links.id_EoL = '204318'; % Ency of Life
metaData.links.id_Wiki = 'Pharyngochromis'; % Wikipedia
metaData.links.id_ADW = 'Pharyngochromis_darlingi'; % ADW
metaData.links.id_Taxo = '183632'; % Taxonomicon
metaData.links.id_WoRMS = '1054091'; % WoRMS
metaData.links.id_fishbase = 'Pharyngochromis-darlingi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pharyngochromis}}';
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
bibkey = 'HustMars1990'; type = 'article'; bib = [ ... 
'doi = {10.1007/bf00008193}, ' ...
'author = {K. Hustler and B. E. Marshall}, ' ...
'year  = {1990}, ' ...
'title = {Population dynamics of two small cichlid fish species in a tropical man-made lake ({L}ake {K}ariba)}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {190}, ' ...
'pages = {253-262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pharyngochromis-darlingi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


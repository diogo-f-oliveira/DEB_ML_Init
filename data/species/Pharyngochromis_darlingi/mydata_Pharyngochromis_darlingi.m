function [data, auxData, metaData, txtData, weights] = mydata_Pharyngochromis_darlingi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Pharyngochromis_darlingi'; 
metaData.species_en = 'Zambezi happy'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-L_f'}; 

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

data.am = 8*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 22;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 12.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.96, see F1';
data.Wwi = 133;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.96, see F1';

data.Ri  = 200/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% length-length
data.LL1 = [ ... % total length at t (cm), total length at t + 1 yr (cm)
2.643	3.785
2.971	3.992
3.340	4.595
3.443	4.908
3.463	4.030
3.648	4.488
3.873	4.235
3.975	4.569
4.242	4.504
4.447	4.984
4.570	5.527
4.795	5.420
5.041	5.188
5.143	5.857
5.225	5.417
5.287	6.044
5.471	6.356
5.471	5.896
5.820	6.499
5.922	6.708
5.922	6.268
6.168	6.664
6.209	6.998
6.270	6.433
6.311	6.830
6.455	7.017
6.516	6.745
6.639	7.016
6.680	7.350
6.926	7.955
7.213	8.517
7.951	8.239
8.238	8.550
8.402	9.051
8.463	8.674
8.627	9.300
9.180	9.547];
units.LL1   = {'cm', 'cm'};  label.LL1 = {'total length at t', 'total length at t + 1 yr', 'shelving shore'};  
temp.LL1    = C2K(23);  units.temp.LL1 = 'K'; label.temp.LL1 = 'temperature';
bibkey.LL1 = 'HustMars1990';
%
data.LL2 = [ ... % total length at t (cm), total length at t + 1 yr (cm)
2.402	2.641
3.539	4.575
3.601	4.263
4.071	4.276
4.376	4.499
4.538	5.057
4.600	4.765
5.107	6.025
5.720	5.952
5.922	6.427
6.167	6.464
6.596	6.582];
units.LL2   = {'cm', 'cm'};  label.LL2 = {'total length at t', 'total length at t + 1 yr', 'steep shore'};  
temp.LL2    = C2K(23);  units.temp.LL2 = 'K'; label.temp.LL2 = 'temperature';
bibkey.LL2 = 'HustMars1990';

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

%% Group plots
set1 = {'LL1','LL2'}; subtitle1 = {'Data for shelving, steep shore'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^2.96'; 
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


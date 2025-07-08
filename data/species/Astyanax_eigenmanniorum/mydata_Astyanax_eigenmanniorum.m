  function [data, auxData, metaData, txtData, weights] = mydata_Astyanax_eigenmanniorum
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Astyanax_eigenmanniorum'; 
metaData.species_en = 'Tetra'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL_f'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 29];

%% set data
% zero-variate data
data.ab = 6.7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Astyanax_mexicanus';

data.Lp = 7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 14.4;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 7.05;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01660*Lp^3.11, see F1';
data.Wwi = 36.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.01660*Li^3.11, see F1';

data.Ri = 3161/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Astyanax_mexicanus. Fecundity 1e3*36.3/16.8';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
  0.127 3.938
  0.858 5.467
  0.877 4.525
  0.931 5.190
  0.997 5.750
  0.998 4.200
  1.128 7.100
  1.858 6.714
  1.877 6.930
  1.931 7.357
  1.997 7.465
  1.998 7.967
  2.764 9.300
  2.838 8.400
  2.877 8.400
  2.931 8.625
  2.997 8.689
  2.998 8.500
  3.838 10.300
  3.931 10.100
  3.997 9.575
  3.998 9.143
  4.997 9.450];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BarlFrey1988';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    0.858 5.467
    0.877 4.525
    0.931 5.190
    0.997 5.750
    0.998 4.200
    1.858 7.017
    1.877 6.600
    1.931 7.063
    1.933 6.750
    1.997 7.238
    1.998 8.000
    2.700 7.300
    2.858 8.600
    2.877 8.166
    2.931 8.030
    2.933 6.400
    2.997 8.487
    2.998 8.125
    3.858 8.300
    3.877 8.000
    3.931 8.600
    3.997 8.600
    3.998 7.900];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BarlFrey1988';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01660*(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'J5RC'; % Cat of Life
metaData.links.id_ITIS = '640468'; % ITIS
metaData.links.id_EoL = '221149'; % Ency of Life
metaData.links.id_Wiki = 'Astyanax_(fish)'; % Wikipedia
metaData.links.id_ADW = 'Astyanax_eigenmanniorum'; % ADW
metaData.links.id_Taxo = '162145'; % Taxonomicon
metaData.links.id_WoRMS = '1526193'; % WoRMS
metaData.links.id_fishbase = 'Astyanax-eigenmanniorum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Astyanax_(fish)}}';  
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
bibkey = 'BarlFrey1988'; type = 'Article'; bib = [ ...
'doi = {10.1080/01650528809360759}, ' ...
'author = {Barla, María J. and Freyre, Lauce R. and Giraudo, Liliana M. and Gutierrez, Mercedes and Sendra, Eduardo D.}, ' ...
'year = {1988}, ' ...
'title = {Age and growth of \emph{Astyanax eigenmanniorum} ({C}ope) ({P}isces, {C}haraciformes) from {S}an {R}oque {L}ake, {A}rgentina}, ' ... 
'journal = {Studies on Neotropical Fauna and Environment}, ' ...
'volume = {23(3)}, '...
'pages = {177–188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Astyanax-eigenmanniorum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


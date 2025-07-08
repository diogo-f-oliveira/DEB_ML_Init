  function [data, auxData, metaData, txtData, weights] = mydata_Amblyopsis_rosae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Amblyopsidae';
metaData.species    = 'Amblyopsis_rosae'; 
metaData.species_en = 'Ozark cavefish'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvae'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 05 25];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 05 26]; 


%% set data
% zero-variate data
data.ab = 5 * 30.5; units.ab = 'd'; label.ab = 'age at birth';                    bibkey.ab = 'Poul1963'; 
  temp.ab = C2K(14.2); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 48*30.5;  units.tp = 'd';   label.tp = 'time since birth at puberty';   bibkey.tp = 'Poul1963';
  temp.tp = C2K(14.2); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'tab 5, 36-48 months; 48 month take, in view of tL data';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                      bibkey.am = 'ADW';   
  temp.am = C2K(14.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'average longevity in the wild';
  
data.Lp = 3.6;    units.Lp = 'cm';  label.Lp = 'standard length at puberty';      bibkey.Lp = 'Poul1963'; 
  comment.Lp = 'table 5, 36-42 mm standard length';
data.Li = 4.9;  units.Li = 'cm';  label.Li = 'ultimate standard length';       bibkey.Li = 'Poul1963';
 comment.Li = 'BrowJohn2001 report max TL 65 mm max, fishbase gives max TL 62 mm';
 
data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'WhitCulv2012';
  comment.Wwb = 'based on egg diameter of 1.9-2.2 mm: pi/6*0.2^3';
data.Wwp = 0.0278 * data.Lp^3; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Poul1963';
  comment.Wwp = 'computed from SL, see discussion';
data.Wwi = 0.0278 * data.Li^3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Poul1963';
  comment.Wwi = 'computed from SL, see discussion';
  
data.Ri = 25/365; units.Ri = '#/d'; label.Ri = 'ultimate reprod rate';            bibkey.Ri = 'ADW';   
  temp.Ri = C2K(14.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
%     
% uni-variate data
% t-L data from wisc in Green Bay
data.tL = [ ... % time (yr), standard length (mm)
5.772e-001	1.020e+001
6.539e-001	1.116e+001
1.800e+000	1.608e+001
1.889e+000	1.716e+001
1.801e+000	1.826e+001
2.733e+000	2.561e+001
2.733e+000	2.683e+001
2.722e+000	3.022e+001
2.861e+000	2.743e+001
2.824e+000	3.034e+001
2.813e+000	3.337e+001
3.242e+000	2.753e+001
3.127e+000	2.729e+001
3.116e+000	2.947e+001
3.118e+000	3.336e+001
3.195e+000	3.517e+001
3.347e+000	3.492e+001
3.398e+000	3.371e+001
3.550e+000	3.297e+001
3.690e+000	3.357e+001
3.627e+000	3.527e+001
3.794e+000	3.830e+001
3.819e+000	3.720e+001
3.806e+000	3.648e+001
3.869e+000	3.538e+001
3.920e+000	3.659e+001
3.908e+000	3.817e+001
3.871e+000	3.963e+001
3.872e+000	4.205e+001
3.887e+000	4.533e+001
4.040e+000	4.641e+001
4.062e+000	3.998e+001
4.192e+000	4.640e+001
4.268e+000	4.555e+001
4.280e+000	4.373e+001
4.555e+000	3.692e+001
4.595e+000	4.019e+001
4.788e+000	4.334e+001
4.852e+000	4.479e+001
4.905e+000	4.855e+001
5.019e+000	4.927e+001]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2)/10;    % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'}; 
temp.tL = C2K(14.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Poul1963';

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

%% Facts
F1 = 'extremely specialized to their cave ecosystem, requiring a pristine water source that remains at a temperature between 12.8 and 15.6 C';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'eggs within the gill chambers of the female';
metaData.bibkey.F2 = 'ADW'; 
F3 = 'no pelvic fin; only rudimentary eyes and no optic nerve';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1', F1, 'F2', F2, 'F3', F3);

%% Discussion points
D1 = 'Poul1963: table 12 reports that 45mm individual weighs 2.53 g - we use 2.53/4.5^3 = 0.0278 to convert SL to weight in zero-variate data';
D2 = 'max length is likely higher than the max recorded in Poul1963';
D3 = 'From photo: SL = 0.8 * TL';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = 'CMRB'; % Cat of Life
metaData.links.id_ITIS = '164394'; % ITIS
metaData.links.id_EoL = '205066'; % Ency of Life
metaData.links.id_Wiki = 'Amblyopsis_rosae'; % Wikipedia
metaData.links.id_ADW = 'Amblyopsis_rosae'; % ADW
metaData.links.id_Taxo = '107485'; % Taxonomicon
metaData.links.id_WoRMS = '1019177'; % WoRMS
metaData.links.id_fishbase = 'Amblyopsis-rosae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ozark_cavefish}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Amblyopsis_rosae/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitCulv2012'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {William. B. White and David C. Culver}, ' ...
'year = {2012}, ' ...
'title  = {Encyclopedia of caves}, ' ...
'publisher = {Elsevier}'];
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
bibkey = 'BrowJohn2001'; type = 'Article'; bib = [ ...  
'author = {J. Zack Brown and James E. Johnson}, ' ...
'year = {2001}, ' ...
'title = {Population biology and growth of {O}zark cavefish in Logan Cave National Wildlife Refuge, Arkansas}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {62}, '...
'pages = {161--169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Poul1963'; type = 'Article'; bib = [ ...  
'author = {Thomas L. Poulson}, ' ...
'year = {1963}, ' ...
'title = {Cave Adaptation in {A}mblyopsid Fishes}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {70}, '...
'number = {2}, '...
'pages = {257--290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


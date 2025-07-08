  function [data, auxData, metaData, txtData, weights] = mydata_Mystus_cavasius
  
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Mystus_cavasius'; 
metaData.species_en = 'Gangetic mystus'; 

metaData.ecoCode.climate = {'Aw','Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 25];

%% set data
% zero-variate data
data.ab = 6.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.6;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'RoyAbed2022';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 7.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'RoyAbed2022','fishbase'};
  comment.Wwp = 'based on 0.00933*Li^2.97, see F1';
data.Wwi = 534.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^2.97, see F1; max published weight 10 kg';
 
data.Ri  = 63135/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tLW = [ ... % time (d), total length (cm), weight (g)
  0	 6.434  2.737
 15	 8.939  4.550
 30	11.245  6.424
 45	12.886  8.176
 60	14.328  9.989
 75	15.041 11.742
 90	16.218 13.311
105	16.397 14.879];
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time', 'total length', 'weight'};  
  temp.tLW = C2K(22);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'HosePerv2017'; treat.tLW = {1 {'length','weight'}};
comment.tLW = 'Data from culture';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.Ri = weights.Ri * 3;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45FTL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46581947'; % Ency of Life
metaData.links.id_Wiki = 'Mystus_cavasius'; % Wikipedia
metaData.links.id_ADW = 'Mystus_cavasius'; % ADW
metaData.links.id_Taxo = '180639'; % Taxonomicon
metaData.links.id_WoRMS = '281615'; % WoRMS
metaData.links.id_fishbase = 'Mystus-cavasius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Mystus_cavasius}}';  
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
bibkey = 'HosePerv2017'; type = 'Article'; bib = [ ...
'doi = {10.15517/rev.biol.trop..v71i1.51734}, ' ...
'author = {Md. Hafiz All Hosen and Rubaiya Pervin and Sheik Istiak Md. Shahriar}, ' ...
'year = {2017}, ' ...
'title = {Changes in growth performances, survival rate and water quality parameter of pond on different stocking density of Gulsha Tengra (\emph{Mystus cavasius}) in a monoculture system}, ' ... 
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {5(6)}, '...
'pages = {52-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoyAbed2022'; type = 'Article'; bib = [ ...
'doi = {10.15517/rev.biol.trop..v71i1.51734}, ' ...
'author = {Dulon Roy and Abu Musa Mohammad Khairul Abedin and Ashish Kumer Sarker and Smita Sarker and Mst. Hasina Begum and Gulshan Ara Latifa}, ' ...
'year = {2022}, ' ...
'title = {Some Biological Aspects of Pond Reared \emph{Mystus cavasius} ({H}amilton, 1822) Collected from a Local Fish Farm in {M}ymensingh, {B}angladesh}, ' ... 
'journal = {Aquaculture Studies}, ' ...
'volume = {22(4)}, '...
'pages = {AQUAST797}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mystus-cavasius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


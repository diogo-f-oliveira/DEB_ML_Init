function [data, auxData, metaData, txtData, weights] = mydata_Lestrolepis_japonica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Lestidiidae';
metaData.species    = 'Lestrolepis_japonica'; 
metaData.species_en = 'Japanese barracudina'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 01];

%% set data
% zero-variate data

data.am = 4*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HaraOzaw2003';   
  temp.am = C2K(9.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 22.2;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 3.8e-4;   units.Wwb  = 'cm';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Harpadon_nehereus: pi/6*0.09^3';
data.Wwp = 3.53;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00219*Lp^3.08, see F1';
data.Wwi = 30.7;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00219*Li^3.08, see F1';
 
data.Ri = 500/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase'; 
  temp.Ri = C2K(9.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
5.895	0.093
184.711	12.238
251.521	13.915
279.031	13.776
369.421	15.314
396.931	12.152
457.847	13.596
520.727	16.110
548.237	15.366
611.117	15.275
640.592	15.044
672.032	16.021
730.983	15.744
762.423	16.536
823.338	16.538
850.848	17.515
882.288	16.819
913.728	16.634
974.643	16.636
1000.188	17.195
1035.558	17.568
1066.999	17.755
1096.474	16.826
1125.949	17.803
1340.135	17.996
1369.610	18.044
1399.085	18.138
1458.035	18.512];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'length'};  
temp.tL    = C2K(9.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HaraOzaw2003';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00219*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Q2WB'; % Cat of Life
metaData.links.id_ITIS = '644793'; % ITIS
metaData.links.id_EoL = '46563884'; % Ency of Life
metaData.links.id_Wiki = 'Lestrolepis_japonica'; % Wikipedia
metaData.links.id_ADW = 'Lestrolepis_japonica'; % ADW
metaData.links.id_Taxo = '178684'; % Taxonomicon
metaData.links.id_WoRMS = '275835'; % WoRMS
metaData.links.id_fishbase = 'Lestrolepis-japonica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lestrolepis_japonica}}';
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
bibkey = 'HaraOzaw2003'; type = 'Article'; bib = [ ... 
'doi = {10.3390/jmse11061212}, ' ...
'author = {Harada, T. and Ozawa, T.}, ' ... 
'year = {2003}, ' ...
'title = {Age and growth of \emph{Lestrolepis japonica} ({A}ulopiformes: {P}aralepididae) in {K}agoshima {B}ay, southern {J}apan}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {50(2)}, ' ...
'pages = {182–185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lestrolepis-japonica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Eviota_queenslandica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Eviota_queenslandica'; 
metaData.species_en = 'Queensland dwarfgoby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 24];

%% set data
% zero-variate data

data.ab = 3.5;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 99;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.31;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'DepcBellw2006'; 
data.Li  = 2.4;   units.Li  = 'cm';  label.Li  = 'ultimate std length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KariArai2006';
  comment.Wwb = 'based on egg diameter of 0.61 mm of Eviota prasina: pi/6*0.061^3';
data.Wwp = 0.009;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'DepcBellw2006','fishbase'};
  comment.Wwp = 'based on 0.00692*Lp^3.10, see F1';
data.Wwi = 0.21;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00692*Li^3.10, see F1';

data.Ni  = 1039;   units.Ni  = '#/d'; label.Ni  = 'lifetime reproductive output'; bibkey.Ni  = 'DepcBellw2006';   
  temp.Ni = C2K(28.7);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% time-length
data.tL = [... %  time since birth (d), total length (cm)
33.761	1.031
33.904	0.904
37.777	0.877
38.228	0.950
40.019	1.010
42.846	0.910
45.395	1.230
45.533	1.003
45.979	0.976
48.238	1.450
48.245	1.597
49.264	1.096
50.024	1.396
51.963	1.436
52.858	1.450
53.451	1.389
56.151	1.730
56.903	1.870
57.183	1.516
58.247	1.937
59.149	2.083
59.572	1.609
60.186	1.970
61.530	2.023
62.558	1.709
62.870	1.989
63.011	1.822
63.441	1.488
64.939	1.635
65.231	1.521
65.402	1.956
65.543	1.809
65.827	1.508
66.288	1.795
66.301	2.049
67.032	1.768
69.275	1.915
69.558	1.628
69.732	2.115
70.002	1.554
70.609	1.781
71.808	1.915
73.591	1.808
77.634	2.195
77.801	2.555
79.116	2.021
80.168	2.201
81.797	1.994
83.127	1.766
83.134	1.913
83.444	2.140
84.798	2.401
86.278	2.193
87.331	2.394
89.400	2.033
91.805	2.460
97.606	2.225
98.815	2.573];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DepcBellw2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 3 * weights.Li;
weights.Ni = 3 * weights.Ni;

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
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00692*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3DHNB'; % Cat of Life
metaData.links.id_ITIS = '637324'; % ITIS
metaData.links.id_EoL = '46575802'; % Ency of Life
metaData.links.id_Wiki = 'Eviota'; % Wikipedia
metaData.links.id_ADW = 'Eviota_queenslandica'; % ADW
metaData.links.id_Taxo = '174412'; % Taxonomicon
metaData.links.id_WoRMS = '278604'; % WoRMS
metaData.links.id_fishbase = 'Eviota_queenslandica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eviota}}';
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
bibkey = 'DepcBellw2006'; type = 'Article'; bib = [ ... 
'doi = {10.1890/0012-9658(2006)87[3119:epaiiv]2.0.c}, ' ...
'author = {Depczynski, M. and Bellwood, D. R.}, ' ... 
'year = {2006}, ' ...
'title = {EXTREMES, PLASTICITY, AND INVARIANCE IN VERTEBRATE LIFE HISTORY TRAITS: {I}NSIGHTS FROM CORAL REEF FISHES}, ' ...
'journal = {Ecology}, ' ...
'volume = {87(12)}, ' ...
'pages = {3119–3127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KariArai2006'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.jembe.2006.01.018}, ' ...
'author = {Kenji Karino and, Reiko Arai}, ' ... 
'year = {2006}, ' ...
'title = {Effect of clutch size on male egg-fanning behavior and hatching success in the goby, \emph{Eviota prasina} ({K}lunzinger)}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {334}, ' ...
'pages = {43–50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Eviota-queenslandica.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

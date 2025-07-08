function [data, auxData, metaData, txtData, weights] = mydata_Eviota_melasma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Eviota_melasma'; 
metaData.species_en = 'Headspot dwarfgoby'; 

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
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 97;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.09;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'DepcBellw2006'; 
data.Li  = 3;   units.Li  = 'cm';  label.Li  = 'ultimate std length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KariArai2006';
  comment.Wwb = 'based on egg diameter of 0.61 mm of Eviota prasina: pi/6*0.061*3';
data.Wwp = 0.009;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'DepcBellw2006','fishbase'};
  comment.Wwp = 'based on 0.00692*Lp^3.10, see F1';
data.Wwi = 0.21;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00692*Li^3.10, see F1';

data.Ni  = 781;   units.Ni  = '#/d'; label.Ni  = 'lifetime reproductive output'; bibkey.Ni  = 'DepcBellw2006';   
  temp.Ni = C2K(27.9);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% time-length
data.tL = [... %  time since birth (d), total length (cm)
33.443	1.197
36.724	1.243
39.110	1.270
40.297	1.169
41.493	1.243
42.379	1.088
46.285	1.719
49.853	1.530
54.038	1.785
54.795	2.019
55.225	1.677
55.229	1.751
57.028	1.965
57.174	1.905
57.759	1.690
58.637	1.361
59.096	1.589
59.098	1.643
59.407	1.851
60.899	1.898
61.203	2.012
61.943	1.911
63.743	2.139
64.036	2.038
64.316	1.676
64.631	2.018
65.387	2.226
66.415	1.917
67.134	1.407
67.163	1.978
67.451	1.783
68.512	2.138
69.409	2.199
69.688	1.816
70.746	2.111
71.785	2.024
73.435	2.238
74.298	1.621
77.003	2.063
77.457	2.204
77.889	1.902
77.930	2.721
78.044	2.010
81.334	2.237
81.644	2.486
81.934	2.318
82.675	2.237
84.159	2.116
85.207	2.203
86.545	2.136
86.553	2.304
87.158	2.478
89.369	1.981
89.524	2.116
91.332	2.511
91.616	2.223
96.838	2.343];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DepcBellw2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

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
metaData.links.id_CoL = '3DHM5'; % Cat of Life
metaData.links.id_ITIS = '637312'; % ITIS
metaData.links.id_EoL = '46575794'; % Ency of Life
metaData.links.id_Wiki = 'Eviota_melasma'; % Wikipedia
metaData.links.id_ADW = 'Eviota_melasma'; % ADW
metaData.links.id_Taxo = '174403'; % Taxonomicon
metaData.links.id_WoRMS = '278596'; % WoRMS
metaData.links.id_fishbase = 'Eviota-melasma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eviota_melasma}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Eviota-melasma.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

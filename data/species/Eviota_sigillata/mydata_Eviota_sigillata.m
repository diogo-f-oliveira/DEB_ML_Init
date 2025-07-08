function [data, auxData, metaData, txtData, weights] = mydata_Eviota_sigillata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Eviota_sigillata'; 
metaData.species_en = 'Adorned dwarfgoby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
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

data.ab = 2.5;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 59;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.12;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'DepcBellw2006'; 
data.Li  = 3.0;   units.Li  = 'cm';  label.Li  = 'ultimate std length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KariArai2006';
  comment.Wwb = 'based on egg diameter of 0.61 mm of Eviota prasina: pi/6*0.061^3';
data.Wwp = 0.0098;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'DepcBellw2006','fishbase'};
  comment.Wwp = 'based on 0.00692*Lp^3.10, see F1';
data.Wwi = 0.21;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00692*Li^3.10, see F1';

data.Ni  = 243;   units.Ni  = '#/d'; label.Ni  = 'lifetime reproductive output'; bibkey.Ni  = 'DepcBellw2006';   
  temp.Ni = C2K(28.1);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% time-length
data.tL = [... %  time since birth (d), total length (cm)
28.265	0.870
29.003	0.723
30.353	0.889
32.149	1.042
33.634	0.942
33.644	1.136
34.089	1.102
35.290	1.269
35.431	1.122
36.322	1.055
36.623	1.108
37.815	1.095
38.855	1.028
39.313	1.261
39.916	1.395
41.091	1.048
41.094	1.115
41.998	1.314
42.137	1.108
43.495	1.441
43.933	1.261
44.085	1.314
44.689	1.467
45.587	1.547
46.921	1.400
47.523	1.534
48.110	1.334
48.876	1.767
49.019	1.640
49.618	1.693
49.895	1.280
50.806	1.620
51.688	1.373
51.844	1.500
52.446	1.626
52.594	1.600
52.752	1.793
53.180	1.393
53.923	1.366
54.969	1.406
54.983	1.693
56.168	1.539
56.761	1.479
56.773	1.726
56.920	1.679
57.212	1.572
58.111	1.666
58.402	1.526
58.407	1.612
58.713	1.786
59.305	1.692];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
metaData.links.id_CoL = '3DHNV'; % Cat of Life
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

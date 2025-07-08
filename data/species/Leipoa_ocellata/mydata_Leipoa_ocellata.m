function [data, auxData, metaData, txtData, weights] = mydata_Leipoa_ocellata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Megapodiidae';
metaData.species    = 'Leipoa_ocellata'; 
metaData.species_en = 'Malleefowl'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'dWwb'}; 
metaData.data_1     = {'t-JOe'; 't-EYe'; 't-EMe'; 't-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 62;          units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'VlecVlec1984';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ElliKirw2020: temperature 29-38 C';
data.tp = 8*30.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '14 monts is youngest age of sub-adult birds Bens2007';
data.tR = 3.5*365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 175;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'avibase';
data.Wwb = 114;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 1830;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 2040; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.dWwb = 2.75; units.dWwb = 'g/d';  label.dWwb = 'weight increase at birth'; bibkey.dWwb = 'PridWhee2001';
  temp.dWwb = C2K(40.4); units.temp.dWwb = 'K'; label.temp.dWwb = 'temperature';

data.Ri  = 18.6/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '18.6 eggs per clutch; 1 clutch per yr';
  
% uni-variate data
% time-embryo respiration
data.tJOe = [ ... % 60 - time before hatch (d), O2 consumption (cm^3/h)
 3.781	 0.297
 5.155	 0.065
 6.300	 0.053
 7.331	 0.390
 8.247	 0.272
 9.278	 0.379
10.194	 0.486
11.339	 0.816
12.256	 1.035
13.172	 0.918
14.432	 1.472
15.233	 1.243
16.149	 1.238
17.524	 1.791
18.440	 2.010
19.357	 2.117
20.503	 3.345
21.419	 3.340
22.566	 4.344
23.483	 5.236
24.515	 6.016
25.776	 6.906
26.694	 8.247
27.609	 8.018
28.528	 9.696
29.560	10.588
30.820	11.254
31.738	12.483
33.000	14.495
33.919	16.173
34.835	16.617
35.872	20.763
36.906	23.113
37.822	23.108
38.972	27.028
40.007	30.052
41.045	34.871
42.190	35.201
43.448	33.960
44.026	37.547
45.173	39.336
46.321	41.461
47.013	44.711
48.274	45.490
49.198	51.095
50.111	48.845
51.147	53.103
52.297	56.687
53.211	55.111
54.360	58.022
55.506	58.464
56.428	62.386
57.456	60.698
58.605	63.608
59.516	60.237
60.664	62.250];  
data.tJOe(:,1) = data.tJOe(:,1) + 2; % set hatch at 62 d, like in tEY and tEM data
units.tJOe   = {'d', 'cm^3/h'};  label.tJOe = {'time since birth', 'O_2 consumption'};  
temp.tJOe    = C2K(34);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'VlecVlec1984';

% time-yolk energy content
data.tEY = [ ... % time (d), yolk energy content (kJ)
 0.001	1415.838
 0.002	1517.756
 0.003	1559.087
 0.004	1586.627
26.033	1519.232
28.670	1387.461
34.128	1377.305
43.488	1263.115
54.457	 744.359
56.366	 452.749
59.746	 566.190
60.807	 230.384
61.778	 178.213
61.914	 150.696
63.032	 142.610
63.860	  73.894
65.953	  35.669];
units.tEY   = {'d', 'kJ'};  label.tEY = {'time since birth', 'energy content of yolk'};  
temp.tEY    = C2K(34);  units.temp.tEY = 'K'; label.temp.tEY = 'temperature';
bibkey.tEY = 'VlecVlec1984';

% time-embryo energy content
data.tEV = [ ... % time (d), embryo energy content (kJ)
10.928	  7.733
27.729	 10.377
29.549	  7.909
32.209	 11.082
37.811	 20.225
43.715	161.602
54.546	452.463
56.417	741.914
59.456	505.559
61.741	764.782
61.756	852.909
62.343	1007.218
62.997	742.949
63.583	891.751
65.242	770.841];
units.tEV   = {'d', 'kJ'};  label.tEV = {'time since birth', 'energy content of embryo'};  
temp.tEV    = C2K(34);  units.temp.tEV = 'K'; label.temp.tEV = 'temperature';
bibkey.tEV = 'VlecVlec1984';

% time-weight
data.tW = [ ...
    0  114
   20  146
   60  300
  100  450
  200  800
  500 1580];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ElliKirw2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tJOe = weights.tJOe * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assume to differ from females by {p_Am} only';
D2 = 'The yolk energy content in tEY data had to be multiplied by a factor 5 to match data'; 
D3 = 'mod_1: tp and tW data added; flegde at hatch'; 
metaData.discussion = struct('D1',D1, 'D2',D2 , 'D3',D3);

%% Facts
F1 = ['Male maintains leaf mound in which eggs hatch. Hatchlings loose mass just after hatching. ' ...
  'It takes them 40 h to reach the mound surface, 40 till 150 cm above, and rest for 21 h. ' ...
  'No parental care after hatching, so they are superprecocial'];
metaData.bibkey.F1 = 'PridWhee2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6P76F'; % Cat of Life
metaData.links.id_ITIS = '175702'; % ITIS
metaData.links.id_EoL = '45517731'; % Ency of Life
metaData.links.id_Wiki = 'Leipoa_ocellata'; % Wikipedia
metaData.links.id_ADW = 'Leipoa_ocellata'; % ADW
metaData.links.id_Taxo = '52881'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'BE7FA4651093E668'; % avibase
metaData.links.id_birdlife = 'malleefowl-leipoa-ocellata'; % birdlife
metaData.links.id_AnAge = 'Leipoa_ocellata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leipoa_ocellata}}';
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
bibkey = 'Boot1985'; type = 'phdthesis'; bib = [ ... 
'author = {David  Terrington }, ' ... 
'year = {1985}, ' ...
'title = {Ecological physiology of malleefowl (\emph{Leipoa ocellata}))}, ' ...
'school = {Monash University, Melbourne}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PridWhee2001'; type = 'Article'; bib = [ ...
'doi = {10.1071/MU9900081}, ' ...
'author = {David Priddel and Robert Wheel}, ' ... 
'year = {2001}, ' ...
'title = {Survival of Malleefowl \emph{Leipoa ocellata} Chicks in the Absence of Ground-dwelling Predators}, ' ...
'journal = {Emu}, ' ...
'volume = {90}, ' ...
'pages = {81-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VlecVlec1984'; type = 'Article'; bib = [ ...
'author = {David Vleck and Carol M. Vleck and Roger S. Seymour}, ' ... 
'year = {1984}, ' ...
'title = {Energetics of Embryonic Development in the Megapode Birds, Mallee Fowl \emph{Leipoa ocellata} and Brush Turkey \emph{Alectura lathami}}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {57(4)}, ' ...
'pages = {444-456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leipoa_ocellata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=BE7FA4651093E668&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElliKirw2020'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.mallee1.01}, ' ...
'author = {Elliott, A. and G. M. Kirwan}, ' ... 
'year = {2020}, ' ...
'howpublished = {Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}, ' ...
'title = {Malleefowl (\emph{Leipoa ocellata}), version 1.0. }' ]; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElliKirw2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.mallee1.01}, ' ...
'author = {Elliott, A. and G. M. Kirwan}, ' ...
'year = {2020}, ' ...
'title = {Malleefowl (\emph{Leipoa ocellata})}, ' ...
'howpublished = {version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bens2007'; type = 'Article'; bib = [ ... 
'author = {Benshemesh, J.}, ' ... 
'year = {2007}, ' ...
'title = {National Recovery Plan for Malleefowl}, ' ...
'institution = {Department for Environment and Heritage, South Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

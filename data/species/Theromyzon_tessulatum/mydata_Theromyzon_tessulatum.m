function [data, auxData, metaData, txtData, weights] = mydata_Theromyzon_tessulatum
%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Euhirundinea'; 
metaData.family     = 'Glossiphoniidae';
metaData.species    = 'Theromyzon_tessulatum'; 
metaData.species_en = 'Duck Leech'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biTvb'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Ab'; 'Ap'; 'Ai'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ae'; 't-A'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 01]; 

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 120;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Land1983';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 200;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Wwb = 3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Land1983';
data.Wwp = 0.25;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Land1983';
data.Wwi = 0.25;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Land1983';
  
data.Ni  = 200; units.Ni  = '#'; label.Ni  = 'maximum number of eggs';          bibkey.Ni  = 'Wiki';   
  temp.Ni = C2K(20);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-surface
data.tW = [ ... % age (d), surface (cm^2)
0.000	0.306
0.100	1.333
0.200	1.433
1.463	1.521
15.366	1.520
19.756	15.196
20.488	16.140
24.146	1.448
24.878	16.331
27.073	18.420
33.659	20.522
40.244	20.513
41.707	19.311
48.293	17.956
54.146	14.623
64.390	14.265
91.463	11.883
107.561	12.160
114.878	142.164
115.610	10.644
117.805	129.069
127.317	152.701
134.634	160.167
141.220	154.409
149.268	141.837
158.780	148.750
166.098	150.480
173.415	154.077
184.390	157.721
202.683	139.637
332.927	238.130];
units.tW   = {'d', 'mg'};  label.tW = {'age', 'weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Land1983';
comment.tW = 'the 3 feeding events are clearly visible';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Growth fit assumes constant feeding, rather than 3 feeding events';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Strictly haematophagous on birds; 3 feeding events are required to reach maturity';
metaData.bibkey.F1 = 'Land1983'; 
F2 = 'Urine excretion contributes substantialy to weight loss between meals';
metaData.bibkey.F2 = 'Land1983'; 
F3 = 'Broods its embryos on the ventral surface; does not feed as adult, but mother attaches to host for the first feeding of the young';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'parent dies 2 months after release of young';
metaData.bibkey.F4 = 'Land1983'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '646NB'; % Cat of Life
metaData.links.id_ITIS = '69378'; % ITIS
metaData.links.id_EoL = '401356'; % Ency of Life
metaData.links.id_Wiki = 'Theromyzon_tessulatum'; % Wikipedia
metaData.links.id_ADW = 'Theromyzon_tessulatum'; % ADW
metaData.links.id_Taxo = '15602'; % Taxonomicon
metaData.links.id_WoRMS = '1509279'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Theromyzon_tessulatum}}';
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
bibkey = 'Land1983'; type = 'Article'; bib = [ ... 
'author = {Lande, V. van der}, ' ... 
'year = {1983}, ' ...
'title = {Observations on the growth and development of the duck leech, \emph{Theromyzon tessulatum} ({H}irudinea: {G}lossiphoniidae), as a function of feeding}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {201}, ' ...
'pages = {377-393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

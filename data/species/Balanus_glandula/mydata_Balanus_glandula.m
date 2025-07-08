function [data, auxData, metaData, txtData, weights] = mydata_Balanus_glandula

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Sessilia'; 
metaData.family     = 'Balanidae';
metaData.species    = 'Balanus_glandula'; 
metaData.species_en = 'North American acorn barnacle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wdip'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 23];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';      label.am = 'life span';                        bibkey.am = 'Wiki';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.63e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'BarnBarn1956';
  comment.Wwb = 'based on egg diameter of 0.146 mm: pi/6*0.0146^3';
data.Wdp = 5.5e-3; units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';               bibkey.Wdp = 'WuLevi1978';
data.Wdi = 9.5e-3; units.Wdi = 'g';   label.Wdi = 'ultimate soma wet weight';            bibkey.Wdi = 'WuLevi1978';

data.Ri  = 12e3/ 365;    units.Ri  = '#/d';   label.Ri  = 'reprod rate at 15.6 mm basal diameter';   bibkey.Ri  = 'BarnBarn1956';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12e3 eggs/brood, assumed 1 brood/yr';

% uni-variate data

% time-weight
data.tW = [  ... % time since settlement (d), tissue dry weight (mg)
0.000	0.495
31.361	1.458
61.520	3.471
90.200	7.089
121.383	7.305
151.206	3.954
182.262	6.272
213.683	5.161
243.317	6.483
273.948	5.814
305.244	9.818
335.846	5.942];
units.tW   = {'d', 'mg'};  label.tW = {'time since settlement', 'tissue dry weight'};  
temp.tW    = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WuLevi1978';
 
%% set weights for all real data
weights = setweights(data, []);
weights.Wdi = weights.Wdi * 3;
weights.Wwb = weights.Wwb * 3;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL1','tL2','tL3','tL4'}; subtitle1 = {'Individual 1,2,3,4'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'kap_R is set at 0.95/2, since the species is hermaphroditic';
D2 = 'settlement is assumed to coincide with end of metam';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Hermaphroditic, 6 nauplius stages, 1 non-feeding cyprid stage';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life present at genus level only 2021/08/07
metaData.links.id_ITIS = '89609'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Balanus_glandula'; % Wikipedia
metaData.links.id_ADW = 'Balanus_glandula'; % ADW
metaData.links.id_Taxo = '273581'; % Taxonomicon
metaData.links.id_WoRMS = '394848'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Balanus_glandula}}';
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
bibkey = 'WuLevi1978'; type = 'Article'; bib = [ ... 
'author = {R.S.S. Wu and C.D. Levings}, ' ... 
'year = {1978}, ' ...
'title = {An Energy Budget for Individual Barnacles (\emph{Balanus glandula})}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {45}, ' ...
'pages = {225-235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarnBarn1956'; type = 'Article'; bib = [ ... 
'author = {H. Barnes and  M. Barnes}, ' ... 
'year = {1956}, ' ...
'title = {The General Biology of \emph{Balanus glandula} {D}arwin}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {10}, ' ...
'pages = {415--422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Rhinella_rubescens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Rhinella_rubescens'; 
metaData.species_en = 'Rusty Toad'; 

metaData.ecoCode.climate = {'Am','BSh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp','jiTi','jiTh','jiTg','jiFm'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp (mean temperature)
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 27];


%% set data
% zero-variate data

data.tp = 365;  units.tp = 'd';    label.tp = 'time since brith at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5 * 365; units.am = 'd';    label.am = 'life span';  bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Rhinella arenarum'; 

data.Lj  = 2.23;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'guess'; 
  comment.Lj = 'based on Rhinella arenarum: 11.67*2.5/13.1';
data.Lp  = 9.98;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Rhinella arenarum: 11.67*11.2/13.1';
data.Li  = 11.67;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'AranVasc2015';
data.Lim = 9.968;   units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';   bibkey.Lim  = 'AranVasc2015';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 177; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Rhinella arenarum and Li: 250*(11.67/13.1)^3';
data.Wwim = 110; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Rhinella arenarum and Lim: 250*(9.968/13.1)^3';

data.Ri  = 2.4e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rhinella arenarum: 34535*177/250 eggs per clutch';
 
% uni-variate data
% length-change in length
data.LdL_f = [ ... % SVL (cm), change in SVL (cm/d)
 4.19184	0.04286
11.56435	0.00510
11.76300	0.00890
12.28927	0.00957
12.68247	0.00595
12.83704	0.00909
13.27293	0.00234];
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f    = C2K(28);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'AranVasc2015';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (cm/d)
7.80518	0.03437
7.87822	0.05431
7.92434	0.00058
8.01478	0.00816
8.13521	0.03784
8.19308	0.01624
8.20921	0.00042
8.21120	0.00586
8.30044	0.01015
8.38203	0.05350
8.43008	0.00504
8.44242	0.03883
8.47361	0.00422
8.51619	0.00076
8.56851	0.02400
8.58278	0.00306
8.69267	0.00389
8.74356	0.02318
8.78101	0.00571
8.78462	0.01560
8.82304	0.00076
8.82340	0.00175
8.82364	0.00241
8.91155	0.00307
8.91300	0.00703
8.92335	0.03538
8.93371	0.00373
8.96033	0.01659
8.99910	0.00274
9.00693	0.02417
9.02476	0.01296
9.08617	0.00110
9.08654	0.00209
9.11146	0.01033
9.14603	0.04494
9.15337	0.00505
9.15590	0.01198
9.16469	0.03604
9.18059	0.01956
9.21214	0.04593
9.24008	0.00242
9.26302	0.00522
9.26609	0.01363
9.27073	0.02632
9.28313	0.00028
9.34329	0.04495
9.34967	0.00242
9.35112	0.00638
9.35268	0.01066
9.37111	0.00110
9.39832	0.01561
9.48130	0.00275
9.51321	0.03012
9.52453	0.00111
9.52538	0.00341
9.61245	0.00177
9.61269	0.00243
9.61335	0.00424
9.68374	0.01693
9.69958	0.00029
9.70132	0.00507
9.72174	0.00095
9.79098	0.01051
9.84204	0.03029
9.85354	0.00177
9.88504	0.02798
9.98457	0.00046
10.01106	0.01298
10.12451	0.02354
10.33580	0.00195
10.49760	0.02486];
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m    = C2K(28);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'AranVasc2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7PN'; % Cat of Life
metaData.links.id_ITIS = '773743'; % ITIS
metaData.links.id_EoL = '330244'; % Ency of Life
metaData.links.id_Wiki = 'Rhinella_rubescens'; % Wikipedia
metaData.links.id_ADW = 'Rhinella_rubescens'; % ADW
metaData.links.id_Taxo = '1395893'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rhinella+rubescens'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinella_rubescens}}';
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
bibkey = 'AranVasc2015'; type = 'Article'; bib = [ ... 
'author = {\''{I}sis da C. Arantes and Mariana M. Vasconcellos and Taissa C. V. Boas and La\''{i}s B. A. Veludo and Guarino R. Colli}, ' ... 
'year = {2015}, ' ...
'title = {Sexual Dimorphism, Growth, and Longevity of Two Toad Species ({A}nura, {B}ufonidae) in a Neotropical Savanna}, ' ...
'journal = {Copeia}, ' ...
'volume = {103(2)}, ' ...
'pages = {329–342'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rhinella+rubescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

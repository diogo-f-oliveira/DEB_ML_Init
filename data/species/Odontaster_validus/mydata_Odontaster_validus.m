function [data, auxData, metaData, txtData, weights] = mydata_Odontaster_validus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Valvatida'; 
metaData.family     = 'Odontasteridae';
metaData.species    = 'Odontaster_validus'; 
metaData.species_en = 'Antarctic sea star'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.5); % K, body temp
metaData.data_0     = {'ab', 'aj', 'am', 'Lb', 'Lj', 'Lp', 'Li', 'Wd0', 'Wwp', 'Wwi', 'GSI'}; 
metaData.data_1     = {'L-Ww_f', 'Ww-dWw', 'T-JO', 'L-WwR', 't-Ww', 't-L', 't-Wde'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Antonio Aguera'};    
metaData.date_subm = [2016 04 19];              
metaData.email    = {'aaguerag@ulb.ac.be'};            
metaData.address  = {'Universite Libre de Bruxelles, Belgium'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 04 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 04 27]; 

%% set data
% zero-variate data

data.ab = 33;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Bosc1989';   
  temp.ab = C2K(-1.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 132;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Bosc1989';   
  temp.tj = C2K(-1.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(-1.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
comment.am = 'Wild guess; large value based on low temperature';

data.Lb  = 0.042; units.Lb  = 'cm';  label.Lb  = 'chord length at birth';   bibkey.Lb  = 'Bosc1989';
data.Lj  = 0.14;  units.Lj  = 'cm';  label.Lj  = 'arm length at metam';   bibkey.Lj  = 'Bosc1989';
data.Lp  = 2;     units.Lp  = 'cm';  label.Lp  = 'arm length st puberty'; bibkey.Lp  = 'Pear1969';
data.Li  = 7;     units.Li  = 'cm';  label.Li  = 'ultimate arm length';   bibkey.Li  = 'PearMcCl1989';
comment.Li = 'Lp, Li, all the lengths in post metamorphic are arm length or radius=radio (yes, Spanish it happens sometimes) , and is the distance from the mouth to the tip of the arm (you normally measure three arms and get an average). It is the standard length measurement for sea stars. ';

data.Wd0 = 1.1;   units.Wd0 = 'mug'; label.Wd0 = 'egg dry weight';          bibkey.Wd0 = 'HoegWelb1991';
data.Wwp = 2.95;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Pear1969';
data.Wwi = 100;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PearMcCl1989';

data.GSI  = 0.1; units.GSI  = '-';  label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'PearMcCl1989';   
  temp.GSI = C2K(-1.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% length, wet weight
data.LW = [ ... arm length (cm), wet weight (g)
5.2	60 
5.3	55.9
5.5	54.6
5.8	51.8
5.3	49.9
5.2	47.6
5.4	45.3
5.2	45.2
5.1	44.7
5.3	43.6
5.3	43.5
4.8	43
5.2	42.6
5.6	42.2
5.3	41.8
5	40.5
5	40.5
5.1	40.4
4.8	39.1
4.6	33.6
4.8	33.3
4.3	31.7
4.9	30.9
4.3	30.5
4.7	25.4
4	23.1
3.8	21.4
3.9	17.6
3.4	14.2
3	13.9
3.2	12.7
3.2	12.1
3.4	11.9
3	11.5
3.2	11
3.2	10.9
3.2	10.9
3.2	9.6
2.9	9.6
2.9	9.5
3	8.4
3	8.2
2.7	8.2
2.6	6.9
2.4	6.3
2.6	6.1
2.3	5.6
2.6	5.4
2.2	5.3
2.3	5
2	3.1
1.9	2.9
1.8	2.9
1.6	2
1.6	1.7
1.4	1.1
1.2	0.9
1	0.5
];
units.LW = {'cm','g'}; label.LW = {'arm length', 'wet weight'}; 
temp.LW = C2K(-1.5); units.temp.LW = 'K'; label.temp.LW = 'temperature'; 
bibkey.LW ='PearMcCl1989'; comment.LW = 'total weight including gonad';
comment.LW = 'Laboratory maintained individuals at abundant food';

% length, weight
data.LW_f = [   % arm length (cm), wet weight (g)
5.4	44.5
5	50.1
5.3	50.1
5.4	35.2
5	39.6
4.9	42.2
5.2	31.4
4.7	41.1
5.2	36.1
4.9	30.2
5	33.7
4.9	37.9
4.9	32
4.8	32.4
4.8	34.9
4.9	34.5
4.5	30.9
5.2	29.1
4.9	30.3
4.6	31.4
4.4	34.8
4.6	31.6
4.8	30.6
5.4	31.7
4.8	30.9
4.7	33.1
4.4	32.7
4.7	32.3
4.6	27
4.8	36.5
4.6	30.7
4.6	34.6
4.7	29.6
4.6	28.8
4.2	26.3
4.3	30.8
4.1	26.5
4.7	27
4.7	24
4.1	26.1
3.4	14.1
3.6	15.6
3.6	10.6
3.1	12.9
3	9.8
3.1	12.1
3.2	10.1
2.8	7.5
3	8.8
3.1	9.3
3.1	9.1
2.8	5.4
3.1	8.7
2.7	8.5
2.6	6.9
2.4	4.2
2.3	4.7
2.2	3.6
6.1	48.7
5.3	46.9
5	41
5.1	40
5.6	37.1
5	37.1
5.1	37
5.4	36.3
4.8	35.5
5	35.3
5	35.2
5	34.5
5.1	34.2
4.8	34.2
4.7	32.6
4.8	31.9
4.9	31.6
4.7	31.5
4.6	31.1
5.1	30.2
4.6	29.5
5	29.3
4.6	28.9
5	28.8
4.7	28.8
4.8	28.7
4.6	28.4
4.7	27.7
4.6	27.2
4.6	27.1
4.8	26.6
4.2	26.6
4.7	26.5
4.6	26.4
4.8	25.9
4.4	25.7
4.2	25.4
4.7	25.3
4.8	24.8
4.8	22.6
4.5	22.4
4.2	15.2
3.6	13.5
3.8	13
3.6	11.8
3.4	10.8
3.1	10.5
3.2	9.1
3.1	8.9
3.1	8.8
3.1	8
3	7.8
3.1	7.7
2.8	6.9
2.7	6
2.3	6
2.7	5
2.6	4.2
2.3	3.4
1.7	1.7];
units.LW_f= {'cm','g'}; label.LW_f = {'arm length', 'wet weight'}; 
temp.LW_f = C2K(-1.5); units.temp.LW_f = 'K'; label.temp.LW_f = 'temperature'; 
bibkey.LW_f='McClPear1988'; comment.LW_f = 'weight with reproduction buffer at McMurdo in October';
comment.LW_f = 'weight with reproduction buffer at McMurdo in October';

% weight, change in weight
data.WwdWw = [ ... % wet weight (g), change in wet weight (%/d)
0.5	0.37184595
1.5	0.37184595
2.5	0.28685259
3.5	0.364257257
4.5	0.171326228
5.5	0.076211214
6.5	0.163519116
7.5	0.074517631
8.5	0.163790067
9.5	0.069335014
10.5	0.098659823
11.5	0.129306604
16.5	0.043549265
18.5	0.093866321
22.5	0.121756487
24.5	0.03421728
28.5	0.043071751
30.5	0.063806813
31.5	0.0380192
32.5	0.119760479
35.5	0.0877119
37.5	0.087292083
38.5	0.05132592
39.5	0.073069052
40.5	0.073926222
42.5	0.149700599
43.5	0.082593434
52.5	0.088394639
53.5	0.032458448 ];
units.WwdWw= {'g','1/d'}; label.WwdWw = {'wet weight', 'percent wet weight increase'}; 
temp.WwdWw = C2K(-1.5); units.temp.WwdWw = 'K'; label.temp.WwdWw = 'temperature'; 
bibkey.WwdWw='McClPear1988';
comment.WwdWw = 'abundant food'; 

% respiration in starving individuals
data.TJO = [   % tmeperature (K), dry mass specific dioxygen consumption (ug/h/g) 
271.5	49.70649529
271.5	56.30261686
271.5	53.94686038
271.5	57.71607508
271.5	59.60068017
273	66.19680174
273	68.0814043
273	57.71607508
273	61.01413587
273	66.66795868
276	74.20637901
276	82.68710818
276	76.56213851
276	72.79292331
276	91.1678424
276	89.28322975
276	76.09099165
279	98.70626273
279	102.004321
279	100.5908703
279	85.98517149
279	100.5908703
279	99.64857157
279	83.15826512
279	85.51401959
279	91.63898926
279	111.427354
282	108.1292957
282	122.7349996
282	115.6677211
282	116.6100249
282	132.6291744
282	119.4369413
282	122.2638426
285	137.3406934
285	151.4752504
285	141.5810655
285	125.5619009
285	141.5810655];
units.TJO= {'K','ug/h.g'}; label.TJO = {'Temperature', 'O_2 consumption'};
bibkey.TJO={'PeckWebb2008'};
comment.TJO = 'starving individuals'; 
comment.TJO = 'Average dry weight was 1.21 g';

% diameter, max gonad weight
data.LWR = [... % diameter(cm), max gonad weight (g)
6	6.2
6	4.9
6	5.4
5.5	4.6
6	7.1
4.5	1.8
3.5	0.7
6	5.9
6.5	5.9
6.5	4.8
5.5	3.8
5.5	2.9]; 
units.LWR = {'cm','g'}; label.LWR = {'diameter', 'max gonad weight'};
temp.LWR = C2K(-1.5); units.temp.LWR = 'K'; label.temp.LWR = 'temperature'; 
bibkey.LWR ='PearMcCl1989';
comment.LWR = 'accumulation during 2 years minus the spawned amount from the year before (80%), so 1.2 yr';

% pre-metamorphosis uni-variate data

% time, length (pre-metam)
data.tLj = [... time since birth (d), length (mm)
35	0.42
58	0.77
90	0.9
140	1.2
154	1.4]; 
units.tLj= {'d','mm'}; label.tLj = {'time since birth', 'length of bippinaria larvae'}; 
temp.tLj = C2K(-1.5); units.temp.tLj = 'K'; label.temp.tLj = 'temperature'; 
bibkey.tLj= 'Bosc1989';

% time, weight (pre-metam)
data.tWde = [ ... age (d), dry weight (mug)
0	1.232379275
1	1.24682095
4	0.98302485
5	1.1318586
6	1.09323598
7	1.14576215
9	1.015823872
14	1.115100767
15	1.0191214
19	1.092434639
27	1.113622863
33	1.007222448
44	0.891786954
51	0.768777553
57	0.942691718
64	0.949309635
71	0.77727735
78	0.90575375
85	0.773419704
92	0.89296417
99	0.756801585
105	0.79863145
112	0.83517125
120	0.685337133
127	0.631626885
136	0.704953483];
units.tWde= {'d','mug'}; label.tWde = {'age', 'dry weight'};
temp.tWde = C2K(-1); units.temp.tWde = 'K'; label.temp.tWde = 'temperature'; 
bibkey.tWde='HoegWelb1991';
comment.tWde = 'larvae were never fed';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW','LW_f'}; subtitle1 = {'Weight-length at different food levels'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'maximum GSI as reproduction buffer accumulated during 1.2 years, due to the fact 1-3';
D2 = 'T-JO: animals were starved for 4 weeks prior to the start of the temperature ramp, and were not fed during the experiment (3 more weeks). I think that even for these slow animals we can consider that assimilation is not happening.';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Oogenesis takes 18-24 months to complete';
metaData.bibkey.F1 = 'Pear1965';
F2 = 'Spawning occurs annually between May - August (winter)';
metaData.bibkey.F2 = 'Pear1965';
F3 = 'After spawning, remaining GSI is aprox. 20% of the maximum';
metaData.bibkey.F3 = 'Pear1965';
F4 = 'GSI cycle is not significantly different between males and females';
metaData.bibkey.F4 = 'Pear1965';
F5 = 'This entry is discussed in AgueColl2016';
metaData.bibkey.F5 = 'AgueColl2016';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '48NPG'; % Cat of Life
metaData.links.id_ITIS = '990161'; % ITIS
metaData.links.id_EoL = '45328515'; % Ency of Life
metaData.links.id_Wiki = 'Odontaster_validus'; % Wikipedia
metaData.links.id_ADW = 'Odontaster_validus'; % ADW
metaData.links.id_Taxo = '40845'; % Taxonomicon
metaData.links.id_WoRMS = '172775'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Odontaster_validus}}';
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
bibkey = 'Pear1965'; type = 'Incollection'; bib = [ ... 
'author = {Pearse, J. S.}, ' ... 
'year = {1965}, ' ...
'title = {Reproductive periodicities in several contrasting populations of \emph{Odontaster validus} {K}oehler, A common {A}ntarctic asteroid. }, ' ...
'booktitle = {Biology of the Antarctic Seas II}, ' ...
'editor = {A. L. George}, ' ...
'pages = {39--85}, ' ...
'publisher = {American Geophysical Union}, '...
'address = {Washington, D. C.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bosc1989'; type = 'PhDthesis'; bib = [ ... 
'author = {Bosch, I}, ' ... 
'year = {1989}, ' ...
'title = {Reproduction and development of shallow-water asteroids and an echinoid in {M}c{M}urdo {S}ound, {A}ntarctica}, ' ...
'school = {University of California Santa Cruz}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pear1969'; type = 'Article'; bib = [ ... 
'author = {Pearse, J. S.}, ' ... 
'year = {1969}, ' ...
'title = {Antarctic Sea Star}, ' ...
'journal = {Australian Natural History}, ' ...
'volume = {16}, ' ...
'pages = {234--238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PearMcCl1989'; type = 'Misc'; bib = [ ... 
'author = {Pearse, J. S. and McClintock, J. B. and Bosch, I.}, ' ... 
'year = {1989}, ' ...
'title = {Rearing experiment of \emph{Odontaster} at {M}c{M}urdo {S}tation, {A}ntarctica}, ' ...
'howpublished = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McClPear1988'; type = 'Article'; bib = [ ... 
'author = {McClintock, J. B. and Pearse, J. S. and Bosch, I.}, ' ... 
'year = {1988}, ' ...
'title = {Population structure and energetics of the shallow-water {A}ntarctic sea star \emph{Odontaster validus} in contrasting habitats}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {99}, ' ...
'pages = {235--246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoegWelb1991'; type = 'Article'; bib = [ ... 
'author = {Hoegh-Guldberg, O. and Welborn, J. R. and Manaham, D. T.}, ' ... 
'year = {1991}, ' ...
'title = {Metabolic requeriments of {A}ntarctic and temperature asteroid larvae}, ' ...
'journal = {Antarctic Journal of United States}, ' ...
'volume = {26}, ' ...
'pages = {163--165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PeckWebb2008'; type = 'Article'; bib = [ ... 
'author = {Peck, L. S. and Webb, K. E. and Miller, A. and Clark, M. S.}, ' ... 
'year = {2008}, ' ...
'title = {Temperature limits to activity, feeding and metabolism in the {A}ntarctic starfish \emph{Odontaster validus}}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {358}, ' ...
'pages = {181--189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AgueColl2016'; type = 'Article'; bib = [ ... 
'author = {Aguera, A. and M. Collard and Q. Jossart and C. Moreau and B. Danis}, ' ... 
'year = {2016}, ' ...
'title = {Parameter Estimations of {D}ynamic {E}nergy {B}udget ({D}{E}{B}) Model over the Life History of a Key {A}ntarctic Species: {T}he {A}ntarctic Sea Star \emph{Odontaster validus} {K}oehler, 1906}, ' ...
'journal = {PlosOne}, ' ...
'volume = {10}, ' ...
'pages = {e0140078}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 

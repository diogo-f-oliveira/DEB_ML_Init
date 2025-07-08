function [data, auxData, metaData, txtData, weights] = mydata_Culex_pipiens
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Diptera'; 
metaData.family     = 'Culicidae';
metaData.species    = 'Culex_pipiens'; 
metaData.species_en = 'Common house mosquito'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0eFm', 'eiTf', 'eiTi'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjD', 'bjCi', 'eiTv'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'aj'; 'Wdj'; 'Wwj'; 'Ni'}; 
metaData.data_1     = {'t-Ww_f'; 'T-ab'; 'T-aj'; 'T-ae';'T-am'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Annika Mangold-Doering'};    
metaData.date_subm = [2022 03 04];              
metaData.email    = {'annika.mangold-doering@wur.nl'};            
metaData.address  = {'Wageningen University'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2022 03 16]; 

%% set data
% zero-variate data

data.tj = 14;     units.tj = 'd';     label.tj = 'time since birth at pupation'; bibkey.tj = 'Jour2016';   
  temp.tj = C2K(21);  units.temp.tj = 'K'; label.temp.tj = 'temperature';

data.Wdj = 0.88e-3;  units.Wdj = 'g'; label.Wdj = 'dry weight of pupa';      bibkey.Wdj = 'Jour2016';
data.Wwj = 3.085e-3;  units.Wwj = 'g'; label.Wwj = 'wet weight of pupa';      bibkey.Wwj = 'Chen1958';

data.Ni  = 80; units.Ni  = '#';  label.Ni  = 'total number of eggs';   bibkey.Ni  = 'Kres2014';   
  temp.Ni = C2K(20); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '31-124 eggs for autonomous females (no blood meal)';
  
% uni-variate data

% time - wet weights of larva  
data.tW =  [ ... % time since birth (d), wet weight (mg)
 6.32	0.22 
 8.27	1.05
10.31	2.73
12.33	3.97
13.99	4.62];
data.tW(:,2) = data.tW(:,2)/ 1000; % convert mg to g
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(22.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Chen1958';
%
data.tW1 =  [ ... % time since birth (d), wet weight (mg)
 5	0.118
 6	0.371
 7	0.633
 8	1.178
 9	1.653
11	3.474];
data.tW1(:,2) = data.tW1(:,2)/ 1000; % convert mg to g
units.tW1  = {'d', 'g'}; label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1   = C2K(22.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Chen1958';
%
data.tW2 =  [ ... % time since birth (d), wet weight (mg)
 6.5	0.305
 7.5	0.848
 9.5	1.95
11.5	3.9];
data.tW2(:,2) = data.tW2(:,2)/ 1000; % convert mg to g
units.tW2  = {'d', 'g'}; label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2   = C2K(22.5);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Chen1958';

% temperature - age at hatch
data.Tab = [ ... temperature (C), age at birth (h)
    22.6  48
    22.3  48
    20.5  48
    19.8  48
    17.0  72
    17.0  72
    16.0  72
    15.4  72
    14.0  73
    11.7 120];
data.Tab(:,2) = data.Tab(:,2)/ 24; % convert h to d
units.Tab  = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Jobl1938';
comment.Tab = 'Data for C. p. pipiens';

% temperature - age at emergence
data.Tae = [ ... temperature (C), age at emergence (d)
    27.8 17
    23   12.5
    20.4 19.5
    20   24
    19.2 18.5
    16.1 41.5
    14.4 41.5];
units.Tae  = {'C', 'd'}; label.Tae = {'temperature', 'age at emergence', 'Jobl1938'};  
bibkey.Tae = 'Jobl1938';
subtitle.Tae = 'age at emergence';
%
data.Tae_S = [ ... temperature (C), age at emergence (d)
    32.5 10.9
    30   14.2
    27.5 15.3
    25   17
    22.5 23.1
    20   34
    17.5 40.1
    15   49.2];
units.Tae_S  = {'C', 'd'}; label.Tae_S = {'temperature', 'age at emergence', 'Span2019'};  
bibkey.Tae_S = 'Span2019';
subtitle.Tae_S = 'age at emergence';

% temperature - time since birth at emergence
data.Tte = [ ... temperature (C), time since birth at emergence
    16 20.55
    20 13.13
    24  9.95
    27  8.92
    31  8.27
    %
    15 21.37
    19 14.14
    23 10.99
    26 10.67
    30  9.50
    %
    14 21.38
    19 13.63
    22 10.20
    25  8.88
    29  8.30
    %
    13 22.35
    17 14.34
    21 10.65
    24  9.76
    27  9.50];
units.Tte  = {'C', 'd'}; label.Tte = {'temperature', 'time since birth at emergence'};  
bibkey.Tte = 'Ruyb2016';

% temperature - age at instar 1 2 3 4 pupation emergence
data.Ta = [ ... temperature (C), age at instar 1 2 3 4 pupation, emergence (d)
    15   4.1 17.3 24.8 32.6 42.8 49.2
    17.5 3.1 14.9 21.2 27.4 35.7 40.1
    20   2.9 14.4 19.6 23.6 30.3 34
    22.5 2.0  8.4 12.5 16.5 20.4 23.1
    25   2.0  5.7  8.7 11.3 14.9 17
    27.5 1.5  4.8  7.8  9.8 13.8 15.3
    30   1.3  3.7  7.5  9.2 12.6 14.2
    32.5 0.9  6.5  5.4  7.1  9.7 10.9];
units.Ta  = {'C', 'd'}; label.Ta = {'temperature', 'age at stage'};
treat.Ta = {1, {'i1', 'i2', 'i3', 'i4', 'tj', 'te'}}; units.treat.Ta = 'd'; label.treat.Ta = 'stage';
bibkey.Ta = 'Span2019';
subtitle.Ta = 'age at instar 1, 2, 3, 4, pupation, emergence';


% temperature - life span as imago for females, males 
data.Tam = [ ... temperature (C), time since birth at emergence (d)
    15   73.9 65.5
    17.5 66.5 57.0
    20   57.7 30.3
    22.5 32.5 27.5
    25   22.5 18.3
    27.5 20.5 17.6
    30   19.5 12.2
    32.5  0.5  0.5];
units.Tam  = {'C', 'd'}; label.Tam = {'temperature', 'life span as imago'};
treat.Tam = {1, {'f', 'm'}}; units.treat.Tam = 'd'; label.treat.Tam = 'gender';
bibkey.Tam = 'Span2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.tW1 = 10 * weights.tW1;
weights.tW2 = 10 * weights.tW2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Data for data sets'};
set2 = {'Tae','Tae_S'}; subtitle2 = {'Data from Jobl1938, Span2019'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = ['Reproduction data concern autonomous females (no blood meal). ' ...
    'anautonomous females (i.e. with blood meal) produce 150-300 eggs per raft and several rafts'];
metaData.bibkey.D1 = 'Harb1984'; 
metaData.discussion = struct('D1',D1);

%% Facts
F1 = ['Males usually emerge 1-2 days before the females in order to achieve sexual maturity at the same time as the emerging females (which are mature at emergence).' ...
    'Since the pupal stage of the two sexes appears to be about the same length, the shortening in development of males takes place primarily in the larval stage.'...
    'Consequently, the male pupae and adults of a population are smaller in size than the corresponding females.'];
metaData.bibkey.F1 = 'Beck2010'; 
F2 = ['Larval food consists of a range of non-living and living resources as organic detritus, bacteria, unicellular algae, different protozoa, '...
    'micro-metazoa and small filamentous algae'];
metaData.bibkey.F2 = {'Lair1988','Diaz2016'}; 
F3 = ['Food as imago: Beck2010 -  Both sexes of mosquitoes require plant juices as an energy source, mostly for flight. '...
    'Plant sugars such as floral nectar, damaged fruits and honeydew are the main energy source during the adult life of both sexes.' ... 
    'the female mouthparts are developed to pierce the skin of the host to obtain blood for egg maturation; '...
    'Habr1984 - Females fed aggressively on the arm of a human following deposition of autogenous rafts'];
metaData.bibkey.F3 = {'Beck2010','Harb1984'}; 
F4 = ['Reproduction: TwohRoze1957 - Females produce at least one egg-raft after emergence, for which they do not obligatory require a blood meal. ' ...
    'Harb1984 - most rafts laid three days after female emergence but some up to two weeks after emergence'];
metaData.bibkey.F4 = {'TwohRoze1957','Harb1984'}; 
F5 = '4 larval instars';
metaData.bibkey.F5 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5);

%% Links
metaData.links.id_CoL = '32BNW'; % Cat of Life
metaData.links.id_ITIS = '126488'; % ITIS
metaData.links.id_EoL = '740671'; % Ency of Life
metaData.links.id_Wiki = 'Culex_pipiens'; % Wikipedia
metaData.links.id_ADW = 'Culex_pipiens'; % ADW
metaData.links.id_Taxo = '28509'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_diptera = 'Culex+pipiens'; % Diptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Culex_pipiens}}';
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
bibkey = 'Mpho2002'; type = 'Article'; bib = [ ...  
'author = {Mpho, M. and Callaghan, A. and Holloway, G.J.}, ' ...
'year = {2002}, ' ...
'title  = {Temperature and genotypic effects on life history and fluctuating asymmetry in a field strain of \emph{Culex pipiens}}, ' ...
'journal = {Heredity}, ' ...
'volume = {88}, ' ...
'pages = {307-312}, ' ...
'doi = {10.1038/sj.hdy.6800045}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BekeLies2007'; type = 'Article'; bib = [ ...  
'author = {Beketov, M. A. and Liess, M.}, ' ...
'year = {2007}, ' ...
'title  = {Predation risk perception and food scarcity induce alterations of life-cycle traits of the mosquito \emph{Culex pipiens}}, ' ...
'journal = {Ecological Entomology}, ' ...
'volume = {32}, ' ...
'pages = {405-410}, ' ...
'doi = {10.1111/j.1365-2311.2007.00889.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TwohRoze1957'; type = 'Article'; bib = [ ...  
'author = {Twohy, D. W. and Rozeboom, L. E.}, ' ...
'year = {1957}, ' ...
'title  = {A Comparison of Food Reserves in Autogenous and Anautogenous \emph{Culex pipiens} Populations}, ' ...
'journal = {Am. J. Hyg.}, ' ...
'volume = {65}, ' ...
'pages = {316-324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ruyb2016'; type = 'Article'; bib = [ ...  
'author = {Ruybal, J. E. and Kramer, L. D. and Kilpatrick, A. M.}, ' ...
'year = {2016}, ' ...
'title  = {Geographic variation in the response of \emph{Culex pipiens} life history traits to temperature}, ' ...
'journal = {Parasites and Vectors}, ' ...
'volume = {65}, ' ...
'pages = {316-324}, ' ...
'doi = {10.1186/s13071-016-1402-z}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kres2014'; type = 'Article'; bib = [ ...  
'author = {Kress, A. and  Kuch, U. and Oehlmann, J. and Mueller, R.}, ' ...
'year = {2014}, ' ...
'title  = {Impact of temperature and nutrition on the toxicity of the insecticide λ-cyhalothrin in full-lifecycle tests with the target mosquito species \emph{Aedes albopictus} and \emph{Culex pipiens}}, ' ...
'journal = {Journal of Pest Science}, ' ...
'volume = {87}, ' ...
'pages = {739-750}, ' ...
'doi = {10.1007/s10340-014-0620-4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mutu2010'; type = 'Article'; bib = [ ...  
'author = {Muturi, E. J. and Costanzo, K. and Kesavaraju, B. and Lampman, R. and Alto, B. W.}, ' ...
'year = {2010}, ' ...
'title  = {Interaction of a pesticide and larval competition on life history traits of \emph{Culex pipiens}}, ' ...
'journal = {Acta Tropica}, ' ...
'volume = {116}, ' ...
'pages = {141-146}, ' ...
'doi = {10.1016/j.actatropica.2010.07.003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jour2016'; type = 'Article'; bib = [ ...  
'author = {Jourdan, J. and Baier, J. and Riesch, R. and Klimpel, S. and Streit, B. and Mueller, R. and Plath, M.}, ' ...
'year = {2016}, ' ...
'title  = {Adaptive growth reduction in response to fish kairomones allows mosquito larvae (\emph{Culex pipiens}) to reduce predation risk}, ' ...
'journal = {Aquatic Sciences}, ' ...
'volume = {78}, ' ...
'pages = {303-314}, ' ...
'doi = {10.1007/s00027-015-0432-5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chen1958'; type = 'Article'; bib = [ ...  
'author = {Chen, P. S.}, ' ...
'year = {1958}, ' ...
'title  = {Studies on the protein metabolism of \emph{Culex pipiens} {L}. - {I}: Metabolic changes of free amino acids during larval and pupal development}, ' ...
'journal = {Journal of Insect Physiology}, ' ...
'volume = {2}, ' ...
'pages = {38-51}, ' ...
'doi = {10.1016/0022-1910(58)90026-X}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harb1984'; type = 'Article'; bib = [ ...  
'author = {Harbach, R. E. and Harrison, B. A. and Gad A. M.}, ' ...
'year = {1984}, ' ...
'title  = {\emph{Culex (Culex) Molestus} {F}orsk\o{a}l ({D}iptera: {C}ulicidae): neotype designation, description, variation, and taxonomic status}, ' ...
'journal = {Proceedings of the Entomological Society of Washington}, ' ...
'volume = {86}, ' ...
'pages = {521-542}, ' ...
'doi = {10.1016/j.actatropica.2010.07.003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beck2010'; type = 'book'; bib = [ ...  
'author = {Becker, N. and Petric, D. and Zgomba, M. and Boase, C. and ·Dahl, C. and Madon, M. and· Kaiser, A..}, ' ...
'year = {2010}, ' ...
'title  = {Mosquitoes and Their Control}, ' ...
'publisher = {Springer}, ' ...
'address = {Heidelberg Dordrecht London New York}, ' ...
'doi = {10.1007/978-3-540-92874-4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jobl1938'; type = 'Article'; bib = [ ...  
'author = {Jobling, B.}, ' ...
'year = {1938}, ' ...
'title  = {On Two Subspecies of \emph{Culex pipiens} {L} ({D}iptera)}, ' ...
'journal = {Transactions of the Royal Entomological Society of London}, ' ...
'volume = {87}, ' ...
'pages = {193-216}, ' ...
'doi = {10.1111/j.1365-2311.1938.tb00094.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kass2012'; type = 'Article'; bib = [ ...  
'author = {Kassim, N. A. C. and Webb, C. E. and Russell, R. C.}, ' ...
'year = {2012}, ' ...
'title  = {\emph{Culex molestus} {F}orsk\o{a}al ({D}iptera: {C}ulicidae) in {A}ustralia: colonisation, stenogamy, autogeny, oviposition and larval development}, ' ...
'journal = {Australian Journal of Entomology}, ' ...
'volume = {51}, ' ...
'pages = {67-77}, ' ...
'doi = {10.1111/j.1440-6055.2011.00834.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Span2019'; type = 'Article'; bib = [ ...  
'author = {Spanoudis, C. G. and Andreadis, S. S. and Tsaknis, N. K. and Petrou, A. P. and Gkeka, C. D. and Savopoulou–Soultani, M.}, ' ...
'year = {2019}, ' ...
'title  = {Effect of Temperature on Biological Parameters of the {W}est {N}ile Virus Vector \emph{Culex pipiens} form ‘molestus’ ({D}iptera: {C}ulicidae) in {G}reece: {C}onstant vs Fluctuating Temperatures}, ' ...
'journal = {Journal of Medical Entomology}, ' ...
'volume = {56}, ' ...
'pages = {641-650}, ' ...
'doi = {10.1093/jme/tjy224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lair1988'; type = 'book'; bib = [ ...  
'author = {Laird, M.}, ' ...
'year = {1988}, ' ...
'title  = {The natural history of larval mosquito habitats}, ' ...
'publisher = {Academic Press}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Diaz2016'; type = 'Article'; bib = [ ...  
'author = {D\''{i}az-Nieto, L. M. and D''Alessio, C. and Perotti, M. A. and Ber\''{o}n, C. M.}, ' ...
'year = {2016}, ' ...
'title  = {\emph{Culex pipiens} Development Is Greatly Influenced by Native Bacteria and Exogenous Yeast}, ' ...
'journal = {PLOS ONE}, ' ...
'volume = {11}, ' ...
'doi = {10.1371/journal.pone.0153133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


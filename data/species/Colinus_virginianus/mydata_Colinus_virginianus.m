function [data, auxData, metaData, txtData, weights] = mydata_Colinus_virginianus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Odontophoridae';
metaData.species    = 'Colinus_virginianus'; 
metaData.species_en = 'Bobwhite quail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.9); % K, body temp SwanWain1997
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Ww_t'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Le'; 't-N'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'; 'Andre Gergs'; 'Kim Rakel'};    
metaData.date_subm = [2017 08 09];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_1   = {'Starrlight Augustine'; 'Dina Lika'; 'Nina Marn'};    
metaData.date_mod_1 = [2020 07 25];              
metaData.email_mod_1    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 31];              
metaData.email_mod_2    = {'starrlight@tecnico.ulisboa.pt'};            
metaData.address_mod_2  = {'University of Lisbon, Portugal'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2023 07 31]; 

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HernPete2007';   
  temp.ab = C2K(37.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'page 6, in text, corresponds to hatch - temperature is unknown, but the temperature for incubating eggs was found on the Noah website.';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BrenHern2020';
  temp.tx = C2K(38.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'assumed to occer when the young no longer need breeding';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = {'SchoAbbo1974', 'Bayer'};
  temp.tp = C2K(38.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'age at which preparation period is initiated- reproduction starts 4 weeks after';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature'; comment.tR = 'might be breeding after a year'; 
data.am = 6.4 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Zamm1986';   
  temp.am = C2K(38.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'page 2742, Table 3';
 
data.Li  = 26;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Shan1994';
  comment.Li = 'page 11, in text';

data.Wwb = 6.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NewsBeac2008';
  comment.Wwb = 'NewsBeac2008 page 541, Table 1 says 6 g - Bayer study shows chick weight at hatch to be variable between 5 and 9 g with mean 6.5.';
data.Wwx = 182.9;   units.Wwx = 'g';   label.Wwx = 'wet weight at fledging';     bibkey.Wwx = 'RobeLind1966';
  comment.Wwx = 'page 134, Table 2, Mean weight of juveniles, which were seperated from adults via plumage.';
data.Wwp = 194.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at first reproduction';   bibkey.Wwp = 'RobeLind1966';
data.Ww14 = 33;   units.Ww14 = 'g';   label.Ww14 = 'wet weight at 14d since birth';     bibkey.Ww14 = 'Bayer';
data.Wwi = 200;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Bayer';

% uni-variate data
data.tWw0 = [... time since birth (d), wet weight (g)
119	  189.7059
133	  193.4118
147	  194.1176
161	  197.7647
175	  201.5882
273	  239.1176];
units.tWw0  = {'d', 'g'};  label.tWw0 = {'time since birth', 'wet weight'};  
temp.tWw0   = C2K(38.9);  units.temp.tWw0 = 'K'; label.temp.tWw0 = 'temperature';
bibkey.tWw0  = 'Bayer'; comment.tWw0 = 'mean data from all cages, for females only. Analysis shows no difference between males and females.';
auxData.treat.tWw0 = {0};

ingestion.tWw0 = [...
119	   17.6933
126	   16.5462
133	   17.4412
140	   16.1134
147	   15.5336
154	   16.8235
161	   16.8193
168	   15.4790
175	   16.3824
182	   16.5588
189	   17.1387
196	   17.9580
203	   18.5168
210	   19.9664
217	   21.3950
224	   22.5336
231	   23.0000
238	   23.4328
245	   22.8739
252	   22.8866
259	   23.2101
266	   24.0462
273	   22.9034];
units.ingestion.tWw0  = {'d', 'g Wet wt/d'};  label.ingestion.tWw0 = {'time since birth', 'ingestion'};  

data.tN0 = [ ...
203     0
210     4.0556
217	    3.6667
224	    4.8333
231	    5.4444
238	    4.9444
245	    5.9444
252	    5.2778
259	    4.6111
266	    4.6111
273	    4.2778];
data.tN0(:,2) = cumsum(data.tN0(:,2));
units.tN0  = {'d', '#'};  label.tN0 = {'time since birth', 'cumulated number of eggs'};  
temp.tN0   = C2K(38.9);  units.temp.tN0 = 'K'; label.temp.tN0 = 'temperature';
bibkey.tN0  = 'Bayer';
ingestion.tN0 = ingestion.tWw0;
units.ingestion.tN0 = units.ingestion.tWw0;
label.ingestion.tN0 = label.ingestion.tWw0;
auxData.treat.tN0 = {0};

% uni-variate data
% time - weight
data.tW = [ ... % time since birth (weeks), wet weight (g)
0.00	7.98
0.78	14.36
1.89	26.60
2.94	40.43
3.92	65.96
4.91	89.89
5.89	121.80
7.00	125.50
8.02	136.20
8.86	147.30
9.98	159.00
10.96	162.20
12.25	169.70
13.23	175.00
14.14	175.50
14.95	176.60
15.97	177.70];
data.tW(:,1)= data.tW(:,1) * 7; % convert weeks to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'JoneHugh1978';
comment.tW = 'page1472, Figure 1, x-axis in the original article might be wrong labeled, the text in the article suggests it to be time in weeks';
% 
data.tW2 = [ ... % time since birth (weeks), wet weight (g)
0.04	9.06
0.59	12.79
0.95	18.65
1.46	31.45
1.90	37.31
2.37	47.44
3.84	70.89
4.95	92.21
10.05	148.70];
data.tW2(:,1)= data.tW2(:,1) * 7; % convert weeks to d
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(38.9);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Lyon1962';
comment.tW2 = 'page 8, Figure 1';
% time - weight
data.tW3 = [ ... % time (day), wet weight (g)
0.00	19.55
5.00	31.36
8.00	41.82
15.00	67.27
22.00	95.45];
data.tW3(:,1)= 10 + data.tW3(:,1); % convert weeks to time to day since hatch/birth
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(38.9);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'NewsBeac2008';
comment.tW3 = 'page 540, Figure 3';

% time - embryo length
data.tLe = [ ... %time [days]	length [mm]
3	4
4	7
5	8
8	10
9	13
10	15];
units.tLe   = {'d', 'mm'};  label.tLe = {'age', 'embryo length'};  
temp.tLe    = C2K(37.8);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe  = 'Hans1954';
comment.tLe = 'page 271-272 in text';
comment.tLe = 'incubation temperature of eggs found on Noah';

% time - weight for embryo
data.aWe   = [ ... % age (d), embryo wet weight without the yolk (g)
7.972	0.216  %days , grams
10.946	0.648
14.059	1.312
16.236	2.085
18.180	3.103
21.199	4.241];
units.aWe  = {'d', 'g'};  label.aWe = {'age', 'embryo wet weight', 'SchoAbbo1979'};  
temp.aWe   = C2K(37.8);  units.temp.aWe = 'K'; label.temp.aWe = 'temperature';
bibkey.aWe = 'SchoAbbo1979';
comment.aWe = 'incubation temperature of eggs found on Noah';

%FlorRoja2018 , embryo wet weight (Yolk and extra-embryonic membranes were removed from the embryo, excess water, around the body was blotted and body mass (BM) was measured to 0.01 g with an electronic balance)
%  incubated in air at a temperature of 37.5 pm 0.1 C and a relative humidity (RH) of ~50% 
% check points: 1.20 pm 0.02 g on d12 to 4.76 pm 0.08 g on d20 and to 5.36 pm 0.11 g in IP embryos. A further increase in BM occurred in 1 dph hatchlings, 6.74 pm 0.12 g 
data.aWe2 = [ ... % time (d), weight (g)
12.00 1.21
13.02 1.37
14.01 1.87
15.01 2.29
16.01 2.96
17.01 3.50
18.01 3.98
19.02 4.48
20.01 4.78
21.01 5.37
22.01 6.75];
units.aWe2  = {'d', 'g'};  label.aWe2 = {'age', 'embryo wet weight', 'FlorRoja2018'};  
temp.aWe2   = C2K(37.5);  units.temp.aWe2 = 'K'; label.temp.aWe2 = 'temperature';
bibkey.aWe2 = 'FlorRoja2018';
comment.aWe2 = 'embryo wet weight (Yolk and extra-embryonic membranes were removed from the embryo, excess water, around the body was blotted and body mass (BM) was measured to 0.01 g with an electronic balance)';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.ingestion = ingestion; % addition auxData to specify ingestion in the Bayer experiment
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'aWe','aWe2'}; subtitle1 = {'embryo data, SchoAbbo1979, FlorRoja2018'};
% set2 = {'tW','tW2', 'tW3','tWw0'}; subtitle2 = {'growth JoneHugh1978, Lyon 1972, NewBeac2008, Bayer'};
metaData.grp.sets = {set1}; %, set2};
metaData.grp.subtitle = {subtitle1}; %, subtitle2};
% 
%% Discussion points
D1 = 'The entries assumes all data are performed in the thermoneutral zone. Data from SwanWein1997 which are outside of the thermoneutral zone are not included.';
D2 = 'mod_1: early juveniles are assumed to have a higher scaled func response than the reference value of 1.';     
D3 = 'mod_1: added the bayer data set - assumptions reprod buffer has no water. to simplify computations we use constant E0 computed at f=1, and also do not subtract the weight of the egg released from the computation of the total weight.';
D4 = 'mod_1: modified age at puberty, removed egg weight and kept weight at birth. Removed tN by GentSurl2005 as the age at start and feeding history from that experiment was not known.';
D5 = 'mod_1: removed data on time and size at first reproduction, replaced with with time and size at puberty. This is known for quail, contrary to most birds.';
D6 = 'mod_1: changed Wwi which used to be 250g and set it to 200. The general idea is that adults eat more when laying eggs. ';
D7 = 'mod_1: zero weight is put to aWe by SchoAbbo1979. ';
D8 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5, 'D6', D6, 'D7', D7, 'D8', D8);

%% Facts
F1 = 'There are many natural strains of bobwhite; few domesticated strains have been intentionally developed';
metaData.bibkey.F1 = 'oecd2006'; 
F2 = 'The bobwhite is distributed from southeastern Ontario (Canada) to Guatemala and in Cuba but reaches its highest density in the eastern United States and Mexico';
metaData.bibkey.F2 = 'oecd2006';
F3 = 'Body size also increases from south to north in its native range with birds in Chiapas, Mexico, averaging 129 g, whereas those in the eastern United States weigh about 172 g.';
metaData.bibkey.F3 = 'oecd2006';
F4 = 'Bobwhite nest in the spring with clutch sizes of 10 to 15 eggs.';
metaData.bibkey.F4 = 'oecd2006';
F5 = 'Body temperature of 38.9 in summer and 37.7 in winter - we use the summer temperature in this entry';
metaData.bibkey.F5 = 'SwanWein1997';
F6 = 'mod_1: ovary + oviduct is 3.8% of total weight (at the end of photostimulation)';
metaData.bibkey.F6 = 'CainLien1985';
metaData.facts = struct('F1',F1, 'F2', F2, 'F3', F3, 'F4', F4, 'F5', F5, 'F6', F6);

%% Links
metaData.links.id_CoL = 'X2KZ'; % Cat of Life
metaData.links.id_ITIS = '175863'; % ITIS
metaData.links.id_EoL = '45508974'; % Ency of Life
metaData.links.id_Wiki = 'Colinus_virginianus'; % Wikipedia
metaData.links.id_ADW = 'Colinus_virginianus'; % ADW
metaData.links.id_Taxo = '52989'; % Taxonomicon
metaData.links.id_WoRMS = '1484383'; % WoRMS
metaData.links.id_avibase = '91CCBC719C97AE19'; % avibase
metaData.links.id_birdlife = 'northern-bobwhite-colinus-virginianus'; % birdlife
metaData.links.id_AnAge = 'Colinus_virginianus'; % AnAge


%% References
bibkey = 'Bayer'; type = 'Misc'; bib = ...
'howpublished = {Control data from Bayer Crop Science report M-299245-02-1 - contact bayer for accesing the report via their website}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Northern_bobwhite}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Colinus_virginianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Noah'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.noahsnet.com/guide-to-incubating-quail-eggs/}}';
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
bibkey = 'HernPete2007'; type = 'incollection'; bib = [ ... 
'author = {F. Hernandez and M. J. Peterson}, ' ... 
'year = {2007}, ' ...
'title = {Northern Bobwhite Ecology and Life History}, '...
'Booktitle = {Texas Quails Book}, ' ...
'editor = {L. A. Brennan}, ' ...
'publisher = {Texas A \& M University Press}, '...
'pages = {40--64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'oecd2006'; type = 'techreport'; bib = [ ... 
'institution = {OECD Environment, Health and Safety Publications Series on Testing and Assessment}, ' ... 
'year = {2006}, ' ...
'author = {OECD}, '...
'title = {DETAILED REVIEW PAPER FOR AVIAN TWO-GENERATION TOXICITY TEST}']; % ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shan1994'; type = 'Book'; bib = [ ... 
'author = {Shanaway, Page}, ' ... 
'year = {1994}, ' ...
'title = {Quail production systems: a review}, ' ...
'publisher = {FAO (January 30, 1994)}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GentSurl2005'; type = 'Article'; bib = [ ... 
'author = {A. Gentles and J. Surles and E. E. Smith}, ' ... 
'year = {2005}, ' ...
'title = {EVALUATION OF ADULT QUAIL AND EGG PRODUCTION FOLLOWING EXPOSURE TO PERCHLORATE-TREATED WATER}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {24}, ' ...
'number = {8}, '...
'pages = {1930--1934}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NewsBeac2008'; type = 'Article'; bib = [ ... 
'author = {J. L. Newsted and Susan A. Beach and S. P. Gallagher and J. P. Giesy}, ' ... 
'year = {2008}, ' ...
'title = {Acute and Chronic Effects of Perfluorobutane Sulfonate ({P}{F}{B}{S}) on the Mallard and Northern Bobwhite Quail}, ' ...
'journal = {Arch Environ Contam Toxicol}, ' ...
'volume = {54}, ' ...
'doi = {10.1007/s00244-007-9039-8}, '...
'pages = {535--545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobeLind1966'; type = 'Article'; bib = [ ... 
'author = {R. J. Robel and S. A. Linderman}, ' ... 
'year = {1966}, ' ...
'title = {Weight Dynamics of Unconfined Bobwhite Quail in {K}ansas}, ' ...
'journal = {Transactions of the Kansas Academy of Science}, ' ...
'volume = {69}, ' ...
'number = {2}, '...
'pages = {132--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NelsMart1953'; type = 'Article'; bib = [ ... 
'author = {A. L. Nelson and A. C. Martin }, ' ... 
'year = {1953}, ' ...
'title = {Gamebird Weights}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {17}, ' ...
'number = {1}, '...
'doi = {10.2307/3796802 }, '...
'pages = {36--42 }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hans1954'; type = 'Article'; bib = [ ... 
'author = {H. C. Hanson}, ' ... 
'year = {1954}, ' ...
'title = {Criteria of Age of Incubated Mallard, Wood Duck, and Bob-White Quail Eggs}, ' ...
'journal = {The Auk}, ' ...
'volume = {71}, ' ...
'number = {3}, '...
'pages = {267--272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SwanWein1997'; type = 'Article'; bib = [ ... 
'author = {D. L. Swanson and D. P. Weinacht}, ' ... 
'year = {1997}, ' ...
'title = {SEASONAL EFFECTS ON METABOLISM  AND THERMOREGULATION  IN NORTHERN  BOBWHITE}, ' ...
'journal = {The Condor}, ' ...
'volume = {99}, ' ...
'pages = {478--489}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpieAdam1985'; type = 'Article'; bib = [ ... 
'author = {D. E. Spiers and T. Adams and R. K. Ringer}, ' ... 
'year = {1985}, ' ...
'title = {HOMEOTHERMIC  DEVELOPMENT  IN  THE  BOBWHITE (\emph{Colinus virginianus})}, ' ...
'journal = {Comp. Biochem. Physiol. Vol. 81A, No.4, pp. ,}, ' ...
'volume = {81A}, ' ...
'number = {4}, '...
'pages = {921--927}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lyon1962'; type = 'Article'; bib = [ ... 
'author = {Lyon, D. L.}, ' ... 
'year = {1962}, ' ...
'title = {COMPARATIVE GROWTH AND PLUMAGE DEVELOPMENT IN \emph{Coturnix} AND BOBWHITE}, ' ...
'journal = {The Wislon Bulletin}, ' ...
'volume = {74}, ' ...
'number = {1}, '...
'pages = {5--27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneHugh1978'; type = 'Article'; bib = [ ... 
'author = {Jones, J. E. and Hughes, B. L.}, ' ... 
'year = {1978}, ' ...
'title = {Comparison of Growth Rate, Body Weight, and Feed Conversion Between \emph{Coturnix} D1 Quail and Bobwhite Quail}, ' ...
'journal = {Poultry Science}, ' ...
'volume = {57}, ' ...
'number = {5}, '...
'doi = {10.3382/ps.0571471}, ' ...
'pages = {1471--1472}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Zamm1986'; type = 'Article'; bib = [ ... 
'author = {R. M. Zammuto}, ' ... 
'year = {1986}, ' ...
'title = {Life histories of birds: clutch size, longevity, and body mass among {N}orth {A}merican game birds}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {64}, ' ...
'number = {12}, '...
'doi = {10.1139/z86-398}, '...
'pages = {2739--2749}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SchoAbbo1979'; type = 'Article'; bib = [ ... 
'author = {C. B. Schom and U. K. ABBOTT and N. E. WALKER }, ' ... 
'year = {1979}, ' ...
'title = {Adult and Embryo Responses to Organophosphate Pesticide: {A}zodrin}, ' ...
'journal = {Poultry Sci}, ' ...
'volume = {58}, ' ...
'pages = {60--66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
% 
bibkey = 'SchoAbbo1974'; type = 'Article'; bib = [ ... 
'author = {CHARLES B. SCHOM AND URSULA K. ABBOTT}, ' ... 
'year = {1974}, ' ...
'title = {Studies with Bob white Quail: Reproductive Characteristics}, ' ...
'journal = {POULTRY SCIENCE}, ' ...
'volume = {53}, ' ...
'pages = {1860--1865}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'FlorRoja2018'; type = 'Article'; bib = [ ... 
'author = {Josele Flores-Santina and Maria Rojas Antich and Hiroshi Tazawab and Warren W. Burggren}, ' ... 
'year = {2018}, ' ...
'title = {Hematology from embryo to adult in the bobwhite quail (\emph{Colinus virginianus}): Differential effects in the adult of clutch, sex and hypoxic incubation}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A}, ' ...
'volume = {218}, ' ...
'pages = {24-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'CainLien1985'; type = 'Article'; bib = [ ... 
'author = {J. R. CAIN and R. J. LIEN}, ' ... 
'year = {1985}, ' ...
'title = {A MODEL FOR DROUGHT INHIBITION OF BOBWHITE QUAIL (\emph{Colinus virginianus}) REPRODUCTIVE SYSTEMS}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {82A}, ' ...
'number = {4}, ' ...
'pages = {925--930}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrenHern2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.norbob.01}, ' ...
'author = {Brennan, L. A.and F. Hernandez and D. Williford}, ' ...
'year = {2020}, ' ...
'title = {Northern Bobwhite (\emph{Colinus virginianus})}, ' ...
'howpublished = {version 1.0. In Birds of the World (A. F. Poole, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Podarcis_muralis_Castanet

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Podarcis_muralis'; 
metaData.species_en = 'Common wall lizard'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'; 'L-N'; 'T-ab'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author       = {'Bas Kooijman'};    
metaData.date_subm    = [2023 01 04];              
metaData.email        = {'bas.kooijman@vu.nl'};            
metaData.address      = {'VU University, Amsterdam'};   

metaData.author_mod_1 = {'Urban Dajcman', 'Urtzi Enriquez Urzelai', 'Anamarija Zagar'};    
metaData.date_subm    = [2023 04 06];              
metaData.email        = {'Urban.Dajcman@nib.si'};            
metaData.address      = {'National Institute of Biology, Vecna pot 111, 1000 Ljubljana, Slovenia'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tp = 2.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ErogBulb2018';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'ErogBulb2018';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.41;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'BoscBout1998';  
  comment.Lb = 'based on Gallotia_atlantica: 6.5/7.3*2.45';
data.Lp  = 4.42;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'CastRoch1981';  
data.Lpm  = 4.99;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'CastRoch1981';
data.Li  = 6.683;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'DajcZaga2022'; 
  comment.Li = 'based on tL data';
data.Lim  = 6.223;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'DajcZaga2022'; 
  comment.Lim = 'based on tL data';

data.Ww0 = 0.98;   units.Ww0 = 'g';  label.Ww0 = 'wet weight of eggs'; bibkey.Ww0 = 'BoscBout1998';
data.Wwb = 0.36;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'BoscBout1998';
data.Wwi = 5.078;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'DajcZaga2022';
data.Wwim = 5.95;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'DajcZaga2022';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'JiBran2000';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 3 clutches, ranging from 3-11 for first clutch and 2-6 for second and third';

% univariate data
% time-length
data.tL_D = [ ... % hibernations (#), SVL (cm): females, males
 3	4.824 5.031
 3	4.721 NaN
 3	4.595 NaN
 3	4.458 NaN
 3	5.546 NaN
 4	5.454 4.492
 4	4.905 5.248
 4	4.996 NaN
 5	5.821 5.408
 5	5.592 5.729
 5	5.248 NaN
 5	5.145 NaN
 6	5.912 NaN
 6	5.454 NaN
 6	5.363 NaN
 6	5.088 NaN
 6	5.729 NaN
 6	5.592 NaN
 7	6.336 5.740
 7	5.866 5.603
 7	5.466 5.981
 7	5.214 NaN
 7	4.939 NaN
 8  NaN   5.832
 8  NaN   5.958
 8  NaN   5.351
 9	5.866 NaN
11  NaN   5.912
12	6.176 NaN
14  NaN   5.969];
data.tL_D(:,1) = (data.tL_D(:,1)+.7) * 365; % convert yr to d
units.tL_D  = {'d', 'cm'};  label.tL_D = {'time since birth', 'SVL', 'Derekoy'};  
temp.tL_D   = C2K(20);  units.temp.tL_D = 'K'; label.temp.tL_D = 'temperature';
bibkey.tL_D = 'ErogBulb2018'; treat.tL_D = {1, {'females','males'}};
comment.tL_D = 'Data for Derekoy, 52.4 mm precipitation; ; mean temp is 13.7 C, but body temp is assumed to be larger';
%
data.tL_K = [ ... % hibernations (#), SVL (cm)
 4	5.054 NaN
 5	5.684 NaN
 5	5.604 NaN
 5	5.236 NaN
 6	5.843 NaN
 6  NaN   5.476
 6  NaN   5.361
 6  NaN   5.396
 6  NaN   5.706
 7	6.358 5.624
 7	6.003 5.497
 7	5.727 NaN
 7	5.796 NaN
 8	6.059 5.726
 8	5.978 NaN
 9	5.885 6.207
 9	5.977 6.275
 9	6.092 5.851
10	6.090 6.228
10  NaN   6.297
10  NaN   6.377
10  NaN   5.998
11  NaN   6.387
13	6.499 6.143
13	6.591 NaN
14  NaN   6.452
14  NaN   6.188
15  NaN   6.496
16  NaN   6.415];
data.tL_K(:,1) = (data.tL_K(:,1)+.7) * 365; % convert yr to d
units.tL_K  = {'d', 'cm'};  label.tL_K = {'time since birth', 'SVL', 'Kazdagi'};  
temp.tL_K   = C2K(20);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'ErogBulb2018'; treat.tL_K = {1, {'females','males'}};
comment.tL_K = 'Data for Kazdagi, 108.8 mm precipitation; mean temp is 7.7 C, but body temp is assumed to be larger';

% length-weight
data.LW_f = [ ... % SVL (cm), wet weight (g)
64.1	5.50
60.6	4.75
57.5	4.75
56.1	4.50
59.0	4.25
59.3	4.25
60.9	4.18
59.1	4.08
56.9	4.01
59.8	4.00
56.9	4.00
53.0	4.00
54.7	3.99
58.6	3.98
51.8	3.76
56.7	3.75
49.2	3.75
57.6	3.63
52.8	3.52
50.2	3.50
59.2	3.50
53.9	3.50
57.1	3.50
55.6	3.50
51.9	3.50
54.0	3.50
54.7	3.32
51.1	3.23
50.0	3.04
54.0	3.01
50.7	2.80
52.1	2.75];
data.LW_f(:,1) = data.LW_f(:,1) /10 ; % convert mm to cm
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'female'};  
bibkey.LW_f = 'DajcZaga2022';
comment.LW_f = 'Dajcman_personal';
% males
data.LW_m = [ ... % SVL (cm), wet weight (g)
61.4	6.25
61.8	6.25
59.8	6.00
62.6	5.75
59.1	5.50
59.5	5.40
59.3	5.34
58.1	5.31
59.2	5.25
56.5	5.25
59.2	5.23
57.4	5.00
61.1	5.00
56.9	4.91
57.6	4.78
61.0	4.75
60.8	4.69
57.4	4.67
56.5	4.64
58.2	4.61
61.7	4.52
58.0	4.50
60.5	4.50
53.4	4.50
58.3	4.50
56.8	4.50
55.2	4.50
54.9	4.50
60.1	4.49
57.6	4.47
58.9	4.37
57.4	4.35
55.1	4.25
55.7	4.25
57.4	4.20
52.3	4.13
58.3	4.00
56.9	4.00
52.2	4.00
55.6	4.00
55.4	4.00
54.9	4.00
58.2	4.00
56.1	3.88
52.9	3.81
53.1	3.75
54.1	3.75
54.4	3.75
51.9	3.70
54.0	3.55
50.8	3.50
52.1	3.50
51.1	3.50
49.5	3.41
54.9	3.34
50.0	3.27
50.5	3.25
55.2	3.25
49.5	3.25
49.8	3.25
52.3	3.21
47.9	3.00
50.7	3.00
50.6	3.00
51.1	3.00
47.5	2.75
49.0	2.75
47.2	2.71
51.7	2.50];
data.LW_m(:,1) = data.LW_m(:,1) /10 ; % convert mm to cm
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'male'};  
bibkey.LW_m = 'DajcZaga2022';

% SVL - yearly fecundity
data.LN = [ ... 
51.10	3
54.72	3
60.15	3
58.37	4
57.40	4
55.33	4
54.56	5
58.17	5
59.34	5
60.24	5
59.53	6
58.21	6
57.82	6
57.59	6
54.94	8
55.30	9
53.88	9
59.50	7
60.99	7
61.53	7
60.89	8
59.98	8
61.86	9
64.67	10
66.19	10
64.89	12
62.50	11
60.34	10
59.31	9
58.34	9
57.63	9
58.27	10
58.95	10
59.82	11
60.76	11
62.28	12
59.98	12
56.88	11
61.63	13
60.82	14
61.89	15
62.44	15
62.25	16
63.83	16
63.89	17
68.16	17
57.43	17];
data.LN(:,1) = data.LN(:,1) /10 ; % convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'length', 'yearly fecundity'};
temp.LN = C2K(20); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'JiBran2000'};

% temp -dev time
data.Tab = [23  29; 65.9 32.6]'; units.Tab  = {'C','d'};  label.Tab  = {'temperature','development time'};  
bibkey.Tab  = 'HenaMeyl2012';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;
weights.Lim = 3 * weights.Lim;
weights.Ri = 3 * weights.Ri;
weights.tL_K = 10 * weights.tL_K;
weights.tL_D = 10 * weights.tL_D;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};   
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Lb, Li, Wwi, Ri data replaced, Ww0, Wwb, LN, Tab data added';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4KPJ3'; % Cat of Life
metaData.links.id_ITIS = '564582'; % ITIS
metaData.links.id_EoL = '47045459'; % Ency of Life
metaData.links.id_Wiki = 'Podarcis_muralis'; % Wikipedia
metaData.links.id_ADW = 'Podarcis_muralis'; % ADW
metaData.links.id_Taxo = '93099'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Podarcis&species=muralis'; % ReptileDB
metaData.links.id_AnAge = 'Podarcis_muralis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podarcis_muralis}}';
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
bibkey = 'ErogBulb2018'; type = 'Article'; bib = [ ...
'doi = {10.1163/15707563-17000019}, ' ...
'author = {Ali Ihsan Ero\v{g}lu and Ufuk B\"{u}lb\"{u}l and Muammer Kurnaz and Yasemin Odaba\c{s}}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of the common wall lizard, \emph{Podarcis muralis} ({L}aurenti, 1768)}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {68}, ' ...
'pages = {147–159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Podarcis_muralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DajcZaga2022'; type = 'Article'; bib = [ ...  
'author = {Dajcman U. and \v{Z}agar A.}, ' ...
'title = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DajcZaga2022'; type = 'Article'; bib = [ ...  
'author = {Dajcman U. and \v{Z}agar A.}, ' ...
'title = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErogBulb2018'; type = 'Article'; bib = [ ...
'doi = {10.1163/15707563-17000019}, ' ...
'author = {Ali Ihsan Ero\v{g}lu and Ufuk B\"{u}lb\"{u}l and Muammer Kurnaz and Yasemin Odaba\c{s}}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of the common wall lizard, \emph{Podarcis muralis} ({L}aurenti, 1768)}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {68}, ' ...
'pages = {147���159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DammBauw1992'; type = 'Article'; bib = [ ... 
'doi = {}, ' ...
'author = {Raoul Van Damme and Dirk Bauwens and Florentino Bra?a and Rudolf F. Verheyen}, ' ... 
'year = {1992}, ' ...
'title = {Incubation Temperature Differentially Affects Hatching Time, Egg Survival, and Hatchling Performance in the Lizard Podarcis muralis}, ' ...
'journal = {Herpetologica}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastRoch1981'; type = 'Article'; bib = [ ... 
'doi = {}, ' ...
'author = {Jacques Castanet and E. Roche}, ' ... 
'year = {1992}, ' ...
'title = {Determination de lage le lezard des murailles, \emph{Lacerta muralis} ({L}aurenti, 1768) au moyen de la squelettochronologie}, ' ...
'journal = {Revue suisse Zool.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cast1994'; type = 'Article'; bib = [ ... 
'doi = {10.1159/000213586}, ' ...
'author = {Jacques Castanet}, ' ... 
'year = {1994}, ' ...
'title = {Age estimation and longevity in reptiles}, ' ...
'journal = {Gerontology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JiBran2000'; type = 'Article'; bib = [ ... 
'doi = {}, ' ...
'author = {Xiang Ji and Florentino Brana\''{o}s}, ' ... 
'year = {2000}, ' ...
'title = {Among Clutch Variation in Reproductive Output and Egg Size in the Wall Lizard \emph(Podarcis muralis) from a Lowland Population of Northern {S}pain}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HenaMeyl2012'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8312.2012.02005.x}, ' ...
'author = {Maxime le Henanff and Sandrine Meylan and Olivier Lourdais\''{o}s}, ' ... 
'year = {2012}, ' ...
'title = {The sooner the better: reproductive phenology drives ontogenetic trajectories in a temperate squamate \emph{Podarcis muralis}}, ' ... 
'journal = {Biological Journal of the Linnean Society}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoscBout1998'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1565456}, ' ...
'author = {Herman A. J. in den Bosch and Ron G. Bout}, ' ... 
'year = {1998}, ' ...
'title = {Relationships between Maternal Size, Egg Size, Clutch Size, and Hatchling Size in {E}uropean Lacertid Lizards, ' ... 
'journal = {Journal of herpetology,}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Podarcis&species=muralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


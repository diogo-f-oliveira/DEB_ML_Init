function [data, auxData, metaData, txtData, weights] = mydata_Microtus_arvalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_arvalis'; 
metaData.species_en = 'Common vole'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-L_f'; 't-S'; 't-JO'; 't-JX'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1     = [2017 09 26];              
metaData.email_mod_1    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 26]; 

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'WielSell1990';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from MathKlun2003';
data.tx = 13.7;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BoycBoyc1988';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'they are mature as soon as weaned see facts';
data.tp = 13.7;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoycBoyc1988';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tx = 'mean age at maturity for offspring of solitary mothers';
  % data.am = 4.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
%   temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
%   comment.am = 'Wiki for M. arvalis';
data.Wwb = 1.43;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BoycBoyc1988';
comment.Wwb = 'Sawi1970 report 1.88 g, ';
data.Wwx = 9;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'Fran1956';
    comment.Wwx = '7-9 g, they are mature as soon as they are weaned see facts';
data.Wwp = 9; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Fran1956';
    comment.Wwp = '7-9 g, they are mature as soon as they are weaned see facts';
data.Wwi = 50;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Bale2007';

data.Ri  = 15.75/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'BoycBoyc1988';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'average number of pups produced by solitary females in 1980, germany' ;

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), head-body lenght (mm)
 0	2.119
12	8.300
21	15.320
30	19.294];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Grom2016';

% survival:

data.tS = [ ... lifespan [days]	population alive
0    	1.00
52.15	1.00
83.90	1.01
83.90	0.97
90.70	0.92
129.30	0.91
129.30	0.88
147.40	0.88
142.90	0.84
163.30	0.83
163.30	0.79
192.70	0.79
192.70	0.75
204.10	0.75
201.80	0.71
224.50	0.71
224.50	0.67
235.80	0.63
267.60	0.63
297.10	0.63
294.80	0.59
324.30	0.59
328.80	0.55
351.50	0.55
356.00	0.50
392.30	0.50
428.60	0.50
469.40	0.50
505.70	0.50
514.70	0.46
537.40	0.46
537.40	0.42
553.30	0.42
546.50	0.38
576.00	0.38
576.00	0.33
607.70	0.33
612.20	0.29
616.80	0.25
619.00	0.21
673.50	0.21
675.70	0.17
678.00	0.13
716.60	0.12
718.80	0.08
750.60	0.05
795.90	0.05
868.50	0.05
956.90	0.05
1000.00	0.05
];
data.tS(:,1) = data.tS(:,1) + 52.5;
units.tS   = {'d', 'g'};  label.tS = {'time since birth', 'surviving fraction'};  
temp.tS    = C2K(37);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'Grom2016';
comment.tS = ['male common voles born from the stock population;', ...
    'Day 0 = experimental day; male voles were 45-60 days old', ...
    'nutrition: hay, aplles, seeds', ...
    'page 1352, Figure 1'    ];

% the data is strange - will not use unless I can get my hand on orginal
% publication
% data.tLe = [ ...age [days]	body length [mm]
% 0.06	0.60
% 1.33	0.60
% 2.65	0.75
% 4.38	1.05
% 6.57	1.64
% 9.05	2.54
% 11.01	3.88
% 12.80	5.37
% 14.47	7.61
% 15.97	10.00
% 17.12	12.54
% 18.56	16.72
% 19.71	21.04
% 20.58	25.37
% 21.10	27.91
% ];
% units.tLe   = {'d', 'mm'};  label.tLe = {'age', 'body length'};  
% temp.tLe    = C2K(37);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
% bibkey.tLe = 'WielSell1990';
% comment.tLe = ['wild voles; the length of the embryo was measured;', ...
%     'based on this data the growth function was calculated'    ];

data.tW2 = [ ...     time [days]	body weight young voles [g]
0.96	1.77
2.34	2.11
3.30	2.53
4.32	2.86
5.28	3.16
6.30	3.58
7.20	4.17
8.26	4.55
9.28	4.80
10.14	5.35
11.20	5.68
12.32	6.44
13.12	6.86
14.14	7.62
15.14	8.72
16.06	9.90];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'weight'};  
temp.tW2    = C2K(37);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Migu1969';

data.tL3 = [ ... age [days]	body length [cm]
10.00	20.00	30.00	40.00	50.00	60.00	70.00	80.00	90.00	100.00	110.00	120.00	130.00	140.00	160.00	170.00	180.00	190.00	200.00	210.00	220.00	230.00	240.00	250.00	260.00	270.00	280.00	290.00	300.00	310.00	320.00	330.00	340.00	350.00	360.00	370.00	430.00	480.00	510.00	520.00	540.00	560.00	580.00	600.00	610.00	620.00	640.00	660.00	720.00;
75.56	78.15	84.44	91.48	88.15	92.96	95.93	95.93	94.81	93.70	94.44	100.70	96.30	102.20	99.26	103.00	106.70	97.78	102.60	103.30	101.50	97.41	105.60	103.70	103.30	109.30	109.30	106.30	108.90	118.90	110.40	105.60	102.60	115.20	108.90	121.10	117.00	103.30	111.10	101.10	104.80	104.80	109.60	107.40	106.70	102.20	113.00	109.30	109.60
]';
comment.tL3 = ['page 224, Figure 3B, laboratory food ad libitum;',...
    'captive bred voles'];
units.tL3   = {'d', 'mm'};  label.tL3 = {'time since birth', 'body length'};  
temp.tL3    = C2K(37);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Bale2007';

data.tW3 = [ ... age [days]	body length [cm]
10.00	20.00	30.00	40.00	50.00	60.00	70.00	80.00	90.00	100.00	110.00	120.00	130.00	140.00	150.00	160.00	170.00	180.00	190.00	200.00	210.00	220.00	230.00	240.00	250.00	260.00	270.00	280.00	290.00	300.00	310.00	320.00	330.00	340.00	350.00	360.00	370.00	420.00	430.00	460.00	480.00	510.00	520.00	540.00	560.00	580.00	590.00	600.00	610.00	620.00	640.00	660.00	720.00;
12.47	14.94	16.91	21.85	19.38	21.36	22.10	25.80	23.09	23.58	23.33	28.27	25.31	29.26	26.54	26.30	28.77	33.95	27.04	30.74	31.48	29.26	26.05	32.72	28.52	31.23	38.40	32.47	39.38	36.67	45.56	36.91	32.47	28.27	38.15	34.94	42.35	27.04	44.57	48.02	27.28	24.32	27.04	26.79	31.48	34.69	28.27	27.78	28.27	27.28	43.33	37.90	37.65
]';
comment.tW3 = ['page 224, Figure 3B, laboratory food ad libitum;',...
    'captive bred voles'];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'weight'};  
temp.tW3    = C2K(37);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Bale2007';

tWJO = [ ... age [d]	body weight [g]  ccm O2/g/h	
20	11.4	5.37 
30	14.4	4.64 
40	15.3	4.66 
50	17.4	4.48 ];

data.tW4 = tWJO(:,[1 2]);
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'weight'};  
temp.tW4    = C2K(37);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'DrozGore1972';

data.tJO = tWJO(:,[1 3]);
data.tJO(:,2) = data.tJO(:,2).* data.tW4(:,2); % convert to ccm/O2/h
units.tJO   = {'h', 'ml/h'};  label.tJO = {'time since birth', 'O_2 consumption'};  
temp.tJO    = C2K(37);  units.temp.tJO = 'K'; label.temp.tJO = 'temperature';
bibkey.tJO = 'DrozGore1972';
comment.tJO = '1 ccm is 1ml ; The respirometric measurements were carried out in 9 litre metabolic chambers at 20 C in a Morrison respirometer';

data.tW5 = [ ...
20 11.44 
30 14.08 
40 16.31 
50 18.28 
60 20.07
70 21.70
];
data.tW5 = tWJO(:,[1 2]);
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'weight'};  
temp.tW5    = C2K(37);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5 = 'DrozGore1972';

data.tJX = [ ...
30 113.5
40 113.5 + 127.8
50 113.5 + 127.8 + 142.1
];
units.tJX   = {'d', 'kcal'};  label.tJX = {'time since birth', 'cumulated energy ingested'};  
temp.tJX    = C2K(37);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
bibkey.tJX = 'DrozGore1972';

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

%% Discussion
D1 = ['There is variability in reported timing of weaning and puberty;',...
'we assume that weaning and puberty happen at the same maturity level.'];
D2 = ['We assume that f=1 during lactation but that it differs afterwards in the different studies;',...
'this assumption makes a difference'];
metaData.discussion = struct('D1',D1, 'D2',D2); 

%% Facts
F1 = 'Litter weight amounts to 53,2% of the mothers weight; female suckle her former litter during pregnancy.'; 
metaData.bibkey.F1 = 'Fran1956';
F2 = 'Females mature after opening eyes and while still unweaned. So called suckling maturity.'; 
metaData.bibkey.F2 = {'BoycBoyc1988','Fran1956'};
F3 = 'Age at weaning/maturity earlier for solitary mother than mothers in groups.'; 
metaData.bibkey.F3 = 'BoycBoyc1988';
F4 = 'most numerous rodent in field ecosystems in most of europe; might reproduce all year round in favorable conditions; most dangerous pest of the field cultures.';
metaData.bibkey.F4 = 'Migu1969';
F5 = 'food uptake by females increases slightly during pregnancy while it increases drastically during lactation.';
metaData.bibkey.F5 = 'Migu1969';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5); 

%% Links
metaData.links.id_CoL = '7VV7P'; % Cat of Life
metaData.links.id_ITIS = '632856'; % ITIS
metaData.links.id_EoL = '1179634'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_arvalis'; % Wikipedia
metaData.links.id_ADW = 'Microtus_arvalis'; % ADW
metaData.links.id_Taxo = '62673'; % Taxonomicon
metaData.links.id_WoRMS = '1506686'; % WoRMS
metaData.links.id_MSW3 = '13000248'; % Mammal Spec World
metaData.links.id_AnAge = 'Microtus_arvalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_arvalis}}';
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
bibkey = 'Grom2016'; type = 'Article'; bib = [ ... 
'author = {Gromov, V. S.}, ' ... 
'year = {2016}, ' ...
'title = {Survival and Growth Rates of Pups in Common Vole (\emph{Microtus arvalis}) Litters Depending on the Presence of Sire}, ' ...
'journal = {Contemporary Problems of Ecology}, ' ...
'volume = {9}, ' ...
'pages = {765--770}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Microtus_arvalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WielSell1990'; type = 'Article'; bib = [ ... 
'author = {H. Wieland and J. Sellmann and S. Heise}, ' ... 
'year = {1990}, ' ...
'title = {Embryonenwachstum der {F}eldmaus (\emph{Microtus arvalis} ({P}all.))}, ' ...
'journal = {Archives of Phytopathology and Plant Protection}, ' ...
'volume = {26}, ' ...
'number = {9}, ' ...
'pages = {569--572}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Migu1969'; type = 'Article'; bib = [ ... 
'author = {Migula, P.}, ' ... 
'year = {1969}, ' ...
'title = {Bioenergetics of Pregnancy and Lactation in {E}uropean Common Vole}, ' ...
'journal = {Acta theriologica}, ' ...
'volume = {14}, ' ...
'doi = {10.4098/AT.arch.69-13}, ' ...
'pages = {167--179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fran1956'; type = 'Article'; bib = [ ... 
' author = {F.FRANK}, ' ...
'title = {Das {F}ortpflanzungspotential der {F}eldmaus, \emph{Microtus arvalis} ({P}allas)},'...
'journal = {Zeitschrift f\"{u}r S\"{a}ugetierkunde},'...
'year = {1956},'...
'volume = {21},'...
'pages = {176--181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoycBoyc1988'; type = 'Article'; bib = [ ... 
	'title = {Population Biology of \emph{Microtus arvalis}. {I}. {L}ifetime Reproductive Success of Solitary and Grouped Breeding Females},'...
	'volume = {57},'...
	'doi = {10.2307/5088},'...
	'journal = {The Journal of Animal Ecology},'...
	'author = {Boyce, C. C. K. and Boyce J. L.},'...
	'year = {1988},'...
	'pages = {711--722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bale2007'; type = 'Article'; bib = [ ... 
	'title = {Cranial Growth of Captive Bred Common Voles (\emph{Microtus arvalis})},'...
	'volume = {17},'...
	'issn = {1392-1657},'...
    'doi = {10.1080/13921657.2007.10512835}, ' ...
	'number = {3},'...
	'journal = {Acta Zoologica Lituanica},'...
	'author = {Bal\`{e}iauskien\"{e}, L.},'...
	'year = {2007},'...
	'pages = {220--227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrozGore1972'; type = 'Article'; bib = [ ... 
	'title = {Bioenergetics of growth in common voles},'...
	'volume = {17},'...
	'doi = {10.4098/AT.arch.72-18},'...
	'journal = {Acta Theriologica},'...
	'author = {Dro\.{z}d\.{z}, A. and G\''{o}recki, A. and Sawicka-Kapusta, K.},'...
	'year = {1972},'...
	'pages = {245--257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%


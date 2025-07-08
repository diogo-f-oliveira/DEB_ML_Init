function [data, auxData, metaData, txtData, weights] = mydata_Somniosus_microcephalus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Somniosidae';
metaData.species    = 'Somniosus_microcephalus'; 
metaData.species_en = 'Greenland shark'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCvb', 'biCvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-L'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2016 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1 = [2020 10 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 23]; 

%% set data
% zero-variate data

data.ab = 4.7*365;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'inserted to check litter interval, but otherwise ignorned in estimation and v is fixed';
data.tp = 156*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'NielHede2016';
  temp.tp = C2K(5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 392*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'NielHede2016';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = ' 392 +/- 120 years. typical temp is -0.6 till 12 C';
  
data.Lb  = 40;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'MacNMcMe2012';
data.Lp  = 419;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'NielHede2020';
data.Lpm = 284;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';    bibkey.Lpm  = 'NielHede2020';
data.Li  = 550;     units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'NielHede2020';
data.Lim = 375;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length';      bibkey.Lim  = 'Niel2017';

% data.Wwi = 1023e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'LydeAaro2016';
% comment.Wwi = 'Largest Greenland shark reported in the literature according to the authors';

data.Ri  = 20/365/5;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at TL 5 m';        bibkey.Ri  = 'Koef1957';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Koef1957 reports 10 pups per litter, but here doubled in view of D4; litter interval of 5 yr based on ab';
  auxData.length.Ri = 500;   units.length.Ri = 'cm'; label.length.Ri = 'assumed length at reproduction';
  
% univariate data:
data.LW = [ ...TL (cm) wet weight (kg)
246	324	334	294	332	284	287	304	270	295	291	296	308	276	360	288	340	312	307	264	309	297	245	389	339	281	300	281	308	283	283	291	278	313	324	296	348	325	404	365	308	308	274	337	259;
136	375	327	272	372	214	252	298	158	242	260	258	347	214	494	281	327	313	295	181	273	262	159	660	377	257	319	215	262	223	179	220	208	279	305	209	397	334	700	631	236	311	197	392	163
]';
 units.LW  = {'cm','kg'}; label.LW  = {'total length', 'wet weight'};        bibkey.LW  = 'LeclLyde2012';   
comment.LW = 'Data from tab. 1. All are immature, males and females are pooled.';

data.LW2 = [ ... TL (cm) wet weight (kg)
  258	326	447	420	442	354	460	447	370	312	346	355	306	264	386	365	336	351;
  144	278	1078	740	850	430	1060	1100	540	337	416	464	246	168	560	430	338	452
]';
 units.LW2  = {'cm','kg'}; label.LW2  = {'total length', 'wet weight'}; bibkey.LW2  = 'NielHede2014';   
comment.LW2 = 'Data from tab. 1. males and females are pooled.';

data.LW3 = [ ... TL (cm) wet weight (kg)
  106 110 166 180;
  8.9 10.6 31 80
]';
 units.LW3  = {'cm','kg'}; label.LW3  = {'total length', 'wet weight'};        bibkey.LW3  = 'NielHede2014';   
comment.LW3 = 'Data from text pp  51 - caught below 1000 m';

data.tL = [ ... time (yr), length (cm)
0 262
16 270];
units.tL = {'year','cm'}; label.tL  = {'time', 'total length'};         
temp.tL = C2K(4); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL  = 'MacNMcMe2012';  
comment.tL = 'a single tagged individual which was recaptured 16 years later in Hansen 1963 cited in macNMeMe2012; we assume a mean temperature of 4 deg C, but typical temperature range from -0.6 till 12 C';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.Lb = weights.Lb * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Gestation time is unknown. The assumed litter-interval of 5 yr is the smallest for which the predicted gestation time is smaller than the litter interval (given this set of life-history data)';
D2 = 'Original version of this entry is discussed in AuguLika2017';
metaData.bibkey.D2 = 'AuguLika2017'; 
D3 = 'Males are assumed to differ from females by {p_Am} and E_Hp only'; 
D4 = 'mod_1: revised data for Li, Ri and temperature; male data added';
D5 = ['mod_1: NielHede2020 report 200-324 ova of 5.1 cm diameter per litter and suggest that they all grow into 40 cm neonates. '...
     'This is, however, not possible in view of the weight difference between ovum and neonate. ' ...
     'We expect histotrophy, combined with ovum resorption; without the latter, investment in reproduction would exceed max possible one'];
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Accumulates trimethylamine N-oxide in its tissues as osmoprotectants and to increase their buoyancy. Flesh is eaten in Iceland after detoxicification.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'MacNMcMe2012'; 
F3 = 'A mature female of 447 cm TL had 455 oocytes, 5 cm diameter, weighing altogher 49 kg';
metaData.bibkey.F3 = 'NielHede2014'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4Y8YJ'; % Cat of Life
metaData.links.id_ITIS = '160611'; % ITIS
metaData.links.id_EoL = '46560310'; % Ency of Life
metaData.links.id_Wiki = 'Somniosus_microcephalus'; % Wikipedia
metaData.links.id_ADW = 'Somniosus_microcephalus'; % ADW
metaData.links.id_Taxo = '41837'; % Taxonomicon
metaData.links.id_WoRMS = '105919'; % WoRMS
metaData.links.id_fishbase = 'Somniosus-microcephalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Somniosus_microcephalus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/138}}';
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
bibkey = 'LeclLyde2012'; type = 'Article'; bib = [ ... 
'author = {Leclerc, L.-M. E. and Lydersen, C. and Haug, T. and Bachmann, L. and Fisk, A. T. and Kovacs, K. M.}, ' ... 
'year = {2012}, ' ...
'title = {A missing piece in the {A}rctic food web puzzle? {S}tomach contents of {G}reenland sharks sampled in {S}valbard, {N}orway}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {35}, ' ...
'number = {8}, '...
'pages = {1197--1208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LydeAaro2016'; type = 'Article'; bib = [ ... 
'author = {Lydersen, C.  and Fisk, A. T.  and Kovacs, K. M.}, ' ... 
'year = {2016}, ' ...
'title = {A review of {G}reenland shark (\emph{Somniosus microcephalus}) studies in the {K}ongsfjorden area, {S}valbard {N}orway}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {39}, ' ...
'number = {11}, '...
'pages = {2169--2178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YanoStev2007'; type = 'Article'; bib = [ ... 
'author = {Yano, K. and Stevens, J. D. and Compagno, L. J. V.}, ' ... 
'year = {2007}, ' ...
'title = {Distribution, reproduction and feeding of the {G}reenland shark \emph{Somniosus (Somniosus) microcephalus}, with notes on two other sleeper sharks, \emph{Somniosus (Somniosus) pacificus} and \emph{Somniosus (Somniosus) antarcticus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {70}, ' ...
'number = {2}, '...
'pages = {374--390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NielHede2014'; type = 'Article'; bib = [ ... 
'author = {Nielsen, J.  and Hedeholm, R. B.  and Simon, M.  and Steffensen, J. F.}, ' ... 
'year = {2014}, ' ...
'title = {Distribution and feeding ecology of the {G}reenland shark (\emph{Somniosus microcephalus}) in {G}reenland waters}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {37}, ' ...
'number = {1}, '...
'pages = {37--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacNMcMe2012'; type = 'Article'; bib = [ ... 
'author = {MacNeil, M. A. and McMeans, B. C. and Hussey, N. E. and Vecsei, P. and Svavarsson, J. and Kovacs, K. M. and Lydersen, C. and Treble, M. A. and Skomal, G. B. and Ramsey, M. and Fisk, A. T.}, ' ... 
'year = {2012}, ' ...
'title = {Biology of the {G}reenland shark \emph{Somniosus microcephalus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {80}, ' ...
'number = {5}, '...
'doi = {10.1111/j.1095-8649.2012.03257.x}, ' ...
'pages = {991--1018}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NielHede2016'; type = 'Article'; bib = [ ... 
'author = {Nielsen, J. and Hedeholm, R. B. and Heinemeier, J. and Bushnell, P. G. and Christiansen, J. S. and Olsen, J. and Ramsey, C. B. and Brill, R. W. and Simon, M. and Steffensen, K. F. and Steffensen, J. F.}, ' ... 
'year = {2016}, ' ...
'title = {Eye lens radiocarbon reveals centuries of longevity in the {G}reenland shark (\emph{Somniosus microcephalus})}, ' ...
'journal = {Science}, ' ...
'volume = {353}, ' ...
'number = {6300}, '...
'pages = {702--704}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Koef1957'; type = 'Article'; bib = [ ... 
'author = {Koefoed, E.}, ' ... 
'year = {1957}, ' ...
'title = {Notes on the {G}reenland Shark \emph{Acanthorhinus carcharias} ({G}unn). 2. {A} {U}terine Foetus and the Uterus from a {G}reenland Shark.}, ' ...
'journal = {Fiskerdir. Skr. Ser. Havunders}, ' ...
'volume = {11}, ' ...
'number = {10}, '...
'pages = {8--12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AuguLika2017'; type = 'Article'; bib = [ ... 
'author = {Augustine, S.  and Lika, D. and Kooijman, S. A. L. M.}, ' ... 
'year = {2017}, ' ...
'title = {Comment on the ecophysiology of the {G}reenland shark, \emph{Somniosus microcephalus}}, ' ...
'journal = {Polar Biology}, ' ...
'doi = {10.1007/s00300-017-2154-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NielHede2020'; type = 'Article'; bib = [ ... 
'author = {Julius Nielsen and Rasmus B. Hedeholm and Arve Lynghammar and Leon M. McClusky and Bj{\o}rn Berland and John F. Steffensen and J{\o}rgen S. Christiansen}, ' ... 
'year = {2020}, ' ...
'title = {Assessing the reproductive biology of the {G}reenland shark (\emph{Somniosus microcephalus)}}, ' ...
'journal = {Plos One}, ' ...
'volume = {15(10)}, ' ...
'pages = {e0238986}, ' ...
'doi = {10.1371/journal.pone.0238986}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Niel2017'; type = 'phdthesis'; bib = [ ... 
'author = {Julius Nielsen}, ' ... 
'year = {2017}, ' ...
'title = {The {G}reenland shark (\emph{Somniosus microcephalus}) Diet, tracking and radiocarbon age estimates reveal the world''s oldest vertebrate}, ' ...
'school = {University of Copenhagen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
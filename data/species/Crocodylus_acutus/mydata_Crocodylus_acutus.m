function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_acutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodilidae';
metaData.species    = 'Crocodylus_acutus'; 
metaData.species_en = 'American crocodile'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bFe', 'biMm'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bpCi', 'biCv'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 06 13];


%% set data
% zero-variate data

data.ab = 78;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '75 till 80 d';
data.tp = 3650;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.ab = '75 till 80 d';
data.am = 47*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 27;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 280;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Li  = 300;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 600;     units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 60;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 173e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'Wiki';
data.Wwim = 1e6;     units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 70/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% L0-L1 Data 
data.L0Lt_f = [ ... % total length at capture (cm), total length at recapture (cm), time in between (d)
 78.0 117.5 1673
 65.0 112.0 1514
 48.0  80.6  914
 48.0  83.2  914
 53.5  93.4  914
 59.5  86.4  914
 50.0 124.4  913
 42.8  76.6  667
 54.0  89.0  365
 54.7  72.1  287];
time.L0Lt_f = data.L0Lt_f(:,3); units.time.L0Lt_f = 'd'; label.time.L0Lt_f = 'time between captures';
data.L0Lt_f = data.L0Lt_f(:,[1 2]); [L i] = sort(data.L0Lt_f(:,1)); data.L0Lt_f = data.L0Lt_f(i,:);
units.L0Lt_f   = {'cm', 'cm'};  label.L0Lt_f = {'total length at capture', 'total length at recapture', 'female'};  
treat.L0Lt_f = {0}; units.treat.L0Lt_f = ''; label.treat.L0Lt_f = '';
temp.L0Lt_f = C2K(25); units.temp.L0Lt_f = 'K'; label.temp.L0Lt_f = 'temperature';
bibkey.L0Lt_f = {'GarcBuen2012'};
comment.L0Lt_f = 'Data for females at La Ventanilla, Oaxaca, Mexico';
%
data.L0Lt_m = [ ... % total length at capture (cm), total length at recapture (cm), time in between (d)
107.0 163.4 2525
 46.5 105.0 2495
 63.0 116.5 2190
 51.0 103.4 1833
 73.5 114.2 1479
 74.0 105.0 1456
 58.3  88.4 1403
 50.5 112.5 1369
 47.5  74.8 1319
 50.0  81.9 1228
 44.0  87.2 1013
 50.5  82.0  914
 47.5  92.8  914
 53.0  84.8  914
 50.5  91.2  914
 52.0  84.0  914
 52.0  75.5  800
 53.0  73.5  667
 48.0  84.0  549
 53.5  67.6  498
 51.0  97.0  403
 48.0  89.5  365
 52.5  89.0  365
 48.0  88.1  311
 54.0  70.0  292
 42.0  71.0  292
 51.0  80.0  292
 43.0  88.4  292
 46.5  61.8  254
 46.0  61.6  254
 55.0  55.4  184
 52.0  62.4  184
 56.0  56.8   96
104.8 105.6   87
 49.0  68.9   70];
time.L0Lt_m = data.L0Lt_m(:,3); units.time.L0Lt_m = 'd'; label.time.L0Lt_m = 'time between captures';
data.L0Lt_m = data.L0Lt_m(:,[1 2]); [L, i] = sort(data.L0Lt_m(:,1)); data.L0Lt_m = data.L0Lt_m(i,:);
units.L0Lt_m   = {'cm', 'cm'};  label.L0Lt_m = {'total length at capture', 'total length at recapture', 'male'};  
treat.L0Lt_m = {0}; units.treat.L0Lt_m = ''; label.treat.L0Lt_m = '';
bibkey.L0Lt_m = {'GarcBuen2012'};
comment.L0Lt_m = 'Data for males at La Ventanilla, Oaxaca, Mexico';
  
% L-W Data 
data.LW_f = [ ... % total length (cm), weight (g)
 42.8  360
 54.0  410
 72.1  730
 76.6  580
 80.6 1500
 83.2 2000
 86.4 1000
 89.0 1150
 93.4  870
117.7 2400
122.0 2800
124.4 2750
];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'GarcBuen2012';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
 42.0  320
 43.0  335
 44.0  390
 48.0  380
 50.5  370
 51.0  395
 52.0  440
 53.0  410
 53.0  375
 54.0  405
 55.0  490
 55.4  520
 56.0  495
 56.8  520
 61.6  600
 61.8  600
 62.4  750
 63.0  450
 67.6  720
 68.9  900
 70.0  680
 71.0  610
 73.5  580
 74.8  680
 75.5  650
 80.0  760
 81.9 1200
 82.0 1200
 84.0  950
 84.0 1000
 84.8 1050
 87.2 1500
 88.1 1050
 88.4 1300
 88.4  800
 89.0 1050
 89.5  900
 91.2  960
 92.8 2500
 97.0  930
103.4 1500
104.8 3100
105.0 1500
105.0 2100
105.6 3350
112.5 2650
114.2 2600
116.5 2900
163.4 3000
];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'GarcBuen2012';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'L0Lt_f','L0Lt_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate: below  31.1 C are female; above 32.7 C neonates are male; no hatch below 27.8 C';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKNB'; % Cat of Life
metaData.links.id_ITIS = '174361'; % ITIS
metaData.links.id_EoL = '46559655'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_acutus'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_acutus'; % ADW
metaData.links.id_Taxo = '50628'; % Taxonomicon
metaData.links.id_WoRMS = '422566'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=acutus'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_acutus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_acutus}}';
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
bibkey = 'GarcBuen2012'; type = 'Article'; bib = [ ... 
'author = {J. Garc\''{i}a-Grajales and A. Buenrostro-Silva and P. Charruau}, ' ... 
'year = {2012}, ' ...
'title = {GROWTH AND AGE OF JUVENILE {A}MERICAN CROCODILES (\emph{Crocodylus acutus} IN LA {V}ENTANILLA ESTUARY, {O}AXACA, {M}EXICO}, ' ...
'journal = {Herpetological Conservation and Biology}, ' ...
'volume = {7}, ' ...
'pages = {330--338}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1056415/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crocodylus_acutus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Crocodylus_acutus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


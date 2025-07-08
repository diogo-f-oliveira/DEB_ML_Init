function [data, auxData, metaData, txtData, weights] = mydata_Haliaeetus_albicilla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Haliaeetus_albicilla'; 
metaData.species_en = 'White-tailed eagle'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc', 'Dwb', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg', '0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCv', 'biCvm', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 41;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 90;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 270;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 42*265; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 142;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 90;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Fent1984';
data.Wwi = 5572; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 4014; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
 1   87.8
 2   87.4
 3   89
 4  100
 5  111
 6  133
 7  156
 8  187
 9  246
10  310
11  348
12  400
13  447
14  426
15  454
16  539
17  630
18  730
19  835
20  910
21 1030
22 1160
23 1240
24 1320
25 1355
26 1465
27 1600
28 1750
29 1760];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'chick 1'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Fent1984';
comment.tW1 = 'Data for chick 1';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
 1   81.0
 2   88
 3  108.9
 4  122
 5  153
 6  181
 7  211
 8  246
 9  297
10  349
11  419
12  544
13  710
14  820
15  910
16 1060
17 1080
18 1240
19 1360
20 1450
21 1630
22 1820];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'chick 2'};  
temp.tW2    = C2K(40);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Fent1984';
comment.tW2 = 'Data for chick 2';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
 1   89.5
 2   89.3
 3  102.4
 4  119
 5  144
 6  182
 7  215
 8  249
 9  311
10  417
11  508
12  620
13  670
14  820
15  840
16 1040
17 1105
18 1250
19 1390
20 1580
21 1780
22 1840];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'chick 3'};  
temp.tW3    = C2K(40);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Fent1984';
comment.tW3 = 'Data for chick 3';
%
data.tW4 = [ ... % time since birth (d), wet weight (g)
 1   82.2
 2   91.5
 3  108.3
 4  126
 5  163
 6  196
 7  244
 8  324
 9  417
10  514
11  632
12  761
13  871
14 1018
15 1211
16 1370
17 1542
18 1692
19 1844
20 1994
21 2191
22 2280];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight', 'chick 4'};  
temp.tW4    = C2K(40);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'Fent1984';
comment.tW4 = 'Data for chick 4';
%
data.tW5 = [ ... % time since birth (d), wet weight (g)
 1   84.0
 2   89.7
 3  102.4
 4  127
 5  155
 6  192
 7  240
 8  299
 9  372
10  467
11  577
12  686
13  777
14  894
15 1051
16 1232
17 1330
18 1490
19 1667
20 1692
21 1723
22 1798];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight', 'chick 5'};  
temp.tW5    = C2K(40);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5 = 'Fent1984';
comment.tW5 = 'Data for chick 4';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = weights.Ww0 * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4','tW5'}; subtitle1 = {'Data for chick 1,.,5'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: Wwim and Ww0 data added (but Ww0 data ignored due to inconsistency)';
D2 = 'mod_1: v reduced and food availability not constant';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '3JBJV'; % Cat of Life
metaData.links.id_ITIS = '175419'; % ITIS
metaData.links.id_EoL = '45511400'; % Ency of Life
metaData.links.id_Wiki = 'Haliaeetus_albicilla'; % Wikipedia
metaData.links.id_ADW = 'Haliaeetus_albicilla'; % ADW
metaData.links.id_Taxo = '52680'; % Taxonomicon
metaData.links.id_WoRMS = '232053'; % WoRMS
metaData.links.id_avibase = '5A3D91D3254A568D'; % avibase
metaData.links.id_birdlife = 'white-tailed-sea-eagle-haliaeetus-albicilla'; % birdlife
metaData.links.id_AnAge = 'Haliaeetus_albicilla'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haliaeetus_albicilla}}';
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
bibkey = 'Fent1984'; type = 'Article'; bib = [ ... 
'author = {C. Fentzloff}, ' ... 
'year = {1984}, ' ...
'doi = {10.1111/j.1748-1090.1984.tb02995.x}, ' ...
'title = {Breeding, artifical incubation and release of White-tails sea eagles \emph{Haliaeetus albicilla}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {23}, ' ...
'pages = {18--35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Haliaeetus_albicilla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=5A3D91D3254A568D&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


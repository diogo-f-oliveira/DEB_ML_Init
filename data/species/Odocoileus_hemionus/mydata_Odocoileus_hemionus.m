function [data, auxData, metaData, txtData, weights] = mydata_Odocoileus_hemionus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Odocoileus_hemionus'; 
metaData.species_en = 'Mule deer'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 18];

%% set data
% zero-variate data

data.tg = 207;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(40);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from RogeMoen1987';
data.tx = 132;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 478;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2950;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 23100;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 90000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
data.Wwim = 150000;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'ADW';

data.Ri  = 1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (d), wet weight (pounds)
1.602	8.328
13.141	10.280
34.800	15.174
47.786	17.617
62.285	24.007
78.212	29.901
95.652	39.742
107.360	50.583
127.675	60.418
139.336	68.789
156.823	81.099
166.933	83.548
185.642	84.498
191.411	85.474
202.969	88.413
221.696	90.350
234.710	94.275
247.705	97.211
267.833	97.170
273.649	100.615
290.929	102.062
314.016	106.459
315.538	110.901
347.251	115.281
355.999	121.683
372.086	135.971
386.388	131.992
398.152	145.795
417.058	157.115
435.888	164.484
446.055	169.895
462.198	187.146
522.411	178.135
584.033	167.640
594.021	163.669
645.693	159.120
674.436	158.567
703.133	155.546
704.703	162.457
717.679	164.406
739.319	168.312
772.573	178.121
784.056	177.110
798.780	195.352
811.813	200.264
842.370	219.461
900.948	200.083
956.753	186.143
1041.350	174.119
1062.840	170.125
1146.947	207.979
1190.772	244.433
1219.920	265.115
1353.792	198.176
1395.437	195.623
1424.171	194.577
1438.623	198.498
1450.209	202.919
1473.550	220.649
1503.938	230.958];
data.tW(:,2) = 453.59237 * data.tW(:,2); % convert pound to g
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WoodCowa1962'; comment.tW = 'data for male';

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

% %% Group plots
% set1 = {'tW_BH','tW_SD'}; subtitle1 = {'Data from Black Hills, South Dakota'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Slow foetal development is assumend';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '48NBP'; % Cat of Life
metaData.links.id_ITIS = '180698'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Odocoileus_hemionus'; % Wikipedia
metaData.links.id_ADW = 'Odocoileus_hemionus'; % ADW
metaData.links.id_Taxo = '68072'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200267'; % MSW3
metaData.links.id_AnAge = 'Odocoileus_hemionus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Odocoileus_hemionus}}';
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
bibkey = 'WoodCowa1962'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z62-053}, ' ...
'author = {Wood, A. J. and Cowan, I. M. and Nordan, H. C.}, ' ... 
'year = {1962}, ' ...
'title = {PERIODICITY OF GROWTH IN UNGULATES AS SHOWN BY DEER OF THE GENUS \emph{Odocoileus})}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {40(4)}, ' ...
'pages = {593–603}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Odocoileus_hemionus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Odocoileus_hemionus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


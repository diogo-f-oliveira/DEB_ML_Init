function [data, auxData, metaData, txtData, weights] = mydata_Anas_platyrhynchos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_platyrhynchos'; 
metaData.species_en = 'Mallard'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Csa', 'Csb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH', 'TPi', 'TA'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K, body temp from Smith et al 1976

metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-N'; 't-Le'; 't-Wwe'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2011 11 20];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Elke Zimmer'};    
metaData.date_mod_2     = [2018 04 17];              
metaData.email_mod_2    = {'elke.zimmer@ibacon.com'};            
metaData.address_mod_2  = {'ibacon GmbH'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 08];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 06 24];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 25.5;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'CaldCorn1975';   
  temp.ab = C2K(38);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'they argue T_emb was 38';
  auxData.t0.ab = 5;  units.t0.ab = 'd';  label.t0.ab = 'lag time until fully incubated'; 
data.tx = 55;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 165;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'CramSimm1977';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 29.1 * 365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'MagaCost2009';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 50.6; units.Ww0  = 'g'; label.Ww0  = 'fresh egg weight ';  bibkey.Ww0  = 'CaldCorn1975';
data.Wwb = 32.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'LokeJohn1990';
data.Wwi = 1099.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 1206.5; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 29/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'CaldCorn1975';   
 temp.Ri = metaData.T_typical;   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
9.5 4.698898187;
15.5 6.214465012;
22 6.811643834;
30.5 7.552228046;
40.5 8.488797237;
50.5 9.355904837;
56 9.19945649]; 
data.tW(:,2) = data.tW(:,2).^3; % convert weight^(1/3) to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Rudo1978';
  
% timee-weight for embryo
data.tWwe = ... % weight (g) at age (dpf) 
[6	0.138;
12	2.57;
18	12.57];
units.tWwe   = {'dpf', 'g'};  label.tWwe = {'time since fertilization', 'wet weight'};  
temp.tWwe    = C2K(37.5);  units.temp.tWwe = 'K'; label.temp.tWwe = 'temperature';
bibkey.tWwe = 'Prin1969';

% timee-length for embryo
data.tLe = [ ... % length (mm) at age (dpf)
 4	  6;
 6	  8.2;
 8	 27;
10	 35;
13	 44;
15	 52;
17	 67;
19	 89;
22	101;
25	120];
data.tLe(:,2) = data.tLe(:,2)./10; % convert mm to cm
units.tLe   = {'dpf', 'cm'};  label.tLe = {'time since fertilization', 'length'};  
temp.tLe    = C2K(37.5);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'CaldSnar1974';
subtitle = 'Embryo development';

% wet weight male and female
% fresh egg	49,3	49,3
data.tW_fm = [... % time after hatching, wet weight (g) female and male
0	45.5        45.5;
3.5	32.4        32.4;
9.5	115.3       92.5;
15.5	265     215;
22      288.9   343.2;
30.5	401.2	460.3;
40.5	575     648.4;
50.5    774.3	863.9;
56      740     817.1];
units.tW_fm ={'d', 'g'} ; label.tW_fm = {'time since hatching', 'wet weight'};
temp.tW_fm = metaData.T_typical; units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'LokeJohn1990'; treat.tW_fm = {1, {'female','male'}};
comment.tW_fm = 'Data from the wild';

% cumulative reproduction over 7 years
data.tN = [...
    47 16 25 10 18 20 5; % # days after 14. April per year
    9 17 26 36 46 57 68]'; 
%     0 9 8 9 10 10 11 11]'; 
% 14.04. is the 104th day of the year
data.tN(:,1) = data.tN(:,1) + ([1 2 3 4 5 6 7]*365)';  % age
units.tN ={'d', '#'} ; label.tN = {'time since hatching', '# eggs'};
temp.tN = metaData.T_typical; units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'KrapDoty1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = weights.tW_fm * 2;
weights.tWwe = weights.tWwe * 2;
weights.tW = weights.tW * 2;
weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 8;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Discussion points
D1 = 'mod_2: males are assumed to differ from females by {p_Am} only';
D2 = 'mod_3: food availability taken variable in tW and tW_fm  data';
D3 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'DGP6'; % Cat of Life
metaData.links.id_ITIS = '175063'; % ITIS
metaData.links.id_EoL = '45510559'; % Ency of Life
metaData.links.id_Wiki = 'Anas_platyrhynchos'; % Wikipedia
metaData.links.id_ADW = 'Anas_platyrhynchos'; % ADW
metaData.links.id_Taxo = '52161'; % Taxonomicon
metaData.links.id_WoRMS = '148791'; % WoRMS
metaData.links.id_avibase = '85625D75F2524457'; % avibase
metaData.links.id_birdlife = 'mallard-anas-platyrhynchos'; % birdlife
metaData.links.id_AnAge = 'Anas_platyrhynchos'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anas_platyrhynchos}}';
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
bibkey = 'CaldCorn1975'; type = 'Article'; bib = [ ... 
'author = {Caldwell, Patrick J. and Cornwell, George W.}, ' ... 
'year = {1975}, ' ...
'title = {Incubation Behavior and Temperatures of the Mallard Duck}, ' ...
'journal = {The Auk}, ' ...
'volume = {92 (4)}, ' ...
'pages = {706--731}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaldSnar1974'; type = 'Article'; bib = [ ... 
'author = {Caldwell, Patrick J. and Snart, Allen E.}, ' ... 
'year = {1974}, ' ...
'title = {A Photographic Index for Aging Mallard Embryos}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {38 (2)}, ' ...
'pages = {298--301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm1977'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Ostrich to Ducks.}, ' ...
'sereis = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'publisher = {Oxford University Press} ,' ...
'address = {Oxford} , ' ...
'volume = {I}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MagaCost2009'; type = 'Article'; bib = [ ... 
'author = {de Magalhaes, J. P. and Costa, J.}, ' ... 
'year = {2009}, ' ...
'title = {A database of vertebrate longevity records and their relation to other life-history traits.}, ' ...
'journal = {Journal of Evolutionary Biology}, ' ...
'volume = {22}, ' ...
'pages = {1770--1774}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LokeJohn1990'; type = 'Article'; bib = [ ... 
'author = {Lokemoen, J. T. and Johnson, D. H. and Sharp, D. E.}, ' ... 
'year = {1990}, ' ...
'title = {Weights of wild mallard Anas platyrhynchos, gadwall A. strepera, and blue-winged teal A. discors during the breeding season.}, ' ...
'journal = {Wildfowl}, ' ...
'volume = {41}, ' ...
'pages = {122--130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Prin1969'; type = 'Article'; bib = [ ... 
'author = {Prince, Harold H.  and Siegel, P. B. and Cornwell, George W.}, ' ... 
'year = {1969}, ' ...
'title = {Incubation Environment and the Development of Mallard Embryos}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {33 (3)}, ' ...
'pages = {589--595}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rudo1978'; type = 'Book'; bib = [ ... 
'author = {Rudolph, W.}, ' ... 
'year = {1978}, ' ...
'title = {Die Hausenten}, ' ...
'publisher = {A. Ziemsen-Verlag}, ' ...
'address = {Wittenberg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition.}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KrapDoty1979'; type = 'Article'; bib = [ ... 
'author = {Krapu, Gary L. and Doty, Harold A.}, ' ... 
'year = {1979}, ' ...
'title = {Age-related aspects of Mallard reproduction}, ' ...ru
'journal = {Wildfowl}, ' ...
'volume = {30}, ' ...
'pages = {35--39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=85625D75F2524457&sec=lifehistory}}';
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


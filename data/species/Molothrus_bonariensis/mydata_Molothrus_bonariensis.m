function [data, auxData, metaData, txtData, weights] = mydata_Molothrus_bonariensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Icteridae';
metaData.species    = 'Molothrus_bonariensis'; 
metaData.species_en = 'Shiny cowbird';

metaData.ecoCode.climate = {'A', 'Cfa', 'D'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tnpo'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2020 05 17];              
metaData.email_mod_1 = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2022 08 13];              
metaData.email_mod_2 = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 03];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 11];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.author_mod_5   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_5     = [2023 07 13];              
metaData.email_mod_5    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_5  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 13];

%% set data
% zero-variate data

data.ab = 11.5;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Katt1996';   
  temp.tx = C2K(41.6);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 320;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.5;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Katt1996';
data.Wwi = 47;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'TuerFior2012';
data.Wwim = 51;        units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'TuerFior2012';

data.Ri  = 17/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'TuerFior2012';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15 to 20 eggs per season';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.897	5.063
1.896	7.710
2.928	11.016
3.910	18.168
4.908	22.573
5.941	29.395
6.889	31.602
7.955	38.205
8.920	42.170
9.918	42.399
10.900	46.364
11.915	42.417];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', '1 per nest of Troglodytes aedon'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Katt1996';
comment.tW = 'one chick per nest of Troglodytes aedon';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.012	3.800
0.959	6.785
1.966	12.199
2.972	18.361
3.995	22.467
4.985	29.377
5.989	38.031
6.998	41.078
8.026	38.081
9.036	39.694
10.015	40.187];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', '1 per nest of Zonotrichia_capensis'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'King1973';
comment.tW1 = 'one chick per nest of Zonotrichia_capensis';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.028	3.551
1.007	5.476
2.000	8.399
2.992	12.567
3.999	17.483
4.991	21.153
6.031	24.635
7.007	28.804
8.033	29.981
9.026	32.841
10.022	31.277];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '2 per nest of Zonotrichia_capensis'};  
temp.tW2    = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'King1973';
comment.tW2 = 'two chicks per nest of Zonotrichia_capensis';
%
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.000	3.918
1.010	5.878
2.018	9.796
2.984	14.327
3.992	19.224
4.959	24.612
5.989	29.388
6.997	33.061
7.983	36.122
9.011	37.959
10.018	39.429
11.002	40.041];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'MarsMahl2010';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)-0.020	3.666
0.000	4.653
0.968	7.592
1.933	11.143
2.963	16.041
4.016	22.041
4.983	28.163
5.992	33.796
6.915	38.571
7.966	42.000
8.994	44.082
9.958	45.796
11.007	46.531];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'MarsMahl2010';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW','tW1','tW2'}; subtitle2 = {'1/nest of T.aedon, 1,2/nest of Z.capensis'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperature acceleration is assumed';
D2 = 'scaled functional response in tW data turned out to vary, which has been implemented';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_2: data tW1 and tW2 added';
D5 = 'mod_3: v is reduced';
D6 = 'mod_4: males have equal state variables at b, compared to females';
D7 = 'mod_5: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7);

%% Facts
F1 = 'Obligate brood parasite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43YJJ'; % Cat of Life
metaData.links.id_ITIS = '179117'; % ITIS
metaData.links.id_EoL = '45511157'; % Ency of Life
metaData.links.id_Wiki = 'Molothrus_bonariensis'; % Wikipedia
metaData.links.id_ADW = 'Molothrus_bonariensis'; % ADW
metaData.links.id_Taxo = '58465'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'AA7798040CC37113'; % avibase
metaData.links.id_birdlife = 'shiny-cowbird-molothrus-bonariensis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Molothrus_bonariensis}}';
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
bibkey = 'Katt1996'; type = 'Article'; bib = [ ...  
'title = {GROWTH AND PROVISIONING OF SHINY COWBIRD AND HOUSE WREN HOST NESTLINGS}, ' ...
'journal = {J. Field Ornithol.}, ' ...
'year = {1996}, ' ...
'author = {Gustavo H. Kattan}, ' ...
'volume = {67}, ' ...
'pages = {434-441}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TuerFior2012'; type = 'Article'; bib = [ ... 
 'doi = {10.1111/j.1600-048X.2012.05596}, ' ...
'title = {Shiny cowbird  \emph{Molothrus bonariensis} egg size and chick growth vary between two hosts that differ markedly in body size}, ' ...
'journal = {Journal of Avian Biology}, ' ...
'year = {2012}, ' ...
'author = {Diego T. Tuero and Vanina D. Fiorini and Bettina Mahler and  Juan C. Reboreda}, ' ...
'volume = {43}, ' ...
'pages = {227-233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarsMahl2010'; type = 'Article'; bib = [ ...  
'title = {Reproductive Success and Nestling Growth of the Baywing Parasitized by Screaming and Shiny Cowbirds}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'year = {2010}, ' ...
'author = {Mar\''{i}a C. de M\''{a}rsico and Bettina Mahler and Juan C. Reboreda}, ' ...
'volume = {122}, ' ...
'pages = {417-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'King1973'; type = 'article'; bib = [ ...  
'title = {Reproductive Relationships of the Rufous-Collared Sparrow and the Shiny Cowbird}, ' ...
'journal = {The Auk}, ' ...
'year = {1973}, ' ...
'author = {James R. King}, ' ...
'volume = {90(1)}, ' ...
'pages = {19-34}, ' ...
'address = {Wittenberg Lutherstadt}'];
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


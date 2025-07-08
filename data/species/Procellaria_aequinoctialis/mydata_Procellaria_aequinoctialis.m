function [data, auxData, metaData, txtData, weights] = mydata_Procellaria_aequinoctialis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Procellaria_aequinoctialis'; 
metaData.species_en = 'White-chinned petrel'; 

metaData.ecoCode.climate = {'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC', 'MS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 58.9;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Hall1987';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55 to 65 d';
data.tx = 98.1; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Hall1987';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 294.3; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 120;  units.Ww0 = 'g'; label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 92.6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Hall1987';
data.Wwi = 1280;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 1390; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'avibase';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0        92.6
1.048	113.457
5.770	247.984
11.129	382.483
16.261	483.309
21.012	685.203
25.960	853.405
31.121	1021.597
36.267	1156.106
40.932	1155.899
45.831	1206.209
51.166	1285.972
56.102	1424.701
61.002	1479.220
65.687	1525.329
71.188	1495.611
76.099	1575.393
80.782	1617.291
86.008	1440.217
90.821	1288.425
95.670	1220.842];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Bird Island, South Georgia (1986)'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Hall1987';
comment.tW = 'Data for Bird Island, South Georgia (1986)';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0        92.6
0.986	130.252
6.067	243.697
11.146	369.748
15.806	449.580
20.881	617.647
25.954	802.521
30.817	974.790
36.106	1117.647
40.967	1306.723
45.835	1424.370
50.923	1474.790
56.221	1537.815
60.884	1588.235
65.966	1693.277
71.046	1810.924
75.933	1752.101];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Bird Island, South Georgia (1977)'};  
temp.tW1    = C2K(39.4);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Hall1987';
comment.tW1 = 'Data for Bird Island, South Georgia (1977)';

%% set weights for all real data
weights = setweights(data, []);
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
set1 = {'tW1','tW'}; subtitle1 = {'Data for Bird Island (S. Georgia) 1977, 1986'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Body temperature is guessed';
D3 = 'Males as assumed to differ from females by {p_Am} only';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4MMPZ'; % Cat of Life
metaData.links.id_ITIS = '174610'; % ITIS
metaData.links.id_EoL = '45511296'; % Ency of Life
metaData.links.id_Wiki = 'Procellaria_aequinoctialis'; % Wikipedia
metaData.links.id_ADW = 'Procellaria_aequinoctialis'; % ADW
metaData.links.id_Taxo = '51565'; % Taxonomicon
metaData.links.id_WoRMS = '212651'; % WoRMS
metaData.links.id_avibase = '35EB45A0494AEE57'; % avibase
metaData.links.id_birdlife = 'white-chinned-petrel-procellaria-aequinoctialis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procellaria_aequinoctialis}}';
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
bibkey = 'Hall1987'; type = 'Article'; bib = [ ... 
'author = {Hall, A. J.}, ' ... 
'doi = {10.1111/j.1469-7998.1987.tb05959.x}, ' ...
'year = {1987}, ' ...
'title = {The breeding biology of the white-chinned petrel \emph{Procellaria aequinoctialis} at {S}outh {G}eorgia}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {212}, ' ...
'number = {4}, ' ...
'pages = {605-617}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=72CC23D6D8E086EB&sec=lifehistory}}';
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


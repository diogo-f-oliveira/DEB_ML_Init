function [data, auxData, metaData, txtData, weights] = mydata_Gypaetus_barbatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Gypaetus_barbatus'; 
metaData.species_en = 'Bearded vulture'; 

metaData.ecoCode.climate = {'BW', 'Cs', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa','THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTht'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 55.75;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 107.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature'; 
data.tp = 322.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tR = 7*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 224;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';           bibkey.Ww0 = 'avibase';
data.Wwb = 125;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ZwarHage1991';
data.Wwi = 6175; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 5075; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.366	125.827
3.169	126.004
4.972	126.181
8.592	252.273
12.197	252.628
17.627	441.766
23.964	678.145
26.689	867.018
28.494	882.912
31.684	1197.567
36.669	1433.813
38.516	1826.923
41.671	1827.232
42.144	2031.601
50.332	2692.523
52.134	2692.700
53.078	3070.003
57.587	3086.163
60.786	3479.405
65.405	4470.035
66.246	3935.737
67.659	4470.257
70.389	4706.281
71.275	4564.915
72.208	4847.914
74.479	5005.308
78.154	5618.636
79.466	5257.271
81.313	5650.380
84.489	5839.297
86.734	5760.932
89.014	5996.913
92.169	5997.222
93.940	5714.489
97.109	5840.537
99.415	6312.276
103.039	6469.803
107.578	6753.156
109.372	6674.747
109.388	6816.202
110.738	6800.618
113.925	7083.838
115.272	7036.820
115.731	7115.450
117.539	7162.779
119.337	7115.804
121.582	7037.439
122.946	7147.593
123.855	7210.551
125.645	7100.707
127.001	7132.274
128.349	7100.973
131.517	7211.303
131.966	7195.630
131.975	7274.217
133.777	7274.394
137.364	7101.858
137.821	7164.771
139.165	7086.318
141.418	7086.539
143.647	6866.719
143.658	6961.022
146.353	6882.702
151.726	6568.888
156.705	6757.982];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZwarHage1991';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature guessed';
D2 = 'Relative food intake reduced just before fledging';     
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6KVBQ'; % Cat of Life
metaData.links.id_ITIS = '175483'; % ITIS
metaData.links.id_EoL = '45515786'; % Ency of Life
metaData.links.id_Wiki = 'Gypaetus_barbatus'; % Wikipedia
metaData.links.id_ADW = 'Gypaetus_barbatus'; % ADW
metaData.links.id_Taxo = '52455'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '81DB7410BE70406B'; % avibase
metaData.links.id_birdlife = 'bearded-vulture-gypaetus-barbatus'; % birdlife
metaData.links.id_AnAge = 'Gypaetus_barbatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gypaetus_barbatus}}';
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
bibkey = 'ZwarHage1991'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1975.9639381}, ' ...
'author = {Von Peer Zwart and M. H. van der Hage and F. J. M. van Rest and J. W. W. Louwman}, ' ... 
'year = {1991}, ' ...
'title = {Handraising a bearded vulture \emph{Gypaetus barbatus}, with the aid of a commercial cat-food}, ' ...
'journal = {Zool. Garten N. F.}, ' ...
'volume = {61(3)}, ' ...
'pages = {149--156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Gypaetus_barbatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=81DB7410BE70406B&sec=lifehistory}}';
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


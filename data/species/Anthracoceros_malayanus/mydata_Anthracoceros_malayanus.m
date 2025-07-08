function [data, auxData, metaData, txtData, weights] = mydata_Anthracoceros_malayanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Bucerotiformes'; 
metaData.family     = 'Bucerotidae';
metaData.species    = 'Anthracoceros_malayanus'; 
metaData.species_en = 'Black hornbill'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Kemp1995';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 50;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Kemp1995';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 50*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 65;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'WitmLaGr2020';
data.Wwi = 1050; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2.4/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 eggs per clutch, 1 cutch each 2 yr'; 

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.526	69.872
5.035	96.434
8.193	151.181
11.351	205.927
13.982	288.933
16.439	442.105
18.895	539.203
21.000	678.505
22.579	747.934
23.632	887.678
25.211	901.033
25.912	984.850
27.842	1166.281
29.772	1403.788
31.000	1445.327
31.877	1585.145
33.105	1654.722
35.211	1794.024
36.088	2017.954
36.965	1947.491
38.368	2045.032
40.298	2142.351
41.877	2450.098
43.105	2183.227
44.509	2378.898
46.088	2364.216
48.018	2699.853
49.772	2474.816
50.825	2726.709
53.982	2865.568
54.860	2921.274
56.614	2906.518
57.316	3018.372
58.544	2625.332
60.825	3269.233
61.702	2553.911
62.930	3086.104
63.982	2847.344
65.912	2874.570
66.614	2776.144
67.316	3364.634
69.246	3069.429
71.175	3236.842
71.702	3096.434
72.579	3138.121
74.684	3081.161
75.386	3739.744
77.491	3108.018
79.772	3079.021
81.000	3569.159
81.702	3022.135
82.404	3288.195
84.333	2418.224
85.561	3286.867
87.667	3117.757
88.368	2388.490
89.596	3130.964
91.351	3088.170
92.579	3283.915
93.281	2442.499];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WitmLaGr2020';
  
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
txtData.comment = comment;

%% Discussion points
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5VGSC'; % Cat of Life
metaData.links.id_ITIS = '554422'; % ITIS
metaData.links.id_EoL = '1048411'; % Ency of Life
metaData.links.id_Wiki = 'Anthracoceros_malayanus'; % Wikipedia
metaData.links.id_ADW = 'Anthracoceros_malayanus'; % ADW
metaData.links.id_Taxo = '72974'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '6DC62BCF7C45C97C'; % avibase
metaData.links.id_birdlife = 'black-hornbill-anthracoceros-malayanus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anthracoceros_malayanus}}';
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
bibkey = 'WitmLaGr2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Patricia Witman and Nicole LaGreco}, ' ... 
'year = {2020}, ' ...
'title = {Hornbills, Kingfishers, Hoopoes, and Bee-eaters}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {549-565}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=6DC62BCF7C45C97C&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kemp1995'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kemp, Alan}, ' ...
'year = {1995}, ' ...
'title  = {The hornbills}, ' ...
'publisher = {Oxford Univ. Presse}'];
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


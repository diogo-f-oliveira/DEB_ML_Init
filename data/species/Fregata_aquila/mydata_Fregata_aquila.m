function [data, auxData, metaData, txtData, weights] = mydata_Fregata_aquila
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Fregatidae';
metaData.species    = 'Fregata_aquila'; 
metaData.species_en = 'Ascension frigatebird'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0xTf', '0iMi', 'xiFl', 'xiFp'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 44;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 154;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 462;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1826;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on F. minor';
data.am = 27.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Fregata minor';

data.Ww0 = 75.7;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 60;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'StonSton1963';
data.Wwi = 1250; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = {'wiki','StonSton1963'};

data.Ri  = 0.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per cluitch, 1 clutch each 2 yrs';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (wk) weight (g)
0.207	60.617
0.213	50.920
1.438	55.832
1.445	43.711
2.413	68.004
2.422	53.459
3.142	80.163
3.400	60.783
3.887	68.081
4.607	94.785
4.860	82.677
5.558	145.743
6.797	128.838
7.283	136.136
8.054	80.418
10.664	230.857
12.639	213.990
14.556	291.665
14.579	255.303
15.082	235.935
16.314	228.726
17.776	248.196
17.785	233.651
18.170	405.792
18.185	381.551
20.431	323.486
21.673	301.732
22.148	328.423
22.660	294.510
22.831	415.731
23.334	396.364
23.383	316.366
26.330	316.519
27.447	498.396
28.958	437.868
30.029	292.469
31.604	527.702
33.176	367.784
34.190	716.928
35.692	670.945
37.597	368.014
38.937	586.265
42.908	518.593
50.135	749.271
51.903	669.363
55.736	827.138
55.936	902.300
63.249	992.377
64.012	948.780
65.559	830.072
66.464	956.180
74.047	1007.483
75.246	1053.606
78.936	1044.101];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'StonSton1963';
  
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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6JM8K'; % Cat of Life
metaData.links.id_ITIS = '174768'; % ITIS
metaData.links.id_EoL = '45513568'; % Ency of Life
metaData.links.id_Wiki = 'Fregata_aquila'; % Wikipedia
metaData.links.id_ADW = 'Fregata_aquila'; % ADW
metaData.links.id_Taxo = '51727'; % Taxonomicon
metaData.links.id_WoRMS = '343998'; % WoRMS
metaData.links.id_avibase = '00E090F87F64DBDB'; % avibase
metaData.links.id_birdlife = 'ascension-frigatebird-fregata-aquila'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fregata_aquila}}';
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
bibkey = 'StonSton1963'; type = 'Article'; bib = [ ... 
'author = {Stonehouse, B. and Stonehouse, S.}, ' ... 
'doi = {10.1111/j.1474-919x.1963.tb06763.x}, ' ...
'year = {1963}, ' ...
'title = {THE FRIGATE BIRD \emph{Fregata aquila} OF {A}SCENSION {I}SLAND}, ' ...
'journal = {Ibis}, ' ...
'volume = {103b(3)}, ' ...
'pages = {409–422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=00E090F87F64DBDB&sec=lifehistory}}';
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


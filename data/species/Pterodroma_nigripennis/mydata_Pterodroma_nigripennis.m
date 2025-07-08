function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_nigripennis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_nigripennis'; 
metaData.species_en = 'Black-winged petrel'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 45.3;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HuttPrid2002';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 85; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HuttPrid2002';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 255; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '2 to 3 yr';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = ': at least 16 yr';

data.Wwb = 33; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HuttPrid2002';
data.Wwi = 350; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'HuttPrid2002';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower: 200 g (sealifebase)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.111	33.394
0.911	30.125
2.112	30.148
3.919	42.775
5.925	54.310
7.929	60.918
9.134	70.248
10.134	66.982
11.135	65.907
12.953	112.475
14.056	117.970
14.855	112.511
15.952	100.489
16.951	95.034
17.854	98.883
19.757	101.110
20.858	102.226
21.765	118.667
23.871	130.751
24.983	161.430
25.982	155.975
26.985	161.468
27.981	145.612
28.987	158.222
29.989	160.979
30.988	154.429
31.790	159.371
33.197	174.180
34.094	162.153
34.997	167.645
36.107	193.944
37.211	202.724
37.909	195.074
39.018	216.993
41.128	239.479
41.924	223.618
43.024	219.807
43.827	226.940
45.029	227.510
45.928	222.601
47.031	227.549
48.127	211.147
49.028	211.712
51.138	234.198
52.237	227.102
53.037	224.380
55.338	220.593
56.239	219.515
57.145	234.861
58.148	238.713
59.151	244.207
60.246	227.257
62.054	244.263
63.158	251.401
63.858	250.320
65.057	243.226
65.958	243.243
68.054	223.576
69.054	218.668
70.267	253.728
71.066	247.174
72.166	243.363
73.065	236.264
74.266	237.929
74.967	236.301
76.073	250.556
79.163	209.009
80.062	203.552
81.060	194.812
83.261	191.023
84.059	181.184
85.059	177.919];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'HuttPrid2002';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'Body temperature of Oceanodroma furcata (Youn2013), but that of chick down to 10 C';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4PWKY'; % Cat of Life
metaData.links.id_ITIS = '174580'; % ITIS
metaData.links.id_EoL = '45512124'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_nigripennis'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_nigripennis'; % ADW
metaData.links.id_Taxo = '51551'; % Taxonomicon
metaData.links.id_WoRMS = '225963'; % WoRMS
metaData.links.id_avibase = 'AE186136E0A1282A'; % avibase
metaData.links.id_birdlife = 'black-winged-petrel-pterodroma-nigripennis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_nigripennis}}';
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
bibkey = 'HuttPrid2002'; type = 'Article'; bib = [ ... 
'author = {I. Hutton and D. Priddel}, ' ... 
'year = {2002}, ' ...
'title = {Breeding  biology  of the  Black-winged  Petrel, \emph{Pterodroma nigripennis}, on {L}ord {H}owe {I}sland}, ' ...
'journal = {Emu}, ' ...
'volume = {102}, ' ...
'number = {1}, ' ...
'pages = {361-365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Pterodroma-nigripennis.html}}';
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


function [data, auxData, metaData, txtData, weights] = mydata_Puffinus_assimilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Puffinus_assimilis'; 
metaData.species_en = 'Little shearwater'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MS', 'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 07 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2018 09 14];              
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

data.ab = 55;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '52 till 58';
data.tx = 75; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'KarpPaul2008';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 225; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Puffinus puffinus';
data.am = 50.9*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Puffinus puffinus';

data.Wwb = 30; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KarpPaul2008';
data.Wwi = 300; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KarpPaul2008';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.657	32.571
1.797	28.000
2.700	36.000
3.718	41.714
4.963	48.571
5.752	57.714
6.773	60.000
7.899	73.714
8.695	73.143
9.941	78.286
10.846	83.429
11.859	96.571
12.764	101.143
13.674	100.000
14.804	108.571
15.594	115.429
16.731	114.857
17.637	118.857
18.645	138.286
19.674	130.286
20.689	140.000
21.707	146.857
22.723	156.000
23.633	154.857
24.654	157.143
25.666	170.857
26.683	178.857
27.592	178.857
28.943	195.429
29.611	213.143
30.403	218.286
31.654	216.571
32.558	223.429
33.691	228.000
34.596	233.714
35.723	245.143
36.405	245.143
37.198	248.571
38.667	259.429
39.802	261.714
40.937	263.429
42.065	274.857
42.529	261.714
43.428	274.857
44.552	290.857
45.690	289.714
46.610	274.857
47.860	274.857
48.884	272.571
49.799	265.143
50.701	274.857
51.594	296.000
52.524	268.000
53.902	249.143
54.799	265.714
55.271	241.714
56.496	274.857
57.755	263.429
58.423	281.714
59.453	272.000
60.344	296.000
61.610	274.286
62.403	278.286
63.318	270.857
64.566	272.571
65.498	242.857
66.514	252.000
67.550	233.714
68.674	249.714
69.482	233.714
71.408	241.143
72.326	230.286
74.695	252.571
75.270	244.000];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KarpPaul2008';
  
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
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4QFXC'; % Cat of Life
metaData.links.id_ITIS = '174559'; % ITIS
metaData.links.id_EoL = '45512132'; % Ency of Life
metaData.links.id_Wiki = 'Puffinus_assimilis'; % Wikipedia
metaData.links.id_ADW = 'Puffinus_assimilis'; % ADW
metaData.links.id_Taxo = '51593'; % Taxonomicon
metaData.links.id_WoRMS = '137200'; % WoRMS
metaData.links.id_avibase = '0205EDC6B0E54046'; % avibase
metaData.links.id_birdlife = 'little-shearwater-puffinus-assimilis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Puffinus_assimilis}}';
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
bibkey = 'KarpPaul2008'; type = 'Incollection'; bib = [ ... 
'author = {Karpouzi, V.S. and Pauly, D.}, ' ... 
'year = {2008}, ' ...
'title = {Life history patterns in marine birds}, ' ...
'publisher = {Fisheries Centre, University of British Columbia }, ' ...
'issn = {1198-6727}, ' ...
'editor = {Palomares, M.L.D. and Pauly, D.}, ' ...
'booktitle = {Von Bertalanffy Growth Parameters of Non-Fish Marine Organisms}, ' ...
'series = {Fisheries Centre Research Reports}, ' ...
'volume = {16(10)}, ' ...
'pages = {27--53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puffinus_puffinus}}';
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


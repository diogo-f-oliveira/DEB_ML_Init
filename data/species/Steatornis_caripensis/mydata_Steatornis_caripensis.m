function [data, auxData, metaData, txtData, weights] = mydata_Steatornis_caripensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Steatornithiformes'; 
metaData.family     = 'Steatornithidae';
metaData.species    = 'Steatornis_caripensis'; 
metaData.species_en = 'Oilbird'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 32;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Cornell';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '32-45 d; temp is guessed';
data.tx = 105;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ThomBosq1993';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '95-120 d';
data.tp = 315;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '95-120 d';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 14;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ThomBosq1993';
  comment.Wwb= '13-15 g';
data.Wwi = 415;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ThomBosq1993';
  comment.Wwi = 'Nestlings can weigh 600 g';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...  % weight (g) at age (d)
0.969	17.822
5.008	34.331
5.816	34.321
7.108	35.578
8.078	53.400
8.885	47.021
9.855	55.925
10.824	39.353
11.632	77.559
12.601	62.260
17.124	94.049
19.709	125.864
20.517	125.853
20.679	185.724
20.840	162.792
21.648	190.807
21.809	133.480
21.971	162.777
23.748	167.850
23.910	206.065
26.656	208.578
26.817	265.900
31.664	232.718
34.572	251.789
36.511	371.509
37.641	332.005
37.642	400.794
40.226	393.118
42.649	289.903
43.457	488.618
46.527	464.375
48.465	340.784
51.373	382.785
51.374	542.021
53.473	400.593
55.250	433.691
56.543	483.356
57.674	547.036
59.451	531.727
60.582	522.795
71.567	623.292
77.383	572.263
82.876	547.989];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ThomBosq1993';
  
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
D1 = 'Weight decrease prior to fledging is captured by f < 1 since 40 d since birth';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4ZMTD'; % Cat of Life
metaData.links.id_ITIS = '555524'; % ITIS
metaData.links.id_EoL = '45509447'; % Ency of Life
metaData.links.id_Wiki = 'Steatornis_caripensis'; % Wikipedia
metaData.links.id_ADW = 'Steatornis_caripensis'; % ADW
metaData.links.id_Taxo = '54793'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'A820F1653743ABDF'; % avibase
metaData.links.id_birdlife = 'oilbird-steatornis-caripensis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Steatornis_caripensis}}';
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
bibkey = 'ThomBosq1993'; type = 'Article'; bib = [ ... 
'author = {Thomas, D. W. and Bosque, C. and Arends, A.}, ' ... 
'year = {1993}, ' ...
'title = {Development of thermoregulation and energetics of nestling oilbirds (\emph{Steatornis caripensis})}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {66}, ' ...
'pages = {322-348}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cornell'; type = 'Misc'; bib = ...
'howpublished = {\url{https://neotropical.birds.cornell.edu/Species-Account/nb/species/oilbir1/breeding}}';
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


function [data, auxData, metaData, txtData, weights] = mydata_Ara_glaucogularis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Ara_glaucogularis'; 
metaData.species_en = 'Blue-throated macaw'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(41.3); % K, body temp

metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';                        bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at fledging';        bibkey.tx = 'Swit2008';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 360;    units.tp = 'd';    label.tp = 'time since birth at puberty';        bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 22*365;    units.am = 'd';    label.am = 'life span';                       bibkey.am = 'avibase';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 18.0;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Wiki';
data.Wwi = 784;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';              bibkey.Wwi = 'avibase';

data.Ri = 2.4/365/1.5; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';           bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 eggs/clutch; 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.276	21.724
2.933	25.319
6.524	37.937
8.181	52.397
10.391	74.091
12.048	90.362
13.429	119.314
14.948	142.831
16.467	164.537
16.882	184.449
18.263	213.401
19.782	242.350
21.439	273.108
21.991	300.262
22.958	325.599
24.201	358.174
25.720	385.312
26.963	421.510
28.068	432.357
28.896	466.750
29.863	495.708
31.382	519.225
32.487	546.370
33.592	575.326
35.525	607.890
35.801	633.238
37.459	662.185
39.668	698.367
41.464	727.311
41.878	727.305
42.983	749.017
44.640	763.477
46.159	781.561
47.954	790.587
48.092	799.639
50.164	797.794
50.716	817.705
53.755	814.034
54.583	824.886
55.550	812.194
56.793	821.228
58.036	810.343
60.660	797.625
61.350	810.290
63.422	793.958
64.803	799.369
66.322	799.344
67.289	788.463
67.979	784.830
69.360	759.456
70.465	754.005
71.293	763.046
73.089	735.854
74.608	735.830
75.989	726.753
77.370	721.298
78.199	719.474
79.580	712.208
81.099	690.453
82.203	686.814
83.861	675.922
84.827	672.284
85.932	661.401
87.313	650.514
88.694	654.113
90.075	648.658
91.042	634.156
92.147	641.381
93.804	641.354
94.633	643.152
96.290	641.314
97.118	648.544
98.499	650.333
99.742	664.800
100.571	652.110
101.538	652.095
102.642	648.455
103.885	632.137
104.990	639.363
107.062	639.329
108.719	637.492
110.238	639.278
110.928	644.699
111.619	642.877
112.033	646.492];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Swit2008';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'G22C'; % Cat of Life
metaData.links.id_ITIS = '554896'; % ITIS
metaData.links.id_EoL = '1177964'; % Ency of Life
metaData.links.id_Wiki = 'Ara_glaucogularis'; % Wikipedia
metaData.links.id_ADW = 'Ara_glaucogularis'; % ADW
metaData.links.id_Taxo = '70693'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EFF095BDD7739CB2'; % avibase
metaData.links.id_birdlife = 'blue-throated-macaw-ara-glaucogularis'; % birdlife
metaData.links.id_AnAge = 'Ara_glaucogularis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ara_glaucogularis}}';
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
bibkey = 'Swit2008'; type = 'techreport'; bib = [ ... 
'author = {Richard Switzer}, ' ... 
'year = {2008}, ' ...
'title = {Management and breeding of {P}esquet’s Parrots (\emph{Psittrichas fulgidus}) at the Al Wabra Wildlife Preservation}, ' ...
'institute = {Al Wabra Wildlife Preservation}, ' ...
'howpublished = {\url{http://awwp.alwabra.com/wp-content/uploads/2014/04/94-Management-and-captive-breeding-of-Pesquets-Parrots-at-AWWP-ok.pdf}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ara_glaucogularis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ara_glaucogularis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=EFF095BDD7739CB2&sec=lifehistory}}';
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


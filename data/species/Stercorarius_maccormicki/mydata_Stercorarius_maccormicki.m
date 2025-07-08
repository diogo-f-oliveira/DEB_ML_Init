function [data, auxData, metaData, txtData, weights] = mydata_Stercorarius_maccormicki

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Stercorariidae';
metaData.species    = 'Stercorarius_maccormicki'; 
metaData.species_en = 'South polar skua'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iTg', 'xiMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCvb', 'biCvm', 'biSv', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Furn1987';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care.';
data.tx = 49;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Furn1987';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 147;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Furn1987';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.5*265; units.am = 'd';    label.am = 'life span';                bibkey.am = 'npolar';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 65; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Furn1987';
data.Wwi = 1340; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.012	57.883
0.472	69.641
0.776	81.363
1.702	93.229
2.631	97.329
3.863	117.033
4.936	144.468
6.166	168.055
7.082	199.337
7.987	250.033
9.219	269.738
9.977	304.866
11.201	340.102
11.942	410.178
13.466	464.902
14.232	484.498
15.293	535.231
15.745	562.520
17.261	632.776
17.868	660.102
19.082	714.754
20.312	738.342
21.068	777.353
22.127	831.969
23.329	909.918
23.964	882.882
25.186	922.002
25.805	926.029
26.745	910.714
28.227	1046.982
29.182	1000.603
30.267	1004.739
31.324	1063.238
32.594	1009.165
33.185	1067.555
34.230	1149.352
35.284	1211.733
36.065	1204.148
37.722	1301.622
38.081	1208.502
39.152	1239.819
40.380	1267.290
41.208	1166.512
41.995	1147.277
43.025	1256.255
43.951	1268.122
45.080	1186.831
46.114	1288.043
46.945	1183.382
48.002	1241.881
49.383	1273.271];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Furn1987';
  
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
D1 = 'Body temperature only on target after 2 till 3 weeks, as discussed in Kooy2010';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '52D8M'; % Cat of Life
metaData.links.id_ITIS = '660062'; % ITIS
metaData.links.id_EoL = '45510692'; % Ency of Life
metaData.links.id_Wiki = 'Stercorarius_maccormicki'; % Wikipedia
metaData.links.id_ADW = 'Stercorarius_maccormicki'; % ADW
metaData.links.id_Taxo = '947074'; % Taxonomicon
metaData.links.id_WoRMS = '422607'; % WoRMS
metaData.links.id_avibase = '7D1A9D5CCCDC597C'; % avibase
metaData.links.id_birdlife = 'south-polar-skua-catharacta-maccormicki'; % birdlife
metaData.links.id_AnAge = 'Stercorarius_maccormicki'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stercorarius_maccormicki}}';
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
bibkey = 'Furn1987'; type = 'Book'; bib = [ ... 
'author = {Furness, R. W.}, ' ... 
'year = {1987}, ' ...
'title = {The skuas.}, ' ...
'publisher = {T. \& A.D. Poyser}, ' ...
'address = {Calton}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Stercorarius_maccormicki}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'npolar'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.npolar.no/en/species/long-tailed-skua.html}}';
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


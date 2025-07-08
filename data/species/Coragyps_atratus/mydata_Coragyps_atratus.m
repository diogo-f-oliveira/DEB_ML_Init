function [data, auxData, metaData, txtData, weights] = mydata_Coragyps_atratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cathartiformes'; 
metaData.family     = 'Cathartidae';
metaData.species    = 'Coragyps_atratus'; 
metaData.species_en = 'Black vulture'; 

metaData.ecoCode.climate = {'A','BSk','Cf'};
metaData.ecoCode.ecozone = {'TN','THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm','Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm', 'biSvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];


%% set data
% zero-variate data

data.ab = 42;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '37-48 d, AnAge: 35 d';
data.tx = 93;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 279;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 8*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 103;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 70;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 2080; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0.014	129.455
 0.307	98.238
 2.682	134.217
 2.777	102.978
 3.574	161.103
 4.853	125.531
 5.153	156.814
 5.159	205.922
 7.930	250.874
 8.730	331.321
 8.821	273.295
 8.912	206.341
10.009	295.749
10.298	233.282
11.008	385.146
11.102	344.978
14.767	439.137
14.776	510.567
14.870	470.399
17.055	577.786
18.769	868.155
18.851	729.772
20.909	591.609
20.923	716.610
21.610	676.508
23.593	739.230
23.894	783.906
26.566	824.383
26.695	1083.326
26.875	931.560
28.562	998.713
28.756	967.484
30.463	1204.282
30.850	1137.361
30.851	1137.361
32.518	1048.261
32.524	1092.905
32.647	1302.740
33.627	1235.885
33.696	981.429
33.718	1168.931
35.784	1102.197
39.570	1379.405
39.576	1432.978
39.637	1111.556
39.781	1495.501
42.068	1620.756
45.625	1639.010
45.713	1549.734
45.742	1790.809
45.830	1701.533
45.905	1496.184
47.716	1782.100
47.904	1697.300
47.919	1822.302
51.672	1827.185
51.679	1885.221
52.344	1657.617
52.744	1706.769
54.766	2099.852
57.605	1885.883
58.988	1890.501
59.863	1765.599
61.886	2172.075
64.711	1842.033
64.832	2029.546
65.400	1824.253
65.809	1935.905
65.899	1868.951
70.546	1905.184
70.955	2025.765
71.933	1941.053
77.563	1946.146
79.242	1946.333
79.250	2017.763
79.878	2316.940];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'hand-reared'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ColeFras1989';

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
D1 = 'body temperature is guessed';
D2 = 'males are assumed not to differ from females';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1= 'uses urohidrosis, defecating on its legs, to lower its body temperature; lacks a voice box';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'Y9SZ'; % Cat of Life
metaData.links.id_ITIS = '175272'; % ITIS
metaData.links.id_EoL = '45511378'; % Ency of Life
metaData.links.id_Wiki = 'Coragyps_atratus'; % Wikipedia
metaData.links.id_ADW = 'Coragyps_atratus'; % ADW
metaData.links.id_Taxo = '52307'; % Taxonomicon
metaData.links.id_WoRMS = '159147'; % WoRMS
metaData.links.id_avibase = '4FF7DE80F4192276'; % avibase
metaData.links.id_birdlife = 'american-black-vulture-coragyps-atratus'; % birdlife
metaData.links.id_AnAge = 'Coragyps_atratus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coragyps_atratus}}';
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
bibkey = 'ColeFras1989'; type = 'Article'; bib = [ ... 
'author = {John S. Coleman and James D. Fraser}, ' ... 
'year = {1989}, ' ...
'title = {Age Estimation and Growth of Black and Turkey Vultures (Estimativos de la Edad y el Crecimiento de Coragyps atratus y Cathartes aura)}, ' ...
'journal = {Journal of Field Ornithology}, ' ...
'volume = {60(2)}, ' ...
'pages = {197-208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Coragyps_atratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4FF7DE80F4192276&sec=lifehistory}}';
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


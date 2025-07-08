function [data, auxData, metaData, txtData, weights] = mydata_Desmodus_rotundus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Phyllostomidae';
metaData.species    = 'Desmodus_rotundus'; 
metaData.species_en = 'Vampire bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiTvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 189;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from RaceSwif81';
data.tx = 274;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki: 18-25 d';
data.tp = 285;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 29.2*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(34);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 5.8;   units.Li  = 'cm';  label.Li  = 'ultimate forearm-length';    bibkey.Li  = 'Schm1978';

data.Wwb = 4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Schm1978';
data.Wwi = 33.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.141	2.205
4.345	4.348
16.447	9.126
21.668	10.413
24.093	7.474
27.856	10.475
28.334	9.740
31.974	10.353
33.043	11.088
36.116	10.721
40.231	10.538
40.313	12.130
41.404	13.294
43.927	12.253
45.059	14.213
49.790	15.989
52.914	16.602
54.363	14.704
55.995	16.357
58.028	15.807
58.591	16.725
62.718	16.787
67.389	17.400
69.469	17.768
72.069	18.197
73.062	17.462
74.150	18.565
79.307	18.627
79.908	20.280
84.573	20.771
87.084	19.485
88.159	20.343
93.911	21.935
94.332	20.099
101.656	22.182
104.201	21.570
107.949	24.264
111.472	22.612
116.721	24.450
117.098	21.756
123.827	22.308
124.368	22.798
131.603	23.167
134.209	23.718
137.814	23.657
139.933	24.760
146.065	23.720
147.153	24.822
152.848	25.313
153.806	23.905
160.495	23.661
161.102	25.437
167.262	24.948
170.911	25.745
172.853	23.419
175.519	25.133
183.760	25.012
185.933	27.156
192.112	27.034
193.526	24.463
196.308	28.443
196.669	25.443
203.544	28.812
208.519	25.323
211.273	28.752
213.588	23.671
218.316	25.386
222.126	29.305
226.652	27.102
232.259	25.878
233.343	26.919
244.241	28.329
244.724	27.717
253.566	29.249
254.898	25.086
260.799	29.556
266.235	25.027
271.712	31.273
276.105	26.498
280.342	28.703
283.881	27.356
287.663	30.724
293.757	28.950
300.502	29.808
303.668	31.217
307.684	29.136
312.447	31.525
316.978	29.444
317.475	29.077
326.835	30.670
333.998	29.630
339.096	28.529
354.639	30.063
354.674	30.736];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Schm1978';
comment.tW = 'subspecies D. r. rotundus';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '353LY'; % Cat of Life
metaData.links.id_ITIS = '631886'; % ITIS
metaData.links.id_EoL = '289588'; % Ency of Life
metaData.links.id_Wiki = 'Desmodus_rotundus'; % Wikipedia
metaData.links.id_ADW = 'Desmodus_rotundus'; % ADW
metaData.links.id_Taxo = '64537'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801094'; % MSW3
metaData.links.id_AnAge = 'Desmodus_rotundus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmodus_rotundus}}';
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
bibkey = 'Schm1978'; type = 'Book'; bib = [ ... 
'author = {Schmidt, U.}, ' ... 
'year = {1978}, ' ...
'title = {Die Vampirfledermaeuse}, ' ...
'series = {Die Neue Brehm-Buecherei}, ' ...
'publisher = {Ziemsen Verlag}, ' ...
'address = {Wittenberg Ltherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Desmodus_rotundus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RaceSwif1981'; type = 'Article'; bib = [ ... 
'author = {Racey, P. A. and Swift, S. M.}, ' ... 
'year = {1981}, ' ...
'title = {Variations in gestation length in a colony of pipistrelle bats (\emph{Pipistrellus pipistrellus}) from year to year}, ' ...
'journal = {J. Reprod. Fertil.}, ' ...
'volume = {61}, ' ...
'pages = {123--129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Cavia_aperea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Cavia_aperea'; 
metaData.species_en = 'Brazilian guinea pig'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 19]; 

%% set data
% zero-variate data

data.tg = 63;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 17;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 74;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 59.66; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'AnAge';
data.Wwx = 171.1; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';            bibkey.Wwx = 'AnAge';
data.Wwi = 637;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';
  comment.Wwi = 'AnAge gives 341 g';

data.Ri  = 5*2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter; 5 litters per yr';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
2.063	55.175
3.034	64.364
3.049	68.963
5.891	75.063
5.922	84.262
5.932	87.329
5.972	99.595
7.833	93.439
11.607	96.460
11.657	111.793
11.677	117.926
12.684	137.847
14.455	104.093
15.466	125.547
22.989	123.924
23.034	137.723
23.955	131.579
26.893	166.810
26.928	177.543
27.799	156.066
28.674	136.122
43.970	209.538
43.990	215.671
44.050	234.070
46.002	255.513
47.714	203.360
48.634	197.215
49.349	128.207
49.761	253.935
53.485	241.623
53.505	247.757
54.305	204.814
54.526	272.278
56.202	209.391
72.363	259.796
73.399	288.917
76.787	173.877
77.088	265.873
78.079	281.194
78.320	354.791
79.110	308.782
82.723	262.739
83.318	156.931
83.990	362.390
87.523	291.814
87.704	347.012
88.760	382.266
97.043	325.433
97.083	337.699
107.398	326.842
109.200	302.287
109.230	311.486
113.184	369.706
113.929	309.897
117.008	388.060
117.894	371.182
129.340	418.578
130.136	374.102
134.660	318.847
134.790	358.712
136.933	438.420
137.523	331.080
139.475	352.523
144.109	331.000
144.345	403.064
158.444	398.295
165.356	497.878
167.692	349.117
167.853	398.181
168.119	479.445
173.318	342.916
173.428	376.648
177.962	324.460
178.123	373.525
189.820	497.584
197.057	408.564
197.222	459.162
219.895	486.489
228.203	437.322
249.994	483.060
262.131	453.781
285.099	571.571
293.176	451.874
310.489	566.666
315.834	474.602];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Rood1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'RY7N'; % Cat of Life
metaData.links.id_ITIS = '584710'; % ITIS
metaData.links.id_EoL = '1038676'; % Ency of Life
metaData.links.id_Wiki = 'Cavia_aperea'; % Wikipedia
metaData.links.id_ADW = 'Cavia_aperea'; % ADW
metaData.links.id_Taxo = '63440'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400171'; % MSW3
metaData.links.id_AnAge = 'Cavia_aperea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cavia_aperea}}';
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
bibkey = 'Rood1972'; type = 'Article'; bib = [ ... 
'author = {Rood, J. P.}, ' ... 
'year = {1972}, ' ...
'title = {Ecological and behavioral comparisons of three genera of {A}rgentine cavies}, ' ...
'journal = {Anim. Behav. Monogr.}, ' ...
'volume = {5}, ' ...
'pages = {1-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Cavia_aperea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


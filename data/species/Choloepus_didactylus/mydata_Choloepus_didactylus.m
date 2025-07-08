function [data, auxData, metaData, txtData, weights] = mydata_Choloepus_didactylus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pilosa'; 
metaData.family     = 'Megalonychidae';
metaData.species    = 'Choloepus_didactylus'; 
metaData.species_en = 'Linnaeus''s two-toed sloth'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 05]; 

%% set data
% zero-variate data

data.tg = 279;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(33);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 152;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(33);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1279;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(33);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1644;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(33);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 31*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(33);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 410; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HarpEyre2003';
data.Wwi = 6290; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/616;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW1 = [ ... % time since birth (d), wet weight (g)
3.143	422.242
10.900	467.638
18.412	530.977
25.364	414.688
32.863	437.618
40.364	465.038
47.628	532.851
55.119	533.331
63.118	556.293
69.870	588.155
76.613	588.587
84.560	463.383
91.863	643.443
99.866	679.875
106.596	644.388
113.876	757.100
121.877	789.041
129.379	820.951
136.372	825.890
142.852	790.387
151.113	849.284
157.882	930.535
165.662	1043.278
172.459	1205.347
180.474	1277.698
188.474	1305.150
196.236	1368.505
202.514	1472.173
210.540	1575.953
217.571	1693.138
225.831	1752.036
232.348	1824.290
239.887	1963.958];  
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Washington Zoo'};  
temp.tW1    = C2K(33);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'HarpEyre2003';
comment.tW1 = 'male at Nat. Zool. Par, Washington DC';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
3.387	404.299
10.388	431.686
17.643	472.560
25.404	531.425
32.911	576.805
40.423	640.144
47.677	676.527
55.430	712.943
62.449	794.209
70.445	808.192
77.947	840.101
84.444	853.987
92.442	876.949
98.688	886.330
106.931	895.838
113.931	918.736
121.439	968.605
129.439	996.057
135.945	1036.883
143.441	1050.833
150.693	1082.726
158.438	1096.693
166.438	1124.145
171.958	1200.825
180.953	1219.361
187.718	1287.142
194.494	1386.352
202.247	1422.768
210.244	1441.240
217.510	1513.543
224.762	1545.436
232.255	1550.407
240.759	1591.360];  
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'Prague Zoo'};  
temp.tW2    = C2K(33);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'HarpEyre2003';
comment.tW2 = 'mother-reared at Prague Zoo';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
3.388	408.789
10.896	458.658
18.405	508.527
25.660	549.401
32.429	630.651
40.198	711.966
47.452	748.349
55.442	748.862
63.438	762.844
70.429	763.293
77.443	826.600
85.214	916.894
91.743	1025.068
99.268	1124.326
106.502	1102.341
114.002	1129.761
122.010	1179.662
128.542	1296.816
135.814	1387.078
143.790	1342.692
150.826	1473.347
158.110	1599.529
165.856	1613.495
173.099	1618.449
180.588	1614.440
187.550	1525.090
195.047	1543.530
202.045	1561.939
209.555	1616.298
218.276	1562.980
224.277	1585.813
232.056	1698.557
240.244	1546.429];  
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'Bristol Zoo'};  
temp.tW3    = C2K(33);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'HarpEyre2003';
comment.tW3 = 'hand-reared at Bristol Zoo';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
% weights.psd.k_J = 0; weights.psd.k = 0.1;
% data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data from Washington, Prague, Bristol'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D2 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5XYGW'; % Cat of Life
metaData.links.id_ITIS = '624908'; % ITIS
metaData.links.id_EoL = '328521'; % Ency of Life
metaData.links.id_Wiki = 'Choloepus_didactylus'; % Wikipedia
metaData.links.id_ADW = 'Choloepus_didactylus'; % ADW
metaData.links.id_Taxo = '60529'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11800018'; % MSW3
metaData.links.id_AnAge = 'Choloepus_didactylus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Choloepus_didactylus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Choloepus_didactylus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HarpEyre2003'; type = 'Article'; bib = [ ... 
'author = {L. Harper and S. Eyre and C. Kibbey and J. P. Partridge}, ' ... 
'year = {2003}, ' ...
'title = {Hand-rearing a two-toed sloth \emph{Choloepus didactylus} at {Bristol Zoo Gardens}}, ' ...
'journal = {Int. zoo Yb.}, ' ...
'volume = {38}, ' ...
'pages = {178--186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


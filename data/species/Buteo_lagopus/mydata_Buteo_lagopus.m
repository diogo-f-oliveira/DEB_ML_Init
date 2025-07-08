function [data, auxData, metaData, txtData, weights] = mydata_Buteo_lagopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_lagopus'; 
metaData.species_en = 'Rough-legged buzzard';

metaData.ecoCode.climate = {'Dfc','ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 29.25;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28-32 d';
data.tx = 41;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 123;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18.8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'avibase';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 60;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 42.31;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'avibase';
data.Wwi = 1027;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 824.6;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 4 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
1.000	72.072
4.634	90.090
8.009	118.919
11.729	162.162
15.882	241.441
19.603	317.117
23.150	407.207
26.352	508.108
29.899	616.216
34.139	709.910
38.379	778.378
43.311	839.640
48.070	897.297
51.877	969.369
55.511	1048.649
58.452	1167.568
60.702	1300.901];
data.tW1(:,1) = data.tW1(:,1)-1; % set origin at hatch 
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight','chick 1, female'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'BirdLagu1976';
comment.tW1 = 'female, data digitized from drawn curve';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
1.000	61.261
3.423	72.072
5.672	82.883
8.268	104.505
11.210	147.748
14.498	187.387
17.180	234.234
19.689	284.685
22.112	345.946
24.535	407.207
27.044	479.279
29.726	558.559
32.322	619.820
35.956	655.856
38.984	688.288
41.667	753.153
44.435	828.829
47.810	904.505
50.838	962.162
53.521	1027.027
56.462	1102.703
59.404	1160.360
62.433	1218.018];
data.tW2(:,1) = data.tW2(:,1)-1; % set origin at hatch 
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight','chick 2, female'};  
temp.tW2    = C2K(40);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'BirdLagu1976';
comment.tW2 = 'female, data digitized from drawn curve';

%
data.tW3 = [ ... % time since birth (d), wet weight (g)
1.000	61.261
3.682	61.261
5.845	90.090
8.874	108.108
11.556	147.748
14.238	209.009
17.180	198.198
20.035	234.234
22.026	320.721
24.362	374.775
27.044	436.036
31.543	508.108
36.648	580.180
41.234	652.252
45.128	695.496
49.973	709.910
53.521	796.396
56.116	926.126
58.972	1127.928];
data.tW3(:,1) = data.tW3(:,1)-1; % set origin at hatch 
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight','chick 3, male'};  
temp.tW3    = C2K(40);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'BirdLagu1976';
comment.tW3 = 'male, data digitized from drawn curve';
%
data.tW4 = [ ... % time since birth (d), wet weight (g)
1.087	54.054
5.413	72.072
8.009	90.090
10.950	126.126
14.325	176.577
17.007	223.423
20.728	281.081
24.448	363.964
26.784	421.622
30.072	493.694
33.533	544.144
38.379	601.802
42.099	634.234
45.993	688.288
50.146	753.153
54.040	843.243
57.155	926.126
60.270	1030.631];
data.tW4(:,1) = data.tW4(:,1)-1; % set origin at hatch 
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight','chick 4, male'};  
temp.tW4    = C2K(40);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'BirdLagu1976';
comment.tW4 = 'male, data digitized from drawn curve';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = 2 * weights.tW1; 
weights.tW2 = 2 * weights.tW2; 
weights.tW3 = 2 * weights.tW3; 
weights.tW4 = 2 * weights.tW4; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'Data for female, female, male, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'NYVC'; % Cat of Life
metaData.links.id_ITIS = '175373'; % ITIS
metaData.links.id_EoL = '45511428'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_lagopus'; % Wikipedia
metaData.links.id_ADW = 'Buteo_lagopus'; % ADW
metaData.links.id_Taxo = '52644'; % Taxonomicon
metaData.links.id_WoRMS = '159110'; % WoRMS
metaData.links.id_avibase = '90B13ACF984D0DDF'; % avibase
metaData.links.id_birdlife = 'rough-legged-buzzard-buteo-lagopus'; % birdlife
metaData.links.id_AnAge = 'Buteo_lagopus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_lagopus}}';
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
bibkey = 'BirdLagu1976'; type = 'Article'; bib = [ ... 
'title = {Successful captive breeding of American Rough-legged Hawks}, ' ...
'author = {Bird, D. M. and P. C. Lag\"{u}e}, ' ...
'journal = {Raptor Research}, ' ...
'year = {1976}, ' ...
'volume = {10}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Buteo_lagopus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=90B13ACF984D0DDF&sec=lifehistory}}';
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


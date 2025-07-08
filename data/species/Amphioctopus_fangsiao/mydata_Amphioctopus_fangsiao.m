function [data, auxData, metaData, txtData, weights] = mydata_Amphioctopus_fangsiao
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Amphioctopus_fangsiao'; 
metaData.species_en = 'Webfoot octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 28]; 

%% set data
% zero-variate data

data.am = 180;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AndrGris2009';   
  temp.am = C2K(25);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 0.12; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AndrGris2009';
data.Wwp = 30;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
data.Wwi = 100;   units.Wwi = 'g';   label.Wwi = 'wet weight at 180 d'; bibkey.Wwi = 'sealifebase';

data.Ni  = 165; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'guess';   
  temp.Ni = C2K(25);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap = 0.95';
 
% uni-variate data
% time-weight
data.tWw_20 = [ ... % time (d), ln wet weight (g)
0.040	-2.156
6.937	-1.322
13.416	-1.244
16.849	-1.166
17.631	-0.749
22.970	-0.619
23.720	-0.879
24.508	-0.332
24.525	0.033
29.462	-0.280
29.868	0.241
30.593	-0.541
31.012	0.267
37.467	-0.176
38.621	0.059
39.027	0.580
44.342	0.189
45.143	1.023
50.471	0.893
51.596	0.528
52.394	1.283
58.457	0.606
59.643	1.518
64.964	1.257
64.970	1.388
66.900	1.909
71.056	1.179
73.000	2.013
78.717	2.065
79.845	1.752
80.252	2.300
85.163	1.440
88.252	2.300
93.199	2.195
93.210	2.430
95.126	2.664
100.414	1.700
100.838	2.612
106.553	2.612
106.945	2.847
108.859	3.055
114.131	1.752
114.553	2.612
120.289	3.081
121.417	2.769
123.345	3.264
133.635	3.342
136.690	3.498
148.874	3.368
176.687	3.446];
data.tWw_20(:,2) = exp(data.tWw_20(:,2)); % remove log transform
units.tWw_20   = {'d', 'g'};  label.tWw_20 = {'time', 'wet weight', '20 C'};  
temp.tWw_20    = C2K(20);  units.temp.tWw_20 = 'K'; label.temp.tWw_20 = 'temperature';
bibkey.tWw_20 = 'AndrGris2009';
%
data.tWw_25 = [ ... % time (d), ln wet weight (g)
0.00	-2.182
2.340	-1.948
7.711	-1.375
11.536	-1.192
16.910	-0.567
19.576	-0.671
19.589	-0.410
21.102	-0.697
24.194	0.111
24.199	0.215
25.708	-0.150
28.771	0.059
30.701	0.502
31.475	0.736
35.663	0.502
40.252	0.684
40.262	0.893
45.247	1.388
46.382	1.179
49.833	1.518
54.400	1.231
54.420	1.648
59.400	2.039
59.767	1.726
62.845	2.248
68.185	2.169
68.541	1.622
73.137	1.961
73.162	2.482
78.147	2.977
82.676	1.909
82.709	2.586
87.296	2.743
91.132	3.134
96.079	2.821
96.426	2.091
101.047	2.951
105.276	3.603
110.202	2.847
110.545	2.039
119.402	3.681
124.669	2.065
133.151	3.863
138.034	2.195
148.041	3.941
175.908	4.046];
data.tWw_25(:,2) = exp(data.tWw_25(:,2)); % remove log transform
units.tWw_25   = {'d', 'g'};  label.tWw_25 = {'time', 'wet weight', '25 C'};  
temp.tWw_25    = C2K(25);  units.temp.tWw_25 = 'K'; label.temp.tWw_25 = 'temperature';
bibkey.tWw_25 = 'AndrGris2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_20 = 5 * weights.tWw_20;
weights.tWw_25 = 5 * weights.tWw_25;
weights.Ni = 0 * weights.Ni;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_25','tWw_20'}; subtitle1 = {'Data for 25, 20 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'D463'; % Cat of Life
metaData.links.id_ITIS = '557235'; % ITIS
metaData.links.id_EoL = '488226'; % Ency of Life
metaData.links.id_Wiki = 'Amphioctopus_fangsiao'; % Wikipedia
metaData.links.id_ADW = 'Octopus_fangsiao'; % ADW
metaData.links.id_Taxo = '3940550'; % Taxonomicon
metaData.links.id_WoRMS = '534733'; % WoRMS
metaData.links.id_molluscabase = '534733'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphioctopus_fangsiao}}';
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
bibkey = 'AndrGris2009'; type = 'article'; bib = [ ...
'doi = {10.3354/meps07736}, ' ...
'author = {Jessica Andr\''{e} and Eric P. M. Grist and Jayson M. Semmens and Gretta T. Pecl and Susumu Segawa}, ' ... 
'year = {2009}, ' ...
'title = {Effects of temperature on energetics and the growth pattern of benthic octopuses}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {374}, ' ...
'pages = {167-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Amphioctopus-fangsiao.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


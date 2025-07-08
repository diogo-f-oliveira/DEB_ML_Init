function [data, auxData, metaData, txtData, weights] = mydata_Sepia_orbignyana
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiida'; 
metaData.family     = 'Sepiidae';
metaData.species    = 'Sepia_orbignyana'; 
metaData.species_en = 'Pinc cuttlefish'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 120;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bell2001';   
  temp.am = C2K(14.4);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 7;    units.Lp = 'cm';   label.Lp = 'mantle length at puberty';   bibkey.Lp = 'DursEron2013';
data.Lpm = 5;    units.Lpm = 'cm';   label.Lpm = 'mantle length at puberty for  males';   bibkey.Lpm = 'DursEron2013';
data.Li = 9.5;    units.Li = 'cm';   label.Li = 'mantle length at death';   bibkey.Li = 'Bell2001';

data.Wwb = 0.037;    units.Wwb = 'g';   label.Wwb = 'weight at birth';   bibkey.Wwb = 'DursEron2013';
  comment.Wwb = 'based on egg length of 7.9 mm, assumed width of 3 mm: pi/6*0.79*0.3^2';

data.Ni  = 1e3; units.Ni  = '#';   label.Ni  = 'cum reprod at Li ';     bibkey.Ni  = 'DursEron2013';   
  temp.Ni = C2K(14.4);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'fecundity 201 - 1532'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
44.868	2.562
44.872	2.709
48.355	2.654
48.366	2.986
49.522	2.820
49.530	3.060
50.925	3.116
52.084	3.042
58.842	3.706
59.317	4.038
59.329	4.389
61.634	3.835
62.105	4.038
62.115	4.334
63.519	4.666
64.905	4.426
67.482	5.109
68.163	4.611
70.027	4.795
71.204	5.275
72.593	5.109
73.071	5.533
73.781	5.939
74.001	5.570
75.417	6.253
75.629	5.626
77.013	5.330
77.728	5.866
80.531	6.346
81.711	6.918
82.384	6.198
83.327	6.622
84.032	6.862
84.727	6.807
85.427	6.918
86.808	6.530
87.037	6.419
87.301	7.379
88.474	7.730
89.601	6.696
91.256	7.582
91.960	7.804
93.111	7.471
93.578	7.545
94.301	8.339
96.377	7.914
96.614	8.062
101.735	8.376
110.126	9.243];
units.tL_f   = {'d', 'cm'};  label.tL_f= {'time time birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(14.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bell2001';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), ln mantle length (cm)
34.158	1.805
51.867	3.503
53.950	3.263
53.955	3.429
55.589	3.688
58.611	3.743
60.481	4.094
60.702	3.743
62.810	4.278
69.566	4.887
71.188	4.777
74.213	4.924
74.233	5.533
74.680	5.017
76.075	5.035
77.488	5.626
78.410	5.404
78.659	5.939
80.973	5.663
81.446	5.921
82.155	6.290
82.847	6.142
83.320	6.401
84.017	6.401
84.948	6.456
85.185	6.604
86.104	6.309
87.510	6.678
88.202	6.512
88.430	6.382
90.540	6.973
92.640	7.287
94.482	6.788
97.772	7.933
99.622	7.693
101.472	7.434
105.906	8.062];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time time birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(14.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bell2001';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
44.412	2.677
46.798	3.923
47.661	2.819
48.532	4.339
50.696	3.789
50.917	5.309
51.998	4.482
53.514	4.483
55.468	6.005
58.070	7.252
58.078	10.015
60.886	7.255
61.761	10.572
62.848	11.817
64.359	10.023
65.882	12.511
66.320	14.170
70.214	12.378
70.224	15.971
70.444	17.214
71.302	14.314
71.304	14.866
73.494	23.850
74.347	18.739
74.560	17.357
74.568	20.535
74.779	18.325
76.084	20.537
77.596	18.742
78.930	31.456
79.353	27.725
80.639	22.615
80.645	24.964
81.736	27.728
82.175	30.078
82.185	33.670
82.611	30.907
83.255	28.973
83.479	31.737
84.355	35.054
85.857	29.806
86.285	28.010
86.744	37.406
87.379	32.018
87.623	42.243
90.652	40.865
90.885	46.944
91.730	39.070
91.766	52.334
92.599	39.761
92.826	43.630
93.295	56.895
94.759	37.830
95.226	49.989
95.868	47.088
95.875	49.990
101.099	59.115
107.410	70.176];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time time birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(14.4);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Bell2001';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
33.793	0.868
54.381	4.899
54.385	6.142
56.115	5.177
57.417	6.146
58.500	5.871
59.587	7.530
61.538	8.085
68.257	9.751
70.865	12.932
72.817	13.763
73.907	16.251
75.198	13.075
75.202	14.456
77.160	17.775
78.022	16.118
79.115	19.711
79.977	18.054
81.499	20.129
81.945	25.103
83.670	22.066
84.541	23.863
84.746	19.580
85.848	26.628
87.372	29.393
88.015	27.045
88.245	31.743
88.444	25.387
92.367	34.096
94.089	30.368
94.971	36.034
96.728	45.017
98.875	37.834
100.826	38.527
104.948	40.881];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time time birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(14.4);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Bell2001';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for female, male'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed, based on preferred temp';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.bibkey.D2 = 'sealifebase'; 
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'semelparous: death at first spawning';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WQKJ'; % Cat of Life
metaData.links.id_ITIS = '82364'; % ITIS
metaData.links.id_EoL = '448837'; % Ency of Life
metaData.links.id_Wiki = 'Sepia_orbignyana'; % Wikipedia
metaData.links.id_ADW = 'Sepia_orbignyana'; % ADW
metaData.links.id_Taxo = '40205'; % Taxonomicon
metaData.links.id_WoRMS = '141445'; % WoRMS
metaData.links.id_molluscabase = '141445'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepia_orbignyana}}';
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
bibkey = 'Bell2001'; type = 'article'; bib = [ ...
'doi = {10.1007/s101520100071}, ' ...
'author = {Giambattista Bello}, ' ... 
'year = {2001}, ' ...
'title = {Dimorphic growth in male and female cuttlefish \emph{Sepia orbignyana} ({C}ephalopoda: {S}epiidae) from the {A}driatic {S}ea}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {55}, ' ...
'pages = {124-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DursEron2013'; type = 'article'; bib = [ ...
'doi = {10.3906/zoo-1209-22}, ' ...
'author = {Derya Dursun and Elizabeth Grace Tunka Eronat and Meryem Akal\''{i}n and Mehmet Alp Salman}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of pink cuttlefish \emph{Sepia orbignyana} in the {A}egean {S}ea (eastern {M}editerranean)}, ' ...
'journal = {Turk J Zool}, ' ...
'volume = {37}, ' ...
'pages = {576-581}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sepia-orbignyana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Amphioctopus_aegina
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Amphioctopus_aegina'; 
metaData.species_en = 'Marbled octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(29.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 04];              
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

data.ab = 18.3;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'PromNabh2011';   
  temp.ab = C2K(29.7);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 160;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'PromNabh2011';   
  temp.am = C2K(29.7);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 19e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PromNabh2011';
data.Wwp = 21;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on divergence of time-weight ttrajectories of sexes';
data.Wwi = 156;   units.Wwi = 'g';   label.Wwi = 'wet weight at 160 d'; bibkey.Wwi = 'PromNabh2011';
  comment.Wwi = 'sealifebase gives 400 g';

data.Ni  = 6900; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'PromNabh2011';   
  temp.Ni = C2K(29.7);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), mantle length (cm)
0.000	0.309
9.585	0.363
20.120	0.490
29.098	0.690
39.608	1.089
50.110	1.579
59.342	2.377
69.156	3.593
79.985	3.902
89.502	4.973
99.697	5.426
109.307	5.499
119.526	5.699
130.021	6.261
139.881	6.987
149.470	7.278
159.605	8.385];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(29.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PromNabh2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), mantle length (cm)
0.000	0.290
10.517	0.345
22.294	0.472
30.032	0.653
39.608	1.089
49.802	1.561
59.966	2.341
69.777	3.593
79.682	3.829
90.243	3.684
98.892	4.083
109.726	4.338
119.327	4.501
129.843	4.846
139.441	5.045
149.037	5.263
160.495	5.481];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(29.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PromNabh2011';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time (d), wet weight (g)
9.410	0.092
19.760	0.074
29.797	0.155
39.520	0.271
50.182	1.017
58.958	4.122
69.920	12.173
80.566	21.767
89.308	41.861
99.003	56.396
109.328	69.696
119.654	82.070
129.348	97.223
139.665	114.230
149.659	135.870
159.341	156.891];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(29.7);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'PromNabh2011';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time (d), wet weight (g)
9.410	0.092
19.446	0.074
30.111	0.155
40.774	0.274
50.496	1.018
60.839	4.434
71.486	13.411
80.566	21.459
89.660	22.711
99.371	28.597
109.399	33.557
119.428	37.591
129.451	44.405
139.476	50.291
149.499	57.414
159.836	64.537];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(29.7);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'PromNabh2011';
comment.tWw_m = 'Data for males';

% length-weight
data.LWw = [ ... % manthle length (cm), wet weight (g)
0.254	0.003
0.265	0.003
0.270	0.003
0.270	0.003
0.279	0.003
0.280	0.006
0.280	0.003
0.293	0.006
0.293	0.003
0.302	0.006
0.312	0.009
0.318	0.006
0.328	0.008
0.332	0.006
0.340	0.006
0.358	0.007
0.391	0.013
0.398	0.014
0.406	0.020
0.411	0.012
0.416	0.023
0.421	0.028
0.421	0.017
0.435	0.017
0.469	0.025
0.480	0.044
0.538	0.042
0.576	0.034
0.591	0.062
0.613	0.058
0.657	0.082
0.704	0.110
0.704	0.128
0.722	0.110
0.740	0.061
0.749	0.093
0.871	0.295
0.962	0.426
1.012	27.469
1.084	0.426
1.104	0.367
1.140	0.518
1.147	0.349
1.213	0.531
1.228	0.415
1.308	1.198
1.341	0.959
1.375	0.807
1.437	1.140
1.491	1.354
1.608	2.506
1.628	1.257
1.845	1.568
2.312	4.301
2.492	6.071
2.492	5.236
2.492	3.708
2.539	6.377
2.669	5.499
3.102	8.353
3.141	16.657
3.141	10.427
3.201	9.217
3.241	16.654
3.605	23.503
3.673	13.005
3.720	22.368
3.790	17.478
3.814	20.770
3.911	29.326
3.935	15.448
3.960	26.570
4.060	29.319
4.137	15.067
4.189	30.795
4.269	35.700
4.377	71.185
4.432	39.391
4.545	38.425
4.545	33.142
4.689	46.793
4.689	40.359
4.808	56.986
4.992	62.877
4.992	52.911
5.023	41.349
5.183	62.862
5.215	54.217
5.215	44.512
5.415	67.669
5.483	58.360
5.552	80.402
5.587	71.075
5.765	82.389
5.874	72.826
5.911	62.810
6.099	86.523
6.176	76.483
6.214	97.862
6.372	82.337
6.741	97.811
6.741	72.763
6.869	122.095
6.956	97.792
6.956	76.425
7.222	138.068
7.267	119.080
8.498	152.221];
units.LWw   = {'cm', 'g'};  label.LWw = {'mantle length', 'wet weight'};  
bibkey.LWw = 'PromNabh2011';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Planctonic phase lasts 20-25 d at 29,7 C';
metaData.bibkey.F2 = 'PromNabh2011'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'D45W'; % Cat of Life
metaData.links.id_ITIS = '557202'; % ITIS
metaData.links.id_EoL = '593204'; % Ency of Life
metaData.links.id_Wiki = 'Amphioctopus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_aegina'; % ADW
metaData.links.id_Taxo = '3940546'; % Taxonomicon
metaData.links.id_WoRMS = '534097'; % WoRMS
metaData.links.id_molluscabase = '534097'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphioctopus}}';
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
bibkey = 'PromNabh2011'; type = 'article'; bib = [ ...
'doi = {10.3989/scimar.2011.75n4811}, ' ...
'author = {Pichotra Promboon and Jaruwat Nabhitabhata and Teerapong Duengdee}, ' ... 
'year = {2011}, ' ...
'title = {Life cycle of the marbled octopus, \emph{Amphioctopus aegina} ({G}ray) ({C}ephalopoda: {O}ctopodidae) reared in the laboratory}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {75(4)}, ' ...
'pages = {811-821}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Amphioctopus-aegina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Procavia_capensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Hyracoidea'; 
metaData.family     = 'Procaviidae';
metaData.species    = 'Procavia_capensis'; 
metaData.species_en = 'Rock hyrax'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Le'; 't-Wwe'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 11];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 278;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Four1983';   
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'RubsKett80: 37-40 C';
data.tx = 3.2*30.5;units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Four1983';   
  temp.tx = C2K(36.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 17*30.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Four1983';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2 out of 7 reached puberty at 17 month';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'awf';   
  temp.am = C2K(36.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 658;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Four1983';
data.Wwp = 2830;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Four1983';
data.Wwi = 4000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 2.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Four1983';   
  temp.Ri = C2K(36.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_m = [ ... % time since birth (month), wet weight (g)
1.119	366.187
5.243	976.999
9.128	1364.363
13.365	1609.739
16.624	2027.306
20.537	2323.311
24.469	2558.410
28.482	2529.583
31.565	2520.683
35.823	2695.001
39.792	2808.288
44.965	3013.434
49.302	2933.977
53.255	3098.019
56.115	2814.916
60.762	2725.433
64.961	3092.621
68.075	2982.210
73.613	3004.763
75.650	3391.377
80.322	3220.686
84.446	3831.498
88.270	3416.807
104.098	3027.295
108.784	2816.000
149.417	2893.415];
data.tW_m(:,1) = 30.5 * data.tW_m(:,1); % convert month to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(36.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Four1983';
comment.tW_m = 'Data for males';
%
data.tW_f = [ ... % time since birth (month), wet weight (g)
1.877	471.178
5.600	1012.531
9.618	1403.509
13.623	1634.085
17.328	1944.862
20.728	2285.714
25.053	2686.717
28.424	2636.591
33.645	2716.792
36.717	2776.942
40.403	2847.118
45.326	3037.594
48.989	2807.017
52.369	2877.193
57.304	3238.095
61.294	3268.171
65.570	3027.569
69.895	3418.547
74.142	2796.992
81.504	2796.992
84.899	3067.669
89.200	3157.895
93.565	4080.200
96.884	3358.396
108.537	3318.296
112.519	3238.095
117.797	4060.150
121.127	3488.722
128.452	3007.519
134.599	3157.895
140.092	2786.967
148.396	3077.694];
data.tW_f(:,1) = 30.5 * data.tW_f(:,1); % convert month to d
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(36.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Four1983';
comment.tW_f = 'Data for females';

% length-weight
data.LW_m = [ ... % body length (cm), wet weight (g)
23.118	368.902
24.610	456.482
26.501	573.228
30.119	971.324
31.637	1194.504
31.726	1146.103
34.241	1437.355
34.392	1204.952
34.839	1476.262
35.020	1398.830
38.292	1535.328
39.029	1787.349
40.137	1923.249
40.193	2204.136
40.226	1874.847
40.690	2233.329
40.828	2436.757
40.986	1739.464
41.532	2514.433
41.916	2466.113
42.519	2534.077
42.767	2795.647
43.029	2631.070
43.095	2466.440
43.984	2486.056
44.053	3338.376
44.087	2011.509
44.268	2428.024
44.522	3222.283
44.605	2641.192
45.103	2176.439
45.137	1847.150
45.170	2515.440
45.187	2602.612
45.342	2893.212
45.612	2767.379
46.153	2515.712
46.218	2845.028
46.364	3087.199
46.542	3494.028
46.827	2942.049
47.178	2729.071
50.144	3814.637];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'body length', 'wet weight', 'male'};  
bibkey.LW_m = 'Four1983';
comment.LW_m = 'Data for males';
%
data.LW_f = [ ... % body length (cm), wet weight (g)
19.095	448.000
20.611	416.000
21.474	373.333
26.605	512.000
26.957	672.000
27.271	597.333
27.711	629.333
28.041	650.667
28.390	789.333
29.183	992.000
29.254	757.333
30.136	832.000
31.033	1002.667
32.023	1077.333
32.218	938.667
32.888	1045.333
33.470	1280.000
34.099	1141.333
35.103	1301.333
35.121	1408.000
35.188	1152.000
36.372	1749.333
37.209	1546.667
38.572	1909.333
38.639	1653.333
39.166	2218.667
40.017	2101.333
40.272	2336.000
40.281	2389.333
40.328	2677.333
40.334	2048.000
40.669	2101.333
41.192	2645.333
41.875	2165.333
41.917	2421.333
42.167	2624.000
43.197	2944.000
43.397	2837.333
43.663	2464.000
44.097	3125.333
44.125	2634.667
44.362	2752.000
44.914	2805.333
45.104	3306.667
45.711	3029.333
45.744	3232.000
45.756	2634.667
46.037	3029.333
46.900	2986.667
46.998	2922.667
47.198	2816.000
47.478	3200.000
47.899	3114.667
48.298	3562.667
48.305	3605.333
51.456	3594.667
51.701	3765.333
52.493	3957.333];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'body length', 'wet weight', 'female'};  
bibkey.LW_f = 'Four1983';
comment.LW_f = 'Data for females';

% time-weight
data.tW_e = [ ... % age (d), weight ^1/3 (g)
145.300	2.925
146.332	2.716
172.234	3.356
172.824	3.948
173.381	4.227
173.392	4.332
173.414	4.541
173.834	3.530
175.696	6.179
178.192	4.857
178.218	5.100
180.693	3.569
202.347	3.927
205.584	4.625
208.763	4.766
238.422	6.034
239.063	7.115
239.521	6.453
241.132	6.732
242.625	5.897
258.344	4.963
261.566	5.522
269.158	7.512
270.839	8.454];
data.tW_e(:,2) = data.tW_e(:,2).^3; % remove 1/3-root transformation    
units.tW_e  = {'d', 'g'};  label.tW_e = {'age', 'wet weight'};  
temp.tW_e   = C2K(36.9);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'Four1983';
subtitle.tW_e = 'Data for embryos';

% time-length
data.tL_e = [ ... % age(d), crown/rump length (cm)
86.459	2.458
86.487	2.615
99.959	3.675
100.316	3.487
103.486	3.737
103.520	3.924
104.698	3.955
105.066	3.830
105.422	3.643
122.529	5.359
131.179	5.670
131.926	5.482
146.711	7.324
147.073	7.168
160.405	7.447
161.220	7.634
172.242	8.101
172.276	8.289
177.517	9.194
178.967	8.569
201.921	10.222
232.749	12.217];
units.tL_e  = {'d', 'cm'};  label.tL_e = {'age', 'crown/rump length '};  
temp.tL_e   = C2K(36.9);  units.temp.tL_e = 'K'; label.temp.tL_e = 'temperature';
bibkey.tL_e = 'Four1983';
subtitle.tL_e = 'Data for embryos';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4MMMH'; % Cat of Life
metaData.links.id_ITIS = '584911'; % ITIS
metaData.links.id_EoL = '326384'; % Ency of Life
metaData.links.id_Wiki = 'Procavia_capensis'; % Wikipedia
metaData.links.id_ADW = 'Procavia_capensis'; % ADW
metaData.links.id_Taxo = '69207'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11400040'; % MSW3
metaData.links.id_AnAge = 'Procavia_capensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procavia_capensis}}';
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
bibkey = 'Four1983'; type = 'Phdthesis'; bib = [ ... 
'author = {Fourie, L. J.}, ' ... 
'year = {1983}, ' ...
'title = {Population dynamics of the rock hyrax Procavia capensis (Pallas, 1766) in the mountain zebra national park}, ' ...
'school = {Rhodes Univ}, ' ...
'howpublished = {\url{http://eprints.ru.ac.za/2387/1/FOURIE-PhD-TR84-07.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RubsKett1980'; type = 'Article'; bib = [ ... 
'author = {K. R\"{u}bsamen and S. Kettembeil}, ' ... 
'year = {1980}, ' ...
'title = {Effect of water restriction on oxygen uptake, evaporative water loss and body temperature of the rock hyrax}, ' ...
'journal = {Journal of Comparative Physiology B}, ' ...
'volume = {138}, ' ...
'pages = {315--320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Procavia_capensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'awf'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.awf.org/content/wildlife/detail/hyrax}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


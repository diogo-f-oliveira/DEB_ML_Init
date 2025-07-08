function [data, auxData, metaData, txtData, weights] = mydata_Cottus_volki

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_volki'; 
metaData.species_en = 'Volk''s sculpin'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 3 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Kolp2011';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Kolp2011'; 
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'Kolp2011';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Kolp2011';
  comment.Wwb = 'baed on egg diameter of 1.63 mm: pi/6*0.163^3';
 
% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 5.11
    2 7.83
    3 9.73
    4 11.33];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kolp2011';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1 5.39
    2 7.58
    3 9.93
    4 11.73
    5 13.03
    6 15.0];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kolp2011';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % age (years), wet weight (g)
    1 1.5
    2 6.0
    3 11.1
    4 17.9];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Kolp2011';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % age (years), wet weight (g)
    1 1.6
    2 5.6
    3 12.5
    4 20.6
    5 26.5
    6 39.4];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Kolp2011';
comment.tW_m = 'data for males';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
4.026	0.402
4.304	0.665
4.670	0.670
4.670	0.993
5.000	1.581
5.000	1.386
5.139	1.582
5.174	1.453
5.609	1.718
5.696	2.302
5.783	1.850
5.835	2.369
6.026	1.723
6.043	3.278
6.061	2.695
6.130	2.891
6.235	2.374
6.252	1.856
6.270	3.346
6.670	2.638
6.774	2.640
6.948	4.585
6.948	2.966
7.017	3.744
7.209	4.329
7.226	3.682
7.296	4.007
7.296	4.978
7.348	4.202
7.400	4.267
7.417	4.721
7.452	4.268
7.574	5.629
7.591	4.723
7.626	6.019
7.661	5.307
7.696	3.818
7.713	5.696
7.730	4.595
7.783	6.280
7.783	6.280
7.783	4.596
7.904	6.217
7.904	5.439
7.957	4.663
7.957	4.857
7.991	6.930
8.026	6.542
8.096	5.830
8.165	7.515
8.200	5.378
8.217	6.998
8.252	8.229
8.252	7.905
8.270	6.416
8.391	7.000
8.391	8.490
8.409	6.547
8.461	8.361
8.513	6.419
8.513	7.973
8.548	9.463
8.548	8.297
8.617	5.967
8.687	6.486
8.809	9.337
8.948	9.728
9.000	7.979
9.017	10.376
9.104	7.527
9.139	8.111
9.191	8.759
9.243	11.933
9.313	7.854
9.383	9.409
9.417	8.697
9.452	12.066
9.504	11.289
9.609	9.412
9.765	10.451
9.904	9.805
9.957	11.684
10.009	10.518
10.026	13.887
10.078	11.038
10.391	15.187
10.426	12.985
10.478	12.986
10.722	13.507
11.000	18.886
11.017	16.425
11.226	17.205
11.817	20.063];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'Kolp2011';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
3.974	0.661
4.513	0.991
4.791	1.448
4.965	0.932
5.104	1.517
5.278	1.260
5.278	1.908
5.365	2.039
5.504	1.587
5.557	1.134
5.748	1.266
5.852	1.721
6.009	2.565
6.130	2.502
6.252	2.957
6.270	2.504
6.409	3.283
6.461	3.024
6.530	2.183
6.583	3.997
6.687	3.092
6.739	4.194
6.843	4.066
6.948	5.686
6.983	3.290
7.035	4.068
7.052	3.032
7.296	4.395
7.417	6.210
7.470	7.442
7.713	6.732
7.783	5.567
7.887	7.253
7.991	4.922
8.200	7.904
8.235	6.739
8.409	6.417
8.478	7.325
8.617	6.161
8.670	9.789
8.687	6.162
8.704	8.753
8.739	8.235
8.757	7.653
9.104	12.191
9.139	10.896
9.383	10.510
9.400	8.762
9.435	10.900
9.452	13.361
9.522	12.649
9.522	11.743
9.522	10.318
9.661	13.493
9.661	11.745
9.661	9.737
9.678	10.579
9.783	12.394
9.835	13.172
10.009	14.664
10.061	11.102
10.078	16.802
10.148	14.601
10.183	12.334
10.217	16.285
10.217	10.586
10.322	11.429
10.409	17.389
10.426	14.669
10.513	15.577
10.513	15.771
10.687	13.701
10.704	19.401
10.774	16.357
10.791	14.868
10.791	15.580
10.791	12.472
10.809	17.588
10.826	20.697
10.983	18.044
11.209	15.132
11.313	17.530
11.522	24.333
11.539	22.132
11.539	19.152];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'Kolp2011';
comment.LW_m = 'data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#) 
4.666	24.313
6.062	157.698
6.149	172.845
6.152	116.343
6.249	142.590
6.641	139.620
6.671	117.427
6.966	106.371
7.167	211.332
7.249	142.734
7.263	273.902
7.265	216.391
7.354	203.288
7.354	196.225
7.358	113.490
7.434	156.887
7.445	142.762
7.453	170.006
7.563	121.591
7.737	190.226
7.738	175.092
7.763	263.885
7.845	188.224
7.859	308.293
7.863	217.486
7.971	208.421
7.975	135.776
8.157	227.618
8.166	251.835
8.331	271.029
8.350	284.149
8.357	127.759
8.371	264.981
8.445	371.942
8.467	316.452
8.481	210.513
8.571	171.176
8.615	294.276
8.662	343.723
8.747	187.345
8.756	205.508
8.761	311.450
8.764	232.751
8.953	183.339
8.955	365.962
8.967	298.363
9.381	245.956
9.952	427.653];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Kolp2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Lp = weights.Lp * 5;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'YYLN'; % Cat of Life
metaData.links.id_ITIS = '692089'; % ITIS
metaData.links.id_EoL = '212111'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_volki'; % Wikipedia
metaData.links.id_ADW = 'Cottus_volki'; % ADW
metaData.links.id_Taxo = '3414632'; % Taxonomicon
metaData.links.id_WoRMS = '1015648'; % WoRMS
metaData.links.id_fishbase = 'Cottus-volki'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_volki}}';
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
bibkey = 'Kolp2011'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945211010085}, ' ...
'author = {E. V. Kolpakov}, ' ... 
'year = {2011}, ' ...
'title = {Biology of {V}olk''s Sculpin \emph{Cottus volki} ({C}ottidae) from the {S}erebryanka {R}iver ({C}entral {P}rimor''e)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {51}, ' ...
'pages = {178-186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-volki.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


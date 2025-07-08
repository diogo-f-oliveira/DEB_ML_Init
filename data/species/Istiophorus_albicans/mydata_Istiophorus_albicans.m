function [data, auxData, metaData, txtData, weights] = mydata_Istiophorus_albicans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Istiophorus_albicans'; 
metaData.species_en = 'Atlantic sailfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 08];

%% set data
% zero-variate data

data.am = 4*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'fishbase';   
  temp.am = C2K(23.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 133.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 315;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter 0f 1.3 mm of Istiophorus_platypterus: pi/6*0.13^3';
data.Wwi = 3.12e5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.14';

data.Ri  = 19.5e6/365;    units.Ri  = '#/d'; label.Ri  = 'ultimate reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ...  % time since birth (yr), totla length (inch)
0.502	56.788
0.975	72.379
1.473	81.052
1.988	85.167
2.455	87.550
2.946	91.822
3.462	94.836];
data.tL(:,1) = (1.1 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = 2.54 * data.tL(:,2); % convert inch to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sylv1957';

% time-weight
data.tW = [ ...  % time since birth (yr), weight (pounds)
0.541	7.207
0.997	21.117
1.520	32.682
2.011	42.570
2.493	48.436
2.983	63.352
3.515	69.553];
data.tW(:,1) = (1.1 + data.tW(:,1)) * 365; % convert yr to d
data.tW(:,2) = 453.6 * data.tW(:,2); % convert pound to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(23.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sylv1957';

% length-weight
data.LW = [ ... % total length (inch), weight (pound)
48.165	3.404
51.959	5.331
52.289	5.608
53.773	3.935
55.258	7.262
55.753	9.204
56.082	8.091
56.082	6.702
59.381	7.799
61.361	8.346
62.680	8.896
62.845	10.562
63.175	7.505
64.000	9.446
64.825	14.165
64.825	13.331
64.990	10.830
65.320	8.607
65.979	11.382
65.979	14.715
66.144	12.492
66.804	10.267
68.124	11.928
69.773	14.421
70.433	16.085
71.588	21.635
71.588	16.635
71.753	18.857
74.062	17.736
74.062	23.291
74.227	29.124
74.557	21.067
75.052	16.898
75.216	44.397
76.041	21.338
76.371	32.448
77.031	25.778
77.196	32.444
77.361	33.555
77.526	23.554
77.691	36.053
78.021	24.663
78.351	34.661
79.010	19.936
79.505	43.823
79.670	26.322
79.670	22.711
80.165	32.987
80.165	41.320
80.330	31.597
80.660	34.374
80.990	30.205
81.155	23.816
81.320	39.648
81.485	24.926
81.649	33.258
81.649	37.980
81.649	44.092
82.474	32.143
82.639	40.198
82.639	34.365
82.804	37.142
83.134	29.363
83.299	40.195
83.794	35.471
84.124	32.970
84.124	37.970
84.124	39.914
84.124	41.581
84.289	29.080
84.289	31.580
84.289	35.747
84.454	35.468
85.113	24.354
85.443	54.353
85.443	49.631
85.443	49.075
85.608	34.908
85.608	37.130
85.608	37.963
85.608	40.185
85.773	47.407
86.103	47.128
86.103	41.850
86.268	46.016
86.268	32.683
86.268	33.516
86.268	36.849
86.433	49.349
86.928	41.569
86.928	36.013
87.093	45.179
87.093	51.568
87.093	29.623
87.093	37.679
87.258	48.512
87.258	49.623
87.258	50.734
87.258	39.067
87.423	37.400
87.918	47.398
88.247	44.341
88.412	42.951
88.577	41.561
88.577	35.173
88.742	39.894
88.907	49.616
89.237	62.392
89.237	48.225
89.402	51.002
89.567	60.168
89.567	57.390
89.567	55.168
89.567	52.113
89.567	46.279
89.897	34.611
90.062	42.666
90.062	43.777
90.227	39.888
90.392	57.665
90.392	52.387
90.557	94.608
90.557	50.442
90.722	48.497
90.887	45.163
91.216	56.272
91.381	41.271
92.041	59.046
92.041	37.935
92.206	54.879
92.206	45.990
92.371	52.656
92.371	49.878
92.371	42.934
92.536	49.044
92.536	46.822
92.701	75.432
92.701	60.432
93.196	51.541
93.361	37.374
93.526	78.484
93.526	64.873
93.856	54.316
94.515	49.869
94.680	41.535
94.680	48.757
95.175	54.866
95.505	61.809
95.670	59.586
96.000	45.418
96.165	95.973
96.165	55.417
96.330	49.028
96.825	81.248
96.825	54.581
97.485	101.523
97.814	51.799
98.144	65.131
98.474	61.518
98.474	62.907
98.474	55.963
99.464	58.181
100.289	64.844
100.454	77.343
100.784	63.175];
data.LW(:,1) = data.LW(:,1) * 2.54; % convert inch to cm
data.LW(:,2) = data.LW(:,2) * 453.6; % convert pound to g
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Sylv1957';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LW = 0 * weights.LW;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'LW data is inconsistent with the combination tL and tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'weight-length: Ww in g = 0.00447*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3QDBW'; % Cat of Life
metaData.links.id_ITIS = '550888'; % ITIS
metaData.links.id_EoL = '46581443'; % Ency of Life
metaData.links.id_Wiki = 'Istiophorus_albicans'; % Wikipedia
metaData.links.id_ADW = 'Istiophorus_albicans'; % ADW
metaData.links.id_Taxo = '46714'; % Taxonomicon
metaData.links.id_WoRMS = '126949'; % WoRMS
metaData.links.id_fishbase = 'Istiophorus-albicans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Istiophorus_albicans}}';
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
bibkey = 'Sylv1957'; type = 'Article'; bib = [ ... 
'author = {De Sylva, D}, ' ... 
'year = {1957}, ' ...
'title = {Studies on the age and growth of the {A}tlantic sailfish, \emph{Istiophorus americanus} ({C}uvier), using length-frequency curves}, ' ...
'journal = {Bull, Mar. Sci. Gulf Caribb.}, ' ...
'volume = {7(1)}, ' ...
'pages = {1-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Istiophorus-albicans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marinebio'; type = 'Misc'; bib = ...
'howpublished = {\url{http://marinebio.org/species.asp?id=146}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


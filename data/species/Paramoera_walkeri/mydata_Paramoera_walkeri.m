function [data, auxData, metaData, txtData, weights] = mydata_Paramoera_walkeri

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Pontogeneiidae';
metaData.species    = 'Paramoera_walkeri'; 
metaData.species_en = 'Antarctic gammarid'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L_T'; 'L-Ww'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 24]; 

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Saga1980';   
  temp.am = C2K(0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.25;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Saga1980';
data.Lp  = 1.2;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Saga1980';
data.Li  = 2.0;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Saga1980';

data.Ri  = 30/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Saga1980';   
  temp.Ri = C2K(0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 1 clutch of 30 young per season';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
2.190	0.248
18.352	0.256
29.543	0.260
72.978	0.346
82.693	0.537
108.686	0.643
375.798	0.930
396.850	1.007
417.766	1.194
436.412	1.207
442.520	1.296
459.912	1.317
470.906	1.479
739.454	1.611
760.603	1.611
779.263	1.612
795.435	1.612
809.094	1.632
822.718	1.681
1149.660	1.874
1151.794	2.159
1153.235	2.001
1166.778	2.114];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f    = C2K(0);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Saga1980';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (d), length (cm)
9.644	0.256
18.352	0.256
32.041	0.252
72.983	0.342
82.804	0.448
103.836	0.542
377.174	0.824
397.063	0.836
416.760	1.003
444.027	1.085
450.192	1.129
461.368	1.146
463.770	1.215
474.941	1.235
744.643	1.441
763.303	1.441
778.216	1.453
796.872	1.457
810.556	1.457
826.728	1.457
839.078	1.531
1141.023	1.818
1192.013	1.830
1200.645	1.891];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m    = C2K(0);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Saga1980';
comment.tL_m = 'data for males';

% length - wet wet
data.LWw_f = [ ... length (cm), wet weight (mg)
0.985	10.045
1.252	18.662
1.292	19.000
1.326	42.241
1.333	26.965
1.345	23.780
1.375	26.724
1.381	25.551
1.388	20.972
1.406	37.588
1.406	24.872
1.419	26.485
1.463	37.927
1.470	30.576
1.470	26.485
1.510	28.203
1.517	25.096
1.524	30.303
1.530	34.054
1.572	35.617
1.579	31.694
1.579	29.234
1.608	32.853
1.629	42.241
1.629	33.448
1.665	47.897
1.703	63.266
1.703	40.751
1.718	59.948
1.750	39.314
1.765	41.118
1.788	63.836
1.820	69.832
1.821	64.993
1.870	77.080
1.973	78.476
2.119	55.296];
data.LWw_f(:,2) = data.LWw_f(:,2)/1e3; % convert mg to g
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'length', 'wet weight', 'female'};  
bibkey.LWw_f = 'Saga1980';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... length (cm), wet weight (mg)
0.900	9.019
1.030	10.136
1.076	12.460
1.141	14.645
1.167	11.913
1.177	11.088
1.309	21.352
1.363	22.737
1.537	35.299
1.593	29.498
1.593	28.203
1.681	37.588
1.703	53.826
1.789	32.268
1.813	44.578
1.845	58.356
1.846	49.205
1.896	50.548
1.913	43.394
1.956	53.826];
data.LWw_m(:,2) = data.LWw_m(:,2)/1e3; % convert mg to g
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'length', 'wet weight', 'male'};  
bibkey.LWw_m = 'Saga1980';
comment.LWw_m = 'data for males';

% length - dry wet
data.LWd_f = [ ... length (cm), dry weight (mg)
0.960	1.825
1.184	3.844
1.283	3.271
1.305	5.170
1.371	5.605
1.402	6.186
1.446	6.131
1.460	5.216
1.473	5.915
1.499	7.883
1.512	6.707
1.526	8.026
1.533	5.605
1.540	7.142
1.560	8.939
1.560	6.890
1.568	5.706
1.588	8.394
1.595	8.623
1.624	7.271
1.639	6.587
1.639	5.968
1.646	8.470
1.683	8.245
1.683	7.271
1.690	10.136
1.691	9.433
1.699	6.529
1.736	10.319
1.744	8.245
1.776	9.265
1.808	10.506
1.808	9.019
1.890	10.045
1.933	10.601
2.160	16.165];
data.LWd_f(:,2) = data.LWd_f(:,2)/1e3; % convert mg to g
units.LWd_f   = {'cm', 'g'};  label.LWd_f = {'length', 'dry weight', 'female'};  
bibkey.LWd_f = 'Saga1980';
comment.LWd_f = 'data for females';
%
data.LWd_m = [ ... length (cm), dry weight (mg)
0.800	1.229
0.926	1.745
0.995	1.581
1.008	2.304
1.036	2.032
1.078	2.567
1.102	3.127
1.112	3.360
1.117	3.514
1.122	2.733
1.122	2.284
1.147	3.514
1.147	3.184
1.153	2.590
1.168	3.643
1.184	3.017
1.205	3.514
1.210	3.610
1.221	3.776
1.232	4.281
1.254	4.057
1.266	3.844
1.266	3.675
1.294	4.438
1.294	4.021
1.312	3.879
1.312	3.546
1.317	4.943
1.317	4.726
1.323	3.985
1.359	3.844
1.371	4.281
1.396	4.943
1.427	5.032
1.466	5.359
1.513	6.076
1.513	6.022
1.520	5.170
1.561	5.915
1.589	5.605
1.632	6.767
1.639	5.915
1.729	7.206
1.908	7.954];
data.LWd_m(:,2) = data.LWd_m(:,2)/1e3; % convert mg to g
units.LWd_m   = {'cm', 'g'};  label.LWd_m = {'length', 'dry weight', 'male'};  
bibkey.LWd_m = 'Saga1980';
comment.LWd_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for female, male'};
set3 = {'LWd_f','LWd_m'}; subtitle3 = {'Data for female, male'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature (in C) for tL data is assumed to vary in time (in d) as T(t)=2+5*sin(2*pi*(t-120)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4D3NJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46531127'; % Ency of Life
metaData.links.id_Wiki = 'Paramoera_walkeri'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5568571'; % Taxonomicon
metaData.links.id_WoRMS = '237493'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paramoera_walkeri}}';
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
bibkey = 'Saga1980'; type = 'Article'; bib = [ ... 
'doi = {10.1080/03036758.1980.10415332}, ' ...
'author = {P. M. Sagar}, ' ... 
'year = {1980}, ' ...
'title = {Life Cycle and Growth of the {A}ntarctic Gammarid Amphipod \emph{Paramoera walkeri} ({S}tebbing, 1906)}, ' ...
'journal = {Journal of the Royal Society of New Zealand}, ' ...
'volume = {10(3)}, ' ...
'pages = {259-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

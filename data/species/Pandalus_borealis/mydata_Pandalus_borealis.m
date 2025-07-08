function [data, auxData, metaData, txtData, weights] = mydata_Pandalus_borealis 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Pandalidae';
metaData.species    = 'Pandalus_borealis'; 
metaData.species_en = 'Northern prawn'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MPN', 'MN'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp, it lives at 0-8 degrees according to Wiki
metaData.data_0     = {'aj';'am';'Lj';'Lp';'Li';'Wwb'}; 
metaData.data_1     = {'t-L_f'; 'L-N_f'; 'L-Ww'; 'L-Wd'; 'L-E'; 'T-ap'; 'Wd-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine', 'Bas Kooijman'}; 
metaData.date_subm = [2017 03 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 20]; 

%% set data
% zero-variate data

data.tj = 3*30.5;   units.tj = 'd';   label.tj = 'time since birth at metam';  bibkey.tj = 'Alle1959';
  temp.tj = C2K(7); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 8*365;    units.am = 'd';   label.am = 'life span';                  bibkey.am = 'Wiki';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.5;     units.Lj  = 'cm'; label.Lj  = 'total length at metam';     bibkey.Lj  = 'Alle1959';  
data.Lp  = 7.9;     units.Lp  = 'cm'; label.Lp  = 'total length at puberty';   bibkey.Lp  = 'Alle1959'; 
 comment.Lp = '9.5 cm for secondary females';
data.Li  = 16.5;    units.Li  = 'cm'; label.Li  = 'ultimate total length';     bibkey.Li  = 'Wiki';

data.Wwb = 7e-4;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Alle1959';
  comment.Wwb = 'based on egg diameter of 1.1 mm: 4/3 * pi * 0.055^3';
 
% uni-variate data
% t-L data
data.tL_fUK = [ ... % time since birth (yr), total length (cm)
0.254	3.047
0.379	4.172
0.477	4.657
0.596	5.278
0.793	5.684
0.846	6.189
1.109	7.294
1.161	8.187
1.279	8.341
1.352	8.535
1.464	8.670
1.609	9.077
1.972	9.075
2.117	9.773
2.183	9.908
2.380	10.800
2.479	10.761
2.598	10.935
2.796	10.972
2.856	11.108
2.935	10.874
3.087	10.873];  
data.tL_fUK(:,1) = data.tL_fUK(:,1) * 365; % convert yr to d
units.tL_fUK   = {'d', 'cm'};  label.tL_fUK = {'time since birth', 'total length'};  
temp.tL_fUK    = C2K(8.5);  units.temp.tL_fUK = 'K'; label.temp.tL_fUK = 'temperature';
bibkey.tL_fUK = 'Alle1959';
comment.tL_fUK = 'data for Northumberland females';
%
data.tL_mUK = [ ...
0.392	4.017
0.602	5.200
0.794	5.432
0.846	6.092
0.938	6.285
0.964	6.518
1.116	7.041
1.161	7.662
1.253	7.992
1.352	8.108
1.451	8.068
1.610	8.300
1.788	8.474
1.847	8.745];  % cm, total length at f and T
data.tL_mUK(:,1) = data.tL_mUK(:,1) * 365; % convert yr to d
units.tL_mUK   = {'d', 'cm'};  label.tL_mUK = {'time since birth', 'total length'};  
temp.tL_mUK    = C2K(8.5);  units.temp.tL_mUK = 'K'; label.temp.tL_mUK = 'temperature';
bibkey.tL_mUK = 'Alle1959';
comment.tL_mUK = 'data for Northumberland males';
%
data.tL_M = [ ... % total length (cm), fecundity (#)
0.567	4.103
0.683	5.152
0.817	5.240
0.902	5.749
0.974	5.868
1.065	6.257
1.154	6.586
1.186	7.066
1.280	7.816
1.362	8.025
1.432	8.024
1.503	8.263
1.560	9.013
1.620	9.072
1.674	9.221
1.815	10.090
1.902	10.058
1.969	10.208
2.046	10.477
2.086	10.416
2.180	11.135
2.281	11.254
2.348	11.253
2.433	11.402
2.502	11.281
2.611	11.940
2.731	11.788
2.827	11.816];
data.tL_M(:,1) = data.tL_M(:,1) * 365; % convert yr to d
units.tL_M = {'d', 'cm'}; label.tL_M = {'time since birth', 'total length'};  
temp.tL_M    = C2K(8.5);  units.temp.tL_M = 'K'; label.temp.tL_M = 'temperature';
bibkey.tL_M = 'ApolStev1986';
comment.tL_M = 'Data from Gulf of Maine';

% L-W data
LWWE = [ ... % carapax length (cm), wet weight (g), dry weight (g), energy (Kcal)
0.8 0.440 0.063  0.252
1.5 2.753 0.589  3.411
1.9 5.348 1.271  7.143
2.2 8.043 1.943 10.616];
LWWE(:,1) = LWWE(:,1) * 130/26; % convert carapax length to total length
data.LWw = LWWE(:,[1 2]); % total length (cm), wet weight (g) 
units.LWw = {'cm', 'mg'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'ShumPerk1985';
comment.LWw = 'Conversion carapax to total length based on ApolStev1986';
%
data.LWd = LWWE(:,[1 3]); % total length (cm), dry weight (g) 
units.LWd = {'cm', 'mg'}; label.LWd = {'total length', 'dry weight'};  
bibkey.LWd = 'ShumPerk1985';
comment.LWd = 'Conversion carapax to total length based on ApolStev1986';
%
data.LE = LWWE(:,[1 4]); data.LE(:,2) = 4184 * data.LE(:,2); % total length (cm), energy content (J) 
units.LE = {'cm', 'mJ'}; label.LE = {'total length', 'energy content'};  
bibkey.LE = 'ShumPerk1985';
comment.LE = 'Conversion carapax to total length based on ApolStev1986';

% length - fecundity
data.LN_N = [ ... % total length (cm), fecundity (#)
8.483	539.067
8.973	649.718
9.490	770.856
9.993	891.958
10.497	976.604
11.000	1128.955
11.503	1296.931
11.978	1527.334
12.505	1783.916
13.137	2165.770
13.728	2620.433
14.251	3095.755];
units.LN_N = {'cm', '#'}; label.LN_N = {'total length', '# of eggs'};  
temp.LN_N    = C2K(7);  units.temp.LN_N = 'K'; label.temp.LN_N = 'temperature';
bibkey.LN_N = 'Alle1959';
comment.LN_N = 'Data from Norway';
%
data.LN_UK = [ ... % total length (cm), fecundity (#)
7.995	303.421
8.459	372.338
9.016	457.123
9.493	583.364
9.972	589.819
10.503	648.494
10.991	920.597
11.523	927.191
12.001	970.103
12.486	1335.951];
units.LN_UK = {'cm', '#'}; label.LN_UK = {'total length', '# of eggs'};  
temp.LN_UK    = C2K(8.5);  units.temp.LN_UK = 'K'; label.temp.LN_UK = 'temperature';
bibkey.LN_UK = 'Alle1959';
comment.LN_UK = 'Data from Northumberland';

% temperature-tp data
data.Ttp = [ ... % temperature (C), time since birth at puberty
0.257	6.016
1.523	5.986
2.512	5.000
3.693	4.999
4.513	4.014
4.878	4.013
5.515	3.000
6.697	2.830
8.458	2.265
9.273	2.531];
units.Ttp = {'C', 'yr'}; label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'ApolStev1986';

% weight - O2 consumption
data.WdJO = [ ... log10 larval dry weight (mg), log10 dioxygen consumption (mug O_2/h)
-0.504	0.072
-0.441	0.025
-0.304	0.044
-0.290	0.119
-0.161	0.234
-0.095	0.153
0.009	0.197
0.042	0.303
0.140	0.416
0.196	0.406
0.201	0.422
0.326	0.547
0.333	0.588
0.425	0.600];
data.WdJO = 10.^data.WdJO; % remove log transform
units.WdJO = {'mg', 'mug O_2/h'}; label.WdJO = {'dry weight', 'O_2 consumption'};  
temp.WdJO    = C2K(8);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'ChabOuel2005';
%
data.WwJO = [ ... log10 wet weight (g), log10 dioxygen consumption (mug O_2/h)
-0.674	-1.041
-0.637	-1.360
-0.582	-1.157
-0.562	-1.224
-0.482	-1.445
-0.475	-1.257
-0.461	-1.274
-0.457	-1.014
-0.402	-1.007
-0.387	-0.858
-0.353	-0.990
-0.325	-1.116
-0.306	-0.878
-0.292	-1.027
-0.267	-1.192
-0.266	-1.044
-0.238	-1.039
-0.153	-0.953
-0.134	-1.015
0.254	-0.886
0.440	-0.595
0.524	-0.573
0.640	-0.449
0.642	-0.476
0.677	-0.531
0.697	-0.434
0.798	-0.481
0.891	-0.360
0.899	-0.509
0.934	-0.405
0.943	-0.336
0.955	-0.301
1.013	-0.311
1.018	-0.318
1.071	-0.264];
data.WwJO = 10.^data.WwJO; % remove log transform
units.WwJO = {'g', 'mg O_2/h'}; label.WwJO = {'wet weight', 'O_2 consumption'};  
temp.WwJO  = C2K(8);  units.temp.WwJO = 'K'; label.temp.WwJO = 'temperature';
bibkey.WwJO = 'DaouChab2007';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fUK','tL_M','tL_mUK'}; subtitle1 = {'data for UK females, Maine mixed, UK males'};
set2 = {'LN_N','LN_UK'}; subtitle2 = {'data from Norway, Northumberland'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males and females are assumed to have the same parameters';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males convert to females after one or 2 yr (secondary females); primary females comprise half of the population';
metaData.bibkey.F1 = 'Alle1959'; 
F2 = '6 larval moults, the 7th involves metam; 14 moults to grow from 21 to 93 mm; 4 moults are required to transform from male to female';
metaData.bibkey.F2 = 'Alle1959'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '96967'; % ITIS
metaData.links.id_EoL = '46516073'; % Ency of Life
metaData.links.id_Wiki = 'Pandalus_borealis'; % Wikipedia
metaData.links.id_ADW = 'Pandalus_borealis'; % ADW
metaData.links.id_Taxo = '33850'; % Taxonomicon
metaData.links.id_WoRMS = '107649'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pandalus_borealis}}';
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
bibkey = 'Alle1959'; type = 'Article'; bib = [ ... 
'author = {Allen, J. A.}, ' ... 
'year = {1959}, ' ...
'title = {On the biology of \emph{Pandalus borealis} {K}royer, with reference to a population off the {N}orthumberland coast}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {38}, ' ...
'pages = {189--220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ApolStev1986'; type = 'Techreport'; bib = [ ... 
'author = {Apollpnoi, S. and Stevenson, D. K. and Dunton, E. E.}, ' ... 
'year = {1986}, ' ...
'title = {Effects of temperature on the biology of \emph{Pandalus borealus}, in the {G}ulf of {M}aine}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShumPerk1985'; type = 'Techreport'; bib = [ ... 
'author = {S. E. Shumway and H. C. Perkins and D. F. Schick and A. P. Stickney}, ' ... 
'year = {1985}, ' ...
'title = {Synopsis of biological data on the Pink Shrimp, \emph{Pandalus borealis} {K}royer, 1838}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChabOuel2005'; type = 'Article'; bib = [ ... 
'author = {Chabot, D. and Ouellet, P.}, ' ... 
'year = {2005}, ' ...
'title = {Rearing \emph{Pandalus borealis} larvae in the laboratory II. {R}outine oxygen consumption, maximum oxygen consumption and metabolic scope at three temperatures}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {147}, ' ...
'pages = {881-894}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DaouChab2007'; type = 'Article'; bib = [ ... 
'author = {D. Daoud and D. Chabot and C. Audet and Y. van Lambert}, ' ... 
'year = {2007}, ' ...
'title = {Temperature induced variation in oxygen consumption of juvenile and adult stages of the {N}orthern shrimp, \emph{Pandalus borealis}}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {347}, ' ...
'pages = {30-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

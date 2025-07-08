  function [data, auxData, metaData, txtData, weights] = mydata_Silurus_glanis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Siluridae';
metaData.species    = 'Silurus_glanis'; 
metaData.species_en = 'Wels catfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2014 03 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data
data.ab = 7;       units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = {'ADW','IUCN'}; 
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2355;    units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'AlpKara2011';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from tL-data for L = 87.5 cm';
data.am = 80*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = {'nlWiki','ADW'};   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.7;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'ADW';
data.Lp = 87.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
  comment.Lp = 'for females';
data.Li = 278;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AlpKara2011';
  comment.Wwb = 'W at L = 0.7 cm';
data.Wwp = 4.5e3;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'AlpKara2011'; 
  comment.Wwp = 'W at L = 87.5 cm';
data.Wwi = 114e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 114 * 3e4/ 365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = {'Wiki'};  
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'computed from (eggs/kg/yr)';

% univariate data
% length-weight data from AlpKara2011 for male
data.LW_m = [ ... % total length (cm), wet weight (g)
35.052	347.222
37.629	520.833
40.722	347.222
44.845	694.444
48.969	868.056
53.608	1041.667
61.856	1562.500
63.402	1909.722
63.402	868.056
68.557	2430.556
69.072	2951.389
71.134	2083.333
78.351	3645.833
78.866	4340.278
79.381	4166.667
79.897	3298.611
83.505	3993.056
84.021	4861.111
87.629	5208.333
87.629	6250.000
90.722	8506.944
84.536	3819.444
88.660	4166.667
90.206	4166.667
92.784	4687.500
91.237	5381.944
92.268	6250.000
95.876	6597.222
97.423	6076.389
101.546	5902.778
100.515	7118.056
99.485	7638.889
97.423	8333.333
100.000	8854.167
103.093	7986.111
107.732	8159.722
106.701	8854.167
106.701	10243.056
105.155	9375.000
109.278	10069.444
111.856	10937.500
113.918	10937.500
109.278	11631.944
112.887	9201.389
115.464	9895.833
115.979	10590.278
118.557	10069.444
118.557	11284.722
120.103	12152.778
120.103	12847.222
120.619	14583.333
122.165	14409.722
123.711	11111.111
126.804	11458.333
124.227	13020.833
125.773	13541.667
127.320	14062.500
132.474	15625.000
136.082	15104.167
133.505	17361.111
132.990	18055.556
132.990	20312.500
137.629	17881.944
139.691	18229.167
139.175	20138.889
140.206	20833.333
146.392	20312.500
147.423	19791.667
148.454	19270.833
161.856	25000.000
149.485	30034.722
179.381	41145.833
186.598	42708.333];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'male'};  bibkey.LW_m = 'AlpKara2011';
bibkey.LW_m = {'AlpKara2011'};
comment.LW_m = 'Data for males';
% for female
data.LW_f = [ ... % total length (cm), wet weight (g)
33.505	346.021
35.052	346.021
37.629	519.031
39.691	692.042
40.722	173.010
43.814	692.042
45.876	865.052
47.423	173.010
48.969	865.052
50.515	1211.073
53.608	1211.073
55.155	1211.073
58.247	1211.073
64.948	1903.114
70.103	3287.197
71.134	2595.156
72.165	2249.135
73.196	2941.176
75.258	2768.166
75.773	3460.208
77.835	3979.239
79.381	2768.166
80.412	3287.197
80.412	4325.260
82.474	5190.311
84.536	5536.332
86.082	6228.374
82.990	3979.239
86.598	4152.249
86.598	4671.280
89.175	3979.239
89.175	4671.280
89.691	5709.343
90.722	6747.405
94.330	6920.415
97.423	6920.415
101.546	7785.467
99.485	5882.353
95.361	5190.311
92.784	5017.301
91.753	5709.343
101.031	6401.384
102.577	6920.415
105.670	7266.436
105.670	8131.488
105.155	8650.519
105.155	9861.592
103.093	9169.550
108.247	9861.592
110.309	8823.529
110.309	10553.633
116.495	10034.602
114.948	10899.654
119.072	12629.758
121.134	13148.789
122.165	13840.830
124.742	12975.779
124.742	14705.882
131.443	14878.893
132.474	15743.945
131.959	17301.038
141.753	22145.329
144.845	22837.370
151.031	25086.505
155.670	25432.526
150.515	27162.630];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'female'};  bibkey.LW_f = 'AlpKara2011';
bibkey.LW_f = 'AlpKara2011';
comment.LW_f = 'Data for females';

% t-L-data from AlpKara2011
% temp is > 20C during >6 months
data.tL = [ ... % time (yr), total length (cm)
0.039	14.328
0.979	22.516
1.958	35.309
3.015	49.638
3.955	63.966
4.973	76.759
5.952	86.482
6.970	93.646
7.949	103.881
9.045	110.021
9.907	120.256
10.964	123.838
11.943	134.072
13.000	133.561
13.979	145.330
14.997	159.147
15.976	162.729
16.955	168.870
17.934	155.053
18.952	159.659
19.970	165.288];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlpKara2011';

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

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Stay in nest on yolksack';
metaData.bibkey.F1 = {'ADW','IUCN'};
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YPTG'; % Cat of Life
metaData.links.id_ITIS = '164068'; % ITIS
metaData.links.id_EoL = '46581838'; % Ency of Life
metaData.links.id_Wiki = 'Silurus_glanis'; % Wikipedia
metaData.links.id_ADW = 'Silurus_glanis'; % ADW
metaData.links.id_Taxo = '44028'; % Taxonomicon
metaData.links.id_WoRMS = '154677'; % WoRMS
metaData.links.id_fishbase = 'Silurus-glanis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Wels_catfish}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nlWiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Europese_meerval}}';  
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
bibkey = 'AlpKara2011'; type = 'Article'; bib = [ ...    
'author = {Alp, A. and Kara, C. and Uckardes, F. and Carol, J. and Garcia-Berthou, E.}, ' ...
'year  = {2011}, ' ...
'title = {Age and growth of the {E}uropean catfish (\emph{Silurus glanis}) in a {T}urkish Reservoir and comparison with introduced populations}, ' ...  
'journal = {Rev Fish Biol Fisheries}, ' ...
'volume = {21}, ' ...
'pages = {283-294}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IUCN'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/40713/0}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Silurus_glanis/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/289}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


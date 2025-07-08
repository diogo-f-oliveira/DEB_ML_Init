function [data, auxData, metaData, txtData, weights] = mydata_Mesembriomys_gouldii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Mesembriomys_gouldii'; 
metaData.species_en = 'Black-footed tree-rat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 17];              

%% set data
% zero-variate data

data.tg = 44;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 47;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 71;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.8*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 34.9;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 830;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 4*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 4 litters per yr assumed';
  
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (wk), weight (g)
0.670	33.149
1.005	41.436
1.508	43.094
2.513	46.409
3.350	51.381
3.518	56.354
4.523	59.669
5.360	58.011
5.695	72.928
6.868	71.271
6.868	71.271
8.208	89.503
8.878	92.818
9.883	109.392
10.553	109.392
11.390	129.282
12.730	130.939
13.735	150.829
14.573	155.801
15.578	172.376
16.750	177.348
17.588	187.293
18.258	193.923
19.430	212.155
20.603	215.470
21.441	235.359
22.111	238.674
23.618	266.851
24.456	258.564
25.293	280.110
26.466	276.796
27.638	304.972
28.308	291.713
29.313	338.122
30.318	318.232
31.323	358.011
32.161	343.094
33.333	379.558
34.171	371.271
35.511	404.420
36.516	399.448
37.521	437.569
38.526	422.652
39.866	444.199
40.369	437.569
41.876	467.403
42.379	457.459
44.389	492.265
44.556	482.320
45.729	523.757
46.231	497.238
48.074	546.961
48.409	497.238
49.749	551.934
50.084	517.127
52.261	581.768
52.261	540.331
54.271	606.630
54.439	546.961
56.114	631.492
56.281	573.481
57.621	629.834
58.291	586.740
60.134	604.972
60.302	658.011
61.809	692.818
62.647	636.464
63.987	644.751
64.154	694.475
65.829	696.133
67.169	658.011
67.504	696.133
68.844	696.133
70.352	709.392
70.519	701.105
71.859	740.884
72.864	722.652
74.037	769.061
74.874	739.227
75.879	775.691
77.219	754.144
77.889	790.608
80.570	808.840
80.570	767.403
82.580	808.840
83.250	792.265
84.757	795.580
85.595	818.785
87.102	840.331
89.280	841.989
91.290	845.304
93.467	848.619
95.477	853.591
97.320	873.481];
data.tWw_f(:,1) = data.tWw_f(:,1); %  Cric1969 says d, but wk is assumed
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Cric1969';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (wk), weight (g)
0.503	39.779
0.838	39.779
1.508	41.436
2.680	53.039
3.518	46.409
4.523	66.298
4.858	59.669
4.858	58.011
6.533	79.558
6.533	72.928
8.878	91.160
8.878	99.448
11.055	112.707
11.055	106.077
12.898	102.762
12.898	125.967
13.903	145.856
14.740	130.939
16.583	147.514
16.750	160.773
18.090	164.088
18.258	172.376
20.771	192.265
20.771	182.320
22.446	202.210
22.446	200.552
24.288	225.414
24.288	218.785
26.298	227.072
26.298	218.785
28.141	240.331
28.308	250.276
30.318	271.823
32.328	290.055
34.171	309.945
36.348	324.862
37.856	349.724
39.363	353.039
40.704	372.928
41.039	372.928
42.379	401.105
43.551	399.448
44.389	430.939
45.394	425.967
46.064	447.514
48.409	483.978
50.586	497.238
52.429	532.044
54.439	551.934
57.789	593.370
59.966	618.232
60.469	593.370
66.499	691.160
68.342	719.337
70.184	742.541
72.529	752.486
83.920	788.950
88.107	795.580
90.117	830.387
92.295	830.387];
data.tWw_m(:,1) = data.tWw_m(:,1); %  Cric1969 says d, but wk is assumed
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Cric1969';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 10 * weights.tWw_f;
weights.tWw_m = 10 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Lives in Pandanus stands';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZY6K'; % Cat of Life
metaData.links.id_ITIS = '585365'; % ITIS
metaData.links.id_EoL = '1179213'; % Ency of Life
metaData.links.id_Wiki = 'Mesembriomys_gouldii'; % Wikipedia
metaData.links.id_ADW = 'Mesembriomys_gouldii'; % ADW
metaData.links.id_Taxo = '89088'; % Taxonomicon
metaData.links.id_MSW3 = '13001520'; % Mammal Spec World
metaData.links.id_AnAge = 'Mesembriomys_gouldii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mesembriomys_gouldii}}';
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
bibkey = 'Cric1969'; type = 'Article'; bib = [ ... 
'author = {Elizabeth G. Crichton}, ' ... 
'year = {1969}, ' ...
'title = {REPRODUCTION  IN THE  PSEUDOMYINE RODENT \emph{Mesembriomys gouldii} ({G}RAY) ({M}URIDAE)}, ' ...
'journal = {Aust. J. Zool.}, ' ...
'volume = {17}, ' ...
'pages = {785-797}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Mesembriomys_gouldii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


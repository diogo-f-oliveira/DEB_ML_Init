function [data, auxData, metaData, txtData, weights] = mydata_Lepidion_schmidti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Moridae';
metaData.species    = 'Lepidion_schmidti'; 
metaData.species_en = 'Schmidt''s cod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 01];

%% set data
% zero-variate data

data.am = 49*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'KoroMalt2023';   
  temp.am = C2K(6.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Lepidion lepidion';
data.Li  = 112;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'KoroMalt2023';
  comment.Li = 'fishbase gives 85 cm';

data.Wwb  = 2.7e-4;   units.Wwb  = 'cm';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Pseudophycis_bachus: pi/6*0.08^3';
data.Wwp = 57;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on LW data for Lp; 0.00537*Lp^3.22, see F1, gives 290 g';
data.Wwi = 14.5e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KoroMalt2023';
 
data.Ri = 7329/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(6.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.6';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
21.931	46.096
22.029	51.619
22.957	41.994
22.993	52.189
23.990	53.893
24.148	45.681
24.955	54.888
25.087	62.959
25.987	63.104
26.045	49.229
26.916	58.011
26.980	57.020
27.008	46.118
27.946	59.856
27.948	65.378
28.945	68.073
29.004	55.046
29.035	53.206
30.036	62.980
30.965	56.753
31.926	49.395
31.962	58.315
33.087	59.169
34.021	64.129
34.023	68.235
35.016	62.151
35.989	84.102
37.074	63.575
37.974	64.429
37.978	75.898
38.040	69.668
39.002	63.017
39.070	73.920
45.046	71.113
46.052	94.905
49.048	111.908];
data.tL_f(:,1) = 365 * (0.8+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'length', 'females'};  
temp.tL_f    = C2K(6.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KoroMalt2023';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
21.996	48.362
22.026	43.123
25.018	52.481
25.048	46.676
25.983	53.618
29.002	48.675
29.040	64.675
29.965	47.971
30.036	64.679
31.030	58.878
31.059	50.807
31.063	61.710
31.993	56.050
32.061	64.546
32.962	67.664
33.022	57.612
33.089	63.276
35.726	67.534
36.079	66.686
37.140	68.531
38.005	61.880
39.039	76.185
40.033	69.959
41.003	84.689];
data.tL_m(:,1) = 365 * (0.8+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'length', 'males'};  
temp.tL_m    = C2K(6.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KoroMalt2023';

% length-weight
data.LW_f = [ ... % time since birth (d), total length (cm)
42.106	431.522
42.695	497.806
45.893	662.795
47.069	362.932
47.406	562.374
47.744	728.554
48.332	628.518
48.838	861.155
49.341	528.306
49.680	993.862
50.267	694.242
51.109	760.419
51.446	860.071
52.033	660.242
52.204	1059.340
52.624	892.846
53.296	892.566
53.969	892.286
54.308	1224.786
55.232	1024.817
56.747	1223.771
57.003	1822.418
57.589	1323.213
57.843	1555.956
57.924	1123.490
58.516	1555.676
59.525	1555.256
59.691	1122.755
62.049	1687.264
63.311	1653.474
63.400	2551.566
63.563	1520.314
63.649	1852.918
64.236	1653.089
64.323	2152.014
64.827	1952.220
65.164	2184.929
65.251	2550.797
65.921	2018.294
66.595	2184.334
66.928	1685.235
67.601	1684.955
68.360	1884.224
68.695	1651.235
69.285	1883.839
70.044	2349.219
71.141	2880.989
73.831	2480.702
76.100	2113.853
77.113	2845.240
81.917	4572.974
81.922	5437.836
84.194	5536.684
95.147	8891.797
112.086	14639.432];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'length', 'weight', 'females'};  
bibkey.LW_f = 'KoroMalt2023';
%
data.LW_m = [ ... % time since birth (d), total length (cm)
42.947	464.436
43.957	497.281
46.818	662.411
47.407	795.223
48.753	728.135
51.362	893.371
53.044	859.406
56.242	1057.661
56.915	1157.173
57.758	1389.672
58.009	1223.247
60.029	1355.462
61.544	1620.945
62.300	1321.255
63.310	1553.682
64.573	1652.949
64.995	1885.623
67.014	1884.784
67.688	2150.615
68.529	2083.738
69.287	2349.534
70.211	2116.302
70.885	2149.286
76.444	3510.800
83.430	4272.969
84.943	4039.490];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'length', 'weight', 'males'};  
bibkey.LW_m = 'KoroMalt2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.Li = 3 * weights.Li;
weights.Wwp = 3 * weights.Wwp;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6P9NX'; % Cat of Life
metaData.links.id_ITIS = '550833'; % ITIS
metaData.links.id_EoL = '46565005'; % Ency of Life
metaData.links.id_Wiki = 'Lepidion'; % Wikipedia
metaData.links.id_ADW = 'Lepidion_schmidti'; % ADW
metaData.links.id_Taxo = '178351'; % Taxonomicon
metaData.links.id_WoRMS = '126496'; % WoRMS
metaData.links.id_fishbase = 'Lepidion-schmidti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidion}}';
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
bibkey = 'KoroMalt2023'; type = 'Article'; bib = [ ... 
'doi = {10.3390/jmse11061212}, ' ...
'author = {Korostelev, N.B. and Maltsev, I.V. and Orlov, A.M.}, ' ... 
'year = {2023}, ' ...
'title = {First Data on the Age and Growth of {S}chmidt''s cod \emph{Lepidion schmidti} ({M}oridae) from Waters of the {E}mperor {S}eamounts ({N}orthwestern {P}acific)}, ' ...
'journal = {J. Mar. Sci. Eng.}, ' ...
'volume = {11}, ' ...
'pages = {1212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepidion-schmidti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


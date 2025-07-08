function [data, auxData, metaData, txtData, weights] = mydata_Manis_javanica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Manis_javanica'; 
metaData.species_en = 'Sunda pangolin'; 

metaData.ecoCode.climate = {'Am','Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'tg','tx','tp','am','Li','Wwb', 'Wwp','Wwi','Ri'}; 
metaData.data_1     = {'L-Ww','t-Ww_f','t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2021 12 16];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, FRAM center, Tromso'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 12 16]; 

%% set data
% zero-variate data

data.tg = 185;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'YanZeng2021';   
  temp.tg = metaData.T_typical;  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'peak gestation for wild and captive females together';
data.tx = 3*30.5; units.tx = 'd';    label.tx = 'age at weaning'; bibkey.tx = 'ChonPanj2020';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 7 * 30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'YanZeng2021';
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'ealiest age observed with F1 generation on zoo';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Smutsia temminckii expert guess 20-30 years.';
  
data.Li = 140; units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'SulaAzma2017';
  
data.Wwb = 140;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ChonPanj2020';
 comment.Wwb = '110-140' ;

data.Wwp = 2e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'YanZeng2021';
comment.Wwp = 'value of weight close to pregnancy of indivual FG6'; 
data.Wwi = 13.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SulaAzma2017';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'YanZeng2021';   
  temp.Ri = C2K(33.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ['Females can get pregrant right after a pup dies. Reproduction is aseasonal', ...
      'The pregancy frequency in the wild is unknown.'];
  
% univariate data

tWL = [ ... d, kg, cm
    67  0.579   42;
    169 1.16    50;
    191 1.48    54;
    220 2.07    59;
    251 2.53    67;
    373 3.535   76;
    343 4.04    80;
    496 5.05    82;
    556 4.49    83;];
data.tWw = [tWL(:,1), tWL(:,2) * 1e3]; 
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight', 'YanZeng2021'};  
bibkey.tWw = 'YanZeng2021';
%
data.tL = tWL(:,[1 3]); 
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
bibkey.tL = 'YanZeng2021';

data.LWw = [ ... % total body length (cm), body weight (kg)
31.91	0.18
36.78	2.23
56.89	0.96
67.07	1.58
70.77	1.58
72.87	4.13
83.98	5.32
86.50	2.49
83.74	4.06
83.97	3.58
89.75	4.06
93.45	4.06
97.85	4.47
96.45	3.27
98.99	3.51
103.38	3.17
102.93	4.02
104.56	5.01
105.24	3.61
106.86	4.53
118.93	9.09
119.85	8.58
114.50	4.60
116.34	4.57
131.40	7.15
134.65	8.21
138.11	7.46
140.19	8.07];
data.LWw(:,2) =  data.LWw(:,2) * 1e3; % kg to g
units.LWw = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'SulaAzma2017';
   
data.tWw1 = [ ...
8.29	206.87
11.11	226.03
13.92	261.18
16.33	395.40
18.94	299.50
21.96	334.64
26.98	385.76
29.20	408.12
29.20	587.10
36.03	491.18
43.07	647.76
42.06	740.45
48.29	753.20
50.90	753.19
55.33	797.91
57.94	855.43
55.13	986.49
64.97	989.63
68.99	1203.75
72.21	1130.22
80.65	1251.63
77.24	1353.93
82.86	1408.23
86.28	1347.49
87.09	1302.74
93.12	1427.35
100.95	1449.68
103.77	1555.14
97.14	1654.26
107.99	1762.87
112.01	1999.37
114.82	1797.99
128.89	1852.25
121.86	2082.41
129.10	2107.94
138.34	1842.61];
units.tWw1 = {'d', 'g'};  label.tWw1 = {'time since birth', 'wet weight', 'maternal-reared, CabaTay2019'};  
bibkey.tWw1 = 'CabaTay2019';
comment.tWw1 = 'reared by mother';

data.tWw2 = [ ...
35.63	555.11
40.05	561.48
64.07	489.43
45.08	591.81
46.98	622.17
50.00	711.64
52.11	714.83
54.12	777.14
57.24	890.59
56.93	828.27
61.16	799.48
64.07	893.75
66.08	956.06
68.09	932.08
73.12	992.78
78.84	1031.11
82.06	1050.26
84.97	1198.87
85.98	1189.28
91.21	1101.35
92.91	1101.35
96.23	1144.48
99.25	1163.64
103.87	1181.19
105.88	1106.07
108.99	1171.58
114.32	1219.49
114.32	1219.49
122.16	1328.12
137.84	1449.49
151.01	1380.70
161.06	1521.28];
units.tWw2 = {'d', 'g'};  label.tWw2 = {'time since birth', 'wet weight', 'maternal-reared, CabaTay2019'};  
bibkey.tWw2 = 'CabaTay2019';
comment.tWw2 = 'reared by mother';


%% set weights for all real data
weights = setweights(data, []);
%weights.tWw = 0 * weights.tWw;
%weights.tWw1 = 0 * weights.tWw1;
%weights.tWw2 = 0 * weights.tWw2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% group plots
set1 = {'tWw','tWw1','tWw2'}; subtitle1 = {'YanZeng2021, CabaTay2019 (mother reared), CabaTay2019 (hand reared)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'mature forests are important for repro of this species';
metaData.bibkey.F1 = 'ChonPanj2020'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7VRVB'; % Cat of Life
metaData.links.id_ITIS = '584930'; % ITIS
metaData.links.id_EoL = '337659'; % Ency of Life
metaData.links.id_Wiki = 'Manis_javanica'; % Wikipedia
metaData.links.id_ADW = 'Manis_javanica'; % ADW
metaData.links.id_Taxo = '168635'; % Taxonomicon
metaData.links.id_MSW3 = '13900012'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Manis_javanica}}';
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
bibkey = 'ChonPanj2020'; type = 'Incollection'; bib = [ ... 
'author = {Ju Lian Chong and Elisa Panjang and Daniel Willcox and Helen C. Nash and Gono Semiadi and Withoon Sodsai and Norman T. L. Lim and Louise Fletcher and Ade Kurniawan and Shavez Cheema}, ' ... 
'doi = {10.1016/B978-0-12-815507-3.00006-X}, ' ...
'year = {2020}, ' ...
'title = {Sunda pangolin \emph{Manis javanica} ({D}esmarest, 1822)}, ' ...
'booktitle = {Pangolins: Science, Society and Conservation}, ' ...
'pages = {89--108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YanZeng2021'; type = 'Article'; bib = [ ... 
'author = {Dingyu Yan and Xiangyan Zeng and Miaomiao Jia and Xiaobing Guo and Siwei Deng and Li Tao and Xiaolu Huang and Baocai Li and Chang Huang and Tengcheng Que and Kaixiang Li and Wenhui Liang and Yao Zhao and Xingxing Liang and Yating Zhong and Sara Platto and Siew Woh Choo}, ' ... 
'journal = {communications biology}, ' ...
'year = {2021}, ' ...
'volume = {4}, ' ...
'doi = {10.1038/s42003-021-02760-4}, ' ...
'title = {Successful captive breeding of a {M}alayan pangolin population to the third filial generation}, ' ...
'pages = {1212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SulaAzma2017'; type = 'Article'; bib = [ ... 
'author = {Muhammad Hafiz SULAIMAN and Wahizatul Afzan AZMI and Marina HASSAN and and Ju Lian CHONG}, ' ... 
'journal = {Folia Zool}, ' ...
'year = {2017}, ' ...
'volume = {66}, ' ...
'number = {4}, ' ...
'title = {Current updates on the morphological measurements of the {M}alayan pangolin (\emph{Manis javanica})}, ' ...
'pages = {262--266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CabaTay2019'; type = 'Article'; bib = [ ... 
'author = {Francis Cabana and Claudia Tay and Irfan Arif}, ' ... 
'journal = {Journal of Zoo and Aquarium Research}, ' ...
'year = {2019}, ' ...
'volume = {7}, ' ...
'number = {1}, ' ...
'title = {Comparison of growth rates of hand-reared and mother-reared {S}unda pangolin (\emph{Manis javanica}) pups at the {N}ight {S}afari ({S}ingapore)}, ' ...
'pages = {44--49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/337659/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Manis_javanica/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


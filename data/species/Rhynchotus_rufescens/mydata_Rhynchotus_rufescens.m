function [data, auxData, metaData, txtData, weights] = mydata_Rhynchotus_rufescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Tinamiformes'; 
metaData.family     = 'Tinamidae';
metaData.species    = 'Rhynchotus_rufescens'; 
metaData.species_en = 'Red-winged tinamou'; 

metaData.ecoCode.climate = {'A', 'Cfa', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.45); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Carlos MGL Teixeira'};    
metaData.date_mod_1 = [2015 05 06];              
metaData.email_mod_1    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address_mod_1  = {'Lisbon University'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2017 11 24];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 06 20];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'ARKive';   
  temp.ab = C2K(36);     units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from TholQuei2007';
data.tx = 7;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'PURP';   
  temp.tx = C2K(39.45);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from the Chilean Tinamou (Nothoprocta perdicaria) WithForb1987';
data.tp = 100;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'CaboChri2020';   
  temp.tp = C2K(39.45);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on adult plumage';
data.tR = 340;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'TholQuei2007';
  temp.tR = C2K(39.45);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5475;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(39.45);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 40.75;units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'ARKive';

data.Wwb = 35.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'TholQuei2007';
data.Wwi = 745;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'TholQuei2007';

data.Ri  = 2*4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'POB';   
  temp.Ri = C2K(39.45);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, ARKive: more than 1 clutch/yr';
 
% uni-variate data

% time-weight
data.tW = [ ... % age (d) weight (g)
0 35.50959302;
1 36.6242427;
2 39.22509195;
3 39.22509195;
4 37.73889238;
5 48.88538919;
6 51.85778835;
7 50.74313866;
8 54.08708771;
9 57.05948686;
10 65.23358452;
11 59.28878622;
12 74.89388176;
13 74.89388176;
14 75.63698155;
15 82.32487964;
16 84.18262911;
17 97.92997518;
18 97.92997518;
19 104.98942316;
20 106.47562274;
21 104.24632338;
22 103.1316737;
23 115.0212703;
24 124.68156754;
25 119.85141892;
26 140.65821297;
27 140.65821297;
28 141.02976287;
30 145.48836159;
31 154.03400915;
33 175.2123531;
34 172.23995395;
35 172.23995395;
36 172.61150384;
37 171.86840406;
38 189.70279896;
39 190.07434885;
40 220.54144015;
41 214.59664185;
42 211.6242427;
43 211.6242427;
44 220.16989026;
45 233.54568643;
46 240.97668431;
47 253.9809306;
48 253.9809306;
49 247.6645824;
50 253.9809306;
51 266.98517688;
52 285.56267157;
53 263.64122784;
54 290.76437009;
55 296.70916839;
56 306.36946563;
57 291.50746987;
58 305.25481595;
59 317.88751234;
60 324.20386053;
61 340.55205586;
62 336.46500703;
63 341.29515565;
64 327.54780958;
65 346.49685416;
66 370.64759726;
67 358.38645077;
68 367.67519811;
69 373.24844652;
70 386.6242427;
71 370.64759726;
73 400.37158877;
74 400.00003888;
76 405.57328728;
77 425.63698155;
78 395.91299004;
79 418.94908346;
80 432.69642953;
81 415.60513442;
82 436.41192847;
83 438.26967794;
83 466.13591998;
85 425.26543166;
86 450.53082444;
87 465.39282019;
88 427.49473102;
89 462.42042104;
89 459.81957178;
91 497.34611106;
92 459.81957178;
92 487.68581382;
93 487.68581382;
95 493.63061212;
95 500.31851021;
97 502.54780958;
98 486.19961425;
98 505.89175862;
99 518.52445501;
101 508.49260788;
101 528.18475225;
102 508.12105798;
104 524.46925331;
104 542.67519811;
105 508.49260788;
107 530.41405161;
107 537.4734996;
108 526.69855268;
109 530.04250172;
110 548.61999641;
111 557.16564397;
112 523.35460363;
113 554.93634461;
114 530.04250172;
115 567.569041;
116 545.64759726;
117 570.91299004;
118 576.85778835;
119 554.19324482;
120 576.48623845;
121 548.24844652;
122 598.03613229;
123 569.79834036;
124 592.46288389;
125 595.06373314;
126 576.11468856;
127 548.24844652;
128 604.35248049;
129 604.35248049;
130 563.48199217;
131 606.95332975;
132 598.03613229;
133 585.03188601;
134 573.14228941;
135 595.06373314;
136 620.32912592;
137 595.80683293;
138 603.9809306;
139 580.57328728;
140 610.66882868;
141 585.4034359;
142 609.9257289;
143 615.4989773;
144 604.35248049;
145 601.75163123;
146 611.04037858;
147 605.09558028;
148 612.52657815;
149 627.7601238;
150 621.44377561;
151 583.91723633;
152 639.27817051;
153 640.39282019;
154 628.50322359;
155 625.90237433;
156 622.55842529;
157 650.42466733;
158 625.90237433;
159 614.01277773;
160 652.2824168;
161 641.87901977;
162 620.32912592;
163 611.04037858;
164 665.65821297;
165 616.24207709;
166 641.13591998;
167 628.50322359;
168 650.05311743;
169 644.85141892;
170 622.55842529;
171 655.62636584;
172 637.42042104;
173 631.10407285;
174 646.70916839;
175 625.90237433;
176 673.08921085;
177 635.56267157;
178 625.90237433;
179 642.99366945;
180 623.67307497;
181 656.74101552;
182 619.58602614;
183 625.90237433;
184 647.82381807;
185 683.12105798;
186 636.67732125;
187 643.73676924;
188 665.65821297;
189 640.39282019;
190 646.70916839;
191 656.36946563;
192 645.22296881;
193 666.40131276;
194 655.99791573;
195 673.83231064;
196 641.50746987;
197 635.19112168;
198 653.39706648;
199 680.52020873;
200 642.62211956;
201 680.52020873;
202 661.57116414;
203 649.31001764;
204 700.2123531;
205 674.57541043;
206 658.59876499;
207 647.82381807;
208 638.53507072];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.45);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TholQuei2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_4: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4STZS'; % Cat of Life
metaData.links.id_ITIS = '174427'; % ITIS
metaData.links.id_EoL = '45511985'; % Ency of Life
metaData.links.id_Wiki = 'Rhynchotus_rufescens'; % Wikipedia
metaData.links.id_ADW = 'Rhynchotus_rufescens'; % ADW
metaData.links.id_Taxo = '51378'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C141F60AC7A92F11'; % avibase
metaData.links.id_birdlife = 'red-winged-tinamou-rhynchotus-rufescens'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhynchotus_rufescens}}';
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
bibkey = 'CromStei2007'; type = 'Article'; bib = [ ... 
'author = {Cromberg, V. U. and Stein, M. S. and Boleli, I. C. and Tonhati, H. and Queiroz, S. A.}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive and Behavioral Aspects of Red-winged Tinamous (\emph{Rhynchotus rufescens}) in Groups with Different Sex Ratios}, ' ...
'journal = {Brazilian Journal of Poultry Science}, ' ...
'volume = {9}, ' ...
'number = {3}, '...
'pages = {161--166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing.}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TholQuei2007'; type = 'Article'; bib = [ ... 
'author = {Tholon, P. and Queiroz, S. A.}, ' ... 
'year = {2007}, ' ...
'title = {Models for the analysis of growth curves for rearing tinamous (\emph{Rhynchotus rufescens}) in captivity}, ' ...
'journal = {Brazilian Journal of Poultry Science}, ' ...
'volume = {9}, ' ...
'number = {1}, '...
'pages = {23--31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WithForb1987'; type = 'Article'; bib = [ ... 
'author = {Withers, P. C. and Forbes, R. B. and Hedrick, M. S.}, ' ... 
'year = {1987}, ' ...
'title = {Metabolic, water and thermal relations of the {C}hilean Tinamou}, ' ...
'journal = {The Condor}, ' ...
'volume = {89}, ' ...
'pages = {424--426}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'POB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.planetofbirds.com/tinamiformes-tinamidae-red-winged-tinamou-rhynchotus-rufescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PURP'; type = 'Misc'; bib = ...
'howpublished = {\url{http://purpleopurple.com/life-science/birds/elegant-crested-tinamou.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/red-winged-tinamou/rhynchotus-rufescens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaboChri2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.rewtin1.01}, ' ...
'author = {Cabot, J.and D. A. Christie and F. Jutglar and C. J. Sharpe and E. F. J. Garcia}, ' ...
'year = {2020}, ' ...
'title = {Red-winged Tinamou (\emph{Rhynchotus rufescens})}, ' ...
'howpublished = {version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Lynx_pardinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Lynx_pardinus'; 
metaData.species_en = 'Iberian lynx'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvb', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 68;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 8.5*30.5;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '7 till 10 mnth';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Wiki';
  temp.tp = C2K(39.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 23.7*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Based on Lynx lynx';

data.Wwb = 350; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'YergCalz2014';
data.Wwi = 9600;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'YergCalz2014';
data.Wwim = 12000;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'YergCalz2014';

data.Ri  = 2.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 1 litter per yr';

% uni-variate data
% time-weigth
data.tW_f = [ ... % time since birth (d), wet weight (10g)
4.337	32.432
8.675	35.135
14.096	43.243
17.349	43.243
17.349	56.757
18.434	83.784
22.771	51.351
24.940	64.865
26.024	70.270
27.108	97.297
29.277	78.378
34.699	121.622
36.867	89.189
36.867	110.811
40.120	97.297
43.373	135.135
45.542	100.000
48.795	121.622
50.964	100.000
52.048	154.054
55.301	137.838
55.301	175.676
56.386	154.054
61.807	167.567
63.976	221.622
65.060	197.297
69.398	181.081
71.566	218.919
73.735	237.838
81.325	235.135
83.494	275.676
85.663	208.108
87.831	262.162
88.916	305.405
90.000	283.784
92.169	337.838
96.506	297.297
98.675	305.405
105.181	348.649
108.434	332.432
108.434	421.622
111.687	402.703
113.855	435.135
116.024	354.054
117.108	364.865
124.699	413.513
133.373	445.946
133.373	510.811
134.458	521.622
137.711	548.649
140.964	459.459
140.964	486.486
145.301	529.730
146.386	527.027
147.470	551.351
153.976	510.811
158.313	575.676
160.482	589.189
163.735	613.513
169.157	510.811
170.241	554.054
172.410	645.946
178.916	608.108
182.169	586.486
182.169	683.784
186.506	621.622
187.590	718.919
190.843	608.108
193.012	740.540
199.518	605.405
203.855	727.027
216.867	759.459
225.542	672.973
226.627	683.784
230.964	694.595
230.964	689.189
230.964	662.162
242.892	708.108
245.060	856.757
247.229	813.514
249.398	727.027
252.651	705.405
264.578	686.486
272.169	702.703
278.675	802.703
283.012	748.649
283.012	770.270
284.096	800.000
294.940	778.378
299.277	802.703
306.867	989.189
307.952	802.703
323.133	854.054
325.301	835.135
333.976	991.892
333.976	864.865
340.482	864.865
349.157	856.757
357.831	854.054
369.759	810.811
388.193	827.027
393.614	845.946
403.373	881.081
414.217	856.757
417.470	1067.568
418.554	910.811
425.060	1010.811
435.904	943.243
438.072	910.811
442.410	894.595
455.422	837.838
460.843	943.243
473.855	959.459
474.940	1089.189
491.205	1056.757
506.386	1081.081
511.807	932.432
520.482	940.541
536.747	905.405
548.675	935.135
549.759	918.919
574.699	859.459
584.458	1013.513
589.880	962.162
597.470	916.216
611.566	1159.459
637.590	867.568
651.687	878.378
661.446	856.757
677.711	916.216
691.807	921.622];
data.tW_f(:,2) = 10 * data.tW_f(:,2); % convert 10 g to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'YergCalz2014';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
6.506	32.432
14.096	54.054
17.349	78.378
21.687	102.703
21.687	110.811
27.108	129.730
33.614	145.946
36.867	137.838
39.036	175.676
46.627	140.540
52.048	113.513
58.554	205.405
58.554	172.973
65.060	189.189
66.145	216.216
78.072	289.189
81.325	240.540
81.325	272.973
83.494	310.811
84.578	213.513
91.084	335.135
92.169	327.027
96.506	370.270
99.759	391.892
111.687	405.405
123.614	467.567
127.952	418.919
143.133	551.351
151.807	529.730
227.711	727.027
227.711	762.162
229.880	954.054
232.048	854.054
241.807	848.649
241.807	824.324
245.060	948.649
248.313	1086.486
277.590	878.378
284.096	867.568
284.096	824.324
416.386	900.000
490.120	1156.757
497.711	1148.649
498.795	1075.676
510.723	1170.270
537.831	1164.865
562.771	1224.324
581.205	1170.270
619.157	1108.108
627.831	1167.568];
data.tW_m(:,2) = 10 * data.tW_m(:,2); % convert 10 g to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'YergCalz2014';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3WSJV'; % Cat of Life
metaData.links.id_ITIS = '621869'; % ITIS
metaData.links.id_EoL = '347432'; % Ency of Life
metaData.links.id_Wiki = 'Lynx_pardinus'; % Wikipedia
metaData.links.id_ADW = 'Lynx_pardinus'; % ADW
metaData.links.id_Taxo = '107145'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000162'; % MSW3
metaData.links.id_AnAge = 'Lynx_pardinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lynx_pardinus}}';
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
bibkey = 'YergCalz2014'; type = 'article'; bib = [ ... 
'author = {J. Yerga and J. Calzada and X. Manteca and A. Vargas and A. Rivas}, ' ... 
'year = {2014}, ' ...
'title = {Early Development and Growth in Captive?Born {I}berian lynx (\emph{Lynx pardinus})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {33}, '...
'pages = {381-387}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lynx_pardinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


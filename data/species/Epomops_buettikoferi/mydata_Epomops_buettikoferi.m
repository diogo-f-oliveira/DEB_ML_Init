function [data, auxData, metaData, txtData, weights] = mydata_Epomops_buettikoferi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Epomops_buettikoferi'; 
metaData.species_en = 'Buettikofer''s epauletted fruit bat'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 6*30.5;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on tp, while giving birth at 365 d';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Eidolon_helvum';
data.tp = 6*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty female'; bibkey.tp = 'Thom1984';
  temp.tp = C2K(34.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 11*30.5;    units.tpm = 'd';    label.tpm = 'time since birth at puberty female'; bibkey.tpm = 'Thom1984';
  temp.tpm = C2K(34.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 21.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Eidolon_helvum';

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Thom1984';
  comment.Wwb = 'based on extrapolation of tW data';
data.Wwi = 121;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 85-132 g';
data.Wwim = 180; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 164-198 g';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Thom1984';   
  temp.Ri = C2K(34.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litter2 per yr';


% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
22.000	62.333
22.000	77.965
23.500	93.350
24.000	60.596
24.000	62.581
27.000	75.236
28.000	63.821
36.000	87.395
37.500	82.680
41.000	86.402
41.500	82.680
42.000	73.995
42.500	78.462
44.000	79.206
45.000	73.995
46.000	81.687
46.000	78.710
46.500	72.258
50.500	77.469
53.500	77.221
53.500	82.432
58.000	84.417
58.500	73.747
64.500	68.784
80.000	83.176
82.000	97.816
83.500	89.380
84.000	79.950
98.000	89.132
98.500	95.831
100.500	85.409
100.500	86.898
101.500	95.087
101.500	97.816
104.000	85.906
105.000	100.298
106.000	81.935
118.000	103.275
119.000	91.117
120.000	94.342
125.000	107.246
125.000	99.801
129.000	107.494
137.000	94.342
140.500	98.809
160.000	109.231
161.000	100.794];
units.tW_f   = {'d', 'kg'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = C2K(34.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Thom1984';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
21.227	87.627
24.273	81.722
24.932	84.820
26.224	88.846
26.268	92.567
27.702	108.685
29.273	83.252
32.406	84.789
32.456	89.130
36.211	90.664
39.717	70.804
39.854	82.586
39.894	85.997
39.909	87.237
39.941	90.028
40.010	95.919
41.904	98.082
42.585	103.040
42.650	108.621
42.834	71.101
43.037	88.464
43.186	101.177
44.667	67.992
44.736	73.884
45.007	97.138
45.496	85.663
48.661	89.991
49.975	95.877
60.498	90.251
62.772	71.636
65.083	109.456
65.506	92.400
66.307	107.590
66.788	95.495
72.209	79.658
81.005	86.133
81.255	107.527
82.551	111.862
84.231	95.731
87.461	105.640
88.942	125.789
91.314	115.546
93.154	113.058
97.901	92.883
98.082	108.386
98.557	95.670
98.622	101.252
98.919	126.677
100.038	115.819
100.555	106.825
101.251	113.023
102.464	110.227
106.107	102.150
106.798	108.039
107.472	112.377
111.752	105.537
113.161	119.484
113.197	122.585
114.616	137.463
115.569	112.342
115.819	133.737
117.499	117.605
117.520	119.466
118.708	114.500
125.777	133.074
127.457	116.943
150.002	127.390
161.267	131.993
162.575	137.259
168.807	137.543
183.755	137.479
221.168	141.041
226.162	141.950
227.469	147.216
229.888	141.004
230.381	129.839
275.554	157.864
278.625	154.130
280.693	171.176
280.693	171.176
284.763	146.352
286.059	150.688
287.406	159.364
291.259	169.271
292.295	151.282
293.081	165.232
293.616	157.788
293.722	166.779
294.884	159.643
296.227	168.009
300.442	155.588
301.659	153.102
306.048	155.564
307.323	158.039
312.899	155.535
326.703	164.159
339.203	167.827
341.043	165.338
342.259	162.852
351.660	167.774];
units.tW_m   = {'d', 'kg'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = C2K(34.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Thom1984';
comment.tW_m = 'Data for males; indivuduals > 170 g omitted, since their age is uncertain';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Males tend to be larger than females';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FWY5'; % Cat of Life
metaData.links.id_ITIS = '631576'; % ITIS
metaData.links.id_EoL = '327343'; % Ency of Life
metaData.links.id_Wiki = 'Epomops_buettikoferi'; % Wikipedia
metaData.links.id_ADW = 'Epomops_buettikoferi'; % ADW
metaData.links.id_Taxo = '63767'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800121'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epomops_buettikoferi}}';
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
bibkey = 'Thom1984'; type = 'Article'; bib = [ ... 
'author = {D. W. Thomas}, ' ... 
'year = {1984}, ' ...
'title = {Reproduction and growth in three species of {W}est {A}frican fruit bats}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {202}, ' ...
'pages = {265-281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Epomops_buettikoferi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


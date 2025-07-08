function [data, auxData, metaData, txtData, weights] = mydata_Emydura_victoriae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Emydura_victoriae'; 
metaData.species_en = 'Red-faced turtle'; 

metaData.ecoCode.climate = {'Aw', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTd', 'biFr', 'biFl'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 80;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'GaikClar2011';
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '68 till 101 d';
data.tp = 4*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'GaikClar2011';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'GaikClar2011';
  temp.tpm = C2K(24); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                        bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 6.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'GaikClar2011';
  comment.Wwb = '8 till 13 g';
data.Wwi = 1.9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = {'GaikClar2011','Jone2003'};
  comment.Wwi = 'based om max carapax length of 25 till 30 cm (Jone2003), while 16 cm corresponds with 400 g: (27/16)^3*400';
data.Wwim = 1.2e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = {'GaikClar2011','Jone2003'};
  comment.Wwim = 'based om max carapax length of 23 cm, while 16 cm corresponds with 400 g: (23/16)^3*400';

data.Ri  = 1.3*15/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'GaikClar2011';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 till 18 eggs per clutch; 1.3 clutch per yr';

% uni-variate data

% time-weight
data.tW_f = [ ... % time (d), weight (g)
3.483	9.165
6.095	7.332
13.930	9.165
20.025	10.081
26.990	10.998
33.085	10.998
39.179	11.914
44.403	10.998
49.627	10.998
53.109	10.998
59.204	10.998
65.298	10.998
70.522	10.998
75.746	12.831
81.841	15.580
87.065	18.330
91.418	18.330
98.383	19.246
104.478	21.079
108.831	26.578
115.796	26.578
125.373	26.578
126.244	32.077
131.468	36.660
136.692	35.743
140.174	42.159
143.657	42.159
149.751	43.075
149.751	47.658
159.328	50.407
163.682	51.324
167.164	54.073
170.647	55.906
180.224	62.322
188.060	64.155
196.766	68.737
201.990	69.654
207.214	76.986
214.179	77.902
222.015	87.067
228.109	91.650
233.333	94.399
240.299	95.316
245.522	96.232
249.876	109.980
261.194	107.230
265.547	117.312
277.736	126.477
291.667	137.475
306.468	150.305
320.398	165.886
336.070	175.051
349.129	193.381
377.861	219.043
403.980	232.790
433.582	269.450
458.831	289.613
491.045	319.857
517.164	318.024
546.766	337.271
572.886	376.680
608.582	402.342
635.572	408.758
665.174	409.674
693.035	419.756];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'weight', 'female'};  
temp.tW_f    = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GaikClar2011';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), carapace length (cm)
6.965	5.499
26.119	8.248
41.791	7.332
49.627	8.248
54.851	8.248
60.945	8.248
69.652	7.332
76.617	7.332
80.099	9.165
87.065	13.747
89.677	13.747
94.030	13.747
101.866	16.497
108.831	15.580
116.667	15.580
127.114	14.664
132.338	18.330
139.303	20.163
147.139	21.996
153.234	25.662
160.199	28.411
167.164	29.328
171.517	32.077
181.095	35.743
188.930	39.409
196.766	41.242
204.602	46.741
209.826	47.658
215.920	50.407
224.627	54.990
229.851	58.656
236.816	61.405
245.522	65.988
250.746	66.904
259.453	68.737
264.677	73.320
272.512	78.819
285.572	91.650
300.373	103.564
315.174	112.729
327.363	125.560
342.164	137.475
358.706	142.057
383.955	166.802
414.428	176.884
440.547	199.796
470.149	201.629
497.139	225.458
525.871	226.375
552.861	238.289
580.721	249.287
616.418	260.285
644.279	266.701
671.269	271.283
701.741	274.949];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'weight', 'male'};  
temp.tW_m    = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GaikClar2011';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f', 'tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'The growth curves suggest a much lower ultimate weight, compared to field data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '39LT9'; % Cat of Life
metaData.links.id_ITIS = '551898'; % ITIS
metaData.links.id_EoL = '1056914'; % Ency of Life
metaData.links.id_Wiki = 'Emydura_victoriae'; % Wikipedia
metaData.links.id_ADW = 'Emydura_victoriae'; % ADW
metaData.links.id_Taxo = '48266'; % Taxonomicon
metaData.links.id_WoRMS = '1435857'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Emydura&species=victoriae'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Emydura_victoriae}}';
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
bibkey = 'GaikClar2011'; type = 'Article'; bib = [ ... 
'author = {G. S. Gaikhorst and B. R. Clarke and M. McPharlin and B. Larkin and J. McLaughlin and J. Mayes}, ' ... 
'year = {2011}, ' ...
'title = {The Captive Husbandry and Reproduction of the Pink-Eared Turtle (\emph{Emydura victoriae}) at {P}erth {Z}oo}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {30}, ' ...
'pages = {79-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jone2003'; type = 'techreport'; bib = [ ...
'author = {Jones, G.}, ' ...
'title = {Recovering from the drought},' ...
'year = {2003}, ' ...
'howpublished = {\url{https://ewater.org.au/archive/crcfe/freshwater/publications.nsf/6bf76071ddee7e92ca256f1e0014ee1e/f77e9c2626ea3c05ca256f0b001f134c/$FILE/Low%%20res%%20wshed%%20layout.pdf}}, ' ...
'institution = {The Cooperative Research Centre for Freshwater Ecology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

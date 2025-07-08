function [data, auxData, metaData, txtData, weights] = mydata_Arctocephalus_tropicalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Arctocephalus_tropicalis'; 
metaData.species_en = 'Subantarctic fur seal';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS', 'MAS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 28]; 

%% set data
% zero-variate data

data.tg = 257;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp for Zalophus_californianus';
data.tx = 239;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3.5*365;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'EoL';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 5*365;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'EoL';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'data for Arctocephalus australis; EoL: 16 yr';
  
data.Wwb = 4220; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 50e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 160e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data 
data.tW_f = [ ... % time since birth (yr), weight (kg)
20.507	5.576
25.989	5.576
31.373	8.271
35.390	6.691
36.595	7.063
36.930	6.227
37.736	9.154
38.728	7.017
48.216	5.762
53.021	7.621
55.461	7.528
56.118	6.227
60.014	7.946
60.266	9.387
67.026	7.760
69.788	7.203
72.464	8.968
77.579	10.688
83.643	11.431
106.222	10.316
107.745	10.316
125.078	11.059
125.422	9.991
132.912	13.383
136.347	11.059
147.533	13.336
147.582	11.989
148.610	8.875
151.800	13.243
152.399	13.522
152.403	13.429
155.805	11.989
156.966	13.569
157.308	12.546
157.311	12.454
157.626	12.175
159.665	14.730
160.357	12.454
161.985	9.572
162.011	8.875
162.188	12.361
163.413	12.175
165.827	12.779
202.594	15.149
206.526	15.892
207.257	12.546
209.694	12.546
215.462	13.058
216.973	13.383
217.208	15.288
217.223	14.870
218.703	16.032
225.416	15.706
231.886	13.662
235.228	13.894
246.768	14.823
250.595	18.448
259.793	16.775
264.152	14.173
264.152	14.173];
units.tW_f   = {'d', 'kg'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GuinGeor2000';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), weight (kg)
23.451	8.364
30.786	7.667
34.711	8.597
37.469	8.132
37.810	7.156
40.762	9.712
44.496	7.528
45.676	8.597
45.694	8.086
47.786	9.201
50.188	10.130
52.172	5.855
59.383	8.550
65.158	8.875
75.942	5.483
76.956	11.059
81.904	9.015
83.056	10.827
85.414	12.965
90.320	12.082
95.280	9.712
99.729	12.965
100.139	10.084
111.462	8.597
112.366	8.875
116.482	12.918
117.152	11.245
123.531	11.710
130.632	9.108
145.100	13.243
146.384	11.431
148.047	15.939
152.559	9.154
154.580	12.175
154.820	13.941
160.699	11.431
167.148	9.991
170.107	12.361
209.558	16.264
210.303	20.864
211.578	19.331
225.326	18.169
228.982	18.123
230.282	15.892
231.805	15.892
231.839	14.963
233.425	13.243
234.611	14.126
237.394	12.965
237.670	13.755
238.852	14.730
238.973	11.431
240.225	10.502
242.238	13.755
245.825	15.613
246.160	14.777
248.834	16.636
249.017	11.617
251.463	19.703
252.786	16.822
253.980	9.154
258.505	18.680
258.751	11.942
261.966	15.660
265.762	11.803];
units.tW_m   = {'d', 'kg'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(38.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GuinGeor2000';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D2 = 'Male {p_Am} jumps upward at puberty, as discussed in Kooy2014 under type A acceleration';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '67S2R'; % Cat of Life
metaData.links.id_ITIS = '180632'; % ITIS
metaData.links.id_EoL = '46559197'; % Ency of Life
metaData.links.id_Wiki = 'Arctocephalus_tropicalis'; % Wikipedia
metaData.links.id_ADW = 'Arctocephalus_tropicalis'; % ADW
metaData.links.id_Taxo = '67397'; % Taxonomicon
metaData.links.id_WoRMS = '231432'; % WoRMS
metaData.links.id_MSW3 = '14001007'; % MSW3
metaData.links.id_AnAge = 'Arctocephalus_tropicalis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctocephalus_tropicalis}}';
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
bibkey = 'GuinGeor2000'; type = 'Article'; bib = [ ... 
'author = {C. Guinet and J.-Y. Georges}, ' ... 
'year = {2000}, ' ...
'title = {Growth in pups of the subantarctic fur seal (\emph{Arctocephalus tropicalis}) on {A}msterdam {I}sland}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {251}, ' ...
'pages = {289--296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Arctocephalus_tropicalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328622/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



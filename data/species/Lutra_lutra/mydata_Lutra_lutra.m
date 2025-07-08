function [data, auxData, metaData, txtData, weights] = mydata_Lutra_lutra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Lutra_lutra'; 
metaData.species_en = 'Eurasian otter'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 61;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 55;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 548;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18.2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 110.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 6750;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (lbs)
-12.419	2.336
-6.902	2.737
0.466	2.965
7.875	3.276
15.585	3.210
21.564	3.568
29.416	3.794
35.193	3.734
42.622	4.087
51.440	4.311
58.365	4.623
63.520	5.275
78.760	5.771
84.678	6.004
93.557	6.352
100.039	6.750
106.300	6.689
113.769	7.125
120.695	7.437
128.023	7.582
135.371	7.768
148.376	7.644
155.946	8.289
163.696	8.307
169.051	8.374
176.782	8.350
184.272	9.830
191.076	9.893
197.841	9.872
204.766	10.185
212.577	10.328
217.892	10.311
225.501	10.037
231.822	10.101
240.359	10.743
247.727	10.971
253.585	11.078
261.799	11.053
268.704	11.324
274.985	11.304
281.044	10.826
290.204	10.756
296.968	10.736
303.732	10.715
311.040	10.817
317.925	11.047
324.910	10.482
331.836	10.795
338.479	10.524
345.746	10.543
353.416	10.395
361.368	10.829
367.448	10.393
396.901	11.263
422.307	11.769];
data.tW_f = [data.tW_f(:,1) - data.tW_f(1,1), data.tW_f(:,2) * 453.592]; % convert lbs to g 
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Step1957';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), weight (lbs)
-12.539	3.088
-6.982	3.572
1.152	4.382
8.702	4.985
15.526	5.089
23.096	5.734
28.512	5.926
36.404	6.236
42.927	6.717
49.933	7.196
58.690	7.295
65.213	7.775
78.399	8.027
85.647	8.005
93.498	8.231
99.075	8.757
106.484	9.068
112.966	9.465
120.456	9.943
128.811	10.210
135.334	10.691
148.539	9.982
157.680	10.873
162.733	11.316
170.504	11.376
176.423	11.608
184.758	12.835
191.704	13.189
200.018	13.373
205.816	13.355
212.520	13.209
218.841	13.273
225.867	13.794
233.840	14.270
241.087	14.248
248.395	14.351
255.441	14.914
262.407	15.310
269.856	15.704
276.922	15.307
284.511	14.991
289.966	14.264
298.663	14.238
305.950	14.299
311.265	14.282
319.478	14.257
325.458	14.614
334.759	14.836
342.147	15.106
348.347	14.920
355.997	14.729
362.882	14.958
370.935	14.599
398.436	16.435
425.049	16.437];
data.tW_m = [data.tW_m(:,1) - data.tW_m(1,1), data.tW_m(:,2) * 453.592]; % convert lbs to g 
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(38.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Step1957';
comment.tW_m = 'Data for males';

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '72PQL'; % Cat of Life
metaData.links.id_ITIS = '621916'; % ITIS
metaData.links.id_EoL = '46559121'; % Ency of Life
metaData.links.id_Wiki = 'Lutra_lutra'; % Wikipedia
metaData.links.id_ADW = 'Lutra_lutra'; % ADW
metaData.links.id_Taxo = '66811'; % Taxonomicon
metaData.links.id_WoRMS = '137076'; % WoRMS
metaData.links.id_MSW3 = '14001112'; % MSW3
metaData.links.id_AnAge = 'Lutra_lutra'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutra_lutra}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lutra_lutra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Lutra_lutra/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Step1957'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Stephens, M. N.}, ' ...
'year = {1957}, ' ...
'address = {Herts}, ' ...
'title  = {The otter report}, ' ...
'publisher = {Universities Federation Animal Welfare}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Equus_quagga

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Equidae';
metaData.species    = 'Equus_quagga'; 
metaData.species_en = 'Plains zebra'; 

metaData.ecoCode.climate = {'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTs', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 23]; 

%% set data
% zero-variate data

data.tg = 365;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 395;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 900;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 38*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb =  32000; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 205000; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 280000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/556; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% t-W data for embryo
data.tW_e = [ ... % time since birth (d), weight (kg)
2.319	0.466
23.774	0.268
67.140	0.339
68.992	0.899
69.938	0.337
75.517	1.082
84.824	1.918
105.277	4.711
107.613	4.523
108.528	5.271
110.877	4.522
111.326	5.269
113.165	6.390
115.982	5.547
122.082	3.955
128.626	3.297
131.864	4.417
135.627	3.013
140.730	4.132
143.980	4.785
149.100	5.156
149.556	5.623
168.113	9.726
175.594	8.881
189.525	11.397
192.362	9.713
192.776	11.956
198.263	16.626
198.276	16.065
209.549	12.601
214.693	11.944
219.845	11.007
228.598	15.582
250.043	15.851
251.893	16.504
296.896	26.388
297.878	24.238
304.779	28.253
336.294	36.648
343.696	39.167
345.088	39.447
350.575	44.117
360.763	47.196
363.064	48.503
363.567	46.914
371.240	57.844
372.700	55.227
373.563	58.217];
units.tW_e   = {'d', 'kg'};  label.tW_e = {'time since birth', 'weight'};  
temp.tW_e    = C2K(38.3);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'Smut1975';
comment.tW_e = 'Data concern weight uterus plus contents';
%
% t-W data 
data.tW = [ ... % time since birth (yr), weight (kg)
1.089	204.645
2.146	249.293
3.131	277.329
4.155	300.087
5.105	316.798
6.136	313.141
7.086	329.853
8.157	319.408
9.109	329.327
10.141	321.897
11.094	328.797
12.130	307.027
13.123	306.385
14.108	331.402
15.109	299.817
16.101	301.439
17.088	323.438];
data.tW(:,1) = (1 + data.tW(:,1)) * 365.25; % convert yr to d
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(38.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Smut1975';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7TKN7'; % Cat of Life
metaData.links.id_ITIS = '624996'; % ITIS
metaData.links.id_EoL = '311502'; % Ency of Life
metaData.links.id_Wiki = 'Equus_quagga'; % Wikipedia
metaData.links.id_ADW = 'Equus_quagga'; % ADW
metaData.links.id_Taxo = '168056'; % Taxonomicon
metaData.links.id_MSW3 = '14100032'; % Mammal Spec World
metaData.links.id_AnAge = 'Equus_quagga'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Equus_quagga}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Equus_quagga}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Equus_burchellii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smut1975'; type = 'Article'; bib = [ ... 
'author = {Smuts, G. L.}, ' ... 
'year = {1975}, ' ...
'title = {Pre- and postnatal growth phenomena of {B}urchell''s zebra \emph{Equus burchelli antiquorum}}, ' ...
'journal = {Koedoe}, ' ...
'volume = {18}, ' ...
'pages = {69-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



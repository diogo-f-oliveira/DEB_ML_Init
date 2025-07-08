function [data, auxData, metaData, txtData, weights] = mydata_Diceros_bicornis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Rhinocerotidae';
metaData.species    = 'Diceros_bicornis'; 
metaData.species_en = 'Black rhinoceros'; 

metaData.ecoCode.climate = {'Am', 'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', 'oiTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 08 08]; 

%% set data
% zero-variate data

data.tg = 474;    units.tg = 'd';    label.tg = 'gestation time';   bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 634;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1826;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'males 2254 d';
data.am = 49*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 21.4e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'VahaVond1995';
data.Wwi = 1.3e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 800 to 1400 kg';
data.Wwim = 2e6; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 2,199-2,896 kg';

data.Ri  = 0.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (kg)
0.934	21.383
4.209	27.313
9.916	31.452
15.616	33.809
20.914	37.356
25.396	40.311
30.295	45.641
36.411	50.373
38.436	48.584
41.697	50.949
44.967	55.691
51.081	59.829
54.751	62.787
61.280	69.299
64.957	74.040
69.440	76.995
76.371	82.318
78.800	79.934
80.841	82.303
84.509	84.667
90.629	90.587
91.045	92.962
94.713	95.326
100.410	97.089
105.304	101.231
109.397	108.346
115.094	110.109
120.813	117.218
124.899	122.551
130.606	126.690
134.699	133.805
140.803	135.567
149.357	140.291
152.640	148.003
154.278	150.967
160.408	159.264
165.297	162.218
171.826	168.730
175.095	172.878
180.393	176.424
184.885	181.756
189.779	185.898
220.026	227.975
225.704	224.985
230.189	228.534
233.455	232.088
239.188	242.762
244.094	249.874
248.175	254.019
257.146	261.117
263.271	268.225
266.527	269.403
271.419	272.951
277.138	280.060
282.450	287.171
286.127	291.911
290.213	297.244];
data.tW(:,2) = 1e3 * data.tW(:,2); % convert kg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'VahaVond1995';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwb = 2 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '35JVB'; % Cat of Life
metaData.links.id_ITIS = '625003'; % ITIS
metaData.links.id_EoL = '311501'; % Ency of Life
metaData.links.id_Wiki = 'Diceros_bicornis'; % Wikipedia
metaData.links.id_ADW = 'Diceros_bicornis'; % ADW
metaData.links.id_Taxo = '69139'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100059'; % MSW3
metaData.links.id_AnAge = 'Diceros_bicornis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diceros_bicornis}}';
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
bibkey = 'VahaVond1995'; type = 'Article'; bib = [ ... 
'author = {J. Vahala and Z. Vondra and M. Kober and P. Petrzilek}, ' ... 
'year = {1995}, ' ...
'title = {Hand-feeding a  Black rhinoceros calf at {Dvur Kralove Zoo}. \emph{Diceros bicornis} }, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {34}, ' ...
'pages = {211-217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Diceros_bicornis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


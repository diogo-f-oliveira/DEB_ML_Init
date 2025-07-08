function [data, auxData, metaData, txtData, weights] = mydata_Siren_intermedia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Sirenidae';
metaData.species    = 'Siren_intermedia'; 
metaData.species_en = 'Lesser siren'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm','0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp

metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_t'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 11];

%% set data
% zero-variate data

data.ab = 35;   units.ab = 'd';    label.ab = 'time since birth at birth'; bibkey.ab = 'Wiki';
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25.7*365;  units.am = 'd';    label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15.0;   units.Lp  = 'cm'; label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'DaviKnap1953'; 
data.Lpm  = 19.0;  units.Lpm = 'cm'; label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'DaviKnap1953'; 
data.Li = 25.5;    units.Li = 'cm';  label.Li = 'ultimate SVL for females';    bibkey.Li  = 'DaviKnap1953';
  comment.Li = 'based on Lim*L1_f/L1_m: 31.5*15/18.5, which is close to L_im*Lp/Lpm';
data.Lim = 31.5;   units.Lim = 'cm'; label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'DaviKnap1953';

data.L1_f = 15.0;  units.L1_f = 'cm'; label.L1_f = 'SVL at 1 yr for females';  bibkey.L1_f  = 'DaviKnap1953';
data.L1_m = 18.5;  units.L1_m = 'cm'; label.L1_m = 'SVL at 1 yr for males';    bibkey.L1_m  = 'DaviKnap1953';

data.Wwb = 1.41e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 3 mm; pi/6*0.3^3';
data.Wwim = 266;     units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'DaviKnap1953';

data.Ri  = 125/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '120-130 eggs per clutch 1 clutch per yr';

% uni-variate data
% length-weight
data.LW = [ ... % SVL (mm), wet weight (g)
94.413	4.731
94.702	9.764
95.998	2.262
97.225	8.577
104.105	16.931
104.744	15.064
104.781	7.527
105.999	15.726
106.984	7.587
107.009	2.563
113.231	16.552
114.483	17.842
115.446	14.100
116.371	17.894
116.384	15.382
124.277	9.944
124.878	15.614
126.756	17.549
127.420	10.658
134.903	24.053
135.511	28.467
136.461	27.237
137.735	24.131
144.370	18.659
144.967	24.956
145.269	27.477
146.871	21.868
147.157	27.529
154.424	21.446
156.305	22.753
157.259	20.895
157.545	26.556
164.743	34.290
164.994	46.860
165.073	31.159
165.988	36.837
166.315	34.333
167.558	37.508
173.513	42.068
173.799	47.729
174.168	37.060
176.637	46.550
177.288	42.171
184.839	42.377
185.077	57.459
185.436	48.675
186.250	74.451
186.336	57.493
186.348	54.981
193.209	67.103
193.219	65.219
193.940	47.022
194.861	51.445
195.046	77.203
195.411	67.163
196.755	50.240
196.997	64.694
197.334	60.306
198.001	52.787
204.585	57.363
204.859	65.537
205.129	74.338
206.063	76.248
207.671	69.382
215.511	74.622
216.115	79.663
216.404	84.696
217.351	84.094
224.926	79.276
225.209	85.565
225.263	74.888
226.452	88.740
226.506	78.063
226.691	103.821
227.298	108.235
236.440	104.716
244.553	118.128
246.399	126.345
247.070	118.197
252.691	126.516
255.154	137.262
257.579	155.544
257.639	143.611
285.014	205.917
295.034	215.613
314.600	266.398];
data.LW(:,1) = data.LW(:,1)/ 10; % convert mm to cm
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'wet weight'};  
bibkey.LW = 'DaviKnap1953';

%% set weights for all real data
weights = setweights(data, []);
weights.L1_f = 5 * weights.L1_f;
weights.L1_m = 5 * weights.L1_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4XR2J'; % Cat of Life
metaData.links.id_ITIS = '173736'; % ITIS
metaData.links.id_EoL = '332424'; % Ency of Life
metaData.links.id_Wiki = 'Siren_intermedia'; % Wikipedia
metaData.links.id_ADW = 'Siren_intermedia'; % ADW
metaData.links.id_Taxo = '47261'; % Taxonomicon
metaData.links.id_WoRMS = '1457581'; % WoRMS
metaData.links.id_amphweb = 'Siren+intermedia'; % AmphibiaWeb
metaData.links.id_AnAge = 'Siren_intermedia'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siren_intermedia}}';
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
bibkey = 'DaviKnap1953'; type = 'article'; bib = [ ... 
'author = {William B. Davis and Frank T. Knapp}, ' ... 
'year = {1953}, ' ...
'title = {Notes on the Salamander \emph{Siren intermedia}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1953(2)}, ' ...
'pages = {119-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Siren_intermedia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Siren_intermedia/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Siren+intermedia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


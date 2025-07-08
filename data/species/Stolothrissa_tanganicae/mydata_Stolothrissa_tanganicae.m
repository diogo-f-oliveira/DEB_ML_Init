  function [data, auxData, metaData, txtData, weights] = mydata_Stolothrissa_tanganicae
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Stolothrissa_tanganicae'; 
metaData.species_en = 'Lake Tanganyika sprat';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 06]; 

%% set data
% zero-variate data
data.am = 1*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Kimu1995';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 10.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Kimu1995';

data.Wwb = 6.5e-5; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Pete1999';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 2.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Pete1999'};
  comment.Wwi = 'based on 0.00437*(TL in cm)^3.1, see F1';
data.Wwi = 6.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','Kimu1995'};
  comment.Wwi = 'based on 0.00437*(TL in cm)^3.1, see F1';
  
  
% uni-variate data

% time-length
data.tL = [ ... % year class (yr), standard length (cm)
76.936	3.183
81.056	2.895
83.461	3.162
85.867	3.429
87.081	3.655
94.767	3.409
98.984	3.943
102.613	4.517
106.162	4.415
108.563	4.641
113.289	4.456
122.752	4.189
125.158	4.456
126.438	5.236
126.921	4.312
126.977	4.784
126.990	4.887
129.945	4.784
132.241	4.127
134.700	4.846
137.105	5.113
137.135	5.359
140.632	4.825
141.875	5.298
143.074	5.400
146.542	4.620
146.637	5.421
146.659	5.606
149.610	5.462
151.319	4.867
152.526	5.031
154.946	5.421
157.835	4.764
157.945	5.688
159.650	5.051
162.158	6.181
168.002	5.421
168.098	6.222
169.873	6.181
175.788	6.016
177.588	6.181
178.763	6.078
179.972	6.263
179.986	6.386
184.107	6.099
184.720	6.263
184.754	6.550
187.716	6.509
188.896	6.448
190.701	6.653
191.863	6.448
194.811	6.283
194.816	6.324
195.436	6.550
195.993	6.242
197.754	6.078
198.982	6.427
199.578	6.448
199.581	6.468
199.603	6.653
201.383	6.653
202.514	6.181
203.195	6.920
203.745	6.550
206.158	6.879
206.724	6.653
207.269	6.242
208.424	5.975
208.536	6.920
209.037	6.140
209.736	7.023
209.743	7.084
210.293	6.715
210.940	7.166
210.952	7.269
212.073	6.715
213.187	6.099
213.243	6.571
213.809	6.345
213.827	6.489
214.476	6.961
215.096	7.187
215.558	6.078
215.675	7.064
216.821	6.715
217.417	6.735
218.025	6.858
219.764	6.509
220.425	7.084
220.965	6.632
221.544	6.509
221.593	6.920
222.799	7.084
223.957	6.838
226.302	6.591
226.910	6.715
226.971	7.228
228.102	6.756
228.722	6.982
228.734	7.084
229.327	7.084
230.429	6.366
230.441	6.468
232.246	6.674
232.292	7.064
232.319	7.290
232.324	7.331
232.896	7.146
234.642	6.858
235.797	6.591
235.865	7.166
235.909	7.536
236.408	6.735
237.023	6.920
238.276	7.474
238.806	6.940
239.414	7.064
239.419	7.105
241.776	6.961
241.820	7.331
243.532	6.756
243.590	7.248
244.169	7.125
244.787	7.331
244.802	7.454
248.362	7.454
249.501	7.043
249.523	7.228
251.325	7.413
256.041	7.146
257.260	7.413
257.880	7.639
258.449	7.433
259.011	7.166
259.677	7.782
260.169	6.920
261.419	7.454
261.981	7.187
262.628	7.639
263.197	7.433
264.323	6.920
270.370	7.864
270.910	7.413
270.956	7.803
272.065	7.146
272.155	7.906
273.938	7.926
274.407	6.879
277.479	7.762
277.501	7.947
277.516	8.070
284.589	7.659
287.563	7.721
290.540	7.803
292.328	7.864
292.340	7.967
292.343	7.988
292.377	8.275
292.873	7.454
294.143	8.152
296.536	8.316
301.237	7.926
302.451	8.152
306.642	8.460
316.152	8.583
320.829	7.988
327.416	8.480
333.900	8.111
380.342	9.384];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Kimu1995';

data.WN = [ ... % weight weight (g), fecundity (#)
2.267	7950.193
3.263	7120.696
3.498	13709.744
3.650	12061.279
3.801	8490.617
3.917	10274.848
4.077	20434.119
4.344	18098.497
4.377	9860.319
4.381	16176.087
4.493	11644.556
4.837	9857.687
4.914	10543.748
4.991	11504.404
4.994	16035.277
4.998	21801.847
5.032	15211.264
5.033	17133.454
5.461	25780.896
5.605	11912.792
5.928	37586.000
6.491	18772.713
6.682	18085.117];
units.WN = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(26);  units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'Pete1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00437*(TL in cm)^3.1';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52TKS'; % Cat of Life
metaData.links.id_ITIS = '551264'; % ITIS
metaData.links.id_EoL = '209699'; % Ency of Life
metaData.links.id_Wiki = 'Stolothrissa_tanganicae'; % Wikipedia
metaData.links.id_ADW = 'Stolothrissa_tanganicae'; % ADW
metaData.links.id_Taxo = '188307'; % Taxonomicon
metaData.links.id_WoRMS = '1017071'; % WoRMS
metaData.links.id_fishbase = 'Stolothrissa-tanganicae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Stolothrissa_tanganicae}}';  
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
bibkey = 'Kimu1995'; type = 'Article'; bib = [ ... 
'author = {S. Kimura}, ' ... 
'year = {1995}, ' ...
'title = {Growth of the clupeid fishes, \emph{Stolothrissa tanganicae} and \emph{Limnothrissa miodon}, in the {Z}ambian waters of {L}ake {T}anganyika}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {47}, ' ...
'pages = {569-575}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pete1999'; type = 'Misc'; bib = [ ...
'author = {Happy K. Peter}, ' ... 
'year = {1999}, ' ...
'title = {Fecundity and egg sizes of pelagic fishes, \emph{Stolothrissa tanganicae} and \emph{Limnothrissa miodon} in relation to size of the fish}, ' ...
'note = {No date found, supervised by Peter McIntyre}, ' ...
'howpublished = {\url{https://www.geo.arizona.edu/nyanza/pdf/Peter.pdf}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stolothrissa-tanganicae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

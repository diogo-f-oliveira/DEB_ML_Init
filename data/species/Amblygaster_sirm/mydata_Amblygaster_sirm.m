function [data, auxData, metaData, txtData, weights] = mydata_Amblygaster_sirm

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Amblygaster_sirm'; 
metaData.species_en = 'Spotted sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 11]; 


%% set data
% zero-variate data;

data.ab = 3;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'DayaGjos1986';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 15;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 27; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm: pi/6*0.25^3';
data.Wwi = 196;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.04, see F1';

data.Ri  = 133e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (d), total length (cm)
98.285	14.409
98.750	15.472
111.015	13.740
111.085	15.157
112.684	14.173
118.063	14.724
120.551	15.079
120.947	14.764
124.217	14.291
125.950	16.024
127.115	14.606
128.742	14.213
132.038	14.252
132.096	15.433
132.492	15.118
133.413	17.087
134.097	14.252
134.108	14.488
134.937	14.606
136.206	15.276
137.037	15.433
137.406	14.567
139.080	15.118
139.888	14.803
140.734	15.276
148.934	14.567
151.390	14.291
161.316	15.197
161.334	15.551
163.361	14.921
167.509	15.551
168.680	14.252
171.615	15.315
172.862	15.551
173.254	15.157
173.638	14.606
175.332	15.551
177.390	15.551
180.366	17.441
181.092	15.472
186.481	16.220
187.673	15.354
208.127	21.024
212.873	17.087
218.391	20.433
219.933	18.307
222.397	18.189
222.417	18.583
225.792	20.236
225.804	20.472
225.819	20.787
229.501	20.315
231.057	18.465
235.298	20.984
236.401	18.307
236.854	19.134
244.222	18.268
246.315	18.976
247.255	21.339
249.663	20.079
250.448	19.291
251.778	21.220
252.969	20.315
253.823	20.945
254.604	20.079
262.071	21.220
264.491	20.197
264.922	20.591
266.179	21.024
268.187	20.000
269.020	20.197
272.403	22.008
272.710	19.882
277.693	20.748
278.907	20.315
280.006	17.559
281.390	20.591
287.082	19.134
288.397	20.748
292.444	19.331
292.487	20.197
295.781	20.197
297.455	20.748
302.722	19.016
304.005	20.000
306.546	21.417
308.080	19.134
313.073	20.197
315.535	20.039
318.023	20.394
320.476	20.039
320.522	20.984
326.259	20.433
328.347	21.024
332.052	21.024
334.404	18.622
337.006	21.299
338.591	20.039
340.698	21.024
340.718	21.417
341.176	22.362
341.929	20.945
341.937	21.102
342.731	20.512
343.541	20.236
343.555	20.512
344.015	21.496
346.452	20.827
346.843	20.394
346.854	20.630
346.893	21.417
350.981	20.827
358.369	20.354
359.656	21.417
359.676	21.811
360.897	21.535
368.663	20.394
369.132	21.535
370.295	20.079
371.542	20.315
389.294	21.299
408.172	20.079];  
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DayaGjos1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ap = 0 * weights.ap;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65ZXY'; % Cat of Life
metaData.links.id_ITIS = '551237'; % ITIS
metaData.links.id_EoL = '46562494'; % Ency of Life
metaData.links.id_Wiki = 'Amblygaster_sirm'; % Wikipedia
metaData.links.id_ADW = 'Amblygaster_sirm'; % ADW
metaData.links.id_Taxo = '160578'; % Taxonomicon
metaData.links.id_WoRMS = '217439'; % WoRMS
metaData.links.id_fishbase = 'Amblygaster-sirm'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amblygaster_sirm}}';
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
bibkey = 'DayaGjos1986'; type = 'Article'; bib = [ ... 
'author = {P. Dayaratne and J. Gj{\o}saeter}, ' ... 
'year = {1986}, ' ...
'title = {AGE AND GROWTH OF FOUR \emph{Sardinella} SPECIES FROM {S}RILANKA}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {4}, ' ...
'pages = {1--33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Amblygaster-sirm.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

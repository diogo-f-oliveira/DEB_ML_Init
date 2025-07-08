function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_longiceps

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_longiceps'; 
metaData.species_en = 'Indian oil sardine'; 

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

data.ab = 2;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';    
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'DayaGjos1986';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 3*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 16.3;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 23; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm: pi/6*0.25^3';
data.Wwi = 200;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 94e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Spawning once per yr';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (d), total length (cm)
125.521	12.609
128.639	13.111
129.134	12.433
143.582	11.579
145.154	12.232
146.728	12.936
149.835	13.086
154.490	13.137
154.995	12.785
161.719	12.885
161.729	13.187
165.347	13.162
178.778	12.810
228.942	13.287
262.561	13.714
264.081	12.760
264.105	13.513
266.752	15.422
267.742	14.066
268.734	12.760
281.179	13.915
282.707	13.187
287.959	15.724
288.459	15.221
294.624	14.016
308.590	14.217
324.655	15.397
344.274	14.568
349.428	14.091];  
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DayaGjos1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79MM6'; % Cat of Life
metaData.links.id_ITIS = '551453'; % ITIS
metaData.links.id_EoL = '46562416'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_longiceps'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_longiceps'; % ADW
metaData.links.id_Taxo = '186547'; % Taxonomicon
metaData.links.id_WoRMS = '212269'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-longiceps'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_longiceps}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/1511}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


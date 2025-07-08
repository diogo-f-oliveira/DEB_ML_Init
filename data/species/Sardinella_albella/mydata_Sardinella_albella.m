function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_albella

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_albella'; 
metaData.species_en = 'White sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
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
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'DayaGjos1986';
  temp.ap = C2K(19);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 9;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 14; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm: pi/6*0.25^3';
data.Wwi = 28.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.04, see F1';

data.Ri  = 120e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (d), total length (cm)
118.477	6.236
126.704	6.140
129.978	5.949
132.100	6.524
142.767	6.141
144.554	7.411
145.629	5.949
145.684	6.453
149.832	6.716
153.552	6.836
158.087	6.885
165.092	6.909
215.380	11.033
217.909	11.560
220.755	11.225
224.853	11.033
238.832	10.818
247.537	11.322
255.077	12.472
269.502	12.569
270.612	11.419
273.426	10.796
275.562	11.491
277.201	11.419
277.320	12.497
279.298	11.755
282.968	11.419
284.161	11.036
285.008	11.252
292.997	12.738
297.858	11.995
301.422	10.701
302.029	12.475
303.587	11.660
304.030	11.947
305.638	11.588
306.758	10.534
310.248	12.307
313.857	11.421
314.240	11.157
317.200	11.852
319.309	12.308
321.746	11.996
323.768	11.661
323.916	13.003
325.130	12.811
326.675	11.877
327.409	11.062
328.270	11.398
328.388	12.476
331.242	12.212
332.536	12.740
335.327	11.901
343.105	11.470
347.638	11.494
347.656	11.662
347.704	12.093
348.174	12.621
349.647	11.039
357.800	10.273
357.916	11.327
361.681	11.854
361.691	11.950
362.964	12.286
363.355	12.094
363.751	11.950
366.140	11.208
368.300	12.118
369.026	11.232
369.454	11.376
370.734	11.783
373.675	12.310
377.353	12.047
377.374	12.239
381.408	11.472
385.131	11.616
386.762	11.472
389.682	11.808
391.742	11.808
392.610	12.215
394.284	12.455
401.671	12.216
404.509	11.809
404.531	12.000
409.462	11.905
412.272	11.234
418.629	12.864
420.137	11.594
439.140	12.122];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DayaGjos1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 0 * weights.Lp;

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
F1 = 'length-weight: W in g = 0.00933*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XMLG'; % Cat of Life
metaData.links.id_ITIS = '551445'; % ITIS
metaData.links.id_EoL = '46562415'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_albella'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_albella'; % ADW
metaData.links.id_Taxo = '186537'; % Taxonomicon
metaData.links.id_WoRMS = '212268'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-albella'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_albella}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sardinella-albella.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  

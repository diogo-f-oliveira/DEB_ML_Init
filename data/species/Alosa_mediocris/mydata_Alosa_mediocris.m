  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_mediocris

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_mediocris'; 
metaData.species_en = 'Hickory shad'; 

metaData.ecoCode.climate = {'MB','MC','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'MAW','THn'};
metaData.ecoCode.habitat = {'piMpe', '0bFr', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 07 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 10]; 

%% set data
% zero-variate data
data.ah = 2.46;    units.ah = 'd';  label.ah = 'age at hatch at 24C';  bibkey.ah = 'fishbase'; 
  temp.ah = C2K(23.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on SL 32 cm: 32/0.84 see F2';
data.Li = 71.4;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on SL 60 cm: 60/0.84, see F2';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 4.04e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01110*Li^3, see F1';  

data.Ri = 4.75e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL = [ ... % time since hatch (d), total length (cm)
24.977	0.267
25.088	1.446
26.379	1.908
26.911	0.934
32.685	2.628
32.714	2.936
35.253	3.398
49.479	2.069
49.498	2.274
49.801	5.505
49.873	6.274
49.921	6.787
49.978	7.402
50.881	3.710
50.914	4.069
50.948	4.428
50.972	4.684
51.260	7.761
51.327	1.813
51.413	2.736
51.457	3.197
62.841	11.508
65.068	8.637
70.213	3.613
70.271	4.228
107.948	13.470
122.159	5.320
126.402	10.654
126.810	8.347
127.415	8.142
129.167	6.860
129.248	7.732
130.986	12.963
132.608	16.964
145.701	10.198
157.672	18.099
161.492	12.254
177.806	13.233
177.964	14.925
178.056	15.900
179.543	18.464
179.601	19.079
180.129	18.054
181.214	16.311
189.003	12.877
189.675	13.390
191.758	15.647
197.724	19.392
203.642	15.958
221.876	17.450
223.469	14.476
225.216	13.144
285.946	15.366
291.931	19.316
305.259	15.063
329.512	14.198
341.712	17.894
343.709	19.228
435.477	19.767
436.596	18.382];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'Mans1962'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'length of males is 0.92 times that of females';
metaData.bibkey.D1 = 'Wiki'; 
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01110*(TL in cm)^3.000';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'C5MG'; % Cat of Life
metaData.links.id_ITIS = '161704'; % ITIS
metaData.links.id_EoL = '46562372'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_mediocris'; % Wikipedia
metaData.links.id_ADW = 'Alosa_mediocris'; % ADW
metaData.links.id_Taxo = '160464'; % Taxonomicon
metaData.links.id_WoRMS = '158668'; % WoRMS
metaData.links.id_fishbase = 'Alosa-mediocris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_mediocris}}';  
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
bibkey = 'Mans1962'; type = 'Article'; bib = [ ...  
'author = {Romeo J. Mansueti}, ' ...
'year = {1962}, ' ...
'title = {Eggs, Larvae, and Young of the Hickory Shad, Alosa mediocris, with Comments on Its Ecology in the Estuary}, ' ... 
'journal = {Chesapeake Science}, ' ...
'volume = {3}, '...
'pages = {173-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{www.fishbase.org/summary/1584}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
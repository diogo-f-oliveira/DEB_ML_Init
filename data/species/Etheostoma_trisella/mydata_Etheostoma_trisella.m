  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_trisella
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_trisella'; 
metaData.species_en = 'Trispot darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 05]; 

%% set data
% zero-variate data
data.ab = 30;   units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'Ryon1986';   
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 190;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Ryon1986';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on mature at 1 yr';
data.am = 1.5*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'Ryon1986';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.0;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';    bibkey.Lp = 'Ryon1986'; 
data.Li = 4.5;   units.Li = 'cm'; label.Li = 'ultimate standard length';     bibkey.Li = 'Ryon1986';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Ryon1986';
  comment.Wwb = 'based on egg diameter of 1.0 mm: pi/6*0.1^3';
data.Wwi = 0.96;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'Ryon1986','fishbase'};
  comment.Wwi = 'based on 0.00513*(4.5/0.85)^3.14';
 
data.Ri = 154/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';         bibkey.Ri = 'Ryon1986';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
15.427	0.431
19.926	0.371
19.966	0.505
25.369	0.446
46.216	0.668
46.252	0.787
46.323	1.025
48.090	0.891
77.274	1.797
79.036	1.649
102.611	1.931
104.400	1.871
107.240	2.302
108.054	2.005
108.086	2.109
115.264	1.946
137.140	2.584
137.153	2.629
148.008	2.673
150.772	2.851
150.790	2.911
179.741	3.045
179.772	3.149
180.613	2.941
205.114	3.297
206.957	3.416
210.481	3.119
220.415	3.104
234.879	3.134
285.675	3.802
290.080	3.431
290.223	3.906
291.064	3.698
291.990	3.772
297.411	3.772
314.626	3.936
317.274	3.728
328.120	3.743
329.117	4.054
331.895	4.277
332.740	4.084
333.599	3.936
333.612	3.980
334.551	4.099
334.578	4.188
335.316	3.639
335.356	3.772
339.033	3.980
380.521	3.743
380.610	4.040
382.448	4.144
382.484	4.262
392.230	3.624
393.272	4.084
479.115	4.129
479.204	4.426
541.494	4.262
546.852	4.054
548.775	4.441
582.217	4.485];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ryon1986';

    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Mean temperature is guessed, but varied between 0 and 27 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL7Q'; % Cat of Life
metaData.links.id_ITIS = '168444'; % ITIS
metaData.links.id_EoL = '207273'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_trisella'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_trisella'; % ADW
metaData.links.id_Taxo = '174165'; % Taxonomicon
metaData.links.id_WoRMS = '1013619'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-trisella'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_trisella}}';  
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
bibkey = 'Ryon1986'; type = 'article'; bib = [ ... 
'author = {Michael G. Ryon}, ' ...
'year = {1986}, ' ...
'title = {The Life History and Ecology of \emph{Etheostoma trisella} ({P}isces: {P}ercidae)}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {115}, ' ...
'pages = {73-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-trisella.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

function [data, auxData, metaData, txtData, weights] = mydata_Notropis_atherinoides
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_spectrunculus'; 
metaData.species_en = 'Mirror shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'jpCi','bjHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 24]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.0;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'OlsoMart2016';
  comment.Lp = 'based on tp = 1 yr and tL data';
data.Li = 7.9;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 3.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm of N. atherinoides: pi/6*0.085^3';
data.Wwp = 0.2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 4.1;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri  = 331/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'OlsoMart2016';   
  temp.Ri = C2K(17.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
26.258	2.124
28.278	2.630
28.278	2.517
28.278	2.413
30.298	2.940
30.298	1.907
30.298	1.711
30.298	1.628
34.338	1.979
54.536	1.876
56.556	3.746
56.556	3.436
58.576	3.839
58.576	2.475
60.596	4.614
60.596	2.610
60.596	2.744
62.616	4.304
62.616	2.186
64.636	3.105
64.636	3.023
64.636	1.628
64.636	2.021
66.656	3.994
86.854	3.725
88.874	4.986
90.894	4.862
90.894	4.800
90.894	4.355
90.894	3.952
92.914	4.252
92.914	4.107
92.914	3.612
92.914	3.426
92.914	3.343
92.914	3.167
92.914	3.012
94.934	4.676
96.954	4.500
96.954	3.818
96.954	3.054
98.974	2.713
147.450	3.519
151.490	5.223
151.490	4.469
151.490	4.355
151.490	4.159
151.490	4.076
151.490	3.911
151.490	3.818
151.490	3.601
151.490	3.312
151.490	3.209
151.490	3.012
153.510	4.665
153.510	4.583
155.530	3.694
157.550	4.913
298.940	4.221
298.940	3.508
300.960	3.384
300.960	2.702
302.980	4.335
307.020	3.632
307.020	2.826
329.238	4.118
329.238	3.994
331.258	3.529
331.258	3.426
333.278	3.023
333.278	2.878
335.298	3.684
337.318	3.829
361.556	4.231
361.556	4.107
361.556	3.746
363.576	4.479
365.596	3.890
365.596	2.971
367.616	3.973
367.616	3.529
369.636	3.198
369.636	3.085
371.656	3.302
391.854	4.035
391.854	3.911
391.854	3.808
393.874	3.715
420.132	5.502
422.152	5.936
424.172	6.132
424.172	5.399
426.192	6.318
456.490	6.824
456.490	6.246
456.490	6.081
456.490	5.812
458.510	5.595
460.530	6.618
462.550	7.021
521.126	5.998
521.126	6.225
664.536	4.996
664.536	4.655
666.556	5.285
666.556	5.182
668.576	5.409
670.596	4.521
672.616	6.205
672.616	6.019
672.616	5.926
672.616	5.874
672.616	5.523
692.815	5.771
696.854	6.442
696.854	5.430
696.854	5.616
696.854	4.841
696.854	4.717
698.874	6.783
700.894	6.298
700.894	6.112
700.894	5.905
700.894	6.019
700.894	4.996
702.914	5.223
702.914	5.120
706.954	7.052
727.152	6.287
731.192	6.360
731.192	5.388
731.192	5.130
733.212	6.504
733.212	6.122
733.212	5.802
733.212	5.926
733.212	5.977
733.212	5.626
733.212	5.502
733.212	4.975
733.212	4.603
735.232	6.236
743.311	5.202
757.450	5.202
759.470	6.019
759.470	5.409
759.470	5.306
759.470	4.862
761.490	5.595
761.490	5.760
761.490	4.934
763.510	5.140
763.510	5.037
763.510	4.779
763.510	4.707
765.530	6.225
769.570	5.905
791.788	7.010
791.788	7.176
1036.192	6.339
1036.192	6.473
1098.808	6.432
1123.046	7.733
1401.788	6.742
1403.808	7.134
1405.828	6.628];
data.tL(:,1) = 30 + data.tL(:,1);
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OlsoMart2016'; 
comment.tL = 'Data from Western North Carolina; time origin guessed';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '47ZKG'; % Cat of Life
metaData.links.id_ITIS = '163468'; % ITIS
metaData.links.id_EoL = '206008'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_spectrunculus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_spectrunculus'; % ADW
metaData.links.id_Taxo = '181550'; % Taxonomicon
metaData.links.id_WoRMS = '1020737'; % WoRMS
metaData.links.id_fishbase = 'Notropis-spectrunculus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_spectrunculus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-spectrunculus.html}}';  
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
bibkey = 'OlsoMart2016'; type = 'Article'; bib = [ ... 
'doi = {10.1656/058.015.0108}, ' ...
'author = {Adric D. Olson and Thomas H. Martin}, ' ... 
'year = {2016}, ' ...
'title = {Life History Traits of the Mirror Shiner, \emph{Notropis spectrunculus}, in {W}estern {N}orth {C}arolina}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {15(1)}, ' ...
'pages = {102-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


  function [data, auxData, metaData, txtData, weights] = mydata_Chrosomus_oreas
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chrosomus_oreas'; 
metaData.species_en = 'Mountain redbelly dace'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 16]; 

%% set data
% zero-variate data
data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'ThomHarg2017';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'ThomHarg2017';
  comment.Lp = 'based on SL 4.2 cm and F2';
data.Li = 7.2;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'Stas1978';

data.Wwb = 2.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'ThomHarg2017';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwp = 2.52;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01574*Lp^3.08, see F1';
data.Wwi = 6.88;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01574*Li^3.08, see F1';

data.Ri = 243/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'ThomHarg2017';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time - length
data.tL = [ ... % time since birth (d), std length (cm)
59.829	3.021
63.366	2.425
63.408	2.541
63.491	2.775
63.528	2.878
64.542	2.217
64.574	2.308
88.579	3.021
89.662	2.555
92.329	3.021
93.477	2.736
93.510	2.827
97.121	2.438
99.899	3.216
123.579	3.022
123.690	3.333
123.750	3.501
126.024	2.866
127.227	2.737
153.214	1.998
153.366	2.426
153.510	2.828
154.848	3.074
156.186	3.320
181.019	2.854
185.931	2.608
185.987	2.763
238.390	2.491
241.061	2.971
241.117	3.127
243.515	2.841
244.723	2.725
244.973	3.425
249.478	2.038
274.969	3.412
275.010	3.529
277.135	2.479
277.182	2.608
277.260	2.829
277.293	2.920
277.404	3.231
278.469	2.712
278.510	2.829
278.612	3.114
304.631	2.466
305.927	2.596
306.219	3.412
307.265	2.842
307.395	3.205
308.256	2.116
308.473	2.725
308.561	2.972
334.932	3.309
334.969	3.413
335.001	3.504
336.034	2.894
336.071	2.998
336.117	3.128
338.427	2.596
338.474	2.726
338.511	2.829
365.043	3.621
367.492	3.478
367.858	4.502
368.858	3.802
395.330	4.425
399.020	4.256
401.400	3.919
402.492	3.478
427.955	4.775
428.951	4.062
429.016	4.243
429.071	4.399
455.270	4.257
457.733	4.153
459.150	4.620
460.173	3.984
485.506	4.918
489.206	4.776
490.136	3.881
490.340	4.451
490.414	4.659
491.224	3.427
491.270	3.557
494.298	5.035
518.817	3.687
518.863	3.817
519.132	4.568
521.696	4.750
521.757	4.918
521.808	5.061
521.845	5.165
521.923	5.385
522.854	4.491
550.368	4.530
550.414	4.660
550.460	4.789
550.581	5.126
580.322	4.401
580.345	4.465
582.882	4.569
582.928	4.699
582.998	4.893
610.655	5.334
611.678	4.699
612.600	3.779
612.882	4.569
613.025	4.971
615.359	4.505
636.572	4.401
641.544	4.323
642.928	4.699
645.382	4.570
647.771	4.259
670.808	5.763
671.813	5.076
672.984	4.855
673.016	4.946
675.739	5.568
703.100	5.180
703.317	5.789
704.396	5.309
704.466	5.504
705.767	5.646
734.535	5.699
735.623	5.245
735.683	5.413
735.744	5.582
735.832	5.828
735.878	5.958
735.943	6.139
736.827	5.115
765.605	5.193
765.859	5.906
766.994	5.582
767.054	5.751
768.183	5.414
768.216	5.504
796.915	5.362
796.938	5.427
825.860	5.907
827.170	6.075
828.221	5.518
828.272	5.661
854.374	5.246
855.827	5.816
859.647	6.011
885.689	5.428
889.508	5.622
889.614	5.921
893.059	5.065
893.096	5.169
915.735	5.558
919.434	5.415
920.652	5.325
922.022	5.662
923.054	5.052
947.041	5.714
948.369	5.934
949.499	5.597
951.786	5.001
951.818	5.092
951.851	5.182
951.911	5.351
980.865	5.922
1007.036	5.701
1008.226	5.533
1011.911	5.351
1040.754	5.611
1040.800	5.741
1042.185	6.117
1074.749	6.298
1102.324	6.506
1104.717	6.208
1132.208	6.182
1132.236	6.260
1133.416	6.066];
data.tL(:,1) = 60 + data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ThomHarg2017';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight Ww in g = 0.01574 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length - length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5YHY7'; % Cat of Life
metaData.links.id_ITIS = '913996'; % ITIS
metaData.links.id_EoL = '208301'; % Ency of Life
metaData.links.id_Wiki = 'Chrosomus_oreas'; % Wikipedia
metaData.links.id_ADW = 'Chrosomus_oreas'; % ADW
metaData.links.id_Taxo = '317688'; % Taxonomicon
metaData.links.id_WoRMS = '1018857'; % WoRMS
metaData.links.id_fishbase = 'Chrosomus-oreas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chrosomus_oreas}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrosomus-oreas.html}}';  
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
bibkey = 'ThomHarg2017'; type = 'techreport'; bib = [ ...  
'author = {Dezarai Thompson and Shelby Hargrave and Gregory Morgan and Steven L. Powers}, ' ...
'year = {2017}, ' ...
'title = {Life-history aspects of \emph{Chrosomus oreas} (Mountain Redbelly Dace) in {C}atawba {C}reek, {V}irginia}, ' ... 
'intitution = {Southeastern Fishes Council Proceedings}, ' ...
'volume = {57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


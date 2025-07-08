  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinella_analostana
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Cyprinella_analostana'; 
metaData.species_en = 'Satinfin shiner'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 19]; 

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'DenoMess1982'; 
  comment.Lp = 'based on FL 4.1 cm';
data.Li = 11;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DenoMess1982';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3; DenoMess1982 acutally give 0.1 mm, but the assumption is that this is a typo';
data.Wwp = 0.68;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','DenoMess1982'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 11.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri  = 1506/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'DenoMess1982';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % time since hatch (d), fork length (cm)
1 5.80
2 6.95];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/0.93; % convert FL to TL
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'DenoMess1982'};

% length - weight
data.LWw = [ ... % fork length (cm), wet weight (g)
2.825	0.292
3.000	0.134
3.001	0.330
3.108	0.270
3.205	0.387
3.283	0.387
3.303	0.288
3.313	0.622
3.401	0.602
3.587	0.876
3.605	0.522
3.625	0.718
3.704	1.051
3.810	0.697
3.811	0.972
3.899	0.912
3.967	1.187
3.987	1.305
4.318	1.047
4.504	1.360
4.504	1.517
4.513	1.163
4.601	1.261
4.601	1.378
4.601	1.496
4.709	1.692
4.709	1.849
4.728	1.495
4.923	1.592
4.924	2.103
5.022	2.161
5.040	1.709
5.119	2.219
5.217	2.356
5.236	1.865
5.305	2.434
5.305	2.591
5.313	1.569
5.313	1.785
5.314	1.943
5.324	2.119
5.344	2.316
5.422	2.492
5.509	2.334
5.608	2.667
5.695	2.549
5.812	2.724
5.831	2.233
5.843	3.274
5.909	2.449
5.931	3.352
6.029	3.725
6.048	3.410
6.108	4.255
6.108	4.490
6.136	3.960
6.137	4.156
6.215	4.391
6.234	3.762
6.332	4.292
6.332	4.508
6.410	4.193
6.419	3.722
6.430	4.547
6.539	5.312
6.596	4.604
6.605	4.369
6.626	5.174
6.626	5.370
6.627	5.567
6.635	4.801
6.636	5.017
6.723	4.662
6.723	4.839
6.723	4.996
6.734	5.291
6.803	5.821
6.803	6.017
6.821	5.290
6.912	6.704
6.919	5.250
6.919	5.427
6.921	6.213
6.940	6.429
6.947	4.680
6.998	5.937
7.025	4.817
7.047	6.212
7.105	6.035
7.106	6.369
7.113	5.013
7.124	5.602
7.124	5.799
7.133	5.190
7.191	4.855
7.201	5.150
7.202	5.444
7.203	6.171
7.330	6.504
7.341	6.976
7.417	5.796
7.508	7.544
7.515	6.189
7.517	7.348
7.519	8.409
7.521	4.440
7.743	8.171
8.045	8.031
8.136	9.661
8.235	5.495
8.325	11.585
8.428	9.796];
data.LWw(:,1) = data.LWw(:,1)/0.93; % convert FL to TL
units.LWw = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = {'DenoMess1982'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 30;
weights.Li = weights.Li * 5;
weights.Wwi = weights.Wwi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;
%weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.93*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '33HH7'; % Cat of Life
metaData.links.id_ITIS = '163766'; % ITIS
metaData.links.id_EoL = '207982'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinella_analostana'; % Wikipedia
metaData.links.id_ADW = 'Cyprinella_analostana'; % ADW
metaData.links.id_Taxo = '172691'; % Taxonomicon
metaData.links.id_WoRMS = '1021263'; % WoRMS
metaData.links.id_fishbase = 'Cyprinella-analostana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cyprinella_analostana}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinella-analostana.html}}';  
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
%
bibkey = 'DenoMess1982'; type = 'Article'; bib = [ ... 
'author = {Robert F. Denoncourt and Jennifer F. A. Messersmith}, ' ... 
'year = {1982}, ' ...
'title = {GROWTH AND REPRODUCTION OF THE SATINFIN SHINER, \emph{Cyprinella analostana}, {C}ODORUS {C}REEK, {P}ENNSYLVANIA}, ' ...
'journal = {Proceedings of the Pennsylvania Academy of Science}, ' ...
'volume = {56(1)}, ' ...
'pages = {81-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
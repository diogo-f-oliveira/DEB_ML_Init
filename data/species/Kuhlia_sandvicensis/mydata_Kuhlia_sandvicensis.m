  function [data, auxData, metaData, txtData, weights] = mydata_Kuhlia_sandvicensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Kuhliidae';
metaData.species    = 'Kuhlia_sandvicensis'; 
metaData.species_en = 'Hawaiian flagtail'; 

metaData.ecoCode.climate = {'MA','Af'};
metaData.ecoCode.ecozone = {'MP','TOh'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iMr'};
metaData.ecoCode.embryo  = {'Fnm','Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 11];

%% set data
% zero-variate data
data.am = 8*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishesoftexas';
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 18;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishesoftexas'; 
   comment.Lp = 'based on tp = 3 yr and tL data';
data.Li = 23;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';

data.Wwb = 4.5e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishesoftexas';   
  comment.Wwb = 'based on egg diameter of 2.05 mm of Ambloplites_rupestris: pi/6*0.205^3';
data.Wwp = 146.6;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','fishesoftexas'}; 
  comment.Wwp = 'based on 0.01995*Lp^3.08, see F1';
data.Wwi = 312;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'}; 
  comment.Wwi = 'based on 0.01995*Li^3.08, see F1';

data.Ri = 3.3e4/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.8';

% uni-variate data
% time - length
data.tL = [ ... % year class (yr), total length (cm)
    0.5 10.27
    1.5 14.22
    2.5 15.88
    3.5 17.05];
data.tL(:,1) = 365 * (0.1 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Naka1968';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
8.259	2.468
8.549	8.138
9.365	12.355
9.760	18.598
9.936	17.300
10.507	22.621
10.699	22.452
10.752	21.517
10.854	24.159
10.888	25.103
10.943	23.228
11.011	24.739
11.029	39.030
11.061	26.436
11.169	23.626
11.185	24.756
11.377	25.151
11.475	31.554
11.530	28.739
11.562	31.750
11.602	26.866
11.636	28.373
11.686	29.694
11.742	27.068
11.926	34.042
11.966	29.722
12.069	31.048
12.114	37.445
12.117	35.378
12.154	33.313
12.156	31.433
12.276	33.701
12.352	42.922
12.396	35.781
12.445	38.418
12.448	36.162
12.481	37.670
12.509	43.877
12.571	35.234
12.696	33.179
12.711	35.248
12.716	45.402
12.744	36.756
12.796	37.325
12.817	34.319
12.849	36.202
12.903	35.079
12.928	43.355
12.954	36.400
12.983	41.292
12.985	39.600
12.998	43.362
13.055	39.607
13.070	42.053
13.088	41.678
13.118	45.818
13.126	38.674
13.179	38.679
13.211	40.374
13.280	41.697
13.295	43.767
13.296	42.639
13.334	40.386
13.337	37.379
13.350	41.516
13.399	44.341
13.400	43.213
13.419	42.087
13.456	40.211
13.497	50.556
13.591	44.360
13.608	45.114
13.637	34.776
13.662	43.803
13.725	49.262
13.727	62.424
13.747	45.692
13.766	44.378
13.786	42.311
13.872	43.448
13.902	47.400
13.923	44.393
13.926	42.325
13.935	48.907
13.955	46.653
13.983	53.048
13.990	47.032
14.049	56.251
14.052	53.807
14.079	45.349
14.141	52.688
14.346	56.280
14.416	56.663
14.480	60.994
14.542	52.727
14.622	59.128
14.641	58.190
14.694	57.255
14.709	59.325
14.752	52.936
14.773	49.930
14.782	57.264
14.797	59.521
14.824	50.687
14.854	54.827
14.929	50.510
14.934	61.227
14.946	65.929
14.967	62.923
14.974	57.283
14.986	61.608
14.988	60.480
15.013	68.944
15.027	56.536
15.053	64.811
15.093	60.115
15.127	61.058
15.159	63.694
15.300	62.203
15.343	55.627
15.471	65.229
15.512	75.574
15.554	69.561
15.634	75.586
15.770	63.566
15.859	77.300
16.132	67.926
17.133	93.408
17.153	91.906
17.245	87.403
17.255	94.172
17.278	89.474
17.345	91.549
17.414	92.684];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'Naka1968';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'S83RFCFDW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580632'; % Ency of Life
metaData.links.id_Wiki = 'Kuhlia_sandvicensis'; % Wikipedia
metaData.links.id_ADW = 'Kuhlia_sandvicensis'; % ADW
metaData.links.id_Taxo = '177838'; % Taxonomicon
metaData.links.id_WoRMS = '278250'; % WoRMS
metaData.links.id_fishbase = 'Kuhlia-sandvicensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kuhlia_sandvicensis}}';
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
bibkey = 'Naka1968'; type = 'Article'; bib = [ ...
'author = {Royden Nakamura}, ' ... 
'year = {1968}, ' ...
'title = {An Additional Contribution to the Biology of the Aholehole, \emph{Kuhlia sandvicensis} ({S}teindachner)}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {22}, ' ...
'pages = {493-496}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Kuhlia-sandvicensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


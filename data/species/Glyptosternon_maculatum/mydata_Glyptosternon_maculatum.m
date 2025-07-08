  function [data, auxData, metaData, txtData, weights] = mydata_Glyptosternon_maculatum
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Sisoridae';
metaData.species    = 'Glyptosternon_maculatum'; 
metaData.species_en = 'Barkley'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-Ww'; 'L-N'}; 
metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 27];

%% set data
% zero-variate data
data.ab = 6.6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'LiXie2008';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.02;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'DingChen2010';
data.Li = 32;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DingChen2010';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 33.17;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.06, see F1';
data.Wwi = 374;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.06, see F1';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), totla length (cm)
    1  5.408  6.64
    2  8.506  9.359
    3 11.925 12.167
    4 14.506 14.854
    5 17.376 16.294
    6 19.776 18.776
    7 22.161 20.235
    8 24.314 21.908
    9 26.598 23.621
   10 28.264 24.795
   11 29.799 25.774
   12 31.367 26.325];
data.tL_fm(:,1) = (0.8 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'LiXie2008';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.533	14.651
12.924	23.469
14.279	33.013
14.565	36.669
14.850	38.142
15.028	37.425
15.385	43.269
15.421	48.366
15.527	40.367
15.634	44.740
15.920	44.029
16.098	46.224
16.276	55.696
16.312	60.065
16.312	49.876
16.383	46.241
16.419	54.249
16.633	62.995
16.776	53.543
16.990	51.372
17.025	60.108
17.061	53.560
17.311	65.220
17.382	57.218
17.453	58.678
17.596	55.776
17.703	79.072
17.917	71.079
18.024	67.447
18.095	72.546
18.202	63.091
18.523	95.861
18.559	68.935
18.701	76.221
18.737	80.590
18.915	79.146
18.987	73.327
19.058	86.432
19.094	93.712
19.415	77.720
19.450	85.000
19.486	90.825
19.700	74.826
19.771	98.848
19.842	93.758
20.128	131.621
20.342	94.516
20.627	117.823
20.877	118.566
21.590	132.437
21.768	137.543
22.160	123.738
22.160	123.010
23.088	128.161
23.765	155.131
24.978	179.222
26.083	200.395
26.618	225.901
27.010	236.114];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'LiXie2008';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
 14.779	31.588
15.777	44.021
16.134	45.498
16.134	53.504
16.669	50.625
16.954	49.914
17.097	56.473
18.166	66.727
18.345	63.099
18.487	66.019
18.487	87.853
18.559	60.201
18.844	72.591
19.022	81.335
19.058	81.338
19.058	68.237
19.308	84.264
19.343	69.710
19.557	67.540
19.593	87.192
19.664	90.108
20.128	93.775
20.199	86.501
20.306	88.691
20.413	96.704
20.877	103.282
20.912	98.917
21.019	104.746
21.269	114.951
21.305	105.491
21.447	114.234
21.483	134.614
21.519	117.877
21.661	105.513
21.768	127.353
21.982	130.278
22.018	126.641
22.267	116.467
22.339	103.371
22.374	169.603
22.374	135.396
22.410	130.304
23.123	135.441
23.266	165.290
23.266	155.101
23.302	138.364
23.373	141.279
23.944	146.408
24.264	185.001
24.300	176.998
24.942	164.664
25.834	231.676
25.941	213.487
26.475	188.047
26.547	206.246
26.582	215.709
27.046	217.921
27.296	220.120
28.080	268.202
29.328	303.940
29.792	297.418
30.434	305.463
30.897	344.792
32.039	373.973];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'LiXie2008';
comment.LW_m = 'Data for males';

% length-fecundity
data.LN = [ % std length (cm), fecundit (#)
15.042	627.716
15.554	772.984
15.583	526.556
16.169	939.558
16.580	1260.705
16.929	1507.798
17.060	1233.381
17.195	1522.351
17.236	1487.211
17.836	1143.198
18.023	1520.287
18.042	1330.180
18.766	1130.751
18.962	1314.194
19.207	1265.329
19.801	1386.093
19.897	2069.362
20.229	1319.946
21.017	1444.573];
data.LN(:,1) = data.LN(:,1)/ 0.92;
units.LN = {'cm','#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DingChen2010';
comment.LN = 'ST was converted to TL, using F2';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.92 * TL'; 
metaData.bibkey.F2 = 'Halp2023'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3GJ2J'; % Cat of Life
metaData.links.id_ITIS = '681989'; % ITIS
metaData.links.id_EoL = '339017'; % Ency of Life
metaData.links.id_Wiki = 'Glyptosternon'; % Wikipedia
metaData.links.id_ADW = 'Glyptosternon_maculatum'; % ADW
metaData.links.id_Taxo = '175082'; % Taxonomicon
metaData.links.id_WoRMS = '1526172'; % WoRMS
metaData.links.id_fishbase = 'Glyptosternon-maculatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Glyptosternon}}';  
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
bibkey = 'LiXie2008'; type = 'Article'; bib = [ ...
'author = {Hong-Jing Li and Cong-Xin Xie}, ' ...
'year = {2008}, ' ...
'title = {Age and Growth of the Tibetan Catfish \emph{Glyptosternum maculatum} in the  {B}rahmaputra {R}iver, {C}hina}, ' ... 
'journal = {Zoological Studies}, ' ...
'volume = {47(5)}, '...
'pages = {555-563}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DingChen2010'; type = 'Article'; bib = [ ...
'doi = {10.3724/SP.J.1035.2010.00762}, ' ...
'author = {Ding, Cheng-Zhi and Chen, Yi-Feng and He, De-Kui and Yao Jing-Long and Chen, Feng}, ' ...
'year = {2010}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF \emph{Glyptosternum maculatum} IN {Y}ARLUNG {T}SANGPO {R}IVER IN {T}IBET, {C}HINA}, ' ... 
'journal = {Acta Hydrobiologica Sinica}, ' ...
'volume = {34(4)}, '...
'pages = {762-768}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Halp2023'; type = 'misc'; bib = [ ...
'author = {Liu, Halping}, ' ...
'year = {2023}, ' ...
'title = {GigaScience Draft genome of \emph{Glyptosternon maculatum}, an endemic fish from {T}ibet-plateau}, ' ... 
'howpublished = {\url{https://www.semanticscholar.org/reader/269d1db5767587064191a626d6338138ac75c9b9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Glyptosternon-maculatum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


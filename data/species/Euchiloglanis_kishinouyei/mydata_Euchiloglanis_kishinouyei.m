  function [data, auxData, metaData, txtData, weights] = mydata_Euchiloglanis_kishinouyei
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Sisoridae';
metaData.species    = 'Euchiloglanis_kishinouyei'; 
metaData.species_en = 'Sucker catfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFr','biFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 26];

%% set data
% zero-variate data
data.ab = 20; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'ChenZhu2023';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 19.3;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.35e-2;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ChenZhu2023';
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwp = 36.35;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01023*Lp^2.99, see F1';
data.Wwi = 73.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.99, see F1';
 
% uni-variate data

% time-length-weight
data.tLW = [ ... % time since hatch (yr), std length (cm), weight (g)
    1  7.66  7.0
    2  8.00  7.5
    3 10.17 15.8
    4 12.63 28.0
    5 14.53 36.4
    6 14.99 39.7
    7 16.09 49.1
    8 16.02 45.4
    9 15.90 46.86
   10 17.90 71.38];
data.tLW(:,1) = (.2 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'std length', 'weight'};  
  temp.tLW = C2K(18);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
  treat.tLW = {1, {'std length','weight'}};
bibkey.tLW = 'ChenZhu2023';

% length=weight
data.LW = [ ... % std length (cm), weight(g)
6.693	3.813
6.693	6.318
6.934	4.989
6.969	6.020
7.055	3.220
7.176	5.134
7.263	7.196
7.280	5.722
7.366	5.280
7.367	7.931
7.419	9.552
7.487	5.720
7.504	4.983
7.557	8.371
7.574	9.255
7.694	5.718
7.746	7.043
7.798	8.369
7.832	5.569
7.850	9.105
7.884	6.747
7.954	8.515
8.023	9.398
8.057	6.746
8.057	9.250
8.074	5.272
8.092	10.576
8.126	8.513
8.212	6.302
8.247	9.837
8.299	8.806
8.316	5.564
8.402	7.184
8.403	10.425
8.454	8.657
8.541	11.013
8.627	9.833
8.782	9.095
8.886	10.862
8.989	7.767
9.145	10.712
9.231	9.090
9.282	6.438
9.335	8.647
9.352	7.911
9.440	16.455
9.456	12.624
9.543	11.592
9.595	15.422
9.767	9.821
9.873	22.491
10.302	9.816
10.510	16.591
10.821	15.998
10.976	16.439
11.426	18.644
11.702	17.168
11.719	20.261
12.102	31.160
12.428	23.348
12.620	35.721
13.018	38.517
13.275	28.348
13.465	29.230
13.535	35.859
13.724	27.901
13.933	37.328
14.070	33.202
14.157	35.263
14.209	37.620
14.262	44.544
14.363	31.725
14.364	37.029
14.434	40.417
14.554	35.406
14.622	33.196
14.658	36.289
14.675	34.963
14.746	44.981
14.796	35.993
14.831	38.350
14.899	34.961
15.071	31.128
15.072	37.758
15.162	53.816
15.211	40.998
15.262	38.788
15.298	44.533
15.367	43.206
15.488	46.594
15.556	42.026
15.715	57.788
15.730	45.707
15.800	51.305
15.937	46.736
16.075	42.757
16.109	44.377
16.230	43.639
16.319	55.277
16.577	49.971
16.627	45.108
16.697	47.023
16.699	56.157
16.733	53.652
17.060	50.702
17.407	58.507
17.945	71.319
18.426	59.086
19.016	75.286];
units.LW = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'ChenZhu2023';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
13.457	209.007
14.033	353.738
14.190	238.742
14.201	241.770
14.212	246.008
14.295	193.958
14.391	174.598
14.509	161.898
14.510	184.295
14.610	267.235
14.683	207.920
14.692	166.153
14.693	186.735
14.765	103.207
14.831	137.717
14.940	175.258
15.082	235.200
15.091	181.932
15.115	250.337
15.188	200.102
15.197	157.730
15.275	215.244
15.407	296.371
15.502	241.901
15.682	177.754
16.112	168.718
16.135	215.936
16.201	254.683
16.295	189.923
16.597	196.007
16.607	180.874
16.694	203.886
16.726	209.337
17.028	216.026
18.434	167.136];
units.LN = {'cm', '#'};  label.LN = {'std length', 'yearly fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ChenZhu2023';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
31.377	212.430
31.617	354.310
32.996	246.699
33.195	241.058
34.201	239.321
34.323	195.396
35.257	178.459
35.729	186.319
36.326	163.768
36.333	188.542
36.353	266.244
36.741	209.356
37.249	105.728
37.601	167.648
38.128	134.401
38.341	176.621
39.214	182.772
40.372	250.847
41.307	235.599
42.370	197.823
43.313	215.795
43.431	156.668
43.938	295.157
44.193	245.032
44.641	168.434
44.644	178.569
45.258	216.265
45.335	256.238
45.653	190.908
47.193	181.261
49.744	194.652
50.955	209.233
55.379	205.641
56.388	215.164
59.325	166.599];
units.WN = {'g', '#'};  label.WN = {'weight', 'yearly fecundity'};  
temp.WN = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'ChenZhu2023';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 3;
weights.ab = weights.ab * 0;
weights.Lp = weights.Lp * 5;
weights.Wwp = weights.Wwp * 5;
weights.Wwi = weights.Wwi * 5;
weights.Wwb = weights.Wwb * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Known only from the upper Min-Jiang (Yangtze River basin, China)'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BSTM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '219645'; % Ency of Life
metaData.links.id_Wiki = 'Euchiloglanis_kishinouyei'; % Wikipedia
metaData.links.id_ADW = 'Euchiloglanis_kishinouyei'; % ADW
metaData.links.id_Taxo = '174210'; % Taxonomicon
metaData.links.id_WoRMS = '1015491'; % WoRMS
metaData.links.id_fishbase = 'Euchiloglanis-kishinouyei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Euchiloglanis_kishinouyei}}';  
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
bibkey = 'ChenZhu2023'; type = 'Article'; bib = [ ...
'doi = {10.3390/fishes8090435}, ' ...
'author = {Jie Chen and Xiangyun Zhu and Xin Yang and Xianqin Hu and Pengcheng Lin and Bin Xu and Kaijin Wei and Baoshan Ma}, ' ...
'year = {2023}, ' ...
'title = {Age, Growth, and Reproductive Biology of \emph{Euchiloglanis davidi} in the Middle and Lower {Y}along {R}iver, {C}hina}, ' ... 
'journal = {Fishes}, ' ...
'volume = {8}, '...
'pages = {435}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Euchiloglanis-kishinouyei.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


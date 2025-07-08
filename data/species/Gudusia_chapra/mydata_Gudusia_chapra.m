  function [data, auxData, metaData, txtData, weights] = mydata_Gudusia_chapra
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Gudusia_chapra'; 
metaData.species_en = 'Indian river shad'; 

metaData.ecoCode.climate = {'MA','Aw'};
metaData.ecoCode.ecozone = {'MIN'};
metaData.ecoCode.habitat = {'piMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'t-Ww';'L-N';'Ww-N' }; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 08];

%% set data
% zero-variate data
data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.3;     units.Lp = 'cm';   label.Lp = 'std length at puberty';bibkey.Lp = 'KabiHoss1998';
data.Lpm = 7.7;     units.Lpm = 'cm';   label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'KabiHoss1998';
data.Li = 20;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KabiHoss1998';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 14.65;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'KabiHoss1998';
data.Wwpm = 7.41;   units.Wwpm = 'g';    label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'KabiHoss1998';
data.Wwi = 82.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.05, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), std length (cm)
 30	 3.702  3.609
 52	 4.553  4.406
 86  5.574  5.297
111  6.553  6.375
146	 7.489  7.125
177	 8.085  7.875
207  8.723  8.438
238	 9.319  9.328
273	 9.957  9.891
303	10.340 10.219
334	10.809 10.500
350	11.191 10.734];
data.tL_fm(:,1) = data.tL_fm(:,1) + 70; % set origin at birth
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
  treat.tL_fm = {1 {'females','males',}};
bibkey.tL_fm = 'AhmeSmit2007';

% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g)
 30	 0.934  1.259
 52	 1.765  2.098
 86  3.114  3.462
111  5.087  5.769
146	 7.370  8.077
177	 9.031 10.909
207 11.419 13.427
238	13.910 15.944
273	16.817 20.455
303	18.478 22.972
334	21.488 25.175
350	23.045 26.224];
data.tW_fm(:,1) = data.tW_fm(:,1) + 70; % set origin at birth
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
  temp.tW_fm = C2K(25);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature'; 
  treat.tW_fm = {1 {'females','males',}};
bibkey.tW_fm = 'AhmeSmit2007';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
9.358	24440.527
9.627	37611.059
9.759	39029.338
9.856	24413.934
9.865	69313.223
9.967	79641.868
10.569	103484.968
10.629	71410.504
10.690	48957.323
10.691	51095.380
10.697	79959.203
10.721	38265.240
10.753	32561.973
10.845	154427.906
10.889	47164.968
10.921	40036.321
10.951	24711.777
10.952	31482.304
10.957	55713.667
10.986	37894.719
10.991	57849.950
10.991	61057.040
11.082	20072.216
11.119	37174.933
11.121	47152.558
11.189	52850.505
11.216	27191.998
11.224	64251.728
11.229	87770.397
11.256	57479.429
11.323	61039.311
11.390	62461.146
11.420	48561.973
11.452	45709.449
11.549	33944.796
11.553	52474.656
11.560	84545.579
11.563	100224.688
11.600	119465.466
11.622	63161.421
11.668	125519.761
11.687	59594.439
11.695	94159.765
11.701	126230.673
11.729	99146.795
11.729	102353.885
11.764	106628.234
11.792	83464.136
11.819	53529.506
11.898	113035.326
11.918	51742.469
11.926	89158.538
11.959	89869.460
12.119	60284.077
12.121	71687.073
12.151	54580.811
12.191	88075.331
12.254	70967.296
12.261	104463.580
12.295	109450.620
12.353	72387.349
12.368	142943.363
12.383	53143.030
12.429	118352.116
12.478	34964.189
12.623	92328.407
12.647	48140.030
12.755	89826.911
12.823	98731.948
12.824	104433.442
12.851	72360.756
12.854	86258.156
12.919	82691.173
13.020	86961.977
13.023	102284.743
13.054	92661.697
13.112	52391.332
13.232	150380.483
13.454	99054.607
13.819	104380.256
15.046	100751.228
15.177	93973.615
17.138	114180.591];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'KabiHoss1998';
 
% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
14.853	27371.900
16.379	39386.883
16.626	24768.572
16.844	48872.472
17.430	53971.323
17.999	82814.927
19.306	71456.627
19.800	42219.993
19.805	34913.922
21.439	60807.371
21.455	39254.437
21.800	51665.530
22.054	26453.405
22.516	40322.630
22.621	58219.443
22.839	83053.940
22.847	72094.828
22.976	56748.981
23.091	61129.547
23.108	38846.017
23.690	49059.121
24.056	33341.815
24.393	55981.413
24.767	30035.602
25.115	38063.048
25.574	56315.919
26.401	54833.146
26.849	87332.861
26.868	62492.204
26.878	48610.659
26.917	154910.992
26.957	101211.326
27.114	47873.883
27.123	36549.464
27.224	59195.231
27.347	52981.984
27.534	119826.425
27.577	61377.809
28.267	85104.080
28.400	65374.587
28.946	124903.716
29.205	94942.646
29.309	112839.450
29.580	66074.401
29.790	101868.013
29.800	87986.463
29.890	125974.989
30.022	106976.106
30.061	54007.046
30.736	99651.549
30.979	90147.490
31.318	110229.957
31.676	104741.160
31.923	90122.848
32.180	61988.289
32.985	90460.435
34.263	118554.942
34.599	143021.060
34.787	48404.289
35.241	72502.018
35.964	53122.432
36.787	57484.517
37.114	93640.362
37.365	73907.788
37.699	101296.340
38.885	93594.160
39.231	105274.637
39.506	52299.421
39.788	149826.306
40.887	99751.959
43.732	83969.975
44.307	104046.281
45.030	84666.699
63.555	95142.227
64.496	100231.838
65.075	114463.291];
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(25);  units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'KabiHoss1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.LN = weights.LN * 5;
weights.Li = weights.Li * 5;
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'calculated Wwi was ignored, due to inconsistency with tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HK4V'; % Cat of Life
metaData.links.id_ITIS = '551302'; % ITIS
metaData.links.id_EoL = '217083'; % Ency of Life
metaData.links.id_Wiki = 'Gudusia_chapra'; % Wikipedia
metaData.links.id_ADW = 'Gudusia_chapra'; % ADW
metaData.links.id_Taxo = '175472'; % Taxonomicon
metaData.links.id_WoRMS = '742989'; % WoRMS
metaData.links.id_fishbase = 'Gudusia-chapra'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Gudusia_chapra}}';  
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
bibkey = 'AhmeSmit2007'; type = 'Article'; bib = [ ... 
'author = {Zoarder F. Ahmed and Carl Smith and Ferdous Ahamed and Yeamin Hossain}, ' ...
'doi = {10.1046/j.1365-2400.2003.00338.x}, ' ...
'year = {2007}, ' ...
'title = {Growth and reproduction of the {I}ndian river shad, \emph{Gudusia chapra} ({C}lupeidae)}, ' ... 
'journal = {Folia Zool.}, ' ...
'volume = {56(4)}, '...
'pages = {429–439}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KabiHoss1998'; type = 'Article'; bib = [ ... 
'author = {A.K.M.A. Kabir and M.A. Hossain and S.M. Rahmatullah and S. Dewan and M.S. Islam}, ' ...
'year = {1998}, ' ...
'title = {Studies on the gonadosomatic index and fecundity of chapila (\emph{Gudusia chapra} {H}am.)}, ' ... 
'journal = {Bangladesh J. Fish. Res.}, ' ...
'volume = {2(2)}, '...
'pages = {195-200}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gudusia-chapra.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  function [data, auxData, metaData, txtData, weights] = mydata_Clupeonella_caspia
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Ehiravidae';
metaData.species    = 'Clupeonella_caspia'; 
metaData.species_en = 'Caspian tyulka'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 21];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 14.9;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 3.42;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00525*Li^2.98, see F1';
data.Wwi = 16.45;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^2.98, see F1';

data.GSI = 0.3; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'AliaKera2012';
  temp.GSI = C2K(28.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'Spawns throught the year: GSI peaks at 0.1. Assumed 3 spawns per yr';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
0.973	5.688
0.988	6.453
0.989	5.633
1.001	6.125
1.002	5.086
1.003	4.813
1.017	6.672
1.946	7.930
1.961	8.969
1.962	7.438
1.990	9.461
1.991	7.328
2.003	9.789
2.004	7.055
2.033	8.313
2.963	9.023
2.977	10.719
2.991	8.313
2.992	8.695
2.993	10.555
3.005	7.930
3.006	9.461
3.007	9.789
3.008	10.227
3.009	11.047
3.010	11.156
3.011	11.813
3.963	11.813
3.964	11.484
3.965	10.883
3.966	9.625
3.992	12.031
3.993	11.102
3.994	10.828
3.995	10.445
4.008	10.063
4.980	12.031
4.981	12.305
4.982	12.523
4.995	11.102
4.996	11.539
5.968	11.539
5.969	12.195
5.983	12.414];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.8);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'AliaKera2012';

% length-weight
data.LW = [ ...
4.147	0.764
4.217	0.765
4.217	0.992
4.601	0.844
4.619	1.223
4.724	1.073
4.812	1.377
4.882	1.984
4.934	1.605
4.986	1.302
5.039	1.379
5.039	1.758
5.109	2.062
5.214	1.608
5.265	1.229
5.354	1.988
5.371	1.761
5.389	2.519
5.546	2.293
5.547	2.672
5.686	2.219
5.720	1.612
5.721	2.674
5.791	2.599
5.827	3.206
5.878	1.993
5.931	3.131
5.966	2.752
6.070	2.222
6.087	2.222
6.089	3.208
6.106	2.981
6.193	2.526
6.228	2.754
6.281	3.892
6.316	3.210
6.368	2.907
6.438	3.439
6.490	3.363
6.561	3.667
6.561	3.971
6.613	3.289
6.735	3.669
6.823	4.201
6.840	3.366
6.840	3.746
6.945	3.974
6.999	4.885
7.034	5.568
7.050	4.354
7.085	3.824
7.086	4.885
7.089	7.313
7.137	3.369
7.140	6.782
7.209	5.569
7.242	3.901
7.245	6.631
7.279	6.101
7.313	4.660
7.349	6.025
7.350	6.481
7.418	4.964
7.422	8.681
7.489	5.951
7.507	6.179
7.539	4.055
7.561	8.379
7.575	4.586
7.613	7.772
7.646	6.256
7.663	5.421
7.680	4.891
7.736	8.532
7.836	4.437
7.858	7.774
7.873	5.727
7.891	6.182
7.892	7.320
7.946	8.913
7.981	8.913
7.995	5.576
8.035	9.900
8.064	4.970
8.084	6.790
8.100	5.880
8.102	7.321
8.134	5.198
8.139	9.370
8.190	8.157
8.208	8.915
8.225	8.233
8.225	8.460
8.241	7.171
8.275	5.730
8.293	6.565
8.295	8.309
8.297	10.661
8.310	6.186
8.329	7.930
8.344	5.124
8.346	7.020
8.383	8.613
8.396	5.352
8.470	8.538
8.490	10.890
8.554	5.581
8.557	8.842
8.576	9.904
8.626	7.554
8.645	8.919
8.678	6.947
8.747	6.265
8.752	11.120
8.765	7.024
8.799	6.645
8.836	8.162
8.856	10.134
8.872	8.769
8.874	10.590
8.874	10.666
8.893	11.803
8.908	9.831
8.959	8.467
8.959	8.542
8.978	9.832
8.992	7.177
9.016	13.018
9.045	7.785
9.051	12.639
9.066	10.288
9.079	6.571
9.099	9.150
9.172	11.958
9.191	13.020
9.206	11.199
9.219	7.407
9.220	8.165
9.222	10.062
9.235	5.814
9.241	10.593
9.244	13.627
9.253	6.421
9.254	7.180
9.276	11.200
9.277	12.110
9.297	14.082
9.309	9.228
9.344	9.304
9.360	7.712
9.361	8.773
9.362	10.291
9.381	10.973
9.382	12.490
9.399	11.808
9.402	14.007
9.417	11.808
9.470	13.098
9.482	8.016
9.536	9.382
9.592	12.568
9.605	8.169
9.606	9.686
9.625	10.444
9.625	10.520
9.629	14.237
9.646	13.554
9.675	9.004
9.699	14.769
9.711	9.307
9.732	12.417
9.745	8.398
9.750	13.328
9.771	16.059
9.799	10.674
9.803	13.556
9.835	11.432
9.851	9.536
9.890	13.860
9.891	14.467
9.904	10.523
9.946	16.970
9.957	10.902
9.991	9.765
10.047	13.558
10.078	9.462
10.081	12.269
10.085	16.365
10.097	11.435
10.102	15.606
10.148	9.691
10.170	14.318
10.183	10.070
10.202	11.208
10.205	13.939
10.219	10.601
10.221	13.180
10.255	11.815
10.273	12.119
10.273	12.574
10.311	15.456
10.328	14.850
10.329	16.063
10.341	11.057
10.363	14.850
10.400	16.519
10.431	12.803
10.431	13.410
10.501	13.638
10.505	16.899
10.521	15.913
10.523	17.430
10.525	19.251
10.535	12.121
10.537	14.321
10.554	13.411
10.615	21.451
10.642	14.549
10.693	13.260
10.709	11.440
10.745	12.502
10.803	17.509
10.851	14.323
10.888	15.310
11.062	15.387
11.079	14.856
11.148	13.643
11.398	18.803
11.488	21.080
11.662	20.626
11.852	18.959];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'AliaKera2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 0;
weights.Wwp = weights.Wwp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^2.98'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WCX2'; % Cat of Life
metaData.links.id_ITIS = '551221'; % ITIS
metaData.links.id_EoL = '46562395'; % Ency of Life
metaData.links.id_Wiki = 'Clupeonella_grimmi'; % Wikipedia
metaData.links.id_ADW = 'Clupeonella_grimmi'; % ADW
metaData.links.id_Taxo = '171481'; % Taxonomicon
metaData.links.id_WoRMS = '272259'; % WoRMS
metaData.links.id_fishbase = 'Clupeonella-grimmi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupeonella_grimmi}}';  
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
bibkey = 'AliaKera2012'; type = 'Article'; bib = [ ... 
'author = {M. Aliasghari and Abdolsamad Keramat and Farokh Parafkandeh Haghighi}, ' ...
'doi = {10.22059/jfisheries.2012.28625}, ' ...
'year = {2012}, ' ...
'title = {Investigation of Some of the Growth and Reproductive Parameters of Common Kilka \emph{Clupeonella caspia} ({S}vetovidov, 1941) in Southern {C}aspian {S}ea ({M}azandaran {Z}one)}, ' ... 
'journal = {Journal of Fisheries}, ' ...
'volume = {65(2)}, '...
'pages = {205-217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clupeonella-grimmi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
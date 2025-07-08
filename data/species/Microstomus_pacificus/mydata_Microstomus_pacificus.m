function [data, auxData, metaData, txtData, weights] = mydata_Microstomus_pacificus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Microstomus_pacificus'; 
metaData.species_en = 'Dover sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.5); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 12];

%% set data
% zero-variate data
data.ab = 41;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(3.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 60*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'HuntButl1990';  
  temp.am = C2K(3.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';       bibkey.Lp = 'fishbase';
data.Li = 76;    units.Li = 'cm';   label.Li = 'ultimate total length';          bibkey.Li = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.29  mm of Microstomus_kitt: pi/6*0.129^3';
data.Wwp = 476;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00646*Lp^3.07, see F1';
data.Wwi = 3.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00646*Li^3.07, see F1';

data.Ri = 23e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(3.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (years) ~ Length (cm) 
1.708	18.621
2.732	18.948
2.732	24.387
3.188	25.045
3.643	19.110
3.643	27.022
4.213	29.823
4.326	26.031
4.782	30.645
4.896	32.293
4.896	30.150
4.896	25.205
5.009	29.161
5.009	22.238
5.123	25.534
5.351	29.490
5.351	27.347
5.465	26.193
5.693	31.632
5.920	35.587
5.920	34.598
6.148	26.356
6.262	28.663
6.603	36.245
6.717	33.772
6.717	32.948
6.717	31.794
6.717	30.640
6.717	27.838
7.059	39.210
7.059	28.331
7.173	34.595
7.173	24.705
7.287	28.166
7.514	35.583
7.628	40.528
7.742	36.901
7.742	32.121
7.856	34.428
7.856	39.208
8.197	33.603
8.539	32.448
8.539	35.580
8.539	39.701
8.653	29.316
8.767	29.975
8.767	34.096
8.880	30.964
8.880	25.689
8.994	40.853
9.222	35.578
9.336	40.358
9.450	36.731
9.677	35.247
9.791	34.917
10.133	43.488
10.133	27.828
10.133	38.378
10.247	41.839
10.588	32.607
10.588	39.530
10.702	33.761
10.702	37.058
10.702	38.211
10.930	35.409
10.930	27.167
11.157	34.089
11.157	32.441
11.271	40.682
11.271	35.902
11.613	39.033
11.727	38.044
11.841	41.010
11.841	37.549
11.954	36.230
11.954	33.098
12.068	35.570
12.068	28.318
12.410	40.844
12.638	32.931
12.751	34.250
12.865	45.953
12.979	37.381
12.979	38.535
12.979	30.623
13.093	43.315
13.093	39.359
13.435	41.830
13.548	31.116
13.776	39.357
13.776	36.390
13.890	41.005
13.890	37.543
14.118	37.872
14.345	43.971
14.345	31.773
14.459	34.740
14.573	39.684
14.573	36.882
14.687	41.497
14.801	32.266
15.028	30.947
15.142	38.694
15.256	37.375
15.598	38.033
15.598	40.176
15.598	41.000
15.712	34.571
15.712	36.384
15.825	39.022
16.053	42.812
16.167	38.032
16.167	35.724
16.395	41.822
16.622	40.997
16.850	36.546
16.850	38.854
16.850	44.293
16.964	41.656
17.192	38.194
17.306	43.468
17.419	39.676
17.647	39.346
17.761	40.170
17.761	45.939
17.761	45.115
17.875	35.719
17.875	41.159
17.989	44.455
18.102	46.103
18.216	35.718
18.330	41.652
18.672	37.530
18.786	40.991
18.899	47.584
19.013	42.474
19.355	38.847
19.469	43.132
19.469	44.451
19.583	39.506
19.583	40.330
19.696	41.813
20.152	38.021
20.152	35.054
20.266	45.768
20.380	38.350
20.380	43.295
20.607	42.305
20.835	44.942
20.835	42.799
20.949	39.007
20.949	41.150
21.404	39.501
21.404	37.193
21.404	37.358
21.632	43.786
21.632	47.247
21.632	41.808
21.860	41.972
21.860	45.104
22.087	48.400
22.087	43.290
22.315	39.993
22.429	47.245
22.543	45.267
22.657	46.750
22.657	46.420
22.657	42.629
22.770	40.980
23.112	44.441
23.112	43.287
23.226	49.056
23.226	39.331
23.340	44.935
23.454	44.440
23.567	43.616
23.681	42.956
23.795	45.099
23.909	48.889
23.909	36.362
24.137	48.065
24.250	42.625
24.250	45.757
24.250	47.570
24.250	41.471
24.364	44.602
24.478	41.965
24.478	40.811
24.478	36.855
24.706	45.591
24.706	46.580
24.934	43.282
24.934	40.480
25.047	35.699
25.389	45.753
25.389	44.105
25.503	49.215
25.503	42.456
25.617	44.929
25.731	40.972
25.844	43.609
26.072	40.477
26.300	44.432
26.414	50.201
26.528	39.981
26.528	47.069
26.641	40.970
26.641	40.475
26.641	48.552
26.755	43.112
26.755	45.750
26.983	45.255
26.983	45.914
27.438	41.132
27.552	48.055
27.780	43.604
27.780	48.714
27.894	42.450
28.121	41.625
28.235	48.548
28.349	42.943
28.463	45.415
28.805	47.228
28.918	43.766
29.260	45.413
29.260	42.446
29.488	40.467
29.602	47.555
29.602	40.632
29.829	43.928
29.943	47.884
30.398	48.212
30.398	46.069
30.740	45.244
31.082	46.727
31.082	43.100
31.309	48.704
31.423	40.627
31.537	47.385
31.651	45.077
31.765	45.901
31.765	42.439
31.879	49.527
31.992	50.351
32.334	43.921
32.334	47.053
32.448	41.943
32.676	48.700
33.017	47.216
33.131	46.556
33.586	43.753
33.586	46.225
34.042	43.917
34.725	47.047
34.725	45.893
34.725	44.574
34.953	43.584
34.953	42.760
35.522	47.044
35.636	45.890
35.863	48.197
36.091	44.735
36.205	45.229
36.433	44.734
36.546	43.910
37.571	46.050
37.799	51.983
38.368	43.080
38.596	44.234
39.051	51.320
39.165	48.023
39.279	49.177
39.393	43.572
39.848	46.043
39.848	44.725
40.531	48.514
41.556	49.830
43.605	46.692
44.516	47.020
44.744	49.162
48.046	44.373
49.981	54.422
51.006	49.145];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(3.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HuntButl1990';
%
data.tL_m = [ ... % time since birth (years) ~ Length (cm) 
2.846	18.670
2.846	20.984
2.960	18.835
3.188	27.264
3.188	22.636
3.416	24.123
3.529	23.130
3.529	21.312
3.529	20.321
3.757	19.328
4.554	25.442
5.009	30.895
5.009	23.953
5.009	21.143
5.123	34.366
5.579	29.736
6.034	25.438
6.148	26.925
6.490	30.395
7.400	29.070
7.514	27.252
7.742	28.078
7.856	34.524
7.856	33.532
7.970	25.928
8.425	29.398
8.425	34.687
8.539	35.348
8.880	28.901
8.880	31.380
8.994	27.909
8.994	31.049
8.994	25.925
9.108	39.148
9.108	32.041
9.336	37.495
9.677	32.866
9.791	31.047
10.019	29.063
10.133	37.327
10.247	35.343
10.361	40.632
10.361	35.012
10.474	36.169
10.474	27.739
10.702	33.028
10.702	32.697
10.702	28.069
11.044	33.854
11.157	34.680
11.271	32.365
11.385	36.497
11.727	29.885
11.954	33.851
11.954	36.661
12.182	26.743
12.751	33.188
12.865	37.815
13.093	34.840
13.207	36.492
13.207	38.476
13.548	35.830
14.004	35.333
14.573	35.662
14.801	40.289
15.028	33.181
15.825	36.320
16.053	36.980
16.395	31.855
16.509	38.632
16.509	37.144
16.850	42.598
16.850	45.243
16.964	34.333
17.192	35.820
17.306	39.952
17.989	35.818
18.330	36.643
18.330	38.627
18.672	35.651
18.672	37.634
18.786	34.659
18.899	33.501
18.899	38.956
19.355	38.789
19.583	40.442
20.380	33.993
20.607	37.629
20.949	43.909
21.063	41.264
21.063	37.958
21.290	35.809
21.290	35.313
21.404	40.767
21.632	37.957
21.632	36.138
21.746	41.758
22.087	42.749
22.315	43.244
22.429	33.987
22.543	45.888
22.770	40.598
22.998	35.308
22.998	39.110
23.112	45.225
23.226	39.770
24.250	41.420
24.364	43.404
24.364	32.825
24.592	40.263
25.503	41.252
25.844	44.557
26.528	40.257
27.552	38.767
29.374	43.059
29.943	38.099
30.057	40.082
30.398	41.899
31.195	44.542
31.195	39.583
32.106	45.200
32.334	42.555
32.562	39.910
33.245	44.867
33.700	46.518
33.928	41.724
34.611	48.334
35.522	43.703
35.977	45.025
37.230	42.376
37.343	41.550
37.799	44.028
37.913	40.722
41.784	43.521
42.694	41.700
44.744	42.521
47.021	43.837
50.095	45.647
56.471	46.456];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(3.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HuntButl1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00646*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '437HJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570112'; % Ency of Life
metaData.links.id_Wiki = 'Microstomus_pacificus'; % Wikipedia
metaData.links.id_ADW = 'Microstomus_pacificus'; % ADW
metaData.links.id_Taxo = '180120'; % Taxonomicon
metaData.links.id_WoRMS = '274294'; % WoRMS
metaData.links.id_fishbase = 'Microstomus-pacificus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microstomus_pacificus}}';
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
bibkey = 'HuntButl1990'; type = 'techreport'; bib = [ ...
'howpublished = {\url{https://swfsc-publications.fisheries.noaa.gov/publications/CR/1990/9026.PDF}}, ' ...
'author = {Hunter, J.R. and J.L. Butler and C. Kimbrell and E.A. Lynn}, ' ... 
'year   = {1990}, ' ...
'title  = {Bathymetric patterns in size, age, sexual maturity, water content, and caloric density of dover sole, \emph{Microstomus pacificus}}, ' ...
'institution = {CalCOFI}, ' ...
'volume = {31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Microstomus-pacificus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

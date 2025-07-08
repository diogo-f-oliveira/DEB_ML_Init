function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_mystinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_mystinus'; 
metaData.species_en = 'Blue rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 23];

%% set data
% zero-variate data

data.am = 44*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'LaidPear1970';   
  temp.am = C2K(4.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LaidPear1970';
  comment.Lp = 'based on tp = 4.5 yrs and tL data';
data.Li  = 61;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 3.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1, gives 265.5 g';

data.Ri  = 524000/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at FL 23.75 cm'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
0.060	10.096
0.901	12.342
0.901	13.119
0.901	13.637
0.962	11.737
1.803	15.106
1.983	16.833
1.983	17.697
1.983	18.301
2.043	16.056
2.043	13.637
2.764	25.902
2.764	21.929
2.764	20.288
2.764	19.511
2.945	21.497
2.945	18.820
3.005	23.311
3.005	20.633
3.065	25.038
3.065	24.607
3.726	26.075
3.786	23.916
3.786	25.816
3.846	21.497
3.846	24.607
3.846	20.893
3.906	25.211
3.966	22.274
3.966	19.597
4.026	23.225
4.026	27.025
4.026	27.802
4.026	28.493
4.688	22.879
4.808	30.912
4.928	26.161
4.988	29.962
4.988	25.643
4.988	25.125
4.988	24.434
4.988	23.916
5.048	29.271
5.048	27.025
5.108	28.493
5.228	27.802
5.649	30.653
5.889	30.480
5.889	29.530
5.889	27.457
6.010	25.384
6.010	31.948
6.010	28.666
6.130	33.157
6.190	24.002
6.250	26.334
6.310	28.407
6.731	26.939
6.911	33.935
6.911	32.466
6.911	31.516
6.971	30.480
6.971	27.284
7.031	30.307
7.031	28.580
7.031	24.779
7.091	29.271
7.091	25.816
7.752	27.975
7.752	31.430
7.813	26.766
7.813	30.825
7.813	31.171
7.873	33.417
7.873	34.367
7.933	29.098
7.933	27.716
8.053	32.294
8.053	25.988
8.113	29.875
8.173	20.893
8.834	29.012
8.894	36.440
8.894	36.267
8.894	32.898
8.894	32.639
8.894	31.257
8.894	30.393
8.894	25.902
8.954	33.676
8.954	32.035
8.954	31.862
8.954	28.148
9.014	35.403
9.014	26.593
9.075	28.580
9.135	34.626
9.916	30.307
9.916	34.798
9.916	35.230
9.976	32.639
9.976	33.935
9.976	36.008
10.036	26.334
10.036	28.061
10.036	29.098
10.036	36.526
10.096	31.171
10.096	33.157
10.156	37.994
10.697	35.662
10.757	34.626
10.757	33.589
10.817	31.775
10.817	31.689
10.877	37.908
10.877	36.958
10.877	33.157
10.877	30.134
10.938	34.367
10.998	32.639
11.899	32.898
11.899	35.662
11.959	34.885
12.019	31.689
12.019	36.526
12.079	37.562
12.139	34.021
12.740	34.539
12.861	32.639
12.921	37.735
12.921	36.267
12.921	35.489
12.921	33.935
12.921	33.071
12.981	39.722
12.981	31.775
13.942	34.194
13.942	35.317
13.942	37.476
14.063	35.835
14.123	36.526
14.243	33.244
14.784	37.044
14.784	34.107
14.904	34.626
14.904	34.194
14.964	37.994
14.964	33.848
15.024	36.440
15.024	35.835
15.144	33.589
15.144	32.553
15.144	32.035
15.325	31.084
15.865	38.685
15.986	35.489
15.986	36.440
15.986	36.871
15.986	37.649
15.986	39.290
16.046	40.326
16.106	40.758
16.166	33.417
16.226	34.453
16.827	32.898
16.887	35.662
16.887	35.230
16.887	33.762
16.947	40.931
17.007	39.894
17.067	38.253
17.127	36.785
17.728	35.403
17.728	36.871
17.788	37.303
17.788	40.931
17.788	34.539
17.909	38.512
18.029	33.762
18.029	36.008
18.750	39.290
18.810	40.067
18.810	40.585
18.870	34.885
18.990	41.363
18.990	38.167
18.990	34.539
19.050	36.612
19.050	33.676
19.832	33.848
20.733	44.299
20.853	43.349
20.913	43.695
20.913	39.894
21.094	30.566
21.875	38.081
21.875	35.317
21.935	37.044
21.935	35.489
21.995	42.140
21.995	41.536
21.995	35.921
22.055	40.845
22.776	32.380
22.837	40.067
22.957	42.745
22.957	37.303
22.957	37.044
22.957	36.440
22.957	35.662
22.957	34.798
23.017	37.994
23.017	33.244
23.077	43.436
23.137	33.762
23.798	36.785
23.858	38.167
23.858	38.685
23.918	37.649
23.978	36.526
23.978	36.094
23.978	33.244
24.038	38.858
24.099	39.722
24.820	37.044
24.880	37.649
25.000	35.144
25.000	36.094
25.781	34.885
25.841	35.835
25.841	37.476
25.901	37.908
25.901	38.858
25.901	39.290
25.901	40.758
26.803	37.562
26.923	39.117
26.983	38.253
27.043	41.708
27.103	36.440
27.885	40.672
28.005	42.745
28.005	36.785
28.125	37.390
28.185	39.031
28.185	38.081
28.185	35.144
28.906	37.131
28.906	38.944
28.906	40.931
29.026	40.067
29.928	39.722
29.988	38.167
30.108	37.390
30.168	38.685
30.829	41.190
31.010	37.908
31.971	37.217
32.031	38.340
32.873	43.349
32.933	38.081
33.053	40.154
33.954	36.612
34.976	42.399
35.096	37.044
35.877	38.512
36.959	37.994
39.964	38.512
39.964	35.749
40.024	43.868
41.106	37.562];
data.tL_f(:,1) = 365*(1+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(4.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LaidPear1970';
%
data.tL_m = [ ...
0.781	12.514
0.841	14.328
0.901	11.823
0.962	10.960
1.082	10.182
1.743	16.574
1.803	15.106
1.803	14.415
1.983	19.165
1.983	15.883
2.043	18.215
2.043	17.524
2.043	13.983
2.043	13.205
3.005	18.647
3.005	18.906
3.005	18.992
3.005	19.338
3.065	19.856
3.065	20.461
3.065	21.324
3.906	18.992
3.906	19.770
3.966	18.647
4.087	21.583
4.087	23.829
4.147	22.534
4.147	23.397
5.048	19.770
5.048	20.547
5.048	21.843
5.108	20.806
5.108	21.152
5.108	22.447
5.108	24.261
5.108	26.420
5.168	24.866
5.168	25.902
5.228	23.311
6.010	22.102
6.070	27.284
6.130	22.965
6.130	23.397
6.130	26.507
6.190	23.743
6.250	24.261
6.250	24.952
6.370	25.729
7.031	23.743
7.091	25.470
7.091	26.161
7.091	27.889
7.151	23.138
7.151	24.434
7.272	27.025
7.272	28.752
7.993	22.879
7.993	24.002
7.993	25.298
8.053	25.988
8.053	30.048
8.113	26.507
8.173	24.779
8.233	27.198
8.233	29.012
8.413	28.493
8.834	24.693
8.954	25.557
8.954	25.988
8.954	26.766
8.954	30.134
8.954	30.566
9.014	27.284
9.014	29.184
9.255	28.148
9.916	28.407
10.036	30.912
10.096	29.271
10.156	25.384
10.216	24.866
10.276	27.457
10.276	30.480
10.877	29.530
10.938	26.161
10.938	26.593
11.058	27.370
11.058	27.630
11.178	28.234
11.298	28.925
11.839	25.211
11.899	25.902
11.959	26.852
11.959	27.543
11.959	28.234
12.019	24.261
12.019	30.307
12.079	28.752
12.260	29.357
12.921	25.902
13.041	30.048
13.101	27.370
13.101	30.998
13.101	31.516
13.101	32.294
13.161	26.679
13.221	28.148
13.762	33.589
14.002	24.261
14.063	27.716
14.063	28.752
14.243	30.393
14.243	31.257
14.303	29.875
14.303	32.035
14.904	32.121
14.964	26.420
15.144	27.370
15.144	33.244
15.204	28.061
15.204	28.839
15.204	30.048
15.204	30.825
15.325	31.257
15.986	26.679
16.046	28.666
16.106	29.789
16.106	31.344
16.166	30.739
16.166	31.862
16.346	32.639
16.346	33.589
16.346	34.712
16.707	33.071
16.947	27.370
17.007	26.507
17.007	32.466
17.067	33.676
17.188	28.321
17.188	28.839
17.248	29.875
17.308	30.653
17.488	31.689
17.788	34.280
17.849	27.370
17.969	30.048
17.969	36.871
18.149	28.148
18.149	31.948
18.269	35.489
18.329	31.257
18.329	33.157
18.450	33.071
19.111	30.912
19.171	28.407
19.231	29.357
19.231	32.726
19.291	27.630
19.291	33.589
19.351	31.862
19.411	34.712
19.952	27.975
19.952	28.839
20.012	26.939
20.012	29.616
20.072	30.134
20.132	30.912
20.252	31.948
20.853	35.058
20.853	35.835
20.913	32.898
20.913	33.676
21.755	29.702
21.755	34.194
21.875	32.294
21.935	31.257
21.995	33.330
22.175	28.580
23.137	32.726
23.137	27.111
23.197	31.516
23.257	30.393
23.438	33.330
23.438	34.453
23.858	28.061
23.978	28.666
23.978	31.430
24.038	26.939
24.038	31.862
24.159	29.530
24.159	30.566
25.120	29.702
25.901	34.107
26.082	33.848
26.322	26.766
28.005	36.440
28.125	31.257
28.125	30.393
30.048	35.058
34.255	32.035
39.123	32.553
43.990	30.393];
data.tL_m(:,1) = 365*(1+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(4.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LaidPear1970';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XZRS'; % Cat of Life
metaData.links.id_ITIS = '166707'; % ITIS
metaData.links.id_EoL = '46568116'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_mystinus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_mystinus'; % ADW
metaData.links.id_Taxo = '187249'; % Taxonomicon
metaData.links.id_WoRMS = '254573'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-alutus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_mystinus}}';
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
bibkey = 'LaidPear1970'; type = 'techreport'; bib = [ ... 
'author = {Thomas E. Laidig and Donald E. Pearson and Lorraine L. Sinclair}, ' ... 
'year = {1970}, ' ...
'title = {Age and growth of blue rockfish (\emph{Sebastes mystinus}) from central and northern {C}alifornia}, ' ...
'institution = {Fish Bull.}, ' ...
'volume = {101}, ' ...
'pages = {800–808}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-mystinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

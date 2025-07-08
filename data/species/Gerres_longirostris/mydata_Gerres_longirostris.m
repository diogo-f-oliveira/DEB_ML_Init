function [data, auxData, metaData, txtData, weights] = mydata_Gerres_longirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Gerres_longirostris'; 
metaData.species_en = 'Strongspine silver-biddy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 26];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'GranAbde2006';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20.6;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on SL 13.9 cm and F2';
data.Li  = 44.5;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.56e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'EspiGall2015';
  comment.Wwb = 'based guessed egg diameter of 0.31 mm of Gerres cinereus: pi/6*0.031^3'; 
data.Wwp = 109; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.05, see F1';
data.Wwi = 1142; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.05, see F1';

data.GSI = 0.05;   units.GSI = '-';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'GranAbde2006';
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [  ... % time since birth (yr), fork length (cm)
0.743	13.093
0.770	12.010
0.843	13.235
0.969	18.132
0.988	17.284
0.988	16.437
1.006	17.049
1.006	16.484
1.006	15.872
1.024	20.345
1.024	18.885
1.060	15.496
1.087	15.213
1.114	15.543
1.151	19.922
1.196	19.310
1.214	17.615
1.241	17.286
1.250	12.248
1.277	16.815
1.277	15.685
1.277	14.838
1.277	13.378
1.314	13.614
1.323	15.121
1.323	14.603
1.332	16.204
1.332	16.109
1.332	15.733
1.332	12.437
1.341	15.403
1.341	11.919
1.350	16.722
1.386	17.758
1.395	14.556
1.468	19.170
1.495	19.736
1.495	17.193
1.495	16.722
1.504	20.442
1.504	15.122
1.522	16.817
1.549	17.664
1.558	18.794
1.558	14.651
1.567	16.299
1.576	16.629
1.586	16.958
1.613	15.499
1.658	17.806
1.658	18.607
1.658	15.499
1.667	19.878
1.703	17.289
1.730	17.665
1.749	16.912
1.767	17.477
1.767	14.605
1.776	19.502
1.821	21.527
1.839	17.619
1.848	17.007
1.884	20.915
1.894	17.337
1.894	16.866
1.939	19.079
1.984	17.714
1.984	17.479
2.002	20.115
2.029	20.492
2.029	18.938
2.066	19.739
2.066	17.856
2.093	20.681
2.102	19.174
2.102	18.798
2.111	21.058
2.111	19.268
2.156	20.634
2.193	22.470
2.229	22.047
2.247	12.866
2.247	17.668
2.274	20.729
2.292	19.929
2.301	21.435
2.319	20.494
2.328	18.516
2.328	18.940
2.328	19.599
2.328	20.164
2.328	20.965
2.328	18.234
2.347	20.729
2.356	19.176
2.410	15.410
2.437	18.564
2.437	19.129
2.455	19.930
2.464	16.446
2.501	20.730
2.501	16.022
2.501	19.177
2.510	19.600
2.519	21.578
2.573	20.589
2.582	18.235
2.591	20.166
2.591	19.601
2.591	19.177
2.591	18.659
2.600	17.812
2.600	17.435
2.636	19.224
2.655	15.976
2.664	20.637
2.673	21.861
2.673	20.213
2.682	17.153
2.700	17.671
2.709	19.178
2.718	19.272
2.736	18.425
2.736	22.379
2.736	18.990
2.781	19.367
2.790	18.707
2.836	22.003
2.845	22.804
2.854	18.943
2.854	20.073
2.881	18.708
2.881	19.226
2.917	17.531
2.945	17.908
2.981	19.697
2.999	18.473
3.017	20.262
3.089	20.122
3.144	19.227
3.162	21.676
3.180	22.523
3.216	20.499
3.225	21.299
3.234	20.923
3.243	21.959
3.253	20.123
3.307	21.017
3.307	19.370
3.316	18.805
3.325	19.935
3.334	21.865
3.334	21.677
3.343	18.193
3.352	22.289
3.352	20.594
3.370	23.089
3.379	18.476
3.407	19.323
3.425	21.819
3.452	20.595
3.470	21.018
3.479	19.559
3.488	21.301
3.497	20.359
3.515	22.714
3.515	24.032
3.533	22.196
3.533	21.490
3.552	20.784
3.552	20.219
3.561	18.665
3.579	19.512
3.579	18.995
3.597	16.123
3.606	22.149
3.606	20.454
3.615	19.230
3.615	18.242
3.624	18.901
3.633	21.114
3.642	19.795
3.669	21.726
3.715	20.219
3.733	22.762
3.742	24.410
3.751	21.067
3.760	22.527
3.778	23.139
3.869	22.009
3.986	19.562
4.005	17.632
4.077	18.903
4.140	21.964
4.267	23.142
4.322	24.884
4.331	23.707
4.340	18.152
4.394	21.448
4.403	21.918
4.412	22.342
4.421	20.930
4.421	20.035
4.494	20.459
4.503	22.625
4.503	22.343
4.503	21.213
4.557	21.401
4.575	23.191
4.575	22.861
4.575	20.648
4.612	21.826
4.648	22.438
4.657	22.061
4.702	18.530
4.738	23.710
4.738	24.604
4.738	20.979
4.747	21.308
4.956	23.240
4.965	21.781
5.046	23.052
5.083	20.793
5.119	23.571
5.237	24.466
5.418	19.335
5.427	21.736
5.427	21.312
5.490	21.925
5.499	21.360
5.508	22.772
5.518	19.147
5.735	25.034
5.735	23.810
5.753	22.303
5.762	23.245
6.052	22.399
6.152	26.213
6.179	25.272
6.206	24.001
6.414	21.836
6.442	21.460
7.438	20.712];
data.tL_f(:,1) = 365 * (0.3 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length' , 'females'};  
temp.tL_f = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAbde2006'; 
%
data.tL_m = [  ... % time since birth (yr), fork length (cm)
0.063	1.695
0.190	6.451
0.924	14.224
0.951	13.471
0.988	15.025
0.988	13.424
0.988	14.318
1.015	15.590
1.024	18.650
1.060	16.861
1.096	14.413
1.160	16.438
1.178	18.557
1.205	17.050
1.214	15.073
1.232	13.708
1.241	13.237
1.250	14.649
1.268	16.109
1.277	17.804
1.287	16.439
1.287	14.085
1.332	12.908
1.413	15.498
1.450	16.487
1.459	15.922
1.513	16.440
1.531	15.451
1.567	15.922
1.658	17.006
1.712	18.466
1.758	15.312
1.767	14.841
1.767	12.816
1.776	15.924
1.776	13.711
1.785	18.466
1.803	17.713
1.812	18.843
1.839	17.337
1.839	16.489
1.848	16.112
1.866	18.090
1.875	18.325
1.903	18.843
1.921	14.230
1.930	19.832
1.930	16.960
1.930	16.490
1.939	19.267
1.939	14.606
1.939	15.595
1.948	20.539
1.948	15.124
1.957	14.795
1.957	16.019
1.966	18.373
1.984	19.739
1.984	18.044
2.075	15.219
2.093	16.773
2.093	16.208
2.102	15.596
2.111	14.702
2.174	19.881
2.183	19.081
2.183	19.457
2.183	20.116
2.202	17.150
2.202	18.704
2.211	17.433
2.220	16.397
2.229	18.045
2.229	19.410
2.274	15.550
2.274	17.245
2.283	16.821
2.292	16.680
2.328	16.115
2.419	17.105
2.446	16.398
2.464	16.116
2.582	16.635
2.673	16.682
2.700	17.954
2.736	17.718
2.763	16.212
2.827	20.544
2.827	19.696
2.827	18.519
2.836	18.990
2.845	21.580
2.908	20.262
2.908	19.132
2.935	18.802
2.945	22.098
2.972	17.626
2.990	19.321
3.017	17.956
3.053	16.120
3.162	20.781
3.216	19.040
3.271	19.699
3.289	18.616
3.479	16.640
3.579	17.865
3.651	19.842
3.678	18.807
3.678	17.536
3.678	17.300
3.715	18.242
3.814	21.020
3.823	18.431
3.950	17.255
4.023	18.526
4.168	19.422
4.358	21.730
4.675	19.095
4.693	17.824
4.829	21.968
5.074	17.261
5.191	19.334
5.835	22.492
5.844	23.810
6.333	22.354
7.148	20.899];
data.tL_m(:,1) = 365 * (0.3 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAbde2006'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01072*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FX37'; % Cat of Life
metaData.links.id_ITIS = '645476'; % ITIS
metaData.links.id_EoL = '46580912'; % Ency of Life
metaData.links.id_Wiki = 'Gerres_longirostris'; % Wikipedia
metaData.links.id_ADW = 'Gerres_longirostris'; % ADW
metaData.links.id_Taxo = '174889'; % Taxonomicon
metaData.links.id_WoRMS = '218532'; % WoRMS
metaData.links.id_fishbase = 'Gerres-longirostris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerres_longirostris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GranAbde2006'; type = '169041Article'; bib = [ ... 
'doi = {10.1016/j.icesjms.2005.11.006}, ' ...
'author = {E. M. Grandcourt and T. Z. Al Abdessalaam and F. Francis and A. T. Al Shamsi}, ' ... 
'year = {2006}, ' ...
'title = {Fisheries biology of a short-lived tropical species: \emph{Gerres longirostris} ({L}ac\''{e}p\`{e}de, 1801) in the {A}rabian {G}ulf}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {63}, ' ...
'pages = {452-459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EspiGall2015'; type = 'Article'; bib = [ ... 
'author = {Elaine Espino-Barr and Manuel Gallardo-Cabello and Esther G. Cabral-Sol\''{i}s and Marcos Puente-G\''{o}mez and A. Garcia-Boa}, ' ... 
'year = {2015}, ' ...
'title = {Reproduction of \emph{Gerres cinereus} ({P}ercoidei: {G}erreidae) off the {M}exican {P}acific coast}, ' ...
'journal = {Revista Ciencias Marinas y Costeras}, ' ...
'volume = {7}, ' ...
'pages = {83-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gerres-longirostris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


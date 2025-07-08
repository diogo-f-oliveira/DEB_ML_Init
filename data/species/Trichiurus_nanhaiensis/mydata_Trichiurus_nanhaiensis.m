function [data, auxData, metaData, txtData, weights] = mydata_Trichiurus_nanhaiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Trichiuridae';
metaData.species    = 'Trichiurus_nanhaiensis'; 
metaData.species_en = 'Hairtail'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 05];

%% set data
% zero-variate data

data.ab = 79/24;   units.ab = 'd';   label.ab = 'age at birth';               bibkey.ab = 'scxuebao';   
  temp.ab = C2K(21.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'except for ab, all temps are guessed';
  
data.Lp  = 28.2;   units.Lp  = 'cm';  label.Lp  = 'preanal length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 60;     units.Li  = 'cm';  label.Li  = 'ultimate preanal length';    bibkey.Li  = 'fishbase';
 comment.Li = 'Wiki gives 234 cm for max total length';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1 mm: 4/3*pi*.05^3';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.GSI  = 0.02; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'KwokNi1999';   
  temp.GSI = C2K(12); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% t-L data
data.tL = [ ... % time since birth (yr), preanal length (cm)
0.104	17.474
0.120	18.819
0.128	19.828
0.135	22.851
0.145	21.621
0.240	23.982
0.240	23.199
0.241	22.079
0.327	23.656
0.337	22.762
0.364	21.533
0.563	25.473
0.564	23.906
0.580	26.147
0.602	32.418
0.603	31.075
0.673	31.866
0.682	30.972
0.685	25.151
0.686	24.032
0.694	25.936
0.701	27.840
0.709	30.079
0.718	29.185
0.719	26.834
0.752	30.532
0.778	31.542
0.780	27.065
0.786	32.551
0.789	27.961
0.813	30.875
0.823	28.973
0.858	29.648
0.875	29.986
0.929	28.201
1.068	29.672
1.069	28.217
1.076	30.680
1.154	32.480
1.154	31.584
1.154	30.913
1.172	30.019
1.224	31.592
1.243	29.132
1.313	29.140
1.381	32.393
1.392	28.589
1.399	31.500
1.400	30.493
1.410	27.919
1.418	29.263
1.419	27.360
1.426	30.048
1.495	32.854
1.498	26.586
1.505	29.161
1.513	32.072
1.514	29.946
1.532	28.716
1.543	25.247
1.556	33.197
1.557	31.070
1.566	29.616
1.582	32.752
1.583	32.080
1.592	31.521
1.606	36.448
1.607	35.441
1.608	33.762
1.613	39.136
1.629	27.384
1.631	24.250
1.637	28.728
1.684	37.800
1.697	30.974
1.701	39.034
1.705	31.758
1.722	32.432
1.746	36.576
1.752	40.942
1.763	38.033
1.792	33.447
1.819	31.883
1.854	31.999
1.854	30.879
1.862	33.790
1.870	35.135
1.871	33.120
1.886	36.928
1.940	35.142
1.940	34.359
1.941	32.680
1.951	30.778
1.959	31.563
1.963	40.294
1.963	39.399
1.965	36.265
2.078	37.285
2.079	36.501
2.080	34.598
2.081	33.255
2.081	32.696
2.081	31.800
2.091	30.682
2.091	30.010
2.146	41.322
2.147	39.643
2.148	37.964
2.149	36.733
2.236	37.526
2.288	37.420
2.289	36.301
2.314	37.983
2.316	35.185
2.323	37.200
2.326	33.395
2.393	38.439
2.420	36.204
2.429	36.541
2.455	37.215
2.462	39.231
2.464	35.985
2.465	35.089
2.475	31.844
2.524	38.006
2.525	37.223
2.526	34.537
2.532	38.791
2.535	33.978
2.538	29.165
2.549	39.912
2.569	36.780
2.588	34.096
2.595	37.231
2.603	38.239
2.639	36.788
2.665	36.119
2.666	35.448
2.673	37.351
2.692	35.674
2.692	34.443
2.698	39.929
2.708	36.908
2.709	35.788
2.724	40.603
2.725	39.372
2.745	35.121
2.793	41.507
2.794	41.059
2.800	44.530
2.823	35.241
2.824	33.339
2.849	36.252
2.865	38.157
2.872	41.516
2.873	39.053
2.878	46.665
2.882	39.949
2.883	37.039
2.885	34.801
2.893	36.145
2.944	38.277
2.945	37.046
2.950	42.756
2.951	41.972
2.951	41.524
2.951	41.077
2.951	40.517
2.954	35.592
2.958	43.540
3.032	37.056
3.059	36.499
3.059	35.939
3.059	35.268
3.075	38.180
3.144	40.874
3.144	40.091
3.145	39.307
3.145	38.524
3.145	38.188
3.145	37.852
3.151	42.554
3.155	36.398
3.221	43.346
3.222	42.338
3.222	40.995
3.223	40.547
3.223	39.988
3.223	39.764
3.223	39.316
3.223	39.092
3.229	44.242
3.232	38.869
3.233	38.533
3.233	38.198
3.233	37.974
3.235	34.952
3.242	37.191
3.242	36.632
3.242	36.632
3.243	35.848
3.301	40.780
3.302	39.549
3.303	37.646
3.307	45.146
3.308	43.467
3.309	42.908
3.384	49.632
3.384	48.961
3.386	44.931
3.387	44.484
3.396	43.813
3.396	42.917
3.399	38.440
3.399	37.545
3.400	36.873
3.458	42.700
3.459	41.133
3.459	40.238
3.460	38.895
3.469	37.441
3.474	44.941
3.474	44.158
3.492	43.376
3.494	40.690
3.503	39.124
3.511	41.251
3.511	40.692
3.531	37.336
3.555	40.361
3.562	43.160
3.605	45.068
3.608	40.031
3.615	42.830
3.615	42.158
3.685	42.054
3.687	40.263
3.701	45.190
3.702	43.959
3.717	47.543
3.718	46.983
3.730	40.940
3.730	40.828
3.755	42.958
3.771	45.198
3.790	42.514
3.792	39.044
3.817	40.950
3.858	46.663
3.860	42.074
3.865	49.798
3.868	44.090
3.868	43.530
3.870	40.956
3.871	39.836
3.877	43.083
3.929	45.328
3.948	41.748
3.948	41.524
3.949	40.964
3.949	40.293
4.166	42.892
4.218	43.905
4.220	40.435
4.222	37.749
4.226	45.025
4.290	41.338
4.296	46.152
4.311	49.960
4.314	45.035
4.365	47.056
4.365	46.384
4.374	47.281
4.401	45.045
4.402	44.373
4.456	41.357
4.464	42.142
4.480	44.382
4.527	39.910
4.542	44.501
4.542	43.717
4.561	41.033
4.693	55.152
4.696	50.339
4.699	44.742
4.704	50.676
4.707	46.199
4.784	48.894
4.864	46.888
4.941	49.023
4.948	52.606
5.295	42.906
5.309	48.169
5.449	49.528
5.468	46.284
6.367	50.526
6.448	46.729
6.715	53.252];
data.tL(:,1) = 365 * (1 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'preanal length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KwokNi2000';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'depth range 0 to 589 m, most records 100 to 350 m';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length-weight: gutted weight (g) = 5.672e-5 (prenal length im mm)^2.755';
metaData.bibkey.F2 = 'KwokNi2000';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '589G4'; % Cat of Life
metaData.links.id_ITIS = '646753'; % ITIS
metaData.links.id_EoL = '46577384'; % Ency of Life
metaData.links.id_Wiki = 'Trichiurus'; % Wikipedia
metaData.links.id_ADW = 'Trichiurus_nanhaiensis'; % ADW
metaData.links.id_Taxo = '189326'; % Taxonomicon
metaData.links.id_WoRMS = '274024'; % WoRMS
metaData.links.id_fishbase = 'Trichiurus-nanhaiensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trichiurus_nanhaiensis}}';
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
bibkey = 'KwokNi2000'; type = 'Article'; bib = [ ... 
'author = {K. Y. Kwok and I-H. Ni}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of cutlassfishes, \emph{Trichiurus spp.}, from the {S}outh {C}hina {S}ea}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {98}, ' ...
'pages = {748--758}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KwokNi1999'; type = 'Article'; bib = [ ... 
'author = {K. Y. Kwok and I-H. Ni}, ' ... 
'year = {1999}, ' ...
'title = {Reproduction of cutlassfishes \emph{Trichiurus spp.} from the {S}outh {C}hina {S}ea}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {176}, ' ...
'pages = {39--47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trichiurus-nanhaiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'scxuebao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.scxuebao.cn/scxuebao/ch/reader/create_pdf.aspx?file_no=20030215&year_id=2003&quarter_id=2&falg=1}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
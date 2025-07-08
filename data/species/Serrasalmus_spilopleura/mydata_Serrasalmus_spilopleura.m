  function [data, auxData, metaData, txtData, weights] = mydata_Serrasalmus_spilopleura
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Serrasalmidae';
metaData.species    = 'Serrasalmus_spilopleura'; 
metaData.species_en = 'Speckled piranha'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2022 07 13];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2022 07 13]; 

%% set data
% zero-variate data
data.ab = 9.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Pygocentrus_nattereri';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'SousSoar2013';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.8;    units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'LamaGodi1996';
data.Li = 25;    units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.6 mm of Pygocentrus_nattereri: pi/6*.16^3';
  
data.GSI = 0.55; units.GSI = '-'; label.GSI = 'Gonado Somatic Index'; bibkey.GSI = 'LamaGodi1996';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
391.589	7.223
452.826	7.110
573.687	9.141
573.687	10.100
576.910	6.997
718.720	11.003
721.943	11.906
723.554	9.987
723.554	10.326
726.777	12.809
730.000	8.803
997.506	13.147
997.506	13.147
997.506	13.204
997.506	13.712
997.506	14.219
1002.340	12.752
1005.563	10.665
1005.563	11.398
1005.563	12.188

365+170.817	9.987
365+174.040	8.972
365+177.263	10.382
365+177.263	11.003
365+177.263	11.172
365+178.874	12.865
365+219.161	10.100
365+225.607	9.592
365+227.219	8.972
365+227.219	9.254
365+227.219	8.238
365+227.219	11.850
365+227.219	14.953
365+228.830	7.956
365+228.830	10.157
365+228.830	10.947
365+228.830	11.172
365+228.830	11.172
365+230.441	13.937
365+232.053	14.219
365+233.664	12.414
365+233.664	13.091
365+259.448	8.859
365+259.448	9.705
365+259.448	10.665
365+261.060	12.075
365+261.060	12.075
365+261.060	12.809
365+261.060	13.091
365+262.671	8.069
365+264.283	11.229
365+265.894	14.050
365+293.289	11.003
365+293.289	14.050
365+294.901	8.803
365+294.901	9.592
365+294.901	10.044
365+294.901	10.213
365+294.901	10.270
365+294.901	10.608
365+294.901	13.204
365+298.124	12.809
365+365.806	12.809
365+422.208	13.655
365+443.157	14.163
365+446.380	13.542
365+447.991	14.840
365+452.826	12.132
365+452.826	13.034
365+512.450	14.840];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SousSoar2013';
comment.tL = 'Data from length-frequency counts in Jaiteua and Sao Lourenço lakes in the Lago Grande lacustrine complex, Manacapuru, Amazonas State';

% length - weight
data.LWw = [ ... % std length (cm), wet weight (g)
7.009	13.582
7.009	10.957
7.010	7.806
7.010	6.231
7.051	21.981
7.358	15.670
7.512	14.615
7.532	24.065
7.532	19.864
7.969	24.050
8.013	21.423
8.014	17.747
8.033	31.923
8.037	13.546
8.056	28.247
8.275	24.564
8.493	29.282
8.493	26.131
8.494	21.931
8.495	16.155
8.626	17.726
8.668	26.125
9.014	45.015
9.018	26.113
9.019	20.862
9.020	17.712
9.020	14.562
9.060	35.563
9.061	29.787
9.258	29.255
9.259	24.004
9.259	21.904
9.477	26.097
9.520	29.246
9.541	34.496
9.542	32.395
9.544	21.894
9.562	41.321
9.696	25.564
9.715	41.315
9.760	33.438
9.805	27.661
9.892	31.858
9.955	43.932
9.974	57.583
9.975	52.333
9.976	47.082
9.981	24.504
10.000	36.055
10.067	30.277
10.087	38.677
10.156	23.973
10.176	32.373
10.218	42.348
10.264	27.120
10.325	53.896
10.329	33.943
10.369	51.269
10.477	57.566
10.478	51.265
10.497	67.016
10.498	61.765
10.501	44.963
10.502	39.713
10.503	37.612
10.504	32.362
10.504	30.787
10.675	49.158
10.787	36.552
10.807	47.053
10.831	34.451
11.001	60.173
11.021	69.623
11.024	57.021
11.024	53.346
11.025	50.721
11.026	47.045
11.026	43.895
11.027	40.744
11.044	63.846
11.050	36.018
11.329	60.161
11.440	53.331
11.479	73.807
11.485	46.504
11.486	43.354
11.503	64.355
11.510	32.327
11.524	69.605
11.526	59.629
11.549	53.328
11.550	50.177
11.567	73.804
11.569	64.353
11.679	60.149
11.982	77.990
12.009	51.736
12.024	82.189
12.026	73.788
12.027	70.113
12.053	49.635
12.071	65.911
12.072	62.235
12.073	57.510
12.073	55.935
12.228	49.103
12.421	65.898
12.481	94.775
12.504	91.098
12.504	87.423
12.507	75.347
12.508	69.046
12.527	84.272
12.527	82.172
12.534	49.093
12.555	55.393
12.682	72.190
12.943	79.007
12.963	91.607
12.963	88.457
12.964	85.307
12.965	81.106
12.984	96.332
12.988	75.855
13.003	110.508
13.003	108.408
13.004	106.308
13.005	99.482
13.011	67.978
13.035	57.476
13.036	53.276
13.038	45.925
13.116	92.127
13.354	105.770
13.375	108.920
13.510	86.863
13.516	60.610
13.528	109.965
13.533	82.661
13.547	120.465
13.551	105.238
13.552	99.463
13.560	57.458
13.641	90.534
13.641	88.958
13.704	101.558
13.833	116.255
13.981	139.352
13.985	119.400
13.989	99.447
13.990	95.247
13.990	92.097
13.991	89.996
13.991	88.421
13.992	85.796
13.992	84.746
13.993	78.970
13.995	67.944
14.006	123.600
14.008	115.199
14.031	109.422
14.032	105.222
14.032	102.071
14.228	106.265
14.252	98.388
14.337	110.462
14.473	82.629
14.474	77.903
14.490	110.456
14.490	108.356
14.491	104.680
14.493	95.229
14.510	116.231
14.511	113.606
14.514	98.904
14.530	126.732
14.531	122.006
14.705	126.725
14.923	130.918
14.997	88.911
15.014	112.538
15.015	107.287
15.018	94.686
15.029	147.717
15.033	128.289
15.034	123.564
15.035	117.788
15.445	143.501
15.471	124.598
15.513	130.898
15.986	171.836
15.999	109.353
16.012	153.458
16.994	162.349
17.000	133.471];
units.LWw   = {'cm', 'g'};  label.LWw = {'std length', 'wet weight'};  
bibkey.LWw = 'SousSoar2013';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 200 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Preferred temp: 23-28 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.01622*(TL in cm)^3.18';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4WXCB'; % Cat of Life
metaData.links.id_ITIS = '163272'; % ITIS
metaData.links.id_EoL = '217367'; % Ency of Life
metaData.links.id_Wiki = 'Serrasalmus'; % Wikipedia
metaData.links.id_ADW = 'Serrasalmus_spilopleura'; % ADW
metaData.links.id_Taxo = '43253'; % Taxonomicon
metaData.links.id_WoRMS = '1021219'; % WoRMS
metaData.links.id_fishbase = 'Serrasalmus-spilopleura'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Serrasalmus}}';  
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
bibkey = 'LamaGodi1996'; type = 'Article'; bib = [ ...  
'author = {Lamas, I. R. and Godinho, A. L.}, ' ...
'year  = {1996}, ' ...
'title = {Production in the piranha \emph{Serrasalmus spilopleura}, a neotropical fish with an unusual pattern of sexual maturity}, ' ...  
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {45}, ' ...
'pages = {161–168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SousSoar2013'; type = 'Article'; bib = [ ... 
'doi = {10.4025/actascibiolsci.v35i3.15749}, ' ...
'author = {Fabrício Barros de Sousa and Maria Gercilia Mota Soares and Luiza Prestes}, ' ...
'year  = {2013}, ' ...
'title = {Population dynamics of the yellow piranha \emph{Serrasalmus spilopleura} {K}ner, 1858 ({C}haracidae, {S}errasalminae) in {A}mazonian floodplain lakes}, ' ...  
'journal = {Acta Scientiarum}, ' ...
'volume = {35(3)}, ' ...
'pages = {367-372}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Serrasalmus-spilopleura.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


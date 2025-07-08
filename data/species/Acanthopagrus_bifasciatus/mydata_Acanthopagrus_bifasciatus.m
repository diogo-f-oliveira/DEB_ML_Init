function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_bifasciatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_bifasciatus'; 
metaData.species_en = 'Twobar seabream'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 03];

%% set data
% zero-variate data

data.am = 22*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'GranAbde2004';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26.4;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 36.2;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 314; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01549*Lp^3.03, see F1';
data.Wwi = 818; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.03, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(27.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Sparus aurata';

 % univariate data
 % time-length
 data.tL = [ ... % time since birth (yr), fork length (cm)
0.533	18.615
0.668	15.051
0.670	17.626
0.738	16.636
0.741	19.210
0.776	19.738
0.841	16.042
0.912	18.088
0.944	15.118
0.983	20.399
1.014	16.042
1.015	17.164
1.086	19.475
1.117	16.241
1.122	21.257
1.156	20.663
1.187	17.297
1.192	22.379
1.223	18.485
1.259	20.861
1.289	15.779
1.293	20.201
1.326	18.023
1.326	18.683
1.327	19.145
1.359	16.571
1.365	22.842
1.393	16.373
1.394	16.967
1.465	19.410
1.498	17.628
1.570	20.730
1.638	20.400
1.671	18.882
1.809	17.959
1.845	20.599
1.877	17.497
1.882	23.107
1.913	19.477
1.946	17.893
1.947	18.553
1.948	19.873
1.949	21.391
1.980	16.573
2.083	16.771
2.119	18.223
2.224	19.280
2.227	22.976
2.325	16.574
2.329	21.920
2.362	19.874
2.433	22.317
2.641	23.901
2.674	22.251
2.813	23.506
2.850	25.552
2.850	25.750
2.886	27.862
2.917	23.704
2.946	17.764
2.950	21.988
2.951	22.780
2.952	24.100
2.956	28.589
3.018	20.668
3.088	21.922
3.122	21.592
3.125	25.553
3.262	23.507
3.262	24.101
3.263	24.893
3.293	20.339
3.300	27.467
3.431	19.679
3.432	21.593
3.435	24.498
3.436	25.224
3.468	22.781
3.535	20.471
3.536	21.197
3.572	23.178
3.572	23.706
3.575	27.006
3.640	22.188
3.641	23.244
3.642	24.498
3.644	26.940
3.678	26.016
3.746	25.488
3.746	25.686
3.814	24.168
3.818	28.657
3.920	27.337
3.990	28.855
4.093	27.668
4.096	31.100
4.097	32.156
4.128	28.460
4.199	31.034
4.200	31.628
4.228	25.028
4.229	25.490
4.260	21.133
4.297	24.104
4.301	28.988
4.330	22.388
4.330	22.520
4.365	23.972
4.368	26.414
4.368	27.338
4.401	24.698
4.438	27.536
4.537	23.312
4.570	20.672
4.572	23.708
4.676	24.105
4.679	28.065
4.680	28.989
4.747	26.283
4.752	31.960
4.780	24.963
4.818	28.660
4.850	25.425
4.851	26.745
4.853	29.320
4.956	28.924
4.993	32.158
4.994	32.620
5.021	24.832
5.024	27.406
5.057	26.548
5.060	29.848
5.130	30.443
5.196	27.472
5.226	22.192
5.228	24.634
5.263	25.030
5.268	30.311
5.336	29.717
5.337	31.367
5.338	32.159
5.434	23.579
5.504	24.305
5.504	25.097
5.510	31.038
5.541	27.011
5.572	23.117
5.577	29.388
5.609	26.153
5.644	26.550
5.648	31.368
5.751	30.708
5.886	27.804
5.921	28.530
5.924	31.897
5.959	32.293
5.994	32.821
6.022	24.966
6.094	29.191
6.127	27.541
6.229	25.825
6.232	29.455
6.298	25.165
6.301	28.597
6.303	31.304
6.331	24.109
6.364	22.525
6.365	23.515
6.407	32.360
6.504	24.374
6.505	25.760
6.506	26.684
6.542	29.192
6.543	29.786
6.580	32.559
6.615	33.813
6.640	22.592
6.679	27.608
6.680	28.466
6.684	32.955
6.716	30.777
6.820	31.041
6.855	32.163
6.886	28.335
6.922	29.523
7.060	29.590
7.129	29.062
7.132	32.560
7.132	33.154
7.195	26.356
7.235	32.362
7.296	23.914
7.470	25.036
7.571	22.726
7.577	28.997
7.578	29.987
8.167	33.421
8.269	32.365
8.338	31.573
8.374	33.619
8.511	32.696
8.751	30.650
8.790	36.657
8.889	31.707
8.923	30.189
8.993	31.509
9.099	34.611
9.233	30.453
9.265	27.813
9.267	29.331
9.373	32.434
9.401	25.371
9.439	29.662
9.506	27.088
9.960	33.426
10.061	31.116
10.265	27.090
10.266	28.938
10.303	31.842
10.307	35.869
10.408	33.229
10.646	28.873
10.921	27.818
10.924	31.382
11.231	28.214
11.268	30.591
11.268	31.251
11.511	32.308
11.547	33.958
11.790	36.203
11.857	33.893
11.959	32.309
12.028	33.035
12.029	33.365
12.269	32.508
12.408	32.904
12.544	30.660
13.166	32.312
13.268	30.596
13.270	32.906
13.303	31.586
13.373	32.709
13.439	29.342
13.510	31.059
13.617	35.283
13.892	35.218
13.924	32.182
14.060	29.806
14.301	29.675
14.652	36.738
14.960	33.241
15.197	28.687
15.338	32.120
15.473	28.292
15.821	32.715
16.307	36.611
17.614	31.862
21.306	34.512];    
data.tL(:,1) = 365 * (data.tL(:,1) + 0.75);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL   = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GranAbde2004';

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
F1 = 'length-weight: Ww in g = 0.01549*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8YVQ'; % Cat of Life
metaData.links.id_ITIS = '647897'; % ITIS
metaData.links.id_EoL = '1156465'; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus_schlegelii'; % Wikipedia
metaData.links.id_ADW = 'Acanthopagrus_schlegelii'; % ADW
metaData.links.id_Taxo = '654657'; % Taxonomicon
metaData.links.id_WoRMS = '293534'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-schlegelii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_schlegelii}}';
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
bibkey = 'GranAbde2004'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2004.04.006}, ' ...
'author = {E.M. Grandcourt and T.Z. Al Abdessalaam and F. Francis and A.T. Al Shamsi}, ' ... 
'year = {2004}, ' ...
'title = {Biology and stock assessment of the Sparids, \emph{Acanthopagrus bifasciatus} and \emph{Argyrops spinifer} ({F}orsskal, 1775), in the {S}outhern {A}rabian {G}ulf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {69}, ' ...
'pages = {7–20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthopagrus-schlegelii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

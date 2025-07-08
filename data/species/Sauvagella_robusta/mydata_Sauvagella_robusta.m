function [data, auxData, metaData, txtData, weights] = mydata_Sauvagella_robusta

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Ehiravidae';
metaData.species    = 'Sauvagella_robusta'; 
metaData.species_en = 'Amboaboa round herring'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'L-Ww'; 'L-N'; 'W-N'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 20];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.9; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Rama2015';
data.Li = 7;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'Rama2015';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'Rama2015';
  comment.Wwb = 'egg diameter 0.24, but based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 2.5; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Rama2015';
  comment.Wwi = 'fishbase: based on 0.00468*Li^3.03, see F1, gives 1.7 g';
    
% uni-variate data
% length-weight
data.LW = [ ... % ln total length (mm), ln weight (g)
3.142	-2.808
3.152	-2.689
3.168	-2.819
3.180	-2.668
3.183	-2.809
3.218	-2.635
3.238	-2.538
3.246	-2.592
3.247	-2.332
3.259	-2.408
3.267	-2.538
3.271	-2.202
3.279	-2.300
3.289	-2.202
3.298	-2.810
3.298	-2.669
3.300	-2.202
3.307	-2.387
3.317	-2.116
3.318	-2.387
3.325	-2.365
3.330	-2.560
3.333	-2.203
3.335	-2.387
3.335	-2.311
3.341	-2.669
3.353	-2.788
3.359	-2.333
3.364	-2.203
3.369	-2.149
3.374	-2.398
3.384	-2.030
3.389	-2.398
3.391	-2.192
3.391	-2.062
3.391	-1.964
3.394	-2.507
3.394	-1.769
3.399	-2.127
3.399	-1.986
3.401	-2.127
3.401	-1.932
3.412	-1.856
3.422	-2.203
3.429	-2.312
3.429	-1.997
3.433	-2.312
3.434	-1.921
3.440	-1.683
3.442	-2.030
3.447	-2.052
3.447	-1.932
3.452	-2.030
3.455	-1.867
3.460	-2.204
3.462	-1.651
3.463	-2.095
3.466	-2.312
3.467	-1.998
3.467	-1.553
3.468	-1.607
3.470	-2.106
3.475	-1.900
3.475	-1.878
3.475	-1.759
3.477	-1.553
3.481	-1.781
3.483	-2.399
3.485	-1.651
3.488	-1.705
3.488	-1.607
3.488	-1.607
3.491	-1.955
3.503	-1.488
3.506	-1.792
3.516	-2.313
3.518	-1.727
3.524	-1.608
3.526	-1.684
3.527	-1.933
3.532	-1.846
3.532	-1.662
3.536	-1.521
3.539	-1.771
3.541	-1.239
3.544	-1.673
3.547	-2.042
3.547	-1.554
3.549	-1.467
3.551	-1.348
3.556	-1.413
3.557	-1.836
3.557	-1.662
3.565	-1.717
3.570	-1.359
3.572	-1.261
3.575	-1.966
3.577	-1.370
3.580	-1.532
3.588	-1.923
3.588	-1.630
3.588	-1.522
3.592	-1.250
3.593	-1.890
3.597	-1.478
3.598	-1.337
3.598	-1.337
3.600	-2.324
3.602	-1.663
3.603	-1.348
3.603	-1.348
3.613	-1.489
3.615	-1.370
3.618	-1.240
3.620	-1.760
3.622	-1.110
3.625	-1.717
3.625	-1.609
3.626	-1.934
3.628	-1.294
3.631	-1.240
3.633	-1.099
3.635	-1.186
3.636	-1.565
3.638	-1.858
3.638	-1.197
3.639	-1.631
3.641	-1.706
3.641	-1.435
3.643	-1.294
3.645	-1.273
3.645	-1.273
3.646	-1.544
3.649	-1.251
3.651	-1.641
3.653	-1.598
3.653	-1.110
3.654	-1.153
3.658	-1.815
3.658	-1.273
3.659	-1.002
3.661	-1.360
3.666	-1.316
3.668	-0.947
3.668	-3.496
3.673	-1.208
3.674	-1.457
3.674	-1.056
3.677	-1.295
3.678	-0.850
3.682	-1.642
3.682	-1.425
3.682	-1.403
3.687	-1.024
3.689	-1.241
3.689	-1.241
3.691	-1.143
3.692	-1.425
3.694	-1.165
3.695	-1.501
3.697	-1.186
3.697	-1.110
3.702	-1.154
3.707	-1.024
3.707	-0.970
3.712	-1.045
3.712	-1.045
3.712	-0.861
3.715	-1.241
3.715	-1.121
3.724	-1.089
3.725	-0.915
3.725	-0.915
3.725	-0.840
3.729	-0.796
3.730	-1.393
3.730	-0.970
3.732	-1.360
3.737	-0.916
3.740	-1.653
3.740	-0.851
3.742	-1.078
3.742	-0.796
3.742	-0.677
3.745	-1.057
3.747	-0.948
3.752	-0.764
3.753	-0.937
3.758	-0.710
3.768	-1.035
3.768	-0.840
3.771	-0.764
3.781	-0.959
3.785	-0.742
3.786	-0.656
3.790	-0.623
3.793	-0.699
3.798	-0.580
3.799	-0.916
3.799	-0.667
3.801	-0.851
3.808	-0.439
3.811	-1.339
3.811	-1.220
3.821	-0.819
3.821	-0.548
3.822	-0.862
3.823	-0.450
3.827	-0.526
3.831	-0.667
3.834	-1.372
3.836	-1.144
3.836	-0.418
3.837	-0.613
3.839	-0.667
3.842	-1.177
3.842	-0.569
3.847	-0.678
3.847	-0.331
3.849	-1.318
3.852	-0.526
3.852	-0.363
3.854	-0.895
3.865	-0.732
3.865	-0.515
3.867	-0.949
3.869	-0.472
3.872	-0.646
3.873	-0.928
3.875	-0.700
3.879	-0.472
3.880	-0.082
3.882	-0.385
3.883	-1.698
3.888	-0.884
3.892	-0.288
3.893	-2.381
3.893	-0.581
3.897	-0.375
3.902	-0.321
3.903	-0.288
3.905	-0.451
3.911	-0.505
3.913	-0.472
3.913	-0.364
3.913	-0.093
3.915	-0.256
3.920	-0.896
3.921	-0.006
3.925	-0.191
3.929	-0.668
3.930	-0.277
3.931	-0.538
3.944	-0.852
3.958	-0.234
3.961	-0.126
3.969	-0.137
3.986	-0.202
3.986	-0.104
3.986	0.047
3.991	0.677
3.996	0.167
4.002	-0.029
4.004	0.134
4.006	0.405
4.009	0.351
4.025	0.123
4.028	-0.322
4.029	0.221
4.040	-0.192
4.047	0.123
4.058	-0.658
4.061	0.068
4.065	0.437
4.066	0.350
4.070	0.231
4.071	0.068
4.071	0.199
4.073	0.285
4.080	0.339
4.080	0.415
4.091	0.133
4.096	0.491
4.101	0.741
4.103	0.404
4.108	0.437
4.119	0.545
4.121	0.589
4.132	0.079
4.132	0.751
4.137	0.664
4.141	0.534
4.147	0.632
4.147	0.697
4.150	0.393
4.154	0.545
4.157	0.827
4.167	0.436
4.172	0.740
4.178	0.664
4.183	0.512
4.183	0.686
4.192	0.761
4.197	0.816
4.203	0.761
4.207	0.794
4.221	0.772
4.241	0.848
4.244	0.739];
data.LW = exp(data.LW); % remove log transform
data.LW(:,1) = data.LW(:,1)/10; % convert mm to cm
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'}; 
bibkey.LW = 'Rama2015';
    
% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.379	1288.889
4.495	1233.333
4.558	1311.111
4.757	1305.556
4.791	1227.778
4.803	1588.889
4.816	677.778
4.828	1211.111
4.853	1377.778
4.999	1572.222
5.011	1000.000
5.107	1516.667
5.327	1455.556
5.365	1155.556
5.381	1388.889
5.456	1477.778
5.627	1638.889
5.798	1494.444
5.827	1577.778
5.831	1416.667
5.839	911.111
5.843	1333.333
5.989	1600.000
5.993	1961.111
6.018	1727.778
6.039	1672.222
6.039	1566.667
6.080	1933.333
6.085	1377.778
6.105	1927.778
6.143	1477.778
6.168	1944.445
6.193	1411.111
6.205	1916.667
6.205	1211.111
6.218	1700.000
6.222	2033.333
6.230	1966.667
6.243	1855.556
6.264	1666.667
6.297	1694.445
6.326	1694.445
6.330	1805.556
6.417	1605.556
6.430	1844.445
6.430	1900.000
6.434	2133.333
6.438	1327.778
6.463	1538.889
6.480	2038.889
6.492	1577.778
6.513	1783.333
6.513	1472.222
6.517	2122.222
6.517	1877.778
6.526	2283.333
6.530	1666.667
6.551	1844.445
6.555	1811.111
6.576	1638.889
6.592	2005.556
6.601	1266.667
6.609	2055.556
6.646	1333.333
6.675	2522.222
6.709	1938.889
6.775	2027.778
6.883	1916.667
6.904	2333.333
6.908	2511.111];
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'}; 
temp.LN = C2K(26.4); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Rama2015';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL = 3 * weights.tL;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00468*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'total length- standard length: SL = 0.86 * TL, based on photo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '79RHN'; % Cat of Life
metaData.links.id_ITIS = '551241'; % ITIS
metaData.links.id_EoL = '46562550'; % Ency of Life
metaData.links.id_Wiki = 'Sauvagella_robusta'; % Wikipedia
metaData.links.id_ADW = 'Sauvagella_robusta'; % ADW
metaData.links.id_Taxo = '185742'; % Taxonomicon
metaData.links.id_WoRMS = '282546'; % WoRMS
metaData.links.id_fishbase = 'Sauvagella-robusta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sauvagella_robusta}}';  
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
bibkey = 'Rama2015'; type = 'PhDthesis'; bib = [ ... 
'author = {Fanantenana Ramasindraibe}, ' ...
'year = {2015}, ' ...
'title = {Etude de la biologie de reproduction de \emph{Sauvagella robusta} {S}tiassny, 2002 dans de lac {T}seny, {R}\''{e}gion {S}ofia, {M}adagascar}, ' ... 
'school = {Univ. Antananarivo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Sauvagella-robusta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

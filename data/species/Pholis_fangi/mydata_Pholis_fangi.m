function [data, auxData, metaData, txtData, weights] = mydata_Pholis_fangi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Pholidae';
metaData.species    = 'Pholis_fangi'; 
metaData.species_en = 'Gunnel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 01 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 05];

%% set data
% zero-variate data

data.am = 1800;      units.am = 'd';    label.am = 'life span';        bibkey.am = 'HwanLee2008';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8.8;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'VallMacL2007';
  comment.Lp = 'based on same relative length, compared to Pholis gunnellus';
data.Li  = 14;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'HwanLee2008';
  
data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Sawy1967';
  comment.Wwb = 'based on egg diameter of 2 mm of Pholis gunnellus: pi/6*0.2^3';
data.Wwi = 12.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = {'fishbase','HwanLee2008'};
  comment.Wwi = 'based on 0.00430*Li^3.018, see F1';

data.GSI  = 0.015;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'VallMacL2007';   
  temp.GSI = C2K(10);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'Value for Pholis gunnellus';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
96.829	2.133
98.796	2.334
98.834	2.534
98.904	2.896
100.554	1.450
100.585	1.611
100.631	1.852
126.103	3.941
127.806	2.777
128.108	4.343
129.618	2.174
129.657	2.375
129.696	2.576
129.781	3.018
129.804	3.138
129.866	3.460
158.598	2.457
158.637	2.658
158.714	3.059
158.761	3.300
158.815	3.581
158.869	3.862
160.836	4.063
160.883	4.304
160.929	4.545
187.973	4.787
189.940	4.988
189.986	5.229
190.025	5.430
190.087	5.751
190.110	5.872
190.157	6.113
190.327	6.996
190.366	7.197
192.147	6.434
219.268	7.078
220.871	5.391
220.910	5.592
220.948	5.793
221.003	6.074
221.041	6.275
221.072	6.435
221.111	6.636
221.359	7.921
221.413	8.202
221.444	8.363
221.491	8.604
221.522	8.765
221.560	8.966
221.599	9.166
221.661	9.488
337.688	11.179
337.781	11.661
341.405	10.457
366.691	11.582
366.714	11.703
368.704	12.024
370.238	9.976
370.315	10.378
370.377	10.699
370.408	10.860
372.367	11.020
372.406	11.221
372.445	11.422
398.977	9.013
399.055	9.415
399.109	9.696
399.318	10.781
399.357	10.981
399.388	11.142
399.396	11.182
399.558	12.026
399.597	12.226
399.628	12.387
399.690	12.708
401.339	11.263
401.339	11.263
401.370	11.423
401.401	11.584
401.432	11.745
401.471	11.945
428.011	9.577
428.561	12.428
430.311	11.505
430.342	11.665
430.358	11.746
430.389	11.906
430.412	12.027
430.427	12.107
430.544	12.710
432.154	11.063
432.201	11.304
434.029	10.782
460.910	10.181
461.119	11.265
461.243	11.908
461.258	11.988
461.297	12.189
461.351	12.470
461.374	12.591
463.132	11.707
463.558	13.916
484.305	11.507
488.054	10.945
488.116	11.266
488.193	11.668
489.796	9.981
491.787	10.303
492.058	11.708
492.096	11.909
492.104	11.949
492.135	12.110
492.181	12.351
492.267	12.793
492.360	13.275
492.453	13.757
518.799	10.384
518.846	10.625
519.031	11.589
519.062	11.750
519.086	11.870
519.093	11.910
519.148	12.191
519.256	12.754
519.295	12.955
520.921	11.388
521.122	12.433
522.795	11.107
523.213	13.276
549.854	11.430
549.901	11.671
549.916	11.751
550.040	12.394
550.110	12.755
550.180	13.117
550.234	13.398
580.847	12.154
581.056	13.238
582.722	11.873
582.822	12.395
582.923	12.917
582.946	13.038
583.008	13.359
583.031	13.479
583.109	13.881
644.421	11.836
644.445	11.956
644.545	12.478
644.561	12.558
644.569	12.599
644.600	12.759
644.631	12.920
644.731	13.442
644.754	13.562
644.770	13.643
644.785	13.723
644.840	14.004
645.025	14.968
669.839	13.644
698.772	13.685
702.071	10.794
702.218	11.557
702.257	11.758
702.272	11.838
702.319	12.079
702.350	12.240
702.381	12.400
702.388	12.440
702.427	12.641
706.795	15.292
730.973	10.675
735.070	11.920
735.101	12.080
735.264	12.924
736.851	11.157
736.890	11.358
736.905	11.438
760.022	11.318
760.100	11.720
762.051	11.841
762.082	12.001
762.098	12.082
762.168	12.443
762.214	12.684
762.237	12.805
762.253	12.885
762.330	13.286
764.228	13.126
768.332	14.411
791.078	12.364
791.101	12.485
791.147	12.725
791.171	12.846
791.271	13.368
791.287	13.448
792.750	11.039
792.952	12.083
817.928	11.602
822.179	13.651
822.280	14.173
823.751	11.803
823.806	12.084
823.860	12.365
823.898	12.566
823.945	12.807
823.960	12.888
823.991	13.048
823.999	13.088
824.015	13.169
824.046	13.329
824.053	13.370
852.708	11.965
852.762	12.246
852.801	12.447
852.855	12.728
852.917	13.049
852.971	13.331
853.049	13.732
854.597	11.764
879.666	11.766
881.742	12.529
883.740	12.890
883.802	13.211
883.895	13.693
883.987	14.175
885.761	13.372
908.917	13.454
914.477	12.289
914.531	12.570
914.539	12.610
914.624	13.052
914.655	13.213
941.916	14.579
943.705	13.857
943.744	14.057
945.470	13.013
945.517	13.254
1003.399	13.418
1003.445	13.659
1003.616	14.542
1003.685	14.903
1005.304	13.297
1032.518	14.423
1034.314	13.740
1034.384	14.102
1061.195	13.139
1061.226	13.300
1061.257	13.460
1061.265	13.500
1061.296	13.661
1061.304	13.701
1061.343	13.902
1061.412	14.263
1061.451	14.464
1061.459	14.504
1061.474	14.585
1061.490	14.665
1063.015	12.577
1063.093	12.978
1063.480	14.986
1063.511	15.147
1063.565	15.428
1063.604	15.629
1063.674	15.990
1065.377	14.826
1088.053	12.417
1088.301	13.702
1119.108	13.463
1120.944	12.981
1122.779	12.499
1122.826	12.740
1124.529	11.575
1124.599	11.937
1151.774	12.862
1151.790	12.942
1151.813	13.063
1151.844	13.223
1151.859	13.304
1151.875	13.384
1151.875	13.384
1153.563	12.139
1153.610	12.380
1153.633	12.500
1153.672	12.701
1153.896	13.866
1154.005	14.428
1155.368	11.496
1180.746	13.104
1184.425	12.180
1209.687	13.186
1209.757	13.547
1240.394	12.424
1240.525	13.107
1242.632	14.030
1267.476	12.867
1269.474	13.228
1300.793	15.639
1300.870	16.041
1358.210	13.393
1422.248	15.484
1423.712	13.075
1423.820	13.637
1423.991	14.520
1448.788	13.116
1510.752	14.444
1775.224	15.941];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HwanLee2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature varies seasonally from 3 to 25 C, hatch in Nov till Feb at 5 C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight (for Pholis gunnellus): Ww in g = 0.00430*(TL in cm)^3.018';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GMHV'; % Cat of Life
metaData.links.id_ITIS = '631239'; % ITIS
metaData.links.id_EoL = '46574589'; % Ency of Life
metaData.links.id_Wiki = 'Pholis'; % Wikipedia
metaData.links.id_ADW = 'Pholis_fangi'; % ADW
metaData.links.id_Taxo = '691582'; % Taxonomicon
metaData.links.id_WoRMS = '273688'; % WoRMS
metaData.links.id_fishbase = 'Pholis-fangi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pholidae}}';
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
bibkey = 'HwanLee2008'; type = 'Article'; bib = [ ... 
'author = {Sun-Do Hwang and Tae-Won Lee and Sun-Wan Hwang}, ' ... 
'year = {2008}, ' ...
'title = {Age, growth and life history of gunnel, \emph{Pholis fangi}, in the {Y}ellow {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {93}, ' ...
'pages = {72-76}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VallMacL2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10661-006-9304-8}, ' ...
'author = {L. Vallis and D. L. MacLatchy and K. R. Munkittrick}, ' ... 
'year = {2007}, ' ...
'title = {Assessment of the potential of the rock gunnel (\emph{Pholis gunnellus}) along the {A}tlantic coast of {C}anada as a species for monitoring the reproductive impacts of contaminant exposures}, ' ...
'journal = {Environ Monit Assess}, ' ...
'volume = {128}, ' ...
'pages = {183-194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sawy1967'; type = 'Article'; bib = [ ... 
'author = {Philip J. Sawyer}, ' ... 
'year = {1967}, ' ...
'title = {Intertidal Life-History of the Rock Gunnel, \emph{Pholis gunnellus}, in the {W}estern {A}tlantic}, ' ...
'journal = {Copeia}, ' ...
'volume = {1967}, ' ...
'pages = {55-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pholis-fangi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


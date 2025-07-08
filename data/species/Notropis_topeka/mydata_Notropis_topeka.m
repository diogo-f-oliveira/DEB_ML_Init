function [data, auxData, metaData, txtData, weights] = mydata_Notropis_topeka
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_topeka'; 
metaData.species_en = 'Topeka shiner'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data

data.ab = 5;   units.ab = 'd';  label.ab = 'age at birth';                    bibkey.ab = 'ADW';   
  temp.ab = C2K(22.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'Dahl2001';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.5;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'Dahl2001'; 
  comment.Lp = 'based on SL 4.8 cm';
data.Li = 5.5;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'Dahl2001'; 
  
data.Wwb = 4e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Dahl2001';
  comment.Wwb = 'based on egg diameter of 0.835 mm: pi/6*0.0835^3';
data.Wwp = 0.76;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'Dahl2001','fishbase'};
  comment.Wwi = 'based on 0.00813*(Lp/0.82)^3.13, see F1';
data.Wwi = 3.14;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','Dahl2001'};
  comment.Wwi = 'based on 0.00813*(Li/0.82)^3.13, see F1';
  
%% univariate data
 
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
90.208	3.015
90.237	3.066
95.956	2.956
96.058	3.134
96.097	3.201
98.793	2.863
101.273	2.152
104.506	2.745
104.545	2.812
107.891	3.599
113.483	3.269
127.933	3.261
136.351	2.821
136.371	2.854
148.008	2.981
312.907	3.176
313.079	3.472
313.093	3.497
313.255	3.777
315.627	2.880
321.654	3.303
322.016	3.929
322.089	4.056
322.251	4.335
324.848	3.827
327.279	3.032
327.397	3.235
344.430	2.694
344.498	2.812
344.527	2.863
344.586	2.964
344.620	3.024
344.826	3.379
344.845	3.413
344.880	3.472
344.953	3.599
347.604	3.184
347.648	3.261
347.678	3.311
348.045	3.946
348.093	4.030
350.794	3.701
350.901	3.887
353.704	3.734
353.714	3.751
353.743	3.802
353.915	4.098
353.959	4.174
353.988	4.225
354.027	4.293
356.248	3.134
365.909	4.843
376.372	2.939
377.047	4.107
377.077	4.157
379.679	3.658
380.046	4.293
380.085	4.360
380.134	4.445
382.198	3.015
382.472	3.489
382.639	3.777
382.903	4.234
383.084	4.547
383.108	4.589
385.265	3.320
385.314	3.404
385.481	3.692
385.559	3.827
385.579	3.861
385.603	3.904
385.627	3.946
385.662	4.005
385.696	4.064
386.029	4.640
388.029	3.100
388.078	3.184
388.103	3.227
388.117	3.252
388.137	3.286
397.744	4.902
408.814	4.047
408.839	4.090
408.863	4.132
408.971	4.318
408.995	4.360
409.020	4.403
411.304	3.354
411.495	3.684
411.534	3.751
414.283	3.506
414.317	3.565
414.454	3.802
414.577	4.014
414.674	4.183
417.140	3.447
420.270	3.861
420.300	3.912
420.324	3.954
423.367	4.217
437.303	3.320
437.597	3.827
437.612	3.853
437.636	3.895
437.670	3.954
437.705	4.014
437.719	4.039
437.778	4.140
440.326	3.548
440.439	3.743
440.463	3.785
443.159	3.447
443.584	4.183
446.187	3.684
466.737	4.225
472.259	3.777
472.294	3.836
472.338	3.912
475.268	3.980
475.454	4.301
477.895	3.523
478.188	4.030
495.612	4.166
495.661	4.250
501.326	4.047
680.969	4.741
680.998	4.792
683.106	3.438
683.165	3.540
683.190	3.582
683.214	3.624
683.395	3.937
683.415	3.971
683.439	4.014
683.532	4.174
683.566	4.234
683.581	4.259
683.693	4.453
683.713	4.487
683.728	4.513
686.257	3.887
691.951	3.734
712.315	3.954
712.349	4.014
712.437	4.166
712.457	4.200
712.481	4.242
712.540	4.343
712.564	4.386
712.603	4.453
712.633	4.504
712.662	4.555
712.877	4.927
712.907	4.978
712.961	5.071
715.157	3.870
715.612	4.657
715.680	4.775
715.695	4.800
718.165	4.073
718.200	4.132
718.292	4.293
738.598	4.411
744.037	3.819
744.468	4.563
744.522	4.657
744.541	4.690
744.644	4.868
744.713	4.986
744.737	5.029
744.761	5.071
744.771	5.088
747.344	4.538
747.501	4.809
750.133	4.360
750.206	4.487
750.358	4.750
750.372	4.775
773.378	4.563
773.397	4.597
775.706	3.591
775.858	3.853
776.068	4.217
776.337	4.682
776.435	4.851
776.455	4.885
776.562	5.071
778.998	4.284
779.043	4.360
779.121	4.496
779.253	4.724
779.517	5.181
781.797	4.124
781.987	4.453
782.168	4.766
782.183	4.792
782.300	4.995
808.006	4.453
808.031	4.496
808.133	4.673
811.039	4.699
1050.923	4.580
1053.917	4.758
1079.887	4.673
1079.965	4.809
1080.176	5.173
1083.047	5.139
1085.786	4.876
1085.830	4.953
1123.404	4.936];
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Dahl2001'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
81.457	2.880
87.498	3.328
87.532	3.387
90.320	3.210
90.340	3.244
90.364	3.286
90.472	3.472
92.678	2.288
93.079	2.981
93.197	3.184
95.995	3.024
96.049	3.117
96.073	3.159
124.552	2.415
125.027	3.235
125.081	3.328
125.125	3.404
127.722	2.897
128.172	3.675
130.486	2.677
130.569	2.821
289.760	3.142
301.598	3.616
301.867	4.081
301.886	4.115
301.921	4.174
301.965	4.250
301.979	4.276
302.014	4.335
304.401	3.464
304.592	3.794
307.468	3.768
310.212	3.514
310.784	4.504
318.939	3.607
321.439	2.931
321.463	2.973
324.462	3.159
327.313	3.091
327.499	3.413
327.627	3.633
327.680	3.726
328.184	4.597
328.233	4.682
329.857	2.491
329.877	2.525
330.038	2.804
330.063	2.846
330.488	3.582
330.498	3.599
333.859	4.411
334.093	4.817
335.722	2.635
336.075	3.244
336.432	3.861
336.446	3.887
336.495	3.971
339.010	3.320
339.274	3.777
339.944	4.936
357.471	5.249
357.515	5.325
361.922	2.948
361.966	3.024
362.778	4.428
362.788	4.445
362.822	4.504
362.852	4.555
362.891	4.623
364.769	2.871
365.797	4.648
368.326	4.022
368.541	4.394
368.927	5.063
370.762	3.235
370.801	3.303
371.099	3.819
371.114	3.844
371.133	3.878
371.158	3.920
371.168	3.937
371.187	3.971
371.608	4.699
371.676	4.817
371.701	4.860
371.789	5.012
373.721	3.354
373.790	3.472
373.814	3.514
373.868	3.607
373.902	3.667
373.931	3.717
373.961	3.768
373.966	3.777
388.748	4.343
388.802	4.437
391.928	4.843
394.163	3.709
394.599	4.462
394.628	4.513
394.687	4.614
394.736	4.699
394.868	4.927
395.044	5.232
395.078	5.291
399.980	3.768
400.004	3.810
400.029	3.853
400.043	3.878
400.068	3.920
400.097	3.971
400.122	4.014
400.146	4.056
400.161	4.081
400.674	4.970
400.767	5.130
400.792	5.173
405.987	4.157
422.976	3.540
426.649	4.893
426.688	4.961
428.943	3.861
428.973	3.912
429.340	4.547
432.138	4.386
437.763	4.115
437.783	4.149
438.140	4.766
440.698	4.191
460.837	4.022
460.891	4.115
460.935	4.191
461.209	4.665
461.444	5.071
464.609	5.545
466.805	4.343
475.278	3.997
484.499	4.944
666.279	4.335
666.343	4.445
666.372	4.496
669.395	4.724
671.890	4.039
671.900	4.056
671.934	4.115
672.002	4.234
672.310	4.766
678.401	5.299
698.173	4.496
698.202	4.547
698.256	4.640
698.594	5.223
698.628	5.283
698.647	5.316
698.672	5.359
698.696	5.401
700.951	4.301
701.602	5.426
701.724	5.638
701.754	5.689
701.783	5.739
704.116	4.775
704.151	4.834
704.199	4.919
704.268	5.037
704.307	5.105
704.327	5.139
704.341	5.164
704.361	5.198
704.527	5.486
704.557	5.536
727.709	5.579
727.733	5.621
727.802	5.739
733.662	5.875
736.133	5.147
736.177	5.223
736.201	5.266
736.230	5.316
736.245	5.342
736.284	5.409
736.299	5.435
736.318	5.469
739.483	5.942
739.508	5.985
739.576	6.103
756.736	5.782
759.334	5.274
759.383	5.359
759.456	5.486
759.662	5.841
762.107	5.071
762.156	5.156
762.611	5.942
771.054	5.545
787.965	4.792
793.962	5.164
796.677	4.860
819.839	4.919
822.603	4.699
828.820	5.452
1065.804	5.316
1098.094	6.162
1100.838	5.909
1100.897	6.010
1104.042	6.450
1132.737	6.078
1132.840	6.255];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Dahl2001'; 
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % std length (mm), fecundity (#)
3.572	336.231
3.597	230.099
3.733	446.600
3.767	284.019
3.831	320.040
3.833	349.383
3.956	328.882
4.070	581.532
4.084	443.814
4.115	321.871
4.156	398.558
4.167	504.637
4.187	691.966
4.209	344.302
4.213	305.922
4.231	486.481
4.231	436.820
4.243	396.170
4.259	723.460
4.259	504.498
4.284	518.005
4.332	398.294
4.350	461.471
4.368	398.240
4.417	845.118
4.432	402.658
4.441	355.240
4.470	145.263
4.472	754.742
4.506	799.838
4.523	612.452
4.534	815.597
4.538	763.672
4.553	251.234
4.556	488.250
4.561	804.270
4.563	546.929
4.636	413.638
4.647	806.397
4.671	492.591
4.760	645.957
4.760	612.097
4.802	826.480
4.855	438.139
4.868	377.171
4.870	487.778
4.873	600.640
4.891	370.364
4.909	478.689
4.938	501.220
4.978	814.929
4.989	367.959];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(23);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Dahl2001'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for female, male'}; 
metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.82 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZKR'; % Cat of Life
metaData.links.id_ITIS = '163471'; % ITIS
metaData.links.id_EoL = '211743'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_topeka'; % Wikipedia
metaData.links.id_ADW = 'Notropis_topeka'; % ADW
metaData.links.id_Taxo = '181556'; % Taxonomicon
metaData.links.id_WoRMS = '1019788'; % WoRMS
metaData.links.id_fishbase = 'Notropis-topeka'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_topeka}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-topeka.html}}';  
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Notropis_topeka/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dahl2001'; type = 'phdthesis'; bib = [ ... 
'author = {Shawn Patrick Dahle}, ' ... 
'year = {2001}, ' ...
'title = {Studies of Topeka shiner (\emph{Notropis topeka}) life history and distribution in Minnesota}, ' ...
'school = {University of Minnesota}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  


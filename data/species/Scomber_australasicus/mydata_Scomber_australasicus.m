function [data, auxData, metaData, txtData, weights] = mydata_Scomber_australasicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomber_australasicus'; 
metaData.species_en = 'Blue mackerel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIN', 'MPSW', 'MPE', 'MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 'L-N_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 03 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 15];

%% set data
% zero-variate data

data.ab = 4;   units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(18.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(18.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.5;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'SinaLu2021'; 
data.Li  = 44;     units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 1.4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

% uni-variate data

% time-length
data.tL = [ ... % yr class (yr), fork length (cm)
    1 20.83
    2 26.93
    3 30.64
    4 33.67
    5 36.28]; 
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365;   % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(18.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuTzen1985'; 

% length-fecundity
data.LN_2017 = [ ... % fork length (cm), fecundity
24.947	48818.896
28.985	56692.905
29.953	53543.311
30.924	61417.320
32.018	76377.950
32.988	81102.365
33.916	80314.955
34.966	81102.365
36.018	90551.171
37.034	116535.428];
units.LN_2017   = {'cm', '#'};  label.LN_2017 = {'fork length','fecundity','2017'};  
temp.LN_2017    = C2K(18.7);  units.temp.LN_2017 = 'K'; label.temp.LN_2017 = 'temperature';
bibkey.LN_2017 = 'SinaLu2021'; 
comment.LN_2017 = 'Data from 2018';
%
data.LN_2018 = [ ... % fork length (cm), fecundity
26.805	55118.108
28.021	71653.536
29.069	69291.352
30.042	81889.775
31.013	90551.171
31.863	102362.207
32.829	89763.784
33.926	116535.428
35.098	123622.050
35.918	170866.149
36.888	175590.540
38.071	220472.432
40.065	281889.752];
units.LN_2018   = {'cm', '#'};  label.LN_2018 = {'fork length','fecundity','2018'};  
temp.LN_2018    = C2K(18.7);  units.temp.LN_2018 = 'K'; label.temp.LN_2018 = 'temperature';
bibkey.LN_2018 = 'SinaLu2021'; 
comment.LN_2018 = 'Data from 2018';
%
data.LN_2019 = [ ... % fork length (cm), fecundity
23.894	34645.676
26.035	41732.275
29.229	63779.527
29.999	73228.356
31.014	95275.586
32.027	111811.013
32.991	94488.198
33.885	113385.833
35.058	122834.640
35.944	116535.428
36.992	111023.626
38.006	129133.851
39.062	152755.901];
units.LN_2019   = {'cm', '#'};  label.LN_2019 = {'fork length','fecundity','2019'};  
temp.LN_2019    = C2K(18.7);  units.temp.LN_2019 = 'K'; label.temp.LN_2019 = 'temperature';
bibkey.LN_2019 = 'SinaLu2021'; 
comment.LN_2019 = 'Data from 2018';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
24.352	204.261
24.431	176.913
24.620	212.162
24.892	230.644
24.973	207.706
25.070	232.384
25.317	179.442
25.329	213.832
25.331	220.886
25.408	186.484
25.688	228.775
25.854	198.771
25.857	206.707
25.858	208.471
25.873	251.679
25.950	218.159
26.046	239.310
26.317	254.265
26.398	233.972
26.507	292.159
26.571	223.368
26.658	218.947
26.755	243.625
26.762	261.261
26.848	255.077
26.852	267.422
26.855	274.476
26.947	285.928
27.035	283.271
27.113	255.042
27.200	249.739
27.216	295.593
27.384	270.879
27.559	262.919
27.568	288.491
27.572	300.837
27.754	315.804
27.830	279.638
27.920	284.917
28.191	298.109
28.193	305.164
28.195	311.336
28.286	317.497
28.558	335.098
28.657	365.067
28.924	371.204
29.001	337.685
29.086	328.855
29.098	361.481
29.169	311.207
29.174	325.316
29.267	340.295
29.273	355.285
29.363	361.446
29.468	406.406
29.707	332.300
29.710	342.000
29.803	352.570
29.809	370.206
29.885	334.922
29.891	350.794
29.901	380.775
29.984	364.891
30.190	447.757
30.258	388.665
30.267	413.355
30.331	344.563
30.350	397.471
30.431	376.296
30.603	363.046
30.689	355.098
30.870	368.302
30.876	385.937
30.887	415.037
30.890	423.854
31.056	393.850
31.057	395.614
31.060	404.432
31.082	465.275
31.140	379.730
31.153	417.647
31.166	454.682
31.247	433.507
31.267	488.179
31.325	402.633
31.517	446.699
31.529	478.444
31.537	501.370
31.614	468.732
31.636	530.458
31.688	427.276
31.758	375.239
31.767	401.693
31.781	440.491
31.797	485.463
31.888	493.387
31.895	514.550
31.954	429.887
31.989	529.529
31.995	545.401
32.039	421.057
32.144	466.898
32.145	468.662
32.162	518.042
32.224	442.197
32.228	452.778
32.247	508.331
32.256	532.139
32.310	434.249
32.325	479.220
32.332	497.738
32.337	510.965
32.345	534.773
32.444	564.742
32.479	413.944
32.496	459.797
32.539	582.367
32.579	444.795
32.607	524.156
32.676	469.474
32.682	486.228
32.707	555.889
32.782	517.961
32.793	548.823
32.847	453.578
32.862	495.904
32.868	512.658
32.887	566.447
32.890	574.384
32.941	469.438
33.033	477.363
33.229	531.129
33.231	537.301
33.248	586.682
33.299	478.210
33.326	554.926
33.328	561.980
33.333	574.325
33.391	489.661
33.405	528.460
33.418	564.614
33.432	604.294
33.484	502.876
33.487	510.813
33.510	576.947
33.605	592.808
33.666	516.080
33.676	545.179
33.677	548.706
33.680	555.761
33.915	468.428
33.949	564.543
33.964	606.869
33.967	615.687
34.023	523.969
34.032	551.305
34.044	584.813
34.060	628.021
34.115	534.539
34.117	540.712
34.124	559.229
34.201	527.473
34.306	575.078
34.315	600.650
34.319	611.232
34.326	630.631
34.389	560.076
34.406	606.811
34.467	528.320
34.473	545.955
34.571	572.398
34.577	590.033
34.600	654.404
34.648	540.641
34.658	569.740
34.669	599.721
34.674	612.948
34.676	620.003
34.695	672.028
34.742	556.502
34.752	583.837
34.766	623.518
34.819	522.982
34.855	626.152
35.037	639.355
35.046	664.046
35.093	548.519
35.113	604.072
35.124	635.816
35.137	671.970
35.142	685.197
35.210	626.987
35.218	650.795
35.236	701.057
35.296	620.803
35.305	647.256
35.308	655.192
35.362	558.184
35.379	604.919
35.382	614.618
35.385	623.436
35.391	639.308
35.406	680.753
35.463	592.562
35.479	636.651
35.489	667.514
35.498	692.204
35.507	716.013
35.546	576.678
35.548	582.850
35.590	701.011
35.731	599.581
35.751	656.898
35.807	563.416
35.829	626.905
35.880	769.755
35.932	666.574
35.993	588.964
36.013	647.163
36.028	687.725
36.037	713.297
36.042	728.288
36.100	641.860
36.107	663.023
36.163	571.305
36.184	628.622
36.217	723.855
36.231	762.654
36.278	646.246
36.290	678.872
36.377	676.215
36.452	636.523
36.493	752.038
36.576	736.154
36.653	705.279
36.677	773.177
36.730	670.877
36.739	697.331
36.745	715.849
36.756	745.830
36.806	635.594
36.826	693.792
36.852	766.099
36.855	775.799
36.857	780.208
36.921	712.298
36.987	647.034
37.026	759.022
37.033	777.539
37.081	662.895
37.162	643.483
37.271	699.906
37.274	707.843
37.278	719.306
37.280	727.242
37.332	622.297
37.351	676.086
37.386	774.847
37.550	739.552
37.565	780.996
37.912	761.550
38.413	677.709
38.623	768.511
38.857	680.296];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'KuTzen1985'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;
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
set1 = {'LN_2018','LN_2019','LN_2017'}; subtitle1 = {'Data for 2018,2019,2017'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XXJT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577310'; % Ency of Life
metaData.links.id_Wiki = 'Scomber_australasicus'; % Wikipedia
metaData.links.id_ADW = 'Scomber_australasicus'; % ADW
metaData.links.id_Taxo = '187058'; % Taxonomicon
metaData.links.id_WoRMS = '219715'; % WoRMS
metaData.links.id_fishbase = 'Scomber-australasicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomber_australasicus}}';
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
bibkey = 'KuTzen1985'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1978.tb03423.x}, ' ...
'author = {Jui-Feng Ku and Wann-Nian Tzeng}, ' ... 
'year = {1985}, ' ...
'title = {Age and growth of spotted mackerel, \emph{Scomber australasicus} ({C}uvier), in the shelf waters of {N}ortheastern and {S}outhwestern {T}aiwan}, ' ...
'journal = {J. Fish. Soc. Taiwan}, ' ...
'volume = {12(2)}, ' ...
'pages = {12-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SinaLu2021'; type = 'Article'; bib = [ ... 
'doi = {10.3390/jmse9121341}, ' ...
'author = {Sunarti Sinaga and Hsueh-Jung Lu and Jia-Rong Lin}, ' ... 
'year = {2021}, ' ...
'title = {Mackerel (\emph{Scomber australasicus}) Reproduction in {N}ortheastern {T}aiwan}, ' ...
'journal = {J. Mar. Sci. Eng.}, ' ...
'volume = {9}, ' ...
'pages = {1341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomber-australasicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

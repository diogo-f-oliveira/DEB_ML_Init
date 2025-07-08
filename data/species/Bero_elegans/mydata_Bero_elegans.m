function [data, auxData, metaData, txtData, weights] = mydata_Bero_elegans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Bero_elegans'; 
metaData.species_en = 'Elegant sculpin'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 07];

%% set data
% zero-variate data

data.am = 3.9 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ShelPanc2023';   
  temp.am = C2K(11.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'ShelPanc2023'; 
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwi = 74; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00676*Li^3.17, see F1'; 
 
data.Ri = 4500/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data
% time-length
data.tL_f = [ ... % age (d/10), total length (cm) 
 6.833	2.602
 9.843	2.295
11.411	3.315
12.114	3.494
12.121	3.162
12.126	2.933
12.313	2.473
12.446	4.438
12.448	4.362
14.921	4.387
15.257	5.178
15.299	3.264
15.303	3.060
15.602	5.560
21.065	6.197
21.079	5.534
21.085	5.279
33.631	5.200
33.796	5.736
36.639	4.995
41.934	5.250
42.082	6.526
42.241	7.342
42.273	5.888
42.430	6.755
42.444	6.117
42.472	4.867
42.602	6.985
47.735	6.576
48.068	7.469
50.695	8.515
50.880	8.132
50.887	7.851
51.407	8.285
51.425	7.468
51.438	6.881
54.032	9.433
57.420	8.029
57.428	7.646
57.434	7.391
66.805	7.083
68.701	9.200
68.890	8.639
68.908	7.848
69.073	8.384
69.182	11.420
69.235	9.047
69.373	10.808
71.888	8.894
72.412	9.174
72.606	8.383
78.055	9.658
78.089	8.153
83.538	9.402
87.590	9.912
104.723	10.164
104.865	11.695
105.237	10.853
108.073	10.444
114.300	8.504
140.783	9.367
141.236	12.837
141.276	11.025];
data.tL_f(:,1) =  10 * data.tL_f(:,1); % convert 0.1*d to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(11.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShelPanc2023'; 
%
data.tL_m = [ ... % age (d/10), total length (cm) 
 6.123	2.729
 8.955	2.499
 9.848	2.065
11.555	4.770
11.913	4.566
11.939	3.417
12.269	4.438
12.277	4.081
12.303	2.907
12.478	2.984
12.662	2.652
12.993	3.698
15.119	3.417
15.258	5.127
15.614	4.999
21.599	5.993
30.779	6.323
33.084	5.966
33.097	5.379
33.108	4.868
33.229	7.369
33.608	6.221
33.778	6.552
35.694	7.777
36.066	6.909
36.086	6.016
36.251	6.552
36.622	5.761
41.682	8.618
41.925	5.632
42.233	7.699
42.238	7.444
42.397	8.261
42.401	8.082
42.597	7.214
48.074	7.214
50.503	9.229
51.185	10.326
54.152	11.984
57.409	8.539
57.418	8.105
66.225	9.354
68.716	8.537
68.832	11.293
68.885	8.869
69.399	9.609
69.566	10.068
69.585	9.200
72.027	10.629
72.036	10.221
72.039	10.093
72.052	9.481
72.272	7.516
72.398	9.838
72.762	9.327
75.022	11.011
78.239	9.326
83.720	9.147
83.841	11.673
83.857	10.959
86.972	13.918
87.016	11.902
87.173	12.821
87.382	11.341
89.976	13.892
89.999	12.846
90.019	11.927
90.179	12.693
93.068	9.860
104.788	15.217
108.041	11.924
108.111	16.722
114.249	10.800
120.033	12.917
120.227	12.101];
data.tL_m(:,1) =  10 * data.tL_m(:,1); % convert 0.1*d to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(11.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShelPanc2023'; 

% time-weight
data.tW_f = [ ... % age (d/10), weight (g)
6.007	0.206
9.894	0.098
12.367	1.254
15.371	1.042
21.378	2.090
30.212	2.716
33.216	2.608
33.217	3.871
33.392	1.345
35.689	5.238
35.866	3.764
35.867	3.027
36.572	1.974
42.403	1.233
42.404	5.654
42.933	3.654
42.934	4.917
42.935	7.023
48.233	3.440
51.413	8.596
51.767	13.016
57.597	8.802
66.078	9.217
68.905	9.741
69.081	8.583
69.258	11.320
69.611	7.741
71.908	13.950
72.261	9.318
72.262	5.212
72.438	10.160
72.615	12.054
74.558	15.211
78.269	9.313
83.746	17.415
84.099	14.888
84.276	18.993
84.277	9.099
86.749	28.465
86.926	20.150
87.279	40.886
87.456	18.360
90.106	18.463
90.283	34.147
90.284	27.410
90.285	23.305
90.459	30.673
93.286	15.513
104.947	43.190
105.477	18.452
107.774	63.609
108.127	18.661
114.134	16.025
120.318	21.495
120.671	22.652];
data.tW_f(:,1) =  10 * data.tW_f(:,1); % convert 0.1*d to d
units.tW_f = {'d', 'cm'}; label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f = C2K(11.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ShelPanc2023'; 
%
data.tW_m = [ ... % age (d/10), weight (g)
11.661	0.518
15.548	1.884
20.848	1.143
21.555	3.038
33.392	2.082
33.393	3.345
36.396	3.132
36.926	0.606
42.226	5.339
42.756	1.338
42.757	2.917
48.587	2.387
48.588	4.176
51.060	2.806
51.061	5.438
51.237	6.175
51.413	4.490
54.240	9.857
57.244	5.223
57.245	5.855
57.246	6.486
66.254	3.532
68.905	7.636
68.906	5.952
69.081	16.373
69.788	12.056
72.085	6.792
72.261	5.844
72.438	10.160
78.445	6.682
78.799	9.103
84.806	8.467
87.633	9.939
105.124	15.400
105.300	11.295
105.830	18.347
108.481	12.345
114.488	11.709
114.664	7.183
140.813	15.480
141.166	10.533
141.343	31.059];
data.tW_m(:,1) =  10 * data.tW_m(:,1); % convert 0.1*d to d
units.tW_m = {'d', 'cm'}; label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m = C2K(11.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ShelPanc2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Ri = weights.Ri * 0;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LLTK'; % Cat of Life
metaData.links.id_ITIS = '643805'; % ITIS
metaData.links.id_EoL = '46569080'; % Ency of Life
metaData.links.id_Wiki = 'Bero_elegans'; % Wikipedia
metaData.links.id_ADW = 'Bero_elegans'; % ADW
metaData.links.id_Taxo = '164107'; % Taxonomicon
metaData.links.id_WoRMS = '279905'; % WoRMS
metaData.links.id_fishbase = 'Bero-elegans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bero_elegans}}';
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
bibkey = 'ShelPanc2023'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-023-01670-0}, ' ...
'author = {Vladimir A. Shelekhov and Vladimir V. Panchenko}, ' ... 
'year = {2023}, ' ...
'title = {Age and growth pattern of Elegant sculpin \emph{Bero elegans} in {P}eter the {G}reat {B}ay ({J}apan {S}ea)}, ' ...
'journal = {Fisheries Science () :}, ' ...
'volume = {7892}, ' ...
'pages = {121–128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bero-elegans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Gracilimugil_argenteus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Gracilimugil_argenteus'; 
metaData.species_en = 'Flat-tail mullet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 15];

%% set data
% zero-variate data

data.am = 17*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'KendGray2009';   
  temp.am = C2K(18.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 45;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 110.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^2.96, see F1';
data.Wwi = 919.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.96, see F1';
  
data.Ri  = 3.5e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Chelon_saliens';
  
% uni-variate data
% time-length
data.tL_LMf = [ ... % yr class (yr), total length (cm)
3.688	22.365
3.803	26.798
3.845	23.350
4.001	25.222
4.162	22.069
4.279	24.433
4.321	21.478
4.478	22.759
4.515	24.631
4.793	23.153
4.987	26.305
4.989	24.532
5.030	22.857
5.302	26.897
5.307	22.660
5.424	23.645
5.500	26.404
5.697	27.488
5.820	22.759
5.896	25.025
5.937	23.941
5.972	27.882
6.053	26.700
6.057	21.872
6.213	24.138
6.251	26.010
6.370	24.631
6.411	23.153
6.526	26.601
6.529	23.744
6.686	24.532
6.802	27.685
6.803	26.010
6.843	25.616
6.960	27.192
6.961	26.601
7.120	25.517
7.237	26.010
7.357	25.025
7.358	24.236
7.358	23.448
7.393	27.980
7.473	26.995
7.475	25.419
7.711	26.305
7.750	26.404
7.752	24.926
7.828	27.783
7.833	22.956
7.869	25.616
7.950	24.433
7.989	24.926
8.027	25.813
8.068	24.926
8.184	26.995
8.224	26.404
8.265	24.335
8.345	23.744
8.421	26.995
8.462	25.123
8.540	26.601
8.541	25.616
8.659	25.517
8.699	24.729
8.777	26.108
8.816	26.897
8.893	28.177
8.894	27.094
8.897	24.335
9.251	26.010
9.368	26.798
9.527	25.517
9.565	27.783
10.000	26.995
10.314	28.571
10.318	24.926
10.794	22.463
11.184	26.700
11.735	28.473];
data.tL_LMf(:,1) = (data.tL_LMf(:,1) + 0.5) * 365; % convert yr to d
for i=2:size(data.tL_LMf,1); if data.tL_LMf(i,1)<=data.tL_LMf(i-1,1);data.tL_LMf(i,1)=data.tL_LMf(i-1,1)+1e-3;end;end
units.tL_LMf   = {'d', 'cm'};  label.tL_LMf = {'time since birth', 'total length', 'female'};  bibkey.tL_LMf = 'KendGray2009';
temp.tL_LMf    = C2K(18.5);  units.temp.tL_LMf = 'K'; label.temp.tL_LMf = 'temperature';
comment.tL_LMf = 'Data for females from Lake Macquarie';
%
data.tL_LMm = [ ... % yr class (yr), total length (cm)
3.845	24.138
4.157	27.291
4.159	25.222
4.435	26.108
4.475	25.320
4.592	26.601
4.673	24.433
4.711	25.714
4.713	24.236
4.750	26.305
4.828	27.488
4.829	26.995
4.947	26.700
5.027	25.911
5.106	25.419
5.183	27.586
5.264	25.320
5.343	25.813
5.380	28.177
5.381	27.389
5.497	29.261
5.576	29.852
5.618	27.586
5.656	28.571
5.776	26.700
5.777	26.207
5.852	30.148
5.892	29.064
6.091	27.783
6.207	29.754
6.328	27.586
6.483	30.936
6.484	29.557
6.602	30.148
6.643	27.980
6.721	28.966
6.880	28.571
6.881	27.586
6.918	29.852
7.076	30.049
7.236	27.882
7.237	26.995
7.472	28.768
7.474	26.010
7.587	31.724
7.626	32.118
7.670	27.685
7.746	30.936
7.787	29.163
7.903	31.921
7.905	29.852
7.985	28.374
8.103	29.163
8.144	27.488
8.220	30.542
8.222	28.177
8.378	29.852
8.381	27.192
8.458	28.867
8.499	27.783
8.694	29.951
8.735	28.966
8.772	30.542
8.775	27.586
8.811	31.724
8.852	30.049
8.893	28.571
9.011	29.163
9.051	28.374
9.208	29.655
9.209	28.079
9.328	27.488
9.405	30.049
9.482	31.232
9.484	29.064
9.524	29.163
9.561	32.020
9.563	29.557
9.682	28.473
9.721	29.360
9.760	30.345
9.878	29.852
9.957	30.443
10.155	29.951
10.311	31.626
10.312	30.345
10.353	29.163
10.468	32.020
10.587	31.921
10.589	29.754
10.786	30.148
10.825	31.034
10.864	31.429
11.022	31.034
11.221	29.360
11.376	32.512
11.770	33.005
11.890	31.921
12.170	27.980
12.444	30.345
13.233	30.542
15.168	29.261
15.917	30.739];
data.tL_LMm(:,1) = (data.tL_LMm(:,1) + 0.5) * 365; % convert yr to d
for i=2:size(data.tL_LMm,1); if data.tL_LMm(i,1)<=data.tL_LMm(i-1,1);data.tL_LMm(i,1)=data.tL_LMm(i-1,1)+1e-3;end;end
units.tL_LMm   = {'d', 'cm'};  label.tL_LMm = {'time since birth', 'total length', 'male'};  bibkey.tL_LMm = 'KendGray2009';
temp.tL_LMm    = C2K(18.5);  units.temp.tL_LMm = 'K'; label.temp.tL_LMm = 'temperature';
comment.tL_LMm = 'Data for males from Lake Macquarie';
%
data.tL_SGBf = [ ... % yr class (yr), total length (cm)
2.600	22.440
4.504	26.697
4.664	24.925
5.297	28.085
5.340	25.031
5.380	23.948
5.421	23.456
5.541	22.669
5.698	23.853
5.739	23.262
5.817	24.544
6.014	25.728
6.093	26.419
6.292	25.928
6.333	24.943
6.571	25.833
6.612	24.060
6.730	25.342
6.888	26.427
6.969	24.753
7.006	27.217
7.046	26.922
7.167	25.248
7.207	25.446
7.209	22.884
7.245	26.924
7.404	27.123
7.443	27.123
7.446	24.660
7.564	26.238
7.566	23.775
7.642	27.519
7.762	26.535
7.763	25.747
8.002	24.962
8.359	25.064
8.516	27.824
8.518	25.263
8.520	23.588
8.597	25.756
8.715	26.841
8.794	27.828
9.113	26.255
9.232	26.749
9.271	27.045
9.310	28.326
9.353	25.174
9.392	25.667
9.432	25.569
9.470	26.948
9.472	25.076
9.511	26.259
9.552	24.683
9.588	28.132
10.025	28.137
10.026	27.742
10.067	26.364
10.146	26.364
10.265	26.957
10.304	27.548
10.306	25.972
10.306	25.480
10.463	27.944
10.503	27.058
11.378	26.772
11.577	26.183
12.012	27.961
12.133	26.386
12.171	27.963
12.370	27.670];
data.tL_SGBf(:,1) = (data.tL_SGBf(:,1) + 0.5) * 365; % convert yr to d
for i=2:size(data.tL_SGBf,1); if data.tL_SGBf(i,1)<=data.tL_SGBf(i-1,1);data.tL_SGBf(i,1)=data.tL_SGBf(i-1,1)+1e-3;end;end
units.tL_SGBf   = {'d', 'cm'};  label.tL_SGBf = {'time since birth', 'total length', 'female'};  bibkey.tL_SGBf = 'KendGray2009';
temp.tL_SGBf    = C2K(18.5);  units.temp.tL_SGBf = 'K'; label.temp.tL_SGBf = 'temperature';
comment.tL_SGBf = 'Data for females from St Georges Basin';
%
data.tL_SGBm = [ ... % yr class (yr), total length (cm)
2.130	15.735
2.484	19.975
2.602	20.863
2.681	21.751
3.671	25.013
3.713	22.452
3.828	26.394
3.830	24.226
3.834	21.172
3.990	23.637
4.585	24.432
4.587	22.757
4.623	26.206
5.377	27.100
5.413	31.633
5.497	26.314
5.530	33.605
5.656	26.906
5.694	28.188
5.933	27.402
6.091	28.291
6.329	29.081
6.332	26.224
6.370	27.900
6.444	33.319
6.450	27.014
6.609	26.917
6.647	29.183
6.727	28.002
6.803	31.944
6.847	27.806
6.884	29.876
7.043	30.567
7.044	29.089
7.283	29.190
7.324	27.910
7.363	28.600
7.597	32.543
7.680	29.293
7.720	28.604
7.801	27.226
7.840	27.916
7.997	29.691
8.038	29.100
8.040	26.538
8.116	30.283
8.158	28.018
8.197	28.412
8.314	31.172
8.394	29.892
8.395	29.498
8.594	28.909
8.753	29.108
8.753	28.418
8.991	29.800
9.111	28.028
9.229	29.409
9.230	28.423
9.268	30.099
9.270	28.818
9.505	31.875
9.547	29.609
9.587	29.117
9.588	28.230
9.704	31.581
9.784	30.597
9.826	28.923
9.904	29.810
9.945	28.727
10.183	29.715
10.223	29.222
10.224	28.336
10.341	30.308
10.502	28.240
10.620	29.030
10.818	30.510
11.017	30.118
11.134	31.893
11.176	29.726
11.296	28.840
11.375	29.235
12.885	29.646
13.519	30.933
15.386	31.249
16.181	30.963
16.182	30.766
16.459	31.458
16.897	30.872];
data.tL_SGBm(:,1) = (data.tL_SGBm(:,1) + 0.5) * 365; % convert yr to d
for i=2:size(data.tL_SGBm,1); if data.tL_SGBm(i,1)<=data.tL_SGBm(i-1,1);data.tL_SGBm(i,1)=data.tL_SGBm(i-1,1)+1e-3;end;end
units.tL_SGBm   = {'d', 'cm'};  label.tL_SGBm = {'time since birth', 'total length', 'male'};  bibkey.tL_SGBm = 'KendGray2009';
temp.tL_SGBm    = C2K(18.5);  units.temp.tL_SGBm = 'K'; label.temp.tL_SGBm = 'temperature';
comment.tL_SGBm = 'Data for males from St Georges Basin';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_LMf = 3 * weights.tL_LMf;
weights.tL_LMm = 3 * weights.tL_LMm;
weights.tL_SGBf = 3 * weights.tL_SGBf;
weights.tL_SGBm = 3 * weights.tL_SGBm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_LMf','tL_LMm'}; subtitle1 = {'Data for females, males from Lake Macquarie'};
set2 = {'tL_SGBf','tL_SGBm'}; subtitle2 = {'Data for females, males from  from St Georges Basin'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3H599'; % Cat of Life
metaData.links.id_ITIS = '170335'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Gracilimugil_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Gracilimugil_argenteus'; % ADW
metaData.links.id_Taxo = '46303'; % Taxonomicon
metaData.links.id_WoRMS = '126983'; % WoRMS
metaData.links.id_fishbase = 'Gracilimugil-argenteus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gracilimugil_argenteus}}';
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
bibkey = 'KendGray2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2009.02485.x}, ' ...
'author = {B. W. Kendall and C. A. Gray and D. Bucher}, ' ... 
'year = {2009}, ' ...
'title = {Age validation and variation in growth, mortality and population structure of \emph{Liza argentea} and \emph{Myxus elongatus} ({M}ugilidae) in two temperate {A}ustralian estuaries}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {75}, ' ...
'pages = {2788–2804}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Gracilimugil-argenteus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


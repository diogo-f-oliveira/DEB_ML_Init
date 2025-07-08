function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_owstoni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_owstoni'; 
metaData.species_en = 'Japanese yellow seaperch'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 27];

%% set data
% zero-variate data

data.am = 25*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(7.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'YagiTash2022'; 
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 21.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','YagiTash2022'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 208.8;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.GSI  = 0.3;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'YagiTash2022';   
  temp.GSI = C2K(7.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';


% univariate data
% time-length
data.tL_f = [ ...
2.232	10.452
2.340	9.780
2.430	9.413
2.483	10.452
2.483	10.024
2.626	11.125
2.661	12.103
2.678	13.509
2.679	11.858
2.912	10.819
3.394	13.753
3.572	15.220
3.609	13.386
3.609	13.203
3.680	14.181
3.699	12.897
3.716	14.609
3.732	16.504
3.734	13.631
3.825	12.653
3.839	17.237
4.036	17.482
4.037	17.176
4.377	16.443
4.378	15.159
4.432	15.709
4.467	16.259
4.541	12.958
4.558	14.425
4.611	16.015
4.611	15.403
4.645	17.726
4.648	14.242
4.649	13.020
4.679	20.721
4.737	15.281
4.756	13.631
4.771	17.359
4.772	15.648
4.788	18.826
4.807	16.809
4.897	16.626
4.913	18.460
4.969	15.954
4.988	14.364
5.021	18.643
5.039	18.093
5.040	17.115
5.076	16.626
5.329	13.447
5.341	22.127
5.377	21.760
5.380	17.910
5.486	19.193
5.488	16.993
5.523	17.848
5.595	17.665
5.614	16.320
5.719	18.643
5.774	17.054
5.827	18.276
5.828	17.604
5.863	17.971
5.865	16.076
5.920	13.692
5.971	18.154
5.971	17.910
5.987	20.232
5.988	19.010
6.022	22.127
6.023	19.743
6.042	18.399
6.043	17.176
6.312	17.298
6.346	19.377
6.382	18.643
6.435	19.560
6.437	17.848
6.438	16.015
6.491	17.359
6.491	16.993
6.543	19.010
6.560	21.394
6.562	17.726
6.579	19.743
6.580	18.337
6.615	19.315
6.617	16.565
6.633	18.460
6.776	19.743
6.793	20.721
6.883	19.377
6.884	19.132
6.884	18.521
6.936	21.699
7.314	19.071
7.316	16.320
7.348	20.782
7.350	18.399
7.419	21.760
7.420	20.660
7.420	20.110
7.423	16.565
7.458	18.154
7.510	19.499
7.511	18.582
7.545	21.271
7.617	20.171
7.674	16.381
7.690	19.560
7.834	17.665
7.904	19.743
7.921	21.210
7.976	19.560
8.369	21.944
8.406	20.232
8.442	19.866
8.443	18.704
8.459	21.149
8.460	19.132
8.513	20.049
8.695	16.870
8.994	24.144
8.995	22.494
9.409	19.438
9.445	20.232
9.462	20.844
9.516	20.110
9.588	20.966
9.962	23.044
10.519	20.660
10.538	19.010];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr 
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(7.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YagiTash2022';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.374	12.592
2.608	11.064
2.715	11.614
2.913	10.086
2.913	9.963
2.984	10.452
2.985	9.902
3.089	13.936
3.252	11.369
3.270	12.347
3.305	13.447
3.323	12.958
3.359	12.714
3.430	12.897
3.431	11.919
3.467	12.103
3.483	14.609
3.557	11.553
3.610	12.775
3.628	11.980
3.629	11.247
3.699	12.592
3.842	13.753
3.858	16.443
3.966	15.709
3.967	14.487
4.020	15.892
4.039	13.570
4.058	12.408
4.291	12.164
4.327	11.614
4.343	13.875
4.398	13.020
4.398	12.531
4.399	11.797
4.415	13.936
4.451	14.425
4.596	11.308
4.630	13.936
4.631	12.592
4.649	13.142
4.843	17.176
4.860	17.848
5.079	12.286
5.382	15.281
5.383	13.814
5.418	14.181
5.524	15.954
5.599	11.369
5.613	17.054
5.616	13.753
5.776	14.792
5.865	16.259
5.865	15.770
5.882	16.993
5.884	13.447
5.954	16.504
6.043	17.543
6.331	15.526
6.383	17.543
6.422	13.509
6.457	14.792
6.565	13.142
6.584	11.736
6.620	12.408
6.796	16.626
6.904	15.892
6.938	18.521
6.942	13.264
6.942	12.775
6.959	14.609
6.993	16.198
7.298	15.526
7.334	16.259
7.335	13.631
7.385	20.110
7.586	13.386
7.941	18.704];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(7.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YagiTash2022';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
2.257	21.053
2.383	21.053
2.508	27.193
2.634	30.702
2.687	65.789
2.687	40.351
2.723	33.333
3.225	41.228
3.440	85.088
3.458	57.018
3.529	76.316
3.601	44.737
3.637	72.807
3.691	68.421
3.726	109.649
3.762	53.509
3.780	100.877
3.780	91.228
3.780	78.947
3.870	66.667
3.906	115.789
3.923	55.263
4.013	68.421
4.031	48.246
4.067	94.737
4.300	79.825
4.353	101.754
4.389	44.737
4.407	103.509
4.407	71.930
4.443	63.158
4.515	92.105
4.533	122.807
4.550	57.895
4.604	96.491
4.604	47.368
4.658	67.544
4.694	121.053
4.694	114.912
4.730	142.105
4.748	103.509
4.765	76.316
4.783	152.632
4.801	112.281
4.819	85.088
4.837	110.526
4.855	116.667
4.927	130.702
4.945	74.561
4.963	119.298
4.998	91.228
4.998	79.825
5.016	100.877
5.016	44.737
5.034	92.105
5.052	146.491
5.303	208.772
5.357	131.579
5.375	260.526
5.410	53.509
5.428	78.947
5.446	130.702
5.464	103.509
5.464	71.053
5.500	125.439
5.518	158.772
5.590	100.877
5.625	116.667
5.715	166.667
5.733	132.456
5.805	142.982
5.805	122.807
5.876	128.070
5.894	146.491
5.930	134.211
6.002	170.175
6.002	156.140
6.020	294.737
6.020	124.561
6.288	117.544
6.306	100.877
6.324	83.333
6.342	147.368
6.360	153.509
6.378	105.263
6.396	135.088
6.396	127.193
6.414	89.474
6.414	121.053
6.450	110.526
6.485	156.140
6.539	100.000
6.557	163.158
6.575	186.842
6.593	144.737
6.593	233.333
6.664	202.632
6.664	157.895
6.664	186.842
6.736	152.632
6.790	139.474
6.826	130.702
6.826	135.088
6.951	200.000
7.292	239.474
7.309	157.018
7.309	90.351
7.345	148.246
7.381	141.228
7.399	137.719
7.399	153.509
7.417	210.526
7.417	97.368
7.435	250.000
7.524	199.123
7.524	143.860
7.542	225.439
7.560	183.333
7.650	185.965
7.668	117.544
7.829	131.579
7.936	192.105
7.954	172.807
8.008	159.649
8.313	221.053
8.331	147.368
8.366	215.789
8.384	170.175
8.384	178.947
8.402	156.140
8.438	200.000
8.707	113.158
8.958	218.421
9.011	311.404
9.352	188.596
9.370	198.246
9.388	179.825
9.406	220.175
9.513	175.439
9.549	201.754
9.549	196.491
9.853	219.298
10.516	154.386
10.516	185.088
10.516	202.632];
data.tW_f(:,1) = 365*data.tW_f(:,1); % convert yr 
n=size(data.tW_f,1); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3; end; end
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = C2K(7.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'YagiTash2022';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), weight (g)
2.186	10.526
2.275	44.737
2.383	18.421
2.580	33.333
2.651	51.754
2.687	23.684
2.831	13.158
2.920	19.298
3.081	49.123
3.368	50.000
3.493	91.228
3.726	57.895
3.995	30.702
4.031	72.807
4.336	57.018
4.371	57.895
4.371	48.246
4.479	68.421
4.533	40.351
4.640	57.895
4.658	24.561
4.765	67.544
4.909	84.211
5.106	39.474
5.410	65.789
5.410	53.509
5.554	28.070
5.572	102.632
5.572	55.263
5.661	50.000
5.679	81.579
5.787	59.649
5.894	88.596
5.948	114.912
5.966	42.105
6.002	77.193
6.324	140.351
6.378	48.246
6.414	31.579
6.503	71.930
6.557	45.614
6.808	84.211
6.826	70.175
6.915	36.842
6.915	46.491
7.023	114.035
7.274	175.439
7.345	119.298
7.345	47.368
7.453	100.877
7.560	50.000];
data.tW_m(:,1) = 365*data.tW_m(:,1); % convert yr 
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = C2K(7.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'YagiTash2022';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 3 * weights.GSI;

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
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7P6'; % Cat of Life
metaData.links.id_ITIS = '644593'; % ITIS
metaData.links.id_EoL = '46568176'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_owstoni'; % ADW
metaData.links.id_Taxo = '187310'; % Taxonomicon
metaData.links.id_WoRMS = '274831'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-owstoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'YagiTash2022'; type = 'Article'; bib = [ ... 
'author = {Naoki Yagishita and Miyuki Tashiro and Ryu Doiuchi}, ' ... 
'year = {2022}, ' ...
'title = {Age and growth of hatsume \emph{Sebastes owstoni} in the {S}ea of {J}apan off the {T}ango {P}eninsula, {K}yoto {P}refecture}, ' ...
'journal = {Aquacult. Sci.}, ' ...
'volume = {70(3)}, ' ...
'pages = {261－268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-owstoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

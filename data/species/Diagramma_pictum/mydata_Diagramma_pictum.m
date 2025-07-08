function [data, auxData, metaData, txtData, weights] = mydata_Diagramma_pictum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Diagramma_pictum'; 
metaData.species_en = 'Painted sweetlips'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 13];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'GranAbde2006';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 38.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 87;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ChiuHo2025';
  comment.Wwb = 'based egg diameter of 0.78 mm : pi/6*0.078^3'; 
data.Wwp = 584; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.00, see F1';
data.Wwi = 6585; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.00, see F1; max. published weight: 6.3 kg';

data.Ri  = 140111 /365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rateat TL 55 cm';   bibkey.Ri  = 'ChiuHo2025';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
0.122	19.891
0.124	25.355
0.181	23.497
0.199	21.311
0.219	21.967
0.258	22.404
0.336	25.902
0.490	26.776
0.547	25.246
0.566	23.607
0.588	30.492
0.605	25.464
0.644	26.230
0.663	24.809
0.682	25.137
0.704	32.678
0.740	25.683
0.761	31.913
0.797	23.934
0.837	27.760
0.855	22.842
0.913	26.011
0.931	20.328
0.933	26.667
1.009	23.060
1.029	26.776
1.048	26.667
1.049	27.541
1.051	34.536
1.069	29.836
1.070	33.443
1.085	24.699
1.086	25.137
1.087	25.902
1.105	21.858
1.126	28.852
1.127	29.290
1.162	21.530
1.201	22.842
1.222	26.557
1.242	30.164
1.243	31.475
1.298	24.809
1.300	30.820
1.355	22.186
1.356	26.120
1.396	29.945
1.413	22.951
1.433	24.044
1.434	27.650
1.435	31.366
1.452	24.699
1.453	25.355
1.496	40.437
1.531	28.743
1.551	32.240
1.572	37.486
1.592	40.000
1.593	42.077
1.647	30.273
1.667	35.191
1.688	38.142
1.705	31.803
1.805	43.060
1.918	36.940
1.994	32.896
2.051	30.929
2.188	37.923
2.208	40.874
2.283	31.913
2.302	33.115
2.304	37.923
2.321	30.164
2.360	33.661
2.378	30.601
2.397	28.962
2.423	48.634
2.439	39.454
2.454	26.557
2.478	41.093
2.516	38.689
2.536	41.639
2.573	37.814
2.575	41.967
2.576	45.574
2.610	33.880
2.611	36.393
2.612	39.235
2.710	44.481
2.728	40.328
2.729	42.623
2.844	41.858
2.863	40.765
2.883	42.951
2.921	39.563
2.940	39.016
2.941	41.749
2.978	37.923
2.981	46.557
3.055	38.579
3.076	42.623
3.095	43.607
3.098	52.896
3.117	51.148
3.154	47.432
3.192	44.372
3.228	38.907
3.269	45.902
3.304	33.661
3.307	42.732
3.308	43.934
3.323	32.787
3.324	35.956
3.329	53.552
3.343	34.317
3.360	30.273
3.365	45.027
3.366	46.776
3.399	30.710
3.402	40.984
3.484	54.208
3.612	35.082
3.635	45.683
3.656	51.803
3.750	44.044
3.751	47.650
3.787	39.016
3.791	50.820
3.827	43.169
3.883	39.781
3.906	49.836
4.060	48.525
4.061	54.317
4.097	44.044
4.195	51.585
4.212	43.060
4.251	45.683
4.350	52.787
4.387	47.869
4.423	41.202
4.502	45.683
4.522	50.710
4.538	40.656
4.544	56.721
4.561	51.585
4.697	54.208
4.752	45.137
4.772	49.508
4.791	48.197
4.831	51.257
5.102	55.738
5.254	49.290
5.255	53.443
5.272	47.322
5.410	55.519
5.448	53.770
5.485	49.399
5.543	51.913
5.679	53.661
5.757	55.628
5.966	48.415
5.986	50.164
6.121	51.038
6.293	45.792
6.448	48.852
6.467	48.306
6.873	53.224
7.144	58.689
7.201	56.612
7.221	58.798
7.431	52.240
7.547	54.098
7.587	60.328
7.624	55.410
7.701	53.115
7.913	54.426
7.952	55.956
8.896	55.847
9.050	58.251
9.800	53.115
9.915	52.022
10.494	55.191
11.727	57.377
13.308	63.060];
data.tL_f(:,1) = 365 * (data.tL_f(:,1) + 0.5);  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAbde2006';
%
data.tL_m = [ ... % time (yr), total length (cm)
0.046	22.077
0.085	25.792
0.104	23.279
0.143	24.590
0.355	25.246
0.548	26.011
0.643	24.262
0.701	22.842
0.702	23.607
0.740	26.230
0.779	25.792
0.855	24.153
0.894	25.464
0.951	21.530
0.952	22.732
0.993	32.678
1.009	23.825
1.031	31.475
1.046	19.781
1.067	23.716
1.085	21.639
1.125	25.355
1.299	26.230
1.300	31.475
1.317	24.809
1.535	41.967
1.610	37.268
1.706	34.863
1.841	35.519
2.033	33.115
2.034	34.536
2.071	33.552
2.225	31.257
2.267	43.934
2.340	31.366
2.458	39.344
2.808	48.415
2.843	38.142
2.940	40.546
3.039	49.399
3.115	44.262
3.135	48.306
3.171	39.891
3.290	51.585
3.674	48.087
3.811	52.896
3.982	45.464
4.039	43.825
4.077	43.060
4.078	44.590
4.079	46.995
4.080	51.913
4.195	51.038
4.196	54.098
4.197	56.393
4.366	44.153
4.658	52.022
4.751	43.279
4.813	54.426
5.217	55.519
5.370	50.055
5.505	52.787
5.623	60.000
5.641	55.847
5.928	50.929
5.929	52.896
6.102	52.678
6.274	48.197
6.525	50.929
6.835	56.721
7.066	56.612
7.103	51.257
7.874	52.240
8.357	57.814
9.049	55.301];
data.tL_m(:,1) = 365 * (data.tL_m(:,1) + 0.5);  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAbde2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwp = 0 * weights.Wwp;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01000*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '358JX'; % Cat of Life
metaData.links.id_ITIS = '630218'; % ITIS
metaData.links.id_EoL = '46578579'; % Ency of Life
metaData.links.id_Wiki = 'Diagramma_pictum'; % Wikipedia
metaData.links.id_ADW = 'Diagramma_pictum'; % ADW
metaData.links.id_Taxo = '173034'; % Taxonomicon
metaData.links.id_WoRMS = '218536'; % WoRMS
metaData.links.id_fishbase = 'Diagramma-pictum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diagramma_pictum}}';
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
bibkey = 'GranAbde2006'; type = 'Article'; bib = [ ... 
'author = {Edwin M. Grandcourt and Thabit Z. Al Abdessalaam and Ahmed T. Al Shamsi and Franklin Francis}, ' ... 
'year = {2006}, ' ...
'title = {Biology and assessment of the painted sweetlips (\emph{Diagramma pictum} ({T}hunberg, 1792)) and the spangled emperor (\emph{Lethrinus nebulosus} ({F}orsskal, 1775)) in the southern {A}rabian {G}ulf}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {104}, ' ...
'pages = {75–88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChiuHo2025'; type = 'Article'; bib = [ ... 
'author = {Pei-Sheng Chiu and Shine-Wei Ho and Bo-Hong Yu and Sun-Hon Lin and Yu-Hsin Tu and Yeong-Torng Chu and Shinn-Lih Yeh and Ming-Yih Leu and Cheng-Hsuan Huang}, ' ... 
'year = {2025}, ' ...
'title = {Year-round natural spawning, early ontogeny, and larval rearing of the painted sweetlips, \emph{Diagramma pictum} ({T}hunberg, 1792) in a hatchery: Potential as a new species for mariculture}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {594}, ' ...
'pages = {741380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Diagramma-pictum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

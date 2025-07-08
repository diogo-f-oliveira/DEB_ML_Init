function [data, auxData, metaData, txtData, weights] = mydata_Parapercis_colias

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Pinguipedidae';
metaData.species    = 'Parapercis_colias'; 
metaData.species_en = 'New Zealand blue cod'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0pMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 07];

%% set data
% zero-variate data

data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Carb2004';   
  temp.am = C2K(12.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';
  
data.Lp  = 14.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 45;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BeerWing2013';
  comment.Wwb = 'based egg diameter of 1.17 mm: pi/6*0.117^3'; 
data.Wwp  = 36.7;  units.Wwp  = 'g';  label.Wwp  = 'weight at puberty'; bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.13, see F1';
data.Wwi  = 1.3e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight for females'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.13, see F1; max published weight 2.5 kg';

data.Ri = 0.03*4.9e6/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'BeerWing2013';   
  temp.Ri = C2K(12.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on rel fecundity of 6316 eggs/g at 774 g, TL 36.5 cm, gives 1323 g, which equals Wwi; coorected for unripe eggs with factor 0.03';
  
% uni-variate data
% time-length
data.tL_f = [  ... % yr class (yr), total length (cm)
2.127	12.044
2.465	14.025
2.669	13.788
2.752	15.293
2.921	16.878
2.922	15.610
2.990	14.818
3.008	12.995
3.192	17.036
3.242	17.987
3.277	16.086
3.428	17.908
3.461	20.365
3.497	17.036
3.717	16.878
3.735	15.848
3.968	22.029
3.986	20.206
4.241	18.859
4.461	20.048
4.494	21.553
4.730	23.059
4.944	32.805
5.185	26.307
5.199	31.933
5.218	27.655
5.223	21.553
5.231	33.835
5.235	28.843
5.268	29.794
5.284	31.458
5.385	32.092
5.502	34.152
5.522	30.507
5.572	31.458
5.773	34.707
5.919	19.572
5.945	30.666
5.949	24.564
5.967	23.217
5.968	21.553
5.969	20.998
6.095	34.231
6.097	32.488
6.098	29.952
6.114	31.458
6.167	28.843
6.171	22.187
6.249	32.805
6.250	31.141
6.257	21.157
6.486	32.488
6.487	31.616
6.505	30.349
6.510	21.870
6.656	32.488
6.756	34.628
6.760	28.843
6.911	31.141
6.925	35.024
6.934	22.425
6.950	23.455
6.951	21.395
6.965	26.941
6.983	25.119
6.994	34.390
7.028	33.043
7.030	29.952
7.131	31.458
7.151	27.813
7.181	32.171
7.230	35.499
7.248	33.677
7.284	31.141
7.380	39.540
7.382	35.975
7.405	27.496
7.455	28.526
7.486	32.567
7.521	31.696
7.641	29.715
7.655	33.122
7.676	27.655
7.759	30.032
7.792	32.092
7.858	33.994
7.894	31.062
7.916	23.851
7.924	37.401
7.941	36.450
7.948	25.832
7.963	28.685
7.994	33.122
8.013	29.952
8.061	34.786
8.063	31.775
8.185	27.258
8.211	38.035
8.232	32.726
8.267	31.062
8.285	29.556
8.390	24.010
8.417	34.152
8.452	32.488
8.454	30.111
8.455	28.526
8.457	26.070
8.538	31.379
8.641	29.636
8.659	27.655
8.708	30.428
8.758	31.458
8.958	36.371
8.963	29.873
8.964	28.447
8.978	31.775
8.979	30.745
9.001	23.613
9.011	33.122
9.016	26.307
9.128	36.609
9.164	33.597
9.200	30.349
9.216	31.379
9.235	27.813
9.285	29.239
9.371	27.892
9.415	37.084
9.417	34.311
9.471	30.586
9.486	32.330
9.487	31.300
9.654	34.865
9.670	36.212
9.672	33.281
9.707	31.775
9.773	33.994
9.900	22.742
9.925	36.133
9.944	33.122
9.945	30.586
9.963	29.715
9.978	32.250
9.993	35.182
10.008	37.956
10.212	37.718
10.413	40.967
10.432	38.193
10.434	34.152
10.435	32.964
10.622	32.805
10.688	35.578
10.689	33.994
10.708	31.062
10.877	31.696
10.879	28.209
10.905	40.412
10.910	33.201
10.929	29.081
10.962	30.428
11.251	29.952
11.416	36.212
11.520	33.201
11.702	39.778
11.922	39.303
11.941	36.450
11.977	33.201
12.179	36.529
12.416	36.054
12.449	37.242
13.226	40.887
14.959	35.737
17.955	41.759];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(12.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Carb2004';
%
data.tL_m = [  ... % yr class (yr), total length (cm)
2.903	18.067
3.024	14.897
3.428	18.859
4.733	18.542
5.001	22.900
5.383	34.469
5.489	28.605
5.503	32.884
5.670	37.322
5.674	31.062
5.709	28.526
5.721	35.895
5.741	31.933
5.828	28.526
5.878	30.507
5.946	29.873
5.958	35.499
5.959	34.865
6.109	39.382
6.130	33.201
6.198	32.250
6.246	36.609
6.248	33.914
6.250	30.507
6.384	33.835
6.397	39.699
6.419	31.933
6.439	27.100
6.467	36.133
6.536	34.865
6.623	30.190
6.626	26.783
6.642	28.130
6.741	32.567
6.775	31.300
6.855	38.431
6.879	28.764
6.890	37.797
6.897	27.496
6.943	33.597
7.062	33.914
7.160	38.590
7.215	32.409
7.218	28.447
7.296	38.035
7.452	33.281
7.502	33.835
7.635	38.431
7.688	34.707
7.699	44.453
7.738	35.816
7.754	37.401
7.787	39.144
7.791	32.884
7.889	39.144
7.909	34.073
7.921	41.204
7.923	38.273
7.939	39.778
7.959	35.658
7.969	45.008
7.972	41.601
7.973	40.016
7.975	36.688
8.013	30.745
8.018	22.821
8.192	41.838
8.194	38.035
8.201	28.764
8.398	38.273
8.467	36.609
8.482	38.906
8.484	35.975
8.636	37.401
8.656	32.567
8.684	40.887
8.700	42.868
8.707	31.537
8.954	42.710
9.113	33.677
9.126	39.382
9.177	38.114
9.299	34.073
9.393	44.453
9.446	41.284
9.451	35.103
9.532	40.333
9.590	29.794
9.666	42.710
9.682	43.185
9.990	39.540
10.006	41.521
10.048	29.239
10.221	48.494
10.228	39.144
10.234	29.636
10.408	47.544
10.464	40.571
10.465	39.223
10.468	34.548
10.474	50.079
10.903	42.393
10.936	44.849
10.964	27.575
10.989	41.284
11.277	41.442
11.415	37.242
11.429	42.235
11.430	39.857
11.942	35.261
11.955	41.046
12.210	40.491
12.639	32.647
12.682	43.899
13.208	42.314
13.446	41.680
13.464	40.808];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(12.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Carb2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 15 * weights.tL_f;
weights.tL_m = 15 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4D7KG'; % Cat of Life
metaData.links.id_ITIS = '170968'; % ITIS
metaData.links.id_EoL = '46573406'; % Ency of Life
metaData.links.id_Wiki = 'Parapercis_colias'; % Wikipedia
metaData.links.id_ADW = 'Parapercis_colias'; % ADW
metaData.links.id_Taxo = '183002'; % Taxonomicon
metaData.links.id_WoRMS = '276989'; % WoRMS
metaData.links.id_fishbase = 'Parapercis-colias'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parapercis_colias}}';
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
bibkey = 'Carb2004'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2004.9517231}, ' ...
'author = {Glen Carbines}, ' ... 
'year = {2004}, ' ...
'title = {Age determination, validation, and growth of blue cod \emph{Parapercis colias}, in {F}oveaux {S}trait, {N}ew {Z}ealand}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {38(2)}, ' ...
'pages = {201-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeerWing2013'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2013.789440}, ' ...
'author = {Beer, N. and Wing, S. and Carbines, G}, ' ... 
'year = {2013}, ' ...
'title = {First estimates of batch fecundity for \emph{Parapercis colias}, a commercially important temperate reef fish}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {47(4)}, ' ...
'pages = {587–594}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Parapercis-colias.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


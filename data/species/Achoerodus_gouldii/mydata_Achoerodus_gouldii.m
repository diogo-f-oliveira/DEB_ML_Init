function [data, auxData, metaData, txtData, weights] = mydata_Achoerodus_gouldii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Achoerodus_gouldii'; 
metaData.species_en = 'Western blue groper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 08];

%% set data
% zero-variate data

data.ab = 9.5;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 15*365;   units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'CoulHesp2009';
  temp.ap = C2K(18.2);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 70*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHesp2009';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 65.3;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'CoulHesp2009'; 
data.Li  = 90;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'CoulHesp2009';
data.Lim  = 116;    units.Lim  = 'cm';  label.Lim  = 'ultimate standard length for males'; bibkey.Lim  = 'CoulHesp2009';
  comment.Lim = 'fishbase gives TL 175 cm';

data.Wwb  = 2.7e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 2e4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.06, see F1';

data.Ri  = 402912/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
0.415	9.028
0.416	5.090
1.032	11.238
1.109	13.453
1.187	9.268
1.418	16.650
1.727	15.171
1.958	20.584
1.959	11.230
2.421	12.210
2.575	15.163
2.652	21.809
2.884	24.514
2.961	18.852
3.115	15.650
3.192	24.265
3.193	19.342
3.269	14.418
3.347	26.480
3.578	28.447
3.732	21.799
3.733	31.646
3.810	25.491
3.811	29.183
3.887	18.105
4.041	34.351
4.195	36.811
4.427	37.301
4.428	22.777
4.429	31.147
4.504	28.438
4.581	31.884
4.967	29.665
5.121	40.495
5.198	22.278
5.275	43.201
5.276	24.000
5.352	29.415
5.430	41.477
5.431	33.353
5.432	28.430
5.584	26.459
5.738	46.151
5.739	42.705
5.892	37.042
5.893	34.826
6.047	40.733
6.278	43.685
6.355	35.560
6.432	48.360
6.433	44.914
6.434	24.975
6.510	34.574
6.587	39.005
7.204	52.292
7.205	31.860
7.281	46.876
7.282	42.691
7.358	41.213
7.359	36.536
7.435	38.997
7.667	50.565
7.668	33.825
7.821	48.102
7.898	37.516
7.975	59.670
8.053	57.454
8.130	48.345
8.131	40.714
8.207	55.483
8.361	50.066
8.362	44.158
8.438	33.326
8.593	38.986
8.747	52.524
8.977	57.199
8.978	43.414
8.979	32.829
9.133	52.521
9.210	54.736
9.441	50.795
9.518	56.702
9.827	44.391
10.213	60.634
10.214	47.095
10.215	38.972
10.367	41.432
10.521	58.908
10.522	49.308
10.598	57.185
10.753	48.814
10.907	60.628
10.984	43.642
10.985	66.289
11.061	57.180
11.138	47.087
11.215	50.779
11.370	53.485
11.447	50.038
11.601	45.360
11.833	65.543
11.834	54.712
11.910	57.911
12.064	62.341
12.296	69.477
12.373	67.507
12.450	55.445
12.527	60.121
13.067	54.701
13.221	56.176
13.453	52.235
13.454	58.143
13.607	61.096
13.993	68.970
14.147	52.968
14.378	58.873
14.533	69.703
14.687	52.963
14.764	64.286
14.841	70.193
15.150	65.759
15.151	56.651
15.304	56.157
15.381	59.357
15.536	64.525
15.844	76.584
15.998	60.090
16.153	75.597
16.307	57.871
16.693	78.300
16.694	65.499
17.001	72.389
17.079	64.018
17.233	67.217
17.234	78.295
17.696	62.044
17.850	58.350
17.927	70.903
17.928	80.504
18.313	57.607
18.467	67.206
18.699	79.266
18.853	72.126
19.161	65.230
19.239	68.676
19.393	63.013
19.624	82.704
19.779	69.902
20.010	72.608
20.087	57.591
20.164	55.129
20.550	65.710
20.781	56.108
21.090	84.414
21.476	68.656
22.016	77.021
22.017	60.527
22.093	66.435
22.324	62.002
22.633	68.153
22.942	78.489
22.943	76.027
22.944	74.550
22.945	62.734
23.173	73.071
23.250	60.516
23.636	80.206
24.099	58.293
24.330	54.598
24.407	60.260
24.793	70.103
25.333	75.267
25.719	77.233
25.796	77.725
26.105	68.860
26.258	72.305
26.259	63.689
26.413	76.488
27.185	71.804
27.416	82.633
27.493	68.601
28.342	70.809
29.267	68.339
33.048	69.782
33.202	67.319
33.203	71.750
34.051	60.664
34.436	69.523
34.591	62.875
35.053	84.287
35.131	87.241
35.208	71.239
37.368	62.358
38.834	70.714
40.145	60.117
41.148	72.170
47.088	84.671
50.020	61.997];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.75) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(18.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHesp2009';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
16.076	72.890
17.387	65.739
19.393	74.829
19.470	86.398
21.553	78.256
22.633	84.400
22.710	79.722
23.944	98.173
24.176	80.693
24.484	88.568
24.870	94.472
25.487	100.375
25.719	96.188
26.182	93.722
26.259	82.890
29.267	86.063
29.345	90.493
29.499	82.614
29.576	92.707
29.808	75.227
31.273	88.506
31.350	100.568
31.890	76.931
32.585	86.525
33.048	76.182
33.202	103.505
33.588	83.562
35.362	88.223
36.519	91.659
36.982	82.793
39.296	97.049
42.305	90.622
43.154	106.369
43.925	93.315
47.011	94.272
48.400	105.090
49.325	96.466
49.480	91.542
50.174	100.151
51.254	106.542
53.568	82.642
54.340	88.790
57.426	113.378];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.75) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(18.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHesp2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.06';
metaData.bibkey.F1 = 'CoulHesp2009'; 
F2 = 'Females of around 65.3 cm may change to males; all are born as female';
metaData.bibkey.F2 = 'CoulHesp2009'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '64GWL'; % Cat of Life
metaData.links.id_ITIS = '170746'; % ITIS
metaData.links.id_EoL = '46572112'; % Ency of Life
metaData.links.id_Wiki = 'Achoerodus_gouldii'; % Wikipedia
metaData.links.id_ADW = 'Achoerodus_gouldii'; % ADW
metaData.links.id_Taxo = '160084'; % Taxonomicon
metaData.links.id_WoRMS = '279497'; % WoRMS
metaData.links.id_fishbase = 'Achoerodus-gouldii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Achoerodus_gouldii}}';
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
bibkey = 'CoulHesp2009'; type = 'Article'; bib = [ ... 
'author = {Coulson, P.G. and S. Alex Hesp and N.G. Hall and I.C. Potter}, ' ... 
'year = {2009}, ' ...
'title = {The western blue groper (\emph{Achoerodus gouldii}), a protogynous hermaphroditic labrid with exceptional longevity, late maturity, slow growth, and both late maturation and sex change}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {107}, ' ...
'pages = {57-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Achoerodus-gouldii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


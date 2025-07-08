function [data, auxData, metaData, txtData, weights] = mydata_Mora_moro

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Moridae';
metaData.species    = 'Mora_moro'; 
metaData.species_en = 'Common mora'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA', 'MPS', 'MIS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 13];

%% set data
% zero-variate data;

data.am = 40*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'VieiFigu2013';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 34;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase';
data.Li  = 80;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RotlMora2013';
  comment.Wwb = 'based guessed egg diameter of 0.5 mm: pi/6*0.05^3; Vitellinic oocyte has diameter 0.25 mm'; 
data.Wwp = 402;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00603*Lp^3.15, see F1';
data.Wwi = 6e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.15, see F1';

data.Ri = 3.8e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.6';

% uni-variate data

% time-length
data.tL_f= [ ... % time since birth (yr), total length (cm) 
8.727	28.603
9.305	30.626
15.016	39.748
15.209	38.740
15.979	42.205
15.979	41.340
16.941	44.086
17.070	41.637
18.096	45.103
18.545	42.368
18.802	47.847
18.995	46.695
19.123	43.958
19.701	43.385
19.829	47.134
20.021	39.784
21.176	47.144
22.267	46.575
22.267	49.169
22.973	47.012
23.294	45.429
23.358	48.745
24.000	50.768
24.321	52.932
25.027	50.054
25.283	52.507
26.053	53.665
26.118	60.296
26.246	58.712
26.310	55.541
26.374	57.559
26.439	52.082
26.439	56.695
27.016	55.114
27.080	50.934
27.144	60.304
27.144	59.871
27.144	57.853
27.144	54.250
27.209	61.457
27.209	53.097
27.337	56.413
27.914	55.408
28.043	56.707
28.107	53.248
28.299	60.024
28.941	53.109
29.005	57.723
29.070	56.714
29.968	60.324
30.096	54.559
30.160	61.767
31.187	56.873
31.187	60.621
31.187	61.486
31.957	60.338
32.086	62.790
32.150	61.349
32.150	59.475
32.214	58.611
32.214	56.304
32.342	64.377
32.856	62.940
33.048	59.770
33.048	60.346
33.048	61.644
33.048	64.671
34.075	64.390
34.075	56.750
34.139	65.111
34.139	62.228
34.139	60.498
34.203	59.057
34.267	59.779
34.973	60.648
35.102	60.505
35.102	64.685
35.102	66.559
35.166	62.812
35.166	68.578
35.230	58.344
35.294	63.534
35.936	56.908
36.000	59.791
36.000	60.944
36.000	61.665
36.064	56.044
36.064	58.206
36.064	62.818
36.128	64.260
36.963	66.573
37.091	60.664
37.091	58.069
37.155	64.124
37.155	62.538
37.861	56.489
37.925	59.084
37.989	62.400
38.118	63.122
38.952	60.245
39.016	58.371
39.016	59.380
39.016	61.687
39.080	63.561
39.209	65.147
39.273	67.310
40.107	66.163
40.171	64.434
40.171	61.551
40.235	62.849
40.299	67.462
41.070	58.098
41.070	61.701
41.070	62.999
41.134	59.828
41.198	64.729
41.198	67.036
41.262	65.883
42.995	67.625
43.123	69.932
43.123	65.752
43.123	62.004
43.123	59.410
43.187	69.212
43.187	62.582
43.251	63.591
44.086	68.210
44.214	62.445
44.214	69.652
44.278	66.337
45.112	70.523
45.176	62.884
45.305	65.191
46.139	68.801
46.139	67.792
46.139	66.351
46.203	65.198
46.909	64.194
47.102	70.682
47.936	66.940
48.000	65.355
48.193	67.951
49.027	65.651
49.091	64.354
50.053	69.406
50.053	68.397
50.246	66.524
50.246	65.083
51.144	64.224
52.171	68.700
53.198	68.708
53.198	71.591
54.096	70.300
54.225	67.850
54.225	65.112
55.059	67.280
55.251	70.596
57.241	69.602
59.102	70.480];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.75) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'VieiFigu2013';
%
data.tL_m= [ ... % time since birth (yr), total length (cm) 
8.086	23.986
9.176	22.408
9.882	28.612
11.230	31.793
11.872	32.230
12.064	33.240
12.128	34.682
13.155	33.536
13.155	32.383
13.797	35.991
13.925	33.254
14.182	34.697
14.824	36.143
15.016	32.397
15.080	33.694
15.209	34.272
15.594	36.725
16.235	35.144
16.364	37.740
16.684	36.877
16.813	39.473
16.941	41.203
17.005	41.924
17.198	36.016
17.198	38.899
17.262	37.746
17.326	40.774
17.711	41.929
17.775	39.912
17.904	36.453
18.096	39.482
18.225	36.023
18.289	41.069
18.289	38.042
18.353	42.799
18.738	39.631
18.930	42.803
19.059	37.903
19.059	44.534
19.123	36.750
19.251	41.220
19.444	43.960
19.765	41.800
19.829	45.837
19.893	38.197
20.021	42.811
20.086	44.829
20.150	36.902
20.791	44.114
20.984	46.566
20.984	42.530
21.112	45.846
21.112	37.485
21.176	39.936
21.369	47.866
21.561	44.408
22.075	45.997
22.203	48.592
22.203	44.412
22.267	43.548
23.679	45.288
23.807	46.874
24.064	48.462
24.898	49.621
25.091	46.307
25.219	45.155
26.053	49.341
26.118	47.612
27.080	47.763
27.209	49.061
27.401	49.783
27.914	50.075
28.235	48.636
29.005	50.659
29.134	49.075
29.968	51.243
29.968	49.225
30.096	52.830
30.610	52.689
30.930	52.259
31.059	49.521
31.251	50.676
32.214	51.115
32.214	49.529
32.278	51.836
32.856	52.705
32.984	49.391
33.048	54.292
33.176	51.122
33.818	53.000
34.011	55.308
34.075	49.975
34.139	54.012
34.332	52.139
35.102	52.721
35.230	51.281
35.358	49.985
36.385	50.857
36.898	52.734
37.861	54.759
38.053	51.445
38.182	53.032
38.952	53.037
39.016	51.164
39.016	56.930
39.144	55.633
40.043	53.334
41.005	55.214
45.048	54.523];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.75) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'VieiFigu2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight Ww in g = 0.00603*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44BYK'; % Cat of Life
metaData.links.id_ITIS = '164687'; % ITIS
metaData.links.id_EoL = '46565012'; % Ency of Life
metaData.links.id_Wiki = 'Mora_moro'; % Wikipedia
metaData.links.id_ADW = 'Mora_moro'; % ADW
metaData.links.id_Taxo = '180342'; % Taxonomicon
metaData.links.id_WoRMS = '126497'; % WoRMS
metaData.links.id_fishbase = 'Mora-moro'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mora_moro}}';
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
bibkey = 'VieiFigu2013'; type = 'Article'; bib = [ ... 
'author = {Ana Rita Vieira and Ivone Figueiredo and C\''{a}tia Figueiredo and Gui M. Menezes}, ' ... 
'year = {2013}, ' ...
'title = {Age and growth of two deep-water fish species in the {A}zores {A}rchipelago: \emph{Mora moro} ({R}isso, 1810) and \emph{Epigonus telescopus} ({R}isso, 1810)}, ' ...
'journal = {Deep-Sea Research II}, ' ...
'doi = {10.1016/j.dsr2.2013.02.016}, ' ...
'volume = {98}, ' ...
'pages = {148–159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RotlMora2013'; type = 'Article'; bib = [ ... 
'author = {Guiomar Rotllant and Joan Moranta and Enric Massut\''{i} and Francisco Sard\`{a} and Beatriz Morales-Nin}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of three gadiform fish species through the {M}editerranean deep-sea range (147-1850 m)}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {66(2)}, ' ...
'pages = {157-166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.org/summary/Mora-moro.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


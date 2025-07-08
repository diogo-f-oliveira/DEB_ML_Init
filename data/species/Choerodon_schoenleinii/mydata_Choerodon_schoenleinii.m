function [data, auxData, metaData, txtData, weights] = mydata_Choerodon_schoenleinii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Choerodon_schoenleinii'; 
metaData.species_en = 'Blackspot tuskfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 02];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SayeGibs1996';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 100;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 209; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'fishbase: based on 0.01288*Lp^3.05, see F1';
data.Wwi = 16.2e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01288*Li^3.05, see F1; max published weight 15.5 kg';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
1.403	23.780
1.422	26.614
1.442	22.362
1.461	16.850
1.481	25.197
1.558	20.000
1.617	24.724
1.636	27.402
1.656	31.496
1.656	20.787
1.675	29.291
1.675	26.299
1.695	23.622
1.734	22.047
1.773	28.031
1.792	33.543
1.792	23.780
1.831	25.039
1.851	32.913
1.851	22.835
1.870	28.504
1.870	20.945
1.890	31.654
1.909	23.307
1.968	29.764
1.987	26.929
2.065	23.937
2.065	25.827
2.065	27.087
2.104	28.819
2.162	31.496
2.162	29.291
2.182	24.724
2.201	27.874
2.201	27.244
2.201	26.142
2.221	33.386
2.260	28.189
2.299	30.394
2.338	29.449
2.416	34.803
2.416	31.339
2.435	32.756
2.435	28.661
2.474	37.638
2.532	36.378
2.532	34.173
2.591	34.646
2.591	33.228
2.649	38.898
2.669	42.520
2.708	39.055
2.708	41.575
2.727	35.748
2.747	36.220
2.766	41.260
2.786	37.323
2.805	27.087
2.844	36.378
2.844	34.173
2.844	31.969
2.844	29.449
2.844	28.819
2.883	30.709
2.903	39.685
2.903	34.646
2.903	32.756
2.922	37.323
2.961	41.417
2.961	35.276
3.039	27.874
3.078	41.102
3.117	43.150
3.136	33.701
3.156	37.008
3.156	38.740
3.175	29.134
3.214	32.283
3.292	34.803
3.351	42.362
3.351	35.433
3.351	37.323
3.390	44.882
3.390	33.543
3.468	46.457
3.506	48.819
3.604	44.409
3.623	42.362
3.643	45.512
3.682	52.441
3.701	43.465
3.740	45.039
3.760	41.732
3.838	34.803
3.838	33.228
3.877	43.465
3.916	49.449
3.916	51.496
3.935	44.409
3.974	46.772
4.169	45.512
4.188	40.000
4.208	42.205
4.208	47.874
4.247	50.709
4.247	49.291
4.286	38.898
4.305	44.567
4.442	52.283
4.461	42.205
4.519	49.606
4.558	53.701
4.558	44.252
4.578	51.496
4.617	49.291
4.695	43.622
4.734	41.260
4.773	54.016
4.773	48.504
4.929	54.488
4.987	38.898
5.065	47.559
5.123	48.661
5.123	54.173
5.143	50.079
5.201	54.331
5.201	49.291
5.357	51.811
5.357	54.331
5.532	51.339
5.552	45.512
5.571	53.228
5.727	56.850
5.922	57.008
5.981	43.937
6.058	64.409
6.097	59.528
6.253	49.449
6.487	53.701
6.506	51.339
6.740	58.110
6.818	51.969
8.084	56.063
8.942	53.228
9.175	55.748
11.084	56.220
11.240	58.110
11.649	53.228];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisKana2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
3.273	40.315
3.955	48.819
4.403	53.543
4.442	55.433
4.558	50.866
4.597	57.008
4.812	57.323
5.474	60.000
5.766	55.276
6.058	53.858
6.234	56.535
6.682	59.843
6.818	56.378
6.857	54.961
6.916	66.614
6.935	61.890
7.461	59.843
7.968	53.858
8.805	64.567
8.825	65.354
9.156	61.102
9.331	67.402
9.740	65.827
10.325	64.724
10.461	62.047
10.519	57.165
10.929	76.378
11.942	65.197
11.961	46.929
11.961	68.819
12.175	74.488
13.948	63.465
14.026	73.386
15.117	73.071
16.500	64.252
17.766	77.165];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisKana2010';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % total length(cm), fecundity (#)
24.270	119210.888
25.441	116956.400
26.100	82073.077
26.108	109214.965
26.157	69368.445
28.229	149734.871
29.456	162526.344
29.590	139680.004
31.034	226886.944
31.240	144075.458
32.619	296175.653
33.297	158870.344
33.548	245847.351
33.790	276445.103
35.100	373417.706
35.591	290010.240
35.765	343007.120
36.602	217638.675
37.125	232612.917
37.146	398289.445
37.305	261593.440
37.768	440194.559
38.500	605238.825
38.841	335943.542
39.033	410916.891
39.113	308761.334
39.220	446837.119
40.634	469138.545
40.820	403191.708
41.339	918142.005
45.061	339185.447
46.523	1194565.006
47.306	1435986.034
47.952	810381.347
48.042	506139.648
48.278	598632.321
49.573	1023714.740
50.058	1361638.561
50.998	1057257.962
51.226	835404.763
52.455	938626.496
56.064	1575319.657
56.837	1016948.889
58.356	1572260.864
60.767	2309698.995];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(27.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'EbisKana1995';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length weight: Ww in g = 0.01288*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XYR4'; % Cat of Life
metaData.links.id_ITIS = '170730'; % ITIS
metaData.links.id_EoL = '46571630'; % Ency of Life
metaData.links.id_Wiki = 'Choerodon_schoenleinii'; % Wikipedia
metaData.links.id_ADW = 'Choerodon_schoenleinii'; % ADW
metaData.links.id_Taxo = '170951'; % Taxonomicon
metaData.links.id_WoRMS = '218951'; % WoRMS
metaData.links.id_fishbase = 'Choerodon-schoenleinii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Choerodon_schoenleinii}}';
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
bibkey = 'EbisKana2010'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-010-0244-4}, ' ...
'author = {Akihiko Ebisawa and Kiyoaki Kanashiro and Toshihiko Kiyan}, ' ... 
'year = {2010}, ' ...
'title = {Growth, sex ratio, and maturation rate with age in the blackspot tuskfish \emph{Choerodon schoenleinii} in waters off {O}kinawa {I}sland, southwestern {J}apan}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {76}, ' ...
'pages = {577–583}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EbisKana1995'; type = 'Article'; bib = [ ... 
'author = {Akihiko Ebisawa and Kiyoaki Kanashiro and Toshihiko Kyan and Fumihiko Motonaga}, ' ... 
'year = {1995}, ' ...
'title = {Aspects of Reproduction and Sexuality in the Black-spot \emph{Choerodon schoenleinii}}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {42(2)}, ' ...
'pages = {121-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Choerodon-schoenleinii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


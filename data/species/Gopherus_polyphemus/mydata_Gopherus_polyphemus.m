function [data, auxData, metaData, txtData, weights] = mydata_Gopherus_polyphemus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Gopherus_polyphemus'; 
metaData.species_en = 'Gopher tortoise'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 10];

%% set data
% zero-variate data

data.ab = 190;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'AnAge';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 14*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'MushWils1994';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 13*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'MushWils1994';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 165*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'MushWils1994';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 152 yr';
  
data.Lb = 4.3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'ErnsBarb1989';
data.Lp = 23.5; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for females';   bibkey.Lp = 'MushWils1994';
data.Lpm = 23.0; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'MushWils1994';
data.Li = 29.5; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';   bibkey.Li = 'MushWils1994';
data.Lim = 27.6; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'MushWils1994';

data.Wwb = 38.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ErnsBarb1989';
  comment.Wwb = 'based on egg diameter of 42 mm: pi/6*4.2^3';
data.Wwp = 2780; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = {'AnAge','MushWils1994'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 2607; units.Wwpm = 'g'; label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = {'AnAge','MushWils1994'};
  comment.Wwpm = 'based on (Lpm/Lim)^3*Wwim';
data.Wwi = 5500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'AnAge';
data.Wwim = 4500; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = {'AnAge','MushWils1994'};
  comment.Wwim = 'baes on (Lim/Li)^3*Wwi';

data.Ri  = 7.1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'MushWils1994';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time (d), carapace length (cm)
0.054	5.105
0.054	5.580
0.956	4.847
0.956	5.081
0.956	5.256
0.956	7.357
0.983	5.606
0.983	5.839
0.983	6.073
0.983	6.248
0.983	6.481
0.983	6.831
0.983	7.007
1.939	8.936
1.966	5.901
1.966	6.193
1.966	6.835
1.966	7.360
1.966	7.594
1.966	8.119
1.966	8.294
1.966	8.469
1.966	9.169
1.966	9.870
2.020	7.827
2.048	6.602
2.949	9.290
2.949	9.873
2.949	11.507
2.949	11.740
2.949	11.857
2.976	7.422
2.976	7.597
2.976	7.831
2.976	8.181
2.976	8.414
2.976	8.589
2.976	8.881
2.976	9.056
2.976	9.406
2.976	9.640
2.976	10.282
2.976	10.457
2.976	10.749
2.976	10.924
2.976	12.149
3.932	10.869
3.986	13.320
4.014	8.126
4.014	9.644
4.014	9.877
4.014	10.110
4.014	10.402
4.014	10.577
4.014	12.153
4.014	12.445
4.014	12.678
4.014	12.970
4.014	13.612
4.041	11.044
4.041	11.278
4.041	11.569
4.041	11.920
4.041	13.845
4.041	14.254
4.041	14.779
5.024	10.056
5.024	10.873
5.024	11.106
5.024	11.281
5.024	11.573
5.024	11.981
5.024	12.215
5.024	13.032
5.024	13.382
5.024	13.615
5.024	13.791
5.024	14.082
5.024	14.724
5.024	14.899
5.024	15.191
5.024	15.308
5.024	16.008
5.051	12.390
5.051	12.507
5.051	12.799
5.051	17.175
5.952	14.086
6.007	12.452
6.007	12.919
6.007	14.378
6.007	14.786
6.007	15.136
6.007	15.428
6.007	16.537
6.007	16.887
6.007	18.054
6.007	18.287
6.034	12.335
6.034	13.619
6.034	13.853
6.034	15.720
6.034	16.012
6.034	16.245
6.990	17.241
6.990	17.941
6.990	18.466
7.017	13.506
7.017	20.625
7.044	19.458
7.044	19.692
7.072	14.265
7.072	14.615
7.072	15.257
7.072	15.665
7.072	16.015
7.072	16.249
7.072	16.424
7.072	16.774
7.973	14.793
7.973	20.629
7.973	20.862
7.973	21.329
7.973	21.621
7.973	21.971
7.973	22.496
8.000	15.202
8.000	15.610
8.000	17.770
8.000	18.061
8.000	20.396
8.027	19.287
8.055	16.136
8.055	16.311
8.055	19.637
8.082	16.953
8.082	17.245
8.983	20.866
9.010	19.874
9.010	21.158
9.010	21.566
9.010	23.784
9.065	18.240
9.065	18.532
9.065	18.999
9.993	19.994
9.993	23.146
9.993	29.214
10.020	26.472
10.020	29.448
10.048	21.804
10.048	24.896
10.048	25.305
10.048	25.947
10.976	25.542
11.031	23.441
11.031	27.059
11.031	27.584
11.031	29.743
11.058	20.465
11.058	24.725
11.058	30.444
12.014	21.577
12.014	22.044
12.014	22.569
12.014	23.911
12.014	24.495
12.014	25.604
12.014	27.471
12.942	26.424
12.997	21.989
12.997	22.865
12.997	23.040
12.997	23.915
12.997	25.024
12.997	25.257
12.997	25.432
12.997	25.782
12.997	26.950
12.997	27.183
12.997	27.475
12.997	28.584
13.024	24.382
13.024	24.732
13.980	27.420
13.980	28.645
14.007	24.152
14.007	24.794
14.007	25.611
14.007	26.253
14.007	26.720
14.007	28.004
14.990	27.891
14.990	28.182
14.990	28.474
14.990	28.824
15.044	25.907
15.044	26.257
15.044	26.490
15.044	26.840
16.000	26.435
16.027	27.778
16.027	28.011
16.027	28.419
16.027	28.595
16.027	28.828
17.038	26.556
17.038	27.373
17.038	29.123
17.038	31.633
17.065	28.832
18.048	27.493
19.986	29.251
20.096	27.034
21.078	30.772
21.188	28.788
22.061	28.442
23.072	30.604];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'carapace length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MushWils1994';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), carapace length (cm)
0.054	5.105
0.054	5.580
0.981	7.127
1.008	4.872
1.008	5.347
1.008	5.525
1.008	5.940
1.008	6.296
1.008	6.653
1.008	6.831
1.008	7.305
1.961	5.945
1.989	6.479
1.989	6.776
1.989	6.895
1.989	7.073
1.989	9.210
2.016	7.489
2.016	7.726
2.016	7.963
2.016	8.319
2.016	8.557
2.016	8.735
2.016	9.981
3.024	7.315
3.024	7.612
3.024	7.909
3.024	8.384
3.024	9.690
3.024	9.927
3.024	11.529
3.024	11.708
3.024	11.945
3.051	8.859
3.051	9.096
3.051	9.393
3.051	10.343
3.051	10.580
3.051	10.817
3.977	14.680
4.032	8.211
4.032	12.959
4.032	13.374
4.032	13.493
4.032	14.027
4.059	9.695
4.059	10.051
4.059	10.348
4.059	10.585
4.059	10.822
4.059	11.060
4.059	11.297
4.059	11.594
4.059	11.950
4.059	12.069
4.059	12.306
4.059	12.484
5.012	14.270
5.012	14.566
5.012	14.863
5.012	15.160
5.012	15.338
5.012	15.813
5.012	17.118
5.040	10.234
5.040	11.836
5.040	12.074
5.040	12.370
5.040	12.608
5.040	12.905
5.040	13.914
5.067	10.887
5.067	11.124
5.067	11.421
5.067	11.540
5.067	13.201
5.067	13.380
5.067	13.558
6.020	12.257
6.020	12.494
6.020	13.028
6.020	13.444
6.020	13.681
6.020	13.978
6.020	14.215
6.020	14.453
6.020	14.690
6.020	14.987
6.020	15.343
6.020	15.996
6.020	16.293
6.020	16.471
6.020	16.827
6.020	18.192
6.048	15.580
6.075	17.420
6.075	17.955
7.001	13.448
7.001	15.110
7.001	17.959
7.001	18.315
7.028	15.407
7.028	15.645
7.056	14.220
7.056	14.517
7.056	15.823
7.056	16.120
7.056	16.357
7.056	16.713
7.056	17.247
7.056	19.859
7.056	20.334
7.056	20.630
7.083	19.325
7.982	19.270
7.982	19.626
8.009	14.759
8.036	17.786
8.036	18.024
8.036	18.499
8.091	15.116
8.091	15.353
8.091	15.769
8.091	16.303
8.091	17.015
8.091	17.312
8.091	20.279
8.091	20.695
8.091	21.051
8.091	21.229
8.091	21.526
8.091	21.763
8.091	22.060
8.091	22.594
8.091	23.722
8.990	22.658
9.017	23.014
9.044	20.581
9.044	20.818
9.044	21.056
9.044	23.845
9.072	18.385
9.072	19.750
10.025	21.773
10.025	22.010
10.025	22.129
10.025	22.782
10.052	19.874
10.052	20.230
10.052	21.120
10.052	24.622
10.134	26.165
11.006	22.252
11.006	25.101
11.033	26.645
11.060	23.440
11.959	21.604
11.986	24.631
11.986	25.106
12.014	22.079
12.014	23.682
12.014	24.335
12.014	27.243
12.014	27.480
12.940	24.992
12.940	26.298
12.940	26.773
12.940	27.129
12.940	27.366
12.940	27.663
12.967	22.915
12.967	23.212
12.967	23.924
12.967	24.458
12.967	24.696
12.967	25.823
12.967	26.061
12.994	25.467
12.994	27.901
13.076	22.144
13.921	21.851
13.921	24.641
13.921	24.997
13.975	23.751
13.975	24.107
13.975	24.404
13.975	26.125
13.975	26.303
13.975	26.778
13.975	27.965
14.874	26.129
14.956	22.687
14.956	22.984
14.956	25.240
14.956	26.545
14.956	26.842
14.956	27.020
14.983	24.824
14.983	27.733
14.983	28.148
15.964	23.405
15.964	26.313
15.964	27.084
16.018	28.272
16.917	25.605
16.917	28.929
17.952	25.967
17.952	26.798
17.980	27.213
18.906	28.227
19.941	24.849
19.995	28.113
19.995	28.470
20.023	27.698
20.976	27.228];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'carapace length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MushWils1994';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Large geographic variation in age at maturation';
metaData.bibkey.F1 = 'MushWils1994'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3H2LJ'; % Cat of Life
metaData.links.id_ITIS = '173858'; % ITIS
metaData.links.id_EoL = '456481'; % Ency of Life
metaData.links.id_Wiki = 'Gopherus_polyphemus'; % Wikipedia
metaData.links.id_ADW = 'Gopherus_polyphemus'; % ADW
metaData.links.id_Taxo = '48663'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gopherus&species=polyphemus'; % ReptileDB
metaData.links.id_AnAge = 'Gopherus_polyphemus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gopherus_polyphemus}}';
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
bibkey = 'MushWils1994'; type = 'Article'; bib = [ ... 
'author = {J. H. R. Mushinsky and D. S. Wilson  and E. D. McCoy}, ' ... 
'year = {1994}, ' ...
'title = {GROWTH AND SEXUAL DIMORPHISM OF GOPHERUS POLYPHEMUS IN CENTRAL {F}LORIDA}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {50}, ' ...
'number = {2}, ' ...
'pages = {119--128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Gopherus_polyphemus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gopherus_polyphemus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErnsBarb1989'; type = 'Book'; bib = [ ...  
'author = {C. H. Ernst and R. W. Barbour}, ' ...
'year = {1989}, ' ...
'title  = {Turtles of the world}, ' ...
'publisher = {Smithsonian Institutiun Press, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



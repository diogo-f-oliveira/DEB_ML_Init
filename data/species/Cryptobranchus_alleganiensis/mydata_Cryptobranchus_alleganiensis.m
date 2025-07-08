function [data, auxData, metaData, txtData, weights] = mydata_Cryptobranchus_alleganiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Cryptobranchidae';
metaData.species    = 'Cryptobranchus_alleganiensis'; 
metaData.species_en = 'Hellbender'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 16]; 


%% set data
% zero-variate data

data.ab = 55;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '45-75 d';
data.tp = 5.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-8 yr';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
  comment.Lb = '25-33 mm';
data.Lj  = 11.5;     units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'amphibiaweb'; 
data.Lp  = 38;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'PeteWilk1983'; 
  comment.Lp = 'Niangua hellbenders';
data.Lpm  = 30;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'PeteWilk1983'; 
  comment.Lpm = 'Niangua hellbenders';
data.Li  = 74;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwi = 2500;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 175/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '150-200 eggs per yr';

% univariate data
% length-change in length
data.LdL_b = [... % total length (cm), change in length (mm/month)
17.240	6.576
19.544	4.587
20.859	5.582
20.959	5.250
22.010	4.716
22.833	3.482
22.972	3.739
23.356	3.426
24.013	7.461
24.508	2.450
24.598	2.800
25.785	6.226
26.065	3.058
26.241	0.589
26.407	2.358
26.443	3.205
26.793	1.897
26.882	2.339
26.958	0.221
27.154	3.242
29.606	4.403
30.073	1.474
30.235	3.518
30.528	2.892
32.108	1.824
32.735	1.124
33.632	1.418
34.044	2.542
34.057	1.584
34.155	1.326
34.234	2.505
34.387	1.713
34.537	1.179
34.617	-1.234
34.666	2.137
34.769	1.584
34.772	1.363
35.150	1.437
35.717	1.658
35.825	0.700
36.308	0.074
36.578	1.142
36.831	-0.074
36.859	1.418
36.915	0.774
36.990	-1.253
37.148	1.050
37.378	1.639
37.429	1.345
37.686	-0.129
37.856	1.345
38.050	1.050
38.237	1.271
38.400	-0.295
38.580	0.461
38.641	-0.571
38.848	1.713
39.083	1.842
39.154	0.092
39.157	-0.129
39.327	1.363
39.433	0.534
39.467	1.511
39.525	0.755
39.706	1.418
39.804	4.661
40.106	-0.129
40.627	-0.055
40.759	0.737
40.814	0.166
40.838	1.897
40.856	0.534
41.045	0.626
41.056	-0.147
41.091	0.737
41.100	0.055
41.192	0.313
41.236	0.516
41.359	1.971
41.614	0.626
41.680	2.818
41.800	0.939
41.802	0.774
41.805	0.553
42.178	1.068
42.942	0.718
43.183	0.387
43.704	0.516
43.994	0.111
44.038	0.350
44.362	0.939
44.800	0.129
45.031	0.645
46.050	-1.087
46.175	0.258
46.745	0.166
46.789	0.461
47.732	0.903
49.309	0.055
49.696	-0.479];
data.LdL_b(:,2) = data.LdL_b(:,2)/ 305; % convert mm/month to cm/d
units.LdL_b  = {'cm', 'cm/d'}; label.LdL_b = {'total length', 'change in total length', 'C. a. bishopi'};  
temp.LdL_b   = C2K(18); units.temp.LdL_b = 'K'; label.temp.LdL_b = 'temperature';
bibkey.LdL_b = 'PeteWilk1983';
comment.LdL_b = 'From capture-recapture data of C. a. bishopi from North Fork of White River';

data.LdL_a = [... % total length (cm), change in length (mm/month)
17.949	4.414
18.313	4.602
18.677	6.728
18.920	1.082
19.163	2.689
19.709	3.373
20.194	3.231
21.347	3.727
21.529	3.561
21.711	3.892
21.772	1.884
22.015	2.971
22.075	3.821
22.197	4.010
22.379	3.608
22.561	3.112
22.621	3.325
22.985	2.947
23.228	4.104
23.592	2.757
23.896	2.568
23.956	4.741
23.956	5.545
24.017	1.812
24.017	3.797
24.320	4.245
24.381	3.300
24.502	2.143
24.502	3.489
24.988	2.520
25.291	0.985
25.352	2.662
25.655	3.796
26.141	2.402
26.262	4.386
26.383	3.866
26.444	1.953
26.444	2.685
26.505	3.984
26.505	4.504
26.566	2.969
26.748	2.591
26.990	3.039
27.112	3.181
27.415	7.244
27.597	1.622
27.900	3.747
28.143	1.078
28.265	3.913
28.386	3.653
28.386	2.330
28.629	2.637
28.629	2.849
28.871	3.794
29.114	8.991
29.114	1.550
29.539	2.873
29.782	2.707
29.964	0.959
30.146	0.628
30.570	3.912
30.692	3.297
30.813	2.565
31.056	7.242
31.056	4.502
31.117	5.848
31.117	1.029
31.117	2.588
31.299	2.116
31.541	1.809
31.541	2.494
31.723	3.320
32.269	2.328
32.269	4.123
32.330	7.879
32.391	1.525
32.451	3.249
32.451	3.415
32.512	1.879
32.573	0.981
32.694	3.107
32.876	1.808
32.937	7.454
32.998	5.068
32.998	0.060
33.180	4.406
33.362	-0.058
33.483	2.351
33.604	3.816
33.665	2.044
33.786	3.249
33.847	0.201
34.029	1.784
34.090	2.894
34.211	3.981
34.697	1.807
34.697	1.028
34.818	2.965
34.939	4.571
35.000	2.067
35.182	2.185
35.182	1.996
35.485	-0.059
35.546	2.846
35.789	3.035
36.032	7.027
36.153	1.594
36.214	2.515
36.638	-0.225
36.881	0.790
36.881	-1.099
37.124	1.806
37.245	2.089
37.245	1.664
37.367	7.641
37.367	-1.100
37.549	1.806
37.791	0.932
37.791	0.294
38.034	2.184
38.095	5.089
38.095	3.176
38.095	1.688
38.216	3.577
38.398	1.428
38.459	2.372
38.519	1.758
38.701	2.089
38.823	4.545
39.066	1.073
39.066	0.152
39.915	0.340
40.036	0.813
40.279	0.151
40.279	0.435
40.400	2.088
40.643	0.907
40.825	2.324
40.947	-0.534
41.007	0.151
41.129	1.143
41.250	1.615
41.311	-0.676
41.493	0.906
41.675	-0.015
41.796	1.520
41.917	1.757
42.039	0.008
42.221	2.087
42.342	0.221
42.524	0.008
42.706	0.197
42.949	2.252
43.252	6.150
43.677	0.811
43.677	0.457
43.738	-0.725
43.799	1.614
43.981	0.834
44.163	-0.134
44.284	1.023
44.284	0.102
44.284	-0.560
44.405	8.889
44.405	6.055
44.466	-0.040
45.133	-0.253
45.255	2.842
45.255	-0.654
46.104	0.479
46.468	2.865
46.468	0.479
46.590	-0.112
46.833	0.573
47.015	-0.490
47.075	1.778
47.257	-0.112
47.318	1.447
47.318	-0.655
47.500	1.730
47.621	4.518
47.803	-0.892
47.864	0.147
47.864	0.289
47.864	0.856
48.046	-0.490
48.046	0.856
48.228	-0.113
48.350	0.289
48.532	0.785
48.896	1.824
49.442	1.493
49.442	-0.184
49.442	0.714
49.563	1.800
49.745	-1.483
49.745	0.855
50.231	1.894
50.413	0.099
50.959	0.052
51.201	-1.130
51.201	0.382
51.383	-0.610
51.990	1.823
51.990	0.831
52.354	0.004
52.658	-1.390
52.718	-0.445
52.840	0.169
53.386	0.523
53.447	2.294
53.629	-1.036
54.235	-0.375
54.964	-1.202
55.813	-0.730
55.934	0.852
56.481	-0.589
56.541	-0.329
57.087	-1.062
58.180	-0.023
58.483	0.142
58.726	-0.188
59.393	-0.354];
data.LdL_a(:,2) = data.LdL_a(:,2)/ 305; % convert mm/month to cm/d
units.LdL_a  = {'cm', 'cm/d'}; label.LdL_a = {'total length', 'change in total length', 'C. a. alleganzensis'};  
temp.LdL_a   = C2K(18); units.temp.LdL_a = 'K'; label.temp.LdL_a = 'temperature';
bibkey.LdL_a = 'PeteWilk1983';
comment.LdL_a = 'From capture-recapture data of C. a. alleganzensis from Niangua River';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
38.3  330
39    335
40    280
40.5  500
40.5  350
40.8  381
42.8  430
45.3  405
47.5  640
51    655
55.4  893
42.5  401
43.5  545
43.25 425
44.5  465
45.5  564
42.5  541
46.5  630
50.5  615
48.5  415
55    760
56    975];   
units.LW  = {'cm', 'g'}; label.LW = {'total length', 'wet weught'};  
bibkey.LW = 'Horc2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_a','LdL_b'}; subtitle1 = {'Data for C. a. alleganzensis, bishopi'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';     
D2 = 'C. a. bisshopi is assumed to differ from C. a. alleganzensis by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'No size difference between males and females';
metaData.bibkey.F1 = 'PeteWilk1983'; 
F2 = 'length-weight: Ww in g = 8.4e-7*(TL in mm)^2.9667, but inconsistent with weights mentioned in text';
metaData.bibkey.F2 = 'PeteWilk1983'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6BKKP'; % Cat of Life
metaData.links.id_ITIS = '173587'; % ITIS
metaData.links.id_EoL = '331124'; % Ency of Life
metaData.links.id_Wiki = 'Cryptobranchus_alleganiensis'; % Wikipedia
metaData.links.id_ADW = 'Cryptobranchus_alleganiensis'; % ADW
metaData.links.id_Taxo = '47250'; % Taxonomicon
metaData.links.id_WoRMS = '1498309'; % WoRMS
metaData.links.id_amphweb = 'Cryptobranchus+alleganiensis'; % AmphibiaWeb
metaData.links.id_AnAge = 'Cryptobranchus_alleganiensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cryptobranchus_alleganiensis}}';
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
bibkey = 'PeteWilk1983'; type = 'Article'; bib = [ ... 
'author = {C. I. Peterson and R. F. Wilkinson and M. S. Topping and D. E. Metter}, ' ... 
'year = {1983}, ' ...
'title = {Age and Growth of the {O}zark Hellbender (\emph{Cryptobranchus alleganiensis bishopi})}, ' ...
'journal = {Copeia}, ' ...
'volume = {1}, ' ...
'pages = {225--231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Horc2010'; type = 'Phdthesis'; bib = [ ... 
'author = {D. C. Horchler}, ' ... 
'year = {2010}, ' ...
'title = {Long-term growth and monitoring of the Eastern Hellbender (\emph{Cryptobranchus a. alleganiensis}) in Eastern {W}est {V}irginia}, ' ...
'school = {Marchall University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Cryptobranchus+alleganiensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cryptobranchus_alleganiensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


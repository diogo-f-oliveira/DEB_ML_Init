function [data, auxData, metaData, txtData, weights] = mydata_Sebastolobus_altivelis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastolobus_altivelis'; 
metaData.species_en = 'Longspine thornyhead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 30];

%% set data
% zero-variate data

data.am = 45 *365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'fishbase';   
  temp.am = C2K(4.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 241;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.09, see F1';
data.Wwi = 752;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.09, see F1; mas reported weight 9 kg';
  
data.Ri  = 5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.1);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
0.970	5.870
1.130	6.547
1.917	6.659
1.965	5.699
1.970	6.828
1.978	8.691
2.019	6.151
2.024	7.280
2.027	7.957
2.069	5.530
2.073	6.377
2.184	7.731
2.767	9.311
2.915	7.166
2.919	8.069
2.920	8.352
2.921	8.352
2.922	8.747
2.930	10.497
2.933	11.174
2.979	9.763
2.980	10.101
3.092	11.626
3.126	7.505
3.970	8.746
4.020	8.181
4.070	7.729
4.087	11.342
4.088	11.568
4.090	12.076
4.131	9.479
4.134	10.326
4.147	13.149
4.773	12.414
4.873	11.454
4.933	13.148
4.935	13.599
4.937	13.882
4.971	9.817
4.980	11.906
5.090	12.978
5.126	9.478
5.885	15.066
5.913	9.590
5.931	13.655
5.981	13.034
6.021	10.211
6.032	12.808
6.081	12.017
6.087	13.316
6.134	12.130
6.789	18.000
6.929	14.049
6.984	14.670
6.989	15.686
6.993	16.589
7.029	12.976
7.031	13.540
7.033	13.879
7.039	15.121
7.071	10.774
7.076	11.790
7.106	18.565
7.174	10.323
7.822	14.612
7.895	19.015
7.915	11.789
7.942	17.999
7.945	18.620
7.962	10.773
7.978	14.217
7.981	14.838
7.982	15.120
7.993	17.491
7.997	18.451
8.003	19.862
8.030	14.047
8.038	15.854
8.041	16.531
8.042	16.870
8.044	17.209
8.088	15.346
8.089	15.572
8.860	12.296
8.914	12.692
8.933	16.756
8.935	17.208
8.937	17.716
8.971	13.538
9.033	15.796
9.035	16.248
9.097	18.393
9.136	15.232
9.137	15.514
9.172	11.788
9.186	14.893
9.877	16.924
9.879	17.319
9.880	17.715
9.881	17.771
9.882	17.940
9.979	16.416
9.988	18.392
10.011	11.731
10.024	14.666
10.045	19.295
10.205	20.029
10.866	15.343
10.933	18.730
10.977	16.867
10.985	18.560
10.992	20.141
10.993	20.254
11.000	21.891
11.025	15.850
11.027	16.189
11.029	16.641
11.030	17.092
11.031	17.262
11.032	17.431
11.033	17.657
11.034	17.826
11.035	18.109
11.040	19.125
11.047	20.705
11.089	18.391
11.927	18.277
11.930	18.954
11.973	16.809
11.975	17.374
11.981	18.672
11.986	19.801
11.987	20.083
11.989	20.422
12.030	17.882
12.036	19.293
12.099	21.664
12.129	16.583
12.925	18.840
12.935	21.042
12.937	21.437
12.979	19.179
12.983	20.082
12.990	21.606
12.998	23.413
13.029	18.558
13.033	19.574
13.073	16.695
13.080	18.332
13.087	19.856
13.132	18.106
13.875	20.194
13.926	19.855
13.929	20.589
13.931	21.097
13.974	18.896
13.976	19.347
13.988	22.113
14.020	17.597
14.024	18.387
14.038	21.605
14.127	17.936
14.828	22.451
14.829	22.677
14.918	19.064
14.930	21.717
15.032	21.152
15.033	21.322
15.043	23.580
15.049	24.935
15.071	18.217
15.077	19.402
15.081	20.362
15.082	20.588
15.083	20.814
15.177	18.443
15.932	23.240
15.980	22.055
15.982	22.563
16.027	20.869
16.028	21.264
16.078	20.587
16.083	21.716
16.086	22.393
16.917	20.812
16.922	21.884
16.969	20.586
16.983	23.691
17.865	21.770
17.916	21.375
17.920	22.222
17.963	20.133
17.979	23.802
17.980	23.915
18.019	21.093
18.029	23.351
18.071	20.867
18.939	27.583
18.969	22.390
19.026	23.632
19.029	24.083
19.083	24.535
19.128	22.841
19.183	23.406
19.226	21.317
19.910	21.937
19.921	24.308
19.938	28.260
20.012	21.429
20.024	24.026
20.127	23.631
20.238	24.929
20.910	22.839
20.960	22.331
20.970	24.646
20.971	24.871
21.078	25.267
21.083	26.396
21.139	27.299
22.013	23.515
22.023	25.717
22.816	27.184
22.971	26.619
22.976	27.748
22.983	29.272
23.056	22.159
23.111	22.837
23.115	23.740
23.118	24.474
23.230	25.942
24.063	24.868
24.078	28.199
24.127	27.352
24.795	24.416
24.998	22.835
25.014	26.391
25.017	27.012
25.018	27.351
26.018	28.196
26.061	26.221
26.168	26.559
26.946	24.865
26.954	26.558
26.968	29.776
27.053	25.429
28.053	26.162
28.055	26.613
28.060	27.855
28.062	28.363
28.064	28.702
28.103	25.823
28.154	25.315
28.788	26.443
28.999	26.951
29.940	26.216
29.941	26.498
30.000	27.966
30.042	25.708
30.104	27.853
30.945	28.417
30.993	27.344
30.994	27.570
31.198	26.384
32.047	28.641
32.160	30.504
32.249	26.947
32.977	25.592
32.980	26.269
32.992	28.979
33.038	27.511
33.931	28.131
33.986	28.526
34.093	29.091
34.873	27.678
34.975	27.057
34.991	30.557
35.090	29.428
35.923	28.016
36.026	27.734
36.909	25.870
36.966	26.999
36.971	28.128
36.973	28.466
36.978	29.652
37.907	26.433
38.965	28.690
40.018	29.705
40.892	25.922
40.913	30.494
42.102	26.993
42.117	30.154
42.948	28.572
42.951	29.250
43.046	26.992
44.996	29.360
45.085	25.973];
data.tL(:,1) = 365*(0.3+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(4.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Klin1996';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Wwp is ignored due to inconsistency';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00912*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7ZM'; % Cat of Life
metaData.links.id_ITIS = '166784'; % ITIS
metaData.links.id_EoL = '46568234'; % Ency of Life
metaData.links.id_Wiki = 'Sebastolobus_altivelis'; % Wikipedia
metaData.links.id_ADW = 'Sebastolobus_altivelis'; % ADW
metaData.links.id_Taxo = '187357'; % Taxonomicon
metaData.links.id_WoRMS = '282741'; % WoRMS
metaData.links.id_fishbase = 'Sebastolobus-altivelis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastolobus_altivelis}}';
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
bibkey = 'Klin1996'; type = 'phdthesis'; bib = [ ... 
'author = {Donna E. Kline}, ' ...
'year = {1996}, ' ...
'title = {Radiochemical age verification for deep-sea rockfishes \emph{Sebastolobus altivelis} and \emph{Sebastolobus alascanus}}, ' ...
'school = {San Jose State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastolobus-altivelis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

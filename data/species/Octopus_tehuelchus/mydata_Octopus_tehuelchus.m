function [data, auxData, metaData, txtData, weights] = mydata_Octopus_tehuelchus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_tehuelchus'; 
metaData.species_en = 'Patagonian octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L_f', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 03]; 

%% set data
% zero-variate data

data.am = 3*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'StorOcam2010';   
  temp.am = C2K(16);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 5;    units.Lp = 'cm';   label.Lp = 'dorsal mantle length at puberty';   bibkey.Lp = 'StorOcam2010';
  comment.Lp = 'based on maturing in the second year, combined with tL data';
data.Li = 12;    units.Li = 'cm';   label.Li = 'ultimate dorsal mantle length';   bibkey.Li = 'StorOcam2010';

data.Wwb = 0.004; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based the remark that this species has large eggs';

data.Ni  = 4e3; units.Ni  = '#';   label.Ni  = 'cum reprod at yr 2';     bibkey.Ni  = 'guess';   
  temp.Ni = C2K(16);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Octopus joubini';
 
% uni-variate data
% time-length data
data.tL_fBA = [ ... % time since Aug 1 (month), dorsal mantle length (cm)
0.127	1.277
0.128	0.760
0.129	0.517
1.088	2.524
1.921	2.343
2.817	2.313
2.945	1.796
2.946	2.039
3.009	2.799
3.841	3.013
3.970	2.709
4.034	1.979
4.994	3.105
5.826	2.801
5.954	3.318
6.018	3.653
6.787	3.441
6.851	3.106
7.875	4.445
7.939	3.289
8.835	4.233
8.963	3.990
9.860	2.987
9.924	4.781
10.052	4.021
10.053	4.173
10.884	3.018
10.948	3.200
11.012	5.207
11.013	4.173
11.140	4.721
11.141	4.508
11.907	3.688
11.908	5.056
11.909	5.238
12.101	4.600
12.868	5.361
12.869	4.844
12.933	4.236
12.997	5.574
13.956	4.510
13.957	4.753
13.958	5.149
14.149	5.422
14.981	5.271
14.982	4.845
14.983	4.754
15.942	4.572
15.943	5.241
16.774	6.367
16.775	4.634
16.966	4.938
16.967	4.512
17.990	6.945
17.991	5.243
18.054	5.638
18.055	5.790
18.119	6.581
18.887	6.672
18.951	6.247
19.015	6.034
19.079	5.061
19.847	6.947
19.848	6.551
19.849	5.791
20.936	5.306
21.064	6.644
21.832	5.580
21.896	6.735
21.897	6.066
22.857	6.432
22.920	5.459
22.921	5.125
25.930	5.826
26.954	6.405
31.052	8.901
31.053	7.259];
data.tL_fBA(:,1) = data.tL_fBA(:,1) * 30.5; % convert month to d
units.tL_fBA   = {'d', 'cm'};  label.tL_fBA = {'time', 'dorsal mantle length', 'female'};  
temp.tL_fBA    = C2K(13.5);  units.temp.tL_fBA = 'K'; label.temp.tL_fBA = 'temperature';
bibkey.tL_fBA = 'StorOcam2010';
comment.tL_fBA = 'Data for females, San Antonio Bay August-cohort';
%
data.tL_mBA = [ ... % time since Aug 1 (month), dorsal mantle length (cm)
0.000	0.469
2.071	1.585
3.040	2.201
3.872	2.113
5.933	3.024
6.836	3.464
7.022	3.024
7.034	3.904
7.918	2.996
8.054	3.611
8.066	4.403
9.028	4.550
9.077	3.495
9.137	3.202
10.102	3.496
10.109	3.994
10.875	3.877
11.059	3.291
11.061	3.438
11.139	4.434
11.896	3.614
11.901	3.966
11.911	4.670
13.056	4.172
13.062	4.553
13.065	4.788
13.073	5.345
13.250	4.319
14.143	4.085
14.148	4.437
14.209	4.202
14.215	4.642
15.042	4.203
15.045	4.437
15.049	4.760
16.005	4.438
16.009	4.731
17.030	4.497
17.238	5.553
18.067	5.377
18.190	5.026
18.200	5.671
18.203	5.905
18.209	6.345
19.031	5.642
19.041	6.287
19.092	5.378
20.119	5.555
20.130	6.376
20.959	6.112
21.074	5.233
21.224	6.757
22.102	5.468
23.058	5.117
23.063	5.498
24.082	5.147
26.071	5.412
32.187	7.791
33.198	6.854];
data.tL_mBA(:,1) = data.tL_mBA(:,1) * 30.5; % convert month to d
units.tL_mBA   = {'d', 'cm'};  label.tL_mBA = {'time', 'dorsal mantle length', 'male'};  
temp.tL_mBA    = C2K(13.5);  units.temp.tL_mBA = 'K'; label.temp.tL_mBA = 'temperature';
bibkey.tL_mBA = 'StorOcam2010';
comment.tL_mBA = 'Data for males, San Antonio Bay August-cohort';
%
data.tL_fBD = [ ... % time since Dec 1 (month), dorsal mantle length (cm)
0.000	0.436
2.798	1.543
6.869	3.465
8.020	3.147
8.910	3.758
8.917	2.713
9.811	2.714
9.872	3.062
9.929	4.078
9.940	2.511
10.955	3.325
10.958	2.890
11.782	3.820
11.836	5.184
11.906	4.226
11.911	3.530
12.799	4.402
12.930	3.937
12.996	3.618
12.999	3.154
13.690	4.751
13.819	4.606
13.820	4.403
13.821	4.229
13.875	5.652
14.638	6.059
14.709	5.014
14.834	5.392
15.790	5.654
15.792	5.393
15.793	5.248
15.862	4.522
16.812	5.569
16.879	5.104
17.001	5.859
17.959	5.744
18.728	5.426
18.799	4.323
21.860	4.763
21.918	5.634
22.874	5.751
23.769	5.607
23.891	6.333
23.893	6.130
24.720	6.567
24.845	6.828
24.850	6.218
24.978	6.102
25.864	7.265
25.874	5.755
26.765	6.192
26.884	7.383
27.838	7.848
27.846	6.803
27.851	6.019
28.804	6.630
29.889	6.719
30.850	6.227
30.851	6.053
30.912	6.459
31.872	6.083
32.891	6.346];
data.tL_fBD(:,1) = data.tL_fBD(:,1) * 30.5; % convert month to d
units.tL_fBD   = {'d', 'cm'};  label.tL_fBD = {'time', 'dorsal mantle length', 'female'};  
temp.tL_fBD    = C2K(13.5);  units.temp.tL_fBD = 'K'; label.temp.tL_fBD = 'temperature';
bibkey.tL_fBD = 'StorOcam2010';
comment.tL_fBD = 'Data for females, San Antonio Bay December-cohort';
%
data.tL_mBD = [ ... % time since Dec 1 (month), dorsal mantle length (cm)
0.127	0.500
7.011	3.211
8.985	3.036
8.986	2.447
10.005	1.860
10.006	2.830
10.007	3.213
10.962	3.625
11.026	2.419
11.090	3.037
11.091	2.772
12.045	3.155
12.046	3.391
12.047	3.832
12.938	4.480
12.939	4.185
13.002	3.891
13.065	3.509
13.066	3.391
14.084	4.863
14.085	4.539
14.086	4.186
15.105	4.922
15.232	5.099
16.060	5.041
16.061	5.276
16.062	5.746
17.017	5.541
17.144	4.659
18.036	5.160
18.737	4.513
18.927	4.896
18.928	5.190
18.929	5.396
20.075	5.485
20.076	5.043
20.140	4.749
21.159	5.927
21.988	5.486
22.052	4.280
23.071	5.869
23.135	5.075
24.027	5.576
24.920	5.694
24.983	6.135
25.938	5.253
25.939	6.812
26.003	7.224
27.086	5.872
27.979	6.696
28.042	5.667
28.870	5.755
28.871	7.697
29.061	6.020
30.081	5.756
30.082	5.933
30.910	6.757
31.102	5.639
32.058	7.052];
data.tL_mBD(:,1) = data.tL_mBD(:,1) * 30.5; % convert month to d
units.tL_mBD   = {'d', 'cm'};  label.tL_mBD = {'time', 'dorsal mantle length', 'male'};  
temp.tL_mBD    = C2K(13.5);  units.temp.tL_mBD = 'K'; label.temp.tL_mBD = 'temperature';
bibkey.tL_mBD = 'StorOcam2010';
comment.tL_mBD = 'Data for males, San Antonio Bay December-cohort';
%
data.tL_fEA = [ ... % time since Aug 1 (month), dorsal mantle length (cm)
0.063	0.523
4.002	2.450
5.015	2.670
8.759	2.174
10.909	3.385
11.023	2.560
11.921	3.413
11.973	2.394
12.688	2.560
12.809	2.835
12.999	4.596
13.939	2.807
14.001	3.165
14.009	4.431
14.114	2.284
14.894	3.275
14.895	3.468
14.962	4.541
15.975	4.761
16.025	3.385
16.090	4.128
16.092	4.486
16.864	4.321
16.926	4.624
16.928	4.954
16.981	3.936
17.938	4.817
17.941	5.147
17.990	3.633
18.004	5.752
18.063	5.615
18.951	5.037
18.954	5.450
18.955	5.587
18.956	5.835
19.019	6.330
19.969	6.000
20.024	5.394
20.027	5.780
20.979	5.835
21.156	5.532
21.984	4.844
21.985	4.954
23.054	4.706
23.055	4.899
23.059	5.505
23.948	5.009
24.006	4.817
24.064	4.569
24.956	4.514
24.958	4.734
26.029	4.817
26.092	5.394
26.979	4.514
27.948	7.128
28.058	5.780
28.887	5.147
28.951	5.890
28.953	6.138
29.963	5.972
29.966	6.385
29.968	6.688
29.970	6.963
30.979	6.716
30.982	7.073
31.996	7.569
33.065	7.266
33.956	7.101
36.097	6.908];
data.tL_fEA(:,1) = data.tL_fEA(:,1) * 30.5; % convert month to d
units.tL_fEA   = {'d', 'cm'};  label.tL_fEA = {'time', 'dorsal mantle length', 'female'};  
temp.tL_fEA    = C2K(14);  units.temp.tL_fEA = 'K'; label.temp.tL_fEA = 'temperature';
bibkey.tL_fEA = 'StorOcam2010';
comment.tL_fEA = 'Data for females, El Fuerte August-cohort';
%
data.tL_mEA = [ ... % time since Aug 1 (month), dorsal mantle length (cm)
0.000	2.087
0.062	0.434
0.190	1.843
2.092	1.953
3.880	2.822
4.892	3.066
5.961	3.148
6.970	2.905
8.869	2.608
10.828	2.393
11.008	2.664
11.010	2.962
11.958	2.610
11.961	3.044
12.968	2.638
13.024	2.123
13.029	2.882
13.863	3.235
13.919	2.720
14.093	2.124
14.874	3.452
14.930	2.856
15.892	4.619
15.894	4.890
15.942	3.236
16.899	4.186
16.901	4.457
17.141	4.863
17.856	5.216
17.978	5.704
18.034	5.081
18.089	4.457
18.091	4.783
18.863	4.810
18.873	6.247
18.984	5.054
18.986	5.407
19.097	4.241
19.814	4.757
19.815	5.001
19.876	5.218
19.877	5.407
19.941	6.058
21.003	4.947
21.242	5.219
22.013	4.948
22.075	5.328
22.845	4.948
23.078	4.244
23.084	5.247
23.913	4.868
23.969	4.326
23.971	4.624
24.920	4.435
24.922	4.679
25.989	4.273
26.998	4.246
27.899	5.738
28.010	4.464
29.978	5.631
29.983	6.471
30.939	7.258
31.047	5.604
32.832	6.039
34.979	7.288
35.863	6.312
35.986	6.882];
data.tL_mEA(:,1) = data.tL_mEA(:,1) * 30.5; % convert month to d
units.tL_mEA   = {'d', 'cm'};  label.tL_mEA = {'time', 'dorsal mantle length', 'male'};  
temp.tL_mEA    = C2K(14);  units.temp.tL_mEA = 'K'; label.temp.tL_mEA = 'temperature';
bibkey.tL_mEA = 'StorOcam2010';
comment.tL_mEA = 'Data for males, El Fuerte August-cohort';
%
data.tL_fIS = [ ... % time since Sept 1 (month), dorsal mantle length (cm)
0.000	0.477
4.074	2.156
8.987	1.957
10.904	2.488
11.144	2.123
11.983	2.375
12.822	2.543
13.001	3.244
13.900	3.327
13.901	2.879
14.919	3.411
15.698	3.831
15.997	4.279
16.896	4.503
16.897	4.278
16.956	5.344
17.853	5.371
17.854	5.175
17.855	4.867
18.932	5.090
18.993	5.286
18.994	5.819
19.053	6.296
19.892	5.005
20.011	4.613
21.090	5.061
21.809	4.527
22.887	4.274
22.947	4.667
24.085	4.806
24.086	4.470
24.864	4.217
24.923	4.581
24.924	3.965
24.984	5.759
25.942	4.469
25.943	5.001
26.901	4.804
26.902	4.552];
data.tL_fIS(:,1) = data.tL_fIS(:,1) * 30.5; % convert month to d
units.tL_fIS   = {'d', 'cm'};  label.tL_fIS = {'time', 'dorsal mantle length', 'female'};  
temp.tL_fIS    = C2K(14);  units.temp.tL_fIS = 'K'; label.temp.tL_fIS = 'temperature';
bibkey.tL_fIS = 'StorOcam2010';
comment.tL_fIS = 'Data for females, Islote Lobos September-cohort';
%
data.tL_mIS = [ ... % time since Sept 1 (month), dorsal mantle length (cm)
0.181	0.554
0.303	1.191
10.187	1.841
11.193	1.925
11.904	2.148
11.969	3.006
12.796	2.897
13.028	2.149
13.030	2.399
14.040	3.065
14.042	3.397
14.163	3.840
14.988	3.398
14.990	3.592
16.117	4.147
16.119	4.369
17.008	4.619
17.062	3.955
17.065	4.287
17.780	5.146
18.011	4.233
18.014	4.731
18.960	4.733
18.969	5.951
19.085	5.702
19.906	4.540
19.967	4.789
20.973	4.957
21.859	4.709
22.035	4.515
22.980	4.295
23.094	3.630
23.986	4.296
23.987	4.462
24.990	4.076
25.938	4.299];
data.tL_mIS(:,1) = data.tL_mIS(:,1) * 30.5; % convert month to d
units.tL_mIS   = {'d', 'cm'};  label.tL_mIS = {'time', 'dorsal mantle length', 'male'};  
temp.tL_mIS    = C2K(14);  units.temp.tL_mIS = 'K'; label.temp.tL_mIS = 'temperature';
bibkey.tL_mIS = 'StorOcam2010';
comment.tL_mIS = 'Data for males, Islote Lobos September-cohort';

% length-weight
data.LW = [ ... % dorsal mantle length (cm), wet weight (g)
  1.1 2
  7.8 140.3
  1.4 1.8
  8.7 156.4
  1.05 2.9
  7.8 157.7
  1.9 3.5
  7.3 132.5
  2.1 3.9
  8.4 122.1
  1.34 2.2
  7.7 113.9
  1.5 2.8
  7.5 133.3];
units.LW   = {'cm', 'g'};  label.LW = {'dorsal mantle length', 'wet weight'};  
bibkey.LW = 'StorOcam2010';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.am = 3 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fBA','tL_mBA'}; subtitle1 = {'Data for females, males, San Antonio Bay Aug-cohort'};
set2 = {'tL_fBD','tL_mBD'}; subtitle2 = {'Data for females, males, San Antonio Bay Dec-cohort'};
set3 = {'tL_fEA','tL_mEA'}; subtitle3 = {'Data for females, males, El Fuerte Aug-cohort'};
set4 = {'tL_fIS','tL_mIS'}; subtitle4 = {'Data for females, males, Islote Lobos Sep-cohort'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Temperature in C for tL_B data for t = 0 at Jan 1: T(t)=13.5+8.5*sin((t+50)*2*pi/365))';
D2 = 'Temperature in C for tL_E and tL_I data for t = 0 at Jan 1: T(t)=14+3*sin((t+15)*2*pi/365)';
D3 = 'In view of shrinking in tL data, local food is assumed to follow a year cycle';
D4 = 'males are assumed to differ from females by {p_Am} only';
D5 = 'length at death is ignorned due to starvation seasonal starvation periods';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'This octopus species might survive a first brood and produce a second one, the year after';
metaData.bibkey.F1 = 'StorOcam2010'; 
F2 = 'small eggs with a planktontic larval stage';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'males mature before females';
metaData.bibkey.F3 = 'StorOcam2010'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '74FPX'; % Cat of Life
metaData.links.id_ITIS = '556093'; % ITIS
metaData.links.id_EoL = '399285'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_tehuelchus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_tehuelchus'; % ADW
metaData.links.id_Taxo = '158297'; % Taxonomicon
metaData.links.id_WoRMS = '342032'; % WoRMS
metaData.links.id_molluscabase = '342032'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_tehuelchus}}';
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
bibkey = 'StorOcam2010'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-009-1341-8}, ' ...
'author = {Lorena P. Storero and Mat\''{i}as Ocampo-Reinaldo and Ra\''{u}n A. Gonz\''{a}lez and Maite A. Narvarte}, ' ... 
'year = {2010}, ' ...
'title = {Growth and life span of the small octopus \emph{Octopus tehuelchus} in San Mat\''{i}as Gulf (Patagonia): three decades of study}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {157}, ' ...
'pages = {555-564}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Octopus-tehuelchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


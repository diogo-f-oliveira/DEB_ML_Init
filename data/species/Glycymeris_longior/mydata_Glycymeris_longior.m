function [data, auxData, metaData, txtData, weights] = mydata_Glycymeris_longior

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Arcida'; 
metaData.family     = 'Glycymerididae';
metaData.species    = 'Glycymeris_longior'; 
metaData.species_en = 'Bittersweet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 07]; 

%% set data
% zero-variate data

data.am = 69*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'GimeSoco2020';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.1; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'guess';
data.Lp  = 2; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 4.2;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'GimeSoco2020';

data.Wwb = 5.8e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 55 mum: pi/9*0.0055^3'; 
data.Wdi = 1.3; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Glycymeris_glycymeris';

data.Ri  = 2.5e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';

% uni-variate data

% time-length 
data.tL = [ ... % time since settlement (d), shell height (cm)
0.925	0.696
0.926	0.736
0.927	0.784
0.927	0.816
0.989	0.864
1.045	0.600
1.052	0.929
1.855	1.402
1.856	1.458
1.857	1.530
1.972	1.162
2.034	1.202
2.035	1.274
2.037	1.338
2.777	1.739
2.778	1.787
2.781	1.892
2.782	1.980
2.906	2.044
2.968	2.108
3.019	1.603
3.020	1.635
3.021	1.683
4.004	2.012
4.005	2.077
4.007	2.165
4.008	2.221
4.010	2.293
4.073	2.406
4.074	2.438
4.075	2.502
4.076	2.566
4.990	2.486
4.992	2.550
4.992	2.582
4.993	2.614
4.995	2.727
4.997	2.831
5.000	2.935
5.108	2.261
5.168	2.205
5.851	2.783
5.852	2.823
5.855	2.984
5.856	3.032
5.858	3.096
5.861	3.240
5.911	2.735
5.967	2.454
5.971	2.679
6.031	2.631
6.153	2.599
6.841	3.417
6.890	2.816
6.891	2.880
6.892	2.920
6.954	2.984
6.956	3.072
7.019	3.144
7.020	3.201
7.021	3.257
7.194	2.751
7.931	2.992
7.932	3.057
7.933	3.097
8.052	2.936
8.063	3.490
8.112	2.864
8.122	3.353
8.180	3.217
8.182	3.337
8.920	3.578
9.030	2.977
9.031	3.033
9.033	3.121
9.034	3.169
9.035	3.257
9.036	3.298
9.038	3.402
9.040	3.466
9.882	2.873
9.951	3.226
9.951	3.266
9.953	3.322
9.954	3.378
9.955	3.434
9.957	3.522
9.959	3.635
10.011	3.186
10.070	3.073
11.055	3.491
11.056	3.555
11.057	3.619
11.059	3.699
11.107	3.074
11.109	3.146
11.112	3.314
11.114	3.402
11.969	3.403
11.970	3.475
11.972	3.547
11.973	3.611
11.974	3.675
11.976	3.732
12.086	3.162
12.090	3.363
12.148	3.202
12.947	3.459
12.952	3.724
12.953	3.764
13.009	3.499
13.010	3.563
13.011	3.612
13.065	3.251
13.808	3.796
13.990	3.700
14.050	3.652
14.108	3.532
14.109	3.556
14.166	3.363
14.168	3.492
14.904	3.652
15.023	3.508
15.025	3.580
15.027	3.692
15.029	3.773
15.030	3.821
15.205	3.420
15.940	3.564
15.942	3.621
15.943	3.677
15.944	3.741
15.946	3.829
15.999	3.452
16.008	3.893
16.924	3.902
17.038	3.509
17.040	3.581
17.041	3.629
17.043	3.725
17.044	3.773
17.045	3.854
17.955	3.581
17.957	3.661
17.958	3.725
18.020	3.774
18.022	3.878
18.076	3.525
18.146	3.950
18.994	3.597
18.995	3.646
18.996	3.694
18.997	3.766
18.998	3.814
18.999	3.870
19.002	3.991
19.977	3.919
19.978	3.951
19.979	4.007
20.032	3.606
20.033	3.670
20.034	3.710
20.035	3.798
21.015	3.927
21.016	3.967
21.075	3.863
21.132	3.686
21.133	3.751
21.135	3.807
21.139	4.031
21.933	4.064
21.990	3.823
21.991	3.895
22.048	3.703
22.050	3.775
22.905	3.815
22.906	3.863
22.907	3.904
23.087	3.735
23.091	3.968
23.276	4.056
24.128	3.896
24.129	3.936
24.130	3.992
24.131	4.064
24.188	3.832
24.247	3.760
25.040	3.728
25.041	3.768
25.042	3.816
25.043	3.864
25.044	3.904
25.045	3.984
25.047	4.073
26.079	3.768
26.080	3.832
26.081	3.881
26.081	3.897
26.083	3.953
26.086	4.113
26.145	4.025
26.935	3.841
26.936	3.897
26.995	3.785
26.999	3.969
27.061	4.033
27.062	4.105
27.790	3.841
27.852	3.905
27.853	3.969
27.977	4.042
27.978	4.082
27.979	4.146
29.015	4.034
29.015	4.066
29.017	4.170
29.073	3.889
29.074	3.946
29.075	3.978
29.194	3.841
29.990	3.986
29.991	4.018
29.993	4.114
29.995	4.195
30.049	3.858
30.050	3.914
30.051	3.954
30.910	4.187
30.911	4.235
30.964	3.850
30.966	3.922
30.967	3.978
30.968	4.026
30.970	4.123
31.943	3.947
32.005	3.987
32.006	4.035
32.007	4.083
32.064	3.882
32.131	4.155
32.132	4.203
32.132	4.243
32.987	4.220
33.042	3.947
33.043	3.995
33.044	4.027
33.045	4.075
33.047	4.163
33.049	4.268
33.102	3.875
34.017	3.867
34.019	3.939
34.020	3.987
34.021	4.043
34.022	4.092
34.024	4.172
34.024	4.212
34.026	4.292
34.935	3.964
34.936	4.028
34.942	4.317
35.002	4.260
35.055	3.875
35.059	4.068
35.060	4.116
35.062	4.212
35.912	3.948
35.917	4.205
35.918	4.245
35.919	4.333
36.035	4.004
36.037	4.124
36.093	3.876
36.097	4.068
36.774	4.317
36.949	3.924
36.954	4.189
36.955	4.245
37.072	3.972
37.073	4.012
37.075	4.117
37.075	4.141
37.930	4.117
38.053	4.157
38.053	4.189
38.056	4.350
38.110	3.997
38.231	3.933
38.908	4.181
39.026	3.989
39.029	4.157
39.881	3.997
40.007	4.190
40.984	4.214
41.163	3.998
41.961	4.223
42.018	4.006
42.877	4.223
43.976	4.247
45.014	4.248
45.991	4.248
47.029	4.280
47.945	4.281
48.983	4.281
49.960	4.273
50.998	4.298];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell height'};  
temp.tL    = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GimeSoco2020';
comment.tL = 'Data from El Sotano, Argentine Sea; temperature 10 to 18.2 C';
%
data.tL1 = [ ... % time since settlement (d), shell height (cm)
0.798	0.471
0.920	0.487
1.044	0.560
1.786	1.033
1.845	0.929
2.950	1.226
2.953	1.378
3.935	1.611
3.938	1.748
5.102	1.965
5.282	1.812
5.960	2.141
5.961	2.157
6.940	2.286
7.063	2.318
8.042	2.431
8.042	2.463
9.205	2.568
9.268	2.680
9.760	2.857
9.818	2.696
11.286	2.825
12.202	2.873
12.997	2.930
14.158	2.970
15.257	2.987
16.297	3.083
17.091	3.108
18.007	3.124
19.045	3.148
20.023	3.181
21.001	3.237
21.979	3.294
23.200	3.302
24.117	3.358
24.911	3.391
26.011	3.415
27.109	3.400
28.025	3.416
29.063	3.424
29.858	3.457
30.835	3.465
32.055	3.457
33.033	3.474
34.010	3.482
34.865	3.514
35.903	3.547
37.125	3.563
38.163	3.572
38.957	3.612
39.934	3.628
41.155	3.621
42.072	3.653
42.988	3.669
44.026	3.694
44.637	3.702
45.980	3.710
47.140	3.703];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since settlement', 'shell height'};  
temp.tL1    = C2K(14);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'GimeSoco2020';
comment.tL1 = 'Data from El Sotano, Argentine Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tL1 = 10 * weights.tL1;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data at different food levels'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};


%% Links
metaData.links.id_CoL = '3GFFX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466132'; % Ency of Life
metaData.links.id_Wiki = 'Glycymeris_longior'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3959215'; % Taxonomicon
metaData.links.id_WoRMS = '504499'; % WoRMS
metaData.links.id_molluscabase = '504499'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GimeSoco2020'; type = 'Article'; bib = [ ... 
'doi = {10.1186/s10152-020-0534-x}, ' ...
'author = {Lucas H. Gimenez and Maria del Socorro Doldan and Paula C. Zaidman and Enrique M. Morsan}, ' ... 
'year = {2020}, ' ...
'title = {Age and growth of \emph{Glycymeris longior} ({S}owerby, 1832) clam at the southern edge of its distribution ({A}rgentine {S}ea)}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {74(2)}, ' ...
'pages = {79-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Glycymeris-longior.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Zebrasoma_flavescens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Zebrasoma_flavescens'; 
metaData.species_en = 'Yellow tang'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 03];

%% set data
% zero-variate data

data.am = 41*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TaylRhod2014';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 20;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Tuck1998';
  comment.Wwb = 'based egg diameter of 0.7 mm of Acanthurus lineatus: pi/6*0.07^3'; 
data.Wwp = 4.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01950*Lp^2.98, see F1';
data.Wwi = 147; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01950*Li^2.98, see F1';

data.Ri = 935032/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.190	3.855
0.191	4.611
0.381	4.292
0.382	3.259
0.775	8.783
1.782	10.610
1.941	10.968
1.944	9.775
1.999	9.258
2.056	7.826
2.691	9.137
2.744	9.415
2.798	9.018
2.899	11.204
3.003	11.999
3.008	10.091
3.060	10.608
3.165	11.164
3.699	10.845
3.740	15.179
3.802	12.197
3.803	11.680
3.903	14.304
3.904	13.707
3.905	13.350
3.909	11.878
3.914	9.851
3.967	10.248
4.914	14.342
4.967	14.620
5.019	15.057
5.026	12.353
5.820	14.459
5.824	12.670
5.880	11.755
5.922	16.089
5.927	14.141
5.928	13.505
5.929	13.346
5.930	12.988
5.977	15.294
5.978	14.856
5.981	13.823
6.835	13.224
6.887	13.662
6.939	14.298
6.988	15.689
6.989	15.451
6.990	15.252
6.991	14.854
6.992	14.457
7.898	14.097
7.947	15.807
7.951	14.097
8.002	15.011
8.056	14.574
8.107	15.369
8.806	13.141
8.959	15.447
8.961	15.009
8.962	14.771
9.016	14.055
9.815	14.133
9.863	16.240
9.868	14.411
9.915	16.558
9.927	12.105
10.931	14.966
10.986	14.568
11.034	16.357
11.037	15.244
11.043	13.017
11.087	16.476
11.090	15.522
11.892	14.248
11.943	15.083
11.996	15.282
12.053	13.771
12.260	16.196
12.794	15.678
12.846	15.956
12.901	15.320
12.955	15.002
12.956	14.723
13.005	16.473
13.056	17.268
13.807	15.119
13.809	14.443
13.859	15.835
13.863	14.244
13.966	15.397
13.970	14.085
14.925	15.475
15.029	16.389
15.030	15.832
15.033	14.958
15.034	14.719
15.941	14.002
16.093	16.824
16.095	15.870
16.206	14.359
16.786	16.505
16.950	15.113
16.951	14.755
17.909	14.912
18.013	15.946
18.014	15.389
18.124	14.236
18.863	16.739
18.865	15.904
18.973	15.506
19.027	15.109
19.720	14.710
19.876	16.101
20.090	15.822
20.892	14.668
20.893	14.389
20.944	15.304
20.945	14.986
21.743	15.183
21.848	15.819
21.849	15.461
21.900	16.336
21.901	16.057
22.858	16.214
22.859	16.055
22.864	14.385
22.910	16.930
22.911	16.532
23.821	15.099
23.924	16.292
23.928	14.860
24.142	14.423
24.832	15.455
24.939	15.057
24.940	14.699
24.990	16.051
25.843	15.612
25.897	15.254
25.948	16.367
25.949	16.009
26.909	15.371
27.013	16.325
27.015	15.729
27.865	16.443
27.867	15.807
27.921	15.449
27.922	15.171
28.029	14.653
28.880	15.288
28.882	14.572
28.927	17.554
29.892	15.127
29.947	14.809
31.062	16.079
31.970	14.924
32.020	16.276
32.874	15.717
32.928	15.081
33.994	15.039
37.029	15.192
38.947	15.308
41.014	19.001];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ClaiKien2009'; comment.tL_f = 'Data from Guam';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.883	8.067
0.884	7.670
1.832	11.882
1.943	10.252
1.944	9.974
1.993	11.326
1.994	10.928
2.044	12.280
2.786	13.630
2.789	12.318
2.894	13.113
2.948	12.795
2.951	11.642
3.749	12.117
3.904	13.827
3.911	11.282
3.960	12.753
4.008	14.860
4.009	14.502
4.652	12.911
4.653	12.394
4.756	13.745
4.815	11.598
4.857	15.733
4.866	12.711
4.970	13.347
5.021	14.341
5.022	13.904
5.920	16.924
5.921	16.447
5.923	15.731
5.924	15.373
5.925	14.936
6.721	16.127
6.931	17.240
6.932	16.683
6.941	13.304
7.099	14.099
7.845	13.819
7.892	16.324
7.943	17.079
8.049	17.437
8.099	18.470
8.743	16.799
8.900	17.634
8.905	15.765
9.019	12.902
9.058	18.349
9.061	17.156
9.063	16.480
9.064	16.361
9.065	15.964
9.123	14.214
9.863	16.161
9.911	18.029
9.913	17.353
9.964	18.109
9.965	17.870
9.966	17.632
9.973	14.848
10.017	18.347
10.020	17.075
10.024	15.644
10.131	15.484
10.132	15.325
10.871	17.749
10.875	16.318
10.923	18.186
10.924	18.027
10.925	17.232
10.930	15.642
10.982	16.159
10.983	15.801
10.986	14.648
11.033	16.874
11.089	15.920
11.837	14.964
11.886	16.713
11.935	18.184
11.936	17.787
11.938	16.952
11.939	16.554
11.940	16.355
11.941	15.878
12.044	17.190
12.093	18.860
12.094	18.502
12.790	16.950
12.895	17.785
12.896	17.586
12.947	18.262
13.796	19.334
13.852	18.300
13.853	18.061
13.854	17.823
13.855	17.147
13.904	18.737
13.962	16.868
13.963	16.630
14.014	17.385
14.710	16.151
14.808	19.292
14.815	16.787
14.867	17.065
14.973	17.502
15.929	18.534
16.040	16.586
16.091	17.500
16.145	17.103
16.888	18.175
16.940	18.731
16.945	16.942
16.996	17.538
17.849	17.537
17.850	16.900
17.903	17.179
18.060	18.172
18.061	17.814
18.911	18.489
18.966	18.131
18.967	17.852
18.968	17.057
19.924	18.129
19.927	17.055
19.978	17.850
20.936	18.365
20.990	18.087
20.991	17.928
21.039	19.399
21.842	18.165
21.896	17.926
22.747	18.203
22.801	17.924
23.871	16.292
23.920	17.684
24.719	17.642
24.877	18.556
24.934	17.045
24.984	18.198
25.887	18.992
25.889	18.515
25.944	17.878
25.946	16.924
26.050	18.117
26.051	17.520
26.052	17.083
26.903	18.155
27.006	18.830
27.009	17.916
27.060	18.512
27.064	17.121
27.855	20.340
27.864	16.841
27.914	18.192
27.962	19.942
27.968	17.834
28.019	18.471
28.022	17.397
28.823	16.759
28.873	17.872
28.926	18.111
29.084	18.588
29.828	19.461
29.829	18.944
29.990	18.427
29.993	17.234
29.996	16.280
30.050	16.001
30.051	15.763
30.098	18.069
30.146	20.057
30.900	16.874
30.946	19.379
30.948	18.664
31.058	17.351
31.962	18.025
32.123	17.429
33.133	18.341
34.036	19.055
34.998	18.019
35.049	18.695
35.899	19.767
36.012	17.262
37.077	17.459
37.927	17.974
38.940	17.574
39.896	18.884
40.165	17.930];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ClaiKien2009'; comment.tL_m = 'Data from Guam';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
D1 = 'Males are assumed not to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01950*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5CYHB'; % Cat of Life
metaData.links.id_ITIS = '172297'; % ITIS
metaData.links.id_EoL = '46577104'; % Ency of Life
metaData.links.id_Wiki = 'Naso_lituratus'; % Wikipedia
metaData.links.id_ADW = 'Naso_lituratus'; % ADW
metaData.links.id_Taxo = '46735'; % Taxonomicon
metaData.links.id_WoRMS = '219665'; % WoRMS
metaData.links.id_fishbase = 'Naso-lituratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Naso_lituratus}}';
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
bibkey = 'ClaiKien2009'; type = 'Article'; bib = [ ... 
'doi = {10.3354/meps08114}, ' ...
'author = {Jeremy T. Claisse and Marco Kienzle and Megan E. Bushnell and David J. Shafer and James D. Parrish}, ' ... 
'year = {2009}, ' ...
'title = {Habitat- and sex-specific life history patterns of yellow tang \emph{Zebrasoma flavescens} in {H}awaii, {U}{S}{A}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {389}, ' ...
'pages = {245–255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Naso-lituratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tuck1998'; type = 'Book'; bib = [ ...  
'author = {Tucker, J. W.}, ' ...
'year = {1998}, ' ...
'title  = {Marine Fish Culture}, ' ...
'publisher = {Springer-Science+Business Media}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

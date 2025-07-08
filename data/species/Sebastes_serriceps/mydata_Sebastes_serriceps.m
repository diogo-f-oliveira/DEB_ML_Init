function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_serriceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_serriceps'; 
metaData.species_en = 'Treefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 27];

%% set data
% zero-variate data

data.am = 25*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'ColtLars2007';   
  temp.am = C2K(15.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ColtLars2007'; 
data.Li  = 41;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 89;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','ColtLars2007'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 963;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.GSI  = 0.04;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'ColtLars2007';   
  temp.GSI = C2K(15.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
0.007	9.246
0.037	8.411
0.100	8.732
0.908	9.055
0.940	11.366
0.973	13.164
0.973	13.164
1.000	8.477
1.035	13.550
1.040	19.135
1.065	11.688
1.094	9.826
1.813	15.156
1.938	16.826
1.940	18.624
1.968	14.450
2.901	17.213
2.937	22.350
2.964	18.176
2.997	20.167
2.998	21.451
3.000	23.955
3.090	19.653
3.117	15.031
3.930	21.389
3.991	20.747
3.991	20.747
4.859	18.694
4.892	20.749
4.926	24.601
4.985	20.235
4.988	24.088
4.989	26.592
5.018	23.895
5.173	23.189
5.888	23.833
5.888	24.282
5.920	24.860
5.920	24.924
5.949	22.741
5.950	24.154
5.951	25.117
6.014	26.016
6.016	28.777
6.104	21.843
6.979	29.293
6.979	29.678
7.007	24.798
7.010	28.907
7.039	26.853
7.102	27.752
7.905	21.333
7.938	23.966
7.938	24.158
7.942	28.845
8.001	25.635
8.002	26.598
8.002	27.176
8.003	27.433
8.030	22.232
8.035	29.102
8.932	24.546
8.932	25.188
8.968	30.966
8.996	26.986
9.026	26.023
9.058	26.279
10.985	29.237
11.016	28.146
11.017	30.393
11.044	24.293
11.945	24.745
11.946	26.799
11.978	28.276
12.849	30.076
12.878	27.443
12.973	28.792
13.005	31.039
13.033	26.609
14.062	32.197
14.995	34.254
19.064	34.519
23.008	34.207
23.038	33.500
23.071	35.491
25.056	32.542];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-6; end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(15.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ColtLars2007';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.007	8.668
0.007	8.989
0.098	6.613
0.099	7.384
0.099	7.705
0.907	7.899
0.907	8.028
0.911	13.164
0.940	11.431
0.970	9.312
0.971	10.789
0.971	11.045
0.972	12.073
0.972	12.458
0.973	12.779
0.973	13.742
1.033	10.275
1.875	15.028
1.913	23.760
1.967	13.552
2.029	14.001
2.031	15.992
2.934	19.717
2.995	17.727
2.997	20.167
3.027	18.754
3.059	20.488
3.059	20.745
3.060	21.194
3.867	21.389
3.902	25.883
3.931	23.122
3.931	23.572
3.932	24.728
3.933	26.333
3.959	19.013
3.959	19.591
3.960	21.004
3.965	26.654
3.991	20.105
3.991	20.490
3.993	22.737
4.023	22.159
4.054	21.710
4.084	20.811
4.893	21.776
4.923	21.263
4.957	24.858
4.987	23.638
4.987	23.831
4.988	24.473
4.988	24.601
5.082	25.886
5.919	23.704
5.981	23.448
5.982	24.860
5.982	25.438
5.983	25.695
5.983	25.952
5.983	26.401
5.986	29.547
5.986	29.740
6.013	24.475
6.946	26.981
6.980	30.962
7.069	25.119
7.935	19.985
7.969	23.901
7.969	24.223
7.971	27.304
7.999	23.259
8.033	26.727
8.903	27.371
8.964	25.445
8.968	30.517
8.997	28.398
9.057	25.958
9.058	26.279
9.058	26.600
9.060	28.848
9.120	26.986
9.928	27.758
9.931	31.032
9.961	29.492
9.961	30.005
9.991	28.529
10.021	26.859
10.983	26.797
11.046	27.054
11.050	32.640
11.855	29.367
11.950	31.358
11.978	28.019
11.979	28.854
11.981	32.128
12.042	29.753
12.104	30.138
12.973	29.113
13.003	28.278
13.964	26.226
15.024	30.530
15.024	30.979
15.056	31.878
18.006	31.692
18.098	30.986];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-6; end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(15.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ColtLars2007';
comment.tL_m = 'data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
5.726	3.902
6.527	12.050
7.032	10.501
7.579	13.788
7.705	5.751
8.084	9.018
8.211	13.864
8.463	9.064
8.843	17.161
8.969	17.176
9.222	18.817
9.769	17.273
9.895	22.119
10.232	17.329
10.316	18.949
10.611	23.816
10.864	25.457
11.159	25.492
11.580	33.595
11.917	33.635
12.001	32.035
12.548	28.881
12.549	33.712
12.760	43.399
12.886	36.973
13.012	30.547
13.180	40.229
13.475	43.485
13.728	38.685
13.770	49.962
14.023	45.162
14.276	51.633
14.570	43.617
14.697	56.515
14.992	54.941
15.034	72.659
15.371	61.428
15.708	66.299
15.708	77.571
16.087	69.566
16.803	84.145
17.056	92.227
17.098	82.570
17.899	97.160
17.983	106.832
18.279	119.750
18.320	103.652
18.446	108.498
18.700	140.735
18.910	111.774
18.995	124.667
19.079	134.339
19.206	147.237
19.373	115.051
19.458	139.216
19.542	124.733
19.669	140.852
19.752	116.707
19.755	182.730
19.795	129.595
19.838	147.313
20.006	139.282
20.132	137.687
20.216	136.087
20.217	163.462
20.258	124.820
20.302	168.303
20.343	153.816
20.469	136.117
20.512	176.380
20.596	157.067
20.764	144.204
20.891	158.713
20.933	169.990
20.976	176.436
21.145	202.222
21.227	149.091
21.228	160.364
21.229	184.518
21.270	157.148
21.395	144.281
21.481	171.666
21.522	163.620
21.566	187.780
21.775	171.702
21.861	203.918
22.072	210.385
22.155	186.241
22.197	187.856
22.241	220.067
22.278	104.130
22.283	226.514
22.493	216.877
22.575	171.798
22.576	181.460
22.577	212.056
22.619	204.010
22.747	255.555
22.875	281.335
22.997	191.173
23.040	210.502
23.042	244.319
23.209	210.522
23.253	262.057
23.294	234.687
23.335	208.927
23.547	236.328
23.547	250.821
23.674	271.770
23.842	258.908
23.968	239.599
23.970	289.519
24.009	210.619
24.094	242.835
24.222	267.005
24.223	304.043
24.263	262.179
24.304	233.199
24.305	238.030
24.432	265.421
24.474	268.646
24.476	300.852
24.517	289.585
24.559	275.098
24.559	283.149
24.727	260.625
24.766	202.659
24.811	254.194
24.812	284.790
24.896	278.359
25.024	315.411
25.148	268.728
25.150	320.258
25.277	323.493
25.320	365.367
25.359	289.687
25.361	329.945
25.402	297.744
25.487	329.960
25.617	412.101
25.656	334.811
25.742	371.859
25.781	294.569
25.866	325.175
25.907	289.753
25.953	392.818
26.077	341.304
26.118	315.544
26.161	328.431
26.205	370.304
26.245	326.831
26.375	399.310
26.455	318.805
26.498	339.744
26.539	317.205
26.540	328.477
26.584	384.843
26.670	405.787
26.749	293.076
26.752	359.098
26.795	381.648
26.836	357.498
26.963	372.006
27.007	428.372
27.046	346.251
27.090	401.007
27.128	299.563
27.133	413.895
27.174	381.694
27.343	397.817
27.344	415.531
27.554	404.284
27.590	273.853
27.598	454.209
27.637	378.529
27.809	471.947
27.891	426.869
27.935	452.639
27.973	375.349
27.974	376.959
28.017	405.950
28.060	426.889
28.269	393.098
28.269	402.760
28.313	431.751
28.398	465.577
28.478	357.697
28.607	415.683
28.608	433.397
28.612	531.626
28.776	435.027
28.904	472.080
28.989	486.583
28.989	502.686
29.028	414.124
29.070	420.570
29.198	456.012
29.241	470.510
29.286	544.590
29.495	504.357
29.624	568.785
29.664	522.091
29.744	435.144
29.875	534.999
30.042	512.475
30.212	531.819
30.378	478.699
30.379	515.736
30.424	568.882
30.464	528.629
30.466	564.056
30.501	394.978
30.846	605.970
30.887	562.496
30.927	514.192
30.929	572.163
31.056	578.620
31.097	562.522
31.265	552.880
31.308	565.768
31.432	525.525
31.645	581.912
31.685	520.725
32.069	643.154
32.111	633.498
32.238	654.447
32.323	685.053
32.449	659.303
32.620	730.177
32.785	646.461
33.081	667.431
33.162	611.080
33.337	765.691
33.459	659.425
34.012	786.706
34.302	675.630
34.310	870.478
34.515	744.899
34.562	856.016
34.724	699.836
35.692	682.239];
units.LWw  = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'ColtLars2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwp = 3 * weights.Wwp;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Wwp is ignored due to inconsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7Q4'; % Cat of Life
metaData.links.id_ITIS = '166764'; % ITIS
metaData.links.id_EoL = '46568196'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_serriceps'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_serriceps'; % ADW
metaData.links.id_Taxo = '187335'; % Taxonomicon
metaData.links.id_WoRMS = '274853'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-serriceps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_serriceps}}';
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
bibkey = 'ColtLars2007'; type = 'Article'; bib = [ ... 
'author = {Madhavi A. Colton and Ralph J. Larson}, ' ... 
'year = {2007}, ' ...
'title = {ASPECTS OF THE LIFE HISTORY OF TREEFISH, \emph{Sebastes serriceps} ({S}EBASTIDAE)}, ' ...
'journal = {CalCOFI Rep.}, ' ...
'volume = {48}, ' ...
'pages = {177-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-serriceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

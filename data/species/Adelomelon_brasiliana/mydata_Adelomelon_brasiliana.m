function [data, auxData, metaData, txtData, weights] = mydata_Adelomelon_brasiliana

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Volutidae';
metaData.species    = 'Adelomelon_brasiliana'; 
metaData.species_en = 'Black snail'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 08]; 

%% set data
% zero-variate data

data.tp = 7*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Cled2004';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Temp varies between 6.5 and 21 C';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Cled2004';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.69; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'ArriPenc2018';
  comment.Lb = 'based on same relative length compared to Adelomelon_beckii: 1.72*20/49.5';
data.Lp  = 11.5; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty for female'; bibkey.Lp  = 'Cled2004';
data.Lpm = 10.7; units.Lpm  = 'cm'; label.Lpm = 'shell length at puberty for male';   bibkey.Lpm = 'Cled2004';
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'Cled2004';

data.Ri  = 246/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.8';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.964	6.054
0.983	5.164
1.947	7.954
1.986	7.525
2.006	6.420
2.006	6.727
2.006	7.034
2.006	7.156
2.026	7.279
2.950	7.891
2.950	8.106
2.970	8.597
2.970	8.719
2.970	8.995
2.989	7.186
2.989	7.339
2.989	7.523
3.009	7.032
3.009	8.259
3.009	8.351
3.933	10.221
3.953	7.522
3.953	7.890
3.953	8.503
3.953	8.626
3.953	8.871
3.953	9.086
3.953	9.822
3.992	9.423
4.956	8.532
4.956	8.747
4.975	8.011
4.975	9.299
4.975	9.483
4.975	9.729
4.975	10.649
4.975	10.741
4.975	11.140
4.995	11.262
5.978	9.972
5.998	9.359
5.998	9.420
5.998	9.727
5.998	9.850
5.998	10.126
5.998	10.310
5.998	10.770
5.998	11.322
5.998	11.414
5.998	11.475
5.998	11.905
5.998	12.028
7.001	10.492
7.001	10.615
7.001	10.738
7.001	11.014
7.001	12.609
7.001	12.701
7.001	13.130
7.021	10.093
7.021	10.278
7.021	11.320
7.021	11.689
7.040	12.241
7.945	11.227
7.945	11.411
7.945	11.687
7.945	12.914
7.945	13.068
7.945	13.190
7.945	13.282
7.945	13.497
7.965	10.920
7.984	12.239
8.928	11.318
8.928	12.790
8.928	13.219
8.928	13.403
8.928	13.649
8.928	14.078
8.948	11.686
8.968	11.195
9.931	12.298
9.931	12.574
9.971	13.617
9.971	14.015
9.971	14.660
9.971	14.782
10.954	13.278
10.954	13.400
10.954	14.014
10.954	15.057
10.954	15.210
10.993	14.535
11.996	14.319
11.996	14.748
11.996	15.485
12.920	15.698
13.982	16.064
14.966	16.339
15.969	16.614
16.952	16.796
17.974	17.101];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Cled2004';

% length-weight
data.LW_f = [ ... % shell length (cm), shell-free wet weight (g)
3.373	3.525
4.025	4.700
4.235	4.700
4.398	4.700
5.027	5.875
5.074	9.399
5.190	4.700
5.493	11.749
5.936	11.749
6.006	17.624
6.099	14.099
6.239	12.924
6.355	14.099
6.985	22.324
7.054	22.324
7.497	24.674
7.684	30.548
8.057	31.723
8.267	44.648
8.593	50.522
9.269	55.222
9.480	74.021
9.876	76.371
10.412	84.595
10.785	84.595
10.787	122.193
10.950	119.843
10.975	150.392
10.976	178.590
11.207	139.817
11.486	125.718
11.487	159.791
11.745	178.590
11.955	191.514
11.956	209.138
11.956	216.188
11.977	165.666
12.282	203.264
12.284	238.512
12.419	162.141
12.514	195.039
12.581	135.118
12.679	219.713
12.725	225.587
12.747	193.864
12.885	163.316
12.958	217.363
12.959	230.287
12.982	236.162
12.983	242.037
13.004	205.614
13.030	251.436
13.030	262.010
13.075	225.587
13.123	252.611
13.144	207.963
13.168	222.063
13.285	230.287
13.380	277.285
13.399	183.290
13.400	202.089
13.448	239.687
13.471	219.713
13.471	229.112
13.472	244.386
13.475	300.783
13.612	244.386
13.797	230.287
13.845	252.611
13.864	178.590
13.961	252.611
13.984	229.112
13.985	265.535
13.986	272.585
13.987	287.859
13.989	328.982
14.008	258.486
14.010	293.734
14.011	307.833
14.124	250.261
14.195	266.710
14.266	281.984
14.454	314.883
14.473	239.687
14.474	249.086
14.474	257.311
14.475	269.060
14.475	271.410
14.475	281.984
14.525	343.081
14.592	277.285
14.988	290.209
15.013	324.282
15.105	284.334
15.199	307.833
15.480	336.031
15.622	380.679
15.686	274.935
15.717	413.577
15.758	314.883
15.897	300.783
17.417	401.828];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'shell length', 'shell-free wet weight', 'female'};  
bibkey.LW_f = 'Cled2004';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % shell length (cm), shell-free wet weight (g)
3.584	2.394
4.704	3.590
4.820	4.787
4.821	9.574
4.984	9.574
5.287	4.787
5.521	9.574
5.568	9.574
5.568	13.165
5.988	14.362
6.782	22.739
7.015	16.755
7.507	31.117
7.577	33.511
7.926	27.527
8.068	40.691
8.184	41.888
8.605	45.479
8.792	55.053
9.072	51.463
9.870	96.941
9.913	63.431
9.987	100.532
10.710	99.335
11.108	105.319
11.322	144.814
11.722	178.324
11.932	184.308
11.957	191.489
11.957	198.670
12.022	151.995
12.052	210.638
12.098	204.654
12.165	172.340
12.215	210.638
12.402	214.229
12.564	202.261
12.753	226.197
12.756	247.739
12.821	201.064
12.846	220.213
12.961	203.457
12.961	207.048
12.966	251.330
12.967	258.511
12.986	220.213
12.987	227.394
12.990	259.707
12.992	272.872
13.006	181.915
13.012	245.346
13.018	298.005
13.018	303.989
13.105	245.346
13.224	263.298
13.314	230.984
13.403	191.489
13.429	210.638
13.479	245.346
13.479	248.936
13.524	232.181
13.525	239.362
13.615	208.245
13.621	264.495
13.688	239.362
13.760	260.904
13.947	262.101
14.004	360.239
14.017	257.314
14.017	264.495
14.018	270.479
14.019	277.660
14.020	287.234
14.022	309.973
14.025	335.106
14.044	296.809
14.091	301.596
14.137	289.628
14.225	239.362
14.229	277.660
14.439	282.447
14.553	250.133
14.722	306.383
14.747	329.122
14.838	302.793
14.939	375.798
15.027	325.532
15.466	283.644
15.545	371.011
16.242	344.681];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'shell length', 'shell-free wet weight', 'male'};  
bibkey.LW_m = 'Cled2004';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lb = 10 * weights.Lb;
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
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Imposex -penis development in females- was found in over 30 % of the females';
metaData.bibkey.F1 = 'Cled2004';
F2 = 'Mostly carnivorous, feeding on molluscs and other small marine invertebrates';
metaData.bibkey.F2 = 'Cled2004';
F3 = 'Lives 8 till 70 m deep';
metaData.bibkey.F3 = 'Cled2004';
F4 = 'Largest egg capsules (till 140 ml, containing 33 embryos) among gastropods';
metaData.bibkey.F4 = 'Cled2004';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '7SKW3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4845771'; % Ency of Life
metaData.links.id_Wiki = 'Adelomelon_brasiliana'; % Wikipedia
metaData.links.id_Taxo = '3939590'; % Taxonomicon
metaData.links.id_WoRMS = '1457762'; % WoRMS
metaData.links.id_molluscabase = '1457762'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Adelomelon_brasiliana}}';
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
bibkey = 'Cled2004'; type = 'PhDThesis'; bib = [ ... 
'author = {M. Cledon}, ' ... 
'year = {2004}, ' ...
'title = {Reproductive biology and ecology of \emph{Adelomelon brasiliana} ({M}ollusca: {G}astropoda) off {B}uenos {A}ires, {A}rgentina}, ' ...
'school = {Bremen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArriPenc2018'; type = 'Article'; bib = [ ... 
'author = {Florencia Arrighetti and Pablo E. Penchaszadeh}, ' ... 
'year = {2018}, ' ...
'title = {Biology and conservation of the giant marine snail \emph{Adelomelon beckii} in {A}rgentina}, ' ...
'journal = {Tentacle}, ' ...
'volume = {26}, ' ...
'pages = {19-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

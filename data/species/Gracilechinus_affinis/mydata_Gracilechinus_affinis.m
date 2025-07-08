function [data, auxData, metaData, txtData, weights] = mydata_Gracilechinus_affinis

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Echinidae';
metaData.species    = 'Gracilechinus_affinis'; 
metaData.species_en = 'Sea urchin'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-R'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data

data.tp = 2000;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MiddGurn1998';
  temp.tp = C2K(5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11e3;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'MiddGurn1998';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02;   units.Lb  = 'cm';  label.Lb  = 'length at birth';            bibkey.Lb  = 'guess';
data.Lp  = 1.6;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';   bibkey.Lp  = 'MiddGurn1998';
data.Li  = 5.5;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';     bibkey.Li  = 'MiddGurn1998';

data.Wwb = 2e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
data.Wwp = 1;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'MiddGurn1998';
data.Wwi = 37;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'MiddGurn1998';

 
% uni-variate data

% t-L data
data.tL = [ ... % time since settlement (yr), test diameter (cm)
0.890	0.116
0.890	0.148
0.891	0.180
1.900	0.190
1.941	0.211
1.941	0.243
1.941	0.264
2.909	0.179
2.950	0.211
2.950	0.232
2.950	0.243
3.920	0.348
3.922	0.634
3.924	0.825
3.927	1.227
4.895	1.100
4.898	1.460
4.899	1.534
4.900	1.704
4.901	1.789
4.905	2.255
5.915	2.403
5.916	2.498
5.950	1.767
5.952	2.011
5.953	2.106
5.954	2.159
6.918	1.555
6.920	1.851
6.921	1.915
6.923	2.201
6.923	2.233
6.925	2.392
6.925	2.455
6.959	1.608
6.963	2.106
6.966	2.529
6.968	2.784
7.888	1.756
7.894	2.497
7.895	2.540
7.898	2.974
7.930	1.904
7.930	1.915
7.931	2.010
7.931	2.042
7.932	2.158
7.933	2.307
7.934	2.391
7.934	2.434
7.937	2.751
7.937	2.783
7.971	1.968
8.866	2.815
8.901	2.137
8.902	2.264
8.904	2.497
8.905	2.645
8.905	2.677
8.906	2.751
8.907	2.899
8.909	3.111
8.910	3.260
8.910	3.302
8.943	2.402
8.944	2.444
8.945	2.603
9.952	2.253
9.953	2.359
9.953	2.422
9.954	2.549
9.955	2.677
9.956	2.793
9.958	2.984
9.958	3.069
9.959	3.206
10.884	2.697
10.885	2.772
10.886	2.920
10.921	2.305
10.922	2.433
10.923	2.517
10.926	2.952
10.927	3.089
10.928	3.206
10.930	3.344
11.902	3.767
11.937	3.100
11.939	3.311
11.939	3.354
11.941	3.555
11.942	3.672
12.908	3.301
12.909	3.449
12.909	3.502
12.946	3.046
12.947	3.152
12.950	3.587
13.916	3.205
13.917	3.300
13.919	3.523
14.928	3.427
14.928	3.501
14.931	3.829
14.931	3.851
14.931	3.893
14.970	3.628
14.970	3.671
14.970	3.702
15.938	3.511
15.938	3.596
15.941	3.903
15.943	4.200
15.947	4.634
16.946	3.405
16.948	3.585
16.949	3.776
16.949	3.808
16.950	3.935
17.919	3.913
17.953	3.108
17.956	3.447
17.964	4.411
18.928	3.860
18.929	3.902
18.930	4.019
18.930	4.061
18.930	4.082
18.930	4.114
18.934	4.517
18.966	3.500
19.902	4.421
19.903	4.569
19.934	3.404
19.937	3.764
19.937	3.785
19.941	4.220
19.979	3.923
20.911	4.410
20.943	3.308
20.947	3.817
20.948	4.018
20.949	4.113
20.954	4.738
21.920	4.304
21.957	3.912
21.958	4.071
21.960	4.261
22.888	4.261
22.930	4.409
22.931	4.526
22.933	4.791
23.898	4.314
24.948	4.356
24.951	4.705
25.997	4.196
26.972	4.990
27.976	4.259];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test diameter'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MiddGurn1998';
comment.tL = 'temp is guessed';

% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.871	0.071
1.891	0.071
2.911	0.071
3.893	0.071
3.893	0.142
3.894	0.638
4.876	0.355
4.877	0.993
4.877	1.135
4.877	1.418
4.878	1.702
4.880	3.404
5.898	1.560
5.901	3.972
5.901	4.397
5.936	2.270
5.937	2.624
5.937	2.837
6.881	1.915
6.883	3.972
6.917	1.135
6.918	1.986
6.919	2.695
6.921	4.326
6.922	4.681
6.924	6.241
6.958	3.050
7.865	3.546
7.870	7.518
7.900	1.560
7.901	1.915
7.901	2.482
7.902	2.837
7.904	4.113
7.904	4.255
7.904	4.397
7.904	4.539
7.904	4.681
7.906	6.099
7.906	6.241
7.939	2.128
7.939	2.270
7.941	3.901
7.941	4.043
8.849	5.035
8.849	5.177
8.856	10.142
8.886	4.113
8.886	4.326
8.887	5.319
8.888	5.461
8.888	5.603
8.889	6.950
8.892	8.582
8.893	9.716
8.922	2.766
8.923	3.333
8.924	4.468
8.926	5.745
8.926	5.816
8.926	6.241
9.906	3.901
9.906	3.972
9.911	8.085
9.912	9.220
9.943	3.475
9.945	4.681
9.946	5.532
9.946	6.241
9.948	7.660
10.851	4.610
10.854	7.021
10.855	7.376
10.888	4.043
10.890	5.603
10.891	6.028
10.894	8.298
10.895	9.220
10.897	10.709
10.925	3.475
10.933	9.362
11.878	10.213
11.879	10.851
11.882	12.695
11.883	13.901
11.914	8.511
11.922	14.965
12.861	10.213
12.896	8.014
12.897	8.794
12.900	11.631
12.901	12.128
12.902	13.191
13.884	12.482
13.918	9.362
13.919	10.142
14.866	12.057
14.867	13.475
14.868	13.688
14.871	16.170
14.902	11.277
14.906	14.255
14.908	15.745
14.909	16.738
15.821	20.993
15.854	16.809
15.868	27.518
15.886	12.199
15.886	12.411
15.925	13.333
16.867	11.277
16.869	12.979
16.872	15.177
16.873	15.603
16.875	17.163
17.857	16.879
17.866	24.113
17.884	8.511
17.926	11.631
18.841	18.156
18.841	18.156
18.841	18.652
18.850	25.745
18.880	19.291
18.909	12.199
18.914	16.170
18.914	16.667
18.918	19.504
18.918	19.858
19.852	11.135
19.857	15.248
19.864	20.922
19.864	21.135
19.871	26.667
19.894	14.894
19.897	16.950
19.906	24.255
20.840	15.532
20.843	18.227
20.851	24.184
20.858	30.000
20.871	10.355
20.883	19.574
20.883	19.858
21.862	16.879
21.868	21.773
21.902	19.078
21.906	22.482
22.850	21.631
22.853	23.901
22.853	24.043
22.862	30.780
22.893	25.745
23.833	22.482
24.892	23.191
24.900	29.007
25.834	20.993
26.872	34.894
27.913	21.773];    
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MiddGurn1998';
comment.tW = 'temp is guessed';
%
% L-R data from MiddGurn1998
% I here assume yearly spawning, so the mean accumulation time is 365/2 d
data.LR = [ ... % test diameter (mm), gonad weight (g)
18.974	0.049
19.044	0.095
19.260	0.105
19.768	0.018
20.850	0.028
21.281	0.095
21.351	0.137
21.860	0.049
22.291	0.088
22.352	0.404
22.438	0.025
22.798	0.039
23.375	0.056
23.795	0.407
23.804	0.144
23.808	0.049
24.312	0.063
24.385	0.039
24.889	0.084
24.959	0.147
24.959	0.130
24.962	0.060
25.323	0.060
25.388	0.256
25.394	0.088
25.682	0.095
25.971	0.077
26.329	0.147
26.332	0.084
26.762	0.147
26.836	0.098
26.907	0.133
27.198	0.070
27.483	0.158
27.485	0.109
27.486	0.095
27.555	0.175
27.699	0.189
27.774	0.112
27.848	0.067
27.989	0.147
28.638	0.151
28.785	0.077
28.925	0.193
29.211	0.260
29.645	0.239
29.792	0.165
29.866	0.119
30.512	0.204
30.790	0.509
30.801	0.200
31.378	0.193
31.729	0.467
31.807	0.309
31.958	0.130
32.678	0.172
33.470	0.207
33.472	0.165
33.969	0.393
34.322	0.586
34.805	1.214
34.913	0.225
35.837	0.607
35.841	0.484
35.890	1.116
36.353	0.305
36.498	0.284
37.358	0.446
37.366	0.211
37.435	0.305
37.578	0.330
37.645	0.488
37.797	0.260
37.845	0.944
37.937	0.379
37.938	0.354
37.941	0.270
38.343	1.123
38.789	0.775
38.864	0.681
38.937	0.663
38.941	0.565
39.015	0.502
39.881	0.491
40.021	0.621
40.368	0.996
40.508	1.130
40.949	0.891
41.036	0.491
41.385	0.796
41.966	0.698
42.413	0.319
42.417	0.214
42.842	0.414
42.872	1.579
42.908	0.579
43.395	1.088
43.766	0.814
43.967	1.225
43.972	1.105
44.050	0.944
44.069	0.414
45.050	1.211
45.314	1.891
45.913	1.298
45.999	0.895
47.219	1.088];
data.LR(:,1) = data.LR(:,1)/10; % convert mm to cm
units.LR   = {'cm', 'g'};  label.LR = {'test diameter', 'gonad weight'};  
temp.LR    = C2K(5);  units.temp.LR = 'K'; label.temp.LR = 'temperature';
bibkey.LR = 'MiddGurn1998';
comment.LR = 'temp is guessed; I here assume yearly spawning, so the mean accumulation time is 365/2 d';
  
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

%% Discussion points
D1 = 'Weight at birth is guessed from Sterechinus which has Wd0 of 0.5 mug';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3H558'; % Cat of Life
metaData.links.id_ITIS = '157951'; % ITIS
metaData.links.id_EoL = '599662'; % Ency of Life
metaData.links.id_Wiki = 'Gracilechinus'; % Wikipedia
metaData.links.id_ADW = 'Echinus_affinis'; % ADW
metaData.links.id_Taxo = '3926794'; % Taxonomicon
metaData.links.id_WoRMS = '532039'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Echinus_(sea_urchin)}}';
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
bibkey = 'MiddGurn1998'; type = 'Article'; bib = [ ... 
'author = {Middleton, D. A. J. and Gurney, W. S. C. and Gage, J. D.}, ' ... 
'year = {1998}, ' ...
'title = {Growth and energy allocation in the deep-sea urchin \emph{Echinus affinis}}, ' ...
'journal = {Biological Journal of the Linnean Society}, ' ...
'volume = {64}, ' ...
'pages = {315-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


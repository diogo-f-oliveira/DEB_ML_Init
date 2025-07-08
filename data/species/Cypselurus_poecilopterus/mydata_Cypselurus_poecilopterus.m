function [data, auxData, metaData, txtData, weights] = mydata_Cypselurus_poecilopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Cypselurus_poecilopterus'; 
metaData.species_en = 'Yellowing flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MIN'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 07 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 14]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 170;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Read from tL-curve, given Lp';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.8;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length compared to Hirundichthys_affinis: 27*20.9/30';
data.Li  = 27.0;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki_t';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';

data.Ri = 30; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Hirundichthys_affinis: (27/30)^3*1.5e4/365';
 
% uni-variate data
% t-L data
data.tL = [... % time since birth (d), fork length (cm)
0.080	3.605
0.080	3.333
0.084	3.967
0.089	3.332
0.089	4.782
0.101	3.692
0.389	17.604
0.393	15.427
0.396	17.602
0.396	17.965
0.396	18.328
0.403	17.148
0.417	17.508
0.417	17.961
0.419	15.875
0.429	17.959
0.436	18.411
0.438	16.325
0.443	18.319
0.445	18.047
0.457	18.498
0.466	17.952
0.482	18.040
0.487	18.311
0.492	18.310
0.501	18.671
0.501	18.037
0.511	18.670
0.518	18.668
0.522	18.668
0.525	18.667
0.529	19.029
0.539	19.027
0.548	19.842
0.548	19.026
0.557	19.387
0.567	20.020
0.574	20.653
0.574	19.656
0.578	19.655
0.583	20.470
0.583	19.835
0.597	20.467
0.600	20.014
0.602	19.650
0.611	20.828
0.614	20.011
0.623	20.100
0.625	20.825
0.630	19.645
0.632	21.096
0.639	21.548
0.639	20.278
0.639	19.644
0.642	20.822
0.663	20.637
0.663	20.818
0.663	21.181
0.670	21.542
0.677	20.272
0.681	21.540
0.696	20.450
0.707	21.263
0.707	20.810
0.707	20.357
0.717	20.808
0.719	20.445
0.728	20.988
0.731	21.441
0.740	21.167
0.756	21.255
0.761	20.800
0.782	21.975];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChanYuan2022';

% length - weight
data.LWw_f = [ ... % fork length (cm), wet weight (g)
1.674	0.493
1.855	0.493
2.036	0.493
2.521	0.987
3.065	1.480
3.186	1.480
3.247	1.480
3.609	1.480
3.852	1.974
3.973	2.961
4.215	1.974
4.335	1.974
4.698	1.974
4.940	1.974
5.183	2.961
16.418	115.954
17.020	109.539
17.312	83.388
17.313	86.842
17.317	96.217
17.430	76.974
17.616	87.829
17.617	91.283
17.619	95.724
17.621	100.658
17.622	102.632
17.795	80.921
17.918	86.842
17.984	100.658
18.170	111.513
18.352	112.500
18.469	102.138
18.526	94.243
18.651	104.112
18.661	129.770
18.766	89.803
18.778	118.421
18.782	128.289
18.842	128.289
18.951	97.697
19.013	102.632
19.020	120.395
19.023	127.796
19.072	99.178
19.076	108.059
19.135	104.605
19.206	131.743
19.327	129.770
19.371	90.296
19.511	138.158
19.513	141.612
19.514	143.586
19.619	106.086
19.691	134.211
19.692	135.197
19.697	149.507
19.752	136.184
19.809	125.329
19.812	132.730
19.815	142.105
19.816	142.599
19.858	98.191
19.863	110.526
19.977	91.776
19.995	138.158
19.998	146.053
20.000	149.507
20.044	108.553
20.045	110.526
20.047	116.447
20.113	129.276
20.185	157.895
20.229	118.421
20.241	147.039
20.291	121.382
20.358	138.651
20.360	142.105
20.477	133.717
20.482	146.053
20.534	125.329
20.535	127.303
20.540	140.132
20.590	112.993
20.594	122.368
20.666	151.480
20.724	145.066
20.727	152.467
20.730	159.375
20.910	156.414
20.955	119.408
20.972	160.855
21.017	122.862
21.025	142.599
21.079	126.316
21.089	150.493
21.144	138.158
21.198	120.888
21.204	134.704
21.210	150.000
21.214	160.855
21.273	155.921
21.441	124.836
21.444	130.757
21.446	135.197
21.451	148.026
21.509	141.612
21.640	167.763
21.691	144.079
21.814	148.026
21.815	151.974
21.934	145.559
21.941	162.829
21.998	155.428
22.176	146.053
22.177	148.026
22.295	141.612];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'fork length','wet weight','females'};  
bibkey.LWw_f = 'ChanYuan2022';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % fork length (cm), wet weight (g)
15.183	54.770
15.304	54.276
15.550	63.158
15.671	65.132
15.854	68.092
15.912	61.184
16.034	64.145
16.036	70.066
16.099	75.000
16.165	89.803
16.279	72.533
16.343	80.428
16.580	68.092
16.584	77.467
16.586	82.895
16.701	69.079
16.709	88.816
16.822	68.586
16.825	75.493
16.892	91.776
16.945	74.507
16.947	78.947
17.010	85.855
17.068	78.947
17.242	59.211
17.246	71.053
17.252	84.868
17.310	77.961
17.311	80.428
17.311	80.921
17.314	89.309
17.316	93.257
17.375	88.816
17.379	98.684
17.424	60.691
17.425	63.158
17.429	73.520
17.502	104.605
17.551	76.974
17.607	66.118
17.612	78.947
17.676	86.842
17.735	82.895
17.799	90.789
17.800	92.763
17.860	93.257
17.863	101.151
18.030	65.625
18.038	85.362
18.041	92.763
18.093	71.053
18.096	77.961
18.100	87.336
18.103	96.217
18.103	96.217
18.107	104.605
18.146	51.809
18.168	107.566
18.281	87.336
18.287	102.632
18.400	82.895
18.400	82.895
18.468	99.671
18.525	90.789
18.534	113.980
18.587	96.711
18.591	104.605
18.653	110.033
18.708	96.217
18.763	83.388
18.768	95.724
18.773	106.579
18.774	110.526
18.831	101.645
18.886	86.842
18.894	108.059
18.956	110.033
18.957	114.474
19.011	98.191
19.014	104.605
19.078	113.980
19.136	106.579
19.139	114.474
19.140	118.421
19.195	103.125
19.202	119.901
19.246	80.921
19.259	112.500
19.433	94.737
19.439	109.539
19.496	99.671
19.502	115.954
19.506	125.329
19.746	120.395
19.861	104.605
19.931	128.289
19.985	112.500
20.105	110.526
20.176	136.678
20.713	118.421
20.726	150.987
20.954	116.447
21.933	144.079];
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'fork length','wet weight','males'};  
bibkey.LWw_m = 'ChanYuan2022';
comment.LWw_m = 'Data for males';
    

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouped plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Fecundity is assumed to equal that of Cheilopogon melanurus';
D2 = 'shape coefficient for fork length is assumed 0.95 * that for standard length';
D3 = 'Li is given more weight to assure a proper max length';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Preferred temp: 24.5 - 29.3 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33JCW'; % Cat of Life
metaData.links.id_ITIS = '165451'; % ITIS
metaData.links.id_EoL = '46566971'; % Ency of Life
metaData.links.id_Wiki = 'Cypselurus'; % Wikipedia
metaData.links.id_ADW = 'Cypselurus_poecilopterus'; % ADW
metaData.links.id_Taxo = '172807'; % Taxonomicon
metaData.links.id_WoRMS = '217864'; % WoRMS
metaData.links.id_fishbase = 'Cypselurus-poecilopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cypselurus}}'];
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
bibkey = 'ChanYuan2022'; type = 'Article'; bib = [ ... 
'doi = {10.3389/fmars.2021.747382}, ' ...
'author = {Shui-Kai Chang and Tzu-Lun Yuan and Simon D. Hoyle and Jessica H. Farley and Jen-Chieh Shiao}, ' ... 
'year = {2022}, ' ...
'title = {Growth Parameters and Spawning Season Estimation of Four Important Flyingfishes in the {K}uroshio Current Off {T}aiwan and Implications From Comparisons With Global Studies}, ' ...
'journal = {Front. Mar. Sci.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Cypselurus-poecilopterus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_t'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tobiko}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


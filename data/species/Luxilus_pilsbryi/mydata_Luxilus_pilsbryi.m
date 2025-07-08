function [data, auxData, metaData, txtData, weights] = mydata_Luxilus_pilsbryi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Luxilus_pilsbryi'; 
metaData.species_en = 'Duskystripe shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'};  
metaData.data_1     = {'t-L'; 't_Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 3.35e-2;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cobu1986';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.4^3';

data.GSI = 0.18; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';  bibkey.GSI = 'SimmBeck2012'; 
  temp.GSI = C2K(13); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.500	7.071
0.677	4.591
0.742	6.016
0.928	5.330
1.026	7.388
1.070	7.388
1.081	7.018
1.244	8.285
1.255	7.968
1.256	7.704
1.321	8.654
1.409	8.285
1.431	8.074
1.486	7.546
1.496	8.285
1.496	8.021
1.562	7.704
1.661	7.388
1.661	7.124
1.672	7.704
1.672	6.755
1.737	9.235
1.737	8.865
1.825	8.549
1.836	7.863
1.836	7.493
1.836	7.230
1.901	8.707
1.989	8.549
2.087	9.129
2.088	8.654
2.142	9.393
2.153	8.391
2.175	8.707
2.186	9.129
2.251	9.604
2.252	9.077
2.252	8.707
2.296	8.971
2.296	8.865
2.415	10.132
2.481	9.499
2.482	9.129
2.493	8.549
2.558	9.235
2.559	8.813
2.569	9.974
2.580	9.446
2.700	9.815
2.712	9.024
2.755	10.079
2.821	9.815
2.821	9.446
2.919	10.079
2.931	9.657
2.952	9.921
2.985	10.079
3.073	10.237
3.084	9.921
3.150	9.657
3.161	9.129
3.171	10.501
3.226	10.923
3.226	10.079
3.226	9.763
3.237	9.604
3.302	10.660
3.303	10.079
3.324	10.923
3.347	9.868
3.412	10.554
3.412	10.185
3.412	9.921
3.446	9.024
3.478	10.660
3.511	10.079
3.511	9.710
3.511	9.393
3.544	10.501
3.555	10.079
3.555	9.551
3.643	9.763
3.664	10.079
3.752	10.079
3.839	10.449
3.927	10.818
3.927	10.185
3.971	10.449
3.992	11.346
4.025	11.187
4.026	10.237
4.069	11.029
4.069	10.765
4.091	10.501
4.103	9.974
4.168	10.501
4.222	11.609
4.244	11.029
4.245	10.132
4.331	13.298
4.332	10.976
4.398	10.501
4.474	11.346
4.475	10.554
4.563	10.132
4.584	11.346
4.584	10.449
4.748	11.451
4.748	11.240
4.748	10.607
4.836	10.501
4.836	10.185
4.890	11.557
4.891	11.135
4.978	11.082
4.978	10.923
4.979	10.660
4.988	13.456
4.989	11.979
5.000	11.557
5.077	10.554
5.153	11.398
5.176	10.976
5.176	10.765
5.197	11.557
5.219	11.504
5.219	11.293
5.230	10.976
5.230	10.712
5.296	10.976
5.340	11.293
5.384	10.607
5.405	11.451
5.581	10.712
5.603	11.135
5.745	10.712
5.767	11.187
6.052	11.240
6.062	11.979
6.150	11.926
6.150	11.662
6.184	10.660
6.237	12.929];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(21.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SimmBeck2012'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.304	4.908
0.336	6.649
0.643	5.330
0.654	6.491
0.665	6.016
0.731	5.330
0.752	6.491
0.830	5.224
0.830	4.802
0.830	4.274
0.939	5.435
1.157	7.599
1.189	8.496
1.266	9.182
1.266	8.918
1.288	7.968
1.310	9.182
1.310	8.918
1.408	9.921
1.408	9.657
1.430	8.654
1.518	8.654
1.584	8.760
1.595	8.496
1.671	8.654
1.726	8.285
1.748	9.393
1.758	9.868
1.792	8.127
1.793	7.282
1.824	10.501
1.911	10.501
1.923	8.918
1.924	8.232
1.924	7.968
1.977	9.763
1.978	9.340
1.988	10.765
1.989	8.549
2.087	9.921
2.142	9.288
2.164	9.868
2.164	9.604
2.185	10.343
2.252	8.654
2.317	10.132
2.317	9.868
2.339	10.343
2.339	9.604
2.405	9.974
2.415	10.660
2.514	9.763
2.558	9.499
2.569	9.763
2.570	8.179
2.580	10.026
2.733	10.290
2.743	11.346
2.820	11.346
2.820	11.082
2.821	10.343
2.908	11.135
2.908	10.765
2.908	10.501
2.995	11.451
2.995	11.240
2.996	10.765
3.094	10.923
3.675	9.921
3.795	10.871
3.807	9.815
3.904	11.768
3.992	11.187
4.069	11.082
4.156	11.557
4.233	11.821
4.277	11.029
4.759	11.873
4.815	9.710
4.890	11.609
4.945	10.976];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(21.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SimmBeck2012'; 
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.479	2.388
0.677	0.713
0.775	1.904
0.918	1.278
1.004	3.867
1.080	3.798
1.081	2.749
1.222	4.221
1.233	3.731
1.255	4.641
1.287	4.921
1.320	5.342
1.386	4.434
1.484	4.645
1.485	3.806
1.485	3.177
1.584	3.529
1.660	2.831
1.661	2.411
1.661	1.852
1.671	4.439
1.671	4.160
1.671	3.600
1.714	5.419
1.714	5.070
1.736	3.811
1.745	7.518
1.746	6.749
1.769	4.232
1.791	4.512
1.824	4.373
1.824	3.883
1.825	2.764
1.845	6.121
1.856	5.282
1.856	4.793
1.932	6.263
2.041	6.335
2.073	7.944
2.085	6.685
2.140	6.267
2.150	6.966
2.151	5.148
2.238	6.828
2.249	7.528
2.249	6.059
2.348	5.782
2.348	5.432
2.479	6.274
2.479	5.574
2.523	4.806
2.579	4.108
2.588	5.856
2.589	5.297
2.720	5.929
2.772	9.776
2.806	8.868
2.816	9.218
2.817	7.609
2.903	10.478
2.904	8.940
2.914	11.038
2.915	8.031
2.991	10.130
2.991	9.641
2.991	9.151
3.045	10.201
3.079	8.733
3.101	9.153
3.156	7.476
3.157	7.057
3.157	5.938
3.167	8.735
3.167	8.315
3.167	7.896
3.231	11.673
3.232	9.576
3.244	6.918
3.254	8.527
3.331	8.109
3.331	7.759
3.332	6.780
3.341	10.417
3.375	8.320
3.386	7.760
3.418	8.530
3.419	7.551
3.420	5.733
3.441	7.062
3.474	6.993
3.485	5.804
3.507	6.644
3.528	7.134
3.561	6.645
3.571	8.813
3.659	8.815
3.682	6.717
3.768	9.446
3.810	11.475
3.877	10.008
3.896	15.323
3.898	12.176
3.963	11.898
3.983	15.744
3.997	9.661
4.007	12.528
4.008	10.990
4.008	10.640
4.063	9.103
4.073	11.201
4.074	10.362
4.084	11.830
4.086	7.145
4.172	9.385
4.226	11.134
4.237	10.714
4.238	8.896
4.246	14.771
4.286	21.625
4.314	10.087
4.402	8.970
4.403	8.270
4.489	10.789
4.501	8.692
4.502	7.153
4.557	7.154
4.566	9.532
4.578	8.064
4.578	7.505
4.579	6.246
4.729	12.682
4.739	13.662
4.739	13.032
4.751	11.564
4.828	11.496
4.830	7.859
4.879	17.511
4.901	16.742
4.924	15.483
4.926	11.777
4.978	17.303
4.992	10.660
5.001	13.667
5.002	13.177
5.080	10.731
5.155	12.901
5.165	15.139
5.167	11.362
5.222	10.874
5.242	14.441
5.243	12.273
5.243	12.063
5.244	10.105
5.253	13.952
5.309	10.316
5.332	9.757
5.376	8.989
5.376	8.499
5.386	11.087
5.551	8.643
5.562	9.342
5.712	14.171
5.714	9.975
6.073	14.807
6.074	11.800
6.152	10.613
6.183	13.900
6.183	12.641
6.248	14.671];
data.tWw_f(:,1) = 365 * (0 + data.tWw_f(:,1));
n=size(data.tWw_f,1); for i=2:n; if data.tWw_f(i,1)<=data.tWw_f(i-1,1); data.tWw_f(i,1)=data.tWw_f(i-1,1)+1e-3; end; end
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SimmBeck2012'; 
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.337	2.105
0.338	1.056
0.633	2.041
0.720	2.392
0.753	1.484
0.808	0.786
0.819	0.856
0.841	1.416
0.917	1.627
1.178	4.849
1.179	3.521
1.254	6.459
1.331	5.971
1.331	5.621
1.332	3.943
1.386	5.273
1.428	7.581
1.428	7.092
1.474	4.156
1.495	5.135
1.583	4.578
1.583	4.228
1.659	5.348
1.660	4.439
1.726	3.392
1.733	9.406
1.745	7.658
1.757	5.840
1.824	3.394
1.842	10.876
1.900	4.514
1.918	12.207
1.920	7.451
1.922	4.934
1.974	10.110
1.994	13.327
1.997	7.593
1.997	6.684
2.071	11.650
2.170	10.184
2.171	9.624
2.217	5.499
2.281	8.927
2.292	8.648
2.336	7.460
2.378	10.048
2.401	8.999
2.412	8.720
2.434	7.602
2.576	8.234
2.577	7.045
2.577	6.276
2.579	3.898
2.704	14.670
2.773	8.797
2.794	10.616
2.846	14.813
2.846	14.113
2.902	12.786
2.910	17.052
2.923	13.416
2.988	15.375
2.988	14.745
2.989	14.326
3.001	11.879
3.001	11.319
3.066	13.278
3.506	7.763
3.659	7.556
3.757	9.096
3.894	18.540
3.984	14.066
4.246	15.400
4.246	14.211
4.727	15.270
4.902	14.854
4.987	19.541];
data.tWw_m(:,1) = 365 * (0 + data.tWw_m(:,1));
n=size(data.tWw_m,1); for i=2:n; if data.tWw_m(i,1)<=data.tWw_m(i-1,1); data.tWw_m(i,1)=data.tWw_m(i-1,1)+1e-3; end; end
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SimmBeck2012'; 
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3WH7F'; % Cat of Life
metaData.links.id_ITIS = '163838'; % ITIS
metaData.links.id_EoL = '209704'; % Ency of Life
metaData.links.id_Wiki = 'Luxilus_pilsbryi'; % Wikipedia
metaData.links.id_ADW = 'Luxilus_pilsbryi'; % ADW
metaData.links.id_Taxo = '179244'; % Taxonomicon
metaData.links.id_WoRMS = '1018657'; % WoRMS
metaData.links.id_fishbase = 'Luxilus-pilsbryi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luxilus_pilsbryi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Luxilus-pilsbryi.html}}';  
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
bibkey = 'SimmBeck2012'; type = 'Article'; bib = [ ... 
'author = {Bryan R. Simmons and DanielW. Beckman}, ' ... 
'year = {2012}, ' ...
'title = {Age Determination, Growth, and Population Structure of the Striped Shiner and Duskystripe Shiner}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {141}, ' ...
'pages = {846-854}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


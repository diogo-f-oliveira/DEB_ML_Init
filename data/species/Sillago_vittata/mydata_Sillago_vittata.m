function [data, auxData, metaData, txtData, weights] = mydata_Sillago_vittata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_vittata'; 
metaData.species_en = 'Western school whiting';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 14];

%% set data
% zero-variate data

data.ab = 5;       units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'HyndPott1996';   
  temp.am = C2K(22.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 5 yrs';

data.Lp  = 16; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 30;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'HyndPott1996';
  comment.Wwb = 'Oocyte diameter 0.93 mm, assumed hedrated egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 291.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00851*Li^3.07, see F1';
 
data.Ri  = 150e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 150000';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.122	3.575
0.126	6.069
0.130	8.064
0.145	5.819
0.147	6.734
0.147	6.900
0.147	7.067
0.147	7.067
0.148	7.565
0.164	5.404
0.164	5.570
0.212	10.808
0.219	3.492
0.230	10.143
0.241	4.822
0.256	2.577
0.257	2.993
0.259	4.074
0.260	4.739
0.263	6.568
0.264	7.067
0.265	7.565
0.265	8.147
0.282	6.401
0.286	8.979
0.293	13.219
0.301	6.401
0.346	10.143
0.349	11.556
0.352	13.884
0.421	8.480
0.425	10.974
0.435	4.988
0.439	7.815
0.472	4.323
0.485	12.055
0.494	5.487
0.495	6.235
0.496	7.233
0.514	6.152
0.535	7.399
0.558	9.394
0.564	12.886
0.575	7.732
0.575	7.815
0.577	8.812
0.577	8.979
0.623	13.634
0.628	4.988
0.832	10.891
0.849	9.893
0.886	8.729
0.897	15.463
0.910	11.556
0.926	9.062
0.926	9.062
0.926	9.228
0.927	9.893
0.946	9.727
0.948	11.140
0.956	15.713
0.976	16.045
0.982	7.898
0.988	11.390
0.989	12.221
0.993	14.798
0.996	16.627
1.010	13.135
1.010	13.468
1.031	13.967
1.031	14.299
1.056	17.874
1.094	17.043
1.132	16.627
1.133	17.458
1.135	18.789
1.264	14.299
1.293	20.534
1.307	17.209
1.327	17.542
1.328	18.290
1.346	17.043
1.389	19.537
1.389	20.036
1.411	21.449
1.426	18.539
1.485	19.204
1.502	18.040
1.524	19.537
1.526	20.867
1.528	21.615
1.545	20.451
1.642	20.368
1.735	18.373
1.816	20.368
1.850	17.708
1.856	21.200
1.897	22.447
1.916	21.948
1.931	19.703
2.047	19.537
2.048	20.119
2.107	20.618
2.110	22.447
2.125	19.786
2.148	21.698
2.166	20.867
2.187	21.865
2.263	21.033
2.283	21.781
2.306	23.694
2.341	21.781
2.400	22.114
2.444	25.356
2.460	23.195
2.482	24.774
2.500	23.860
2.826	22.114
2.849	24.276
2.886	23.112
2.887	23.694
2.903	21.865
3.021	22.530
3.057	21.116
3.178	24.026
3.238	25.024
3.352	23.943
3.377	27.102
3.430	24.359
3.434	26.603
3.450	24.276
3.684	25.606
3.935	24.857
3.996	26.437
4.013	25.107
4.212	28.682
4.383	26.271
4.385	27.518
4.406	28.848
4.425	28.432
4.852	28.848
4.904	25.190
5.413	28.515
6.424	30.843
7.429	29.430];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length','females'};  
temp.tL_f  = C2K(22.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HyndPott1996';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.026	4.234
0.087	5.732
0.089	6.896
0.106	4.984
0.106	5.316
0.110	7.312
0.110	7.727
0.145	4.985
0.145	5.483
0.167	6.482
0.180	2.907
0.182	3.988
0.190	8.727
0.192	9.974
0.202	4.321
0.209	8.561
0.227	7.730
0.254	12.303
0.257	2.327
0.259	3.491
0.271	10.640
0.303	6.401
0.304	6.900
0.305	7.815
0.308	9.145
0.327	8.896
0.329	10.392
0.330	11.057
0.341	5.903
0.351	11.723
0.353	12.887
0.379	4.823
0.383	7.317
0.386	9.230
0.387	9.895
0.394	14.218
0.421	6.903
0.423	8.233
0.456	4.575
0.459	6.072
0.502	8.733
0.517	6.239
0.519	6.988
0.525	10.479
0.525	10.479
0.535	5.325
0.543	9.565
0.551	14.471
0.569	13.889
0.582	9.566
0.615	6.491
0.619	8.403
0.637	7.821
0.678	8.986
0.716	8.073
0.741	11.482
0.779	10.900
0.814	8.823
0.815	9.072
0.820	12.065
0.835	9.488
0.860	12.565
0.883	14.727
0.905	16.141
0.915	10.488
0.921	13.896
0.934	10.072
0.935	10.737
0.935	10.904
0.942	14.977
0.955	11.154
0.971	9.159
0.979	13.731
0.982	15.893
0.991	9.408
0.991	9.492
1.002	15.810
1.014	11.737
1.037	13.317
1.057	13.733
1.060	15.562
1.060	15.562
1.065	18.804
1.077	14.398
1.081	16.394
1.082	16.809
1.082	17.391
1.103	17.974
1.141	17.642
1.165	19.804
1.208	22.299
1.241	19.057
1.278	17.562
1.280	18.892
1.357	18.312
1.359	19.392
1.365	23.050
1.394	16.982
1.398	19.643
1.400	20.557
1.401	20.973
1.419	20.059
1.454	18.064
1.495	19.063
1.515	19.479
1.633	20.063
1.804	17.323
1.809	19.984
1.811	21.231
1.845	18.239
1.925	19.487
2.002	18.574
2.002	18.990
2.008	22.648
2.023	19.739
2.025	20.736
2.027	22.233
2.042	19.157
2.061	19.407
2.064	21.153
2.065	21.818
2.124	22.069
2.142	20.822
2.183	22.070
2.262	22.820
2.359	22.240
2.376	21.076
2.399	22.656
2.402	24.485
2.405	26.730
2.535	22.825
2.591	21.081
2.654	23.909
2.689	21.581
2.828	22.748
2.830	23.663
2.864	21.003
2.923	21.171
2.985	23.084
3.040	21.256
3.127	26.246
3.158	21.425
3.179	22.423
3.239	23.422
3.314	21.761
3.316	22.925
3.335	22.676
3.337	24.006
3.345	28.662
3.375	23.258
3.630	24.012
3.766	23.516
3.846	24.848
4.161	26.434
4.214	23.359
4.277	25.771
4.411	24.444
4.454	26.773
4.803	25.533
4.825	26.531
4.868	29.026
5.589	28.625
5.805	29.378
5.842	28.381
5.888	32.289
6.138	30.133
6.139	31.047];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length','males'};  
temp.tL_m  = C2K(22.8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HyndPott1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00851*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XDQT'; % Cat of Life
metaData.links.id_ITIS = '646056'; % ITIS
metaData.links.id_EoL = '46579913'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_vittata'; % Wikipedia
metaData.links.id_ADW = 'Sillago_vittata'; % ADW
metaData.links.id_Taxo = '187663'; % Taxonomicon
metaData.links.id_WoRMS = '273956'; % WoRMS
metaData.links.id_fishbase = 'Sillago-vittata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_vittata}}';
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
bibkey = 'HyndPott1996'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00354637}, ' ...
'author = {G. A. Hyndes and I. C. Potter and S. A. Hesp}, ' ... 
'year = {1996}, ' ...
'title = {Relationships between the movements, growth, age structures, and reproductive biology of the teleosts \emph{Sillago burrus} and \emph{S. vittata} in temperate marine waters}, ' ...
'journal = {Marine Biology }, ' ...
'volume = {126(3)}, ' ...
'pages = {549–558}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-vittata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

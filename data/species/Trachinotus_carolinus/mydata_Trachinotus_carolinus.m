function [data, auxData, metaData, txtData, weights] = mydata_Trachinotus_carolinus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachinotus_carolinus'; 
metaData.species_en = 'Florida pompano'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 20];

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25; units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 64;   units.Li = 'cm'; label.Li = 'ultimate fork length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 139;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01585*Lp^2.82, see F1';
data.Wwi = 1965; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^2.82, see F1; max published weight 3.8 kg';

data.GSI  = 0.06; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(26.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Trachinotus falcatus';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.161	21.372
0.184	22.164
0.267	22.955
0.269	14.644
0.294	10.554
0.314	24.934
0.326	22.691
0.328	18.206
0.328	17.018
0.337	26.385
0.338	23.747
0.340	16.227
0.351	20.053
0.374	22.164
0.410	19.657
0.422	21.768
0.433	24.274
0.456	26.913
0.478	34.169
0.479	30.343
0.490	32.982
0.824	24.670
0.894	27.045
0.906	29.420
0.906	28.628
0.930	26.121
0.942	25.330
0.953	28.100
0.965	27.309
0.965	27.045
1.002	23.219
1.024	28.760
1.024	28.232
1.025	24.802
1.036	31.003
1.036	29.947
1.049	26.385
1.057	39.842
1.060	27.177
1.071	31.135
1.071	30.739
1.072	29.156
1.082	34.828
1.094	35.224
1.096	24.802
1.107	29.947
1.108	24.406
1.118	34.169
1.119	28.232
1.120	26.253
1.120	25.594
1.131	29.815
1.131	27.177
1.155	26.781
1.177	33.245
1.178	31.662
1.178	30.607
1.202	28.364
1.213	31.398
1.224	34.301
1.225	32.586
1.237	29.947
1.238	28.760
1.248	36.939
1.250	27.836
1.250	27.045
1.260	36.412
1.262	25.989
1.274	25.198
1.282	40.897
1.284	33.773
1.297	29.551
1.307	34.697
1.319	35.884
1.321	27.968
1.331	33.245
1.332	32.454
1.332	30.739
1.355	31.530
1.357	26.649
1.366	35.092
1.368	29.947
1.380	28.496
1.381	25.989
1.390	35.620
1.402	34.565
1.402	33.641
1.403	29.156
1.415	32.454
1.417	23.483
1.426	33.905
1.428	27.309
1.428	26.385
1.439	31.003
1.449	37.863
1.462	32.850
1.508	38.522
1.508	36.675
1.508	36.148
1.510	30.211
1.522	29.288
1.522	28.232
1.534	30.079
1.535	26.121
1.545	31.794
1.558	27.836
1.569	29.024
1.593	30.739
1.606	24.406
1.689	23.219
1.713	23.879
1.737	23.615
1.772	25.066
1.772	24.670
1.783	27.441
1.784	22.559
1.795	25.726
1.796	25.198
1.808	24.274
1.819	26.517
1.855	23.483
1.866	26.781
1.866	25.989
1.867	25.330
1.867	25.330
1.890	27.441
1.891	24.274
1.901	28.232
1.926	26.649
1.937	28.496
1.949	25.989
1.950	24.142
1.973	27.177
1.985	26.385
1.996	29.288
1.997	26.385
2.018	37.203
2.019	34.433
2.020	28.100
2.021	24.802
2.030	35.488
2.042	33.245
2.043	32.322
2.043	29.683
2.044	25.066
2.045	24.142
2.056	25.330
2.066	33.641
2.067	28.892
2.067	27.968
2.068	27.309
2.068	26.781
2.101	34.697
2.113	36.544
2.126	30.739
2.127	25.726
2.137	32.586
2.148	37.335
2.150	30.343
2.160	37.071
2.172	35.092
2.173	33.641
2.173	31.662
2.174	28.496
2.197	30.211
2.208	33.113
2.220	35.752
2.232	34.301
2.233	31.266
2.233	29.551
2.233	27.573
2.244	34.037
2.255	36.280
2.256	33.509
2.257	30.211
2.280	30.343
2.281	28.100
2.290	38.654
2.290	38.259
2.290	37.731
2.291	34.828
2.292	31.662
2.314	39.050
2.327	32.586
2.328	29.815
2.328	29.288
2.338	36.939
2.351	33.113
2.352	26.121
2.364	27.573
2.372	41.029
2.375	31.266
2.375	30.871
2.386	36.016
2.386	35.224
2.387	31.662
2.388	26.913
2.399	27.968
2.408	39.710
2.420	40.897
2.422	33.641
2.432	40.765
2.433	35.752
2.433	34.433
2.433	34.037
2.435	29.024
2.444	39.446
2.444	37.995
2.444	37.863
2.445	36.675
2.446	32.322
2.458	30.871
2.468	39.050
2.470	29.815
2.479	43.536
2.481	33.905
2.481	31.794
2.482	30.475
2.492	38.522
2.492	35.620
2.493	33.509
2.494	29.024
2.494	27.309
2.504	37.335
2.504	37.335
2.507	22.823
2.518	28.628
2.540	32.586
2.541	28.628
2.564	33.905
2.576	32.718
2.577	30.211
2.587	36.939
2.600	32.190
2.600	29.420
2.601	27.441
2.611	34.433
2.612	31.266
2.624	30.211
2.660	28.760
2.660	28.364
2.682	34.433
2.683	31.135
2.695	28.628
2.719	31.135
2.720	26.913
2.731	30.211
2.741	34.960
2.754	31.794
2.754	31.266
2.755	29.288
2.755	27.704
2.766	32.454
2.777	34.037
2.779	26.781
2.779	25.726
2.788	36.016
2.789	32.982
2.800	39.578
2.801	33.641
2.802	27.836
2.811	40.369
2.812	35.092
2.826	29.420
2.826	27.836
2.827	25.198
2.838	25.594
2.847	37.467
2.848	35.884
2.849	30.343
2.860	36.280
2.861	31.135
2.872	32.586
2.873	30.475
2.895	35.356
2.897	28.760
2.909	27.704
2.909	26.649
2.919	34.828
2.919	34.301
2.920	32.586
2.944	29.420
2.955	33.113
2.955	31.662
2.966	39.050
2.968	30.211
2.980	27.836
2.990	36.807
3.003	29.024
3.014	35.488
3.025	39.050
3.027	31.398
3.028	27.704
3.062	34.037
3.120	36.016
3.143	41.821
3.215	37.071
3.274	36.148
3.275	34.565
3.287	33.905
3.334	34.037
3.346	36.016
3.358	35.092
3.368	42.084
3.368	39.974
3.369	38.522
3.370	34.697
3.381	37.071
3.382	31.926
3.393	34.960
3.394	32.850
3.415	43.140
3.416	38.391
3.417	36.544
3.430	29.683
3.439	39.974
3.475	41.557
3.477	30.607
3.498	44.855
3.513	30.343
3.547	37.863
3.549	29.683
3.560	29.156
3.582	39.578
3.584	30.343
3.594	39.182
3.595	35.092
3.607	33.905
3.608	30.343
3.608	28.232
3.618	36.544
3.618	35.752
3.642	35.092
3.652	45.119
3.655	30.475
3.665	37.863
3.667	31.398
3.679	31.266
3.679	29.288
3.712	40.633
3.712	39.050
3.713	36.939
3.738	28.628
3.749	33.905
3.750	29.815
3.759	41.029
3.760	37.995
3.760	36.675
3.760	36.148
3.761	31.266
3.773	32.322
3.782	42.744
3.797	30.475
3.820	32.322
3.843	36.148
3.844	34.037
3.855	37.203
3.856	33.113
3.868	31.266
3.869	28.892
3.891	33.377
3.892	29.815
3.902	37.731
3.904	31.266
3.904	30.079
3.939	32.586
3.950	35.224
3.951	33.245
3.963	32.982
3.975	31.135
4.022	32.190
4.045	37.071
4.092	34.828
4.188	32.322
4.199	35.752
4.281	37.863
4.400	39.446
4.401	34.301
4.435	37.863
4.531	35.884
4.541	40.633
4.553	42.612
4.575	48.021
4.577	41.689
4.589	42.084
4.637	39.710
4.638	34.169
4.671	43.404
4.722	28.628
4.732	38.127
4.754	42.216
4.768	34.169
4.790	43.140
4.803	35.752
4.816	33.773
4.827	34.301
4.920	44.063
4.958	31.398
5.041	33.509
5.347	43.799
5.349	31.926
5.562	34.169
5.670	31.135
6.603	42.876
6.721	47.889
7.341	32.058];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5)*365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'}; 
temp.tL_f = C2K(26.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MurpMull2008'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.128	10.290
0.231	23.483
0.255	22.691
0.267	21.636
0.268	20.053
0.314	24.274
0.363	18.865
0.374	23.879
0.409	24.406
0.434	17.414
0.445	22.164
0.493	18.470
0.575	24.274
0.871	25.594
0.871	24.274
0.906	29.288
0.918	28.496
0.954	23.483
0.965	27.836
0.977	26.253
1.037	25.726
1.037	24.142
1.061	25.594
1.144	24.934
1.144	22.823
1.343	32.586
1.488	21.108
1.532	37.995
1.557	32.982
1.580	33.509
1.617	29.288
1.653	26.781
1.653	24.670
1.666	23.219
1.688	27.177
1.701	22.032
1.760	26.781
1.795	28.232
1.830	27.836
1.842	27.309
1.844	22.032
1.901	30.079
1.939	20.844
1.948	30.343
1.984	32.058
2.010	22.164
2.021	24.011
2.045	21.900
2.067	30.871
2.068	24.538
2.080	23.879
2.092	25.594
2.102	31.926
2.103	26.781
2.209	31.926
2.246	26.385
2.293	25.858
2.303	33.245
2.339	31.794
2.350	34.301
2.376	27.441
2.399	28.100
2.400	26.781
2.422	33.509
2.482	27.441
2.506	26.517
2.517	33.113
2.589	25.989
2.708	25.198
2.827	23.747
2.851	24.406
2.874	25.462
2.896	31.662
2.921	26.517
2.943	34.565
2.956	30.739
2.978	35.092
2.980	27.573
3.038	32.058
3.051	30.607
3.098	31.794
3.122	30.607
3.122	27.836
3.275	34.697
3.276	28.100
3.310	35.752
3.335	29.024
3.357	36.148
3.358	31.662
3.359	28.760
3.382	33.641
3.429	32.850
3.430	30.079
3.430	28.628
3.488	35.488
3.512	34.301
3.512	33.377
3.512	32.058
3.573	27.177
3.596	29.683
3.607	34.433
3.631	31.794
3.654	35.356
3.656	28.100
3.713	34.828
3.726	31.003
3.737	32.982
3.750	28.496
3.773	32.718
3.786	27.441
3.786	26.649
3.810	25.858
3.821	30.211
3.845	30.475
3.904	31.266
3.916	28.364
3.951	29.815
4.011	27.704
4.023	29.156
4.058	31.135
4.058	29.947
4.105	32.190
4.117	32.982
4.200	29.156
4.236	31.135
4.269	40.897
4.308	26.649
4.331	29.024
4.378	32.058
4.401	32.058
4.413	32.586
4.482	41.029
4.508	33.377
4.509	28.232
4.639	29.815
4.651	27.573
4.685	33.641
4.781	30.211
4.782	27.704
4.816	34.565
4.828	31.266
4.912	28.628
5.042	28.892
5.077	31.794
5.100	35.224
5.278	33.773
5.279	31.266
5.373	32.058
5.456	33.509
5.489	41.425
5.527	33.245
5.658	31.003
5.681	31.794
5.729	31.135
5.872	29.156
6.025	30.871
6.415	36.675
6.487	31.003
6.594	32.850
6.808	30.607
6.949	33.905];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5)*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'}; 
temp.tL_m = C2K(26.1); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MurpMull2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^2.82';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7CLG7'; % Cat of Life
metaData.links.id_ITIS = '168708'; % ITIS
metaData.links.id_EoL = '46578033'; % Ency of Life
metaData.links.id_Wiki = 'Trachinotus_carolinus'; % Wikipedia
metaData.links.id_ADW = 'Trachinotus_carolinus'; % ADW
metaData.links.id_Taxo = '45251'; % Taxonomicon
metaData.links.id_WoRMS = '159652'; % WoRMS
metaData.links.id_fishbase = 'Trachinotus-carolinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trachinotus_carolinus}}';  
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
bibkey = 'MurpMull2008'; type = 'techreport'; bib = [ ...
'author = {Murphy, M.D. and R.G. Muller and K. Guindon}, ' ...
'year = {2008}, ' ...
'title = {A stock assessment for pompano, \emph{Trachinotus carolinus}, in {F}lorida waters through 2005}, ' ... 
'institution = {Fish and Wildlife Research Institute, St. Petersburg, Florida}, ' ...
'volume = {FWRI In House Report 2008-004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Trachinotus-carolinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

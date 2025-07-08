function [data, auxData, metaData, txtData, weights] = mydata_Oplegnathus_woodwardi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Oplegnathidae';
metaData.species    = 'Oplegnathus_woodwardi'; 
metaData.species_en = 'Knifejaw'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'bpMp','piMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 29];

%% set data
% zero-variate data
data.ab = 11.8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(14.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 50*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'CoulWake2022';   
  temp.am = C2K(14.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 27.7;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'CoulWake2022';
  comment.Lp = 'based on tL data for t = 6 yr';
data.Li = 45;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 438.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','CoulWake2022'};
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 1.89e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1';
 
data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'CoulWake2022';
  temp.GSI = C2K(14.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (yr), total length (cm)
2.147	28.506
2.583	27.356
3.028	28.812
3.141	29.885
3.146	31.418
3.254	30.651
3.376	34.253
3.704	33.716
4.034	33.716
4.041	35.862
4.242	29.655
4.243	30.498
4.252	32.950
4.578	31.724
4.688	31.724
4.800	32.337
5.119	29.119
5.147	37.625
5.346	31.264
5.355	33.946
5.452	30.115
5.578	34.789
5.582	35.939
5.679	32.107
5.686	34.176
5.894	30.651
5.896	31.341
5.904	33.716
5.905	33.716
6.021	35.632
6.139	38.314
6.343	33.333
6.348	34.866
6.573	36.322
6.575	36.858
6.706	43.372
6.805	40.000
6.806	40.230
6.887	31.571
6.905	37.011
7.017	37.701
7.117	34.559
7.120	35.402
7.130	38.391
7.368	43.908
7.466	40.153
7.667	34.483
7.671	35.709
7.682	39.080
7.686	40.153
7.806	43.142
7.902	39.004
8.132	41.916
8.232	39.004
8.469	44.138
8.562	39.004
8.666	37.318
8.675	40.077
8.685	42.912
9.007	40.613
9.010	41.533
9.012	42.069
9.102	36.092
9.218	37.854
9.323	36.245
9.330	38.467
9.334	39.617
9.564	42.682
9.777	40.613
9.783	42.375
9.874	36.475
10.103	39.310
10.322	38.851
10.424	36.628
10.439	41.149
10.536	37.241
10.550	41.303
10.633	33.180
10.649	38.161
10.766	40.230
10.773	42.375
10.891	44.828
11.312	38.927
11.322	42.069
11.420	38.238
11.426	40.230
11.637	37.548
11.749	38.008
11.765	42.759
11.903	51.264
11.980	41.379
12.087	40.536
12.088	40.690
12.329	47.050
12.416	40.000
12.533	42.222
12.543	45.134
12.632	38.851
13.078	40.690
13.084	42.375
13.173	36.245
13.185	39.693
13.196	43.065
13.627	40.460
13.630	41.303
13.650	47.433
13.739	40.843
13.958	40.536
14.295	42.912
14.615	39.770
14.622	41.762
14.747	46.437
14.840	41.226
14.846	43.218
14.943	39.080
14.953	42.299
14.981	50.651
15.052	38.774
15.168	40.690
15.279	41.073
15.281	41.686
15.606	40.000
15.733	45.211
15.736	46.054
15.834	42.452
16.160	41.073
16.389	44.061
16.586	37.011
16.602	41.839
16.720	44.215
16.753	54.176
16.929	40.766
16.937	43.448
17.038	40.460
17.065	48.659
17.155	42.605
17.282	47.893
17.492	44.751
17.594	42.529
17.705	42.835
17.716	46.130
17.801	38.391
17.829	46.820
17.916	39.923
17.927	43.142
18.283	51.034
18.357	40.153
18.366	42.835
18.367	43.372
18.703	44.981
18.816	45.977
18.930	47.126
18.937	49.425
19.128	40.460
19.134	42.375
19.139	43.831
19.234	39.234
19.350	41.149
19.688	43.525
19.793	41.916
19.895	39.464
19.905	42.759
19.916	45.977
20.339	40.843
20.583	47.969
20.792	44.598
20.798	46.513
21.135	48.582
21.225	42.529
21.789	46.667
21.903	47.893
22.109	43.755
22.243	50.958
22.431	41.379
22.442	44.674
22.565	48.582
22.755	39.387
22.992	44.751
23.207	43.065
23.215	45.670
23.234	51.341
23.754	42.146
23.871	44.215
24.001	50.268
24.089	43.602
24.334	51.341
24.416	42.912
24.757	46.054
24.768	49.349
24.959	40.613
24.973	44.981
25.181	41.303
25.304	45.134
25.319	49.655
25.739	43.678
25.872	50.498
25.960	43.831
25.963	44.904
25.973	47.739
26.305	48.429
26.841	44.368
27.614	45.057
28.279	46.513
28.495	45.441
28.531	56.322
28.588	40.153
28.817	43.065
28.831	47.126
29.589	43.602
29.695	42.375
29.722	50.651
29.818	46.360
30.364	44.904
30.366	45.594
31.233	41.686
32.035	51.418
32.045	54.253
32.144	51.034
32.230	43.908
32.999	43.525
33.671	46.973
33.989	43.448
34.660	46.743
34.776	48.506
35.433	47.739
35.631	40.996
35.771	50.038
35.864	44.981
36.197	45.824
36.847	42.835
37.066	42.452
37.835	42.146
40.705	44.981
44.778	45.670
45.560	49.349
51.603	47.126];
data.tL_f(:,1) = (0 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(14.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulWake2022';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm)
1.898	29.655
3.219	29.272
3.220	28.582
3.443	27.126
4.208	29.502
4.313	32.490
4.315	31.188
4.757	30.038
4.869	29.119
5.302	33.257
5.306	30.881
5.517	35.479
5.739	34.406
6.733	32.797
6.951	33.640
7.064	32.031
7.931	38.927
8.273	32.414
9.264	31.877
9.910	39.770
10.797	36.092
12.436	42.375
12.891	33.716
12.995	37.011
13.328	35.709
13.764	38.084
15.313	33.103
16.073	38.774
16.522	33.870
16.618	41.533
17.387	41.992
17.713	43.831
18.047	41.916
18.933	38.391
19.152	39.234
19.923	38.774
20.243	44.138
20.684	43.602
20.695	37.471
21.023	38.927
22.453	38.851
22.551	45.517
25.082	44.904
25.310	40.766
25.861	40.077
27.724	44.138
27.843	39.157
27.947	42.682
28.506	37.548
30.480	41.073
32.351	40.383
37.637	37.548
46.206	43.831];
data.tL_m(:,1) = (0 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m = C2K(14.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulWake2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

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
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6SSBM'; % Cat of Life
metaData.links.id_ITIS = '645487'; % ITIS
metaData.links.id_EoL = '46578370'; % Ency of Life
metaData.links.id_Wiki = 'Oplegnathus_woodwardi'; % Wikipedia
metaData.links.id_ADW = 'Oplegnathus_woodwardi'; % ADW
metaData.links.id_Taxo = '183941'; % Taxonomicon
metaData.links.id_WoRMS = '218467'; % WoRMS
metaData.links.id_fishbase = 'Oplegnathus-woodwardi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Oplegnathus_woodwardi}}';  
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
bibkey = 'CoulWake2022'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.fishres.2022.106466}, ' ...
'author = {Peter G. Coulson and Corey B. Wakefield}, ' ...
'year = {2022}, ' ...
'title = {Reproduction, sexually dimorphic growth, exceptional longevity and low natural mortality of the knifejaw, \emph{Oplegnathus woodwardi}, from temperate waters in the south-eastern {I}ndian {O}cean}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {256}, '...
'pages = {106466}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oplegnathus-woodwardi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


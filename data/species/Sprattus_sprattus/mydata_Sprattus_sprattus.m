  function [data, auxData, metaData, txtData, weights] = mydata_Sprattus_sprattus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Sprattus_sprattus'; 
metaData.species_en = 'Sprat'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2013 04 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1     = [2018 01 10];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};        
metaData.date_mod_2     = [2023 03 21];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 21];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'average life span: 7-8 years, though max. age observed is 13 years old';

data.Lp = 11;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'VitaMitt2015';
data.Li = 16;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  
data.Wwb = 5.1e-4;   units.Wwb = 'g';   label.Wwb = 'weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.99 mm: pi/6*0.099^3';
data.Wwp = 9.08;   units.Wwp = 'g';   label.Wwp = 'weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Lp using F1';
data.Wwi = 28.6;   units.Wwi = 'g';   label.Wwi = 'ultimate weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Li using F1';

data.Ri = 78995/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fushbase';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data at unknown f and T = 273 + 10
% Data from Dulc1998
data.tL_1995 = [... % time since birth (d), standard length (cm)
0.000	0.708
0.001	0.643
0.967	0.741
1.946	0.740
4.051	0.785
4.976	1.087
4.978	0.942
4.979	0.896
8.010	1.177
8.011	1.144
10.945	1.353
11.972	1.431
12.021	1.385
13.929	1.470
15.006	1.509
15.055	1.476
15.936	1.541
15.985	1.501
16.962	1.672
16.963	1.613
17.939	1.750
17.940	1.697
17.941	1.638
18.917	1.822
18.918	1.769
18.919	1.730
19.018	1.677
19.946	1.821
19.947	1.769
23.957	2.036
23.958	1.990
24.007	1.944
24.887	2.029
25.915	2.087
29.928	2.138
32.914	2.182
36.928	2.246
36.929	2.194];
units.tL_1995 = {'d', 'cm'};     label.tL_1995 = {'time since birth', 'standard length'};  
  temp.tL_1995 = C2K(10.8); units.temp.tL_1995 = 'K'; label.temp.tL_1995 = 'temperature';
bibkey.tL_1995 = {'Dulc1998'};
%
data.tL_1996 = [... % time since birth (d), standard length (cm)
0.000	0.808
0.001	0.768
0.061	0.702
1.904	0.900
2.004	0.827
2.005	0.727
2.987	0.893
2.988	0.800
2.989	0.747
5.000	1.117
5.003	0.965
5.004	0.912
6.033	1.123
6.034	1.084
6.035	1.037
6.036	0.984
7.017	1.163
7.065	1.216
7.068	1.057
7.954	1.030
8.000	1.209
8.001	1.169
8.002	1.149
8.003	1.110
10.015	1.308
10.064	1.347
10.115	1.268
10.116	1.241
10.117	1.202
10.999	1.327
11.047	1.380
11.933	1.386
12.030	1.486
12.031	1.439
14.933	1.465
14.981	1.558
14.982	1.531
16.995	1.703
16.996	1.656
16.997	1.623
16.998	1.590
18.912	1.834
19.011	1.788
19.012	1.748
19.062	1.689
19.995	1.821
23.976	2.038
24.026	1.992
24.027	1.945
25.059	2.044
26.927	2.123
26.928	2.083
26.929	2.011
29.928	2.169
29.929	2.096
31.944	2.188
31.945	2.155
36.962	2.259
37.012	2.206];
units.tL_1996 = {'d', 'cm'};     label.tL_1996 = {'time since birth', 'standard length'};
  temp.tL_1996 = C2K(10.8);  units.temp.tL_1996 = 'K'; label.temp.tL_1996 = 'temperature';
bibkey.tL_1996 = {'Dulc1998'};

% time-length-weight
data.tLW = [ ... % year class (#), total length (cm), weight (g)
0	 8.614  3.353
1	11.228 11.329
2	13.052 17.130
3   13.872 20.393
4	14.480 22.568
5	14.480 21.480
6	15.301 25.831];
data.tLW(:,1) = 365 * ( 0.9 + data.tLW(:,1)); % convert to d with origin at birth
units.tLW = {'d','cm','g'}; label.tLW = {'time', 'total length', 'weight'};  
  temp.tLW = C2K(9.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'VitaMitt2015'; treat.tLW = {1, {'length','weight'}};
comment.tLW = 'Data from Kattegat. Temperature cycles between 3 and 16 C';
   
% LN-data from Tors1992 Fig 5, Friwrfjord, Norway 1985, 1986
% GSI is about 6%.
data.LN = [ ... % total length (cm), number of 1000 eggs
6.998	3.979
7.512	2.725
7.539	9.147
7.540	7.569
7.541	4.865
8.023	8.119
8.023	7.894
8.023	7.443
8.049	15.442
8.050	13.301
8.051	11.160
8.052	10.034
8.054	5.414
8.055	4.400
8.055	3.724
8.508	4.274
8.535	10.921
8.535	10.358
8.535	9.907
8.535	9.457
8.536	8.668
8.536	8.442
8.536	8.104
8.538	3.372
8.988	9.218
8.990	5.838
8.990	5.613
9.014	18.683
9.019	8.091
9.019	7.415
9.019	7.077
9.020	6.851
9.020	4.936
9.021	4.372
9.021	4.034
9.021	3.584
9.021	3.133
9.022	1.556
9.046	15.301
9.047	13.386
9.472	6.726
9.473	4.472
9.503	6.162
9.504	2.894
9.528	16.076
9.529	14.950
9.530	13.147
9.530	12.809
9.531	9.654
9.532	9.316
9.532	8.978
9.532	8.189
9.532	7.964
9.532	7.400
9.984	9.528
9.985	9.078
9.985	8.627
9.985	7.050
9.986	6.486
9.986	6.035
9.986	5.585
9.986	5.021
9.987	3.331
10.014	11.330
10.014	10.880
10.470	4.895
10.497	10.753
10.521	23.147
10.525	15.260
10.526	13.908
10.526	13.682
10.526	13.344
10.526	12.555
10.527	10.189
10.528	9.626
10.528	8.724
10.528	8.274
10.528	7.936
10.529	7.598
10.529	7.260
10.557	12.217
10.557	11.991
10.557	11.428
10.978	15.923
10.978	14.909
10.978	14.346
10.979	12.993
10.979	12.430
10.981	9.500
10.981	8.599
10.981	8.148
10.981	7.698
11.004	24.824
11.006	19.077
11.007	17.950
11.007	17.612
11.007	16.711
11.008	16.260
11.488	21.092
11.489	20.416
11.489	19.852
11.492	12.979
11.492	12.416
11.493	12.077
11.493	10.951
11.493	10.500
11.494	9.486
11.516	26.274
11.516	25.823
11.517	24.246
11.517	23.344
11.518	22.668
11.518	22.443
11.522	13.541
11.524	8.922
11.525	6.668
11.544	30.442
11.545	29.541
11.970	22.994
11.971	22.656
11.971	21.867
11.973	18.036
11.973	16.571
11.974	14.768
11.999	27.049
12.002	19.838
12.005	13.753
12.005	13.190
12.005	12.964
12.005	12.626
12.006	12.401
12.006	11.950
12.007	10.260
12.007	9.809
12.024	37.189
12.455	18.924
12.456	18.360
12.481	27.712
12.483	24.106
12.483	23.768
12.485	20.050
12.486	18.134
12.488	14.528
12.489	11.599
12.491	8.218
12.507	38.302
12.510	30.415
12.510	30.190
12.511	29.852
12.513	25.007
12.514	22.415
12.515	21.513
12.534	44.274
12.969	18.008
12.970	15.078
12.976	2.796
12.993	30.514
12.994	28.711
12.996	25.218
12.996	23.753
12.999	18.683
13.000	17.218
13.000	16.204
13.000	15.866
13.018	42.795
13.018	42.344
13.021	36.711
13.021	36.147
13.509	25.091
13.511	19.908
13.513	16.753
13.513	16.528
13.514	13.711
13.518	6.499
13.529	47.400
13.533	37.710
13.534	36.583
13.535	34.217
13.540	23.738
13.984	41.416
13.985	40.402
13.985	39.838
13.993	22.486
13.993	22.148
13.995	18.317
13.998	11.556
14.016	38.147
14.018	34.316
14.019	31.950
14.495	46.246
14.511	11.992
14.515	68.894
14.520	57.175
14.528	40.499
14.538	19.654
14.579	59.765
14.990	21.331
14.992	17.500
15.023	15.246
15.027	70.119
15.040	42.625];
units.LN = {'cm', '#'};     label.LN = {'total length', '1000 eggs'};  
  temp.LN = C2K(10.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'Tors1992'};

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
 7  2.1
15 27.9];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = {'Tors1992'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1996','tL_1995'};subtitle1 = {'Dulc1998 data for 1996, 1995'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_2: tLW, Wwb, Wwp, Wwi data added, tL data removed, Lp revised';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length: Ww in g = 0.0055 * (TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZDQT'; % Cat of Life
metaData.links.id_ITIS = '161789'; % ITIS
metaData.links.id_EoL = '46562439'; % Ency of Life
metaData.links.id_Wiki = 'Sprattus_sprattus'; % Wikipedia
metaData.links.id_ADW = 'Sprattus_sprattus'; % ADW
metaData.links.id_Taxo = '42676'; % Taxonomicon
metaData.links.id_WoRMS = '126425'; % WoRMS
metaData.links.id_fishbase = 'Sprattus-sprattus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Sprattus_sprattus}}';  
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
bibkey = 'Dulc1998'; type = 'Article'; bib = [ ...  
'author = {J. Dulcic}, ' ...
'year = {1998}, ' ...
'title = {Larval growth of sprat, \emph{Sprattus sprattus phalericus}, larvae in the {N}orthern {A}driatic}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = 36, '...
'pages = {117--126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Prod1997'; type = 'Techreport'; bib = [ ...    
'author = {Prodanov, K.}, ' ...
'year  = {1997}, ' ...
'title = {Studies \& revies 68; {G}eneral fisheries council for the {M}editerranean}, ' ...  
'series = {Environmental management of fish resources in the black Sea and their rational exploitation.}, ' ...
'institution = {FAO, Rome}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NuneSilv2011'; type = 'Article'; bib = [ ...    
'author = {Nunes, C. and A. Silva and V. Marques and K. Ganias}, ' ...
'year  = {2011}, ' ...
'title = {Integrating fish size, condition, and population demography in the estimation of {A}tlantic sardine annual fecundity}, ' ...  
'journal = {Ciencias Marinas}, ' ...
'volume = {37.4B}, ' ...
'pages = {565--584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VitaMitt2015'; type = 'Article'; bib = [ ...    
'author = {Francesca Vitale and Felix Mittermayer and Birgitta Krischansson and Marianne Johansson and Michele Casini}, ' ...
'year  = {2015}, ' ...
'title = {Growth and maturity of sprat (\emph{Sprattus sprattus}) in the {K}attegat and {S}kagerrak, eastern {N}orth {S}ea}, ' ...  
'journal = {Aquat. Living Resour}, ' ...
'volume = {28}, ' ...
'pages = {127–137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tors1992'; type = 'Techreport'; bib = [ ...    
'author = {Torstensen, E. }, ' ...
'year  = {1992}, ' ...
'title = {Fecundity studies on sprat, \emph{Sprattus sprattus} {L}., from a fjord on the {N}orwegian {S}kagerrak coast}, ' ...  
'institution = {Flodevigen rapportser 1}, ' ...
'ISSN = {0333-2594}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sprattus-sprattus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

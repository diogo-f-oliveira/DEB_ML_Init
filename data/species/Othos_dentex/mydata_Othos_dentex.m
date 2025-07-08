function [data, auxData, metaData, txtData, weights] = mydata_Othos_dentex
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anthiadidae';
metaData.species    = 'Othos_dentex'; 
metaData.species_en = 'Harlequin fish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 04];

%% set data
% zero-variate data

data.am = 42 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(17.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35.5;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'FrenPott2014'; 
data.Li  = 75;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = {'Wiki','fishbase'};

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 636;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'FrenPott2014';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 6e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri  = 9.4e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(17.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
 comment.Ri = 'based on rel fecundity of Epinephelus_aeneus: 3873271*6e3/24.6e3';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
3.044	24.917
3.183	25.840
3.319	28.420
4.026	27.137
4.157	31.743
4.853	35.987
4.860	32.671
5.422	33.413
5.530	49.440
5.700	35.073
5.849	31.206
5.974	39.128
5.977	37.471
6.119	36.735
6.134	29.551
6.825	35.821
6.958	39.874
6.972	32.690
7.094	42.086
7.116	31.586
7.524	38.406
7.648	46.881
7.677	32.513
7.800	41.356
7.806	38.224
7.813	34.909
7.932	45.778
8.081	41.727
8.097	33.806
8.355	45.414
8.362	41.914
8.373	36.572
8.508	39.704
8.787	40.996
8.794	37.497
9.063	43.762
9.355	38.423
9.359	36.765
9.618	47.820
9.626	43.952
9.909	43.033
10.196	40.641
10.199	38.983
10.614	42.855
10.622	38.803
10.757	41.567
11.032	44.886
11.734	45.997
11.748	38.813
11.749	38.629
11.873	46.920
11.879	44.157
11.885	41.393
11.893	37.341
12.153	47.843
12.169	39.922
12.305	42.503
12.450	40.109
12.578	46.558
12.581	45.452
12.866	43.797
13.164	35.510
13.165	35.142
13.300	37.722
13.681	58.542
13.706	46.015
13.985	47.492
14.269	46.205
14.559	42.155
14.687	48.419
15.114	46.581
15.245	51.003
15.250	48.977
15.254	46.951
16.239	47.144
16.242	45.670
16.801	48.070
16.804	46.228
16.937	50.098
17.088	45.494
17.649	46.604
17.923	50.291
17.926	49.002
17.928	47.896
18.626	50.850
18.779	44.773
19.185	53.066
19.745	54.545
20.171	52.891
20.314	51.971
20.871	55.108
20.881	50.318
20.891	45.161
21.435	54.560
21.857	55.301
22.140	54.567
22.978	57.706
23.408	54.210
24.672	56.064
25.089	58.647
25.102	52.199
26.082	55.156
27.484	58.300
28.479	54.073
32.693	59.638
32.832	60.560
33.126	54.484
37.199	59.863];
data.tL_f(:,1) = (0.2+data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(17.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FrenPott2014';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.937	18.396
4.081	34.094
4.521	34.438
4.692	36.746
5.227	33.512
5.334	24.161
5.743	39.627
5.749	36.511
5.821	44.475
5.839	35.587
6.110	32.238
6.274	38.240
6.355	41.818
6.455	35.468
6.552	31.197
6.799	39.622
6.892	37.082
6.986	34.542
7.158	36.389
7.326	40.428
7.416	39.158
7.596	37.541
7.687	35.694
7.763	41.811
8.033	39.155
8.118	40.655
8.390	36.267
8.553	42.847
8.900	45.500
8.999	39.959
9.084	41.459
9.088	39.612
9.093	37.303
9.254	44.459
9.517	45.266
9.529	39.033
9.613	41.226
9.792	39.609
9.868	45.842
10.042	46.649
10.053	41.454
10.054	40.993
10.149	37.067
10.659	46.531
10.759	40.412
11.017	43.528
11.195	42.603
11.198	40.987
11.276	45.720
11.625	47.334
11.629	45.487
11.721	43.294
11.811	42.485
11.975	48.718
11.990	41.215
12.417	47.446
12.502	49.062
12.509	45.714
12.578	55.295
12.687	44.559
12.858	47.098
12.955	42.942
13.030	49.175
13.037	45.827
13.475	46.979
13.645	49.749
13.831	44.900
14.176	48.477
14.881	48.127
15.059	47.088
15.144	48.588
15.501	45.931
15.580	50.548
15.934	49.508
15.944	44.659
16.109	50.199
17.254	49.963
17.261	46.500
17.523	47.653
17.695	49.269
17.782	49.961
18.394	52.151
18.403	47.649
19.717	50.529
21.213	50.984
22.263	54.096
23.058	52.707
23.938	53.049
24.018	56.858
24.815	54.777
24.905	53.391
25.436	52.234
25.518	55.235
26.320	50.383
26.407	50.729
27.462	51.532
29.041	54.180
30.100	52.905
30.359	55.444
30.885	56.711
31.502	55.900
31.768	54.975];
data.tL_m(:,1) = (0.2+data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(17.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FrenPott2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are supposed to differ froem females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01175*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4B2S5'; % Cat of Life
metaData.links.id_ITIS = '643319'; % ITIS
metaData.links.id_EoL = '46579583'; % Ency of Life
metaData.links.id_Wiki = 'Othos_dentex'; % Wikipedia
metaData.links.id_ADW = 'Othos_dentex'; % ADW
metaData.links.id_Taxo = '182347'; % Taxonomicon
metaData.links.id_WoRMS = '281948'; % WoRMS
metaData.links.id_fishbase = 'Othos-dentex'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Othos_dentex}}';
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
bibkey = 'FrenPott2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12258}, ' ...
'author = {French, B. and Potter, I. C. and Hesp, S. A. and Coulson, P. G. and Hall, N. G.}, ' ... 
'year = {2014}, ' ...
'title = {Biology of the harlequin fish \emph{Othos dentex} ({S}erranidae), with particular emphasis on sexual pattern and other reproductive characteristics}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {84(1)}, ' ...
'pages = {106–132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Othos-dentex.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


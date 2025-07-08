function [data, auxData, metaData, txtData, weights] = mydata_Zoarces_elongatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Hadropareia_middendorffii'; 
metaData.species_en = 'Eelpout'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 7*365;      units.am = 'd';    label.am = 'life span';        bibkey.am = 'Poez2016';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14.8;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'Poez2016'; 
  comment.Lp = '185--250 mm';
data.Li  = 26.7;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'Poez2016';

data.Wwb = 1.7e-2;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Poez2016';
  comment.Wwb = 'based on egg diameter of 3.2 mm (2.1 to 4.7 mm): pi/6*0.32^3';
data.Wwp = 13;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for female';    bibkey.Wwp = 'Poez2016';
data.Wwi = 73;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'Poez2016';

data.Ri  = 219/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 20 cm';    bibkey.Ri  = 'Poez2016';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [... % time (yr), total length (cm)
1.711	9.859
1.711	9.687
2.868	12.200
2.880	11.856
4.000	13.625
4.000	16.776
5.120	15.851
5.132	14.992
6.277	18.250
6.289	18.422
7.446	19.273]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Poez2016';
comment.tL_f = 'data for females'; 
%
data.tL_m = [... % time (yr), total length (cm)
1.711	9.629
1.711	9.228
2.831	11.685
2.880	11.971
3.988	14.370
4.000	13.968
5.120	15.221
5.157	15.966
6.302	19.281
6.314	17.104
7.446	22.024]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Poez2016';
comment.tL_m = 'data for males'; 

% time-weight
data.tW_f = [... % time (yr), total length (cm)
1.662	7.439
1.662	7.533
2.818	9.789
2.831	11.018
3.963	18.381
3.975	15.449
5.132	16.570
5.145	18.178
6.277	35.375
6.289	27.431
7.422	33.092]; 
data.tW_f(:,1) = (0.5 + data.tW_f(:,1)) * 365;
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Poez2016';
comment.tW_f = 'data for females'; 
%
data.tW_m = [... % time (yr), total length (cm)
1.662	7.439
1.686	7.439
2.818	10.073
2.843	8.465
3.963	12.802
3.975	15.355
5.132	17.989
5.157	20.163
6.289	21.474
6.289	28.282
7.434	39.995]; 
data.tW_m(:,1) = (0.5 + data.tW_m(:,1)) * 365;
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Poez2016';
comment.tW_m = 'data for males'; 

% length-fecundity
% time-length data
data.LN = [... % total length (cm), fecundity (#)
    15.43  124.7
    16.11   94.0
    17.03  120.0
    18.74  172.0
    20.00  219.0]; 
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Poez2016';

% length-weight
data.LW_f = [... % total length (cm), wet weight (g)
6.468	1.082
7.577	1.263
7.731	0.928
8.008	1.604
8.285	4.130
8.439	1.272
8.501	8.675
8.655	1.779
9.025	1.952
9.394	14.573
9.517	3.303
9.764	2.801
10.041	6.673
10.226	3.816
10.226	1.629
10.257	2.638
10.688	4.662
10.873	6.683
11.088	4.835
11.088	1.807
11.150	5.508
11.304	1.809
11.427	13.250
11.427	2.315
11.550	4.503
11.550	6.186
11.643	7.701
11.920	5.349
11.982	7.368
12.012	6.527
12.136	5.856
12.413	8.046
12.444	6.700
12.474	10.570
12.505	13.766
12.598	6.029
12.598	5.524
12.628	7.207
12.752	4.349
12.813	3.508
12.813	9.564
12.875	8.219
12.936	9.061
13.121	12.259
13.214	6.204
13.244	5.363
13.306	13.607
13.306	10.074
13.337	8.224
13.429	7.889
13.460	10.749
13.491	12.095
13.522	14.114
13.645	10.583
13.676	12.097
13.799	15.127
13.922	3.016
13.922	12.100
13.953	5.371
13.984	6.549
14.014	16.980
14.045	8.064
14.045	9.073
14.076	11.597
14.168	13.280
14.199	9.243
14.292	15.469
14.384	10.423
14.507	12.611
14.538	4.873
14.538	8.911
14.600	9.248
14.661	16.146
14.692	5.548
14.784	6.558
14.877	6.896
14.969	14.130
15.092	12.618
15.154	18.170
15.246	16.993
15.431	10.267
15.708	3.372
15.801	14.140
15.832	18.178
16.170	17.340
16.201	15.827
16.386	1.193
16.509	22.727
16.663	21.888
16.756	18.020
16.786	24.244
16.971	22.228
16.971	20.209
17.002	6.751
17.464	26.439
17.710	13.488
17.988	23.417
18.018	28.296
18.203	20.055
18.388	26.281
18.727	36.210
19.990	51.196
20.175	39.254
20.390	10.995
21.407	24.969
22.238	39.109]; 
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'female'};  
bibkey.LW_f = 'Poez2016';
comment.LW_f = 'data for females'; 
%
data.LW_m = [... % total length (cm), wet weight (g)
7.454	1.261
7.515	1.430
7.731	0.928
8.131	1.437
8.655	1.275
8.994	2.624
9.025	2.793
9.117	2.289
9.363	1.955
9.856	4.148
10.226	2.974
10.595	4.661
10.811	5.168
10.903	5.001
11.211	4.163
11.520	7.363
11.643	6.018
11.643	5.514
11.797	7.871
11.858	5.684
12.166	6.361
12.228	6.530
12.505	8.047
12.752	8.722
12.875	13.098
13.183	10.241
13.214	7.550
13.429	10.076
13.491	9.067
13.799	11.594
13.860	10.585
14.168	13.785
14.168	11.598
14.322	10.759
14.384	11.601
14.877	13.288
15.031	14.804
15.092	15.478
15.647	14.811
15.924	21.375
16.201	16.836
16.509	23.568
16.602	15.831
16.632	11.458
16.663	13.981
17.464	16.850
17.618	18.198
17.895	22.238
18.172	34.353
18.357	24.262
18.973	24.269
19.343	39.245
19.959	19.065
21.499	38.260
23.501	65.366
23.901	49.894
26.027	48.404
26.612	59.850
26.674	73.308]; 
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'male'};  
bibkey.LW_m = 'Poez2016';
comment.LW_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 50 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'abj has been applied since related species show acceleration; foetal development was ignored because of absence of its combination with abj. The effect is probably very small.';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3J796'; % Cat of Life
metaData.links.id_ITIS = '631058'; % ITIS
metaData.links.id_EoL = '46574781'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Hadropareia_middendorffii'; % ADW
metaData.links.id_Taxo = '691029'; % Taxonomicon
metaData.links.id_WoRMS = '280970'; % WoRMS
metaData.links.id_fishbase = 'Hadropareia-middendorffii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zoarcidae}}';
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
bibkey = 'Poez2016'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945215060156}, ' ...
'author = {E. A. Poezzhalova-Chegodaeva}, ' ... 
'year = {2016}, ' ...
'title = {First Data on the Biology of \emph{Hadropareia middendorffii} ({P}erciformes, {Z}oarcidae) in the {T}auysk {B}ay, the {S}ea of {O}khotsk}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {56}, ' ...
'pages = {89-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hadropareia_middendorffii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


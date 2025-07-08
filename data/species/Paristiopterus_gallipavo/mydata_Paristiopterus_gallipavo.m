function [data, auxData, metaData, txtData, weights] = mydata_Paristiopterus_gallipavo
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pentacerotidae';
metaData.species    = 'Paristiopterus_gallipavo'; 
metaData.species_en = 'Yellowspotted boarfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 07];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2016';   
  temp.am = C2K(15.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 49;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 2.44e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 20.9e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1';

data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'CoulHall2016';
  temp.GSI = C2K(17.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), total length (cm)
0.837	36.144
0.973	32.570
1.741	38.663
2.127	40.974
2.241	49.172
2.374	47.910
2.645	41.393
2.897	46.017
3.262	59.259
3.273	52.952
3.278	50.430
3.670	49.167
3.788	55.683
3.803	47.275
4.164	62.829
4.298	60.516
4.312	53.159
4.447	50.426
4.564	57.362
4.713	46.851
4.947	60.935
4.965	51.055
5.081	58.412
5.193	68.291
5.217	55.468
5.229	48.741
5.462	63.245
5.610	53.575
5.850	64.084
5.859	59.460
5.863	57.148
5.975	66.817
6.005	50.420
6.133	51.681
6.142	46.846
6.244	61.561
6.647	54.412
6.881	68.285
7.028	59.246
7.170	52.518
7.292	56.722
7.404	66.391
7.801	62.396
8.068	58.401
8.208	53.356
8.454	60.502
8.470	51.883
8.707	64.074
9.110	56.716
9.111	56.295
9.354	65.333
9.377	53.141
9.492	61.129
9.738	68.275
10.135	64.280
10.146	58.394
10.151	55.871
10.272	60.916
10.808	51.875
11.054	59.231
11.058	56.919
11.191	55.447
11.302	65.537
11.325	53.345
11.698	62.172
11.961	60.279
12.105	52.711
13.001	59.855
13.137	56.491
14.937	66.155
15.214	56.694
16.256	55.219
17.409	64.044
18.203	55.633
18.467	53.530
19.238	58.152
20.540	56.255
23.123	64.024
27.289	58.754];
data.tL_f(:,1) = (data.tL_f(:,1)+0)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(15.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2016';
%
data.tL_m = [... %  yr class (yr), total length (cm)
0.944	35.940
0.950	38.901
1.202	34.670
1.865	42.281
1.879	49.683
1.991	40.166
2.265	47.990
2.774	42.278
2.779	44.604
2.794	52.640
3.186	54.331
3.300	45.660
3.309	50.524
3.318	55.388
3.695	48.408
3.843	58.347
3.977	60.250
4.080	46.080
4.094	53.482
4.229	56.442
4.343	47.771
4.373	64.055
4.479	50.943
4.622	57.921
4.746	54.748
5.145	60.034
5.276	60.879
5.286	65.955
5.515	49.670
5.527	56.014
5.772	47.766
5.911	52.841
5.921	58.128
6.193	65.106
6.304	54.531
6.445	60.875
6.699	57.914
6.949	52.414
7.077	51.145
7.213	54.951
7.231	64.679
7.237	67.428
7.606	56.430
7.612	60.025
8.119	52.833
8.135	61.715
8.258	57.908
8.529	63.829
8.635	50.928
8.651	59.599
8.885	46.063
8.900	54.099
8.913	61.078
9.147	47.120
9.189	69.959
9.421	54.732
9.572	66.151
9.690	60.018
9.813	55.999
10.327	53.248
10.355	68.052
10.488	69.955
10.596	58.323
10.996	63.820
11.110	54.937
11.243	56.840
11.363	51.553
11.365	52.610
11.388	65.299
11.656	69.528
12.026	59.164
12.029	60.644
12.031	61.490
12.171	66.988
12.798	55.143
13.320	56.621
13.324	58.313
13.328	60.851
13.341	67.830
13.833	53.024
13.974	58.945
15.256	50.059
15.409	62.113
15.670	63.169
16.184	60.207
16.565	55.341
17.616	61.893
19.303	61.253
19.964	67.384
22.285	58.282
23.456	59.546
24.354	53.833
30.598	59.310
33.450	56.550
36.057	61.617];
data.tL_m(:,1) = (data.tL_m(:,1)+0)*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(15.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHall2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lp = 5 * weights.Lp;
weights.Wwi = 5 * weights.Wwi;
weights.GSI = 10 * weights.GSI;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01995*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DMY5'; % Cat of Life
metaData.links.id_ITIS = '645896'; % ITIS
metaData.links.id_EoL = '46581236'; % Ency of Life
metaData.links.id_Wiki = 'Paristiopterus_gallipavo'; % Wikipedia
metaData.links.id_ADW = 'Paristiopterus_gallipavo'; % ADW
metaData.links.id_Taxo = '153641'; % Taxonomicon
metaData.links.id_WoRMS = '282149'; % WoRMS
metaData.links.id_fishbase = 'Paristiopterus-gallipavo'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paristiopterus_gallipavo}}';
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
bibkey = 'CoulHall2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13049}, ' ...
'author = {Coulson, P.G. and N.G. Hall and I.C. Potter}, ' ... 
'year = {2016}, ' ...
'title = {Biological characteristics of three co-occurring species of armorhead from different genera vary markedly from previous results for the {P}entacerotidae}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {89(4)}, ' ...
'pages = {1393-1418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Paristiopterus-gallipavo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


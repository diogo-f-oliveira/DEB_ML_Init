  function [data, auxData, metaData, txtData, weights] = mydata_Chasmistes_cujus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Chasmistes_cujus'; 
metaData.species_en = 'Cui-ui'; 

metaData.ecoCode.climate = {'Dsa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.ab = 12;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'WarrBurr2014';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'incubation time for Chasmistes table 13.4 - life history of Chasmiste is 9 d - time to first feeding is likely a bit longer; temp is guessed';
data.tp = mean([5,7])*365;   units.tp = 'd';  label.tp = 'life span';                       bibkey.tp = 'WarrBurr2014';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guessed temp and we here took the mean value of age at puberty from table 13.4 - life history of Chasmistes.';
data.am = 44 * 365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'WarrBurr2014';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guessed temp; 44+ years table 13.4 - life history of Chasmiste; the source says 44+, fishbase says 40+ for this species.';
  
data.Lp = mean([44,49]);  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'WarrBurr2014'; 
    comment.Lp = 'mean value of length at puberty from table 13.4 - life history of Chasmistes.'; 
data.Li = 70;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fws';
 comment.Li= '27.5 inches';
 
data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = {'guess', 'WarrBurr2014'};
  comment.Wwb = 'Computed from egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 3493; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'fws';
 comment.Wwi= '7.7 lbs';
 
data.Ri = 60000/365;   units.Ri = '#/d';  label.Ri = 'Ultimate reprod rate';    bibkey.Ri = 'WarrBurr2014';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed; max value from table 13.4 - life history of Chasmistes.';
 
% univariate data
% time-length
data.tL_f = [ ... % yr class (yr), fork length (cm); FL is about equal to TL
0.066	1.675
0.326	9.045
0.398	4.022
1.328	11.732
1.392	15.751
2.258	20.112
2.327	17.433
2.328	16.428
2.591	21.454
2.594	19.110
2.857	24.136
3.061	20.788
3.323	26.484
3.393	23.135
3.395	21.795
3.457	26.150
3.860	25.483
3.990	29.838
3.997	21.800
4.124	29.839
4.261	26.156
4.323	31.515
4.522	33.526
4.729	26.829
4.929	27.835
4.992	31.520
4.994	29.845
5.124	34.535
5.394	31.858
5.990	38.561
5.992	36.551
6.063	32.868
6.388	43.253
6.986	47.946
7.049	51.631
7.055	45.267
7.126	41.249
7.858	45.943
7.923	47.953
7.994	43.600
8.118	54.318
8.924	51.645
8.927	48.965
8.989	53.990
8.996	46.287
9.796	50.647
9.861	52.657
9.926	54.667
10.057	57.012
10.928	56.684
10.930	54.674
10.932	52.330
10.993	59.029
11.736	52.336
11.929	61.045
12.067	56.022
12.203	54.014
12.867	60.382
12.870	57.033
12.873	53.349
12.874	53.014
14.206	60.727
14.208	58.718
14.210	56.038
14.212	54.364
14.875	61.402
14.877	58.388
14.945	57.718
14.948	54.369
15.018	51.020
15.812	61.409
15.882	58.060
15.885	55.716
15.953	53.707
16.953	58.738
16.955	57.063
16.957	55.054
16.960	51.705
17.013	66.107
17.016	63.428
17.019	60.078
18.964	56.744
25.123	58.799
26.128	57.802
28.000	61.165
28.003	58.151
28.072	55.472
28.130	64.850
28.199	63.176
32.015	64.209
32.085	60.860
32.221	58.852
33.085	65.557
33.088	61.873
33.091	59.193
33.096	53.834
33.151	66.562
34.025	62.884
34.230	58.532
34.428	61.213
34.892	66.575
35.970	59.550
36.034	62.899
37.840	64.587
41.054	65.281
41.056	62.937];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Scop1988';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % yr class (yr), fork length (cm); FL is about equal to TL
0.017	1.346
0.216	3.366
0.282	4.713
0.412	8.416
1.146	11.450
1.208	16.499
2.008	20.543
2.011	16.841
2.339	24.584
2.546	17.855
2.879	19.540
2.943	23.243
3.210	23.918
3.213	20.889
3.274	26.274
3.610	25.267
3.873	30.317
4.140	30.992
4.143	27.963
4.150	21.569
4.280	25.272
4.339	33.349
4.866	42.440
4.876	31.670
4.879	28.978
4.941	34.700
5.344	33.020
5.879	34.034
5.943	36.727
6.072	42.112
6.074	39.420
7.005	46.158
7.009	42.792
7.011	40.773
7.080	38.081
7.745	43.471
7.875	46.837
8.946	47.855
9.008	52.567
9.077	50.548
9.744	53.918
9.879	52.573
9.881	50.217
9.883	48.198
10.091	40.796
11.015	55.274
11.084	52.246
11.885	54.944
11.889	51.579
11.889	50.906
12.826	51.922
12.829	48.893
12.958	53.942
13.023	56.299
13.032	46.539
13.962	54.623
13.964	52.267
13.965	50.921
14.896	57.995
14.901	52.274
15.100	54.968
15.239	49.584
15.766	58.002
15.771	53.290
16.037	54.975
16.175	50.601
16.839	57.000
17.043	53.636
17.046	50.944
27.083	58.087
28.025	53.719
32.109	55.095
33.111	57.122
33.115	53.420
35.859	54.450
35.990	57.144
35.995	52.095];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Scop1988';
comment.tL_m = 'data for males';

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'We use life history data for Chasmistes that were compiled in WarrBurr2014, when no other source was available for this species in particular.';  
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'TQ6Z'; % Cat of Life
metaData.links.id_ITIS = '163962'; % ITIS
metaData.links.id_EoL = '207085'; % Ency of Life
metaData.links.id_Wiki = 'Chasmistes_cujus'; % Wikipedia
metaData.links.id_ADW = 'Chasmistes_cujus'; % ADW
metaData.links.id_Taxo = '170616'; % Taxonomicon
metaData.links.id_WoRMS = '1383103'; % WoRMS
metaData.links.id_fishbase = 'Chasmistes-cujus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chasmistes_cujus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fws'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fws.gov/nevada/protected_species/fish/species/cuiui.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Chasmistes-cujus}}';  
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
 bibkey = 'WarrBurr2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Melvin L. Jr. Warren and Brooks M. Burr}, ' ...
'year = {2014}, ' ...
'title  = {Freshwater Fishes of North America: Volume 1: Petromyzontidae to Catostomidae}, ' ...
'publisher = {JHU Press, Science}, ' ...
'pages = {664}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Scop1988'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1988)117<0301:GALOTC>2.3.CO;2}, ' ...
'author = {G. Gary Scoppettone}, ' ...
'year = {1988}, ' ...
'title = {Growth and longevity of the cui-ui and longevity of other catostomids and cyprinids in western {N}orth {A}merica}, ' ... 
'journal = {Transactions of the American Fisheries society}, ' ...
'volume = {117}, '...
'pages = {301-307}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


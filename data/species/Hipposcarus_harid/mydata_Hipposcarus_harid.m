function [data, auxData, metaData, txtData, weights] = mydata_Hipposcarus_harid
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Hipposcarus_harid'; 
metaData.species_en = 'Candelamoa parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 11];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Lim  = 75;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 526; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01318*Lp^2.98, see F1';
data.Wwi = 5.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^2.98, see F1; max published weight 2.3 kg';

data.GSI = 3*0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps, assumed: 3 spawnings per year';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 14.26 14.58
    2 20.82 21.20
    3 25.82 25.65
    4 29.34 29.73
    5 32.80 33.24
    6 NaN   35.96
    7 NaN   38.60
    8 NaN   41.12
    9 NaN   43.57
   10 NaN   45.34
   11 NaN   46.79];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(28.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MallGabr2020'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
12.290	30.668
12.934	40.861
14.293	46.218
14.436	51.269
14.866	61.408
15.009	66.460
15.224	66.514
15.581	66.604
15.868	71.691
16.154	76.778
16.440	76.850
16.512	76.868
16.726	86.953
17.084	77.012
17.299	77.066
17.370	82.099
17.800	92.238
17.871	87.240
18.229	87.330
18.372	92.382
18.658	97.469
18.801	112.552
19.231	112.660
19.517	122.763
19.732	127.832
19.946	137.918
20.089	153.001
20.233	143.005
20.376	138.025
20.733	143.131
20.877	148.182
20.948	143.185
21.020	168.281
21.306	148.290
21.449	143.310
21.521	178.438
21.735	163.445
21.878	203.606
21.950	158.483
22.021	173.548
22.093	188.613
22.093	193.628
22.522	173.673
22.594	203.785
22.665	183.741
22.737	203.821
22.880	173.763
23.095	213.942
23.309	188.918
23.309	193.933
23.381	214.014
23.739	244.198
23.810	214.122
23.882	204.108
24.025	204.144
24.168	219.227
24.383	254.391
24.597	209.304
24.669	234.400
24.669	269.510
25.027	214.427
25.027	244.521
25.170	269.635
25.313	249.608
25.456	269.707
25.528	284.772
25.886	259.783
26.100	289.931
26.243	249.842
26.386	310.066
26.386	264.925
26.530	295.054
26.744	280.061
26.887	325.238
27.030	315.243
27.030	260.070
27.174	335.341
27.174	260.106
27.317	295.252
27.388	320.348
27.460	285.256
27.674	340.483
27.889	370.631
27.889	285.364
27.961	295.413
28.032	380.698
28.104	345.606
28.318	390.801
28.318	320.582
28.462	345.696
28.819	375.879
28.962	355.853
29.177	426.126
29.320	310.801
29.535	406.153
29.535	451.294
29.893	361.102
29.964	421.308
30.107	456.453
30.322	376.256
30.465	441.496
30.465	386.324
30.537	466.592
30.537	356.248
30.823	431.554
31.038	461.702
31.109	386.485
31.467	532.029
31.467	461.810
31.682	466.879
31.896	481.980
32.326	391.806
32.397	557.341
32.612	447.050
32.683	502.240
33.113	522.411
33.256	472.290
33.470	597.736
33.614	477.395
33.685	527.570
34.043	542.707
34.114	507.615
34.472	633.097
34.472	567.893
35.259	613.231
35.403	683.487
35.832	698.641
35.975	568.270
36.619	728.933
36.905	678.848
37.120	734.074
37.549	699.072
37.692	663.998
37.907	784.428
38.479	764.509
40.411	910.448
42.129	1066.365
43.989	1101.941
45.206	1197.544
48.068	1418.951];
units.LW   = {'d', 'cm'};  label.LW = {'time since birth', 'total length'};  
bibkey.LW = 'MallGabr2020'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01318*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3M35N'; % Cat of Life
metaData.links.id_ITIS = '613236'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Hipposcarus_harid'; % Wikipedia
metaData.links.id_ADW = 'Hipposcarus_harid'; % ADW
metaData.links.id_Taxo = '176740'; % Taxonomicon
metaData.links.id_WoRMS = '219090'; % WoRMS
metaData.links.id_fishbase = 'Hipposcarus_harid'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hipposcarus_harid}}';
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
bibkey = 'MallGabr2020'; type = 'Article'; bib = [ ... 
'doi = {10.17582/journal.pjz/20170729030714}, ' ...
'author = {Ahmad Osman Mal1 and Mohamed Hosny Gabr}, ' ... 
'year = {2020}, ' ...
'title = {Stock Assessment of Two Parrotfish, \emph{Hipposcarus harid} and \emph{Scarus ferrugineus} in Jeddah, Saudi Arabia}, ' ...
'journal = {Pakistan J. Zool}, ' ...
'pages = {1-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Hipposcarus-harid.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


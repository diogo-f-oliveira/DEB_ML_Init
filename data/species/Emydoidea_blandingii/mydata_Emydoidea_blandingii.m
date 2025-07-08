function [data, auxData, metaData, txtData, weights] = mydata_Emydoidea_blandingii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Emydoidea_blandingii'; 
metaData.species_en = 'Blanding''s turtle';

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl','biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 55;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '45-65 d';
data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(17);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 44*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.2; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Wiki';
  comment.Lb = '27-39 mm';
data.Li = 28.7; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';
data.Lim = 22.3; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'ADW';

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = '5.2-14 g';
data.Wwi = 5000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'ADW';

data.Ri  = 16/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12-20 eggs per clutch, 1 clutch per yr assumed';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
2.876	3.788
3.944	5.292
5.094	6.421
5.849	8.159
6.853	8.536
7.922	9.993
8.884	13.985
9.668	13.188
10.660	14.598
11.669	14.506
12.743	15.541
13.812	16.951
14.667	16.858
15.593	17.235
16.593	17.894
17.589	18.975
18.671	19.259
19.601	19.307
20.455	19.308
21.458	19.685
22.393	19.311
23.400	19.454
24.251	19.596
25.336	19.644
26.349	19.223
27.199	19.553
28.365	19.273
29.213	19.697
30.148	19.323
31.002	19.277
32.088	19.279
33.096	19.281
34.097	19.846
34.953	19.659
36.054	18.346
36.894	19.474
37.984	19.053
40.688	19.950
41.857	19.482
42.697	20.610
43.557	20.001
44.801	19.721
45.581	19.347
46.507	19.724
47.516	19.678
48.455	18.976
49.381	19.353
50.313	19.260
51.166	19.215
52.173	19.357
53.098	19.781
54.260	19.924];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CongLobe1991';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
2.428	3.720
3.415	5.086
4.284	6.451
5.328	8.004
6.376	8.950
7.193	9.472
8.346	12.149
9.227	11.924
10.211	13.711
11.150	13.579
12.133	15.413
13.003	16.684
14.117	16.601
14.999	16.329
15.993	16.665
16.858	18.685
18.016	20.567
18.847	19.265
19.894	20.351
20.834	20.126
21.831	19.995
22.710	20.097
23.647	20.199
24.644	20.208
25.581	20.264
26.458	20.693
27.574	20.283
28.455	20.150
29.447	20.721
30.388	20.309
31.386	20.178
32.268	19.765
33.144	20.335
34.373	20.533];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CongLobe1991';
comment.tL_m = 'Data for males; temp is guessed';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
2.823	8.860
4.034	24.000
4.922	36.121
5.969	75.720
7.177	145.851
7.903	154.935
9.102	383.926
9.669	365.533
10.633	454.021
11.844	469.161
12.809	551.539
13.448	682.832
14.655	752.963
15.705	749.791
16.671	823.004
16.751	835.215
17.632	969.537
18.597	1042.749
19.565	1060.971
20.533	1091.414
21.665	1069.903
22.555	1030.089
23.441	1078.871
24.408	1118.478
25.296	1118.380
26.348	1084.658
27.314	1145.650
28.366	1108.874
29.090	1157.673
30.224	1108.667
31.193	1108.559
32.162	1105.397
33.050	1105.298
34.014	1202.951
34.905	1153.972
36.130	903.327
37.084	1196.500
39.825	1284.790
40.794	1284.682
41.537	994.376
42.815	1256.963
43.628	1143.838
44.598	1143.730
45.730	1103.889
46.618	1116.011
47.505	1140.352
48.476	1112.749
49.287	1048.504
50.333	1118.653
51.225	1057.454
52.109	1133.731
53.232	1271.080
54.526	1246.497];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(17);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'CongLobe1991';
comment.tWw_f = 'Data for females; temp is guessed';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
2.592	7.401
3.414	23.031
4.553	35.779
5.437	78.823
6.259	109.666
7.271	125.392
8.341	265.894
9.100	269.322
10.171	379.399
11.183	395.125
12.129	492.967
13.074	599.937
14.083	682.599
14.909	597.825
15.983	640.966
16.920	930.488
17.800	1076.979
18.627	986.120
19.696	1138.793
20.583	1117.944
21.660	1100.235
22.673	1100.748
23.556	1171.176
24.442	1162.497
25.454	1172.138
26.402	1215.215
27.415	1206.601
28.367	1137.104
29.187	1207.500
30.391	1165.514
31.089	1129.357
32.038	1138.966
32.921	1218.521];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(17);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'CongLobe1991';
comment.tWw_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Temperatures < 28 C give males > 30 C females';
metaData.bibkey.F1 = 'ADW';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '886SH'; % Cat of Life
metaData.links.id_ITIS = '173789'; % ITIS
metaData.links.id_EoL = '1056352'; % Ency of Life
metaData.links.id_Wiki = 'Emydoidea_blandingii'; % Wikipedia
metaData.links.id_ADW = 'Emydoidea_blandingii'; % ADW
metaData.links.id_Taxo = '48620'; % Taxonomicon
metaData.links.id_WoRMS = '1463693'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Emys_blandingii&species=blandingii'; % ReptileDB
metaData.links.id_AnAge = 'Emydoidea_blandingii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Emydoidea_blandingii}}';
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
bibkey = 'CongLobe1991'; type = 'Article'; bib = [ ... 
'author = {Justin D. Congdon and Richard C. van Loben Sels}, ' ... 
'year = {1991}, ' ...
'title = {Growth and body size in Blanding''s turtles (\emph{Emydoidea blandingi}): relationships to reproduction}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {69}, ' ...
'pages = {239-245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Emydoidea_blandingii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055547}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Emydoidea_blandingii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


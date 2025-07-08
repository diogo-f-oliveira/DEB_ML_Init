  function [data, auxData, metaData, txtData, weights] = mydata_Loricariichthys_anus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Loricariidae';
metaData.species    = 'Loricariichthys_anus'; 
metaData.species_en = 'Viola'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 29];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'BrusPere1997';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 46;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.4e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BailBatis2011';
  comment.Wwb = 'based on egg diameter of 1.67 mm of Loricariichthys platymetopon: pi/6*0.167^3';
data.Wwp = 68.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00347*Lp^3.25, see F1';
data.Wwi = 879.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00347*Li^3.25, see F1';

data.Ri = 880*7.6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'BailBatis2011';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Loricariichthys platymetopon: Rel Fecundity 7.6/g';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.752	21.377
1.874	22.538
2.076	28.663
2.231	31.479
2.399	32.475
2.794	30.002
2.947	31.990
3.132	34.310
3.286	36.464
3.392	36.797
3.788	35.813
3.910	35.815
4.139	36.482
4.231	37.311
4.856	37.820
4.963	38.484
5.802	39.163
6.488	39.674];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrusPere1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.194	21.869
1.360	25.017
1.511	26.838
1.708	30.317
1.876	30.642
2.229	29.133
2.396	29.956
2.518	31.611
2.715	34.094
2.899	33.422
3.220	33.077
3.342	33.736
3.557	33.561
3.709	34.717
4.213	35.526
4.381	35.187];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrusPere1997';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), total length (cm)
1.666	33.799
1.834	44.149
2.050	104.914
2.174	141.967
2.404	155.272
2.677	122.594
2.846	147.775
3.031	187.783
3.186	241.144
3.400	244.070
3.704	218.802
3.888	238.048
4.056	238.016
4.195	263.203
4.729	263.104
5.723	294.063];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
  temp.tW_f = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BrusPere1997';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), total length (cm)
1.139	44.681
1.354	62.553
1.475	89.362
1.672	129.574
1.857	137.021
2.214	111.702
2.367	128.085
2.489	144.468
2.640	184.681
2.826	186.170
3.182	166.809
3.336	175.745
3.505	181.702
3.658	199.574
4.121	210.000
4.368	205.532];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
units.tW_m = {'d', 'cm'};  label.tW_m = {'time since birth', 'weight', 'males'};  
  temp.tW_m = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BrusPere1997';
comment.tW_m = 'Data for males';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
16.536	16.333
19.884	33.953
19.977	38.589
20.264	30.510
20.639	36.326
20.967	42.138
21.348	36.380
22.195	45.705
22.284	56.129
22.619	48.053
22.849	60.802
23.042	53.872
23.141	44.621
23.468	51.590
23.934	65.515
24.359	67.863
24.509	49.356
24.553	56.304
24.785	66.738
25.116	65.606
25.159	74.869
26.341	73.803
26.429	87.698
26.949	88.896
26.951	83.109
27.086	98.166
27.228	98.177
27.284	79.662
27.421	90.090
27.988	88.976
28.220	99.411
28.405	108.684
28.552	97.121
28.694	97.132
28.919	120.298
29.068	105.263
29.251	118.009
29.303	108.753
29.492	107.611
29.820	114.580
29.920	103.014
30.136	144.697
30.238	129.659
30.991	137.819
31.043	127.406
31.407	156.369
31.561	130.918
31.594	162.171
31.650	143.657
31.695	148.290
31.931	148.308
32.058	179.568
32.115	159.896
32.449	152.978
32.959	172.693
33.090	195.851
33.288	177.348
33.380	181.985
33.424	190.090
33.667	176.220
33.752	194.745
33.940	197.074
34.133	190.145
34.456	206.373
34.460	198.272
34.594	214.486
34.940	183.262
34.973	212.200
35.149	241.149
35.307	206.439
35.350	214.544
35.489	221.499
35.625	234.241
35.678	221.514
35.778	209.947
36.005	228.484
36.159	204.190
36.378	241.244
36.519	241.255
36.667	228.535
36.796	255.165
36.985	255.180
37.115	281.810
37.166	273.712
37.300	289.926
37.367	247.107
37.377	227.432
37.686	273.752
37.716	309.634
37.737	265.654
37.849	228.626
37.967	279.561
38.054	294.614
38.134	325.870
38.161	268.002
38.340	288.849
38.355	258.757
38.599	241.415
38.626	285.399
38.755	312.029
38.909	285.421
39.002	290.057
39.227	313.223
39.379	292.401
39.407	331.755
39.607	308.623
40.032	310.970
40.076	316.761
40.389	354.979
40.429	370.029
40.761	368.897
40.909	355.019
41.086	380.496
41.132	382.814
41.464	380.525
41.471	366.637
43.449	481.373
43.583	398.050
43.800	438.576];
units.LW = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'BrusPere1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;
weights.Li = weights.Li * 3;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00347*(TL in cm)^3.25'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QNY6'; % Cat of Life
metaData.links.id_ITIS = '680456'; % ITIS
metaData.links.id_EoL = '209906'; % Ency of Life
metaData.links.id_Wiki = 'Loricariichthys_anus'; % Wikipedia
metaData.links.id_ADW = 'Loricariichthys_anus'; % ADW
metaData.links.id_Taxo = '179130'; % Taxonomicon
metaData.links.id_WoRMS = '1022586'; % WoRMS
metaData.links.id_fishbase = 'Loricariichthys-anus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Loricariichthys_anus}}';  
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
bibkey = 'BrusPere1997'; type = 'Article'; bib = [ ...
'doi = {10.1080/01650528809360759}, ' ...
'author = {Bruschi-Junior, W. and Peret, A. C. and Verani, J. R. and Fialho, C. B.}, ' ...
'year = {1997}, ' ...
'title = {Crescimento de \emph{Loricariichthys anus} ({V}alenciennes, 1840) na lagoa {E}mboaba, {O}s\''{o}rio, {R}io {G}rande do {S}ul}, ' ... 
'journal = {Boletim do Instituto de Pesca}, ' ...
'volume = {24}, '...
'pages = {65-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BailBatis2011'; type = 'Article'; bib = [ ...
'author = {Dayani Bailly and Val\''{e}ria Fl\''{a}via Batista-Silva and Milza Celi Fedatto Abelha and Elaine Antoniassi Luiz Kashiwaqui and Carlos Alexandre Fernandes and Edson Dias de Carvalho}, ' ...
'year = {2011}, ' ...
'title = {Relative abundance and reproductive tactics of a {L}oricariidae species at {S}araiva {L}agoon, {I}lha {G}rande {N}ational {P}ark, {MS}-{PR}, {B}razil}, ' ... 
'journal = {Biota Neotrop.}, ' ...
'volume = {11(3)}, '...
'pages = {65-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Loricariichthys-anus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


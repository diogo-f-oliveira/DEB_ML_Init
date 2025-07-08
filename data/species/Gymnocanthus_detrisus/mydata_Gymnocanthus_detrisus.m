function [data, auxData, metaData, txtData, weights] = mydata_Gymnocanthus_detrisus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Gymnocanthus_detrisus'; 
metaData.species_en = 'Purplegray sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 3 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 16 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Panc2012';   
  temp.am = C2K(7.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Panc2012'; 
  comment.Lp = 'based on ap = 3 yr, from tL_f data';
data.Lpm  = 17.7;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Panc2012'; 
  comment.Lpm = 'based on ap = 3 yr, from tL_m data';
data.Li  = 36;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'Panc2010';
  comment.Li = 'fishbase give 29 cm';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
 
data.Ri = 7e3/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94 as found for Cottis volki';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 8.8
    2 14.7
    3 18.8
    4 21.6
    5 23.4
    6 25.1
    7 26.4
    8 27.6
    9 28.6
   10 29.6
   11 30.4
   12 30.9
   13 31.4
   14 32.2
   15 33.6];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Panc2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1 8.8
    2 14.1
    3 17.7
    4 20.1
    5 21.8
    6 23.1
    7 24.0
    8 25.0
    9 25.8
   10 26.4
   11 27.3
   12 28.6];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Panc2012';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
3.990	1.429
4.397	2.885
5.168	4.750
5.621	8.452
6.029	5.695
6.347	2.936
8.567	19.600
8.704	9.456
9.429	16.855
9.609	24.240
10.199	24.255
10.199	17.798
11.105	22.434
11.558	27.981
11.603	36.285
12.284	26.155
12.691	36.314
13.191	23.412
13.280	41.864
13.826	22.506
14.141	41.887
14.597	18.836
14.639	51.125
14.777	31.756
15.046	59.438
15.773	47.465
15.816	67.761
16.134	65.002
16.272	42.866
16.858	76.091
16.906	53.030
17.043	38.273
17.404	60.423
17.675	71.500
17.768	46.595
18.036	83.502
18.309	82.587
18.310	64.137
18.762	83.522
18.809	68.763
18.810	55.848
19.214	100.139
19.306	86.303
19.306	78.923
19.398	68.778
19.666	109.376
19.714	80.779
19.762	57.718
19.942	66.948
20.166	94.629
20.439	85.411
20.526	126.926
20.574	101.097
20.663	120.472
20.938	85.424
21.071	113.103
21.164	94.655
21.341	138.940
21.388	122.336
21.568	135.256
21.572	88.208
21.612	151.862
21.706	115.887
22.115	104.828
22.156	150.032
22.340	126.051
22.517	172.181
22.565	139.895
22.659	106.687
22.884	116.841
23.017	160.202
23.019	133.449
23.287	178.659
23.288	162.977
23.381	138.994
23.652	151.916
23.693	198.043
23.786	169.447
23.830	186.976
23.880	142.697
23.919	203.584
24.330	170.384
24.375	181.455
24.377	161.160
24.469	138.100
24.644	212.828
24.691	193.456
24.695	152.866
24.824	225.748
25.007	204.535
25.010	175.015
25.095	236.825
25.324	217.458
25.327	182.403
25.463	174.104
25.594	232.226
25.684	243.298
25.688	198.095
25.773	260.828
25.958	223.933
26.050	200.872
26.228	237.777
26.234	175.047
26.369	185.198
26.458	210.108
26.507	164.907
26.634	259.928
26.724	271.923
26.820	216.575
26.864	224.879
26.908	247.943
26.911	205.508
27.086	281.158
27.181	232.267
27.354	327.290
27.358	275.630
27.360	260.870
27.534	341.133
27.543	241.502
27.681	220.288
27.722	265.492
27.760	352.209
27.854	305.163
27.856	286.713
27.900	298.707
27.952	230.443
28.086	253.509
28.087	238.749
28.216	319.011
28.220	271.963
28.259	341.152
28.356	273.811
28.625	303.339
28.712	352.234
28.804	329.174
28.811	260.908
28.851	312.570
28.854	283.050
29.038	248.922
29.125	290.437
29.165	346.711
29.298	382.692
29.399	271.994
29.529	338.418
29.571	370.707
29.579	283.069
29.658	414.067
29.708	359.640
29.887	390.088
29.892	331.970
29.895	301.527
29.936	349.499
30.111	419.614
30.123	289.541
30.256	323.677
30.344	345.819
30.382	434.381
30.439	305.232
30.519	415.935
30.609	424.240
30.653	443.614
30.654	425.163
30.702	399.334
30.751	365.203
30.799	327.381
30.803	286.791
30.838	405.796
30.842	354.135
30.843	345.833
30.846	313.545
30.971	428.862
30.973	411.334
31.066	385.506
31.337	398.429
31.748	369.842
31.792	382.758
31.885	356.008
31.919	484.237
31.932	332.946
31.976	344.940
32.106	418.744
32.242	416.903
32.245	388.305
32.558	427.981
32.604	429.827
32.787	404.002
32.789	379.094
32.924	397.548
33.240	414.161
33.330	416.931
33.423	391.104
33.469	390.182
33.505	492.582
33.777	492.589
33.831	391.114
34.865	492.618];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Panc2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Ri = weights.Ri * 0;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6L757'; % Cat of Life
metaData.links.id_ITIS = '167272'; % ITIS
metaData.links.id_EoL = '46568958'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocanthus'; % Wikipedia
metaData.links.id_ADW = 'Gymnocanthus_detrisus'; % ADW
metaData.links.id_Taxo = '175535'; % Taxonomicon
metaData.links.id_WoRMS = '274372'; % WoRMS
metaData.links.id_fishbase = 'Gymnocanthus-detrisus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocanthus}}';
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
bibkey = 'Panc2012'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210040028}, ' ...
'author = {V. V. Panchenko}, ' ... 
'year = {2012}, ' ...
'title = {Growth and Age of Staghorn Sculpins of the Genus \emph{Gymnocanthus} ({C"}ottidae) in {P}eter the {G}reat {B}ay and Adjacent Waters of {P}rimorye ({S}ea of {J}apan)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {52}, ' ...
'pages = {226-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnocanthus-detrisus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


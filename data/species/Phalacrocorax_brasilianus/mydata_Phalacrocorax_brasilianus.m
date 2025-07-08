function [data, auxData, metaData, txtData, weights] = mydata_Phalacrocorax_brasilianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Phalacrocoracidae';
metaData.species    = 'Phalacrocorax_brasilianus'; 
metaData.species_en = 'Neotropic cormorant'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0xMc', '0xFm'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 26;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 31;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'KalmBeck2005';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 93;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KalmBeck2005';
data.Wwi = 1550; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.116	21.392
0.058	30.900
0.988	33.277
0.988	42.784
0.988	49.915
1.860	35.654
1.860	45.161
1.860	54.669
1.860	66.553
2.907	57.046
2.907	68.930
2.907	78.438
3.779	92.699
3.779	102.207
3.779	118.846
3.779	125.976
3.895	42.784
3.895	71.307
3.895	87.946
3.953	59.423
4.826	95.076
4.826	104.584
4.826	106.961
4.884	128.353
5.872	59.423
5.930	164.007
5.930	168.761
5.988	97.453
5.988	106.961
5.988	154.499
5.988	183.022
5.988	190.153
5.988	202.037
6.047	121.222
6.047	133.107
6.047	144.991
6.860	242.445
6.919	199.660
6.919	206.791
6.919	211.545
6.919	213.922
6.919	213.922
6.977	164.007
7.035	97.453
7.035	185.399
7.849	256.706
7.849	328.014
7.907	259.083
7.907	278.098
7.907	289.983
7.965	173.514
7.965	187.776
7.965	194.907
7.965	206.791
7.965	230.560
7.965	240.068
7.965	344.652
7.965	373.175
8.779	247.199
8.895	137.861
8.895	263.837
8.895	278.098
8.895	287.606
8.895	289.983
8.895	292.360
8.895	297.114
8.895	299.491
8.895	313.752
8.895	347.029
8.895	401.698
8.953	330.390
9.826	166.384
9.826	496.774
9.826	534.805
9.884	206.791
9.884	268.591
9.884	280.475
9.884	313.752
9.884	330.390
9.884	344.652
9.884	344.652
9.884	354.160
9.884	363.667
9.884	363.667
9.884	363.667
9.884	368.421
9.884	404.075
9.884	437.351
9.884	446.859
9.884	430.221
9.942	297.114
9.942	387.436
10.756	354.160
10.756	361.290
10.756	368.421
10.814	221.053
10.814	396.944
10.814	475.382
10.814	503.905
10.814	520.543
10.872	449.236
10.872	449.236
10.872	456.367
10.872	463.497
10.872	463.497
10.930	439.728
11.744	228.183
11.744	287.606
11.802	603.735
11.860	596.604
11.919	373.175
11.919	399.321
11.919	442.105
11.919	458.744
11.919	461.121
11.919	503.905
11.919	513.413
11.919	515.789
11.919	525.297
11.919	537.182
11.919	544.312
11.919	553.820
11.919	556.197
11.919	568.082
11.919	582.343
11.977	499.151
12.035	484.890
12.035	492.020
12.151	475.382
12.791	458.744
12.849	501.528
12.849	522.920
12.849	525.297
12.849	539.559
12.849	544.312
12.849	582.343
12.849	601.358
12.849	653.650
12.907	553.820
12.907	553.820
12.907	570.458
12.965	275.722
13.837	646.520
13.837	663.158
13.837	675.042
13.837	696.435
13.837	703.565
13.837	715.450
13.895	392.190
13.895	439.728
13.895	515.789
13.895	553.820
13.895	596.604
13.895	601.358
13.895	608.489
13.895	622.750
13.953	575.212
13.953	579.966
13.953	587.097
13.953	751.104
13.953	762.988
13.953	774.873
14.070	563.328
14.767	689.304
14.767	701.188
14.884	656.027
14.942	594.228
14.942	620.374
14.942	660.781
14.942	665.535
14.942	670.289
14.942	675.042
14.942	682.173
14.942	777.250
15.000	789.134
15.756	810.526
15.756	829.542
15.756	848.557
15.814	670.289
15.872	598.981
15.872	606.112
15.872	610.866
15.872	686.927
15.872	696.435
15.872	701.188
15.872	727.335
15.872	748.727
15.872	755.857
15.872	755.857
15.872	760.611
15.872	767.742
15.872	774.873
15.872	786.757
15.988	530.051
16.047	741.596
16.047	877.080
16.105	903.226
16.860	648.896
16.860	682.173
16.919	758.234
16.919	767.742
16.919	782.003
16.919	867.572
16.919	893.718
16.919	905.603
16.919	950.764
16.977	820.034
16.977	841.426
17.733	960.272
17.733	1019.694
17.733	1033.956
17.791	696.435
17.791	734.465
17.791	801.019
17.791	831.919
17.791	877.080
17.849	779.627
17.849	782.003
17.849	884.211
17.849	919.864
17.907	620.374
17.907	767.742
17.907	848.557
17.907	869.949
18.721	929.372
18.721	929.372
18.721	955.518
18.779	893.718
18.779	907.980
18.779	919.864
18.837	841.426
18.837	853.311
18.837	865.195
18.837	874.703
18.895	779.627
18.895	824.788
18.895	972.156
19.012	1074.363
19.767	919.864
19.826	867.572
19.826	907.980
19.826	924.618
19.826	938.879
19.826	993.548
19.826	1007.810
19.826	1010.187
19.826	1003.056
19.826	1036.333
19.826	1048.217
19.826	1060.102
19.826	1114.771
19.826	1152.801
19.884	748.727
19.884	760.611
19.884	896.095
19.884	896.095
19.942	879.457
20.756	924.618
20.756	941.256
20.872	888.964
20.930	998.302
21.047	1164.686
21.860	1174.194
21.919	929.372
21.919	948.387
21.919	981.664
21.919	1019.694
21.919	1029.202
21.919	1079.117
21.919	1095.756
21.919	1100.509
21.919	1105.263
21.919	1131.409
21.977	853.311
21.977	1224.109
22.849	1038.710
22.849	1074.363
23.779	1003.056
23.779	1155.178
23.779	1181.324
23.895	953.141
23.953	1086.248
24.767	1114.771
24.767	1162.309
24.767	1169.440
24.767	1174.194
24.826	1105.263
24.826	1145.671
24.826	1366.723
24.884	991.171
25.756	1010.187
25.814	1098.132
25.930	1240.747
25.988	1231.239
27.907	1224.109
27.907	1238.370
28.081	1164.686
29.826	1304.924
30.988	1202.716];
n = size(data.tW,1); 
for i = 2:n % make sure that all times are unique
  if data.tW(i,1) <= data.tW(i-1,1)
    data.tW(i,1) = max(data.tW(i,1),data.tW(i-1,1)) + 1e-3;
  end
end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KalmBeck2005';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Feeding is reduced just after hatch';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4FQQ8'; % Cat of Life
metaData.links.id_ITIS = '554375'; % ITIS
metaData.links.id_EoL = '45511371'; % Ency of Life
metaData.links.id_Wiki = 'Phalacrocorax_brasilianus'; % Wikipedia
metaData.links.id_ADW = 'Phalacrocorax_brasilianus'; % ADW
metaData.links.id_Taxo = '149444'; % Taxonomicon
metaData.links.id_WoRMS = '343939'; % WoRMS
metaData.links.id_avibase = '56036504EDE6F930'; % avibase
metaData.links.id_birdlife = 'neotropical-cormorant-nannopterum-brasilianus'; % birdlife
metaData.links.id_AnAge = 'Phalacrocorax_brasilianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phalacrocorax_brasilianus}}';
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
bibkey = 'KalmBeck2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10336-004-0061-6}, ' ...
'author = {E. Kalmbach and P. H. Becker}, ' ... 
'year = {2005}, ' ...
'title = {Growth and survival of neotropic cormorant (\emph{Phalacrocorax brasilianus}) chicks in relation to hatching order and brood size}, ' ...
'journal = {J Ornithol}, ' ...
'volume = {146}, ' ...
'pages = {91--98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phalacrocorax_brasilianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


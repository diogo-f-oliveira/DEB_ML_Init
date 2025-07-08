function [data, auxData, metaData, txtData, weights] = mydata_Cacatua_pastinator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Cacatua_pastinator'; 
metaData.species_en = 'Western corella'; 

metaData.ecoCode.climate = {'BSk','Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 60;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Smit1991';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 26.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 20.6;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwi = 551; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 610; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 2.6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Smit1991: 1-4 eggs per clutch';
 
% uni-variate data

% time-weight
data.tW = [ ... % time since hatch (d) wet weight (b)
0.469	7.390
0.697	6.245
1.047	9.082
1.506	9.068
1.513	13.622
2.085	11.329
2.550	14.731
2.890	11.875
3.242	16.419
3.824	21.526
3.949	27.785
4.274	14.682
4.291	26.067
4.527	30.045
4.848	14.666
4.867	26.620
5.089	21.490
5.103	31.167
6.141	33.415
6.146	36.261
6.730	42.506
7.307	44.197
7.784	55.000
7.987	37.347
8.119	48.728
8.930	53.259
8.939	58.952
9.627	57.794
10.709	88.503
10.792	68.007
10.827	90.777
10.831	93.054
11.141	70.844
11.186	99.875
11.686	51.473
11.745	89.612
11.760	99.858
11.986	97.006
12.196	83.907
12.449	99.269
12.926	110.641
13.136	97.542
14.071	107.762
14.085	116.301
14.421	111.168
15.048	144.736
15.940	127.064
16.027	108.845
16.737	121.918
17.017	154.927
17.062	109.385
17.756	111.642
17.922	145.224
17.982	109.359
18.044	149.774
18.094	182.790
19.024	189.595
19.280	206.665
20.015	161.103
20.533	199.229
20.780	134.896
20.789	215.730
20.817	233.946
21.095	190.674
21.831	220.824
22.218	173.564
22.750	220.798
22.889	236.164
23.839	180.919
23.975	195.146
25.792	255.436
25.842	213.309
25.926	192.814
26.605	185.963
26.927	245.726
27.024	234.338
27.091	278.169
27.116	219.535
28.564	263.896
28.949	290.640
29.891	230.272
29.979	287.765
30.713	241.634
30.982	266.674
32.567	251.258
32.781	240.436
32.790	246.698
32.877	303.621
32.920	256.372
33.371	250.666
33.974	268.865
34.109	282.524
34.760	256.889
34.781	270.550
34.907	202.805
35.042	291.036
35.678	256.293
35.978	226.683
35.999	315.487
36.832	259.107
38.207	256.221
39.872	292.606
40.059	264.707
40.933	235.081
40.949	245.327
40.959	251.589
41.871	247.009
41.999	255.544
42.082	234.479
42.129	265.218
42.222	250.984
42.905	246.979
43.049	265.761
43.702	241.833
44.014	295.335
44.630	246.930
44.659	266.284
45.109	259.440
46.799	237.760
46.925	244.588
46.945	257.680
47.075	267.354
47.756	261.642
48.071	242.278
48.819	280.397
49.540	226.297
49.854	280.937
50.167	260.435
50.599	242.206
50.669	287.745
51.150	226.821
51.755	246.158
52.006	260.383
52.895	240.433
52.975	217.091
53.625	266.598
53.704	242.687
54.153	235.843
54.170	247.228
54.956	234.682
54.982	251.759
55.200	244.352
55.231	264.276
55.778	246.613
55.825	202.209
55.855	221.563
56.845	267.645
57.952	239.720
59.058	211.795
59.084	228.303
61.048	235.078
62.063	222.525];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Smit1991';
  
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
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'P57K'; % Cat of Life
metaData.links.id_ITIS = '554846'; % ITIS
metaData.links.id_EoL = '45516620'; % Ency of Life
metaData.links.id_Wiki = 'Cacatua_pastinator'; % Wikipedia
metaData.links.id_ADW = 'Cacatua_pastinator'; % ADW
metaData.links.id_Taxo = '78954'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1E85ABE489A5B49E'; % avibase
metaData.links.id_birdlife = 'western-corella-cacatua-pastinator'; % birdlife
metaData.links.id_AnAge = 'Cacatua_pastinator'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cacatua_pastinator}}';
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
bibkey = 'Smit1991'; type = 'article'; bib = [ ... 
'doi = {10.1071/wr9910091}, ' ...
'author = {Smith, G.T.}, ' ... 
'year = {1991}, ' ...
'title = {Breeding Ecology of the Western Long-billed Corella, \emph{Cacatua pastinator pastinator}}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {18(1)}, ' ...
'pages = {91-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cacatua_pastinator}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=1E85ABE489A5B49E&sec=lifehistory}}';
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


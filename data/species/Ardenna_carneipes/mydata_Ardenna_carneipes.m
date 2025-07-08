function [data, auxData, metaData, txtData, weights] = mydata_Ardenna_carneipes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Ardenna_carneipes'; 
metaData.species_en = 'Flesh-footed shearwater'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 54;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'PoweWool2007';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 101; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'PoweWool2007';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 303; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Puffinus puffinus';
data.am = 30.2*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 99; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PoweWool2007';
data.Wwi = 900; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PoweWool2007';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 590 g (EoL) or 690 g (AnAge)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'PoweWool2007';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since 2000/01/01 (d), wet weight (g)
25.430	99.121
26.000	74.371
26.570	108.423
27.282	88.318
27.709	106.894
28.279	122.376
29.276	130.129
29.276	140.961
29.703	120.851
30.416	150.263
30.416	131.694
30.985	139.440
31.128	181.222
32.410	141.010
32.980	175.062
33.692	150.315
34.262	212.219
34.262	190.556
35.259	165.813
35.259	187.477
36.113	182.848
36.826	173.575
37.395	161.205
37.538	187.513
37.538	210.724
38.677	173.604
39.532	223.134
39.674	199.926
40.102	206.122
40.529	224.697
40.814	195.302
40.956	238.631
41.099	209.233
41.669	227.810
42.951	199.977
43.378	210.816
43.378	227.837
43.948	240.225
44.375	282.012
44.517	251.066
44.945	261.905
44.945	272.736
44.945	306.779
45.230	342.373
45.515	286.672
46.227	364.052
47.224	390.374
48.506	373.373
48.506	404.321
49.930	424.459
50.073	376.492
50.500	478.627
50.927	391.980
51.212	381.152
51.212	453.880
51.782	426.036
53.064	392.013
53.349	415.229
53.634	422.970
54.346	478.687
54.773	440.009
55.343	455.492
55.770	497.279
56.340	478.719
56.483	515.858
56.910	466.349
56.910	528.244
58.049	539.094
58.619	556.124
58.762	522.084
59.616	548.403
59.759	574.711
60.328	562.341
60.756	585.558
60.898	621.151
61.468	579.380
62.038	635.095
62.608	565.472
63.035	644.395
63.320	550.009
64.317	658.342
64.744	576.337
65.456	666.097
66.169	576.360
66.738	647.548
67.023	664.574
67.166	636.723
68.163	632.097
69.302	632.115
69.872	658.430
70.442	647.607
70.442	664.628
71.012	633.689
71.581	667.741
72.436	680.134
72.863	669.309
73.006	694.069
74.003	677.064
74.003	706.464
74.858	684.814
75.855	720.420
75.997	728.159
76.567	739.000
76.567	756.021
77.422	769.961
78.419	728.197
78.703	763.792
79.131	740.587
79.985	757.622
80.698	735.970
80.698	746.802
81.695	757.649
82.549	695.767
82.977	731.364
83.689	714.354
83.689	739.112
83.689	754.586
83.689	708.164
84.544	776.263
84.828	751.509
85.541	732.952
86.965	760.827
87.108	739.166
87.392	774.760
87.392	784.045
88.390	729.902
88.532	750.020
88.674	702.053
88.959	715.984
89.956	697.431
90.526	685.061
91.238	677.336
92.235	671.162
92.235	663.425
92.520	695.925
93.660	689.753
94.087	708.328
94.799	708.340
95.654	691.332
96.081	720.739
97.221	695.999
98.360	705.301
98.503	716.135
99.073	675.912
99.642	705.321
100.497	716.167
100.497	665.103
101.209	697.609
101.922	683.694
102.919	658.951
104.913	674.457
104.913	689.931
106.052	694.591
106.622	711.621
107.334	662.116
107.762	708.544
108.616	646.662
109.756	713.218
110.041	659.064
110.183	702.393
111.038	634.321
111.038	615.753
112.035	651.358
112.747	620.422
113.602	642.099
114.314	666.868
114.314	617.352
115.026	663.785
116.023	656.064
116.308	603.457
117.020	598.826
118.445	611.228
118.730	623.611
119.015	591.120
120.154	601.970
120.581	572.577
121.436	563.306
122.006	578.789
123.430	580.358
124.142	572.633
124.142	597.391];
for i=2:size(data.tW,1) % make sure that each time occurs once only
  if data.tW(i,1) <= data.tW(i-1,1)
    data.tW(i,1) = max(data.tW(i-1,1), data.tW(i,1)) + 1e-4;
  end
end
data.tW(:,1) = data.tW(:,1) - data.tW(1,1); % set origin to hatching
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Powe2018';
comment.tW = 'data from Woody Island, Western Australia';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The tW data were kindly provided by Chris Powell. The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4QFXL'; % Cat of Life
metaData.links.id_ITIS = '174548'; % ITIS
metaData.links.id_EoL = '1047352'; % Ency of Life
metaData.links.id_Wiki = 'Ardenna_carneipes'; % Wikipedia
metaData.links.id_ADW = 'Puffinus_carneipes'; % ADW
metaData.links.id_Taxo = '51572'; % Taxonomicon
metaData.links.id_WoRMS = '212635'; % WoRMS
metaData.links.id_avibase = '60825BF601060350'; % Avibase
metaData.links.id_birdlife = 'flesh-footed-shearwater-ardenna-carneipes'; % Birdlife
metaData.links.id_AnAge = 'Puffinus_carneipes'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ardenna_carneipes}}';
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
bibkey = 'PoweWool2007'; type = 'Article'; bib = [ ... 
'author = {Powell, C. D. L. and Wooller, R. D. and Bradley, J. S.}, ' ... 
'doi = {10.1071/mu07005}, ' ...
'year = {2007}, ' ...
'title = {Breeding biology of the Flesh-footed Shearwater (\emph{Puffinus carneipes}) on {W}oody {I}sland, {W}estern {A}ustralia}, ' ...
'journal = {. Emu - Austral Ornithology}, ' ...
'volume = {107}, ' ...
'pages = {275-283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Powe2018'; type = 'Misc'; bib = [ ...
'Author = {Chris Powell}, ' ...
'year = {2018}, ' ...
'note = {Personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puffinus_carneipes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1047352/details}}';
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


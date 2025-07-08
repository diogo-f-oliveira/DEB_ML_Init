function [data, auxData, metaData, txtData, weights] = mydata_Dendrocolaptes_platyrostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Furnariidae';
metaData.species    = 'Dendrocolaptes_platyrostris'; 
metaData.species_en = 'Planalto woodcreeper';

metaData.ecoCode.climate = {'Aw','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab', 'ap', 'aR', 'am', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'NorrCock2010';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-16 d';
data.tx = 18;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NorrCock2010';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '14-18 d';
data.tp = 54;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '14-18 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'NorrCock2010';
data.Wwi = 60.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'NorrCock2010';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 4 eggs per clutch, 1 clutch per year assumed';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	9.078
0.000	10.496
0.000	11.348
0.000	11.915
0.000	7.092
0.000	16.170
0.000	14.468
0.940	12.482
0.940	11.915
0.940	11.915
0.940	10.213
0.940	8.227
0.977	15.603
0.977	13.901
0.977	13.901
1.917	23.262
1.917	19.574
1.917	17.872
1.917	17.305
1.917	15.035
1.955	20.709
1.992	13.901
2.970	35.461
2.970	34.043
2.970	23.546
2.970	22.128
2.970	20.709
2.970	19.291
2.970	18.440
3.045	29.787
3.045	28.652
3.045	28.085
3.045	27.801
3.045	25.816
3.045	25.248
3.985	36.596
3.985	34.894
3.985	34.894
3.985	33.759
3.985	33.191
3.985	32.057
3.985	32.057
3.985	29.787
4.023	28.652
4.023	26.383
4.060	24.681
5.038	45.390
5.038	43.688
5.038	42.270
5.038	40.567
5.075	37.163
5.150	33.759
5.940	42.270
5.977	52.482
5.977	51.348
5.977	49.645
5.977	47.943
5.977	46.525
5.977	43.688
5.977	42.270
6.053	44.255
6.090	57.021
6.090	40.000
6.090	38.298
6.090	35.461
6.955	48.227
6.992	57.021
6.992	59.007
7.030	41.986
7.030	46.241
7.030	50.213
7.030	51.915
7.030	54.752
7.030	55.603
7.030	56.170
7.105	53.333
7.105	53.617
8.008	54.752
8.045	58.723
8.045	57.589
8.045	57.589
8.045	57.305
8.045	56.170
8.083	68.369
8.083	66.099
8.083	63.830
8.083	61.560
8.083	60.426
8.083	51.915
8.083	47.660
9.135	67.234
9.135	64.397
9.135	64.397
9.135	63.830
9.135	61.844
9.135	60.142
9.135	59.007
9.135	59.007
9.135	56.738
10.038	74.326
10.038	68.652
10.038	68.085
10.038	68.085
10.038	66.667
10.038	62.695
10.038	61.560
10.038	61.560
10.038	60.142
10.038	58.156
10.075	72.057
10.075	70.071
10.113	64.965
10.940	58.156
11.053	60.993
11.053	63.546
11.053	66.099
11.053	67.234
11.053	69.504
11.090	65.532
11.090	66.950
11.090	72.908
11.992	76.312
11.992	72.908
11.992	71.773
12.030	74.326
12.030	70.355
12.068	59.574
12.105	68.369
13.008	71.206
13.045	51.064
13.045	66.667
13.045	68.369
13.045	72.908
13.045	74.043
13.045	75.745
13.120	61.277
13.120	62.695
13.985	80.567
14.060	75.177
14.060	75.177
14.060	72.908
14.060	71.773
14.060	70.638
14.060	67.234
14.060	64.397
14.060	54.752
14.060	53.050
14.098	76.879
14.098	60.709
14.098	55.887
15.000	66.383
15.000	67.801
15.000	70.355
15.000	68.652
15.000	76.596
15.038	78.582
15.075	54.184
15.113	60.142
15.113	63.262
15.113	74.043
15.113	75.461
16.015	68.369
16.053	69.504
16.053	63.830
16.090	71.773
16.090	70.355
16.128	77.447
16.128	75.461
16.128	73.191
17.030	71.773
17.030	72.908
17.068	49.929
17.068	54.468
17.068	67.518
17.068	68.369
17.105	65.532
17.105	66.099
17.143	63.546
18.083	72.908
18.083	57.872];  
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NorrCock2010';
  
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
D1 = 'Feeding is reduced just before fledge';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '34PV2'; % Cat of Life
metaData.links.id_ITIS = '559709'; % ITIS
metaData.links.id_EoL = '918396'; % Ency of Life
metaData.links.id_Wiki = 'Dendrocolaptes_platyrostris'; % Wikipedia
metaData.links.id_ADW = 'Dendrocolaptes_platyrostris'; % ADW
metaData.links.id_Taxo = '74727'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '9C163605D9726273'; % Avibase
metaData.links.id_birdlife = 'planalto-woodcreeper-dendrocolaptes-platyrostris'; % Birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrocolaptes_platyrostris}}';
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
bibkey = 'NorrCock2010'; type = 'Article'; bib = [ ... 
'author = {Andrea R. Norris and Kristina L. Cockle and Kathy Martin}, ' ... 
'year = {2010}, ' ...
'title = {Evidence for tolerance of parasitism in a tropical cavity-nesting bird, planalto woodcreeper (\emph{Dendrocolaptes platyrostris}), in northern {A}rgentina}, ' ...
'journal = {Journal of Tropical Ecology}, ' ...
'volume = {26(6)}, ' ...
'pages = {619-626}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9C163605D9726273&sec=lifehistory}}';
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


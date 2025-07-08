function [data, auxData, metaData, txtData, weights] = mydata_Coenocorypha_huegeli

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Coenocorypha_huegeli'; 
metaData.species_en = 'Snares snipe'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTg', '0iThf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Misk1999';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 65;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'Misk1999';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 195;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '';

data.Wwb = 15.5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Misk1999';
data.Wwi = 105;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Misk1999';
  
data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Misk1999';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.026	14.214
0.032	17.892
0.553	14.713
1.524	17.385
2.667	18.049
2.669	19.554
2.939	22.897
3.911	26.237
3.913	27.742
4.622	31.418
4.955	21.049
6.734	33.751
7.439	35.253
7.619	37.928
8.848	37.421
8.854	41.100
8.925	31.066
9.816	38.922
10.702	43.099
11.674	46.774
11.677	48.446
11.825	32.392
12.631	41.251
12.649	51.619
12.811	43.759
13.445	55.127
13.774	42.417
14.853	56.794
15.556	56.958
15.558	57.961
15.560	59.132
16.954	53.106
17.057	61.467
18.814	61.961
19.953	60.451
20.743	60.281
20.858	75.832
21.902	70.309
22.420	65.123
22.782	71.309
24.019	75.652
24.900	77.320
25.056	65.781
26.041	76.479
26.665	81.828
27.873	70.117
28.054	72.959
28.602	84.663
28.668	72.789
29.629	69.775
29.662	88.504
30.859	70.105
31.742	72.944
31.756	80.636
31.778	93.011
33.709	92.835
34.823	77.279
34.901	71.593
35.629	86.138
35.910	95.669
37.383	84.459
37.769	104.524
39.588	90.135
39.593	92.978
39.757	86.456
40.569	98.492
40.720	84.445
41.787	92.133
41.793	95.812
42.926	90.456
43.531	85.269
44.777	94.461
44.781	96.802
45.740	93.119
46.711	95.791
46.789	89.938
47.772	99.633
48.744	103.308
50.760	100.958
50.851	103.132
51.623	92.259
53.826	97.099
55.687	106.289
55.762	98.930
55.764	100.101
55.856	102.442
56.462	97.590
57.092	106.450
57.862	95.075
58.644	90.055
63.675	104.583
67.602	90.352
67.616	98.714
78.171	108.368];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Misk1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5ZK4Q'; % Cat of Life
metaData.links.id_ITIS = '824049'; % ITIS
metaData.links.id_EoL = '4373934'; % Ency of Life
metaData.links.id_Wiki = 'Coenocorypha_huegeli'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2682088'; % Taxonomicon
metaData.links.id_WoRMS = '226018'; % WoRMS
metaData.links.id_avibase = '90E8B13BBB299CCD'; % avibase
metaData.links.id_birdlife = 'snares-island-snipe-coenocorypha-huegeli'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coenocorypha_huegeli}}';
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
bibkey = 'Misk1999'; type = 'Article'; bib = [ ...  
'title = {Breeding ecology of {S}nares {I}sland Snipe (\emph{Coenocorypba aucklandica buegeli}) and {C}hatham {I}sland Snipe (\emph{C. pusilla})}, ' ...
'journal = {Notornis}, ' ...
'year = {1999}, ' ...
'author = {C. M. Miskelly}, ' ...
'volume = {46}, ' ...
'pages = {207-221}'];
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


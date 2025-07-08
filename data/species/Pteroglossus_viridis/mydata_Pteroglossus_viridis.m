function [data, auxData, metaData, txtData, weights] = mydata_Pteroglossus_viridis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Ramphastidae';
metaData.species    = 'Pteroglossus_viridis'; 
metaData.species_en = 'Green aracari'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi','0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biCvr', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 16;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LegeVinc2012';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15-18 d';
data.tx = 6*7;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LegeVinc2012';   
  temp.tx = C2K(41.8); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 126;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.8); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 16.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ramphastos toco';
  
data.Wwb = 8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LegeVinc2012';
data.Wwi = 135; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LegeVinc2012';
  comment.Wwi = 'Wiki gives 110-160 g';

data.Ri = 3/365;  units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.360	7.894
1.261	9.062
2.462	11.015
3.363	12.183
4.505	13.346
5.345	14.515
6.306	18.054
7.327	19.219
8.288	25.129
9.369	26.689
10.330	29.832
11.411	40.482
12.553	45.993
13.453	53.881
14.474	55.442
15.375	60.957
16.396	74.376
17.417	77.123
18.559	82.634
19.520	89.334
20.420	98.407
21.502	105.896
22.342	112.203
23.423	117.320
24.565	119.669
25.586	120.044
26.547	125.164
27.447	131.865
28.408	129.475
29.550	135.776
30.390	139.317
31.471	136.924
32.553	133.740
33.393	138.467
34.535	137.259
35.435	139.217
36.336	145.128
37.598	145.103
38.438	143.901
39.339	141.116
40.420	130.423
41.381	131.194
42.462	129.592
43.363	127.598
44.384	126.392
45.465	123.604
46.486	113.307
47.327	120.800
48.468	117.220
49.550	121.942
50.390	132.993
51.351	125.464
52.492	110.026
53.574	113.167
54.414	122.636
55.556	121.428
56.456	126.944
57.477	128.505
58.498	129.275
59.580	131.625
60.541	119.353];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LegeVinc2012';
  
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
D1 = 'scaled functional response turned out to vary in tW data, which has been implemented';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Cooperative breeder; smallest toucan';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PWQL'; % Cat of Life
metaData.links.id_ITIS = '554284'; % ITIS
metaData.links.id_EoL = '45512547'; % Ency of Life
metaData.links.id_Wiki = 'Pteroglossus_viridis'; % Wikipedia
metaData.links.id_ADW = 'Pteroglossus_viridis'; % ADW
metaData.links.id_Taxo = '55564'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '10FE38DF67AA1040'; % avibase
metaData.links.id_birdlife = 'green-aracari-pteroglossus-viridis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteroglossus_viridis}}';
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
bibkey = 'McNa2001'; type = 'Article'; bib = [ ... 
'author = {McNab, B.K.}, ' ... 
'year = {2001}, ' ...
'title = {Energetics of Toucans, a Barbet, and a Hornbill: Implications for avian frugivory}, ' ...
'journal = {The Auk}, ' ...
'volume = {118}, ' ...
'number = {4}, '...
'pages = {916--933}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LegeVinc2012'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.cvex.2012.03.002}, ' ...
'author = {St. Leger, J. and Vince, M. and Jennings, J. and McKerney, E. and Nilson, E.}, ' ... 
'year = {2012}, ' ...
'title = {Toucan Hand Feeding and Neslting Growth}, ' ...
'journal = {Exotic Animal Practice}, ' ...
'volume = {15}, ' ...
'pages = {183--193}'];
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


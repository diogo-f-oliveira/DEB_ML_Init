function [data, auxData, metaData, txtData, weights] = mydata_Pteroglossus_torquatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Ramphastidae';
metaData.species    = 'Pteroglossus_torquatus'; 
metaData.species_en = 'Collared aracari'; 

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

data.ab = 16.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15-18 d';
data.tx = 6*7;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(41.8); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 126;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.8); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 16.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ramphastos toco';
  
data.Wwb = 10;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LegeVinc2012';
data.Wwi = 155; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LegeVinc2012';
  comment.Wwi = 'ADW gives 230 g';

data.Ri = 3/365;  units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.459	9.822
1.612	11.087
2.420	11.503
3.457	13.625
4.495	15.320
5.418	18.725
6.513	21.274
7.435	24.252
8.473	27.229
9.453	30.206
10.548	33.610
11.412	36.589
12.565	41.273
13.486	46.816
14.524	50.647
15.445	57.044
16.482	61.303
17.519	66.844
18.441	72.386
19.420	77.073
20.514	83.040
21.551	88.581
22.531	93.268
23.394	98.811
24.547	102.214
25.469	106.047
26.392	106.888
27.601	115.845
28.523	118.824
29.446	121.802
30.483	126.488
31.576	136.302
32.382	140.991
33.536	143.111
34.458	145.235
35.437	150.776
36.649	148.195
37.514	152.029
38.436	155.007
39.474	156.274
40.283	151.562
41.379	151.119
42.419	147.258
43.342	146.818
44.322	148.513
45.478	144.223
46.460	138.226
47.556	139.920
48.478	141.189
49.460	137.756
50.441	136.460
51.538	135.162
52.287	137.289
53.384	136.418
54.538	135.974
55.459	140.662
56.440	139.366
57.478	141.915
58.515	148.738
59.610	152.142
60.475	154.266];
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
F1 = 'Cooperative breeder, with 5-6 adults involved feeding the young';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PWQK'; % Cat of Life
metaData.links.id_ITIS = '554285'; % ITIS
metaData.links.id_EoL = '45512555'; % Ency of Life
metaData.links.id_Wiki = 'Pteroglossus_torquatus'; % Wikipedia
metaData.links.id_ADW = 'Pteroglossus_torquatus'; % ADW
metaData.links.id_Taxo = '55563'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '542B4FCB0F9377B6'; % avibase
metaData.links.id_birdlife = 'collared-aracari-pteroglossus-torquatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteroglossus_torquatus}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pteroglossus_torquatus/}}';
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


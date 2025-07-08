function [data, auxData, metaData, txtData, weights] = mydata_Selenidera_piperivora
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Ramphastidae';
metaData.species    = 'Selenidera_piperivora'; 
metaData.species_en = 'Guianan toucanet'; 

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
  
data.Wwb = 7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LegeVinc2012';
data.Wwi = 140; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LegeVinc2012';
  comment.Wwi = 'Wiki gives 110-165 g';

data.Ri = 3/365;  units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.557	7.813
2.575	11.723
3.533	12.904
4.551	12.917
5.569	14.489
6.467	17.617
7.425	21.915
8.443	26.994
9.461	28.955
10.479	32.085
11.557	36.385
12.515	40.683
13.473	46.929
14.491	53.955
15.449	62.929
16.467	65.669
17.545	72.307
18.563	80.112
19.641	84.412
20.539	91.436
21.497	96.124
22.635	103.541
23.653	106.282
24.551	110.190
25.449	117.214
26.647	127.360
27.665	125.425
28.623	130.113
29.641	130.126
30.479	134.423
31.617	136.775
32.575	137.956
33.473	138.358
34.551	139.930
35.629	137.996
36.587	136.450
37.545	135.683
38.563	132.579
39.401	129.863
40.539	125.203
41.617	126.385
42.695	121.724
43.533	128.748
44.671	130.711
45.449	136.175
46.407	128.006
47.665	133.087
48.563	131.541
49.401	129.993
50.539	128.449
51.677	130.802
52.635	128.477
53.713	131.607
54.551	130.839
55.689	133.192
56.707	128.529
57.665	128.152
58.503	131.280
59.521	130.904
60.539	128.969
61.557	130.540
62.575	139.125];
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

%% Links
metaData.links.id_CoL = '7WTRC'; % Cat of Life
metaData.links.id_ITIS = '1145222'; % ITIS
metaData.links.id_EoL = '45512562'; % Ency of Life
metaData.links.id_Wiki = 'Selenidera_piperivora'; % Wikipedia
metaData.links.id_ADW = 'Selenidera_culik'; % ADW
metaData.links.id_Taxo = '1683883'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '92FB567FBC5845D8'; % avibase
metaData.links.id_birdlife = 'guianan-toucanet-selenidera-piperivora'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Selenidera_piperivora}}';
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


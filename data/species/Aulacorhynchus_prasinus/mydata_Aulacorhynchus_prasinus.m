function [data, auxData, metaData, txtData, weights] = mydata_Aulacorhynchus_prasinus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Ramphastidae';
metaData.species    = 'Aulacorhynchus_prasinus'; 
metaData.species_en = 'Emerald toucanet'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi','0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biCvr', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
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

data.ab = 14.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-15 d';
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
data.Wwi = 130; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LegeVinc2012';
  comment.Wwi = 'Wiki gives 118-230 g';

data.Ri = 3/365;  units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.414	8.171
1.485	8.539
2.318	9.614
3.568	10.694
4.460	14.255
5.352	14.620
6.482	17.119
7.552	22.457
8.563	25.664
9.514	28.161
10.465	33.142
11.654	38.837
12.664	42.754
13.675	45.606
14.508	49.166
15.340	53.082
16.350	56.644
17.479	62.338
18.549	67.676
19.381	72.656
20.391	77.638
21.580	81.558
22.531	86.184
23.422	91.165
24.373	95.437
25.503	100.066
26.513	105.758
27.463	111.095
28.354	117.141
29.425	118.219
30.379	114.325
31.331	114.336
32.458	126.775
33.177	114.003
34.426	114.728
35.614	121.842
36.268	124.335
37.280	124.702
38.354	117.259
39.545	116.208
40.496	120.125
41.330	118.005
42.403	114.822
43.355	114.833
44.428	109.166
45.315	128.348
46.385	130.845
47.398	129.082
48.350	129.804
49.361	131.236
50.254	131.601
51.326	130.194
52.457	130.917
53.468	132.349
54.480	132.716
55.373	130.952
56.206	131.672
57.337	132.040
58.468	132.764
59.423	123.899
60.613	124.978];
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
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'mod_1: v is reduced';
D3 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'JR57'; % Cat of Life
metaData.links.id_ITIS = '554277'; % ITIS
metaData.links.id_EoL = '45512534'; % Ency of Life
metaData.links.id_Wiki = 'Aulacorhynchus_prasinus'; % Wikipedia
metaData.links.id_ADW = 'Aulacorhynchus_prasinus'; % ADW
metaData.links.id_Taxo = '55551'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B35771C79152F9B3'; % avibase
metaData.links.id_birdlife = 'emerald-toucanet-aulacorhynchus-prasinus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aulacorhynchus_prasinus}}';
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
'howpublished = {\url{https://animaldiversity.org/accounts/Aulacorhynchus_prasinus/}}';
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


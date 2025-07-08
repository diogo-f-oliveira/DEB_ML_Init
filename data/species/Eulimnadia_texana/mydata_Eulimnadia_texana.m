function [data, auxData, metaData, txtData, weights] = mydata_Eulimnadia_texana
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Spinicaudata'; 
metaData.family     = 'Limnadiidae';
metaData.species    = 'Eulimnadia_texana'; 
metaData.species_en = 'Texas clam shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'Hha'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-R'; 'L-R'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 06]; 

%% set data
% zero-variate data

data.ab = 1;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'WeekMarc1997';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch after hydratation: 18-36 h; can stay dry for yrs, but developmental state is unknown';
data.tp = 4;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'WeekMarc1997';
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'WeekMarc1997';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.325;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'WeekMarc1997';
data.Li  = 0.777;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'WeekMarc1997';

data.Wwb  = 3.6e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Belk1972';
  comment.Wwb = 'based on egg diameter of 200-210 mum of Eulimnadia antlei, but that probably includes the ridges: pi/6*190e-4^3';
data.Wwi  = 0.0458;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on foto length 0.777 cm, height 0.5 cm, thickness 0.15 cm: pi/4*0.777*0.5*0.15; uncertain because of water in carapace';

data.Ri  = 959;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WeekMarc1997';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length-reproduction
data.tLR = [ ... % time since birth (d), growth increment (mm), daily reproduction (#/d)
4   0       2.330 % zero is replaced by Lp below
5	0.696  54.175 
6	0.379 117.670
7	0.234 172.427
8	0.254 228.350
9	0.184 221.942
10	0.193 243.495
11	0.077 245.825
12	0.079 249.903
13	0.105 228.932
14	0.130 237.087
15	0.046 263.301
16	0.063 224.272
17	0.105 247.573
18	0.028 120.583
19	0.029 131.650
20	0.017  71.068
21	0.037  83.883
22	0.037  22.136];
data.tLR(:,2) = data.tLR(:,2)/10; % convert mm to cm
data.tLR(:,2) = 0.325 + cumsum(data.tLR(:,2)); % convert length increment to length using Lp
units.tLR = {'d', 'cm', '#/d'}; label.tLR = {'time since birth', 'carapace length', 'daily reproduction'};  
temp.tLR = C2K(29); units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
treat.tLR = {1, {'carapace length','reproduction rate'}};
bibkey.tLR = 'WeekMarc1997';

% length-reprod rate
data.LR = [ ... % carapace length (cm), reprod rate (#/d)
0.322	35.469
0.325	28.604
0.333	29.748
0.352	32.037
0.354	60.641
0.355	35.469
0.356	49.199
0.362	17.162
0.366	35.469
0.370	93.821
0.381	26.316
0.386	46.911
0.393	35.469
0.410	57.208
0.413	74.371
0.414	51.487
0.415	106.407
0.435	65.217
0.435	54.920
0.438	36.613
0.438	65.217
0.440	98.398
0.441	61.785
0.452	203.661
0.458	67.506
0.460	115.561
0.469	82.380
0.479	41.190
0.480	183.066
0.481	78.947
0.482	138.444
0.485	70.938
0.491	149.886
0.496	147.597
0.497	203.661
0.500	56.064
0.505	189.931
0.506	163.616
0.510	235.698
0.517	136.156
0.521	179.634
0.524	168.192
0.535	236.842
0.537	244.851
0.539	252.860
0.541	228.833
0.546	250.572
0.552	244.851
0.554	108.696
0.554	236.842
0.562	160.183
0.564	219.680
0.564	279.176
0.566	165.904
0.567	226.545
0.569	205.950
0.570	271.167
0.574	295.194
0.576	255.149
0.581	237.986
0.584	186.499
0.586	274.600
0.586	48.055
0.594	248.284
0.595	286.041
0.596	255.149
0.598	224.256
0.599	69.794
0.601	176.201
0.602	259.725
0.604	300.915
0.622	201.373
0.628	294.050
0.637	327.231
0.646	118.993
0.680	220.824
0.690	242.563
0.697	239.130
0.699	337.529
0.734	401.602
0.737	203.661
0.738	289.474];
units.LR = {'cm', '#/d'}; label.LR = {'carapace length', 'daily reproduction'};  
temp.LR = C2K(29); units.temp.LR = 'K'; label.temp.LR = 'temperature';
bibkey.LR = 'WeekMarc1997';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.tLR = 5 * weights.tLR; weights.tLR(end-5:end,2)= 0; % reduced reprod at high age can be due to selective survival

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Reproduction data in tLR for last 5 data points are ignored; reduced reprod rate could be due to selective survival';   
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BJPLR'; % Cat of Life
metaData.links.id_ITIS = '83799'; % ITIS
metaData.links.id_EoL = '1017992'; % Ency of Life
metaData.links.id_Wiki = 'Eulimnadia_texana'; % Wikipedia
metaData.links.id_ADW = 'Eulimnadia_texana'; % ADW
metaData.links.id_Taxo = '377946'; % Taxonomicon
metaData.links.id_WoRMS = '1601302'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eulimnadia_texana}}';
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
bibkey = 'WeekMarc1997'; type = 'Article'; bib = [ ... 
'author = {Stephen C. Weeks and Vivien Marcus and Sheila Alvarez}, ' ... 
'year = {1997}, ' ...
'title = {Notes on the life history of the clam shrimp, \emph{Eulimnadia texana}}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {359}, ' ...
'pages = {191–197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Belk1972'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3670065}, '...
'author = {Denton Belk}, ' ... 
'year = {1972}, ' ...
'title = {The Biology and Ecology of \emph{Eulimnadia antlei} {M}ackin ({C}onchostraca)}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {16(3-4)}, ' ...
'pages = {297–305}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


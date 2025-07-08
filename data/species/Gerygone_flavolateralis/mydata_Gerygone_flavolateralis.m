function [data, auxData, metaData, txtData, weights] = mydata_Gerygone_flavolateralis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Acanthizidae';
metaData.species    = 'Gerygone_flavolateralis'; 
metaData.species_en = 'Fan-tailed gerygone'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'V0'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Joany Marino'};
metaData.date_mod_1     = [2021 03 19];
metaData.email_mod_1    = {'joanyvalentina@gmail.com'};
metaData.address_mod_1  = {'Memorial University of Newfoundland, A1B 3X9, Canada'};

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 18;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AttiThie2018';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'The incubation phase is 18 +/- 1 days; temperure is guessed';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AttiThie2018';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'The nestling phase is 14  +/- 1 days';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'The nestling phase is 14  +/- 1 days';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4.9*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Gill1982';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Value for Gerygone igata, temperature adjusted according to AttiThie2018';

data.V0 = 1.363;   units.V0 = 'ml';   label.V0 = 'Volume at start of development';     bibkey.V0 = 'AttiThie2018';
  
data.Ww0  = 1.2;    units.Ww0  = 'g';  label.Ww0  = 'egg wet weight';        bibkey.Ww0  = 'AttiThie2018';
data.Wwb = 1.137;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AttiThie2018';
  comment.Wwb = 'Average value';
% data.Wwx = 6.51;    units.Wwx = 'g';   label.Wwx = 'wet weight at fledging'; bibkey.Wwx = 'AttiThie2018';
%   comment.Wwx = 'Average value of nestlings between 14 and 15 days old';
data.Wwi = 7.14;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AttiThie2018';
  comment.Wwi = 'Average value, see comment for Wwim';
data.Wwim = 7.2;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'AttiThie2018';
  comment.Wwim = 'max weight is larger than that at fledging';

data.Ri  = 2.1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AttiThie2018';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 to 3 eggs per clutch, 1 clutch per year';
 
% uni-variate data
% time-weight
data.tW = [ ...
0 1.04
0 1.16
0 1.08
0 1.12
0 1.25
0 1.13
0 0.96
0 0.96
0 1.04
0 1.21
0 1.11
0 1.05
0 1.37
0 1.1
0 1.33
0 1.1
0 1.24
0 1.06
0 1.01
0 1.06
0 1.14
0 1.4
0 0.98
0 1.11
0 1.2
0 1.19
0 1.1
0 1.07
0 1.44
0 0.88
0 1.1
0 1.25
0 0.92
0 0.94
0 1.51
0 1.13
0 1.06
0 1.15
0 0.98
0 0.96
0 1.16
0 1.2
0 1.29
0 1.2
0 1.11
0 1.46
1 1.53
1 1.61
1 1.49
1 1.47
1 1.48
1 1.35
1 1.7
1 1.37
1 1.64
1 1.5
1 1.11
1 1.48
1 1.61
1 1.57
1 1.76
1 1.47
1 1.38
1 1.01
1 1.32
1 1.29
1 1.61
1 1.69
1 1.49
1 1.93
1 1.2
1 1.29
1 2.17
1 1.05
1 1.39
1 1.71
1 1.45
1 1.25
1 1.48
1 1.45
1 1.21
1 1.43
1 1.39
1 1.59
1 1.24
1 1.08
1 1.67
1 1.33
1 1.56
1 1.35
1 1.48
1 1.69
1 1.79
1 1.44
1 1.46
1 1.72
2 2.27
2 2.3
2 1.86
2 1.9
2 1.9
2 2.71
2 1.6
2 1.96
2 2.06
2 1.63
2 1.93
2 2.14
2 2.14
2 2.01
2 2.04
2 1.89
2 1.19
2 1.86
2 2.08
2 1.86
2 2.24
2 1.67
2 2.82
2 2.32
2 1.93
2 1.92
2 2.31
2 1.84
2 1.56
2 2.69
2 1.73
2 1.41
2 1.76
2 1.82
2 2.1
2 1.82
2 2.04
2 1.93
2 2.06
2 1.88
2 1.97
2 2.13
2 1.8
2 1.72
2 2.23
3 2.64
3 2.74
3 2.78
3 2.69
3 2.48
3 2.01
3 2.91
3 2.21
3 2.48
3 2.56
3 2.19
3 2.67
3 2.95
3 2.7
3 2.73
3 2.79
3 2.75
3 2.96
3 2.84
3 2.86
3 2.11
3 2.57
3 2.46
3 2.94
3 3.42
3 2.89
3 2.53
3 2.19
3 2.85
3 2.58
3 2.18
3 2.56
3 2.78
3 2.1
3 2.76
3 2.98
3 2.54
3 2.38
3 1.86
3 2.84
3 2.37
3 1.8
3 2.6
3 2.82
3 2.38
3 2.03
3 2.54
3 2.75
3 2.28
3 2.19
3 2.56
3 2.36
3 2.99
3 2.8
3 2.15
3 2.35
3 2.89
4 3.03
4 3.64
4 3.06
4 3.68
4 3.39
4 2.99
4 3.29
4 2.89
4 3.33
4 3.29
4 3.28
4 3.19
4 3.79
4 3.41
4 3.24
4 3.53
4 2.97
4 2.99
4 3.15
4 3.18
4 3.65
4 3.61
4 3.19
4 3.34
4 3.52
4 3.3
4 3.13
4 2.78
4 3.09
4 2.63
4 3.46
4 2.86
4 2.2
4 2.87
4 3.67
4 3.1
4 2.26
4 2.9
4 2.82
4 3.05
4 2.88
4 3.09
4 3.26
4 3.58
4 3.6
4 3.21
4 3.06
4 3.64
5 4.33
5 4.08
5 3.91
5 3.59
5 3.6
5 4.33
5 3.31
5 3.9
5 4.16
5 4.04
5 4.1
5 4.14
5 4.02
5 4.23
5 3.62
5 3.87
5 3.09
5 3.83
5 3.78
5 4.28
5 4.87
5 4.42
5 3.65
5 3.45
5 3.64
5 3.57
5 3.56
5 3.79
5 4.17
5 3.47
5 3.64
5 3.31
5 4.72
5 3.8
5 3.12
5 3.27
5 3.59
5 4.28
5 3.64
5 4.68
5 3.72
5 3.64
5 4.05
5 4.07
5 4.33
5 3.97
5 3.57
5 3.33
5 4.12
6 5.12
6 4.67
6 4.57
6 4.8
6 4.5
6 4.42
6 3.87
6 4.25
6 4.69
6 4.83
6 4.83
6 4.85
6 3.77
6 3.8
6 4.7
6 4.35
6 5.9
6 5.4
6 4.81
6 4.11
6 4.35
6 4.69
6 4.08
6 3.5
6 3.68
6 4.13
6 3.5
6 4.25
6 4.11
6 4.8
6 3.88
6 4.63
6 4.89
6 5.22
6 4.89
6 4.45
6 4.76
6 5.3
6 4.01
6 4.23
7 5.18
7 5.16
7 4.89
7 4.74
7 5.09
7 4.82
7 4.9
7 4.33
7 4.57
7 5.26
7 5.42
7 4.11
7 5.23
7 5.51
7 5.39
7 5.56
7 5.51
7 4.78
7 4.41
7 4.91
7 5.62
7 5.73
7 4.83
7 5.44
7 4.32
7 3.92
7 4.79
7 5.16
7 5
7 4.92
7 4.5
7 5.41
7 5.34
7 5.75
8 5.84
8 5.72
8 5.97
8 5.63
8 5.34
8 5.67
8 5.67
8 5.7
8 5.35
8 5.76
8 5.72
8 5.66
8 4.54
8 5.39
8 5.59
8 5.85
8 5.77
8 5.89
8 5.56
8 6.28
8 5.75
8 5.58
8 5.21
9 6.37
9 6.52
9 5.9
9 5.91
9 5.68
9 6
9 6.2
9 5.77
9 6.58
9 6.13
9 6.09
9 5.99
9 6.18
9 6.35
9 5.9
9 6.42
9 6.42
9 5.71
9 5.8
9 6.75
9 5.33
9 6.2
9 6.26
9 6.32
9 6.14
9 5.6
10 6.48
10 6.87
10 6.45
10 6.07
10 6.32
10 6.52
10 5.79
10 5.56
10 5.98
10 6.58
10 5.87
10 6.22
10 6.7
10 6.21
10 6.24
10 7
10 6.33
10 5.98
10 5.59
10 5.87
10 6.54
10 6.11
10 5.44
10 6.98
10 7.17
10 6.27
10 5.45
10 6.22
10 5.47
10 5.75
11 6.82
11 6.76
11 6.6
11 6.45
11 6.01
11 6.16
11 6.52
11 6.75
11 6.38
11 6.12
11 7.01
11 5.8
11 6.03
11 6.45
11 5.57
11 5.74
11 5.89
11 6.87
11 5.94
11 6.01
11 8.53
11 7.84
11 6.64
11 6.75
11 6.31
11 6.46
11 6.45
11 6.35
11 6.12
11 6.4
11 6.32
11 5.37
11 5.67
11 6.16
11 7.34
11 7.35
11 5.36
11 6.13
11 6.02
11 6.66
11 5.71
12 6.61
12 6.97
12 6.46
12 6.35
12 5.8
12 6.86
12 6.49
12 6.07
12 5.92
12 6.22
12 6.59
12 5.78
12 6.3
12 7.98
12 7.46
12 7.04
12 6.41
12 7.16
12 6.6
12 6.05
12 6.25
12 6.71
12 6.43
12 5.84
12 5.81
13 6.5
13 6.72
13 6.56
13 6.31
13 6.75
13 6.36
13 6.28
13 6.26
13 7.14
13 4.55
13 6.12
13 5.88
13 6.3
13 7.24
13 6.17
13 6.14
13 5.74
13 5.41
13 5.32
13 7.63
13 7
13 5.75
13 5.84
13 6.27
13 5.54
14 6.67
14 6.14
14 6.64
14 6.09
14 6.32
14 5.97
14 6.6
14 6.96
14 6.17
14 5.75
15 6.6
15 6.25
15 7.71
15 7.33];
for i=2:size(data.tW,1); if data.tW(i,1) <= data.tW(i-1,1); data.tW(i,1) = data.tW(i-1,1) + 1e-4; end; end % make sure that times are different
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AttiThie2018';

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
D1 = 'Body temperature is guessed, and lower just after hatch';
D2 = 'mod_1: The same guess for body temperature is used throughout the data';     
D3 = 'mod_1: Change ab from 19 to 18, which is the average value given in AttiThie201818';     
D4 = 'mod_1: Change tx from 17 to 14, which is the average value given in AttiThie201818';     
D5 = 'mod_1: Change am from 3285 to 4.9*365, as reported for the sibling species Gerygone igata (Gill1982)';     
D6 = 'mod_1: Add data for L0 and Li (AttiThie201818), but these are ignored because of inconsistency with weights';     
D7 = 'mod_1: Add data for V0, Ww0, Wwx, and Wwim from AttiThie201818';     
D8 = 'mod_1: Change Wwb from 1 to 1.137, which is the average value given in AttiThie201818';     
D9 = 'mod_1: Change Wwi from 6.5 to 6, which is the average value for females given in AttiThie201818';     
D10 = 'mod_1: Males are assumed to differ from females by {p_Am} only';
D11 = 'mod_1: Change Ri from 0.0137 to 2.1/365, which is the average value given in AttiThie201818';     
D12 = 'mod_1: Update tW data according to values in the Supplemetary Material from AttiThie201818';     
D13 = 'mod_1: Update weights to improve fit';
D14 = 'mod_1: Replace reference entry, from Gill1983 to Gill1982, and add facts';
D15 = 'Curator: In view of max weight larger than that at fledging, body temp is assumed to be constant, but food intake is reduced prior to fledging';
D16 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7, 'D8',D8, 'D9',D9, 'D10',D10, 'D11',D11, 'D12',D12, 'D13',D13, 'D14',D14, 'D15',D15, 'D16',D16);

%% Facts
F1 = 'In New Caledonia, the Fan-tailed Gerygone is the exclusive host of the Shining Bronze-cuckoo, Chalcites lucidus.';
metaData.bibkey.F1 = 'AttiThie2018'; 
F2 = ['Fan-tailed Gerygones raise one clutch per year, during a breeding season that lasts six months long (from first nest building to last fledging).', ...
      'Parasitized clutches received one cuckoo egg which replaces a hosts egg'];
metaData.bibkey.F2 = 'AttiThie2018';
F3 = 'In New Zealand, the Shining Bronze-cuckoo parasitizes the related Grey Warbler, G. igata';
metaData.bibkey.F3 = 'Gill1982'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '3FXN8'; % Cat of Life
metaData.links.id_ITIS = '560255'; % ITIS
metaData.links.id_EoL = '45518120'; % Ency of Life
metaData.links.id_Wiki = 'Gerygone_flavolateralis'; % Wikipedia
metaData.links.id_ADW = 'Gerygone_flavolateralis'; % ADW
metaData.links.id_Taxo = '85381'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B7AC535886BF296E'; % avibase
metaData.links.id_birdlife = 'fan-tailed-gerygone-gerygone-flavolateralis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerygone_flavolateralis}}';
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
bibkey = 'AttiThie2018'; type = 'Article'; bib = [ ... 
'author = {A. Attisano and F. Thiel and N. Sato and Y. Okahisa and D. Bolopo and K. D. Tanaka and R. Kuehn and R. Gula1 and K. Ueda and J. Theuerkauf}, ' ... 
'doi = {10.1007/s10336-018-1592-6}, ' ...
'year = {2018}, ' ...
'title = {Breeding biology of the Fan tailed Gerygone \emph{Gerygone flavolateralis} in relation to parasitism by the Shining Bronze cuckoo \emph{Chalcites lucidus}}, ' ...
'journal = {Journal of Ornithology}, ' ...
'volume = {}, ' ... % electronic doc
'pages = {}']; % electronic doc
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gill1982'; type = 'Article'; bib = [ ... 
'author = {B. J. Gill}, ' ... 
'year = {1982}, ' ...
'title = {Breeding of the grey warbler \emph{Gerygone igata} at {K}aikoura, {N}ew {Z}ealand}, ' ...
'journal = {Ibis}, ' ...
'volume = {124}, ' ...
'number = {2}, ' ...
'pages = {123--147}'];
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


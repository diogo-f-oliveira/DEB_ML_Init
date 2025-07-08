function [data, auxData, metaData, txtData, weights] = mydata_Asterina_gibbosa

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Valvatida'; 
metaData.family     = 'Asterinidae';
metaData.species    = 'Asterina_gibbosa'; 
metaData.species_en = 'Cushion starfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 'Wd-Ww'; 'Wd-Wa'; 'L-dL'; 'L-N'; 'T-JO_W'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 11 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 


%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BIOTIC';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BIOTIC';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '1 - 2 yr' ;
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'BIOTIC';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.05;   units.Lb  = 'cm';  label.Lb  = 'egg diameter';   bibkey.L0  = 'BIOTIC';
data.Lb  = 0.135;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'BIOTIC';
data.Lp  = 1.5;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'BIOTIC';
data.Li  = 5.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BIOTIC';

data.Ri  = 1e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BIOTIC';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% L-W Data 
%   length is diameter: chord between tips of opposite arms
WL_oct = [ ... dry weight (g), length (cm) in October
0.004	0.338
0.006	0.546
0.029	1.044
0.075	1.518
0.168	2.023
0.270	2.520
0.475	3.016
0.698	3.522];
data.LW_oct = WL_oct(:,[2 1]);
units.LW_oct   = {'cm', 'g'};  label.LW_oct = {'diameter', 'dry weight'};  
bibkey.LW_oct = 'CrumEmso1978';

WL_mar = [ ...  dry weight (g), length (cm) in March
0.006	0.693
0.015	0.901
0.042	1.045
0.055	1.249
0.064	1.422
0.157	1.689
0.159	1.837
0.217	2.034
0.221	2.138
0.314	2.444
0.322	2.344
0.411	2.547
0.467	2.726
0.560	2.820
0.665	3.127];
data.LW_mar = WL_mar(:,[2 1]);
units.LW_mar  = {'cm', 'g'};  label.LW_mar = {'diameter', 'dry weight'};  
bibkey.LW_mar = 'CrumEmso1978';

% L-dL Data form CrumEmso78 8C (Feb) - 16.5C (Aug)
data.LdL = [ ... length (mm), size increase (%)
2.370	242.400
8.919	48.886
13.983	28.712
18.880	20.093
19.747	12.719
23.008	12.751
23.964	18.218
27.165	10.867
28.861	7.995];
data.LdL(:,1) = data.LdL(:,1)/10; % convert mm to cm
data.LdL(:,2) = data.LdL(:,2) * 0.01 .* data.LdL(:,1)/ 365; % cm/d
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'length', 'change in length'};  
temp.LdL   = C2K(12);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'CrumEmso1978';

% Data from CrumEmso78: 12 C, assumption: spawning once per year
data.LN = [... length (cm), eggs (#)
1.696	244.082
1.908	338.111
1.911	273.915
2.003	689.161
2.014	373.536
2.016	562.536
2.121	490.980
2.123	715.640
2.203	597.780
2.214	626.285
2.222	387.338
2.226	501.443
2.420	1101.903
2.507	458.023
2.512	525.770
2.520	604.206
2.635	513.014
2.739	983.510
3.520	1290.238
3.735	986.640];
units.LN  = {'cm', '#'};  label.LN = {'length', 'fecundity'};  
temp.LN   = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CrumEmso1978';

% data from MurpJone1987: Ww = 2.76 Wd
data.WdWw = [ ... total dry weight (g), wet weight (g)
0.076	0.120
0.100	0.240
0.103	0.067
0.177	0.293
0.198	0.360
0.232	0.453
0.243	0.667
0.248	1.387
0.266	0.573
0.303	1.013
0.306	0.707
0.330	1.147
0.369	0.840
0.377	1.120
0.409	0.973
0.427	1.227
0.490	1.253
0.551	1.747
0.556	1.387
0.559	1.653
0.588	1.093
0.620	1.573
0.633	1.853
0.649	2.000
0.701	2.107
0.744	1.960
0.802	2.347
0.849	2.373
0.878	2.627
0.933	2.520
0.997	2.693
1.010	3.000
1.097	3.147
1.136	3.120
1.247	3.600
1.350	3.613
1.358	3.867];
units.WdWw   = {'g', 'g'};  label.WdWw = {'dry weight', 'wet weight'};  
bibkey.WdWw = 'MurpJone1987';

% data from MurpJone1987 : Wdb = 0.278 Wdt
data.WdWd = [ ... % total dry weight (g), body dry weight (g) (= asfree dry weight)
0.090	0.021
0.093	0.042
0.109	0.048
0.180	0.053
0.198	0.022
0.222	0.084
0.251	0.076
0.256	0.059
0.285	0.090
0.319	0.098
0.319	0.074
0.337	0.129
0.358	0.116
0.392	0.175
0.414	0.145
0.445	0.141
0.485	0.149
0.542	0.172
0.566	0.181
0.572	0.156
0.579	0.167
0.584	0.210
0.621	0.192
0.632	0.234
0.635	0.198
0.661	0.235
0.708	0.219
0.750	0.224
0.804	0.151
0.850	0.251
0.874	0.295
0.927	0.272
1.011	0.248
1.016	0.304
1.081	0.358
1.092	0.317
1.126	0.323
1.237	0.354
1.358	0.337];
units.WdWd   = {'g', 'g'};  label.WdWd = {'dry weight', 'ash-free dry weight'};  
bibkey.WdWd = 'MurpJone1987';

% data from MurpJone1987 30 mg asfree dry weight
% aquatic respiration
data.TJO_30_aqua = [ ... % temp (C), mul O2/h, 
 5	3.313
10	3.879
15	5.416
20	5.659
22	11.722];
units.TJO_30_aqua   = {'C', 'mul O_2/h'};  label.TJO_30_aqua = {'temperature', 'O_2 consumption'};  
bibkey.TJO_30_aqua = 'MurpJone1987';
comment.TJO_30_aqua = 'at 30 mg asfree dry weight in water';

% data from MurpJone87 300 mg asfree dry weight
% aquatic respiration
data.TJO_300_aqua = [ ... % temp (C), mul O2/h, 
 5	16.244
10	24.246
15	32.571
20	61.263
25	72.498];
units.TJO_300_aqua   = {'C', 'mul O_2/h'};  label.TJO_300_aqua = {'temperature', 'O_2 consumption'};  
bibkey.TJO_300_aqua = 'MurpJone1987';
comment.TJO_300_aqua = 'at 300 mg asfree dry weight in water';

% data from MurpJone87 30 mg asfree dry weight
% aerial respiration
data.TJO_30_air = [... % mul O2/h), temp (C)
 5	23.073
15	13.737
25	18.329];
units.TJO_30_air   = {'C', 'mul O_2/h'};  label.TJO_30_air = {'temperature', 'O_2 consumption'};  
bibkey.TJO_30_air = 'MurpJone1987';
comment.TJO_30_air = 'at 30 mg asfree dry weight in air';

% data from MurpJone87 300 mg asfree dry weight
% aerial respiration
data.TJO_300_air = [... % mul O2/h), temp (C)
 5	40.478
15	53.297
25	99.341];
units.TJO_300_air   = {'C', 'mul O_2/h'};  label.TJO_300_air = {'temperature', 'O_2 consumption'};  
bibkey.TJO_300_air = 'MurpJone1987';
comment.TJO_300_air = 'at 300 mg asfree dry weight in air';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_oct','LW_mar'}; subtitle1 = {'Data from Oct, Mar'};
set2 = {'TJO_30_air','TJO_30_aqua'}; subtitle2 = {'Data in air, aqua at 30 mg ashfree dryweight'};
set3 = {'TJO_300_air','TJO_300_aqua'}; subtitle3 = {'Data in air, aqua at 300 mg ashfree dryweight'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Spawning is assumed to be once per yr';
D2 = 'Protandrous hermaphrodite';
D3 = 'Like all echinoderms, model abj has been selected but E_Hj is coupled to E_Hb in predict';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3', D3);

%% Facts
F1 = 'Protandrous hermaphrodite; the male gametes are produced first and later only female gametes are produced.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Direct development, no larval stages.';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'HTNP'; % Cat of Life
metaData.links.id_ITIS = '157123'; % ITIS
metaData.links.id_EoL = '45328038'; % Ency of Life
metaData.links.id_Wiki = 'Asterina_gibbosa'; % Wikipedia
metaData.links.id_ADW = 'Asterina_gibbosa'; % ADW
metaData.links.id_Taxo = '40883'; % Taxonomicon
metaData.links.id_WoRMS = '123987'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Asterina_gibbosa}}';
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
bibkey = 'MurpJone1987'; type = 'Article'; bib = [ ... 
'author = {Murphy, C. T. and Jones, M. B.}, ' ... 
'year = {1987}, ' ...
'title = {Some factors affecting the respiration of intertidal \emph{Asterina gibbosa} ({E}chinodermata: {A}steroidea)}, ' ...
'journal = {J. mar. bol. Ass. U.K.}, ' ...
'volume = {67}, ' ...
'pages = {717--727}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaceMana2007'; type = 'Article'; bib = [ ... 
'author = {Pace, D. A. and  Manahan, T.}, ' ... 
'year = {2007}, ' ...
'title = {Afficiencies and costs of alrval growth in different food environments ({A}steroidea: \emph{Asterina miniata})}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {353}, ' ...
'pages = {89--106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrumEmso1978'; type = 'Article'; bib = [ ... 
'author = {Crump, R. G.  and Emson, R. H.}, ' ... 
'year = {1978}, ' ...
'title = {Some aspects of the population dynamics of \emph{Asterina gibbosa} ({A}steroidea)}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {58}, ' ...
'pages = {451--466}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BIOTIC'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6203}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


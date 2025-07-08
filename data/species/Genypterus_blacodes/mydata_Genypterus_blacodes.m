function [data, auxData, metaData, txtData, weights] = mydata_Genypterus_blacodes 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Ophidiidae';
metaData.species    = 'Genypterus_blacodes'; 
metaData.species_en = 'Pink cusk-eel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Wwi'}; 
metaData.data_1     = {'t-L_f'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 10 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'All temperatures are guessed for this deep-water species';

data.Lp  = 90;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BakeWiff2014';
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 3.35e-5;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'PareBrav2005';
  comment.Wwb = 'Based on egg diameter of 0.4 mm: pi/6*0.04^3';
data.Wwi = 25e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
data.Ww118 = 7952; units.Ww118 = 'g'; label.Ww118 = 'wet weight at TL = 118.8 cm'; bibkey.Ww118 = 'CrecZint2015';
 
% uni-variate data
% time-length
% females, northern Austral-zone
data.tL_fN = [ ... % time since birth (yr), total length (cm)
1	28.585
2	45.707
3	57.815
4	67.564
5	74.955
6	82.051
7	87.672
8	93.589
9	98.031
10	102.768
11	106.326
12	109.589
13	113.737
14	119.359
15	116.430
16	117.039];
data.tL_fN(:,1) = (2.5+data.tL_fN(:,1)) * 365; % convert yr to d
units.tL_fN   = {'d', 'cm'};  label.tL_fN = {'time since birth', 'total length', 'female'};  
temp.tL_fN    = C2K(5);  units.temp.tL_fN = 'K'; label.temp.tL_fN = 'temperature';
bibkey.tL_fN = 'WiffOjed2007';
comment.tL_fN = 'Data for females from northern Austral-zone; Temperature is guessed';
% females, southern Austral-zone
data.tL_fS = [ ... % time since birth (yr), total length (cm)
1	36.255
2	52.198
3	63.126
4	71.697
5	78.791
6	85.298
7	90.920
8	96.247
9	101.278
10	105.722
11	109.868
12	114.310
13	118.458
14	121.722
15	122.330
16	122.645];
data.tL_fS(:,1) = (2.5+data.tL_fS(:,1)) * 365; % convert yr to d
units.tL_fS   = {'d', 'cm'};  label.tL_fS = {'time since birth', 'total length', 'female'};  
temp.tL_fS    = C2K(5);  units.temp.tL_fS = 'K'; label.temp.tL_fS = 'temperature';
bibkey.tL_fS = 'WiffOjed2007';
comment.tL_fS = 'Data for females from southern Austral-zone; Temperature is guessed';
% males, northern Austral-zone
data.tL_mN = [ ... % time since birth (yr), total length (cm)
1	33.894
2	48.361
3	58.700
4	66.975
5	72.892
6	78.218
7	82.661
8	87.102
9	91.545
10	95.692
11	100.430
12	103.693
13	106.071
14	100.194];
data.tL_mN(:,1) = (2.5+data.tL_mN(:,1)) * 365; % convert yr to d
units.tL_mN   = {'d', 'cm'};  label.tL_mN = {'time since birth', 'total length', 'male'};  
temp.tL_mN    = C2K(5);  units.temp.tL_mN = 'K'; label.temp.tL_mN = 'temperature';
bibkey.tL_mN = 'WiffOjed2007';
comment.tL_mN = 'Data for males from northern Austral-zone; Temperature is guessed';
% males, southern Austral-zone
data.tL_mS = [ ... % time since birth (yr), total length (cm)
1	43.333
2	55.442
3	64.601
4	70.812
5	75.844
6	80.286
7	85.024
8	88.581
9	93.613
10	97.171
11	102.498
12	106.055
13	104.011
14	112.579];
data.tL_mS(:,1) = (2.5+data.tL_mS(:,1)) * 365; % convert yr to d
units.tL_mS   = {'d', 'cm'};  label.tL_mS = {'time since birth', 'total length', 'male'};  
temp.tL_mS    = C2K(5);  units.temp.tL_mS = 'K'; label.temp.tL_mS = 'temperature';
bibkey.tL_mS = 'WiffOjed2007';
comment.tL_mS = 'Data for males from southern Austral-zone; Temperature is guessed';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (1000 eggs)
85.021	76.630
90.946	176.856
93.950	214.549
94.868	409.351
97.789	517.446
101.043	588.310
99.040	389.217
97.955	306.227
96.871	98.976
97.955	99.126
98.873	169.667
99.958	281.651
99.958	393.485
100.960	364.629
101.961	377.194
102.879	306.906
100.960	161.671
103.046	199.237
103.129	116.408
105.883	120.931
108.971	278.753
113.060	179.910
113.894	262.865
113.894	395.409
115.063	544.683
116.898	710.617
120.070	1241.232
118.985	565.935];
data.LN(:,2) = 1e3*data.LN(:,2);
units.LN   = {'cm', '-'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PareBrav2005';
comment.LN = 'Temperature is guessed';

% weight-fecundity
data.WN = [ ... % wet weight (cm), fecundity (1000 eggs)
2961.814	69.436
3982.951	178.664
4518.072	586.311
4178.691	154.513
4981.825	98.260
5217.120	98.328
5002.394	166.854
4807.049	219.247
4985.498	360.509
5083.764	376.676
5182.029	392.842
5063.026	295.978
5378.165	396.933
5811.178	514.061
5809.087	364.781
5690.536	300.193
6001.607	110.658
6161.126	300.329
6473.327	191.485
6806.379	171.408
6903.684	118.987
8262.507	538.975
8474.295	260.650
8964.776	280.964
9378.125	394.051
9988.400	567.714
10382.536	709.038
12193.754	1230.021];
data.WN(:,2) = 1e3*data.WN(:,2);
units.WN   = {'g', '-'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN   = C2K(5);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'PareBrav2005';
comment.WN = 'Temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;
weights.Ww118 = 3 * weights.Ww118;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fN','tL_mN'}; subtitle1 = {'Data for females, males, north austral zone'};
set2 = {'tL_fS','tL_mS'}; subtitle2 = {'Data for females, males, south austral zone'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';  
D2 = 'Fishbase reports: Deep-water, preferred 16 C, but this seems a high temperature for deep water';
D3 = 'Yearly spawning assumed';
D4 = 'Offset of 2.5 yr has been applied to age-at-length since growth after 1 yr is incompatible with before 1 yr. Age was estimated from otolith readings';
D5 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Neonates near surface waters';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3FNTC'; % Cat of Life
metaData.links.id_ITIS = '165000'; % ITIS
metaData.links.id_EoL = '46565540'; % Ency of Life
metaData.links.id_Wiki = 'Genypterus_blacodes'; % Wikipedia
metaData.links.id_ADW = 'Genypterus_blacodes'; % ADW
metaData.links.id_Taxo = '174838'; % Taxonomicon
metaData.links.id_WoRMS = '278702'; % WoRMS
metaData.links.id_fishbase = 'Genypterus-blacodes'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Genypterus_blacodes}}';
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
bibkey = 'PareBrav2005'; type = 'Article'; bib = [ ... 
'author = {Paredes, F. and Bravo, R.}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive cycle, size at first maturation and fecundity in the golden ling, \emph{Genypterus blacodes}, in {C}hile}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {39}, ' ...
'pages = {1085--1096}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakeWiff2014'; type = 'Article'; bib = [ ... 
'author = {Baker, L. L. and Wiff, R. and Quiroz, J. C. and Flores, A. and Cespedes, R. and Barrientos, M. A. and Ojeda, V. and Gatica, C.}, ' ... 
'year = {2014}, ' ...
'title = {Reproductive ecology of the female pink cusk-eel (\emph{Genypterus blacodes}): evaluating differences between fishery management zones in the {C}hilean austral zone}, ' ...
'journal = {Environ. Biol. Fish}, ' ...
'volume = {97}, ' ...
'pages = {1083--1093}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WiffOjed2007'; type = 'Article'; bib = [ ... 
'author = {Wiff, R. and Ojeda, V. and Quiroz, J. C.}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth in pink cusk-eel (\emph{Genypterus blacodes}) off the {C}hilean austral zone: evaluating differences between management fishing zones}, ' ...
'journal = {J. Appl. Inchthyol.}, ' ...
'volume = {23}, ' ...
'pages = {270--272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrecZint2015'; type = 'Article'; bib = [ ... 
'author = {Crechriou, R. and Zintzen, V. and Moore, L. and Roberts, C. D.}, ' ... 
'year = {2015}, ' ...
'title = {Length-weight relationships of 33 fish species from {N}ew {Z}ealand}, ' ...
'journal = {J. Appl. Inchthyol.}, ' ...
'volume = {31}, ' ...
'pages = {558--561}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/482}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


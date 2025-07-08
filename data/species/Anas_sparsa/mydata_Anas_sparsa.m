function [data, auxData, metaData, txtData, weights] = mydata_Anas_sparsa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_sparsa'; 
metaData.species_en = 'African black duck'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K, body temp from Smith et al 1976
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 32;   units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'FrosBall1979';   
  temp.ab = C2K(36.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.tx = 63;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'FrosBall1979';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';    bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Anas_platyrhynchos';
data.am = 29.1 * 365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Anas_platyrhynchos';

data.Wwb = 35;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'FrosBall1979';
data.Wwi = 930; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';   bibkey.Wwi = 'FrosBall1979';
data.Wwim = 1100; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'FrosBall1979';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';           bibkey.Ri  = 'Wiki';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '4 to 8 eggs per clutch, 1 clutch per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % weight^1/3 (g^1/3) at age (d)
0.845	35.835
7.541	56.814
10.445	74.760
12.175	100.155
16.820	130.064
17.950	173.361
22.854	242.079
28.595	354.091
32.906	431.756
38.945	537.801
46.476	606.552
52.850	663.348
63.325	703.776
66.838	693.372
70.057	684.457
77.040	712.902
81.722	701.020
86.354	745.854
94.812	756.407
100.930	771.408
108.516	777.473
115.201	811.884
122.212	807.494
129.495	826.987]; 
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = metaData.T_typical;  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'FrosBall1979';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % weight^1/3 (g^1/3) at age (d)
0.556	31.354
1.133	40.316
1.136	35.839
8.403	73.242
8.702	65.784
8.708	58.321
11.007	100.141
11.600	89.700
11.608	80.745
16.491	173.343
16.799	153.944
16.820	130.064
22.250	264.459
22.298	209.236
22.321	183.863
28.330	322.744
28.856	389.915
29.263	258.577
31.748	421.294
32.371	376.526
32.692	343.694
38.069	537.791
38.381	515.406
38.637	555.708
39.005	469.145
44.386	658.765
45.291	625.940
45.603	603.556
52.500	729.015
52.532	693.194
52.796	724.541
62.394	766.451
63.011	729.146
63.228	814.223
65.272	814.248
66.468	782.920
66.495	751.577
69.353	821.762
69.408	759.076
69.974	779.978
76.332	854.684
76.955	809.916
76.997	762.155
81.008	848.772
81.061	789.072
81.908	821.918
85.620	917.486
85.651	881.666
86.031	781.671
94.067	939.980
94.099	904.159
94.189	801.175
101.379	925.145
101.385	919.175
101.438	857.982
107.462	980.445
107.521	913.281
108.350	967.023
114.485	962.622
115.086	943.226
115.102	925.316
121.478	979.127
121.513	938.828
122.395	932.869
129.622	1015.049
129.631	1004.601
130.229	988.191]; 
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = metaData.T_typical;  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'FrosBall1979';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
% 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'DGPG'; % Cat of Life
metaData.links.id_ITIS = '175113'; % ITIS
metaData.links.id_EoL = '914434'; % Ency of Life
metaData.links.id_Wiki = 'Anas_sparsa'; % Wikipedia
metaData.links.id_ADW = 'Anas_sparsa'; % ADW
metaData.links.id_Taxo = '52176'; % Taxonomicon
metaData.links.id_WoRMS = '881646'; % WoRMS
metaData.links.id_avibase = '1EAFAD9FAED6B99B'; % avibase
metaData.links.id_birdlife = 'african-black-duck-anas-sparsa'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anas_sparsa}}';
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
bibkey = 'FrosBall1979'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1979.9634117}, ' ...
'author = {P. G. H. Frost and I. J. Ball and W. R. Siegfried and F. McKinney}, ' ... 
'year = {1979}, ' ...
'title = {SEX RATIOS, MORPHOLOGY AND GROWTH OF THE {A}FRICAN BUCK DUCK}, ' ...
'journal = {Ostrich}, ' ...
'volume = {50}, ' ...
'pages = {220--233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anas_platyrhynchos}}';
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


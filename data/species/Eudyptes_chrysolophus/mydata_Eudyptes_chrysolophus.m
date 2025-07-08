function [data, auxData, metaData, txtData, weights] = mydata_Eudyptes_chrysolophus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Eudyptes_chrysolophus'; 
metaData.species_en = 'Macaroni penguin'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAS','MIS','MS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pX'; 't-JOe'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 36.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 65;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 195;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Eudyptes_pachyrhynchus'; 
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 142;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
  comment.Ww0 = 'mean of A- and B-egg';
data.Wwb = 101;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Brow1987';
data.Wwi = 5210;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 4760; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Like all Eudytes, 2 eggs per clutch, but only 1 survives';
 
% uni-variate data
% time-weight-energy expenditure
data.tWpT = [ ... % time since hatch (d), weight (g), p_T (kJ/d)
 0	 101.336   75.961
 7	 520.246  317.062
14	1065.809  811.385
21	1067.091  748.735
28	1308.833  743.035
35	1474.695  724.689
42	2083.572 1237.989
49	2236.706 1067.732
56	2339.254 1017.740
63	2302.538  891.787
70	2278.457  873.429];
units.tWpT   = {'d', 'g', 'kJ/d'};  label.tWpT = {'time since birth', 'wet weight', 'energy expenditure'};  
temp.tWpT    = C2K(38.2);  units.temp.tWpT = 'K'; label.temp.tWpT = 'temperature';
bibkey.tWpT = 'Brow1987'; treat.tWpT = {1, {'wet weight', 'energy expenditure'},};

% time-respiration
data.tJOe_A = [ ... % age (d), O2-consumption (ml/d)
 6.219	  10.453
 7.564	  10.453
10.086	  31.359
11.094	  31.359
13.448	  47.038
14.120	  36.585
14.792	  31.359
14.793	  52.265
17.485	  94.077
18.157	  94.077
18.324	  83.624
21.355	 188.153
21.527	 250.871
21.688	 120.209
22.026	 162.021
22.029	 209.059
25.734	 344.948
25.735	 360.627
25.895	 224.739
26.065	 256.098
26.066	 261.324
26.240	 376.307
29.953	 658.537
29.954	 663.763
29.955	 700.349
30.276	 412.892
30.277	 444.251
30.281	 512.195
30.282	 512.195
34.155	 663.763
34.158	 710.802
34.162	 778.746
34.166	 862.369
34.170	 930.314
34.333	 841.464
37.710	1118.467
37.886	1254.355
38.198	 825.784
38.201	 888.502
38.204	 930.314
38.208	1013.937
38.392	1290.941
38.554	1175.958
38.557	1243.902
38.896	1296.167
39.228	1222.997
39.905	1296.167];
units.tJOe_A   = {'d', 'ml/d'};  label.tJOe_A = {'age birth', 'O_2 consumption', 'A-egg'};  
temp.tJOe_A    = C2K(38.2);  units.temp.tJOe_A = 'K'; label.temp.tJOe_A = 'temperature';
initMass.tJOe_A = '99.2'; units.initMass.tJOe_A = 'g'; label.initMass.tJOe_A = 'initial mass';
bibkey.tJOe_A = 'Brow1988';
comment.tJOe_A = 'egg temperature was 27.9 C during 107 d, then 34-35 C';
%
data.tJOe_B = [ ... % age (d), O2-consumption (ml/d)
 4.895	  15.680
 6.583	  15.680
 7.934	  26.133
 8.947	  31.359
10.297	  31.359
11.141	  31.359
13.674	  52.265
14.519	  78.397
17.560	 125.436
17.896	  94.077
18.237	 156.795
21.787	 266.551
21.789	 297.910
21.954	 229.965
22.120	 177.700
22.129	 344.948
22.631	 261.324
22.633	 303.136
26.022	 533.101
26.027	 621.951
26.028	 653.310
26.178	 313.589
26.181	 365.854
26.187	 465.157
26.200	 710.802
26.516	 329.268
26.525	 475.610
26.541	 773.519
30.251	 710.802
30.259	 857.143
30.268	1019.164
30.273	1097.561
30.431	 904.181
30.439	1060.976
33.848	1651.568
34.150	1013.937
34.153	1076.655
34.155	1108.014
34.172	1411.150
34.174	1447.735
34.317	 987.805
34.355	1667.247
34.525	1682.927
34.699	1777.004
34.829	1087.108
34.854	1536.585
34.858	1609.756
35.864	1489.547
35.875	1682.927
36.197	1405.923
36.210	1641.115
36.587	2331.011
36.929	2414.634
36.945	2696.864];
units.tJOe_B   = {'d', 'ml/d'};  label.tJOe_B = {'age birth', 'O_2 consumption', 'B-egg'};  
temp.tJOe_B    = C2K(38.2);  units.temp.tJOe_B = 'K'; label.temp.tJOe_B = 'temperature';
initMass.tJOe_B = '163.3'; units.initMass.tJOe_B = 'g'; label.initMass.tJOe_B = 'initial mass';
bibkey.tJOe_B = 'Brow1988'; 
comment.tJOe_B = 'egg temperature was 27.9 C during 107 d, then 34-35 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tWpT = 2 * weights.tWpT;
weights.tJOe_A = 2 * weights.tJOe_A;
weights.tJOe_B = 2 * weights.tJOe_B;
weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.initMass = initMass;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tJOe_A','tJOe_B'}; subtitle1 = {'A- and B-egg'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Produces a small (99.9 g) and a large egg (120.3 g)';
metaData.bibkey.F1 = 'Warh1974'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3C39W'; % Cat of Life
metaData.links.id_ITIS = '174452'; % ITIS
metaData.links.id_EoL = '45512086'; % Ency of Life
metaData.links.id_Wiki = 'Eudyptes_chrysolophus'; % Wikipedia
metaData.links.id_ADW = 'Eudyptes_chrysolophus'; % ADW
metaData.links.id_Taxo = '51396'; % Taxonomicon
metaData.links.id_WoRMS = '212658'; % WoRMS
metaData.links.id_avibase = '2C2BC004781E7F20'; % avibase
metaData.links.id_birdlife = 'macaroni-penguin-eudyptes-chrysolophus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eudyptes_chrysolophus}}';
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
bibkey = 'Brow1987'; type = 'Article'; bib = [ ... 
'author = {Christopher R. Brown}, ' ... 
'year = {1987}, ' ...
'title = {Energy Requirements for Growth and Maintenance in Macaroni and Rockhopper Penguins}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {8}, ' ...
'pages = {95-102 }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow1988'; type = 'Article'; bib = [ ... 
'author = {Christopher R. Brown}, ' ... 
'year = {1988}, ' ...
'title = {Egg temperature and embryonic metabolism of {A}- and {B}-eggs of macaroni and rockhopper penguins}, ' ...
'journal = {S.-Afr. Tydskr. Dierk.}, ' ...
'volume = {23(3)}, ' ...
'pages = {166-172 }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=2C2BC004781E7F20&sec=lifehistory}}';
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


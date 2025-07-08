function [data, auxData, metaData, txtData, weights] = mydata_Macronectes_giganteus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Macronectes_giganteus'; 
metaData.species_en = 'Southern giant petrel'; 

metaData.ecoCode.climate = {'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MS', 'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik', 'bjSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};  
 
metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 55 to 66 d, temp is guessed';
data.tx = 98; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CopeQuin2009';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 294; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 4*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'EoL';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Wiki: 6 to 7 yr';
data.am = 47*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 211; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg size: length 10.3 cm, width 7 cm: .8 * pi/6*7^2*10.3';
data.Wwi = 5.4e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'CopeQuin2009';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 3 to 8 kg (Wiki)';
data.Wwim = 5.8e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'CopeQuin2009';
  comment.Wwim = 'Asymptotic mass prior to fledging, mean adult mass 3 to 8 kg (Wiki)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
   0    211 % added from Wwb
13.935	762.464
28.194	1436.951
41.968	2346.041
56.227	2815.249
70.162	3328.446
84.097	3944.282
98.032	3533.724];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'CopeQuin2009';
comment.tW_f = 'data for females; weight at hatch from Wwb';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
   0    211 % added from Wwb
14.097	733.138
28.356	1436.951
42.292	2463.343
56.227	3108.505
70.000	3812.317
84.097	4090.909
98.194	3870.968];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'CopeQuin2009';
comment.tW_m = 'data for males; weight at hatch from Wwb';
%
data.tW_f1 = [ ... % time since birth (d), wet weight (g)
   0    211 % added from Wwb
4.052	242.035
6.920	512.242
13.304	801.605
17.045	1102.520
21.375	1389.348
26.593	1647.642
32.365	2039.954
37.540	2475.972
42.103	3014.938
46.988	3435.783
52.466	3827.732
57.072	4188.974
61.968	4565.388
66.292	4881.837
71.539	5021.648
76.764	5250.321
82.608	5346.425
88.753	5413.271
92.867	5388.720
97.900	5202.341
102.362	4955.997
108.333	4533.739];
units.tW_f1   = {'d', 'g'};  label.tW_f1 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f1    = C2K(39.4);  units.temp.tW_f1 = 'K'; label.temp.tW_f1 = 'temperature';
bibkey.tW_f1  = 'Warh1990';
comment.tW_f1 = 'data for females; weight at hatch from Wwb';
%
data.tW_m1 = [ ... % time since birth (d), wet weight (g)
   0    211 % added from Wwb
4.052	242.035
7.213	512.605
11.816	888.657
16.997	1295.054
22.187	1671.831
27.673	2034.160
32.822	2573.850
37.131	2949.541
42.610	3341.490
47.759	3881.179
52.289	4553.438
57.456	5019.077
62.949	5351.784
66.936	5845.596
73.060	6001.303
77.662	6377.356
83.796	6488.632
87.913	6449.271
93.229	6307.686
98.527	6240.152
104.708	6158.894
108.336	5718.929];
units.tW_m1   = {'d', 'g'};  label.tW_m1 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m1    = C2K(39.4);  units.temp.tW_m1 = 'K'; label.temp.tW_m1 = 'temperature';
bibkey.tW_m1  = 'Warh1990';
comment.tW_m1 = 'data for males; weight at hatch from Wwb';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m1 = weights.tW_m1 * 2;
weights.tW_f1 = weights.tW_f1 * 2;
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f1','tW_m1'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3X6TD'; % Cat of Life
metaData.links.id_ITIS = '174594'; % ITIS
metaData.links.id_EoL = '45512099'; % Ency of Life
metaData.links.id_Wiki = 'Macronectes_giganteus'; % Wikipedia
metaData.links.id_ADW = 'Macronectes_giganteus'; % ADW
metaData.links.id_Taxo = '51500'; % Taxonomicon
metaData.links.id_WoRMS = '212636'; % WoRMS
metaData.links.id_avibase = 'C1706A8B803AD6EF'; % avibase
metaData.links.id_birdlife = 'southern-giant-petrel-macronectes-giganteus'; % birdlife
metaData.links.id_AnAge = 'Macronectes_giganteus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Giant_petrel}}';
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
bibkey = 'CopeQuin2009'; type = 'Article'; bib = [ ... 
'author = {S. Copello and F. Quintana}, ' ... 
'year = {2009}, ' ...
'title = {BREEDING BIOLOGY OF THE SOUTHERN GIANT PETREL (\emph{Macronectes giganteus}) IN {P}ATAGONIA, {A}RGENTINA}, ' ...
'journal = {Ornitologia Neotropical}, ' ...
'volume = {20}, ' ...
'pages = {369-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049498/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macronectes_giganteus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Warh1990'; type = 'Book'; bib = [ ... 
'author = {J. Warham}, ' ... 
'year = {1990}, ' ...
'title = {The petrels; thier ecology and breeding systems}, ' ...
'publisher = {Academic Press}, ' ...
'address = {London}'];
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


function [data, auxData, metaData, txtData, weights] = mydata_Macronectes_halli
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Macronectes_halli'; 
metaData.species_en = 'Northern giant petrel'; 

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
metaData.date_subm = [2018 09 18];              
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
data.tx = 120; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Warh1990';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 360; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 6*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'EoL';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 47*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'data for M. giganteus';
  
data.Wwb = 211; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg size: length 10.3 cm, width 7 cm: .8 * pi/6*7^2*10.3';
data.Wwi = 5.4e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Warh1990';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 4.5 kg (EoL)';
data.Wwim = 6.5e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'Warh1990';
  comment.Wwim = 'Asymptotic mass prior to fledging, mean adult mass 5.8 kg (EoL)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight  
data.tW_f = [ ... % time since birth (d), wet weight (g)
   0    211 % added from Wwb
2.557	327.621
7.711	598.984
13.144	955.722
18.297	1241.303
23.734	1555.388
28.875	1968.928
33.150	2396.482
38.001	2824.172
41.998	3152.134
47.445	3366.694
52.598	3652.275
57.183	3852.413
62.346	4024.253
67.800	4167.725
72.388	4339.429
77.275	4397.459
82.438	4569.298
86.448	4769.300
92.776	4799.236
97.689	4572.912
104.027	4503.324
108.361	4319.517
112.691	4178.363];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'Warh1990';
comment.tW_f = 'data for females; weight at hatch from Wwb';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
   0    211 % added from Wwb
2.559	313.403
8.004	542.182
12.569	955.586
18.285	1369.262
22.848	1796.884
28.557	2281.650
32.539	2766.006
37.370	3406.961
43.653	3906.079
47.935	4262.544
52.798	4562.275
58.533	4776.904
63.121	4948.607
67.718	5020.786
73.153	5363.306
78.018	5648.819
82.610	5777.870
88.058	5978.213
92.918	6320.597
97.801	6407.062
103.577	6195.161
108.219	5798.157
112.567	5472.172
118.366	5018.570];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'Warh1990';
comment.tW_m = 'data for males; weight at hatch from Wwb';

%% set weights for all real data
weights = setweights(data, []);
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
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '734HF'; % Cat of Life
metaData.links.id_ITIS = '174595'; % ITIS
metaData.links.id_EoL = '45512100'; % Ency of Life
metaData.links.id_Wiki = 'Macronectes_halli'; % Wikipedia
metaData.links.id_ADW = 'Macronectes_halli'; % ADW
metaData.links.id_Taxo = '51501'; % Taxonomicon
metaData.links.id_WoRMS = '212637'; % WoRMS
metaData.links.id_avibase = 'F504C8DE4D185454'; % avibase
metaData.links.id_birdlife = 'northern-giant-petrel-macronectes-halli'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

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
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049499/overview}}';
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


function [data, auxData, metaData, txtData, weights] = mydata_Chlamydotis_undulata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Otidiformes'; 
metaData.family     = 'Otididae';
metaData.species    = 'Chlamydotis_undulata'; 
metaData.species_en = 'Houbara bustard'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.25); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'guess';   
  temp.ab = C2K(37.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'HeezSedd2001';   
  temp.tx = C2K(40.25);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(40.25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 730;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';     bibkey.tR = 'guess';
  temp.tR = C2K(40.25);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'AnAge';   
  temp.am = C2K(40.25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 33;     units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'HeezSedd2001';
data.Wwi = 1.7e3;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of females';  bibkey.Wwi = 'Wiki';
data.Wwim = 2.4e3;   units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of males';   bibkey.Wwim = 'Wiki';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(40.25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 4 eggs per clutch';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % age (d) weight (g)
1.000	31.489
4.027	36.652
7.919	52.314
12.099	102.176
17.577	146.733
22.622	204.462
27.955	259.550
33.432	314.633
39.054	377.606
43.090	419.578
46.838	479.981
50.009	514.087
53.180	537.667
57.360	608.582
62.982	647.871
66.586	668.805
72.496	721.242
78.117	750.005
80.135	773.622];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'HeezSedd2001';
comment.tW_f = 'Data for females, reconstructed from drawn curve';
%
data.tW_m = [ ... % age (d) weight (g)
0.856	36.757
4.604	41.897
8.207	62.831
12.243	102.172
15.991	144.154
19.739	186.136
23.631	230.744
27.090	264.841
28.820	283.205
32.856	333.073
36.459	377.691
39.919	432.840
43.378	482.726
47.847	524.685
52.459	608.743
56.495	677.032
61.396	742.660
66.441	810.915
70.333	871.313
73.072	913.329
77.108	952.669
80.423	978.876];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'HeezSedd2001';
comment.tW_m = 'Data for males, reconstructed from drawn curve';

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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '69X4V'; % Cat of Life
metaData.links.id_ITIS = '176432'; % ITIS
metaData.links.id_EoL = '45513578'; % Ency of Life
metaData.links.id_Wiki = 'Chlamydotis_undulata'; % Wikipedia
metaData.links.id_ADW = 'Chlamydotis_undulata'; % ADW
metaData.links.id_Taxo = '53453'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5714C710ACE4DA8B'; % avibase
metaData.links.id_birdlife = 'african-houbara-chlamydotis-undulata'; % birdlife
metaData.links.id_AnAge = 'Chlamydotis_undulata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlamydotis_undulata}}';
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
bibkey = 'HeezSedd2001'; type = 'Article'; bib = [ ... 
'author = {Y. van Heezik and P. J. Seddon}, ' ... 
'year = {2001}, ' ...
'title = {Influence of Group Size and Neonatal Handling on Growth Rates, Survival, and Tameness of Juvenile {H}oubara Bustards}, ' ...
'journal = {Zoo biology}, ' ...
'volume = {20}, ' ...
'pages = {423--433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chlamydotis_undulata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/915384/details}}';
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


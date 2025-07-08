function [data, auxData, metaData, txtData, weights] = mydata_Centrocercus_urophasianus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Centrocercus_urophasianus'; 
metaData.species_en = 'Sage grouse'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 21];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 21];

%% set data
% zero-variate data

data.ab = 26;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'SchrYoun2020';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '25-29 d';
data.tx = 30;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Colinus_virginianus';
data.tp = 12*7;        units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'SchrYoun2020';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on broods break up 10-12 wk';
data.tR = 365;          units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 30.5;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SchrYoun2020';
data.Wwi = 1400;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SchrYoun2020';
  comment.Wwi = '1-1.8 kg';
data.Wwim = 2300;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'SchrYoun2020';
  comment.Wwim = '1.7-2.9 kg';

data.Ri  = 7/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-10 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.606	33.284
10.821	66.096
21.040	132.206
31.263	231.614
41.193	378.604
50.521	520.867
61.350	653.544
69.775	776.822
80.594	842.904
91.416	923.256
100.133	989.437
110.651	1046.019
122.068	1088.288
131.981	1111.601
141.594	1134.928
150.004	1144.042
161.418	1162.526
170.729	1181.111
181.242	1199.638
190.855	1222.965];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight','females'};  
temp.tW_f    = metaData.T_typical;  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'SchrYoun2020'; 
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
1.208	38.012
10.520	61.353
20.743	160.761
30.974	312.494
41.207	483.255
49.642	682.642
60.182	900.957
71.016	1081.203
80.648	1242.478
90.276	1384.726
101.406	1522.146
110.424	1593.070
120.344	1668.708
130.864	1739.561
141.081	1786.644
151.594	1809.928
160.609	1852.311
169.921	1875.652
180.436	1903.694
190.045	1903.236];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight','males'};  
temp.tW_m    = metaData.T_typical;  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'SchrYoun2020'; 
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;
weights.ab = 3 * weights.ab;

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
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'S9K2'; % Cat of Life
metaData.links.id_ITIS = '175855'; % ITIS
metaData.links.id_EoL = '45510625'; % Ency of Life
metaData.links.id_Wiki = 'Centrocercus_urophasianus'; % Wikipedia
metaData.links.id_ADW = 'Centrocercus_urophasianus'; % ADW
metaData.links.id_Taxo = '52970'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B7E467E2127D8C11'; % avibase
metaData.links.id_birdlife = 'sage-grouse-centrocercus-urophasianus'; % birdlife
metaData.links.id_AnAge = 'Centrocercus_urophasianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centrocercus_urophasianus}}';
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
bibkey = 'SchrYoun2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.saggro.0}, ' ...
'author = {Schroeder, M. A., J. R. Young and C. E. Braun}, ' ...
'year = {2020}, ' ...
'title = {Greater Sage-Grouse (\emph{Centrocercus urophasianus}), version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}, ' ... 
'howpublished = {\url{https://birdsoftheworld.org/bow/species/saggro/cur/breeding}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B7E467E2127D8C11&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Centrocercus_urophasianus}}';
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


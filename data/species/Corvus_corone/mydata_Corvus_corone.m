function [data, auxData, metaData, txtData, weights] = mydata_Corvus_corone

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Corvidae';
metaData.species    = 'Corvus_corone'; 
metaData.species_en = 'Carrion crow'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 34;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 102;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.2*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Value for Corvus frugilegus';

data.Wwb = 11.5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Rich1989';
data.Wwi = 512;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 577;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_af  = [ ... % time since birth (d), weight (g)
1.016	12.780
4.013	48.813
7.829	124.656
12.311	233.285
15.824	316.206
19.939	368.540
23.897	391.549
27.647	392.283
31.906	402.347] ;   
units.tW_af  = {'d', 'g'};  label.tW_af = {'time since birth', 'wet weight', 'female, agriculture'};  
temp.tW_af   = C2K(41.6);  units.temp.tW_af = 'K'; label.temp.tW_af = 'temperature';
bibkey.tW_af = 'Rich1989';
%
data.tW_am  = [ ... % time since birth (d), weight (g)
1.016	12.780
4.470	52.280
8.084	131.668
11.805	236.865
15.829	343.201
19.896	406.104
23.855	433.808
27.862	453.291
31.865	453.994] ;   
units.tW_am  = {'d', 'g'};  label.tW_am = {'time since birth', 'wet weight', 'male, agriculture'};  
temp.tW_am   = C2K(41.6);  units.temp.tW_am = 'K'; label.temp.tW_am = 'temperature';
bibkey.tW_am = 'Rich1989';
%
data.tW_uf  = [ ... % time since birth (d), weight (g)
0.965	11.612
4.569	39.358
8.329	92.907
12.297	165.211
16.262	228.126
20.124	281.664
23.828	301.182
27.834	313.623
31.889	317.842] ;   
units.tW_uf  = {'d', 'g'};  label.tW_uf = {'time since birth', 'wet weight', 'female, urban'};  
temp.tW_uf   = C2K(41.6);  units.temp.tW_uf = 'K'; label.temp.tW_uf = 'temperature';
bibkey.tW_uf = 'Rich1989';
%
data.tW_um  = [ ... % time since birth (d), weight (g)
0.965	11.612
4.011	38.250
7.924	92.955
11.740	166.451
15.760	251.659
19.827	314.562
23.841	366.908
27.949	385.205
31.901	378.873] ;   
units.tW_um  = {'d', 'g'};  label.tW_um = {'time since birth', 'wet weight', 'male, urban'};  
temp.tW_um   = C2K(41.6);  units.temp.tW_um = 'K'; label.temp.tW_um = 'temperature';
bibkey.tW_um = 'Rich1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_um = weights.tW_um * 2;
weights.tW_uf = weights.tW_uf * 2;
weights.tW_am = weights.tW_am * 2;
weights.tW_af = weights.tW_af * 2;

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
set1 = {'tW_af','tW_am','tW_uf','tW_um'}; subtitle1 = {'Data for females, males in argiculture, urban environm.'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'YNHJ'; % Cat of Life
metaData.links.id_ITIS = '559494'; % ITIS
metaData.links.id_EoL = '45510014'; % Ency of Life
metaData.links.id_Wiki = 'Corvus_corone'; % Wikipedia
metaData.links.id_ADW = 'Corvus_corone'; % ADW
metaData.links.id_Taxo = '59530'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '26FB62DAE4262583'; % avibase
metaData.links.id_birdlife = 'carrion-crow-corvus-corone'; % birdlife
metaData.links.id_AnAge = 'Corvus_corone'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corvus_corone}}';
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
bibkey = 'Rich1989'; type = 'Article'; bib = [ ... 
'doi = {10.2307/4840}, ' ...
'author = {Richner, H.}, ' ... 
'year = {1989}, ' ...
'title = {Habitat-Specific Growth and Fitness in Carrion Crows (\emph{Corvus corone corone})}, ' ...
'journal = {The Journal of Animal Ecology}, ' ...
'volume = {427)}, ' ...
'pages = {408-418}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Corvus_corone}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=26FB62DAE4262583&sec=lifehistory}}';
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


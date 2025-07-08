function [data, auxData, metaData, txtData, weights] = mydata_Branta_canadensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Branta_canadensis'; 
metaData.species_en = 'Canada goose';

metaData.ecoCode.climate = {'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2020 12 13];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data;
data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'Wiki';  
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24-32 d';
data.tx = 7.5*7;   units.tx = 'd';    label.tx = 'time since birth at fledging';       bibkey.tx = 'Wiki';  
  temp.tx = C2K(41.1); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '6-9 wk';
data.tp = 157.5;   units.tp = 'd';    label.tp = 'time since birth at puberty';       bibkey.tp = 'guess';  
  temp.tp = C2K(41.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';      bibkey.tR = 'AnAge'; 
  temp.tR = C2K(41.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 42*365;     units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';                   
  temp.am = C2K(41.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 60;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                 bibkey.Wwb = 'Sedi1986'; 
data.Wwi = 1313;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'Sedi1986';   
  comment.Wwi = 'Wiki: 2.4-5.5 kg ';
data.Wwim = 1500;  units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';   bibkey.Wwim = 'Sedi1986';   
  comment.Wwim = 'Wiki: 2.6-6.5 kg';

data.Ri  = 5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-9 eggs per clutch';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
1.906	67.477
4.856	90.939
5.085	87.544
5.989	104.384
6.667	114.479
6.680	87.436
8.037	107.626
8.044	94.104
8.907	195.454
10.745	161.527
13.668	242.456
13.791	222.166
14.772	316.748
15.604	242.325
15.975	421.455
20.160	482.017
20.818	536.057
21.301	478.560
28.601	694.404
28.609	677.502
28.619	657.220
30.557	893.709
30.581	843.003
30.912	626.643
34.813	1045.534
38.766	876.252
40.736	1045.133
44.923	862.315
47.489	1213.691
47.825	987.189];
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(41.1); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Sedi1986';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
1.697	68.838
1.930	48.463
2.382	69.071
3.183	62.526
4.777	80.115
7.961	132.337
8.082	105.105
8.971	211.090
9.781	163.639
15.820	210.016
20.632	634.384
20.871	590.147
26.642	813.705
26.886	742.198
30.839	927.636
30.863	821.963
34.771	1205.113
34.993	1232.462
36.989	991.097
40.948	1152.673
44.645	959.615
46.894	1106.973
47.762	1304.996
47.900	1202.771
48.890	1363.336];
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m = C2K(41.1); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Sedi1986';
comment.tW_m = 'Data for males';

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
metaData.links.id_CoL = '5WRC3'; % Cat of Life
metaData.links.id_ITIS = '174999'; % ITIS
metaData.links.id_EoL = '45510537'; % Ency of Life
metaData.links.id_Wiki = 'Branta_canadensis'; % Wikipedia
metaData.links.id_ADW = 'Branta_canadensis'; % ADW
metaData.links.id_Taxo = '52023'; % Taxonomicon
metaData.links.id_WoRMS = '159176'; % WoRMS
metaData.links.id_avibase = 'B59E18633E2EFD25'; % avibase
metaData.links.id_birdlife = 'canada-goose-branta-canadensis'; % birdlife
metaData.links.id_AnAge = 'Branta_canadensis'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branta_canadensis}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sedi1986'; type = 'Article'; bib = [ ... 
'author = {James S. Sedinger}, ' ... 
'year = {1986}, ' ...
'title = {Growth and Development of {C}anada Goose Goslings}, ' ...
'journal = {Condor}, ' ...
'volume = {88(2)}, ' ...
'pages = {169-180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Branta_canadensis}}'; 
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


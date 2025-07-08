function [data, auxData, metaData, txtData, weights] = mydata_Larus_marinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Larus_marinus'; 
metaData.species_en = 'Great black-backed gull'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care';
data.tx = 52;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '49-56 d';
data.tp = 156;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '49-56 d';
data.tR = 5*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 32.8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 116.5;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 80; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Harr1964';
data.Wwi = 1407; units.Wwi = 'g';   label.Wwi = 'ultimate wet weightof females';     bibkey.Wwi = 'avibase';
data.Wwim = 1806; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males';     bibkey.Wwim = 'avibase';

data.Ri  = 2.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.983	96.153
5.944	172.470
8.006	252.889
9.987	303.826
12.132	458.942
14.117	586.550
16.021	670.914
17.213	769.104
20.074	987.066
21.904	1177.597
23.810	1299.314
31.811	1471.600];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Harr1964';

% time- embryo weight
data.tWe = [ ... % age (d), wet weight (g)
8.033	1.220
9.970	2.138
11.031	3.413
11.980	6.204
12.210	5.036
12.498	4.101
12.967	4.097
14.384	6.535
14.389	7.585
15.879	13.404
16.089	7.922
16.846	20.044
17.006	16.428
17.853	22.485
18.996	29.240
19.812	28.417
19.957	21.419
19.996	30.282
20.804	27.360
21.881	32.366
21.965	38.197
22.008	48.109
23.963	39.580
24.040	57.189
26.041	59.040];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'embryo wet weight'};  
temp.tWe    = temp.ab;  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'Harr1964';
comment.tWe = 'Mean temp is guessed and equal to ab';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe = weights.tWe * 2;
weights.tW = weights.tW * 2;

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
D1 = 'Feeding is slightly reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Links
metaData.links.id_CoL = '3SBQM'; % Cat of Life
metaData.links.id_ITIS = '176815'; % ITIS
metaData.links.id_EoL = '45509292'; % Ency of Life
metaData.links.id_Wiki = 'Larus_marinus'; % Wikipedia
metaData.links.id_ADW = 'Larus_marinus'; % ADW
metaData.links.id_Taxo = '53815'; % Taxonomicon
metaData.links.id_WoRMS = '137146'; % WoRMS
metaData.links.id_avibase = 'E826E9F3FBAED223'; % avibase
metaData.links.id_birdlife = 'glaucous-winged-gull-larus-glaucescens'; % birdlife
metaData.links.id_AnAge = 'Larus_marinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Larus_glaucescens}}';
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
bibkey = 'Harr1964'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1964.tb03725.x }, ' ...
'author = {M. P. Harris}, ' ... 
'year = {1964}, ' ...
'title = {ASPECTS OF THE BREEDING BIOLOGY OF THE GULLS \emph{Larus argentatus}, \emph{L. fuscus} and \emph{L. marinus}}, ' ...
'journal = {Ibis}, ' ...
'volume = {106}, ' ...
'pages = {432-456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Larus_glaucescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E826E9F3FBAED223&sec=lifehistory}}';
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


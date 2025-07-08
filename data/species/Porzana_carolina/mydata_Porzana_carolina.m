function [data, auxData, metaData, txtData, weights] = mydata_Porzana_carolina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gruiformes'; 
metaData.family     = 'Rallidae';
metaData.species    = 'Porzana_carolina'; 
metaData.species_en = 'Sora'; 

metaData.ecoCode.climate = {'B','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tnffm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 19;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '18-20 d';
data.tx = 23;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '21-25 d';
data.tp = 69;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(40.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Rallus_limicola';

data.Ww0 = 8.9;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 6.35;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MelvGibb2020';
data.Wwi = 71.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 88; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';

data.Ri  = 10.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-18 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.978	5.913
1.043	6.217
2.020	7.435
2.021	6.826
2.870	7.130
2.933	8.500
10.099	18.391
10.103	16.565
10.877	21.891
11.014	18.087
15.040	31.022
15.046	27.978
16.990	36.196
16.999	31.174
21.016	49.130
21.029	42.130
23.889	49.435
24.157	46.087
29.171	54.304
29.172	53.543
36.121	75.304
36.332	67.087];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Kauf1987';
  
%% set weights for all real data
weights = setweights(data, []);
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
D1 = 'Males are assumed to differ from females by {p_Am} only';     
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4M2QV'; % Cat of Life
metaData.links.id_ITIS = '176242'; % ITIS
metaData.links.id_EoL = '45509111'; % Ency of Life
metaData.links.id_Wiki = 'Porzana_carolina'; % Wikipedia
metaData.links.id_ADW = 'Porzana_carolina'; % ADW
metaData.links.id_Taxo = '53368'; % Taxonomicon
metaData.links.id_WoRMS = '159013'; % WoRMS
metaData.links.id_avibase = '2CC21529B5674AEB'; % avibase
metaData.links.id_birdlife = 'sora-porzana-carolina'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Porzana_carolina}}';
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
bibkey = 'Kauf1987'; type = 'article'; bib = [ ... 
'author = {Gerald W. Kaufmann}, ' ... 
'year = {1987}, ' ...
'title = {Growth and Development of Sora and Virginia Rail Chicks}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {99(3)}, ' ...
'pages = {432-440}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=2CC21529B5674AEB&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MelvGibb2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.sora.01}, ' ...
'author = {Melvin, S. M. and J. P. Gibbs}, ' ... 
'year = {2020}, ' ...
'title = {Sora (\emph{Porzana carolina}), version 1.0. In Birds of the World (A. F. Poole, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}']; 
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


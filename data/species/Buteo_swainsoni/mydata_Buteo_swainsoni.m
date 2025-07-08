function [data, auxData, metaData, txtData, weights] = mydata_Buteo_swainsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_swainsoni'; 
metaData.species_en = 'Swainson''s hawk';

metaData.ecoCode.climate = {'BS','Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 31;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'avibase: 28-35 d';
data.tx = 35;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'Bech1983';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24.9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 61;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 39.4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwi = 1109;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 808;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2-4 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW_1977 = [ ... % time since birth (d), wet weight (g) grazed, cultivated habitat
 5	159.580 212.210
10	455.343 499.173
15	672.188 746.664
20	897.722 853.919
25	952.346 825.157
30	927.915 862.155
35	964.941 877.252];
units.tW_1977   = {'d', 'g'};  label.tW_1977 = {'time since birth', 'wet weight'};  
temp.tW_1977    = C2K(40);  units.temp.tW_1977 = 'K'; label.temp.tW_1977 = 'temperature';
bibkey.tW_1977  = 'Bech1983'; treat.tW_1977 = {1, {'grazed habitat','cultivated habitat'}};
%
data.tW_1978 = [ ... % time since birth (d), wet weight (g)
 5	169.687 173.997
10	369.847 378.495
15	436.409 367.442
20	632.313 481.392
25	763.533 560.941
30	907.602 601.613
35	827.690 685.363];
units.tW_1978   = {'d', 'g'};  label.tW_1978 = {'time since birth', 'wet weight'};  
temp.tW_1978    = C2K(40);  units.temp.tW_1978 = 'K'; label.temp.tW_1978 = 'temperature';
bibkey.tW_1978  = 'Bech1983'; treat.tW_1978 = {1, {'grazed habitat','cultivated habitat'}};
%
data.tW_1979 = [ ... % time since birth (d), wet weight (g)
 5	192.181 115.989
10	333.862 283.094
15	339.973 424.748
20	668.126 379.956
25	788.647 610.649
30	900.693 680.375
35	966.074 741.518];
units.tW_1979   = {'d', 'g'};  label.tW_1979 = {'time since birth', 'wet weight'};  
temp.tW_1979    = C2K(40);  units.temp.tW_1979 = 'K'; label.temp.tW_1979 = 'temperature';
bibkey.tW_1979  = 'Bech1983'; treat.tW_1979 = {1, {'grazed habitat','cultivated habitat'}};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'NYVT'; % Cat of Life
metaData.links.id_ITIS = '175367'; % ITIS
metaData.links.id_EoL = '45511424'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_swainsoni'; % Wikipedia
metaData.links.id_ADW = 'Buteo_swainsoni'; % ADW
metaData.links.id_Taxo = '93204'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'DE473F42C06227F0'; % avibase
metaData.links.id_birdlife = 'swainsons-hawk-buteo-swainsoni'; % birdlife
metaData.links.id_AnAge = 'Buteo_swainsoni'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_swainsoni}}';
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
bibkey = 'Bech1983'; type = 'Article'; bib = [ ... 
'title = {Food Supply and the Occurrence of Brood Reduction in Swainson''s Hawk}, ' ...
'author = {Marc J. Bechard}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'year = {1983}, ' ...
'volume = {95(2)}, ' ...
'pages = {233-242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Buteo_swainsoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=DE473F42C06227F0&sec=lifehistory}}';
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


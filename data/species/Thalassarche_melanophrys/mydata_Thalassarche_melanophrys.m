function [data, auxData, metaData, txtData, weights] = mydata_Thalassarche_melanophrys

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Diomedeidae';
metaData.species    = 'Thalassarche_melanophrys'; 
metaData.species_en = 'Black-browed albatross'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCic', 'biCik', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Philipp Boersch-Supan', 'Sarah Burgan'}; 
metaData.date_subm = [2015 04 20];                          
metaData.email    = {'philipp@boersch-supan.de'};     
metaData.address  = {'University of South Florida, 33620, USA'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 09];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 01];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 72.1;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TickPind1975';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from Rahn1991 for Laysan and the Black-footed Albatrosses';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from Warh1971';
data.tp = 360;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from Warh1971';
data.tR = 8*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Prin1976';
  temp.tR = C2K(39.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 44*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ButtBatt2008';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 175.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TickPind1975';
data.Wwi = 3170;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'TickPind1975';
data.Wwim = 3710; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'TickPind1975';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'TickPind1975';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91;    % time since birth
            175.8 209.7 248.5 283.7 361.2 403.7 471.1 515.4 569 612.6 665.6 755.3 792.4 848.1 928.1 1037 1160 1187.1 1254.6 1326.1 1341.9 1538.6 1585.7 1753.2 1731 1841 1962.2 2057.9 2273.4 2311.8 2225.8 2381.4 2414.1 2582.1 2597.9 2654 2836.4 2975.7 3050 3115 3200.7 3052.9 3414.3 3373.6 3541.4 3657.1 3580.7 3521.4 3587.9 3727.9 3782.1 3730 3802.9 4032.1 4123.6 4138.6 4204.3 4350.7 4231.4 4606.7 4312.9 4358.6 4463.8 4438.5 4641.7 4510 4708.5 4650 4594.6 4718.5 4538.5 4506.9 4725.4 4698.5 4615.4 4678.5 4655 4689.2 5046.4 4857 4829 4935 4908.8 5300 4948.6 4955.7 5162 4896.7 4485 4800 5290]';  %wet  weight at f and T
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Prin1976';
  
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
D1 = 'Wing length ontogeny is not used, because growth is not isomorphic';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_3: v is reduced';
D4 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7C5H9'; % Cat of Life
metaData.links.id_ITIS = '723260'; % ITIS
metaData.links.id_EoL = '45511273'; % Ency of Life
metaData.links.id_Wiki = 'Thalassarche_melanophris'; % Wikipedia
metaData.links.id_ADW = 'Thalassarche_melanophris'; % ADW
metaData.links.id_Taxo = '959767'; % Taxonomicon
metaData.links.id_WoRMS = '343995'; % WoRMS
metaData.links.id_avibase = 'F9CBC9EB6CE43281'; % avibase
metaData.links.id_birdlife = 'black-browed-albatross-thalassarche-melanophris'; % birdlife
metaData.links.id_AnAge = 'Thalassarche_melanophris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Black-browed_albatross}}';
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
bibkey = 'TickPind1975'; type = 'Article'; bib = [ ... 
'author = {Tickell, W. L. N. and Pinder, R.}, ' ... 
'year = {1975}, ' ...
'title = {Breeding biology of the black-browed albatross \emph{Diomedea melanophris} and grey-headed albatross \emph{D. chrysostoma} at {B}ird {I}sland, {S}outh {G}eorgia}, ' ...
'journal = {Ibis}, ' ...
'volume = {117}, ' ...
'pages = {433--451}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Prin1976'; type = 'Article'; bib = [ ... 
'author = {Prince, P. A.}, ' ... 
'year = {1976}, ' ...
'title = {Unpublished measurements of black-browed albatross chicks from {B}ird {I}sland, 1975/76}, ' ...
'journal = {Archives of the British Antarctic Survey}, ' ...
'volume = {BS53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Thalassarche_melanophrys/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ButtBatt2008'; type = 'Article'; bib = [ ... 
'author = {Buttemer, W. A. and Battam, H. and Hulbert, A. J.}, ' ... 
'year = {2008}, ' ...
'title = {Fowl play and the price of petrel: long-living Procellariiformes have peroxidation-resistant membrane composition compared with short-living Galliformes}, ' ...
'journal = {Biology letters}, ' ...
'volume = {4}, ' ...
'pages = {351--354}'];
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


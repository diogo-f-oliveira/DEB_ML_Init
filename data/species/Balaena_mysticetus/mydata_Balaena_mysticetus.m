function [data, auxData, metaData, txtData, weights] = mydata_Balaena_mysticetus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenidae';
metaData.species    = 'Balaena_mysticetus'; 
metaData.species_en = 'Bowhead whale'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCik', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp usually 37 or so for a mammal
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 04 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13]; 

%% set data
% zero-variate data

data.tg = 396;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-6 months';
data.tp = 8212 ;    units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 211 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 425;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'Wiki';
comment.Lb = '4-4.5 m';
data.Lx  = 820;   units.Lx  = 'cm';  label.Lx  = 'length at weaning'; bibkey.Lx  = 'Wiki';
data.Lp  = 1320;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'ADW'; 
  comment.Lp = 'betwen 12.3 and 14.2 m';
data.Li  = 1800;   units.Li  = 'cm';  label.Li  = 'ultimate length for females';   bibkey.Li  = 'AnAge';
data.Lim  = 1700;   units.Lim  = 'cm';  label.Lim  = 'ultimate length for males';   bibkey.Lim  = 'ADW';

data.Wwb = 9e5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 1e8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/1642;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calve each 4.5 yr'; 

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.059	417.447
0.888	939.255
2.051	860.545
7.998	769.181
9.926	1228.002
13.855	1424.385
18.963	1500.630
19.729	852.173
21.791	1092.725
22.211	1007.339
24.951	1342.837
26.282	1573.853
28.092	1624.582
29.782	1270.384
31.286	1219.864
34.023	1558.525
38.364	1685.338
41.459	1441.948
47.588	1654.287
56.747	1727.626
69.690	1636.705];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f    = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'GeorBada1999';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.400	876.175
0.409	847.356
0.512	838.238
0.800	910.878
3.555	810.025
7.502	977.937
7.535	924.161
19.082	1307.668
21.006	1171.761
22.347	1386.961
26.560	1121.498
30.859	1314.740
34.159	1337.093
46.962	1473.931
57.631	1487.260
91.912	1422.996
136.031	1527.018
160.336	1519.065
173.081	1750.803
211.546	1468.527];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m    = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'GeorBada1999';
comment.tL_m = 'data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;
weights.tg = 0 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Datae for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'very fast growth from birth to weaning, which is not captured with single food';
D3 = 'post-foetal growth suggests that gestion lasts 3 times the observed value. Either the foetus develops much faster than predicted or observed gestation is too short; observed gestation time is ignored';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'largest life span among mammals';
metaData.bibkey.F1 = 'AnAge'; 
F2 = 'largest mouth among animals';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'KF7Q'; % Cat of Life
metaData.links.id_ITIS = '180533'; % ITIS
metaData.links.id_EoL = '46559419'; % Ency of Life
metaData.links.id_Wiki = 'Balaena_mysticetus'; % Wikipedia
metaData.links.id_ADW = 'Balaena_mysticetus'; % ADW
metaData.links.id_Taxo = '68905'; % Taxonomicon
metaData.links.id_WoRMS = '137086'; % WoRMS
metaData.links.id_MSW3 = '14300005'; % MSW3
metaData.links.id_AnAge = 'Balaena_mysticetus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Balaena_mysticetus}}';
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
bibkey = 'GeorBada1999'; type = 'Article'; bib = [ ... 
'author = {George, J. C. and Bada, J. and Zeh, J. and Scott, L. and Brown, S. E. and O''Hara, T. and Suydam, R.}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth estimates of bowhead whales (\emph{Balaena myticetus}) via aspartic acid}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {77}, ' ...
'pages = {571--580}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Balaena_mysticetus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Balaena_mysticetus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


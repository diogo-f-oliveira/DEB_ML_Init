function [data, auxData, metaData, txtData, weights] = mydata_Hydropotes_inermis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Hydropotes_inermis'; 
metaData.species_en = 'Water deer'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 190;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'KirkWill1988';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 7.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'EoL';   
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5.5*30.5;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'EoL';   
  temp.tpm = C2K(38.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 13.9*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 1042;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EoL';
data.Wwi = 18e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
  comment.Wwi = '12 till 18.5 kg';
  
data.Ri  = 2.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight data
data.tW_f = [ % time since birth (d), eviscerated weight (kg)
0.743	0.810
2.070	0.920
4.155	1.160
6.240	1.344
8.321	1.750
11.537	2.376
15.521	2.616
17.616	2.395
17.625	1.972
18.571	2.156
20.458	2.708
24.457	2.285
25.217	2.249
27.676	2.728
28.818	2.636
44.749	3.852
44.944	3.595
49.684	4.056
68.456	5.641
68.822	6.304
84.615	5.054]; 
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(38.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'KirkWill1988';
comment.tW_f = 'Data for females';
%
data.tW_m = [ % time since birth (d), eviscerated weight (kg)
0.740	0.920
3.205	1.160
10.403	2.100
10.415	1.529
11.369	1.363
11.374	1.124
12.307	1.897
12.314	1.566
19.142	2.101
25.601	2.046
46.844	3.577
64.655	5.732
85.157	6.361
112.503	6.788
139.996	9.184]; 
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(38.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'KirkWill1988';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Male is able to fold his long canines backward';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6MJGG'; % Cat of Life
metaData.links.id_ITIS = '625054'; % ITIS
metaData.links.id_EoL = '308404'; % Ency of Life
metaData.links.id_Wiki = 'Hydropotes_inermis'; % Wikipedia
metaData.links.id_ADW = 'Hydropotes_inermis'; % ADW
metaData.links.id_Taxo = '67891'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200463'; % MSW3
metaData.links.id_AnAge = 'Hydropotes_inermis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydropotes_inermis}}';
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
bibkey = 'KirkWill1988'; type = 'article'; bib = [ ... 
'author = {J. K. Kirkwood and P. Williams and T. Moxey and H. Wallbank and S. G. Stadler and J. Howlett and J. Markham and C. Dean and E. Watts and J. Eva}, ' ... 
'year = {1988}, ' ...
'title = {Management and formula  intake of young hand-reared Chinese water deer \emph{Hydropotes_inermis} and their growth compared with mother-reared fawns}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {27}, ' ...
'pages = {308--316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hydropotes_inermis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Hydropotes_inermis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/308404/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


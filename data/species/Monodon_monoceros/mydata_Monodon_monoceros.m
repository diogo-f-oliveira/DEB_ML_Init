function [data, auxData, metaData, txtData, weights] = mydata_Monodon_monoceros

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Monodontidae';
metaData.species    = 'Monodon_monoceros'; 
metaData.species_en = 'Narwhal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2017 01 03];              
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

data.tg = 450;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Body temp from HeidNiel2014';
data.tx = 608;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 6.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'GardHeid2007';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 9*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'GardHeid2007';
  temp.tpm = C2K(35.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 115*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'GardHeid2007';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for female, males live shorter';
  
data.Wwb = 80e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwi = 904e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'GardHeid2007';
data.Wwim = 1645e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'GardHeid2007';
  
data.Ri  = 1/2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf each 2.5 yr';
  
% uni-variate data
% time-weight
data.tW_f = [ % time since birth (yr), wet weight (kg)
0.384	223.670
0.402	176.358
2.190	425.885
2.406	477.506
8.776	464.831
16.185	809.182
18.984	886.702
32.493	706.541
35.970	857.203
38.125	771.259
41.419	788.581
44.420	952.130
53.400	896.538
71.789	897.197
76.874	1155.444
87.148	807.425
114.394	1066.466]; 
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(35.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GardHeid2007';
comment.tW_f = 'Data for females; age estimated from aspartic acid racemization';
% 
data.tW_m = [ ... % time since birth (yr), wet weight (kg)
0.481	133.919
0.494	245.445
1.428	260.489
2.380	431.669
5.417	499.148
6.549	216.831
8.229	640.935
9.878	789.940
9.888	879.162
13.846	850.158
21.522	740.060
25.096	1417.305
30.468	1522.392
35.390	1768.660
35.831	1553.129
36.964	1285.681
37.251	1746.701
37.461	1545.997
38.177	1694.829
38.397	1583.345
39.564	1598.432
40.269	1650.608
47.726	1651.994
53.100	1779.387
57.043	1623.986
58.176	1349.103
58.213	1668.813
62.399	1595.242
68.218	1544.279
69.869	1715.589
84.289	1487.786]; 
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(35.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GardHeid2007';
comment.tW_m = 'Data for males; age estimated from aspartic acid racemization';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '446SX'; % Cat of Life
metaData.links.id_ITIS = '180485'; % ITIS
metaData.links.id_EoL = '46559339'; % Ency of Life
metaData.links.id_Wiki = 'Monodon_monoceros'; % Wikipedia
metaData.links.id_ADW = 'Monodon_monoceros'; % ADW
metaData.links.id_Taxo = '68813'; % Taxonomicon
metaData.links.id_WoRMS = '137116'; % WoRMS
metaData.links.id_MSW3 = '14300107'; % MSW3
metaData.links.id_AnAge = 'Monodon_monoceros'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monodon_monoceros}}';
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
bibkey = 'GardHeid2007'; type = 'Article'; bib = [ ... 
'author = {Garde, E. and Heide-Jorgensen, M. P. and Hansen, S. H. and Nachman, G. and Forchhammer, M. C.}, ' ... 
'year = {2007}, ' ...
'title = {AGE-SPECIFIC GROWTH AND REMARKABLE LONGEVITY IN NARWHALS (\emph{Monodon monoceros}) FROM {W}EST {G}REENLAND AS ESTIMATED BY ASPARTIC ACID RACEMIZATION}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {88}, ' ...
'pages = {49-58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeidNiel2014'; type = 'Article'; bib = [ ... 
'author = {Heide-Jorgensen, M. P. and Nielsen, N. H. and Hansen, R. G. and Blackwell, S. B.}, ' ... 
'year = {2014}, ' ...
'title = {Stomach temperature of narwhals (\emph{Monodon monoceros}) during feeding events}, ' ...
'journal = {Animal Biotelemetry}, ' ...
'volume = {2}, ' ...
'pages = {9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Monodon_monoceros}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Monodon_monoceros/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Ursus_thibetanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Ursus_thibetanus'; 
metaData.species_en = 'Asiatic black bear'; 

metaData.ecoCode.climate = {'Aw', 'BSh', 'Cwa', 'Cfa', 'Dwa', 'Dwb', 'Dfa'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 30]; 

%% set data
% zero-variate data

data.tg = 228;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 99;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2-4 yrs';
data.am = 39.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 463;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 100e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'for U. t. japonicus females';
data.Wwim = 120e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = 'for U. t. japonicus males';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2 pups each yr';
 
% uni-variate data
% time-weight
data.tW_1 = [ ... % time since birth (d), body weight (g)
20.570	904.091
32.366	1297.393
36.036	1431.090
39.461	1086.067
44.298	1580.841
66.693	2814.661
70.510	2508.907
74.574	2626.939
74.849	2273.822];
units.tW_1 = {'d', 'g'};  label.tW_1 = {'time since birth', 'wet weight', 'single cubs'};  
temp.tW_1  = C2K(37.5);  units.temp.tW_1 = 'K'; label.temp.tW_1 = 'temperature';
bibkey.tW_1 = 'RuriNori2009';
comment.tW_1 = 'Data for single cubs';
%
data.tW_2 = [ ... % time since birth (d), body weight (g)
28.844	732.095
29.103	834.133
33.696	834.493
33.825	897.284
35.263	1030.805
35.921	1007.314
52.837	1338.238
52.841	1228.372
57.560	1385.693
57.688	1464.179
59.916	1558.524
60.048	1534.992
82.743	1756.504
83.010	1630.964
87.720	2023.711
88.110	2125.759
89.820	2000.333
90.210	2094.534];
units.tW_2 = {'d', 'g'};  label.tW_2 = {'time since birth', 'wet weight', 'twin cubs'};  
temp.tW_2  = C2K(37.5);  units.temp.tW_2 = 'K'; label.temp.tW_2 = 'temperature';
bibkey.tW_2 = 'RuriNori2009';
comment.tW_2 = 'Data for twin cubs';

  
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
set1 = {'tW_1','tW_2'}; subtitle1 = {'Data for 1 and 2 cubs litters'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7F2JC'; % Cat of Life
metaData.links.id_ITIS = '621850'; % ITIS
metaData.links.id_EoL = '328069'; % Ency of Life
metaData.links.id_Wiki = 'Ursus_thibetanus'; % Wikipedia
metaData.links.id_ADW = 'Ursus_thibetanus'; % ADW
metaData.links.id_Taxo = '170195'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000988'; % MSW3
metaData.links.id_AnAge = 'Ursus_thibetanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ursus_thibetanus}}';
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
bibkey = 'RuriNori2009'; type = 'article'; bib = [ ... 
'author = {Ruriko, Iibuchi and Noriko, Nakano and Tadashi Nakamura and Tadasu Urashima and Michito Shimozuru and Tetsuma Murase and Toshio Tsubota}, ' ... 
'year = {2009}, ' ...
'title = {Change in body weight of mothers and neonates and in milk composition during denning period in captive {J}apanese black bears(\emph{Ursus thibetanus japonicus})}, ' ...
'journal = {Japanese Journal of Veterinary Research, 57(1): 13-22}, ' ...
'valume = {57(1)}, ' ...
'pages = {13-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ursus_thibetanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


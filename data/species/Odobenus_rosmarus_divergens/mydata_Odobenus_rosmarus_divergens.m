function [data, auxData, metaData, txtData, weights] = mydata_Odobenus_rosmarus_divergens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Odobenidae';
metaData.species    = 'Odobenus_rosmarus_divergens'; 
metaData.species_en = 'Pacific walrus'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MN', 'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, MeleRodr2015 table 1
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 08 06];              
metaData.email       = {'sta@akvaplan.niva.no'};            
metaData.address     = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 15*30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'AnAge says 331 days';
data.tx = 13*30.5;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'KastKlas2003';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '12 to 36 months AWD';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'ADW';
  temp.tp = C2K(36.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'females, 5 to 7 years AWD';
data.tpm = 7*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty';           bibkey.tpm = 'ADW';
  temp.tpm = C2K(36.2);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = 'males, 7 to 10 years AWD';
data.am = 40 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
comment.am = 'In the wild, walrus have been estimated to live over 40 years';

data.Wwbm = 56e3;   units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for males';     bibkey.Wwbm = 'KastKlas2003';
data.Wwx = 250e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'KastKlas2003';
data.Wwi = 850e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';
data.Wwim = 2000e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Wiki';

data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(36.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'Walruses breed once every 2 to 3 years.';

% uni-variate data
% time-weight
data.tW_m = [ ... time since birth (d), weight (kg)
2.828	56.213
13.278	74.225
26.246	82.500
31.895	89.259
42.465	91.533
53.816	98.306
61.139	99.073
65.963	107.328
75.638	120.092
81.316	123.104
84.585	121.613
87.797	127.616
92.661	130.626
110.503	140.412
116.961	147.922
121.819	151.681
132.401	152.456
142.977	153.981
151.883	160.748
160.010	163.016
164.014	172.019
172.152	172.788
176.981	180.294
185.968	176.569
195.713	180.340
203.845	181.859
212.764	187.127
220.896	188.646
226.608	187.161
229.837	190.916
234.707	193.176
240.385	196.188
244.457	196.198
261.485	205.982
268.849	201.504
278.547	211.270
289.100	215.792
299.601	227.059
319.136	228.606
332.906	238.382
346.717	242.913
359.719	246.692
371.963	242.975
384.954	248.253
392.215	257.263
404.402	261.040
404.482	250.549
410.269	239.322
424.011	252.845
428.100	250.607
438.613	260.375
441.882	258.884
451.597	266.402
456.484	266.414
467.031	271.686
480.022	276.964
484.094	276.974
492.995	284.490
501.167	280.763
512.546	283.789
522.250	292.805
533.669	290.585
547.514	290.619
558.113	289.147
570.340	287.678
577.613	295.190
589.829	295.220
593.855	301.225];
data.tW_m(:,2) = data.tW_m(:,2)*1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight'};  
temp.tW_m    = C2K(36.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'KastKlas2003'; 
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m =  50 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only.';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'This species is subdivided into three subspecies:the Atlantic walrus (O. r. rosmarus) which lives in the Atlantic Ocean, the Pacific walrus (O. r. divergens) which lives in the Pacific Ocean, and O. r. laptevi, which lives in the Laptev Sea of the Arctic Ocean.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Sexual dimorphism: males larger';
metaData.bibkey.F2 = 'ADW';
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7KG7B'; % Cat of Life
metaData.links.id_ITIS = '622045'; % ITIS
metaData.links.id_EoL = '46559147'; % Ency of Life
metaData.links.id_Wiki = 'Odobenus_rosmarus_divergens'; % Wikipedia
metaData.links.id_ADW = 'Odobenus_rosmarus'; % ADW
metaData.links.id_Taxo = '67369'; % Taxonomicon
metaData.links.id_WoRMS = '255011'; % WoRMS
metaData.links.id_MSW3 = '14001024'; % MSW3
metaData.links.id_AnAge = 'Odobenus_rosmarus_divergens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Walrus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Odobenus_rosmarus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Odobenus_rosmarus/}}';
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
bibkey = 'KastKlas2003'; type = 'Article'; bib = [ ... 
'author = {R. A. Kastelein and W. J. C. Klasen and J. Postma and H. Boer and P. R. Wiepkema}, ' ... 
'year = {2003}, ' ...
'title = {Food consumption, growth and food passage times in {P}acific walrus \emph{Odobenus rosmarus divergens} pups ar {H}arderwijk {M}arine {M}ammal {P}ark}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {38}, ' ...
'pages = {192--203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 

 


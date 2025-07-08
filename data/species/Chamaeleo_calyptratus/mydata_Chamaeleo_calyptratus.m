function [data, auxData, metaData, txtData, weights] = mydata_Chamaeleo_calyptratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Chamaeleonidae';
metaData.species    = 'Chamaeleo_calyptratus'; 
metaData.species_en = 'Veiled chameleon'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 07];

%% set data
% zero-variate data

data.ab = 220;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*30.5;   units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Lee2023';
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1;units.Wwb = 'g';  label.Wwb = 'wet at birth';                bibkey.Wwb = 'Lee2023';
data.Wwi = 180;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
data.Wwim = 220;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Lee2023';
  comment.Wwim = 'based on tW data';
  
data.Ri  = 3*60/365;    units.Ri  = '#/d'; label.Ri  = 'max reprduction rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '35-85 eggs per clutch; 3 clutch per season';

% univariate data
% time-length
data.tW = [ ... % time since birth (d), weight (g)
5.246	2.565
12.588	4.703
24.129	11.544
30.639	18.812
36.521	27.791
42.191	34.632
49.540	42.755
54.581	50.024
61.096	61.995
67.406	78.242
73.089	96.200
79.188	111.591
85.918	128.694
91.594	140.238
97.894	148.361
103.979	151.354
110.063	153.492
116.149	157.340
122.446	162.898
128.528	162.898
133.773	165.463];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(26);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'McCaLigo2014'; comment.tW = 'Data for males';

% time-weight
data.tW1 = [ ... % time since birth (d), weight (g)
  0.000   1.485
 15.466	  3.464
 31.448	  5.938
 47.945	 15.835
 59.802	 25.732
 70.113	 34.639
 81.455	 44.041
 93.312	 55.423
104.654	 64.825
111.871	 72.742
122.698	 85.113
139.195	 92.536
150.537	102.928
160.847	112.825
170.127	124.701
182.500	140.536
197.966	143.505
214.979	161.320
230.445	166.268
239.209	172.701
249.520	177.649
257.768	182.598
271.172	184.577
286.123	187.546
303.651	190.021
326.850	192.990
349.018	199.918
367.062	200.412
380.982	207.835
396.963	201.897
411.398	213.773
427.895	210.309];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'weight'};  
temp.tW1   = C2K(26);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Lee2023'; comment.tW1 = 'Data for a male; temp guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'TK53'; % Cat of Life
metaData.links.id_ITIS = '690738'; % ITIS
metaData.links.id_EoL = '791826'; % Ency of Life
metaData.links.id_Wiki = 'Chamaeleo_calyptratus'; % Wikipedia
metaData.links.id_ADW = 'Chamaeleo_calyptratus'; % ADW
metaData.links.id_Taxo = '641126'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chamaeleo&species=calyptratus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chamaeleo_calyptratus}}';
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
bibkey = 'McCaLigo2014'; type = 'Article'; bib = [ ... 
'author = {Kristen L. McCartney and Russell A. Ligon and Michael W. Butler and Dale F. DeNardo and Kevin J McGraw}, ' ... 
'year = {2014}, ' ...
'title = {The effect of carotenoid supplementation on immune system development in juvenile male veiled chameleons (\emph{Chamaeleo calyptratus})}, ' ...
'journal = {Frontiers in Zoology}, ' ...
'volume = {11(26)}, ' ...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Chamaeleo_calyptratus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lee2023'; type = 'Misc'; bib = [ ...
'author = {Robin Lee}, ' ... 
'year = {2023}, ' ...
'title = {Veiled Chameleon Growth Chart And Developmental Stages}, ' ...
'howpublished = {\url{https://thepetenthusiast.com/veiled-chameleon-growth-chart/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

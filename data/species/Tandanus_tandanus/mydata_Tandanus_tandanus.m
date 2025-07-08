  function [data, auxData, metaData, txtData, weights] = mydata_Tandanus_tandanus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Plotosidae';
metaData.species    = 'Tandanus_tandanus'; 
metaData.species_en = 'Australian freshwater catfish '; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 05];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'fishbase';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 45;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 90;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.01;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Davi1977a';
  comment.Wwb = 'based on egg diameter of 2.28-3.05 mm: pi/6*0.27^3';
data.Wwp = 675;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Davi1977a';
data.Wwi = 6.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.07, see F1';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.5	18.024
2.5	24.901
3.5	37.233
4.5	45.415
5.5	49.684
6.5	51.344
7.5	52.767
8.5	56.443];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Davi1977';
comment.tL = 'Data form Gwydir River, Australia';

% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
1	0.939
1.5	47.386
2	97.589
2.5	155.521
3	374.176
3.5	604.373
4	914.954
4.5	1168.180
5	1325.536
5.5	1636.116
6	1632.822
6.5	1855.378
7	1905.667
7.5	1974.969
8	2247.323
8.5	2190.388];
data.tW(:,1) = (data.tW(:,1)+0)*365; % convert yr to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Davi1977';
comment.tW = 'Data form Gwydir River, Australia';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.945	0.149
5.528	1.760
7.307	3.203
7.373	2.269
10.663	10.048
12.203	15.533
14.220	23.157
15.842	37.121
18.460	52.406
19.484	75.340
21.902	104.449
23.964	114.371
26.457	161.465
28.689	219.825
30.554	263.572
33.733	385.857
35.285	488.535
40.384	677.292
44.586	1028.177
48.347	1374.625
53.377	1837.808
57.360	2203.549];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Davi1977';
comment.LW = 'Data form Gwydir River, Australia';

% weight-fecundity
data.WN = [ ... % weught (g), fecundity (#)
837.812	7509.210
882.764	6412.070
913.256	7302.285
942.120	7082.610
958.338	7382.518
978.464	7160.653
1107.706	7059.577
1134.457	7543.989
1148.499	11176.411
1170.033	7798.074
1184.577	11394.032
1213.665	10960.094
1265.017	10659.518
1269.250	10958.612
1285.923	13301.325
1317.403	13045.103
1346.288	9944.890
1359.565	11420.862
1360.088	10308.979
1368.124	13446.912
1393.689	9539.399
1476.450	12034.641
1507.096	12440.362
1545.212	9885.865
1545.614	9224.832
1604.553	10447.442
1688.306	12891.787
1865.656	12923.623
1898.937	11440.967
2220.687	19136.970];
units.WN = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Davi1977a';
comment.WN = 'Data form Gwydir River, Australia';   

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.tW = weights.tW * 5;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 3;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54NYK'; % Cat of Life
metaData.links.id_ITIS = '640215'; % ITIS
metaData.links.id_EoL = '205837'; % Ency of Life
metaData.links.id_Wiki = 'Tandanus_tandanus'; % Wikipedia
metaData.links.id_ADW = 'Tandanus_tandanus'; % ADW
metaData.links.id_Taxo = '188807'; % Taxonomicon
metaData.links.id_WoRMS = '1022552'; % WoRMS
metaData.links.id_fishbase = 'Tandanus-tandanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Tandanus_tandanus}}';  
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
bibkey = 'Davi1977'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF9770119}, ' ...
'author = {Davis, T.L.O.}, ' ...
'year = {1977}, ' ...
'title = {Age determination and growth of the freshwater catfish, \emph{Tandanus tandanus} {M}itchell, in the {G}wydir {R}iver, {A}ustralia}, ' ... 
'journal = {Marine and Freshwater Research}, ' ...
'volume = {28(2)}, '...
'pages = {119-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Davi1977a'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF9770119}, ' ...
'author = {Davis, T.L.O.}, ' ...
'year = {1977}, ' ...
'title = {Reproductive biology of the freshwater catfish, \emph{Tandanus tandanus} {M}itchell, in the {G}wydir {R}iver, {A}ustralia. II. Gonadal cycle and fecundity}, ' ... 
'journal = {Australian Journal of Marine and Freshwater Research}, ' ...
'volume = {28(2)}, '...
'pages = {159-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tandanus-tandanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


function [data, auxData, metaData, txtData, weights] = mydata_Rudarius_ercodes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Monacanthidae';
metaData.species    = 'Rudarius_ercodes'; 
metaData.species_en = 'Whitespotted pygmy filefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 26];

%% set data
% zero-variate data

data.am = 9 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MillStew2010';   
  temp.am = C2K(17.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 3.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'IshiTana1983'; 
data.Li  = 7.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.7e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.57 mm of Stephanolepis_hispidus: pi/6*0.057^3';
data.Wwp = 0.66;  units.Wwp = 'g';   label.Wwp = 'wet weight at birth';    bibkey.Wwp = {'fishbase','IshiTana1983'};
  comment.Wwp = 'based on 0.01820*Lp^2.87, see F1';
data.Wwi = 5.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01820*Li^2.87, see F1; max published weight 3.5 kg';

data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'IshiTana1983';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
27.239	3.787
34.049	4.029
66.735	3.961
92.612	3.761
93.974	4.179
119.851	4.200
156.623	3.911
179.776	3.778
181.138	3.954
185.224	4.284
211.101	4.128
245.149	4.126
272.388	4.147
273.388	4.587
275.112	4.719
303.713	4.409
306.437	4.915
336.399	5.310
359.552	5.573
394.963	5.461
423.563	5.327
453.526	5.567];
data.tL(:,1) = data.tL(:,1) + 450; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IshiTana1983'; 
comment.tL = 'temperature varies, see D2';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
1.925	0.124
2.100	0.184
2.217	0.182
2.239	0.228
2.267	0.209
2.419	0.275
2.468	0.265
2.490	0.308
2.510	0.209
2.543	0.326
2.611	0.304
2.627	0.296
2.651	0.342
2.701	0.308
2.844	0.411
2.864	0.417
2.905	0.440
2.923	0.422
2.997	0.578
3.016	0.563
3.075	0.518
3.096	0.518
3.144	0.598
3.163	0.566
3.203	0.525
3.208	0.594
3.280	0.663
3.300	0.632
3.323	0.649
3.349	0.695
3.355	0.791
3.365	0.602
3.420	0.724
3.446	0.760
3.446	0.765
3.487	0.667
3.497	0.836
3.545	0.836
3.571	0.865
3.575	0.926
3.606	1.076
3.667	0.825
3.672	0.901
3.699	0.939
3.703	1.019
3.750	0.945
3.754	1.026
3.811	1.136
3.825	0.920
3.832	1.047
3.880	0.965
3.893	1.225
3.983	1.453
3.998	1.176
4.050	1.113
4.117	1.385
4.133	1.106
4.150	1.504
4.169	1.276
4.177	1.453
4.229	1.339
4.298	1.632
4.333	1.771
4.339	1.976
4.341	1.250
4.349	1.433
4.358	1.643
4.383	1.535
4.479	1.666
4.499	1.414
4.551	2.003
4.577	1.845
4.580	1.922
4.678	2.044
4.680	2.115
4.683	2.219
4.686	2.312
4.853	2.509
4.947	2.280
4.976	2.130
4.989	2.578
5.013	2.234
5.087	2.408
5.134	2.857
5.155	2.359
5.185	2.204
5.254	3.482
5.346	2.799
5.355	3.165
5.376	2.596
5.520	2.458
5.548	3.530
5.611	2.976
5.687	2.976
5.711	2.458
5.714	4.158
5.775	3.388
5.781	3.628
5.836	2.686
5.900	3.628
5.932	3.274
5.945	3.831
5.989	4.019
6.027	3.857
6.119	4.332
6.124	4.607
6.213	4.899
6.249	4.575
6.324	4.046
6.400	5.850
6.417	4.362
6.434	5.245
6.484	5.615
6.742	4.966
6.898	5.931
6.956	6.660];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'IshiTana1983'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
D2 = 'temperature (C) for tL data  is assumed to vary as T(t)=15+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01820*(TL in cm)^2.87';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'adults live in Zostera beds';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6WY2J'; % Cat of Life
metaData.links.id_ITIS = '646242'; % ITIS
metaData.links.id_EoL = '46570876'; % Ency of Life
metaData.links.id_Wiki = 'Rudarius_ercodes'; % Wikipedia
metaData.links.id_ADW = 'Rudarius_ercodes'; % ADW
metaData.links.id_Taxo = '186322'; % Taxonomicon
metaData.links.id_WoRMS = '282633'; % WoRMS
metaData.links.id_fishbase = 'Rudarius-ercodes'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rudarius_ercodes}}';
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
bibkey = 'IshiTana1983'; type = 'Article'; bib = [ ... 
'author = {Yukimasa Ishida and Syoiti Tanaka}, ' ... 
'year = {1983}, ' ...
'title = {Growth and Maturation of the Small Filefish \emph{Rudarius ercodes} in {O}dawa {B}ay}, ' ...
'journal = {Bulletin of the Japanese Society of Scientific Fisheries}, ' ...
'volume = {49(4)}, ' ...
'pages = {547-553}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttp://www.fishbase.se/summary/Rudarius-ercodes.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

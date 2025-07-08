function [data, auxData, metaData, txtData, weights] = mydata_Trichiurus_lepturus_japonicus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Trichiuridae';
metaData.species    = 'Trichiurus_lepturus_japonicus'; 
metaData.species_en = 'Largehead hairtail'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'GSI'};
metaData.data_1     = {'t-L', 't-Ww', 'L-Ww', 'Ww-N'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Jeffrey Ren'};                            
metaData.date_subm = [2021 08 05];
metaData.email    = {'ren9878@163.com'};
metaData.email    = {'jeffrey.ren@niwa.co.nz'};
metaData.address  = {'National Institute of Water and Atmospheric Research, PO Box 8602, Christchurch 8440, New Zealand'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 08 11];


%% set data
% zero-variate data;

data.ab = 79/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'WanMeng2003';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.tp = 6*30.5;      units.tp = 'd';      label.tp = 'time since birth at puberty';  bibkey.tp = 'LuoLu1983';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';  
data.am = 365*15;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.5;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ChaiZhu2015';
data.Lp  = 12;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LuoLu1983';
  comment.Lp = 'Maturation occurs in March-June with 20-50g. 13-14cm in June';
data.Li  = 89.6;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ShiZhan2020';  %58.5*110%= 64.4
 
data.Wwb = 4.25e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'LuoLu1983';
  comment.Wwb = 'based on egg diameter of 755.6-1111.1 mum, mean=0.0933cm: (pi/6)*0.0933^3=0.000425';
data.Wwp = 80;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'LuoLu1983';
data.Wwi = 5000;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 4.35e5/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Li1983';   
 temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.GSI  = 0.041; units.GSI  = '-'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'KwokNi1999';   
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% t-L data
data.tL = [ ... % time (yr), length (cm)
1	18.779
2	27.977
3	35.027
4	40.228
5	43.989
6   46.8
1	19.5
2	29.1
3	34.2
4	41.7
5	45.6
];   % cm, body length at f and T
  data.tL(:,1) = data.tL(:,1) * 365; % conver age in year to day
  units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'length'}; 
  temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  bibkey.tL = {'WuChen1985','Hong1980'};

% t-W data
data.tW = [ ... % time (year), wet weight (g)
1	133.8
2	357.7
3	629.3
4	902.3
5	1149.9
6   1361.3
1	150
2	401
3	640
4	865
];  % g, wet weight at f and T
  data.tW(:,1) = data.tW(:,1) * 365; % conver age in year to day
  units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
  temp.tW    = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
  bibkey.tW = {'WuChen1985','Hong1980'};

% L-W data
data.LW = [ ... % length (cm), wet weight (g)
10	11	12	13	14.2	15	16.1	17.6	18.2	19.8	20.3	21.7	22.3	24	25	26.1	28	29	30	30.7	31.7	34	35	37.3	38	38.3	40	41	42	43	44	45	46	46.5	48	51; % length (cm)
20	22	25	30	57	59	60	63	90	110	120	140	175	181	235	240	290	330	359	390	430	510	580	630	750	760	780	900	950	1080	1080	1095	1270	1230	1480	1725]'; % g, wet weight at f and T
  units.LW   = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
  bibkey.LW = 'WuChen1985';

% weight - fecundity
data.WN = [ ... % wet weight (g), yearly fecundity - number of egg (x 1e4 eggs) per spawn per year (spawning once a year)
50	75	100	100	100	125	125	125	125	175	175	175	175	175	225	225	225	225	225	275	275	275	275	275	275	325	325	325	325	325	325	375	375	375	375	425	425	425	425	425	425	425	475	475	475	475	475	475	525	525	525	525	575	575	575	575	575	625	625	625	625	625	625	675	675	675	675	675	725	725	725	725	725	775	775	775	775	825	825	825	825	875	875	875	875	875	925	925	925	925	925	975	975	975	1025	1075	1125	1175	1225; % weight (g)
0.6	1.2	1.1	0.8	1.2	1.5	2.2	2	2.6	2	3.2	2.9	6.1	2.4	2.8	4	4.8	4.3	6.9	4.8	6.6	5.6	5.3	6.5	7.9	7.2	5.7	7.3	5.6	7.5	9.3	9.6	8.4	9.3	8.3	10.7	8.2	9.3	9.1	8.8	8.8	8.4	17.4	11.9	8.6	7.3	15.3	11.9	9.7	10.8	12.2	11.6	13.1	16.3	16.8	15.2	15.5	12.9	13.1	21.4	16.5	18.5	17.3	15	14.8	18.4	18.1	20.1	14.9	17	19.7	14.2	18.9	13.8	36.2	23.3	18.5	18.1	15.1	22	26.6	30.2	28.7	23.4	28.3	21.8	21.6	32.7	24.7	29.7	23.6	22.8	23.8	27.5	18.6	21.8	32.9	40.3	43.6]'; % e4 eggs
data.WN(:,2) = 1e4 * data.WN(:,2); % convert 1e4 eggs to eggs
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Li1983'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 0.5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '589FX'; % Cat of Life
metaData.links.id_ITIS = '768168'; % ITIS
metaData.links.id_EoL = '46577378'; % Ency of Life
metaData.links.id_Wiki = 'Trichiurus_lepturus'; % Wikipedia
metaData.links.id_ADW = 'Trichiurus_lepturus'; % ADW
metaData.links.id_Taxo = '618556'; % Taxonomicon
metaData.links.id_WoRMS = '127089'; % WoRMS
metaData.links.id_fishbase = 'Trichiurus-lepturus'; % fishbase

%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Trichiurus-lepturus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WanMeng2003'; type = 'Article'; bib = [ ... 
'author = {Wan, R. and Meng, Z.}, ' ... 
'year = {2003}, ' ...
'title = {The artificial insemination and hatching of \emph{Trichiurus japonicus}}, ' ...
'journal = {Journal of Fisheries of China}, ' ...
'volume = {27}, ' ...
'pages = {188-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LuoLu1983'; type = 'Article'; bib = [ ... 
'author = {Luo, B. and Lu, J. and Huang, S.}, ' ... 
'year = {1983}, ' ...
'title = {maturation of the hairtails, \emph{Trichiurus japonicus} {H}aumela ({P}isces, {T}richiuridae): {I}. {T}he process of maturation and peculiarities}, ' ...
'journal = {Oceanologia et Liminologia Sinica}, ' ...
'volume = {14}, ' ...
'pages = {55-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChaiZhu2015'; type = 'Article'; bib = [ ... 
'author = {Chai, X. and Zhu, Y. and Wang, Y. and Hu, Z.}, ' ... 
'year = {2015}, ' ...
'title = {Study on the embryonic development of \emph{Trichiurus japonicus} in the {E}ast {C}hina {S}ea}, ' ...
'journal = {Journal of Zhejiang Ocean University (Natural Science)}, ' ...
'volume = {34}, ' ...
'pages = {429-432}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KwokNi1999'; type = 'Article'; bib = [ ... 
'author = {Kwok, K.Y. and Ni, I.H.}, ' ... 
'year = {1999}, ' ...
'title = {reproduction of cutlassfishes \emph{Trichiurus japonicus} in the {S}outh {C}hina {S}ea}, ' ...
'journal = {Marine Fisheries}, ' ...
'volume = {176}, ' ...
'pages = {39-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Li1983'; type = 'Article'; bib = [ ... 
'author = {Li C.}, ' ... 
'year = {1983}, ' ...
'title = {A study of the individual fecundity and its dynamics of \emph{Trichiurus japonicus} ({F}orskal) of the {E}ast {C}hina {S}ea}, ' ...
'journal = {PLoS ONE }, ' ...
'volume = {14}, ' ...
'pages = {220--238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShiZhan2020'; type = 'Article'; bib = [ ... 
'author = {Shi, D. and Zhang, K. and Cai, Y. and Geng, P. and Xu, Y. and Sun, M. and Chen, Z.}, ' ... 
'year = {2020}, ' ...
'title = {Population structure of \emph{Trichiurus japonicus} in northern {C}hina {S}ea and parameters and its growth, mortality and maturatty}, ' ...
'journal = {South China Fisheries Science}, ' ...
'volume = {16}, ' ...
'pages = {51--59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WuChen1985'; type = 'Article'; bib = [ ... 
'author = {Wu, H. and Cheng, G. and Zhou, J. and Wang, J.}, ' ... 
'year = {1985}, ' ...
'title = {Study on the growth of the hairtails \emph{Trichiurus japonicus} in northern {C}hina {S}ea and parameters and its growth, mortality and maturaty}, ' ...
'journal = {South China Fisheries Science}, ' ...
'volume = {16}, ' ...
'pages = {51--59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hong1980'; type = 'Article'; bib = [ ... 
'author = {Hong, S.}, ' ... 
'year = {1980}, ' ...
'title = {A study on the age and growth of the hairtails in northern in {P}o {H}ai and {H}uang {H}ai}, ' ...
'journal = {Journal of Fisheries of china}, ' ...
'volume = {4}, ' ...
'pages = {362--370}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Li1983'; type = 'Article'; bib = [ ... 
'author = {Li, C.}, ' ... 
'year = {1983}, ' ...
'title = {A study on the individual fecundity and its dynamics of \emph{Trichiurus japonicus} {F}orskal) in the {E}ast {C}hina {S}ea}, ' ...
'journal = {Journal of Fisheries of China}, ' ...
'volume = {3}, ' ...
'pages = {220--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


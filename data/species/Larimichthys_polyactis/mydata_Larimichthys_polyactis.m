function [data, auxData, metaData, txtData, weights] = mydata_Larimichthys_polyactis 

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Larimichthys_polyactis'; 
metaData.species_en = 'small yellow croaker'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'GSI'};
metaData.data_1     = {'t-L', 't-Ww', 'L-Ww', 'Ww-N'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Jeffrey Ren'};                            
metaData.date_subm = [2019 05 28];
metaData.email    = {'ren9878@163.com'};
metaData.email    = {'jeffrey.ren@niwa.co.nz'};
metaData.address  = {'National Institute of Water and Atmospheric Research, PO Box 8602, Christchurch 8440, New Zealand'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 05 29];


%% set data
% zero-variate data;

data.ab = 51/24+4;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ZhanLou2016';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.tp = 250;      units.tp = 'd';      label.tp = 'time since birth at puberty';          bibkey.tp = 'LimLe2010';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';  
data.am = 365*23;    units.am = 'd';    label.am = 'life span';                bibkey.am = {'MasuAmao1984','Fishbase'};   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.46;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ZhanLou2016';
data.Lp  = 7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'YanLiu2014';
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = {'MasuAmao1984','Fishbase'};   

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'JianZhan2018';
  comment.Wwb = 'based on egg diameter of 1.25 to 1.4 mm: pi/6*0.132^3';
data.Wwp = 0.0158*data.Lp^3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'LiShan2011','MaYan2017','YanLi2006'};
data.Wwi = 0.0158*data.Li^3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'LiShan2011','MaYan2017','YanLi2006'}; 

data.Ri  = 2.1e5/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Shui2000';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.GSI  = 0.12; units.GSI  = '-'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'LimLe2010';   
  temp.GSI = C2K(12); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  

% uni-variate data

% t-L data
data.tL = [ ... % time (yr), length (cm)
1	12
2	16.2
3	19.3
4	20.4
1	5.73
2	13.44
3	18.35
4	21.49
1	7.41
2	14.53
3	16.86
4	18.38];   % cm, body length at f and T
  data.tL(:,1) = data.tL(:,1) * 365; % conver age in year to day
  units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'length'}; 
  temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  bibkey.tL = {'YanLi2006','LiShan2011','ZhanLi2010'};

% t-W data
data.tW = [ ... % time (year), wet weight (g)
1	27.3
2	67.17
3	113.59
4	134.14
1	2.97
2	38.33
3	97.66
4	156.71
1	6.43
2	48.49
3	75.76
4	98.08
];  % g, wet weight at f and T
  data.tW(:,1) = data.tW(:,1) * 365; % conver age in year to day
  units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
  temp.tW    = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
  bibkey.tW = {'YanLi2006','LiShan2011','ZhanLi2010'};

% L-W data
% Wet weights were back calculated from length-weight relationship: W=0.0158*L^3
data.LW = [ ... % length (cm), wet weight (g)
12	    27.3
16.2	67.17
19.3	113.59
20.4	134.14
5.73	2.97
13.44	38.33
18.35	97.66
21.49	156.71
7.41	6.43
14.53	48.49
16.86	75.76
18.38	98.08];   % g, wet weight at f and T
  units.LW   = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
  bibkey.LW = {'YanLi2006','LiShan2011','ZhanLi2010'};

% weight - fecundity
data.WN = [ ... % wet weight (g), yearly fecundity - number of egg (x 1e3 eggs) per spawn per year (spawning once a year)
12	    2.5
12.2	5
15	    3
16	    4.9
16.5	4.8
17.5	6
18	    3
19	    6.05
20	    4
21	    3.85
23.5	4.1
26	    12.5
27.5	10.7
28	    10.5
48	    23.5
49	    24
13.7	8
18.4	10
21.1	18
30.6	20
38.4	20
47.3	22.2
57.4	30
68.9	38
81.8	41
96.3	56
112.3	67.5
129.9	70
149.3	90
58	    20
59	    32
59	    33
78	    44
95	    51
155	    70
155	    80
160	    82
160	    75
163	    60
163	    62
165	   112
170    	72
171	    70
173	    68
24.3	9.8
31.3	14.6
39.4	19.1
48.8	24.0
59.6	31.3
71.9	35.9
85.8	44.5
101.3	52.1
118.6	65.0
137.8	70.5
159.0	77.5
182.3	94.6
207.6	98.7
235.3	135.5];
data.WN(:,2) = 1e3 * data.WN(:,2); % convert 1e3 eggs to eggs
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(13);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = {'YanLi2006','ZhanLi2010','Shui2000','LimLe2010'}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;
weights.Lb = 0 * weights.Lb;
weights.GSI = 0 * weights.GSI;
weights.Ri = 0 * weights.Ri;
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Lb is given zero weight, since strict isomorphy hardly applies in the very early stages; egg-based wet weight is more reliable for neonate size';
D2 = 'Ri is given zero weight, since Wwb and LN fitted well, while Ri was over-estimated. This suggests that Ri corresponds to some L less than maximum';
D3 = 'GSI is given zero weight, since Wwb and LN fitted well, while GSI = 365*Ri*Wwb/Wwi is 2 times the observed value. This suggests that eggs double their weight at spawning by absorbing water';
D4 = 'tp is given zero weight, because of inconsistency of (tp,Lp) with tL data and (tp,Wwp) with tW data after temperature correction';
metaData.discussion = struct('D1', D1,'D2', D2,'D3', D3,'D4', D4);

%% Links
metaData.links.id_CoL = '6NXNS'; % Cat of Life
metaData.links.id_ITIS = '646548'; % ITIS
metaData.links.id_EoL = '46579145'; % Ency of Life
metaData.links.id_Wiki = 'Larimichthys_polyactis'; % Wikipedia
metaData.links.id_ADW = 'Larimichthys_polyactis'; % ADW
metaData.links.id_Taxo = '178199'; % Taxonomicon
metaData.links.id_WoRMS = '281273'; % WoRMS
metaData.links.id_fishbase = 'Larimichthys-polyactis'; % fishbase


%% References
bibkey = 'Fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Larimichthys-polyactis}}';
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
bibkey = 'ZhanLou2016'; type = 'Article'; bib = [ ... 
'author = {Zhan, W. and Lou, B. and Chen, R.Y. and Mao, G.M. and Liu, F. and Xu, D. D. and Wang, L.G. and Ma, T. and Xu, Q.X.}, ' ... 
'year = {2016}, ' ...
'title = {Observation of embryonic, larva and juvenile development of small yellow croaker, \emph{Larimichthys polyactis}}, ' ...
'journal = {Oceanologia et Limnologia Sinica}, ' ...
'volume = {47}, ' ...
'pages = {1033--1039}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LimLe2010'; type = 'Article'; bib = [ ... 
'author = {Lim, K.Y. and Le, M.H. and An, C.M. and Kim, S.Y. and Park, M.S. and Chang, Y.J.}, ' ... 
'year = {2010}, ' ...
'title = {Reproductive cycle of yellow croaker (\emph{Larimichthys polyactis} in southern waters off {K}orea}, ' ...
'journal = {Japanese Society of Fisheries Science}, ' ...
'volume = {76}, ' ...
'pages = {971--980}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MasuAmao1984'; type = 'Book'; bib = [ ... 
'author = {Masuda, H. and Amaoka, K. and Araga, C. and Uyeno, T.}, ' ... 
'year = {1984}, ' ...
'title = {The fishes of the {J}apanese {A}rchipelago}, ' ...
'publisher = {Tokai University Press}, ' ...
'pages = {437 p.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiShan2011'; type = 'Article'; bib = [ ... 
'author = {Li, Z.L. and Shan, X.J. and Jin, X.S. and Dai, F.Q.}, ' ... 
'year = {2011}, ' ...
'title = {Long-term variations in body length and age at maturity of the small yellow croaker (\emph{Larimichthys polyactis} {B}leeker, 1877) in the {B}ohai {S}ea and the {Y}ellow {S}ea, {C}hina}, ' ...
'journal = {Marine Fisheries}, ' ...
'volume = {110}, ' ...
'pages = {67--74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaYan2017'; type = 'Article'; bib = [ ... 
'author = {Ma, Q.Y. and Yan, J. and Ren Y.P.}, ' ... 
'year = {2017}, ' ...
'title = {Linear mixed-effects models to describe length-weight relationships for yellow croaker (\emph{Larimichthys Polyactis}) along the north coast of {C}hina}, ' ...
'journal = {PLoS ONE }, ' ...
'volume = {12}, ' ...
'doi = {10.1371/journal.pone.0171811}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YanLi2006'; type = 'Article'; bib = [ ... 
'author = {Yan, L.P. and Li, J.S. and Shen, D.G. and Yu, L.F. and Ling, L.Y.}, ' ... 
'year = {2006}, ' ...
'title = {Variations in diet composition and feeding intensity of small yellow croaker \emph{Larimichthys polyactis} Bleeker in the southern {Y}ellow {S}ea and northern {E}ast {C}hina {S}ea}, ' ...
'journal = {Marine Fisheries}, ' ...
'volume = {28}, ' ...
'pages = {117-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YanLiu2014'; type = 'Article'; bib = [ ... 
'author = {Yan, L.P. and Liu, Z.L and Ling, J.S. and Yuan, X.W.}, ' ... 
'year = {2014}, ' ...
'title = {On the evolution of biological characteristics and resources of small yellow croaker}, ' ...
'journal = {Marine Fisheries}, ' ...
'volume = {36}, ' ...
'pages = {481--488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhanLi2010'; type = 'Article'; bib = [ ... 
'author = {Zhang, G.Z. and Li, X.S. and Jin, X.S. and Zhu, J.C. and Dai, F.Q.}, ' ... 
'year = {2010}, ' ...
'title = {Changes of biological characteristics of small yellow croaker (\emph{Larimichthys polyactis}) in the central and southern {Y}ellow {S}ea}, ' ...
'journal = {Acta Ecologica Sinica}, ' ...
'volume = {30}, ' ...
'pages = {6854--6861}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shui2000'; type = 'Article'; bib = [ ... 
'author = {Shui, B.}, ' ... 
'year = {2000}, ' ...
'title = {Study on the reproductive ability of \emph{Larimichthys polyactis} and its change}, ' ...
'journal = {Journal of Zejiang Ocean University}, ' ...
'volume = {19}, ' ...
'pages = {58--69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JianZhan2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00343-019-8105-1}, ' ... 
'author = {Jiang, Yiqian and Zhang, Chi and Ye, Zhenjiang and Tian, Yongjun}, ' ... 
'year = {2018}, ' ...
'title = {Analyses of egg size, otolith shape, and growth revealed two components of small yellow croaker in {H}aizhou {B}ay spawning stock*}, ' ...
'journal = {Journal of Oceanology and Limnology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

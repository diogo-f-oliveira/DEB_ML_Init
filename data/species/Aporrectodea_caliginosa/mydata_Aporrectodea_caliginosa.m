function [data, auxData, metaData, txtData, weights] = mydata_Aporrectodea_caliginosa

%% set metaData
metaData.phylum     = 'Annelida';
metaData.class      = 'Clitellata';
metaData.order      = 'Haplotaxida';
metaData.family     = 'Lumbricidae';
metaData.species    = 'Aporrectodea_caliginosa';
metaData.species_en = 'Grey worm';

metaData.ecoCode.climate = {'C'}; 
metaData.ecoCode.ecozone = {'THp'}; 
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'}; 
metaData.ecoCode.embryo  = {'Tt'}; 
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'}; 
metaData.ecoCode.gender  = {'Hh'}; 
metaData.ecoCode.reprod  = {'O'}; 

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'tp'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-Ww'; 't-N'; 'TP'; 't-Ww_f'; 't-N_f'};
metaData.COMPLETE = 4.0; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs', 'Kim Rakel', 'Dino Bussen', 'Yvan Capowiez', 'Vanessa Roeben'};
metaData.date_subm = [2022 08 31];
metaData.email    = {'andre.gergs@bayer.com'};
metaData.address  = {'Bayer AG, Monheim, Germany'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'};
metaData.date_acc    = [2022 09 15];


%% set data
% zero-variate data
data.tp = 91;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Bart2018';
    temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';  bibkey.am = 'Nair1998';
    temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 1.2;         units.Lb  = 'cm';  label.Lb  = 'length at birth';         bibkey.Lb  = 'SimsGera1999';
data.Li  = 8.5;         units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Bart2018';

data.Wwb = 30e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bost1987';
data.Wwp = 500e-3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Lofs1983';
data.Wwi = 2000e-3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Lofs1983';

% uni-variate data --------------------------------------------------------
% time-weight
data.tW11 = [ ... % time since birth (d), wet weight (mg)
0	10
14	21.06666667
28	46.43333333
42	90.63333333
56	195.4333333
70	391.6666667
84	536.8
98	835.6
112	1117.6
126	1123.8
140	1332.666667
154	1337.8
168	1778.666667
182	1577.333333
196	1632
210	1772.666667
224	1863.033333
238	2082.666667
252	2101.666667
266	2241.333333
280	2227.666667
294	2184
308	2208.666667
322	2316
336	2649.333333
350	2722.333333
364	2771.666667];
data.tW11(:,2) = data.tW11(:,2) / 1000; % convert to g
units.tW11 = {'d', 'g'};  label.tW11 = {'time since birth', 'wet weight'};
temp.tW11 = C2K(15);  units.temp.tW11 = 'K'; label.temp.tW11 = 'temperature';
bibkey.tW11 = 'Bart2019'; comment.tW11 ='nutrition: 3g horse dung - individual worms';
%
data.tW11b = [ ... % time since birth (d), wet weight (mg)
0	11.88333333
14	25.95
28	52.16666667
42	89.15
56	205.1666667
70	436.5833333
84	533.0666667
98	801.4666667
112	987.0166667
126	948.45
140	1024.516667
154	954.2333333
168	1066
182	1036
196	1099.333333
210	1027.5
224	1133.5
238	1145.166667
252	1125.333333
266	1149.333333
280	1232.383333
294	1125.833333
308	1235
322	1171.5
336	1287.333333
350	1325.833333
364	1426.083333];
data.tW11b(:,2) = data.tW11b(:,2) / 1000; % convert to g
units.tW11b = {'d', 'g'};  label.tW11b = {'time since birth', 'wet weight'};
temp.tW11b = C2K(15);  units.temp.tW11b = 'K'; label.temp.tW11b = 'temperature';
bibkey.tW11b = 'Bart2019'; comment.tW11b ='nutrition: 3g horse dung - worms grouped for reproduction';
% 
data.tW12 = [ ... % time since birth (d), wet weight (mg)
0	9.35
14	14.8
28	36.05
42	50.65
56	96.1
70	217.65
84	293.35
98	407.65
112	560
126	599.65
140	678.4
154	681
168	869
182	923.5
196	1002.5
210	1058.8
224	1162.5
238	1264.5
252	1353
266	1470.5
280	1537.5
294	1542
308	1527.35
322	1524
336	1723
350	1685
364	1613
378	1936
392	1646.5];
data.tW12(:,2) = data.tW12(:,2) / 1000; % convert mg to g
units.tW12 = {'d', 'g'};  label.tW12 = {'time since birth', 'wet weight'};
temp.tW12 = C2K(15);  units.temp.tW12 = 'K'; label.temp.tW12 = 'temperature';
bibkey.tW12 = 'Bart2019'; comment.tW12 ='nutrition: 1g horse dung - individual worms';
%
data.tW12b = [ ... % time since birth (d), wet weight (mg)
0	10.71666667
14	20.13333333
28	38.95
42	56.16666667
56	98.33333333
70	218.9666667
84	301.9
98	440.3333333
112	606.9333333
126	618.2166667
140	653.5166667
154	652.3666667
168	734.3333333
182	695.8333333
196	686.55
210	713.2666667
224	661.3833333
238	689.3333333
252	793.3333333
266	726.6666667
280	839.95
294	745.5
308	782
322	647.4166667
336	757.6666667
350	762.25
364	770.6666667
378	752.5
392	766.3333333];
data.tW12b(:,2) = data.tW12b(:,2) / 1000; % convert mg to g
units.tW12b = {'d', 'g'};  label.tW12b = {'time since birth', 'wet weight'};
temp.tW12b = C2K(15);  units.temp.tW12b = 'K'; label.temp.tW12b = 'temperature';
bibkey.tW12b = 'Bart2019'; comment.tW12b ='nutrition: 1g horse dung - worms grouped for reproduction';
%
data.tW13 = [ ... % time since birth (d), wet weight (mg)
    0	11.7
    14	28.8
    28	72.4
    42	118
    56	261
    70	320
    84	462
    98	549
    105	635];
data.tW13(:,2) = data.tW13(:,2) / 1000; % convert mg to g
units.tW13 = {'d', 'g'};  label.tW13 = {'time since birth', 'wet weight'};
temp.tW13 = C2K(15);  units.temp.tW13 = 'K'; label.temp.tW13 = 'temperature';
bibkey.tW13 = 'Bart2019'; comment.tW13 ='nutrition: 1.5g horse dung';

% time - cum # cocoons;  Bart et al. 2019 - 3g horse dung
data.tN2 = [ ... % time since birth (d), cumulative number of cocoons (#)
    0	0
    14	0
    28	0
    42	0
    56	0
    70	0
    84	0
    98	0
    112	3
    126	3
    140	12
    168	22
    196	32
    224	41
    252	52
    280	63
    308	73
    336	82
    364	90];
units.tN2 = {'d', '#'};  label.tN2 = {'time since birth', 'cumulative offspring'};
temp.tN2 = C2K(15);  units.temp.tN2 = 'K'; label.temp.tN2 = 'temperature';
bibkey.tN2 = 'Bart2019'; comment.tN2 ='assuming one hatchling per cocoon; nutrition: 3g horse dung';
% univar-data 15 (Bart et al. 2019 - 1g horse dung)
data.tN3 = [ ... % time since birth (d), cumulative number of cocoons (#)
    0	0
    14	0
    28	0
    42	0
    56	0
    70	0
    84	0
    98	0
    112	0
    126	0
    140	3
    168	9
    196	16
    224	24
    252	31
    280	39
    308	48
    336	54
    364	58
    378	62];
units.tN3 = {'d', '#'};  label.tN3 = {'time since birth', 'cumulative offspring'};
temp.tN3 = C2K(15);  units.temp.tN3 = 'K'; label.temp.tN3 = 'temperature';
bibkey.tN3 = 'Bart2019'; comment.tN3 ='assuming one hatchling per cocoon; nutrition: 1g horse dung';

% temperature - age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
    5   234
    10  199
    15  62 
    20  36];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};
bibkey.Tab = 'Holm1991';

% temperature - cast production
data.TP = [ ...      %  Temperature (C), cast production (g/d)
    2	0.6857
    2	0.1571
    2	0.5286
    2	0.5000
    2	0.4571
    2	0.4286
    2	0.4571
    2	0.3571
    7	0.8571
    7	0.6857
    7	0.6857
    7	1.0571
    7	0.7429
    7	1.0429
    7	0.7000
    7	0.3857
    12	1.1000
    12	0.7571
    12	0.8286
    12	0.9286
    12	0.8429
    12	0.7714
    12	0.6857
    12	0.5286
    17	0.6857
    17	2.0000
    17	1.9714
    17	1.2857
    17	1.8429
    17	1.6714
    17	1.5429
    17	1.0571
    22	1.7000
    22	1.9143
    22	1.5857
    22	0.9143
    22	0.8857
    22	1.3286
    22	1.2429
    22	1.0857
    27	0.7714
    27	1.0714
    27	1.1571
    27	1.0143
    27	0.5571
    27	0.6286
    27	0.7571
    27	0.6714
    32	0.1571
    32	0.1571
    32	0.0286
    32	0.0714
    32	0.1286
    32	0.2143
    32	0.0571
    32	0.0429];
units.TP   = {'C', 'g/d'};  label.TP = {'temperature', 'cast production'};
bibkey.TP = 'GergRake2022';

% OM content of soil - burrowed length
data.xf = [ ... % OM content (%), relative burrow rate (-): BURROWED LENGTH IN RELATION TO TOTAL BURROW LENGTH  
   %0 0 % not measured, only for plotting
   2	0.742372175
   4	1.010309278 %mean of both 4%OM Tests
   8	1];
units.xf  = {'%', '-'};  label.xf = {'soil organic matter', 'relative burrow rate'};
temp.xf   = C2K(20);  units.temp.xf = 'K'; label.temp.xf = 'temperature';
bibkey.xf = 'GergRake2022';
comment.xf = 'assumption: burrow length = ingestion rate per day; assumption: 1 percent soil organic matter content represents 18.62 kJ/g (Lavelle and Spain 2001); burrow length releative to maximum borrowing ';

% moisture - ingestion rate
data.xf_m = [ ... moisture (%), ingestion rate (cm/d) originally BURROWED LENGTH (cm/d)
    10	0.41
    15  1.83
    20  4.73
    25	5.4];
    %0 0 % not measured, only for plotting
units.xf_m  = {'%', 'cm/d'};  label.xf_m = {'moisture', 'burrow rate'};  
temp.xf_m   = C2K(20);  units.temp.xf_m = 'K'; label.temp.xf_m = 'temperature';
bibkey.xf_m = 'GergRake2022';


% soil matric potential - diapause
data.m_diap = [ ... moisture (%), diapausing worms (%) 
    6.7	    100
    9.0	    90
    10.9	30
    13.1	0
    15.9	0
    19.9	0    
    6.9	    100
    8.8	    85
    11.0	50
    13.1	5
    17.2	0
    20.8	0];
units.m_diap  = {'%', '%'};  label.m_diap = {'moisture', 'diapasing worms'};  
temp.m_diap   = C2K(15);  units.temp.m_diap = 'K'; label.temp.m_diap = 'temperature';
bibkey.m_diap = 'Holm2001';

% moisture - cocoon production
data.m_R1 = [ ... moisture (%), cocoons (#/week) 
    6.7	    0.00 %Foulum 4 OM%
    9.0	    0.13
    10.9	0.60
    13.1	0.70
    15.9	1.03
    19.9	1.10];
units.m_R1  = {'%', '#/week'};  label.m_R1 = {'moisture', 'reproduction'};  
temp.m_R1   = C2K(15);  units.temp.m_R1 = 'K'; label.temp.m_R1 = 'temperature';
bibkey.m_R1 = 'Holm2001'; 
%
data.m_R2 = [ ... moisture (%), cocoons (#/week) 
    6.9	    0.00 %Byghom 3 OM%
    8.8	    0.00
    11.0	0.48
    13.1	0.65
    17.2	1.08
    20.8	0.93];
units.m_R2  = {'%', '#/week'};  label.m_R2 = {'moisture', 'reproduction'};  
temp.m_R2   = C2K(15);  units.temp.m_R2 = 'K'; label.temp.m_R2 = 'temperature';
bibkey.m_R2 = 'Holm2001'; 

% moisture - wet weight 
data.m_Ww1 = [ ... moisture (%), wet weight (g) 
    6.7	    0.89
    9.0	    1.01
    10.9	1.13
    13.1	1.26
    15.9	1.52
    19.9	1.67];
data.m_Ww1(:,2) = data.m_Ww1(:,2)/1.37;
units.m_Ww1  = {'%', '-'};  label.m_Ww1 = {'moisture', 'wet weight relative to initial'};  
temp.m_Ww1   = C2K(15);  units.temp.m_Ww1 = 'K'; label.temp.m_Ww1 = 'temperature';
bibkey.m_Ww1 = 'Holm2001';
% 
data.m_Ww2 = [ ... moisture (%), wet weight (g) 
    6.9   0.84
    8.8	    0.92
    11.0	1.03
    13.1	1.20
    17.2	1.53
    20.8	1.45];
data.m_Ww2(:,2) = data.m_Ww2(:,2)/1.44;
units.m_Ww2  = {'%', '-'};  label.m_Ww2 = {'moisture', 'wet weight relative to initial'};  
temp.m_Ww2   = C2K(15);  units.temp.m_Ww2 = 'K'; label.temp.m_Ww2 = 'temperature';
bibkey.m_Ww2 = 'Holm2001';
%
data.m_Wwj1 = [ ... moisture (%), juvenile wet weight (g) after 28 days
6.7	    0.035166667
9	    0.038371429
10.9	0.048286667
13.1	0.067266667
15.9	0.097646667
19.9	0.117073333];
units.m_Wwj1  = {'%', 'g'};  label.m_Wwj1 = {'moisture', 'wet weight'};  
temp.m_Wwj1   = C2K(15);  units.temp.m_Wwj1 = 'K'; label.temp.m_Wwj1 = 'temperature';
bibkey.m_Wwj1 = 'Holm2001';

% moisture - dry weight
data.m_Wdj = [ ... moisture (%),  dry weight (g) 
6.7	    0.005453333
9	    0.006078571
10.9	0.00742
13.1	0.013033333
15.9	0.021486667
19.9	0.026746667];
units.m_Wdj  = {'%', 'g'};  label.m_Wdj = {'moisture', 'dry weight'};  
temp.m_Wdj   = C2K(15);  units.temp.m_Wdj = 'K'; label.temp.m_Wdj = 'temperature';
bibkey.m_Wdj = 'Holm2001';

%% set weights for all real data
weights = setweights(data, []);
weights.m_Ww1 = 0*weights.m_Ww1;
weights.m_Ww2 = 0*weights.m_Ww2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'m_R1', 'm_R2'}; subtitle1 = {'reproduction rate - moisture'};
set2 = {'m_Ww1', 'm_Ww2'}; subtitle2 = {'adult weight - moisture'};
set3 = {'tW11', 'tW12', 'tW13'}; subtitle3 = {'Bart2019 1g, 1.5g, 3g horse dung'};
set4 = {'tN2', 'tN3'}; subtitle4 = {'Bart2019 1g and 3g horse dung'};
set5 = {'tW11b', 'tW12b'}; subtitle5 = {'Bart2019 1g & 3g horse dung, paired worms'};
metaData.grp.sets = {set1, set2, set3, set4, set5};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5};

%% Discussion points
D1 = 'This entry is discussed in GergRake2022';
D2 = 'Default d_V=0.16 g/cm^3, but we need a higher value to match juvenile dry weights';
D3 = 'Assumption: 1% soil organic matter content represents 18.62 kJ/g (Lavelle and Spain 2001)';
D4 = 'Assumption: A cocoon contains a single hatchling';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Aporrectodea caliginosa is hermaphroditic. However, reproduction is obligatory biparental.';
metaData.bibkey.F1 = 'Bart2018';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FV3Q'; % Cat of Life
metaData.links.id_ITIS = '975594'; % ITIS
metaData.links.id_EoL = '3126985'; % Ency of Life
metaData.links.id_Wiki = 'Aporrectodea_caliginosa'; % Wikipedia
metaData.links.id_ADW = 'Aporrectodea_caliginosa'; % ADW
metaData.links.id_Taxo = '3565675'; % Taxonomicon
metaData.links.id_WoRMS = '1041019'; % WoRMS

%% Acknowledgment
metaData.acknowledgment = 'Bart2019 Data for growth over time at different amount of food (including reproductive performance) were kindly provided by Sylvain Bart, Celine Pelosi and Alexandre R.R. Pery.';

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
    'howpublished = {\url{https://en.wikipedia.org/wiki/Aporrectodea_caliginosa}}';
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
bibkey = 'Holm1991'; type = 'Article'; bib = [ ...
    'author = {Holmstrup, M. and Ostergaard, I.K. and Nielsen, A. and Hansen, B.T.}, ' ...
    'year = {1991}, ' ...
    'title = {The relationship between temperature and cocoon incubation time for some Lumbricid earthworm species}, ' ...
    'journal = {Pedobiologia}, ' ...
    'volume = {35}, ' ...
    'number = {3}, ' ...
    'pages = {179-184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bart2018'; type = 'Article'; bib = [ ...
    'author = {Bart, S. and Amoss\''{e}, J. and Lowe, C.N. and Mougin, C. and P\''{e}ry, A.R.R. and Pelosi, C.}, ' ...
    'year = {2018}, ' ...
    'title = {\emph{Aporrectodea caliginosa}, a relevant earthworm species for a posteriori pesticide risk assessment: current knowledge and recommendations for culture and experimental design}, ' ...
    'journal = {Environmental Science and Pollution Research}, ' ...
    'doi = {10.1007/s11356-018-2579-9}, ' ...
    'volume = {25}, ' ...
    'number = {34}, ' ...
    'pages = {33867-33881}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nair1998'; type = 'Article'; bib = [ ...
    'author = {Nair, G.A. and Bennour S.A.}, ' ...
    'year = {1998}, ' ...
    'title = {Cocoons and hatchlings of \emph{Aporrectodea caliginosa} ({S}avigny 1826) ({O}ligochaeta: {L}umbricidae) in {B}enghazi, {L}ibya}, ' ...
    'journal = {Journal of Arid Environments}, ' ...
    'volume = {40}, ' ...
    'pages = {459-466}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SimsGera1999'; type = 'Book'; bib = [ ...
    'author = {Sims, R.W. and Gerard, B.M.}, ' ...
    'year = {1999}, ' ...
    'title = {Earthworms}, ' ...
    'publisher = {Field Studies Council, Shrewsbury}, ' ...
    'pages = {54-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bost1987'; type = 'Article'; bib = [ ...
    'author = {Bostr\"{o}m, U.}, ' ...
    'year = {1987}, ' ...
    'title = {Growth of earthworms (\emph{Allolobophora caliginosa}) in soil mixed with either barley, lucerne or meadow fescue at various stages of decomposition}, ' ...
    'journal = {Pedobiologia}, ' ...
    'volume = {30}, ' ...
    'pages = {311-321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lofs1983'; type = 'Incollection'; bib = [ ... %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!seems that the data comes from a differnt paper-> check wwith A. caliginos apepr from Alice Johnston
    'author = {Lofs-Holmin, A.}, ' ...
    'year = {1983}, ' ...
    'title = {Earthworm population dynamics in different agricultural rotations}, ' ...
    'booktitle = {Earthworm Ecology}, ' ...
    'publisher = {Springer, Dordrecht}, ' ...
    'editor = {Satchell, J.E.}, '...
    'chapter = {12}, '...
    'pages = {151-160}, '...
    'doi = {10.1007/978-94-009-5965-1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Holm2001'; type = 'Article'; bib = [ ...
    'author = {Holmstrup, M.}, ' ...
    'year = {2001}, ' ...
    'title = {Sensitivity of life history parameters in the earthworm \emph{Aporrectodea caliginosa} to small changes in soil water potential}, ' ...
    'journal = {Soil Biol Biochem}, ' ...
    'volume = {33}, ' ...
    'pages = {1217-1223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bart2019'; type = 'Article'; bib = [ ...
    'author = {Bart, S. and Pelosi, C. and P\''{e}ry, A.R.R}, ' ...
    'year = {2019}, ' ...
    'title = {Towards a better understanding of the life cycle of the earthworm \emph{Aporrectodea caliginosa}: new data and energy-based modelling}, ' ...
    'journal = {Pedobiologia - Journal of Soil Ecology}, ' ...
    'doi = {10.1016/j.pedobi.2019.150592}, ' ...
    'volume = {}, ' ...
    'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GergRake2022'; type = 'Misc'; bib = [ ...
    'author = {Gergs, A. and Rakel, K. and Bussen, D. and Capowiez, Y. and Ernst, G. and Roeben, V.}, ' ...
    'year = {2022}, ' ...
    'title = {Integrating earthworm movement and life history through dynamic energy budgets}, ' ...
    'journal = {Conservation Physiology}, ' ...
    'doi = {10.1093/conphys/coac042}, ' ...
    'volume = {10}, ' ...
    'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


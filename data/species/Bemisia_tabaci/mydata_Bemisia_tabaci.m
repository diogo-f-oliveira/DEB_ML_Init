function [data, auxData, metaData, txtData, weights] = mydata_Bemisia_tabaci

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Aleyrodidae';
metaData.species    = 'Bemisia_tabaci'; 
metaData.species_en = 'Silverleaf Whitefly'; 

metaData.ecoCode.climate = {'A','C'};
metaData.ecoCode.ecozone = {'TN','TP','TA','TO'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iHe'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
 metaData.data_0     = {'ab'; 'ap'; 'am'; 'L0'; 'Ww0'; 'Lb'; 'Lp'; 'Wwp'; 'Ri'}; 
 metaData.data_1     = {'T-ab'; 'T-ap'; 'T-s'};

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};    
metaData.date_subm = [2024 03 15];              
metaData.email    = {'andre.gergs@bayer.com'};            
metaData.address  = {'Bayer AG'};     

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 03 19];

%% set data
% zero-variate data
data.ab = 5.15;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AlzySeng2004';   
   temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'host plant: cotton';   
data.t1 = 3.95; units.t1 = 'd'; label.t1 = 'duration of instar 1'; bibkey.t1 = 'AlzySeng2004';   
  temp.t1 = C2K(30); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
  comment.t1 = 'host plant: cotton';      
data.t2 = 2.05; units.t2 = 'd'; label.t2 = 'duration of instar 2'; bibkey.t2 = 'AlzySeng2004';   
  temp.t2 = C2K(30); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
  comment.t3 = 'host plant: cotton';      
data.t3 = 2.70; units.t3 = 'd'; label.t3 = 'duration of instar 3'; bibkey.t3 = 'AlzySeng2004';   
  temp.t3 = C2K(30); units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
  comment.t3 = 'host plant: cotton';      
data.t4 = 5.40; units.t4 = 'd'; label.t4 = 'duration of instar 4'; bibkey.t4 = 'AlzySeng2004';   
  temp.t4 = C2K(30); units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
  comment.t4 = 'host plant: cotton';      
data.ap = 19.25;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'AlzySeng2004';
  temp.ap = C2K(30);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
    comment.ap = 'host plant: cotton';    
data.am = 8.25;    units.am = 'd';    label.am = 'adult life span'; bibkey.am = 'AlzySeng2004';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    comment.am = 'longlivety of females on cotton';  %males: 6.2
 
data.L0  = 0.0179;  units.L0  = 'cm';  label.L0  = 'egg length';        bibkey.L0  = 'ChuBuck2003';   
data.Lb  = 0.025; units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'ChuBuck2003';
  comment.Lb = 'Lb = length at first instar';  
data.LN2  = 0.0355; units.LN2  = 'cm';  label.LN2  = 'length at 2nd instar';   bibkey.LN2  = 'ChuBuck2003';
data.LN3  = 0.0434; units.LN3  = 'cm';  label.LN3  = 'length at 3rd instar';   bibkey.LN3  = 'ChuBuck2003';
data.LN4  = 0.0724; units.LN4  = 'cm';  label.LN4  = 'length at 4th instar';   bibkey.LN4  = 'ChuBuck2003'; 
  comment.LN4 = 'length for early 4rth instar';
data.Lp  = 0.1126;  units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'ChuBuck2003';  
  
data.Ww0  = 0.8;  units.Ww0  = 'mug';  label.Ww0  = 'egg weigth';        bibkey.Ww0  = 'ChuBuck2003';
data.Wwp = 3.9e-5;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'ChuBuck2003';

data.Ri  = 74.9/data.am;   units.Ri  = '#'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AlzySeng2004';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'host plant: cotton';      
  
%% uni-variate data

%temperature, egg development time
data.Tab = [ ... % temperature (C), time (d)
16.7	22.5
20      11.5
22.5    9.9
25      7.6
27.5    6.1
30      5.4
32.5    5];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};   
bibkey.Tab = 'ButlHenne1985';
%
data.Tab2 = [ ... % temperature (C), time (d)
17 13
22 8
27 5
32 5
%37 2  %only 0.01 % survival
];
units.Tab2   = {'C', 'd'};  label.Tab2 = {'temperature', 'age at birth'};  %ChanKata2021 probably not really reliable, check!
bibkey.Tab2 = 'ChanKata2021';
%
data.Tab3 = [ ... % temperature (C), time (d)
16  19.2
20  12.2
24  8.9
28  6.5
32  5.5
36  5.6];
units.Tab3   = {'C', 'd'};  label.Tab3 = {'temperature', 'age at birth'};   
bibkey.Tab3 = 'AregLegg2020'; %development times for cassava
%
data.Tab4 = [ ... % temperature (C), time (d)
12	47.0
12	42.4
12	40.1
15	30.5
15	28.5
15	27.4
18	20.1
18	19.2
18	18.2
20	12.3
20	11.9
20	11.5
25	6.7
25	6.3
25	6.1
32	5.7
32	5.5
32	5.4
35	6.2
35	6.0
35	5.9
];
units.Tab4   = {'C', 'd'};  label.Tab4 = {'temperature', 'age at birth'};   
bibkey.Tab4 = 'SporGama2023'; %development times for sweetpotato
%
data.Tab5 = [ ... % temperature (C), time (d)
17 18.86
20 9.565
23 7.34
26 5.61
29 4.54
32 4.38
35 5.81];
units.Tab5   = {'C', 'd'};  label.Tab5 = {'temperature', 'age at birth'};   
bibkey.Tab5 = 'QuiLin2008'; 

%temperature-age at puberty
data.Tap= [ ... % temperature (C), age at puberty (d)
14.9    65.1
16.7	48.7
20      34.7
22.5    27.8
25      25.6
27.5    17.8
30      16.6];
units.Tap   = {'C', 'd'};  label.Tap = {'temperature', 'age at puberty'};  
bibkey.Tap = 'ButlHenne1985';
%
data.Tap2= [ ... % temperature (C), age at puberty (d)
17 48.71
20 30.33
23 21.67
26 17.57
29 13.93
32 14.44
35 20.67];
units.Tap2   = {'C', 'd'};  label.Tap2 = {'temperature', 'age at puberty'};  
bibkey.Tap2 = 'QuiLin2008';
%
data.Tap3 = [ ... % temperature (C), age at puberty (d)
15 111.5
18 57.7
20 43.8
25 19.2
32 22.9];
units.Tap3   = {'C', 'd'};  label.Tap3 = {'temperature', 'age at puberty'};  
bibkey.Tap3 = 'SporGama2023'; % Data from egg, nymphs + Puparium
%
data.Ttp2= [ ... % temperature (C), age at puberty (d)
16	43.5
20	25.8
24	18.4
28	13.3
32	19.4];
units.Ttp2   = {'C', 'd'};  label.Ttp2 = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp2 = 'AregLegg2020'; %development times for cassava
%
data.Ttp3 = [ ... % temperature (C), age at puberty (d)
17 36
22 23
27 19
32 17
%37 9  %only 0.01 % survival
];
units.Ttp3   = {'C', 'd'};  label.Ttp3 = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp3 = 'ChanKata2021';

% temperature-reproduction rate
data.TRi = [ ... % temperature (C), reproduction rate (#/d)
15	0.724029848
18	4.533828377
20	9.626952329
25	15.2568992
32	1.287529269];
units.TRi   = {'C', '#/d'};  label.TRi = {'temperature', 'reproduction rate'};  
bibkey.TRi = 'SporGama2023'; %fecundity / oviposition period
%
data.TRi2 = [ ... % temperature (C), reproduction rate (#/d)
20 164.8/39.6
23 154.4/28.1
26 139.9/23.2
29 99.6/16.5
32 78.5/12.8];
units.TRi2   = {'C', '#/d'};  label.TRi2 = {'temperature', 'reproduction rate'};  
bibkey.TRi2 = 'QuiLin2008'; %fecundity / oviposition period

% temperature-larval mortality
data.Ts = [ ... % temperature (C), Larval mortality (%)
12.000	95.420
15.000	65.480
15.000	63.840
15.000	50.280
15.000	47.750
18	23.17
18	15.42
18	5.13
20	9.31
20	5.29
25	9.48
25	6.2
25	3.82
25	2.33
32	10.55
32	13.68
32	26.5
35	96.85];
units.Ts  = {'C', '%'}; label.Ts = {'temperature', 'larval mortality'};  
bibkey.Ts = 'SporGama2023';
%
data.Ts2 = [ ... % temperature (C), Larval mortality (%)
17 100-28.98
20 100-38.97
23 100-51.53
26 100-67.31
29 100-46.44
32 100-35.15
35 100-27.62];
units.Ts2  = {'C', '%'}; label.Ts2 = {'temperature', 'larval mortality'};  
bibkey.Ts2 = 'QuiLin2008';

% temperature-egg mortality
data.Tse = [ ... % temperature (C), egg mortality (%)
12.000	84.190
12.000	75.780
15.000	8.270
15.000	4.140
18.000	48.300
18.000	24.370
20.000	20.090
20.000	16.250
20.000	11.960
25.000	6.200
25.000	2.360
32.000	40.030
32.000	24.220
32.000	12.260
35.000	76.370
35.000	72.080
35.000	55.980];
units.Tse  = {'C', '%'}; label.Tse = {'temperature', 'egg mortality'};  
bibkey.Tse = 'SporGama2023';
%
data.Tse2 = [ ... % temperature (C), egg mortality (%)
17 100-67.6
20 100-82.9
23 100-85.81
26 100-95.54
29 100-83
32 100-87.41
35 100-71.39];
units.Tse2  = {'C', '%'}; label.Tse2 = {'temperature', 'egg mortality'};  
bibkey.Tse2 = 'QuiLin2008';
 
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
set1 = {'Tab', 'Tab2', 'Tab3', 'Tab4', 'Tab5'}; subtitle1 = {'Egg development time'};
set2 = {'Ttp2', 'Ttp3'}; subtitle2 = {'larval development time'};
set3 = {'TRi', 'TRi2'}; subtitle3 = {'reproduction rate'};
set4 = {'Tap', 'Tap2', 'Tap3'}; subtitle4 = {'age at puperty'};
set5 = {'Ts', 'Ts2'}; subtitle5 = {'larval mortality'};
set6 = {'Tse', 'Tse2'}; subtitle6 = {'egg mortality'};

metaData.grp.sets = {set1, set2, set3, set4, set5, set6};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5, subtitle6};

%% Discussion points
 D1 = 'After the third instar, the nymph transforms into a pseudo-pupal stage which is currently ignored in the entry';
 metaData.discussion = struct('D1',D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LGV8'; % Cat of Life
metaData.links.id_ITIS = '200547'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Bemisia_tabaci'; % Wikipedia
metaData.links.id_ADW = 'Bemisia_tabaci'; % ADW
metaData.links.id_Taxo = '277865'; % Taxonomicon
metaData.links.id_WoRMS = '1489088'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlzySeng2004'; type = 'Article'; bib = [ ... 
'author = {Al-Zyoud, Z. and Sengonca, C.}, ' ... 
'year = {20104}, ' ...
'title = {Development, longevity and fecundity of (\emph{Bemisia tabaci}) ({G}ENN.) ({H}omoptera: {A}leyrodidae) on different host plants at two temperatures}, ' ...
'journal = {Mitt. Dtsch. Ges. allg. angew. Ent.}, ' ...
'volume = {14}, ' ...
'pages = {375-378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AregLegg2020'; type = 'Article'; bib = [ ... 
'author = {Aregbesola, O. Z. and Legg, J. P. and Lund, O.S. and Sigsgaard, S. and Sporleder, M. and Carhuapoma, P. and Rapisarda, C.}, ' ... 
'year = {2020}, ' ...
'title = {Life history and temperature-dependence of cassava-colonising populations of (\emph{Bemisia tabaci})}, ' ...
'journal = {Journal of Pest Science}, ' ...
'doi = {10.1007/s10340-020-01249-z}, ' ...
'volume = {93}, ' ...
'pages = {1225-1241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChuBuck2003'; type = 'Article'; bib = [ ... 
'author = {Chu, C. and Buckner, J.S. and Karut, K. and Freeman, T.P. and Nelsen, D.R. and Hennebeny, T.J.}, ' ... 
'year = {2003}, ' ...
'title = {A survey of sizes and weights of (\emph{Bemisia tabaci}) ({H}omoptera: {A}leyrodidae) {B} biotype life stages from field grown cotton and cantaloupes}, ' ...
'journal = {Insect Science}, ' ...
'doi = {10.1111/j.1744-7917.2003.tb00374.x}, ' ...
'volume = {10}, ' ...
'pages = {121-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChanKata2021'; type = 'Article'; bib = [ ... 
'author = {Chandi, R.S. and Kataria, S.K. and Fand, B.B.}, ' ... 
'year = {2021}, ' ...
'title = {Effect of temperature on biological parameters of cotton whitefly, (\emph{Bemisia tabaci}) ({G}ennadius) ({H}emiptera: {A}leyrodidae)}, ' ...
'journal = {International Journal of Tropical Insect Science}, ' ...
'doi = {10.1007/s42690-020-00397-0}, ' ...
'volume = {41}, ' ...
'pages = {1823-1833}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ButlHenne1985'; type = 'Article'; bib = [ ... 
'author = {Butler, G.D. and  Henneberry, T.J.}, ' ... 
'year = {1985}, ' ...
'title = {(\emph{Bemisia tabaci})({G}ennadius), a pest of cotton in the Southwestern {U}nited {S}tates}, ' ...
'journal = {U.S.Department of Agriculture, Technical Bulletin}, ' ...
'volume = {1707}, ' ...
'pages = {1-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SporGama2023'; type = 'Article'; bib = [ ... 
'author = {Sporleder, M. and Gamarra, H. and Carhuapoma, P. and Goicochea, L. and Kroschel, J. and Kreuze, J.}, ' ... 
'year = {2023}, ' ...
'title = {A temperature-dependent phenology model for (\emph{Bemisia tabaci}) {M}{E}{A}{M}1 ({H}emiptera: {A}leyrodidae)}, ' ...
'journal = {Environmental Entomology}, ' ...
'volume = {52}, ' ...
'pages = {832-846}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'QuiLin2008'; type = 'Article'; bib = [ ... 
'author = {Qiu, B. and Ren, S. and Mandour, N.S. and Lin, L.}, ' ... 
'year = {2003}, ' ...
'title = {Effect of temperature on the development and reproduction of (\emph{Bemisia tabaci}) {B} biotype ({H}omoptera: {A}leyrodidae)}, ' ...
'journal = {Insect Science}, ' ...
'volume = {10}, ' ...
'pages = {43-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

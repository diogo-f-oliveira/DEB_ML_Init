function [data, auxData, metaData, txtData, weights] = mydata_Diaphorina_citri

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Liviidae';
metaData.species    = 'Diaphorina_citri'; 
metaData.species_en = 'Asian citrus psyllid'; 

metaData.ecoCode.climate = {'A','BW'};
metaData.ecoCode.ecozone = {'THn','TN','TP'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iHe'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
 metaData.data_0     = {'ab'; 'ap'; 'L0'; 'Lb'; 'L_N5'; 'Ww_N5'; 'Lp'}; 
 metaData.data_1     = {'T-ab'; 'T-ap'; 'T-S'; 't-N'; 't-am';  't-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};    
metaData.date_subm = [2024 12 10];              
metaData.email    = {'andre.gergs@bayer.com'};            
metaData.address  = {'Bayer AG'};     

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 12 11];

%% set data
% zero-variate data
data.ab = 4.15;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TsaiLui2000';   
   temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'host plant: Orange jessamine';   
data.t1 = 2; units.t1 = 'd'; label.t1 = 'duration of instar 1'; bibkey.t1 = 'TsaiLui2000';   
  temp.t1 = C2K(25); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
  comment.t1 = 'host plant: Orange jessamine';      
data.t2 = 1.58; units.t2 = 'd'; label.t2 = 'duration of instar 2'; bibkey.t2 = 'TsaiLui2000';   
  temp.t2 = C2K(25); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
  comment.t3 = 'host plant: Orange jessamine';      
data.t3 = 1.68; units.t3 = 'd'; label.t3 = 'duration of instar 3'; bibkey.t3 = 'TsaiLui2000';   
  temp.t3 = C2K(25); units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
  comment.t3 = 'host plant: Orange jessamine';      
data.t4 = 2.35; units.t4 = 'd'; label.t4 = 'duration of instar 4'; bibkey.t4 = 'TsaiLui2000';   
  temp.t4 = C2K(25); units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
  comment.t4 = 'host plant: Orange jessamine';   
data.t5 = 5.21; units.t5 = 'd'; label.t5 = 'duration of instar 5'; bibkey.t5 = 'TsaiLui2000';   
  temp.t5 = C2K(25); units.temp.t5 = 'K'; label.temp.t5 = 'temperature'; 
  comment.t5 = 'host plant: Orange jessamine';    
data.ap = 16.97;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'TsaiLui2000';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
    comment.ap = 'host plant: Orange jessamine';        

data.L0  = 0.031;  units.L0  = 'cm';  label.L0  = 'egg length';        bibkey.L0  = 'TsaiLui2000';
data.Lb  = 0.03; units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'TsaiLui2000'; 
data.LN2  = 0.045; units.LN2  = 'cm';  label.LN2  = 'length at 2nd instar';   bibkey.LN2  = 'TsaiLui2000'; 
data.LN3  = 0.075; units.LN3  = 'cm';  label.LN3  = 'length at 3rd instar';   bibkey.LN3  = 'TsaiLui2000';  
data.LN4  = 0.101; units.LN4  = 'cm';  label.LN4  = 'length at 4th instar';   bibkey.LN4  = 'TsaiLui2000';  
data.LN5  = 0.16; units.LN5  = 'cm';  label.LN5  = 'length at 5th instar';   bibkey.LN5  = 'TsaiLui2000'; 
data.LN52  = 0.171; units.LN52  = 'cm';  label.LN52  = 'length at 5th instar';   bibkey.LN52  = 'FanShan2024'; 
 comment.LN52 = 'data from grey color morph';  
 
data.Ww5 = 2.79/1000;    units.Ww5 = 'g';   label.Ww5 = 'wet weight at 5th instar';   bibkey.Ww5 = 'FanShan2024'; 
 comment.Ww5 = 'data from grey color morph';

% imago body length
data.Lp  = 0.33;  units.Lp  = 'cm';  label.Lp  = 'length of imago'; bibkey.Lp  = 'TsaiLui2000'; 

%% uni-variate data
%temperature, egg development time
data.Tab = [ ... % temperature (C), time (d)
15	9.74
20	7.03
25	4.15
28	3.46
30	3.29];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth', 'LiuTsai2000'};   
bibkey.Tab = 'LiuTsai2000';
%
data.Tab2 = [ ... % temperature (C), time (d)
18	7.7
20  6.4
22  5.9
25	4.5
28	3.2
30  2.9
32  2.6];
units.Tab2   = {'C', 'd'};  label.Tab2 = {'temperature', 'age at birth', 'NavaTorr2007'};   
bibkey.Tab2 = 'NavaTorr2007';
%
data.Tab3 = [ ... % temperature (C), time (d)
15      15
17.5    10.3
20      7.5
22.5    5.5
25      4.5
27.5    3.5 
30      2.7
32.5    2.5];
units.Tab3   = {'C', 'd'};  label.Tab3 = {'temperature', 'age at birth', 'Naka2006'};   
bibkey.Tab3 = 'Naka2006';

%temperature-age at puberty
data.Tap= [ ... % temperature (C), egg-to-imago period (d)
15	49.34
20	28.79
25	16.97
28	14.06
30	16.29];
units.Tap   = {'C', 'd'};  label.Tap = {'temperature', 'age at puberty', 'LiuTsai2000'};  
bibkey.Tap = 'LiuTsai2000';%
%
data.Tap2 = [ ... % temperature (C), time (d)
18	43.5
20  30.9
22  29.6
25	17.1
28	15.4
30  12.4
32  12.1];
units.Tap2   = {'C', 'd'};  label.Tap2 = {'temperature', 'age at puberty', 'NavaTorr2007'};   
bibkey.Tap2 = 'NavaTorr2007';
%
data.Tap3= [ ... % temperature (C), egg-to-imago period (d)
17.5    46.6
20      29.5
22.5    22.3
25      17.5
27.5    15.4 
30      13.4
32.5    19.3];
units.Tap3   = {'C', 'd'};  label.Tap3 = {'temperature', 'age at puberty', 'Naka2006'};  
bibkey.Tap3 = 'Naka2006';%
%
data.Tap4= [ ... % temperature (C), egg-to-imago period (d)
15	41.39
20	29.91
25	16.76
30	10.91
32 10.84
35 14.95];
units.Tap4   = {'C', 'd'};  label.Tap4 = {'temperature', 'age at puberty', 'MiloKels2020'};  
bibkey.Tap4 = 'MiloKels2020';

% time-cumulative reproduction
data.tN15 = [ ... % time (d), reproduction (#)
% 0 0
% 3	0
% 6	0
% 9	0
% 12	0
% 15	0
% 18	0
% 21	0
% 24	0
% 27	0
% 30	0
% 33	0
36	2.7
39	6.8
42	11
45	13.3
48	20.7
51	25.7
54	30.6
57	32.6
60	36.7
63	42.2
66	47.6
69	52.2
72	59.7
75	68
78	79.1
81	85.2
84	96.7
87	105
90	112
93	119.3
96	126.5
99	131.4
102	136.7
105	145.9
108	151.6
111	160.9
114	160.9];
data.tN15(:,1)=data.tN15(:,1)-35; %simulate time since start reproduction
units.tN15   = {'d', '#'};  label.tN15 = {'time since start reproduction', 'cum. reproduction', '15 C'};
temp.tN15 = C2K(15);  units.temp.tN15 = 'K'; label.temp.tN15 = 'temperature';
bibkey.tN15 = 'LiuTsai2000'; 
%
data.tN20 = [ ... % time (d), reproduction (#)
% 0	0
% 3	0
% 6	0
9	1.8
12	12.2
15	34
18	67.2
21	100.1
24	124.5
27	147.6
30	169.1
33	189.9
36	207.3
39	221.1
42	239.4
45	252.9
48	265.2
51	280.9
54	280.9
57	281];
data.tN20(:,1)=data.tN20(:,1)-8; %simulate time since start reproduction
units.tN20   = {'d', '#'};  label.tN20 = {'time since start reproduction', 'cum. reproduction', '20 C'};
temp.tN20 = C2K(20);  units.temp.tN20 = 'K'; label.temp.tN20 = 'temperature';
bibkey.tN20 = 'LiuTsai2000'; 
%
data.tN25 = [ ... % time (d), reproduction (#)
% 0	0  
% 3	0
6	0.5
9	16.7
12	50.6
15	96.5
18	142.6
21	180.3
24	210.2
27	236.3
30	263.1
33	288.8
36	307.2
39	330.3
42	347.1
45	363.6
48	374
51	374];
data.tN25(:,1)=data.tN25(:,1)-5; %simulate time since start reproduction
units.tN25   = {'d', '#'};  label.tN25 = {'time since start reproduction', 'cum. reproduction', '25 C'};
temp.tN25 = C2K(25);  units.temp.tN25 = 'K'; label.temp.tN25 = 'temperature';
bibkey.tN25 = 'LiuTsai2000'; 
%
data.tN28 = [ ... % time (d), reproduction (#)
% 0	0
% 3	0
6	22.8
9	71.1
12	116.3
15	162.4
18	198.5
21	237.8
24	272.9
27	308
30	336.6
33	367
36	389.1
39	404.7
42	430.1
45	445.7
48	445.7];
data.tN28(:,1)=data.tN28(:,1)-4; %simulate time since start reproduction
units.tN28   = {'d', '#'};  label.tN28 = {'time since start reproduction', 'cum. reproduction', '28 C'};
temp.tN28 = C2K(28);  units.temp.tN28 = 'K'; label.temp.tN28 = 'temperature';
bibkey.tN28 = 'LiuTsai2000'; 
%
data.tN30 = [ ... % time (d), reproduction (#)
% 0	0
% 3	0
% 6	0
9	2.9
12	16.3
15	34.9
18	56
21	75.8
24	96.4
27	123
30	151.6
33	170
36	183.4
39	194.7
42	201.2
45	201.2
48	201.2];
data.tN30(:,1)=data.tN30(:,1)-8; %simulate time since start reproduction
units.tN30   = {'d', '#'};  label.tN30 = {'time since start reproduction', 'cum. reproduction', '30 C'};
temp.tN30 = C2K(30);  units.temp.tN30 = 'K'; label.temp.tN30 = 'temperature';
bibkey.tN30 = 'LiuTsai2000'; 

% temperature-larval mortality
data.Ts = [ ... % temperature (C), egg to imago mortality (%)
15	38.1
20	30.2
25	24.6
28	16.1
30	26.3];
units.Ts  = {'C', '%'}; label.Ts = {'temperature', 'egg to imago mortality', 'LiuTsai2000'};  
bibkey.Ts = 'LiuTsai2000';
%
data.Ts2 = [ ... % temperature (C), egg to imago mortality (%)
18	(100-67.2)
20	(100-66.6)
22	(100-64.1)
25	(100-69.4)
28	(100-69.5)
30	(100-66.8)
32	(100-5.7)];
units.Ts2  = {'C', '%'}; label.Ts2 = {'temperature', 'egg to imago mortality', 'NavaTorr2007'};  
bibkey.Ts2 = 'NavaTorr2007';

% time-imago suvival
data.tS15 = [ ... % % time (d), fraction surviving (-)
0	1
3	1
6	1
9	1
12	1
15	1
18	1
21	1
24	1
27	1
30	1
33	1
36	1
39	1
42	1
45	1
48	1
51	1
54	1
57	1
60	0.96
63	0.96
66	0.9
69	0.76
72	0.66
75	0.61
78	0.61
81	0.56
84	0.52
87	0.52
90	0.44
93	0.44
96	0.44
99	0.44
102	0.29
105	0.24
108	0.19
111	0];
units.tS15  = {'d', '-'}; label.tS15 = {'time', 'fraction surviving', '15 C'};  
temp.tS15 = C2K(15);  units.temp.tS15 = 'K'; label.temp.tS15 = 'temperature';
bibkey.tS15 = 'LiuTsai2000';
%
data.tS20 = [ ... % time (d), fraction surviving (-)
0	1
3	1
6	1
9	1
12	1
15	1
18	1
21	1
24	1
27	1
30	1
33	0.96
39	0.86
42	0.82
45	0.62
48	0.58
51	0.43
54	0.33
57	0.05
60	0];
units.tS20  = {'d', '-'}; label.tS20 = {'time', 'fraction surviving', '20 C'};  
temp.tS20 = C2K(20);  units.temp.tS20 = 'K'; label.temp.tS20 = 'temperature';
bibkey.tS20 = 'LiuTsai2000';
%
data.tS25 = [ ... % time (d), fraction surviving (-)
0	1
3	1
6	1
9	1
12	1
15	1
18	1
21	1
24	1
27	1
30	0.89
33	0.88
36	0.8
39	0.64
42	0.46
45	0.25
48	0.16
51	0.05
54	0];
units.tS25  = {'d', '-'}; label.tS25 = {'time', 'fraction surviving', '25 C'};  
temp.tS25 = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature';
bibkey.tS25 = 'LiuTsai2000';
%
data.tS28 = [ ... % time (d), fraction surviving (-)
0	1
3	1
6	1
9	1
12	1
15	1
18	1
21	0.95
24	0.86
27	0.81
30	0.76
33	0.52
36	0.33
39	0.24
42	0.14
45	0.1
48	0];
units.tS28  = {'d', '-'}; label.tS28 = {'time', 'fraction surviving', '28 C'};  
temp.tS28 = C2K(28);  units.temp.tS28 = 'K'; label.temp.tS28 = 'temperature';
bibkey.tS28 = 'LiuTsai2000';
%
data.tS30 = [ ... % time (d), fraction surviving (-)
0	1
3	1
6	1
9	1
12	1
15	1
18	1
21	1
24	0.96
27	0.96
30	0.88
33	0.62
36	0.5
39	0.23
42	0.12
45	0.08
48	0];
units.tS30  = {'d', '-'}; label.tS30 = {'time', 'fraction surviving', '30 C'};  
temp.tS30 = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature';
bibkey.tS30 = 'LiuTsai2000';

% moults - head capsule width
data.tL = [ ... % time (d), length (cm)
 0    0.012
 2.43 0.018
 4.55 0.035
 7.26 0.044
10.33 0.057];
units.tL  = {'d', 'cm'}; label.tL = {'age', 'larval head capsule width'};  
temp.tL = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NavaTorr2007';

%% set weights for all real data
 weights = setweights(data, []);
 weights.tL = weights.tL*5;
   
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
 set1 = {'tN30', 'tN28', 'tN25', 'tN20', 'tN15'}; subtitle1 = {'data for different temperatures'};
 set2 = {'tS30','tS28', 'tS25', 'tS20', 'tS15'}; subtitle2 = {'data for different temperatures'};
 set3 = {'Tab','Tab2','Tab3'}; subtitle3 = {'data from various sources'};
 set4 = {'Tap','Tap2','Tap3','Tap4'}; subtitle4 = {'data from various sources'};
 set5 = {'Ts','Ts2'}; subtitle5 = {'data from LiuTsai2000, NavaTorr2007'};
 
 metaData.grp.sets = {set1, set2, set3, set4, set5};
 metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5};

%% Discussion points
 D1 = 'Investment into reproduction starts as imago; the pre-oviposion period is currently ignored';
 D2 = 'Upper boundary temperature for larval survival is assumed to be lower compared to the one for temperatur correction of pimary parameters';
 D3 = 'Ageing as imagos has a lower Arrhenius temperature compared to the one for temperatur correction of pimary parameters; alternatively, the square root of the temperature correction factor also explains the data'; 
 D4 = ' Reproduction at 30 C is lower than at 28 C, but survival is also lower. Parameter T_H  needs to be different for survival and reprod to capture this, thus parameters T_H and T_Hs used in this entry.';
 
 metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4', D4);

%% Facts
 F1 = 'Diaphorina citri is exclusively associated with Rutaceae'; 
 metaData.bibkey.F1 = 'Cabi'; 
 F2 = 'Vector for citrus greening disease'; 
 metaData.bibkey.F2 = 'Cabi'; 
 metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '35BY4'; % Cat of Life
metaData.links.id_ITIS = '200477'; % ITIS
metaData.links.id_EoL = '585745'; % Ency of Life
metaData.links.id_Wiki = 'Diaphorina_citri'; % Wikipedia
metaData.links.id_ADW = 'Diaphorina_citri'; % ADW
metaData.links.id_Taxo = '351916'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

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
bibkey = 'TsaiLui2000'; type = 'Article'; bib = [ ... 
'author = {Tsai, J. H. and Lui, Y. H.}, ' ... 
'year = {2000}, ' ...
'title = {Biology of (\emph{Diaphorina citri}) ({H}omoptera: {P}syllidae) on four host plants}, ' ...
'journal = {Journal of Economic Entomology}, ' ...
'doi = {10.1603/0022-0493-93.6.1721}, ' ...
'volume = {93}, ' ...
'pages = {1721-1725}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiuTsai2000'; type = 'Article'; bib = [ ... 
'author = {Lui, Y. H. and Tsai, J. H.}, ' ... 
'year = {2000}, ' ...
'title = {Effects of temperature on biology and life table parameters of the Asian citrus psyllid, (\emph{Diaphorina citri}) {K}uwayama ({H}omoptera: {P}syllidae)}, ' ...
'journal = {Annals of Applied Biology}, ' ...
'doi = {10.1111/J.1744-7348.2000.TB00060.X}, ' ...
'volume = {137}, ' ...
'pages = {201-206}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FanShan2024'; type = 'Article'; bib = [ ... 
'author = {Fan, J. and Shang, F. and Pan, H. and Yuan, C. and Liu, T. and Yi. L. and Wang J and Dou, W.}, ' ... 
'year = {2024}, ' ...
'title = {Body color plasticity of (\emph{Diaphorina citri}) reflects a response to environmental stress}, ' ...
'journal = {Insect Science}, ' ...
'doi = {10.1111/1744-7917.13272}, ' ...
'volume = {31}, ' ...
'pages = {937-952}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NavaTorr2007'; type = 'Article'; bib = [ ... 
'author = {Nava, D.E. and Torres, M.L.G. and Rodrigues, M.D.L. and Bento,J.M.S. and Parra, J.R.P.}, ' ... 
'year = {2007}, ' ...
'title = {Biology of (\emph{Diaphorina citri})({H}em.: {P}syllidae) on different hosts and at different temperatures}, ' ...
'journal = {Journal of Applied Entomolgy}, ' ...
'doi = {10.1111/j.1439-0418.2007.01230.x}, ' ...
'volume = {131}, ' ...
'pages = {709-715}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

bibkey = 'Naka2006'; type = 'Article'; bib = [ ... 
'author = {Nakata T.}, ' ... 
'year = {2006}, ' ...
'title = {Temperature-dependent development of the citrus psyllid, (\emph{Diaphorina citri})({H}omoptera: {P}syllidae) and the predicted limit of its spread based on overwintering in the nymphal stage in temperate regions of Japan}, ' ...
'journal = {Applied Entomology and Zoology}, ' ...
'doi = {10.1303/aez.2006.383}, ' ...
'volume = {41}, ' ...
'pages = {383-387}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiloKels2020'; type = 'Article'; bib = [ ... 
'author = {Milosavljevi?, I. and McCalla, K.A. and Morgan, D.J.W. and Hoddle, M.S.}, ' ... 
'year = {2020}, ' ...
'title = {The Effects of Constant and Fluctuating Temperatures on Development of (\emph{Diaphorina citri})({H}emiptera: {P}syllidae), the {A}sian Citrus Psyllid}, ' ...
'journal = {Journal of Economic Entomology}, ' ...
'doi = {10.1093/jee/toz320}, ' ...
'volume = {113}, ' ...
'pages = {633-645}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

bibkey = 'Cabi'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cabidigitallibrary.org/doi/10.1079/cabicompendium.18615#sec-9}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


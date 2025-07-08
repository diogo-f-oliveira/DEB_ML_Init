function [data, auxData, metaData, txtData, weights] = mydata_Ostrea_chilensis

%% set metaData 
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Ostreoida'; 
metaData.family     = 'Ostreidae';
metaData.species    = 'Ostrea_chilensis'; 
metaData.species_en = 'Dredge oyser';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};

metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lr'; 'Li'; 'Wd0'; 'Wdr'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L', 'L-Wd','L-F_f','Wd-JO','Wd-JN','t-Wd','L-N'};

metaData.COMPLETE = 3; 

metaData.author      = {'Brecht Stechele'};    
metaData.date_subm   = [2020 03 15];              
metaData.email       = {'Brecht.Stechele@UGent.be'};            
metaData.address     = {'UGent, Coupure Links, Gent, Belgium'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 03 21]; 


%% set data
% zero-variate data
data.am = 2190;     units.am = 'd';    label.am = 'life span';                   bibkey.am = {'Rodri1990'};   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Datapoint taken from O. edulis';

data.Lb  = 0.0350;      units.Lb  = 'cm';   label.Lb  = 'total length at start feeding';    bibkey.Lb  = 'Wils1996';
data.Lr  = 0.0461;      units.Lr  = 'cm';   label.Lr  = 'total length at release';          bibkey.Lr  = 'Wils1996';
data.Li  = 9;           units.Li  = 'cm';   label.Li  = 'maximum length';                   bibkey.Li = 'Fu2016';

data.Ww0 = 0.0000046;   units.Ww0 = 'g';    label.Ww0 = 'wet weight of eggs';               bibkey.Ww0 = 'Chap2006';
data.Wdr = 0.000008;    units.Wdr  = 'g';   label.Wdr  = 'weight at release';               bibkey.Wdr = 'Wils1996'; 
data.Wwp = 1.062;       units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';            bibkey.Wwp = 'Elbe2013';  
  comment.Wwp = 'Datapoint taken from O. edulis';
data.Wwi = 4.98;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'Rich1993';


% uni-variate data
% Winter 1984
Winter1 = [ ...
2.24	0.04	169     2.19
2.27	0.042	178     2.31
2.36	0.049	218     2.83
2.44	0.055	198     2.57
2.48	0.058	235     3.05
3.76	0.262	569     7.37
5.21	0.852	1380	17.88
5.21	0.852	1238	16.04
5.32	0.918	988     12.8
5.33	0.925	1350	17.5
6.27	1.662	1780	23.07
6.32	1.71	1692	21.93
7.39	3.008	3112	40.33
7.4     3.022	2841	36.82
7.45	3.097	2360	30.59
7.47	3.127	2537	32.88];  % cm, total length at f and T
%
data.LWd1 = Winter1(:,[1 2]);
units.LWd1   = {'cm', 'g'};  label.LWd1 = {'length', 'tissue dry weight'};  
temp.LWd1    = C2K(12);  units.temp.LWd1 = 'K'; label.temp.LWd1 = 'temperature';
bibkey.LWd1 = 'Wint1984';
%
data.LF_f1 = Winter1(:,[1 3]);
data.LF_f1(:,2) = data.LF_f1(:,2) .*24/1000; 
units.LF_f1  = {'cm', 'L/d'}; label.LF_f1 = {'length', 'filtration rate'};
temp.LF_f1 = C2K(12);    units.temp.LF_f1 = 'K'; label.temp.LF_f1 = 'temperature';
bibkey.LF_f1 = 'Wint1984';

Winter2 = [ ...
2.25	0.041	96      2.47
2.44	0.055	125     3.21
2.44	0.055	88      2.26
2.46	0.057	116     2.98
3.79	0.277	320     8.22
3.78	0.267	273     7.01
5.28	0.894	510     13.1
5.19	0.84	580     14.89
5.43	0.989	710     18.23
7.17	2.697	990     25.42
7.35	2.949	1342	34.46
7.37	2.978	1152	29.58];  % cm, total length at f and T
%
data.LWd2 = Winter2(:,[1 2]);
units.LWd2   = {'cm', 'g'};  label.LWd2 = {'length', 'tissue dry weight'};  
temp.LWd2    = C2K(12);  units.temp.LWd2 = 'K'; label.temp.LWd2 = 'temperature';
bibkey.LWd2 = 'Wint1984';
%
data.LF_f2 = Winter2(:,[1 3]);
data.LF_f2(:,2) = data.LF_f2(:,2) .*24/1000; 
units.LF_f2  = {'cm', 'L/d'}; label.LF_f2 = {'length', 'filtration rate'};
temp.LF_f2 = C2K(12);    units.temp.LF_f2 = 'K'; label.temp.LF_f2 = 'temperature';
bibkey.LF_f2 = 'Wint1984';

data.WdJO=[
0.05, 0.05
0.25, 0.13
1.0, 0.35
2.1, 0.62
4.7, 0.86];
units.WdJO  = {'g', 'ml/h'}; label.WdJO = {'length', 'dioxygen consumption'};
temp.WdJO = C2K(12);    units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'Wint1984';

data.WdJN = [...
0.04	0.0405	0.041   0.042	0.05	0.051	0.052	  0.84    0.88	0.89	0.90    0.92   0.95    0.96     1.09	2.57	2.58	2.59	2.60
2.23	3.52	2.83    2.66	3.22	3.22	3.66	  10.88   12.8	12.8    11.13   9.97   12.8    11.87  	13.11	30.48	35.88	38.7	42.73]';
units.WdJN  = {'g', 'ug NH4-N/h'}; label.WdJN = {'length', 'ammonia excretion'};
temp.WdJN = C2K(12);    units.temp.WdJN = 'K'; label.temp.WdJN = 'temperature';
bibkey.WdJN = 'Wint1984';

% Chaparro 2006 and 2008
data.LWd3 = [...
0.023696	0.00000533
0.023703	0.00000492
0.02528     0.00000578
0.026806	0.00000555
0.025268	0.00000448
0.028137	0.00000467
0.02814     0.00000445
0.029594	0.00000443
0.029458	0.00000428
0.03324     0.00000571
0.037805	0.00000584
0.04153     0.00000655
0.041521	0.00000707
0.042315	0.00000717
0.042631	0.00000692
0.042641	0.00000634
0.045191	0.00000694
0.045179	0.00000759
0.04462     0.00000791
0.044741	0.00000895
0.045416	0.00000991
0.045404	0.00001062
0.043542	0.00001024
];
units.LWd3   = {'cm', 'g'};  label.LWd3 = {'length', 'tissue dry weight'};  
temp.LWd3    = C2K(12);  units.temp.LWd3 = 'K'; label.temp.LWd3 = 'temperature';
bibkey.LWd3 = 'Chap2006';

data.LN = [...
39.5	39.6	40	40.5	40.6	41.1	41.4	41.9	42.7	42.4	42.6	42.9	43.5	43.7	44.2	44.3	43.7	45	45.1	45.5	45.7	45.5	46.2	46	46.4	46.3	46.1	47.1	47	47	47.6	47.8	47.8	48.1	48.1	48.4	48.6	49.1	49.2	49.1	49.2	49.5	49.7	49.9	50.2	50	50.4	50.4	50.5	50.2	50.6	49.9	50.5	50.9	51	51	51.2	51.6	51	51.8	52.3	51.9	52.3	52	52.7	52.7	52.8	53.3	53	53.4	53.5	54.1	54.2	54.6	54.5	54.6	54.7	54.9	55.2	54.9	55.4	56	57	57.2	57.2	57.4	57.5	58	58.2	58.2	58.3	58.2	58.7	59	60	60	61.1	61.4	63.1	64	64	64.5	64.8	66.1	66.4	67.7	76.6	35.3	36.9	38.4	37.2	40.4	38.2	35	29	32.4
40763.8	28493.2	23484.1	43051.3	31837.4	10277.2	38077.3	19983.2	22602.1	12977.8	33864.7	28941.3	22825.9	17756.2	37901.4	30360.1	27310.4	10511.3	49555.4	66551.2	39206.7	32491.3	43443.7	20612.7	28901.7	16298.9	65172.8	25078.8	40346.7	54135.9	48195.7	31489.2	12040.9	73358.4	64610.9	22090.1	40808.5	53619.1	32231.7	11543	48713.3	63253.2	24127.2	39448.9	89412.5	78962.6	43862.3	55471.7	34608.2	29133.8	12688.8	9359.7	49802.7	64143.7	3412.7	59563	23138.2	37509.3	91425.2	105407.9	13492.3	8852.6	28282.5	19057.5	57097.9	39793.5	33103.8	24919.5	79563.7	14282.8	44480.7	75496.6	37085.8	26620.2	22720.7	55095.4	8818.6	16539.2	30757.7	77097.1	36612.8	29050.3	106859.2	79559.5	43962.4	38208.8	16448.1	31216.3	83201.7	71138.1	57683.8	79650.9	12024.8	46787.3	93206.2	24163.4	33933.2	84221.9	18213.8	39630.2	27546.9	113100.3	58897.8	21059.1	74981.1	65298.1	93698.7	16279	15396	15623.5	41619.1	46075.7	53622.9	56055.6	23144.5	9601.7]';
data.LN(:,1) = data.LN(:,1)./10; % convert mm tp cm
units.LN   = {'cm', '#larvae'};  label.LN = {'shell length', 'cluch size'};  
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Chap2008';

% Videla 1998
data.tL = [...
0.03, 0.042965
0.25, 0.042548
0.26, 0.042548
0.67, 0.043117
1.20, 0.044677
1.47, 0.046241
2.22, 0.050276
3.22, 0.054304
4.22, 0.055110];
units.tL   = {'d', 'cm'};  label.tL = {'time since release', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vide1998';

data.tWd = [...
0.05, 22.79
0.26, 20.03
0.75, 23.76
1.51, 12.20
2.00, 43.40
3.00, 46.57
3.99, 66.06];
data.tWd(:,2) = data.tWd(:,2) ./1e6;
units.tWd   = {'d', 'g'};  label.tWd = {'time since release', 'tissue dry weight'};  
temp.tWd    = C2K(20);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'Vide1998';

% Wilson 1996
data.tL2 = [...
0.40, 0.05
9.45, 0.12
38.07, 0.45];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since release', 'shell length'};  
temp.tL2    = C2K(10);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Wils1996';

% Richardson 1993
data.tL3 = [...
3       0
343     2.91
734     4.25
1099	6.34
1478	8.01
1856	8.47
2222	8.99
2580	9.24
2967	9.46
2969	9.46];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since release', 'shell length'};  
temp.tL3    = C2K(11);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Rich1993';

data.tL4 = [...
0       0.11
362     4.16
711     4.79
1082	5.77
1440	7.91
1811	7.95];
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since release', 'shell length'};  
temp.tL4    = C2K(11);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'Rich1993';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
 set1 = {'LWd1', 'LWd2'}; subtitle1 = {'different food densities'};
 set2 = {'LF_f1', 'LF_f2'}; subtitle2 = {'different food densities'};
 metaData.grp.sets = {set1, set2};
 metaData.grp.subtitle = {subtitle1, subtitle2};

%% Links
metaData.links.id_CoL = '75D5D'; % Cat of Life
metaData.links.id_ITIS = '79876'; % ITIS
metaData.links.id_EoL = '46467144'; % Ency of Life
metaData.links.id_Wiki = 'Ostrea_chilensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3973440'; % Taxonomicon
metaData.links.id_WoRMS = '397160'; % WoRMS
metaData.links.id_molluscabase = '397160'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wint1984'; type = 'Article'; bib = [ ... 
'author = {Winter, J. E. and Acevedo, M. A. and Navarro, J. M.}, ' ... 
'year   = {1984}, ' ...
'title  = {Balance in \emph{Ostrea chilensis}}, ' ...
'journal= {Marine Ecology}, ' ...
'volume = {20}, ' ...
'doi    = {10.1016/0044-8486(95)01050-5}, '...
'pages  = {151-164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vide1998'; type = 'Article'; bib = [ ... 
'author = {Videla, J. A. and Chaparro, O. R. and Thompson, R. J. and Concha, I. I.}, ' ... 
'year   = {1998}, ' ...
'title  = {Role of biochemical energy reserves in metamorphosis and early juvenile development of the oyster \emph{Ostrea chilensis}}, ' ...
'journal= {Marine Biology}, ' ...
'volume = {132}, ' ...
'doi    = {10.1007/s002270050428}, '...
'pages  = {635-640}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chap2008'; type = 'Article'; bib = [ ... 
'author = {Chaparro, O. R. and Matus, P. R. and Thompson, R. J. and Segura, C. J. and Pardo, L. M. and Cubillos, V. M.}, ' ... 
'year   = {2008}, ' ...
'title  = {Gametic, morphometric and physiological variables influencing clutch size in the {C}hilean oyster, \emph{Ostrea Chilensis}}, ' ...
'journal= {Journal of experimental marine biology and ecology}, ' ...
'volume = {359}, ' ...
'doi    = {10.1016/j.jembe.2008.02.008}, '...
'pages  = {18-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wils1996'; type = 'Article'; bib = [ ... 
'author = {Wilson, J. A. and Chaparro, O. R. and Thompson, R. J.}, ' ... 
'year   = {1996}, ' ...
'title  = {The importance of broodstock nutrition on the viability of larvae and spat in the {C}hilean oyster \emph{Ostrea Chilensis}}, ' ...
'journal= {Aquaculture}, ' ...
'volume = {139}, ' ...
'doi    = {10.1016/0044-8486(95)01159-5}, '...
'pages  = {63-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chap2006'; type = 'Article'; bib = [ ... 
'author = {Wilson, J. A. and Chaparro, O. R. and Thompson, R. J.}, ' ... 
'year   = {2006}, ' ...
'title  = {The physiology of the larva of the {C}hilean oyster \emph{Ostrea chilensis} and the utilisation of biochemical energy reserves during development: {A}n extreme case of the brooding habit}, ' ...
'journal= {Journal of Sea Research}, ' ...
'volume = {55}, ' ...
'doi    = {10.1016/j.seares.2005.11.003}, '...
'pages  = {292-300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fu2016'; type = 'Article'; bib = [ ... 
'author = {Fu, D. and Alistair, D. and Keith P. M. and Hills, J.}, ' ... 
'year   = {2016}, ' ...
'title  = {The development and performance of a length-based stock assessment of {F}oveaux {S}trait oysters (\emph{Ostrea chilensis}, {O}{Y}{U}5) in southern {N}ew {Z}ealand,and application to management}, ' ...
'journal= {Fusgerues Research}, ' ...
'volume = {183}, ' ...
'doi    = {10.1016/j.fishres.2016.05.003}, '...
'pages  = {506-517}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rich1993'; type = 'Article'; bib = [ ... 
'author = {Richardson, C. A. and Seed, R. and Al-Roumaihi, E. M. H. and McDonald, L.}, ' ... 
'year   = {1993}, ' ...
'title  = {Distribution, shell growth and predation of the {N}ew {Z}ealand oyster, \emph{Tiostrea luaria} {H}utton, in the {M}enai {S}trait, {N}orth {W}ales}, ' ...
'journal= {Journal of Shellfish Research}, ' ...
'volume = {12}, ' ...
'pages  = {207-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rodri1990'; type = 'article'; bib = [ ... 
'author = {Rodriguez, J. L. and Sedano, F. J. and Garcia-Martin, L. O. and Perez-Camacho, A. and Sanchez, J. L.}, ' ...
'year = {1990}, ' ...
'title  = {Energy metabolism of newly settled \emph{Ostrea edulis} spat during metamorphosis}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {106}, ' ...
'pages = {109--111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elbe2013'; type = 'Misc'; bib =[...
'author = {Elbers, B}, '...
'year = {2013}, ' ...
'note = {Own data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


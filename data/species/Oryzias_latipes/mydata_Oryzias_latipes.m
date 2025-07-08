function [data, auxData, metaData, txtData, weights] = mydata_Oryzias_latipes 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Adrianichthyidae';
metaData.species    = 'Oryzias_latipes'; 
metaData.species_en = 'Medaka'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'TPi', 'THp'};
metaData.ecoCode.habitat = {'0jFm', 'jiMm'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mda', 'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wwb'; 'Wdb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww_f'; 't-N_f'; 't-S'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel', 'Andre Gergs'};   
metaData.date_subm = [2017 09 22];              
metaData.email    = {'rakel@gaiac-eco.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};  
 
metaData.author_mod_2   = {'Kim Rakel', 'Andre Gergs', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2018 02 19];              
metaData.email_mod_2    = {'rakel@gaiac-eco.de'};            
metaData.address_mod_2  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};   


metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 04 13]; 


%% set data

% zero-variate data
data.ab = 11;      units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'Fabe2013';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'artemia salina ad libitum; start of feeding 24 hours post hatch, hatching occurs 10 days after fertilization'; 
data.tj = 28;      units.tj = 'd';    label.tj = 'time since hatch at metamorphosis';    bibkey.tj = 'Fabe2013';   
  temp.tj = C2K(26);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
    comment.tj = 'temperature not reported; days post hatch'; 
data.ap = 60;     units.ap = 'd';    label.ap = 'time since hatch at puberty';    bibkey.ap = 'Fabe2013';
  temp.ap = C2K(26);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
    comment.ap = 'temperature not reported; days post hatch';
data.am = 5.5*365;     units.am = 'd';    label.am = 'life span';    bibkey.am = 'EgamEtoh1969';   
  temp.am = C2K(15.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.45;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Iwam2004';    
data.Lj  = 1.3;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis';    bibkey.Lj  = 'Iwam2004';  
    comment.Lj = '10.5 to 15.5 mm, average taken here (13mm)';
data.Lp  = 2.53;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'KangYoko2002'; 
    comment.Lp = '24 C, lab data, total length 60 days post hatch';
data.Li  = 4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Fabe2013';

data.Wd0 = (0.17 + 0.31)/2*1e-3; units.Wd0 = 'g'; label.Wd0 = 'egg dry weight'; bibkey.Wd0 = 'Stan1972';
  comment.Wd0 = 'The mean egg size is used here. The variability in eggs between clutches was high (0.17-0.31 mg DW) but not within a clutch. It seems older females spawn heavier eggs.';
data.Wwb = 0.65e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MartHint1995';
  comment.Wwb = '26 C, lab data'; 
data.Wdb = 0.13e-3;    units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'MartHint1995';
  comment.Wdb = '26 C, lab data, Stan1972 measure 0.150 mg dry'; 
data.Wwp = 0.178;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'KangYoko2002';
  comment.Wwp = '24 C, lab data, 60 days post hatch';
data.Wwi = 0.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'AnklJohn2004','GhonEgam1982'};
  comment.Wwi = 'females can reach 0.91 g; age: 5 years, outdoor, annual mean temperature in Tokyo = 15.6 C, GhonEgam1982';
 
data.Ri = 30; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnklJohn2004';   
temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '30 eggs per day up to 4 months = 3600 eggs per female in four  months is 3600/365 per day';

% uni-variate data
data.tL = [... % time since hatch (d), total length (cm)
7	0.65
14	0.7
21	1.0
28	1.2
];
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SpenHuss2006';

data.tW = [... % time since hatch (d), wet weight (g)
7	0.005
14	0.008
21	0.010
28	0.018
];
units.tW   = {'d', 'g'};  label.tW = {'time since hatch', 'wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SpenHuss2006';



data.tL2 = [... % time since start of experiment(d), total length (cm)
10	0.59
20	0.667
30	0.821
40	0.923
50	1.256
80	1.731
110	2.385
];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since start', 'total length'};  
temp.tL2    = C2K(24.5);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'experiment started 4-7 days post hatch medaka larvae; total length';
bibkey.tL2 = 'GonzCarb2016';

data.tW2 = [... % time since start of experiment(d), wet weight(g)
10	0
20	0.001048
30	0.00524
40	0.009432
50	0.01886
80	0.05031
110	0.1404
];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since start', 'wet weight'};  
temp.tW2    = C2K(24.5);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
comment.tW2 = 'experiment started 4-7 days post hatch medaka larvae';
bibkey.tW2 = 'GonzCarb2016';

% tW-data 
data.tW_f = [... % FEMALES time since hatch(d), wet weight (g)
28.441	0.05652
56.882	0.1424
84.07	0.1902
111.23	0.2304
140.35	0.2772
168.14	0.2924
195.93	0.4043
223.09	0.3815
251.58	0.3587
278.74	0.3565
];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since start', 'wet weight', 'female'};  
temp.tW_f    = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
comment.tW_f = 'females over 40 weeks, lab data, individuals are 25 days post hatch at start';
bibkey.tW_f = 'TehHint1998';

data.tW_m = [... % MALES time since hatch (d), wet weight (g)
28	0.0413
56	0.1685
84	0.1815
112	0.2304
139.65	0.2348
168.14	0.3022
194.67	0.3598
223.09	0.2935
250.95	0.35
279.37	0.3457
];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since start', 'wet weight', 'male'};  
temp.tW_m    = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
comment.tW_m = 'males over 40 weeks, lab data, individuals are 25 days post hatch at start';
bibkey.tW_m = 'TehHint1998';

% t-N data
data.tN1 = [ ... % time since start of experiment (d), cumulative eggs #
0       0 
1.00	6.98
2.01	13.14
3.01	19.08
4.02	23.73
4.99	31.36
6.00	38.79
7.01	48.24
8.01	57.56
8.98	65.67
9.99	75.95
11.00	85.58
12.00	93.90
13.01	103.02
14.02	112.81
14.99	123.47
15.99	132.14
17.00	142.11
];
units.tN1  = {'d', '#'};  label.tN1 = {'time since start', 'cumulative eggs', 'unfasted'};  
temp.tN1    = C2K(27);  units.temp.tN1 = 'K'; label.temp.tN1 = 'temperature';
bibkey.tN1 = 'HaseKand2016';
comment.tN1 = 'over 3 month old medaka, male and female, eggs were counted 1 hour after mating'; 
 
data.tN0 = [ ... % time since start of experiment (d), cumulative eggs #
0       0
1.00	7.63
2.01	14.10
3.01	21.39
4.02	25.82
5.03	30.12
6.04	31.08
7.01	31.08
7.97	32.32
8.98	32.94
9.99	32.94
11.00	32.94
11.97	32.94
13.01	32.94
13.98	32.94
14.99	32.94
15.99	32.94
16.96	32.94
];
units.tN0  = {'d', '#'};  label.tN0 = {'time since start', 'cumulative eggs', 'fasted'};  
temp.tN0    = C2K(27);  units.temp.tN0 = 'K'; label.temp.tN0 = 'temperature';
bibkey.tN0 = 'HaseKand2016';
comment.tN0 = 'over 3 month old medaka, male and FASTED female, eggs were counted 1 hour after mating';

data.tW1 = [... % time  (d), wet weight (g)
0	0.334
17	0.342
];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since start', 'wet weight', 'unfasted'};  
temp.tW1    = [C2K(27); C2K(27)];  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
treat.tW1 = {0}; units.treat.tW1 = ''; label.treat.tW1 = '';
bibkey.tW1 = 'HaseKand2016';

data.tW0 = [... % time (d), wet weight (g)
0	0.334
17	0.264
];
units.tW0   = {'d', 'g'};  label.tW0 = {'time since start', 'wet weight', 'fasted'};  
temp.tW0    = [C2K(27); C2K(27)];  units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
treat.tW0 = {0}; units.treat.tW0 = ''; label.treat.tW0 = '';
bibkey.tW0 = 'HaseKand2016';

% Survival data from Stan1972 at 25 C
data.tS  =[... % t in days and S in number of surviving individuals, -
0   216 
1	216
2	216
3	215
4	208
5	163
6	102
7	39
8	3
9	0
10	0
11	0
];
data.tS(:,2) = data.tS(:,2)./data.tS(1,2); % -, fraction surviving
units.tS = {'d', '#'}; label.tS = {'time since hatch', 'surviving larvae'};      
temp.tS  = C2K(25); units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = {'Stan1972'};
comment.tS = 'larval survival in days post hatching, no food given, 216 larvae as start population';
% 

%% set weights for all real data
weights = setweights(data, []);
weights.tW0 = 10 * weights.tW0; 
weights.tW1 = 10 * weights.tW1; 

 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 10 * weights.psd.kap;


%% group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'TehHint1998; over 40 weeks, lab data'};
set2 = {'tN1','tN0'}; subtitle2 = {'unfasted (red) and fasted'};
set3 = {'tW1','tW0'}; subtitle3 = {'unfasted (red) and fasted'};

metaData.grp.sets = {set1, set2, set3};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Contrary to the version 2017/09/22: Males and females have same parameters';
D2 = ['Starvation data is included in early lifes stages: modelled using eqn in AuguLitv2011.', ...
    'The difference is that, once a shrinking threshold del_X is surpassed,',...
    'the hazard from shrinking is taken proportional to the difference between the amount of structure left and the amount of structure before shrinking started.'];
D3 = ['Starvation data for adults is included: spawning is continuous.',...
    'Buffer is emptied at each spawning event.',...
    'Spawning ceases when energy mobilised from reserve no longer covers somatic maintenance and',...
    'Energy from repro buffer is first used to cover som main. (AuguGagn2012).',...
    'If no energy is left in the repro buffer then energy from structure.', ...
    'The initial struture and initial amount in the repro buffer are free parameters.'];
D4 = ['The interpretation of some data was revised with respect to version 2017/09/22.', ...
    'TehHint1998: age of fish at start of experiment (time 0) is 25 days post hatch. This information is now implemented in the predict file. ',...
    'GoncCarb2016: average age of fish at start of experiment (time 0) is 5.5 days post hatch. This information is now implemented in the predict file. ',...
    'Wwi: there was an error in 2017/09/22. the male and female Wwi were inversed. ', ...
    'In this version we used the Wwi for females from a more recent study and no longer include different parameters for males as there is not enough data.', ...
    'Shape coefficients: contrary to 2017/09/22 there is only one shape coefficient which applies for total length as all length data are total length.'...
    'There are no longer different shape coefficients for different life-stages.', ...
    'The egg dry weight is included.'];
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Links
metaData.links.id_CoL = '6SZHL'; % Cat of Life
metaData.links.id_ITIS = '165622'; % ITIS
metaData.links.id_EoL = '46567063'; % Ency of Life
metaData.links.id_Wiki = 'Oryzias_latipes'; % Wikipedia
metaData.links.id_ADW = 'Oryzias_latipes'; % ADW
metaData.links.id_Taxo = '44560'; % Taxonomicon
metaData.links.id_WoRMS = '281941'; % WoRMS
metaData.links.id_fishbase = 'Oryzias-latipes'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Japanese_rice_fish}}'];
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
bibkey = 'Fabe2013'; type = 'PhDthesis'; bib = [ ...  
'author = {Faber, D.}, ' ...
'year = {2013}, ' ...
'title  = {Der {J}apanische {R}eiskaerpfling \emph{Oryzias latipes} als {T}estorganismus im {F}ish-{S}exual-{D}evelopment- und {F}ish-{F}ull-{L}ife-{C}ycle-{T}est - {E}ffekte endokrin aktiver {S}ubstanzen unter variablen {E}xpositionsszenarien}, ' ...
'school = {Univ. of Aachen}, ' ...
'howpublished = {\url{http://publications.rwth-aachen.de/record/210378/files/4572.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GhonEgam1982'; type = 'Article'; bib = [...
'author = {Ghoneum, M. M. H. and Egami, N.},' ... 
'year = {1982}, ' ...
'title = {Age related changes in morphology of the thymus of the fish, \emph{Oryzias latipes}}, ' ...
'journal = {Experimental Gerontology}, ' ...
'volume = {17}, ' ...
'pages = {33--40}, '...
'doi = {10.1016/0531-5565(82)90006-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iwam2004'; type = 'Article'; bib = [...
'author = {Iwamatsu, T. and Egami, N.},' ... 
'year = {2004}, ' ...
'title = {Stages of normal development in the medaka \emph{Oryzias latipes}}, ' ...
'journal = {Mechanisms of Development}, ' ...
'volume = {121}, ' ...
'pages = {605-618}, '...
'doi = {10.1016/j.mod.2004.03.012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'MartHint1995'; type = 'Article'; bib = [...
'author = {Marty, G. D. and Hinton, D. E. and Cech, J. J. Jr.},' ... 
'year = {1995}, ' ...
'title = {Notes: Oxygen Consumption by Larval {J}apanese Medaka with Inflated or Uninflated Swim Bladders}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {124}, ' ...
'issue = {4}, ' ...
'pages = {623--627}, '...
'doi = {10.1577/1548-8659(1995)124<0623:NOCBLJ>2.3.CO;2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KangYoko2002'; type = 'Article'; bib = [...
'author = {Kang, I. J. and Yokota, H. and Oshima, Y. and Tsuruda, Y. and Oe, T. and Imada, N. and Tadokoro, H. and Honjo, T.},' ... 
'year = {2002}, ' ...
'title = {Effects of Bisphenol A on the reproduction of {J}apanese medaka (\emph{Oryzias latipes})}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {21}, ' ...
'issue = {11}, ' ...
'pages = {2394--2400}, '...
'doi = {10.1002/etc.5620211119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpenHuss2006'; type = 'Article'; bib = [...
'author = {Spencer, H. B. and Hussein, W. R. and Tchounwou, P. B.},' ... 
'year = {2006}, ' ...
'title = {Growth inhibition in {J}apanese medaka(\emph{Oryzias latipes}) fish exposed to tetrachloroethylene}, ' ...
'journal = {Journal of Environmental Biology}, ' ...
'volume = {27}, ' ...
'issue = {1}, ' ...
'pages = {1--5}, '...
'howpublished = {\url{http://jeb.co.in/journal_issues/200601_jan06/paper_01.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzCarb2016'; type = 'Article'; bib = [...
'author = {Gonzales-Doncel, M. and Carbonell, G. and Garcia-Maurino, J. E. and Sastre, S. and Beltran, E. M. and Torija, C. F.},' ... 
'year = {2016}, ' ...
'title = {Effects of dietary 2,2'', 4,4''-tetrabromodiphenyl ether (BDE-47) exposure in growing medaka fish(\emph{Oryzias latipes})}, ' ...
'journal = {Aquatic Toxicology}, ' ...
'volume = {178}, ' ...
'pages = {141--152}, '...
'DOI = {10.1016/j.aquatox.2016.07.017}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TehHint1998'; type = 'Article'; bib = [...
'author = {Teh, S. J. and Hinton, D. E.},' ... 
'year = {1998}, ' ...
'title = {Gender-specific growth and hepatic neoplasia in medaka (\emph{Oryzias latipes})}, ' ...
'journal = {Aquatic Toxicology}, ' ...
'volume = {41}, ' ...
'pages = {141--159}, '...
'DOI = {10.1016/S0166-445X(97)00065-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnklJohn2004'; type = 'Article'; bib = [...
'author = {Ankley, G. T. and Johnson, R. D.},' ... 
'year = {2004}, ' ...
'title = {Small Fish Models for Identifying and Assessing the Effects of Endocrine-disrupting Chemicals}, ' ...
'journal = {ILAR Journal}, ' ...
'volume = {45}, ' ...
'number = {4}, ' ...
'pages = {469--483}, '...
'DOI = {10.1093/ilar.45.4.469}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EgamEtoh1969'; type = 'Article'; bib = [...
'author = {Egami, N. and Etoh, H.},' ... 
'year = {1969}, ' ...
'title = {Life span data for the small fish, (\emph{Oryzias latipes})}, ' ...
'journal = {Exp. Geront.}, ' ...
'volume = {4}, ' ...
'pages = {127--129}, '...
'DOI = {10.1016/0531-5565(69)90035-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stan1972'; type = 'phdthesis'; bib = [...
'author = {Stanley, R. D.}, ' ... 
'year = {1972}, ' ...
'title = {The effect of egg size on size and viability of newly hatched medaka (\emph{Oryzias latipes}) and surf smelt (\emph{Hypomesus pretiosus pretiosus})}, ' ...
'school = {Univ. of British Columbia}, ' ...
'howpublished = {\url{https://open.library.ubc.ca/cIRcle/collections/ubctheses/831/items/1.0094071}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaseKand2016'; type = 'Article'; bib = [...
'author = {Hasebe, M. and Kanda, S. and Oka, Y.},' ... 
'year = {2016}, ' ...
'title = {Female-Specific Glucose Sensitivity of GnRH1 Neurons Leads to Sexually Dimorphic Inhibition of Reproduction in Medaka}, ' ...
'journal = {Endocrinology}, ' ...
'volume = {157}, ' ...
'number = {11}, ' ...
'pages = {4318 - 4329}, '...
'doi = {10.1210/en.2016-1352}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AuguGagn2012'; type = 'Article'; bib = [...
'author = {Augustine, S. and Gagnaire, B. and Adam-Guillermin, C. and Kooijman, S. A. L. M.},' ... 
'year = {2012}, ' ...
'title = {Effects of uranium on the metabolism of zebrafish, {Danio} rerio.}, ' ...
'journal = {Aquatic  Toxicology}, ' ...
'volume = {118-119}, ' ...
'pages = {9--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AuguLitv2011'; type = 'Article'; bib = [...
'author = {Augustine, S. and Litvak, M. K. and Kooijman, S. A. L. M.},' ... 
'year = {2011}, ' ...
'title = {Stochastic feeding in fish larvae and their metabolic handling of starvation}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {66}, ' ...
'pages = {411--418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%



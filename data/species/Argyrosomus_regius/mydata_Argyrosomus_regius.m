function [data, auxData, metaData, txtData, weights] = mydata_Argyrosomus_regius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Argyrosomus_regius'; 
metaData.species_en = 'Meagre'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_fT'; 't-Le'; 't-Ww_fT'; 'L-Ww'; 'Ww-R'; 'Ww-JO_T'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2013 05 31];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Orestis Stavrakidis Zachou'};    
metaData.date_mod_2     = [2017 6 17];              
metaData.email_mod_2    = {'ostavrak@gmail.com'};            
metaData.address_mod_2  = {'HCMR'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2017 11 12];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 12];


%% set data
% zero-variate data

data.ah = 1;     units.ah = 'd';    label.ah = 'age at hatch';             bibkey.ah = 'LikaKooy2014';   
  temp.ah = C2K(22); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 35;    units.aj = 'd';    label.aj = 'age at metam';             bibkey.aj = 'LikaKooy2014';
  temp.aj = C2K(22);   units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'fins are formed and the animal looks like a minitiature version of the adult';
data.ap = 4*365; units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'fishbase';
  temp.ap = C2K(18);   units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.L0 = 0.1056; units.L0  = 'cm';  label.L0  = 'egg diameter';         bibkey.L0  = 'KlimoPagou2013';  
data.Lh  = 0.295; units.Lh  = 'cm'; label.Lh  = 'total length at hatch';   bibkey.Lh  = 'LikaKooy2014'; %  average of 0.329 and 0.262 (LikaKooy2014 and KlimoPagou2013)
data.Lb  = 0.362; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'LikaKooy2014';  
data.Lj  = 3.2;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'PapaKent2013';
data.Lp  = 80;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 230;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Ww0 = 0.718e-3;   units.Ww0 = 'g';   label.Ww0 = 'wet weight of egg';     bibkey.Ww0 = 'KlimoPagou2013';
data.Wwb = 0.37e-3; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LikaKooy2014';
data.Wwp = 5e3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
data.Wwi = 103e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'Papa2013';   
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f22 =	[1	2	2.001	2.002	3	3.001	4	4.001	4.002...
        5	5.001	6	8	8.001	8.002	10	10.001	10.002	...
        12	12.001	12.002	14	14.001	14.002	16	16.001	17	...
        18	18.001	19	20	20.001	22	22.001	22.002	...
        25	25.001	25.002	27	27.001	27.002	29	30	30.001; % d, time since hatch
         3.34	3.23	3.17	3.26	3.02	3.43	3.87	...
         3.26	3.11	3.37	3.41	4.64	5.17	4.15	...
         4.21	5.93	4.75	4.77	6.11	5.03	5.19	...
         7.99	5.88	6.08	7.57	7.54	10.8	7.27	...
         8.37	11.3	8.52	9.9	14.07	10.11	11.8	12.3...
         15.07	16.96	18.33	14.51	17.5	18.94	18.76	...
         22.48]';% mm, total length at f and T
data.tL_f22(:,2) = data.tL_f22(:,2)/10; % convert mm to cm
units.tL_f22   = {'d', 'cm'};  label.tL_f22 = {'time since hatch', 'total length'};  
temp.tL_f22    = C2K(22);  units.temp.tL_f22 = 'K'; label.temp.tL_f22 = 'temperature';
bibkey.tL_f22 = 'LikaKooy2014';
%
% time after hatch (d), total length (mm), (Papadakis et al., 2013)
% after 18 dph, post flexion, fed commercial feeds, can find feed
% composition from Roo et al. (2015).
data.tL_f21 =	[0 1 2 3 4 5 6 7 8 9 11 13 14 15 17;% 19 20 23 26 28 30 33 36 40 44; % d, time since hatch
         2.68 3 3.04 3.22 3.59 3.77 4.49 4.85 5.3 5.75 6.29 7.55 7.74 8.1 9.71]'; % 14 17.4 19.38 22.43 26 28.34 32.45 36.93 43.73 45.89]';% mm, total length at f and T
data.tL_f21(:,2) = data.tL_f21(:,2)/10; % convert mm to cm
units.tL_f21   = {'d', 'cm'};  label.tL_f21 = {'time since hatch', 'total length'};  
temp.tL_f21    = C2K(21);  units.temp.tL_f21 = 'K'; label.temp.tL_f21 = 'temperature';
bibkey.tL_f21 = 'PapaKent2013';
comment.tL_f21 = 'Temperature between 19-24 C, mean used';

% time-weight
% Data from cages, HCMR 
% KR2015, production data from 4 cages, year 2015
% time since hatch, d; wet weight g; temperature C
KR15 = [63 66 191 219 280 366 392 430 471 500 520 558 583; % dph
    2.1 2.11 182 241 334.4 389.9 494.53 698.93 885.94 989.99 1000.9 1129.59 1170.08; % Ww KR15_1
    2.1 2.11 182 241 334.4 389.9 519.41 683.9 868.68 915.93 1041.1 1047.17 1086.54; % Ww KR15_2
    2.1 2.11 182 241 334.4 389.9 491.81 713.57 841.61 967.62 981.1 1104.32 1128.64; % Ww KR15_3
    2.1 2.11 182 241 334.4 389.9 491.85 675.67 838.32 932.61 1003.65 1095.6 1167.51; % Ww KR15_4
    26.7 26.7 21.3 19.2 16 19.2 23.5 27.7 27.9 26.4 24.5 21.6 19]'; % T
data.tWw_15_1 = KR15(:, [1 2]);  
units.tWw_15_1   = {'d', 'g'};  label.tWw_15_1 = {'time since hatch', 'wet weight'};  
temp.tWw_15_1 = C2K(KR15(:,6)); units.temp.tWw_15_1   = {'K'}; label.temp.tWw_15_1 = {'temperature'}; 
treat.tWw_15_1 = {0}; units.treat.tWw_15_1 = ''; label.treat.tWw_15_1 = '';
bibkey.tWw_15_1  = 'HCMR';
comment.tWw_15_1 = 'Cages, HCMR 2015';
%
data.tWw_15_2 = KR15(:, [1 3]);  
units.tWw_15_2   = {'d', 'g'};  label.tWw_15_2 = {'time since hatch', 'wet weight'};  
temp.tWw_15_2 = temp.tWw_15_1; units.temp.tWw_15_2   = {'K'}; label.temp.tWw_15_2 = {'temperature'};  
treat.tWw_15_2 = {0}; units.treat.tWw_15_2 = ''; label.treat.tWw_15_2 = '';
bibkey.tWw_15_2  = 'HCMR';
%
data.tWw_15_3 = KR15(:, [1 4]);  
units.tWw_15_3   = {'d', 'g'};  label.tWw_15_3 = {'time since hatch', 'wet weight'};  
temp.tWw_15_3 = temp.tWw_15_1; units.temp.tWw_15_3   = {'K'}; label.temp.tWw_15_3 = {'temperature'};  
treat.tWw_15_3 = {0}; units.treat.tWw_15_3 = ''; label.treat.tWw_15_3 = '';
bibkey.tWw_15_3  = 'HCMR';
%
data.tWw_15_4 = KR15(:, [1 5]);  
units.tWw_15_4   = {'d', 'g'};  label.tWw_15_4 = {'time since hatch', 'wet weight'};  
temp.tWw_15_4 = temp.tWw_15_1; units.temp.tWw_15_4   = {'K'}; label.temp.tWw_15_4 = {'temperature'};  
treat.tWw_15_4 = {0}; units.treat.tWw_15_4 = ''; label.treat.tWw_15_4 = '';
bibkey.tWw_15_4  = 'HCMR';
% 
% Data from cages, HCMR 
% KR2013, production data from 2 cages, year 2013
% time since hatch, d; wet weight g; temperature C
KR13 = [726 754 789 824 845 883 915 937 974;  % dph
    844.32 994.3 1121.66 1289.85 1319.69 1352.12 1512.32 1667.02 1879.86; % Ww KR13_1
    862.9 997.71 1190.12 1312.66 1343.68 1382.17 1455.25 1692.98 1797.63; % Ww KR13_2
    20.8 22.7 26.7 28.5 27.4 24.5 21.4 19.8 17.3]'; % T
data.tWw_13_1 = KR13(:, [1 2]);  
units.tWw_13_1   = {'d', 'g'};  label.tWw_13_1 = {'time since hatch', 'wet weight'};  
temp.tWw_13_1 = C2K(KR13(:,4)); units.temp.tWw_13_1   = 'K'; label.temp.tWw_13_1 = 'temperature';  
treat.tWw_13_1 = {0}; units.treat.tWw_13_1 = ''; label.treat.tWw_13_1 = '';
bibkey.tWw_13_1 = 'HCMR';
comment.tWw_13_1 = 'Cages, HCMR 2013';
%
data.tWw_13_2 = KR13(:, [1 3]);  
units.tWw_13_2   = {'d', 'g'};  label.tWw_13_2 = {'time since hatch', 'wet weight'};  
temp.tWw_13_2 = temp.tWw_13_1; units.temp.tWw_13_2   = 'K'; label.temp.tWw_13_2 = 'temperature';  
treat.tWw_13_2 = {0}; units.treat.tWw_13_2 = ''; label.treat.tWw_13_2 = '';
bibkey.tWw_13_2  = 'HCMR';
%
% Data from ponds, (Vargas et al., 2014)
% time since hatch, d; wet weight g; total length cm; temperature C 
VG = [90 180 240 300 360 420 480 540 600 660; % dph (calculated from months, 12 g initial size, 18 month experiment) 
    12 97.3 111.3 163.4 203.5 555 716.3 937.2 937.9 1238.5 ; % wW
    NaN 19.9 21.6 24.1 26.6 37.4 39.8 44.2 44.8 48.8; % tL
    19 12.2 11.4 16.7 19.7 24.8 23 15.7 15.8 21.4]'; % T
data.tWw_VGT = VG(:, [1 2]);  
units.tWw_VGT   = {'d', 'g'};  label.tWw_VGT = {'time since hatch', 'wet weight'};  
temp.tWw_VGT = C2K(VG(:,4)); units.temp.tWw_VGT   = {'K'}; label.temp.tWw_VGT = {'temperature'};  
treat.tWw_VGT = {0}; units.treat.tWw_VGT = ''; label.treat.tWw_VGT = '';
bibkey.tWw_VGT  = 'VargasRuiz2014';
%
data.LWw_VGT = VG(2:end, [3 2]); % exclude NaN
units.LWw_VGT  = {'cm', 'g'};  label.LWw_VGT = {'length', 'wet weight'};  
bibkey.LWw_VGT = 'VargasRuiz2014';


% time-length 
% (Klimogianni et al., 2013)
data.tLe =	[0.1 12 24 36 48 60; % hph
         2.62 3.15 3.38 3.43 3.47 3.49]';% mm, total length at f and T
data.tLe(:,1) = data.tLe(:,1)/24; % convert h to d
data.tLe(:,2) = data.tLe(:,2)/10; % convert mm to cm
units.tLe  = {'d', 'cm'};  label.tLe= {'time since hatch', 'total length'};  
temp.tLe   = C2K(19);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe= 'KlimoPagou2013';

% weight-reproduction rate
data.WwR = [5 5.5 6.9 8.1 8.3 9.2 11.4; 
    1397885 960768 1901654 4057031 2992399 3272817 5985752]'; 
data.WwR(:,1)= data.WwR(:,1)*1000; data.WwR(:,2)=data.WwR(:,2)/365; % convert to g and #/d
units.WwR  = {'g', '#/d'};  label.WwR = {'wet weight','reproduction rate'};  
temp.WwR   = C2K(19.5);  units.temp.WwR = 'K'; label.temp.WwR = 'temperature';
bibkey.WwR  = 'MyloMitri2013';
comment.WwR = 'temp varied between 18.6 and 20.5 C';

% temperature-respiration
% fish wet weight: 3.3 g
WwJO_T = [18 22 26 30; % C
    370 410 618 642; % mg O2/h/kg
    3.31 3.32 3.33 3.34]'; % g
WwJO_T(:,2) = 24 * 1e-6 * WwJO_T(:,2).* WwJO_T(:,3); %convert to g O2/d/kg
data.WwJO_T= WwJO_T(:,[1 2]);
units.WwJO_T = {'C', 'g/d.kg'};  label.WwJO_T = {'temperature', 'O2 consumption'}; 
weight.WwJO_T =  WwJO_T(:,3); units.weight.WwJO_T = {'g'}; label.weight.WwJO_T = {'wet weight'};
treat.WwJO_T = {0}; units.treat.WwJO_T = ''; label.treat.WwJO_T = '';
bibkey.WwJO_T = 'KirSunar2017'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f22','tL_f21'}; subtitle1 = {'mesocosm'};
set2 = {'tWw_15_1', 'tWw_15_2', 'tWw_15_3', 'tWw_15_4'}; subtitle2 = {'HCMR cages 1,2,3 and 4 at varying temperatures (year 2015)'};
set3 = {'tWw_13_1', 'tWw_13_2'}; subtitle3 = {'HCMR cages 1 and 2 at varying temperatures (year 2013)'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'GKJG'; % Cat of Life
metaData.links.id_ITIS = '169366'; % ITIS
metaData.links.id_EoL = '46578919'; % Ency of Life
metaData.links.id_Wiki = 'Argyrosomus_regius'; % Wikipedia
metaData.links.id_ADW = 'Argyrosomus_regius'; % ADW
metaData.links.id_Taxo = '161639'; % Taxonomicon
metaData.links.id_WoRMS = '127007'; % WoRMS
metaData.links.id_fishbase = 'Argyrosomus-regius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argyrosomus_regius}}';
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
bibkey = 'LikaKooy2014'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Kooijman, S. A. L. M. and Papandroulakis, N.}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in {M}editerranean {P}erciformes}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {37--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MyloMitri2013'; type = 'Article'; bib = [ ... 
'author = {Mylonas, C. and Mitrizakis, N. and Castaldo, C. and Pervino, C. and Papadaki, M. and Sigelaki, I. and Lika, K. and Kooijman, S. A. L. M. and Papandroulakis, N.}, ' ... 
'year = {2013}, ' ...
'title = {Reproduction of hatchery-produced meagre \emph{Argyrosomus regius} in captivity II. {H}ormonal induction of spawning and monitoring of spawning kinetics, egg production and egg quality}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {414--415}, ' ...
'pages = {318--327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PapaKent2013'; type = 'Article'; bib = [ ... 
'author = {Papadakis, I. and Kentouri, M. and Divanach, P. and Mylonas, C.}, ' ... 
'year = {2013}, ' ...
'title = {Ontogeny of the digestive system of meagre \emph{Argyrosomus regius} reared in a mesocosm, and quantitative changes of lipids in the liver from hatching to juvenile},' ...
'journal = {Aquaculture}, ' ...
'volume = {388--391}, ' ...
'pages = {76--88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VargasRuiz2014'; type = 'Article'; bib = [ ... 
'author = {Vargas-Chacoff, L. and Ruiz-Jarabo, I. and Pascoa, I. and Goncalves, O. and Mancera, J. M.}, ' ... 
'year = {2014}, ' ...
'title = {Yearly growth and metabolic changes in earthen pond-cultured meagre \emph{Argyrosomus regius}},' ...
'journal = {Scientia Marina}, ' ...
'volume = {78}, ' ...
'pages = {193--202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlimoPagou2013'; type = 'Article'; bib = [ ... 
'author = {Klimogianni, A. and Pagoulatou, M. and Trageli, M. and Hotos, G.}, ' ... 
'year = {2013}, ' ...
'title = {Investigation on early development, the feeding ability and larval survival under starvation in common meagre, \emph{Argyrosomus regius} ({A}sso 1891)}, ' ...
'journal = {Journal of Aquatic Science}, ' ...
'volume = {1}, ' ...
'pages = {1--6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KirSunar2017'; type = 'Article'; bib = [ ... 
'author = {Kir, M. and Sunar, M. and Altindag, B.}, ' ... 
'year = {2017}, ' ...
'title = {Thermal tolerance and preferred temperature range of juvenile meagre acclimated to four temperatures}, ' ...
'journal = {Journal of Thermal Biology}, ' ...
'volume = {65}, ' ...
'pages = {125--129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HCMR'; type = 'Misc'; bib =  [ ...
'note = {unpublished data from the cage farm of the Institute at Souda bay (west {C}rete)}, ' ...
'institution = {Hellenic Center for Marine Research (HCMR), Institute of Marine Biology, Biotechnology and Aquaculture (IMBBC)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Papa2013'; type = 'Misc'; bib = ...
'note = {Papandroulakis pers comm.}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


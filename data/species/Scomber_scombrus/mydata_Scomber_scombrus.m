function [data, auxData, metaData, txtData, weights] = mydata_Scomber_scombrus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomber_scombrus'; 
metaData.species_en = 'Mackerel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 't-Ww'; 'Ww-N'; 'L-Ww'; 'L-Wd'; 'T-ah'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Tessa van der Hammen'; 'Bas Kooijman'};    
metaData.date_subm = [2012 01 18];              
metaData.email    = {'tessa.vanderhammen@wur.nl'};            
metaData.address  = {'IMARES, IJmuiden'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15];

%% set data
% zero-variate data

data.ah = 239.6/24; units.ah = 'd';   label.ah = 'age at hatch';              bibkey.ah = 'MendAlva2006';   
  temp.ah = C2K(11.1);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.tb = 4;        units.tb = 'd';   label.tb = 'time since hatch at birth'; bibkey.tb = 'MendAlva2006';   
  temp.tb = C2K(11.1);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.ap = 2*365;    units.ap = 'd';   label.ap = 'age at puberty';            bibkey.ap = 'MendAlva2006';
  temp.ap = C2K(12);units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '2 years, maturity oogive WGWIDE, 58% is mature at age 2';
data.am = 20*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.37;   units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'MendAlva2006';  
data.Lb  = 0.471;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'MendAlva2006'; 
  comment.Lb = 'different values at diffent temperatures (MendAlva2007)';
data.Lp  = 28.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 63;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Lock1988';

data.Wwb = 55e-6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MendAlva2006';
data.Wwp = 175;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'MendAlva2006';
data.Wwi = 2800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'anglingtrust';

data.Ri  = 3.996e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Damm2007';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Mackerel fecundity 2007 v1_1). linear regression used till animal of 2.8kg. Could be lower (Jansen).';
 
% uni-variate data

% temperature-age at hatch
data.Tah = [... % temp (C) vs 50% hatch (hours)
8.6	    239.6
11.1	159.8
13.2	121.5
15.1	98.3
17.8	75.8];
data.Tah(:,2) = data.Tah(:,2)/24;   % convert hours to days
units.Tah   = {'C', 'd'};  label.Tah = {'temperature', 'age at hatch'};  
bibkey.Tah = 'MendAlva2006';

% time-length
data.tL = [365 * [1:20]; % d, age in days*years
0.268, 0.299, 0.326, 0.344, 0.357, 0.369, 0.379, 0.387, 0.396, 0.401, 0.412, 0.416, 0.421, 0.428, 0.433, 0.434, 0.437, 0.445, 0.44, 0.453]'; %m, physical length
data.tL(:,2) = 100 * data.tL(:,2);   % convert m to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', '12 C'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'frisbe';
% Age Length Data larvae from MendAlva2007: T = 273+18.4, f=1
data.tL_18 = [... % time since birth (d) vs length (mm) 
0.32	3.68
5.57	4.65
10.64	5.76
15.49	7.86
20.42	10.1
25.63	13.31];
data.tL_18(:,2) = data.tL_18(:,2)/ 10;   % convert mm to cm
units.tL_18   = {'d', 'cm'};  label.tL_18 = {'time since birth', 'total length', '18.4 C'};  
temp.tL_18    = C2K(18.4);  units.temp.tL_18 = 'K'; label.temp.tL_18 = 'temperature';
bibkey.tL_18 = 'MendAlva2006';
% Age Length Data larvae from MendAlva2007: T = 273+15, f=1
data.tL_15 = [... % time since birth (d) vs length (mm) 
0.41	3.74
5.35	4.62
10.6	5.43
15.35	6.53
20.79	8.44
25.77	9.37
30.65	10.39
35.45	11.23
40.57	11.23];
data.tL_15(:,2) = data.tL_15(:,2)/ 10;   % convert mm to cm
units.tL_15   = {'d', 'cm'};  label.tL_15 = {'time since birth', 'total length', '15 C'};  
temp.tL_15    = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'MendAlva2006';
% Age Length Data larvae from MendAlva2007: T = 273+13.2, f=1
data.tL_13 = [... % time since birth (d) vs length (mm) 
0.41	3.6
5.53	4.55
10.64	4.81
15.58	5.15
20.65	6.28
25.68	6.91
30.56	7.02
33.62	8.25
35.5	8.65];
data.tL_13(:,2) = data.tL_13(:,2)/ 10;   % convert mm to cm
units.tL_13   = {'d', 'cm'};  label.tL_13 = {'time since birth', 'total length', '13.2 C'};  
temp.tL_13    = C2K(13.2);  units.temp.tL_13 = 'K'; label.temp.tL_13 = 'temperature';
bibkey.tL_13 = 'MendAlva2006';
% Age Length Data larvae from MendAlva2007: T = 273+10.6, f=1
data.tL_10 = [... % time since birth (d) vs length (mm) 
0.37	3.66
5.53	4.55
10.74	4.7
15.53	4.75
20.47	4.79];
data.tL_10(:,2) = data.tL_10(:,2)/ 10;   % convert mm to cm
units.tL_10   = {'d', 'cm'};  label.tL_10 = {'time since birth', 'total length', '10 C'};  
temp.tL_10    = C2K(10.6);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'MendAlva2006';

% time-weight
% AGE (years) WEIGHT (gram) from Frisbe (otholiths)
data.tW = [ ... % age (years) vs wet weight (gram)     
2	199
3	253
4	305
5	353
6	395
7	430
8	460
9	488
10	503
11	564
12	585
13	580
14	597
15	640];
data.tW(:,1) = 365 * data.tW(:,1);   % convert years to days
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'frisbe';

% length-weight larvae 
data.LW_lrv = [ ... % length (mm) vs dry weight (mgram) (MendAlva2007)    
3.30	0.039
3.40	0.027
3.50	0.047
3.60	0.041
3.70	0.044
3.80	0.022
3.90	0.036
4.00	0.056
4.10	0.087
4.30	0.046
4.40	0.087
4.50	0.036
4.60	0.079
4.70	0.080
4.80	0.069
4.90	0.116
5.00	0.039
5.10	0.130
5.40	0.100
5.50	0.125
5.60	0.182
5.70	0.314
5.80	0.087
6.00	0.304
6.10	0.234
6.20	0.079
6.30	0.141
6.40	0.231
6.50	0.161
6.60	0.108
6.70	0.188
6.90	0.133
7.10	0.277
7.20	0.159
7.30	0.229
7.40	0.271
7.50	0.089
7.80	0.257
7.90	0.476
8.00	0.417
8.10	0.217
8.40	0.595
8.50	0.361
8.70	0.502
8.90	0.611
9.20	0.868
9.30	0.685
9.50	0.638
9.70	0.722
10.0	0.909
10.2	1.007
10.5	1.501
10.7	1.191
10.9	0.829
11.1	1.316
11.3	1.981
11.5	1.460
11.8	1.005
12.1	1.778
12.2	2.329
12.6	2.760
12.8	2.093
13.0	2.107
13.3	2.781
13.6	2.781
14.6	3.451];
data.LW_lrv(:,1) = data.LW_lrv(:,1)/ 10;   % convert mm to cm
units.LW_lrv = {'cm', 'mg'}; label.LW_lrv = {'total length', 'dry weight'};  
bibkey.LW_lrv = 'MendAlva2007';
% Length weight Data from Frisbe: 
data.LW = [ ... % length (m) vs wet weight (gram) 
0.16	25.5
0.17	32.2
0.18	34.6
0.19	42.7
0.2	    51.6
0.21	62.7
0.22	72.8
0.23	88.1
0.24	96.9
0.25	110.6
0.26	125.7
0.27	141.1
0.28	162.5
0.29	183
0.3	    204.7
0.31	225.8
0.32	247.6
0.33	272.5
0.34	299.6
0.35	330.3
0.36	365.5
0.37	401.4
0.38	438.2
0.39	477.7
0.4	    522.1
0.41	566.5
0.42	610.3
0.43	657.1
0.44	710.6
0.45	763.8
0.46	831.4
0.47	875.2
0.48	916.9
0.49	1037.4
0.52	1244];
data.LW(:,1) = 100 * data.LW(:,1);   % convert m to cm
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'frisbe';

% weight-fecundity
data.WN = [ ... % wet weight (gram) yearly potential fecundity (nr oocytes)
130	128811
140	45186.5
150	127404
160	45147
170	132116.6
180	133734.1
190	141404.8
200	185461.4
210	152104.1
220	207356.4
230	207567
240	219360.8
250	209331.2
260	229271.9
270	278241.6
280	235551.1
290	250967.7
300	270054.3
310	323319.4
320	273779.3
330	283807.8
340	354814
350	300779.2
360	421191.1
370	437818.3
380	416954.4
390	447597.4
400	402474.2
410	497400.6
420	489396.6
430	398693.7
440	516415.5
450	479284.8
460	704407.5
470	467420.5
480	756177
490	510202.5
500	660469
510	718411.5
520	745225.5
530	611944.2
560	414013.5
570	776654
590	633215
600	646585
610	852867
650	616223
680	1011192
720	1139327];
units.WN   = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN    = C2K(12);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'frisbe';

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
set1 = {'tL_18','tL_15','tL_13','tL_10'}; subtitle1 = {'MendAlva2006 data at 18, 15, 13, 10 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '79XKF'; % Cat of Life
metaData.links.id_ITIS = '172414'; % ITIS
metaData.links.id_EoL = '46577307'; % Ency of Life
metaData.links.id_Wiki = 'Scomber_scombrus'; % Wikipedia
metaData.links.id_ADW = 'Scomber_scombrus'; % ADW
metaData.links.id_Taxo = '46695'; % Taxonomicon
metaData.links.id_WoRMS = '127023'; % WoRMS
metaData.links.id_fishbase = 'Scomber-scombrus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomber_scombrus}}';
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
bibkey = 'ICES2011'; type = 'Techreport'; bib = [ ... 
'author = {ICES}, ' ... 
'year = {2011}, ' ...
'title = {Report of the Working Group on Widely Distributed Stocks (WGWIDE)}, ' ...
'institution = {ICES CM 2011/ACOM}, ' ...
'howpublished = {\url{http://www.ices.dk/workinggroups/ViewWorkingGroup.aspx?ID=273}}, ' ...
'volume = {15}, ' ...
'pages = {642}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pepi1991'; type = 'Article'; bib = [ ... 
'author = {Pepin, P.}, ' ... 
'year = {1991}, ' ...
'title = {Effect of Temperature and size on development, mortality and survival rates of the pelagic early life history stages of marine fish}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {48}, ' ...
'number = {3}, '...
'pages = {503-518}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PeteAusu1984'; type = 'Article'; bib = [ ... 
'author = {Peterson, W. T. and Ausubel, S. J.}, ' ... 
'year = {1984}, ' ...
'title = {Diets and selective feeding by larvae of Atlantic mackerel Scomber scombrus on zooplankton}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {17}, ' ...
'pages = {65-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'frisbe'; type = 'Misc'; bib =  ... 
'note = {IMARES Frisbe database: database with survey data.}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Damm2007'; type = 'Misc'; bib = [ ... 
'author = {Damme, van}, ' ... 
'year = {2007}, ' ...
'note = {excelsheet: Mackerel fecundity 2007 v1\_1. Survey data on fecundity}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MendAlva2006'; type = 'Article'; bib = [ ... 
'author = {Mendiola, D. and Alvarez, P. and Cotano, U. and  Etxebeste, E. and De Murguia, A. M.}, ' ... 
'year = {2006}, ' ...
'title = {Effects of temperature on development and mortality of Atlantic mackerel fish eggs}, ' ...
'journal = {Fish Res}, ' ...
'volume = {80}, ' ...
'pages = {158-168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WareLamb1985'; type = 'Article'; bib = [ ... 
'author = {Ware, D. M. and Lambert, T. C.}, ' ... 
'year = {1985}, ' ...
'title = {Early life history of {A}tlantic mackerel (\emph{Scomber scombrus}) in the southern {G}ulf of {S}t. {L}awrence}, ' ...
'journal = {Can J Fish Aquat Sci.}, ' ...
'volume = {42}, ' ...
'number = {3}, '...
'pages = {577--592}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ConwCoom1999'; type = 'Article'; bib = [ ... 
'author = {Conway, D. V. P. and Coombs, S. H. and Lindley, J. A. and LLewellyn, C. A.}, ' ... 
'year = {1999}, ' ...
'title = {Diet of mackerel (\emph{Scomber scombrus}) larvae at the shelf-edge to the south-west of the {B}ritish {I}sles and the incidence of piscivory and coprophagy}, ' ...
'journal = {Vie Milieu.}, ' ...
'volume = {4}, ' ...
'pages = {213--220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lock1988'; type = 'Book'; bib = [ ... 
'author = {Lockwood, S. J.}, ' ... 
'year = {1988}, ' ...
'title = {The Mackerel - Its biology, assessment and the management of a fishery.}, ' ...
'publisher = {Fishing News Books Ltd}, ' ...
'pages = {181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MendAlva2007'; type = 'Article'; bib = [ ... 
'author = {Mendiola, D. and Alvarez, P. and Cotano, U. and De Murguia, A. M.}, ' ... 
'year = {2007}, ' ...
'title = {Early development and growth of the laboratory reared north-east {A}tlantic mackerel}, ' ...
'journal = {Journal of Fish biology}, ' ...
'volume = {70}, ' ...
'pages = {911-933}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'anglingtrust'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.anglingtrust.net/page.asp?section=41}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scomber-scombrus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
